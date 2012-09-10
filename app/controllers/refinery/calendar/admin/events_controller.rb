module Refinery
  module Calendar
    module Admin
      class EventsController < ::Refinery::AdminController
        before_filter :find_venues, :except => [:index, :destroy]

        crudify :'refinery/calendar/event',
                :xhr_paging => true,
                :sortable => false,
                :order => "'from' DESC",
                :include => [:translations]

        private
        def find_venues
          @venues = Venue.order('name')
        end
      end
    end
  end
end
