class FeesController < ApplicationController
  def new
    @fee = current_user.fees.new
  end

  def create
    @fee = current_user.fees.new(params_fees)
    if @fee.save
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @fee = Fee.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "#{@fee.date.strftime('%d%m%y')}.pdf",
        template: '/fees/show.pdf.erb',
        save_to_file: Rails.root.join('fees', "#{@fee.date.strftime('%d%m%y')}.pdf"),
        layouts: '/layouts/pdf.html.erb',
        encoding: "utf8",
        locals:       { fee: @fee }
      end
    end
  end

  private

  def params_fees
    params.require(:fees).permit(:date, :departure, :arrival, :kilometer, :cost, :car_id, :type_of_trajet, :attachment)
  end
end
