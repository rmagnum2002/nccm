ActiveAdmin.register Client do
  controller do
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def update
      respond_to do |format|
        if @client.update(client_params)
          format.html { redirect_to admin_client_path(@client), notice: 'Client was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @client.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit!
    end
  end

  index do
    selectable_column
    column "ID", :sortable => :id do |client|
      client.id
    end
    column "Title", :sortable => :title do |client|
      link_to client.name, admin_client_path(client)
    end
    column "Created at", :sortable => :created_at do |client|
      l client.created_at, :format => :long
    end
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :url
      f.input :body
      f.input :avatar, :as => :file
    end
    f.actions
   end
end
