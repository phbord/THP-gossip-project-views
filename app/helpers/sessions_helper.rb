module SessionsHelper
    def current_user
        #Système de SESSIONS
        if session[:user_id]
            return current_user = User.find_by(id: session[:user_id])
        #Système de COOKIES
        elsif cookies[:user_id]
            user = User.find_by(id: cookies[:user_id])
            #Vérification s'il y a un cookie contenant l'id de l'utilisateur
            remember_token = cookies[:remember_token]
            remember_digest = user.remember_digest
            # Hashage et comparaison de `remember_token` (cookie) avec `remember_digest` (base)
            if user && BCrypt::Password.new(remember_digest).is_password?(remember_token)
                log_in user
                return current_user = user
            end
        end
    end

    def log_out(user)
        session.delete(:user_id)
        forget(user)
    end

    #Système de SESSIONS
    def log_in(user)
        session[:user_id] = user.id
    end

    def logged_in?
        return true unless session[:user_id].nil?
        return false
    end

    #Système de COOKIES
    def forget(user)
        #Suppression du `remember_digest` (nil)
        user.update(remember_digest: nil)
        #Suppression des cookies
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    def remember(user)
        #création d'un `remember_token`
        remember_token = SecureRandom.urlsafe_base64
        #stockage du token son `digest` en BDD
        user.remember(remember_token)
        #création des cookies pour enregistrer `user_id` et `remember_token`
        cookies.permanent[:user_id] = user.id
        cookies.permanent[:remember_token] = remember_token
    end

    def is_cookie?(obj)
        obj.to_s.downcase == "true"
    end
end