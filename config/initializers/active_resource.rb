# monkey patching for active resource
# after each set require clear
# FIXME what will happend if set parallel 2 credentials ?

class ActiveResource::Base

  def self.connect(current_site, current_user)
    old_site = site
    old_user = user
    begin
      self.site = current_site
      self.user = current_user
      connection(:refresh => true)
      yield
    ensure
      self.site = old_site
      self.user = old_user
    end
  end

  def self.connect_mandrill(current_site)
    old_site = site
    begin
      self.site = current_site
      connection(:refresh => true)
      yield
    ensure
      self.site = old_site
    end
  end

end
