class User < ApplicationRecord
  def apps
    query = nil

    case self.role
      when "admin"
        # Return all apps that are submitted or approved.
        query = { status: [ "submitted", "approved" ] }

      when "developer"
        # Return the apps created by this user.
        query = { created_by: self }
    end

    App.where(query)
  end
end
