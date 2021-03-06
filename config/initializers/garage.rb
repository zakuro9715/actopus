Garage.configure {}
Garage::TokenScope.configure do
  register :public, desc: 'acessing publicly available data' do
    access :read, Lecture
    access :read, Klass
    access :read, Rescheduling
  end
end

Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  optional_scopes(*Garage::TokenScope.optional_scopes)
end
