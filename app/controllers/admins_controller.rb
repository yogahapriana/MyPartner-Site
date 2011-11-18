class AdminsController < ApplicationController
  layout 'layouts/admin'
  before_filter :get_user, only: [:edit_user, :update_user, :delete_user]

  def index
    @keyword = params["keyword"]

    if @keyword == ""
      @groups = Array.new()
    else
      @groups = Group.named_like(@keyword).uniq
    end

    @subtitle = "Searching Groups"
  end

  def choose_recipients
    if user_signed_in?
      @group = Group.find(params[:id])
      @partners = @group.users.uniq
      @message = Message.new
      @title = ".:: #{current_user.username} - Choose Recipients ::."
    else
      session["group_id"] = params[:id]
      redirect_to new_user_session_path
    end
  end
  
  def user
    @title = ".:: Home - Admin Page ::."
    @users = User.where("id !=?", current_user.id)
  end

  def edit_user
    @title = ".:: Editing User ::."
  end

  def update_user
    @user.update_attribute("username", params[:user][:username])

    if @user.save
      redirect_to admin_url, notice: 'User has been updated'
    else
      redirect_to admin_url, notice: 'User failed updated'
    end
  end

  def delete_user
    @user.destroy

    redirect_to admin_url
  end

  def new
    @title = ".:: Creating User ::."
  end
  
  def create_user
    @user = User.new(params[:user])

    if @user.save
      redirect_to admin_url, notice: 'User was successfully created.'
    else
      redirect_to admin_url, notice: 'User was failed created'
    end
  end

  def group_list
    @header_name = "Group List"
    @title = ".:: Admin - Group List ::."
    @groups = Group.all
  end

  def my_groups
    @header_name = current_user.username + " Groups"
    @title = ".:: #{current_user.username} - My Groups ::."
    @groups = Group.where("users.id = ?", current_user.id).includes(:users)
  end

  def inbox
    @messages = Message.my_inbox(current_user.id)
    @title = ".:: #{current_user.username} - Inbox ::."
    @header_name = "Inbox - " + current_user.username + " ( " + @messages.count.to_s + " Messages ) "
  end

  def sended_message
    @title = ".:: #{current_user.username} - Sent Message ::."
    @message = Message.where(:user_id => current_user.id)
    @header_name = "Sentbox - " + current_user.username + " ( " + @message.count.to_s + " Email Sent ) "
  end

  def reply
    @header_name = "Replying Message"
    @title = ".:: Replying Message ::."
    @message_id = params["message_id"]
    @message = Message.find(@message_id)
    @message.readed_by(current_user.id)
    @recipients = @message.recipients
    @attachment = @message.attachments
  end

  def create_message
    @message = Message.new(params[:message])
    if @message.save
      @message.send_mail_message(current_user)
      redirect_to sent_message_admin_path
    else
      @group = Group.find(params[:id])
      @partners = @group.partners

      render :action => "choose_recipients_admin"
    end
  end
   
  private

  def get_user
    unless params[:id].nil?
      @user = User.find(params[:id])
    end
  end
end
