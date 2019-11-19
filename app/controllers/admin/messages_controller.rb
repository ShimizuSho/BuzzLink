class Admin::MessagesController < ApplicationController

	before_action :authenticate_user!, only: [:create]

  def create
    if Entry.where(user_id: current_admin.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:user_id, :content, :room_id).merge(user_id: current_admin.id))
    else
      flash[:alert] = "メッセージ送信に失敗しました。"
    end
      redirect_to admin_room_path(current_admin.id, @message.room.id)
  end

end
