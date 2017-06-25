module GroupsHelper

	def owned_groups_entities(user = current_user)
		Group.my_groups(user).map {|g| g.entity}
	end

	def groups_I_joined_entities(user = current_user)
		Group.groups_I_joined(user).map {|g| g.entity}
	end

	def related_groups_entities(user = current_user)
		Group.my_related_groups(user).map {|g| g.entity}
	end

  def groups_I_want_to_join_entities(user = current_user)
    Group.groups_I_want_to_join(user).map {|g| g.entity}
  end

end