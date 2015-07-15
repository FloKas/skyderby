Skyderby.views.Competition = Backbone.View.extend({

    el: '#competition',

    initialize: function() {
        var rules = this.model.get('rules');
        if (rules === 'hungary_boogie') {
            this.view = new Skyderby.views.HungaryBoogieEvent();
        } else if (rules === 'fai2015') {
            this.view = new Skyderby.views.FAI_2015_Event();
        } else if (rules === 'speed_distance_time') {
            this.view = new Skyderby.views.SpeedDistanceTimeEvent();
        } else {
            alert('Unsupported rules');
        }
    },

    render: function() {
        this.$el.html(this.view.render());
    }

});
