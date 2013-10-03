ActiveAdmin.register Utility do
  controller do
    before_action :set_utility, only: [:show, :edit, :update, :destroy]

    def update
      respond_to do |format|
        if @utility.update(utility_params)
          format.html { redirect_to admin_utility_path(@utility), notice: 'Utility was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @utility.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_utility
      @utility = Utility.find(params[:id])
    end

    def utility_params
      params.require(:utility).permit!
    end
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :description
      f.input :avatar, :as => :file
    end
    f.actions
   end
end
