ActiveAdmin.register Service do
  controller do
    before_action :set_service, only: [:show, :edit, :update, :destroy]

    def create
      @service = Service.new(client_params)

      respond_to do |format|
        if @service.save
          format.html { redirect_to admin_service_path(@service), notice: 'Service was successfully created.' }
          format.json { render json: @service, status: :created, location: @service }
        else
          format.html { render action: "new" }
          format.json { render json: @service.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @service.update(client_params)
          format.html { redirect_to admin_service_path(@service), notice: 'Service was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @service.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_service
      @service = Service.find(params[:id])
    end

    def client_params
      params.require(:service).permit!
    end
  end
end
