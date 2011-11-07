class RepliesController < ApplicationController
  def reply_message
    reply = Reply.new(message_id: params[:id], user_id: current_user.id, content: params[:content])

    if reply.save
      redirect_to "/reply/#{params[:id]}",notice: 'Message has been replied'
    else
      redirect_to "/reply/#{params[:id]}",notice: 'Message failed for reply'
    end
  end
end
