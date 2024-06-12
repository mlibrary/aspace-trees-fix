require "logger"
require "json"

Logger.new($stdout).info("Loading aspace-trees-fix plugin in backend")

# Overrides current build_node_query method to ensure ordering is consistent between batches
# See https://github.com/archivesspace/archivesspace/blob/704cd60416b643d562df9fe05af83955152df8fd/backend/app/model/mixins/trees.rb#L46-L48

module Trees
  def build_node_query
    self.class.node_model.this_repo.filter(:root_record_id => self.id).order(:id)
  end
end
