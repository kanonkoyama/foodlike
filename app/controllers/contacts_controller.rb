class ContactsController < ApplicationController
  before_action :authenticate_user!, {only: [:index]}
  
  def index
    if current_user.id == 1
      @contacts = Contact.all
    else
      flash[:notice] = "権限がありません。"
      redirect_to("/posts/index")
    end    
  end

  def new
    @contact = Contact.new
  end
  
  def create
    if user_signed_in?
      @contact=Contact.new(
        content: params[:content],
        user_id: current_user.id
      )
    else
      @contact=Contact.new(
        content: params[:content],
        user_id: "0"
      )  
    end 
    if @contact.save
      flash[:notice] = "貴重なご意見ありがとうございます。また何かございましたら、ご意見をお聞かせください。"
      redirect_to("/posts/index")
    else
      flash[:notice] = "送信に失敗しました。内容をご確認ください。"
      render("contacts/new")
    end    
  end

end
