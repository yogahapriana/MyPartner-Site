class RepliesController < ApplicationController
  def reply_message
    reply = Reply.new(message_id: params[:id], user_id: current_user.id, content: params[:content])

    if reply.save
      reply.send_mail_reply_message(current_user)
      redirect_to "/reply/#{params[:id]}",notice: 'Message has been replied'
    else
      redirect_to "/reply/#{params[:id]}",notice: 'Message failed for reply'
    end
  end
end
