class SessionsController < InertiaController
  allow_unauthenticated_access only: %i[ new create ]
  before_action :redirect_if_authenticated, only: %i[ new create ]

  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_path, alert: "Try again later." }

  def new
    render inertia: "sessions/new"
  end

  def create
    if user = User.authenticate_by(session_params)
      start_new_session_for user
      redirect_to after_authentication_url
    else
      render inertia: "sessions/new", 
        props: { errors: { base: t('sessions.invalid_credentials') } },
        status: :unprocessable_entity
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path, status: :see_other
  end

  private

    def session_params
      permitted = params.permit(:email_address, :password, session: {})
      permitted.slice(:email_address, :password)
    end
end
