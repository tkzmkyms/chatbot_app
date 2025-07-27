class MessagesController < ApplicationController
  def index
    @messages = Message.order(created_at: :asc)
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender = "user"

    if @message.save
      bot_response = generate_bot_response(@message.content)
      Message.create(content: bot_response, sender: "bot")

      redirect_to root_path
    else
      @messages = Message.order(created_at: :asc)
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def generate_bot_response(user_message)
    case user_message
    when /営業時間/
      "営業時間は平日6時から19時までです。"
    when /場所|アクセス/
      "本社はしまバス本社前バス停にあります。"
    when /社長|代表/
      "弊社の代表は岩崎勇登です。"
    when /ありがとう|感謝/
      "どういたしまして！また質問してくださいね。"
    else
      "申し訳ありません、現在、営業時間、場所、アクセス、社長、代表、以外の質問にはまだ対応していません。"
    end
  end
end
