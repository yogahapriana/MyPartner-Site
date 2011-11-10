class MessageController < ApplicationController
  before_filter :get_user_id, :only => [:sended_message, :reply]

  def index
    @messages = Message.my_inbox(current_user.id)
    @title = ".:: #{current_user.username} - Inbox ::."
  end

  def choose_recipients
    @group = Group.find(params[:id])
    @partners = @group.users.uniq
    @message = Message.new
    @title = ".:: #{current_user.username} - Choose Recipients ::."
  end

  def send_email
    #    @message = Message.new(params[:message])
    #    redirect_to create_message_path
  end

  def create_message
    @message = Message.new(params[:message])
    if @message.save
      @message.send_mail_message(current_user)
      redirect_to sent_message_path
    else
      @group = Group.find(params[:id])
      @partners = @group.partners

      render :action => "choose_recipients"
    end
  end

  def sended_message
    @title = ".:: #{current_user.username} - Sent Message ::."
    @message = Message.where(:user_id => @user_id)
  end

  def reply
    @title = ".:: Replying Message ::."
    @message_id = params["message_id"]
    @message = Message.find(@message_id)
    @message.readed_by(current_user.id)
    @recipients = @message.recipients
    @attachment = @message.attachments
  end

  def download_attachment
    @attachment = Attachment.find(params[:id])

    send_file @attachment.attached_file.path
  end

  private
  
  def get_user_id
    unless current_user.id.nil?
      @user_id = current_user.id
    end
  end
end