# frozen_string_literal: true

class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def edit; end

  def create
    @client = Client.new(client_params)
    if @client.save
      respond_to do |format|
        format.html { redirect_to @client, notice: 'Client was successfully created' }
      end
    else render 'new'
    end
  end

  def update
    if @client.update(client_params)
      respond_to do |format|
        format.html { redirect_to @client, notice: 'Client was successfully updated' }
      end
    else render 'edit'
    end
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :address, :email, :contact)
  end
end
