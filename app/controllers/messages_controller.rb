class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show update destroy ]
  before_action :authorized
  # GET /messages
  def index
    @messages = Message.where(user_id: @user.id)
    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    @message = Message.new(message_params)
    @message.user_id = @user.id
    if @message.save
      render json: @message, status: :created, location: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      # params.require(:message).permit(:message, :user_id)
      params.permit(:message, :user_id)
    end
end
