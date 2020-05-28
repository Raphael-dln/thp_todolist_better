class EmailsController < ApplicationController
  before_action :authenticate_user!

  def new
    @email = Email.new()
  end

  def create
    @email = Email.new(object: Faker::Book.title, body: Faker::Lorem.paragraph(sentence_count: 15, supplemental: true, random_sentences_to_add: 30) )
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
    @emails = Email.all
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
    respond_to do |format|
      format.html { redirect_to emails_path }
      format.js { }
    end
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
