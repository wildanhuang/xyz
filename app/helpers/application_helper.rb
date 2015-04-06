module ApplicationHelper

  def link_helper(name, control)
    name == control ? flag = true : flag = false

    if flag
      return 'active'
    else
      return ''
    end
  end
end
