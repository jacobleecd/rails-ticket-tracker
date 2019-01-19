class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = Ticket.all
    @tickets = @tickets.select { |t| t.project_id == params[:project].to_i } if exists?(:project)
    @tickets = @tickets.select { |t| t.status == params[:status] } if exists?(:status)
    @tickets = @tickets.select { |t| t.has_tag?(params[:tag].to_i) } if exists?(:tag)
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      @ticket.add_tags(params[:ticket][:tag_ids])
      flash[:notice] = 'Your ticket was created.'
      redirect_to root_path
    else
      render :new
    end
  end

  
  def edit; end

  def update
    if @ticket.update(ticket_params)
      @ticket.add_tags(params[:ticket][:tag_ids])
      flash[:notice] = 'Ticket was updated.'
      redirect_to '/tickets'
    else
      render :update
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = 'Your ticket was deleted.'
    redirect_back(fallback_location: root_path)
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:project_id, :status, :name, :body)
  end

  def exists?(parameter)
    params[parameter] && !params[parameter].empty?
  end
end