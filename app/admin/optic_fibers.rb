ActiveAdmin.register OpticFiber, :as => "Page" do
  index do
    selectable_column
    column "ID", :sortable => :id do |optic_fiber|
      optic_fiber.id
    end
    column "display", :sortable => :display do |optic_fiber|
      optic_fiber.display
    end
    column "Page Key", :sortable => :page_key do |optic_fiber|
      optic_fiber.page_key
    end
    column "Created at", :sortable => :created_at do |optic_fiber|
      l optic_fiber.created_at, :format => :long
    end
    default_actions
  end

  controller do
    before_action :set_resource, only: [:show, :edit, :update, :destroy]

    def create
      @resource = OpticFiber.new(fiber_params)

      respond_to do |format|
        if @resource.save
          format.html { redirect_to admin_pages_path, notice: 'Page was successfully created.' }
          format.json { render json: @resource, status: :created, location: @resource }
        else
          format.html { render action: "new" }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @resource.update(fiber_params)
          format.html { redirect_to admin_pages_path, notice: 'Page was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_resource
      @resource = OpticFiber.find(params[:id])
    end

    def fiber_params
      params.require(:page).permit!
    end
  end

  form do |f|
    f.inputs do
      f.input :page_key
      f.input :display
      f.input :content_en, :as => :ckeditor
      f.input :content_ro, :as => :ckeditor
      f.input :content_ru, :as => :ckeditor
    end
    f.buttons
  end
end
