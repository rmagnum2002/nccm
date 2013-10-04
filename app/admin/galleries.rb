ActiveAdmin.register Gallery do
  controller do
    before_action :set_gallery, only: [:show, :edit, :update, :destroy]

    def create
      @gallery = Gallery.new(gallery_params)

      respond_to do |format|
        if @gallery.save
          format.html { redirect_to admin_gallery_path(@gallery), notice: 'Gallery was successfully created.' }
          format.json { render json: @gallery, status: :created, location: @gallery }
        else
          format.html { render action: "new" }
          format.json { render json: @gallery.errors, status: :unprocessable_entity }
        end
      end
    end


    def update
      respond_to do |format|
        if @gallery.update(gallery_params)
          format.html { redirect_to admin_gallery_path(@gallery), notice: 'Gallery was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @gallery.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit!
    end
  end

  form multipart: true do |f|
    f.inputs do
      f.input :name

      f.has_many :images do |ff|
        ff.input :photo, as: :file, :hint => ff.template.image_tag(ff.object.photo.url)
        ff.input :_destroy, as: :boolean
      end
    end

    f.actions
  end
end
