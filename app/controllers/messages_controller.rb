class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # POST /articles
  # POST /articles.json
  def create
    @message = Message.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to :back, notice: 'Message was successfully sent.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { redirect_to :back, error: 'Message was not sent.' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use this method to whitelist the permissible parameters. Example:
    #   params.require(:person).permit(:name, :age)
    #
    # Also, you can specialize this method with per-user checking of permissible
    # attributes.
    def message_params
      params.require(:message).permit(:name, :email, :message)
    end
end
