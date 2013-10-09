class TeamMembersController < ApplicationController
  def index
    @about_page = true
    @team_members = TeamMember.all
  end
end
