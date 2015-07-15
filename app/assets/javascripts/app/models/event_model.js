Skyderby.models.Event = Backbone.Model.extend({

    initialize: function() {

        this.url = '/' + I18n.currentLocale() + '/events/' + this.id;

        this.rounds = new Skyderby.collections.Rounds();
        this.rounds.url = this.url + '/rounds';

        this.sections = new Skyderby.collections.Sections();
        this.sections.url = this.url + '/sections';
        
        this.competitors = new Skyderby.collections.Competitors();
        this.competitors.url = this.url + '/competitors';

        this.tracks = new Skyderby.collections.EventTracks();
        this.tracks.url = this.url + '/event_tracks';

        this.organizers = new Skyderby.collections.Organizers();
        this.organizers.url = this.url + '/organizers';

    },

    parse: function(resp, opts) {
        console.log(resp);
    }
});
