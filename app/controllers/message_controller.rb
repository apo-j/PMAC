class MessageController < ApplicationController
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    uploaded_io = @message.file_path
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    MessageNotifier.received(@message).deliver
    redirect_to store_index_path
  end



  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:object, :email, :file_path ,:message)
  end
end
