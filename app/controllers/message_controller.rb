class MessageController < ApplicationController
  before_filter :get_user_id, :only => [:sended_message, :reply]

  def index
  end

  def choose_recipients
    @group = Group.find(params[:id])
    @partners = @group.partners
    @message = Message.new
  end

  def send_email
    #    @message = Message.new(params[:message])
    #    redirect_to create_message_path
  end

  def create_message
    @message = Message.new(params[:message])
    if @message.save
      redirect_to sended_message_path
    else
      @group = Group.find(params[:id])
      @partners = @group.partners

      render :action => "choose_recipients"
    end
  end

  def sended_message
    @message = Message.where(:user_id => @user_id)
  end

  def reply
    @message_id = params["message_id"]
    @message = @current_user.messages.find(@message_id)
    @recipients = @message.recipients
    @attachment = @message.attachments
  end

  private
  
  def get_user_id
    unless current_user.id.nil?
      @user_id = current_user.id
    end
  end
end