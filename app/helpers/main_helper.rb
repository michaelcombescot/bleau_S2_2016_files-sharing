module MainHelper

	def owned_groups_entities
		owned = Group.my_groups(current_user)
		entities = []
		owned.each do |g|
			entities << g.entity
		end
		return entities
	end

	def in_groups_entities(user = current_user)
		Group.my_related_groups(user).map {|g| g.entity}
	end
end