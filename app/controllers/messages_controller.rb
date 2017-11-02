class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :force_json, except: [:index, :show]

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # POST /messages.json
  def create
    client = Client.find_by_auth_key(params.require(:auth_key))
    safe_messages = params.permit(messages: [ :content, :severity, :logtime ])

    allGood = true
    safe_messages[:messages].each do |msg|
      newMessage = Message.new(msg)
      newMessage.client = client
      allGood = allGood and newMessage.save
    end

    if allGood
      payload = {
        result: "Messages created successfully",
        status: 201
      }
      render :json => payload, :status => :created
    else
      payload = {
        result: "Failed to create messages",
        status: 400
      }
      render :json => payload, :status => :bad_request
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:client_id, :content, :severity, :logtime)
    end

    def force_json
      render :nothing => true, :status => 406 unless params[:format] == 'json' || request.headers["Accept"] =~ /json/
    end
end
