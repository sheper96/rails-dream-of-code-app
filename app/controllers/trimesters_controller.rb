class TrimestersController < ApplicationController

  def index
   @trimesters = Trimester.all
  end

  def show
    
  end

   def edit
    @trimester = Trimester.find(params[:id])
  end
  
   def update
   @trimester = Trimester.find(params[:id])

  respond_to do |format|
    if @trimester.update(application_deadline: params[:trimester][:application_deadline])
      format.html { redirect_to trimesters_path, notice: "Trimester deadline was successfully updated." }
      format.json { render :index, status: :ok, location: @trimester }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @trimester.errors, status: :unprocessable_entity }
    end
  end
end

end