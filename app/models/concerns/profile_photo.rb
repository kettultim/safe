module ProfilePhoto
  extend ActiveSupport::Concern

  included do
    has_attached_file :photo,
    styles: { medium: "300x300>", thumb: "100x100>" },
    default_url: '/images/profile.default.jpg'

    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  end
end
