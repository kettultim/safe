class RequestMailer < ApplicationMailer
  default from: 'donotreply@app.com'

  def notify_host request_id
    @request = Request.find request_id
    @space = @request.space
    @host = @space.user
    @guest = @request.user

    mail(
      to: @host.email,
      subject: "New SafeApp Request for #{@space.name}"
    )
  end
end
