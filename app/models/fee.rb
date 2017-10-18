class Fee < ApplicationRecord

  before_save :cost_calculation

  belongs_to :user
  belongs_to :car

  validates :date, presence: true
  validates :departure, presence: true
  validates :arrival, presence: true
  validates_inclusion_of :type_of_trajet, in: [true, false]
  validates :kilometer, presence: true

  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf"] }
  validates_with AttachmentSizeValidator, attributes: :attachment, less_than: 1.megabytes

  def generate_pdf
    # create an instance of ActionView, so we can use the render method outside of a controller
    av = ActionView::Base.new
    av.view_paths = ActionController::Base.view_paths

    # need these in case your view constructs any links or references any helper methods.
    av.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper
    end

    pdf = av.render pdf:              'somefile.pdf',
                    template:         'fees/show.pdf.erb',
                    layout:           'layouts/pdf.html.erb',
                    dpi:              '1200',
                    orientation:      'Portrait',
                    no_background:    true,
                    print_media_type: true,
                    margin:       { top:       1,
                                    bottom:    1,
                                    left:      1,
                                    right:     1 },
                    locals:       { fee: self }
    # then save to a file
    pdf = WickedPdf.new.pdf_from_string(pdf)
    path = Rails.root.join('fees', "date")
    FileUtils.mkdir_p path
    save_path = Rails.root.join(path, "date.pdf")
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
  end

  private

  def cost_calculation
    if self.type_of_trajet
      self.cost = (self.kilometer * Car.find(car_id).scale.coefficient) * 2
    else
      self.cost = self.kilometer * Car.find(car_id).scale.coefficient
    end
  end



end
