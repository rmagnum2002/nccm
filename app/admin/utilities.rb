ActiveAdmin.register Utility do
  index do
    selectable_column
    column "ID", :sortable => :id do |utility|
      utility.id
    end
    column "title", :sortable => :title do |utility|
      utility.title
    end
    column "Created at", :sortable => :created_at do |utility|
      l utility.created_at, :format => :long
    end
    default_actions
  end

  controller do
    before_action :set_utility, only: [:show, :edit, :update, :destroy]

    def create
      @utility = Utility.new(utility_params)

      respond_to do |format|
        if @utility.save
          format.html { redirect_to admin_utility_path(@utility), notice: 'Utility was successfully created.' }
          format.json { render json: @utility, status: :created, location: @utility }
        else
          format.html { render action: "new" }
          format.json { render json: @utility.errors, status: :unprocessable_entity }
        end
      end
    end


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
      f.input :utility_image, :as => :file
    end
    f.actions
   end
end
