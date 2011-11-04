class MessageController < ApplicationController
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
      @partners = params["partners"]
      @partners.each do |partner|
        Recipient.create(:email_recipient => partner, :user_id => current_user.id, :message_id => @message.id)
      end
      redirect_to "/sended_message"
    else
      @group = Group.find(params[:id])
      @partners = @group.partners

      render :action => "choose_recipients"
    end
  end

  def sended_message
    
  end
end