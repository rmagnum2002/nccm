ActiveAdmin.register TeamMember do
  controller do
    before_action :set_client, only: [:show, :edit, :update, :destroy]

    def create
      @team_member = TeamMember.new(team_member_params)

      respond_to do |format|
        if @team_member.save
          format.html { redirect_to admin_team_member_path(@team_member), notice: 'TeamMember was successfully created.' }
          format.json { render json: @team_member, status: :created, location: @team_member }
        else
          format.html { render action: "new" }
          format.json { render json: @team_member.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @team_member.update(team_member_params)
          format.html { redirect_to admin_team_member_path(@team_member), notice: 'TeamMember was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @team_member.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def set_client
      @team_member = TeamMember.find(params[:id])
    end

    def team_member_params
      params.require(:team_member).permit!
    end
  end

  index do
    selectable_column
    column "ID", :sortable => :id do |team_member|
      team_member.id
    end
    column "Name", :sortable => :title do |team_member|
      link_to team_member.name, admin_team_member_path(team_member)
    end
    column "Created at", :sortable => :created_at do |team_member|
      l team_member.created_at, :format => :long
    end
    default_actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :about
      f.input :phone
      f.input :mobile
      f.input :email
      f.input :avatar, :as => :file
    end
    f.actions
   end
end
