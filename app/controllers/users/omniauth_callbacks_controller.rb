# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

  def github
    handle_auth "Github"
  end

  def google_oauth2
    handle_auth "google_oauth2"
  end

  def facebook
    handle_auth "facebook"
  end

  def discord
    handle_auth "discord"
  end

  def handle_auth(kind)
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: kind
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.auth_data"] = request.env["omniauth.auth"].except(:extra)
      redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
    end
  end


#   def handle_auth(kind)
#     @user = User.from_omniauth(request.env['omniauth.auth'])
#       if @user.persisted?
#         flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'kind'
#         sign_in_and_redirect @user, event: :authentication
#         # set_flash_message(:notice, :success, :kind: 'Facebook')if is_navigational_format?
#       else
#         # session["devise.user_attributes"] = "user.attributes"
#         # redirect_to_new_user_registration_url(:callback => "twitter")
#         session['devise.auth_data'] = request.env['omniauth.auth'].except('extra')
#         # flash[:error] = "There was a problem signing you in. please register or try signing letter"
#         redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
#       end
#     end
  
#     # alise_method :google_oauth2, :all
#     # alise_method :facebook, :all
#     def github
#       handle_auth "Github"
#     end
  
#     def google_oauth2
#       handle_auth "Google_oauth2"
#     end
  
#     def facebook
#       handle_auth "Facebook"
#     end
  
#     def linkedin
#       handle_auth "Linkedin"
#     end
  
#     def discord
#       handle_auth "Discord"   
#     end
  
# end


#   def google_oauth2
# 		@user = User.from_omniauth(request.env['omniauth.auth'])

#     if @user.persisted?
#       flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
#       sign_in_and_redirect @user, event: :authentication
#     else
#       session['devise.google_data'] = request.env['omniauth.auth'].except(:extra) 
#       redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
#     end
#   end
#   def facebook
#     @user = User.from_omniauth(request.env["omniauth.auth"])

#     if @user.persisted?
#       sign_in_and_redirect @user, event: :authentication 
#       set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
#     else
#       session["devise.facebook_data"] = request.env["omniauth.auth"].except(:extra) 
#       redirect_to new_user_registration_url
#     end
#   end

#   def github
#     @user = User.from_omniauth(request.env["omniauth.auth"])

#     if @user.persisted?
#       sign_in_and_redirect @user, :event => :authentication 
#       set_flash_message(:notice, :success, :kind => "github") if is_navigational_format?
#     else
#       session["devise.github_data"] = request.env["omniauth.auth"].except(:extra)
#       redirect_to new_user_registration_url
#     end
#   end

#   def discord
#     @user = User.from_omniauth(request.env["omniauth.auth"])

#     if @user.persisted?
#       sign_in_and_redirect @user, :event => :authentication 
#       set_flash_message(:notice, :success, :kind => "discord") if is_navigational_format?
#     else
#       session["devise.discord_data"] = request.env["omniauth.auth"].except(:extra)
#       redirect_to new_user_registration_url
#     end
#   end
end