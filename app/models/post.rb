class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: { minimum: 250}
  validates :summary, length: { maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :check_clickbait


  private

  def check_clickbait

      if (/Won't Believe|Secret|Top\d*|Guess/).match(title) == nil
          errors.add(:title, "no nasty stuff please")
      end
    
  end

end
