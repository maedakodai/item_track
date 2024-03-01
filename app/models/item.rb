class Item < ApplicationRecord
  belongs_to :user
  enum status: { using: 0, recommended: 1, completed: 2 }

  def to_recommended
    if end_at.present? && end_at < Date.current && self.using?
      self.update(status: :recommended)
    end
  end

  def to_using
    if  end_at.present? && end_at >= Date.current && self.recommended?
      self.update(status: :using) # 交換推奨から使用中に（条件に応じて）
    end
  end
end
