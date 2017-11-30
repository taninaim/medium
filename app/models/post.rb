class Post < ApplicationRecord
    include CoverPictureUploader::Attachment.new(:cover_picture)

    belongs_to :user, optional: true
    has_many :transitions, class_name: 'PostTransition'

    scope :published, -> { where.not(published_at: nil) }
    scope :drafted, -> { where(published_at: nil)}

    attr_accessor :state_event, :state_changer

    before_save :mark_published,
        if: -> { state_event == 'published' }
    
    before_save :mark_unpublished,
        if: -> { state_event == 'unpublished' }

    before_create -> {
        transitions.build(
            user: state_changer, 
            to_state: 'draft')
    }

    def mark_published
        self.published_at = DateTime.now

        transitions.build(
            user: state_changer, 
            from_state: current_state, 
            to_state: 'published'
        )
    end

    def mark_unpublished
        self.published_at = nil

        transitions.build(
            user: state_changer,
            from_state: current_state,
            to_state: 'draft'
        )
    end

    def current_state
        transitions.last_state
    end
end
