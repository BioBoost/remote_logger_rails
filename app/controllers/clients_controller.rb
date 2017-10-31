class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy, :clear_messages]

  # GET /clients
  def index
    @clients = Client.all
  end

  # GET /clients/1
  def show
    @messages = @client.messages
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to @client, notice: 'Client was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: 'Client was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
    redirect_to clients_url, notice: 'Client was successfully destroyed.'
  end

  def clear_messages
    @client.messages.destroy_all
    redirect_to @client, notice: 'Messages were successfully cleared.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :auth_key, :description)
    end
end
