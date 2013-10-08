ActiveAdmin.register Document do
  controller do
    before_action :set_doc, only: [:show, :edit, :update, :destroy]

    def create
      @document = Document.new(doc_params)

      respond_to do |format|
        if @document.save
          format.html { redirect_to admin_document_path(@document), notice: 'Document was successfully created.' }
          format.json { render json: @document, status: :created, location: @document }
        else
          format.html { render action: "new" }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @document.update(client_params)
          format.html { redirect_to admin_document_path(@document), notice: 'Document was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @document.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_doc
      @document = Document.find(params[:id])
    end

    def doc_params
      params.require(:document).permit!
    end
  end

  index do
    selectable_column
    column "ID", :sortable => :id do |document|
      document.id
    end
    column "Title", :sortable => :title do |document|
      link_to document.title, admin_document_path(document)
    end
    column "Title RO", :sortable => :title do |document|
      link_to document.title_ro, admin_document_path(document)
    end
    column "Title RU", :sortable => :title do |document|
      link_to document.title_ru, admin_document_path(document)
    end
    column "Created at", :sortable => :created_at do |document|
      l document.created_at, :format => :long
    end
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :title_ro
      f.input :title_ru
      f.input :image, :as => :file
    end
    f.actions
   end
end
