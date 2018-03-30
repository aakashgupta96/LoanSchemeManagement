class Permission

  def initialize(user)
    allow :home, [:loan_app]
    allow :users, [:sign_up, :create, :sign_in, :create_session, :edit, :update]
    if user
      allow :users, [:sign_out]
      if user.applicant?
        allow :applicants, [:dashboard]
      end
      if user.officer?
        allow :officers, [:dashboard, :new_employee, :create_employee]
      end
      if user.nodal_employee?
        allow :nodal_employees, [:dashboard]
        allow :tickets, [:index, :open_change_status, :resolved_change_status, :escalated_change_status]
        allow :messages, [:index]
      end

      allow_all if user.admin?
    end
    false
  end

  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end

  def allow_all
    @allow_all = true
  end

  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow_param(resources, attributes)
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource] ||= []
      @allowed_params[resource] += Array(attributes)
    end
  end

  def allow_param?(resource, attribute)
    if @allow_all
      true
    elsif @allowed_params && @allowed_params[resource]
      @allowed_params[resource].include? attribute
    end
  end

  def permit_params!(params)
    if @allow_all
      params.permit!
    elsif @allowed_params
      @allowed_params.each do |resource, attributes|
        if params[resource].respond_to? :permit
          params[resource] = params[resource].permit(*attributes)
        end
      end
    end
  end

end