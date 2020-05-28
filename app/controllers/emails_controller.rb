class EmailsController < ApplicationController
  before_action :authenticate_user!

  def new
    @email = Email.new()
  end

  def create
    @email = Email.new(object: Faker::Book.title, body: Faker::Quote.most_interesting_man_in_the_world)
    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
    else 
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def index
    @email = Email.all
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    @email.update(email_params)
      respond_to do |format|
        format.html { redirect_to emails_path }
        format.js { }
      end
  end

  def show
    @email = Email.find(params[:id])
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
  end

  private
  
  def email_params
    params.permit(:object, :body)
  end

end
