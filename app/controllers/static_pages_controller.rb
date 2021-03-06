# encoding: utf-8
class StaticPagesController < ApplicationController
  def index
    @track = Track.new
    results =
      VirtualCompResult
      .joins(:virtual_competition)
      .joins(:profile)
      .where('virtual_competitions.display_on_start_page = ?', true)
      .order(:virtual_competition_id, 'result DESC')
      .group(:profile_id, 
             :profile_name,
             :virtual_competition_id, 
             :virtual_competition_name,
             'virtual_competitions.jumps_kind')
      .pluck_to_hash(
        'virtual_competitions.name as virtual_competition_name',
        "CASE
          WHEN virtual_competitions.jumps_kind = 0
            THEN 'Skydive challenge'
          ELSE 'BASE Challenge'
        END as competition_group",
        :virtual_competition_id,
        :profile_id,
        'profiles.name as profile_name',
        'MAX(result) as result')

    @competition_results = results.group_by { |x| x[:competition_group] }
    # grouped.each do |_, res|
    #   place = 1
    #   res.each do |r|
    #     r[:place] = place
    #     place += 1
    #   end
    # end
    #
    # VirtualCompetition.includes(:virtual_comp_results)
    #                   .includes(virtual_comp_results: :user_profile)
    #                   .where(display_on_start_page: true)
    #                   .order('id DESC')
    #                   .group_by(&:jumps_kind)
  end

  def manage
    authorize! :manage, :all
  end

  # End point for NewRelic availability monitoring
  def ping
    head :ok
  end

  def about
  end

  def competitions
    @summary = Skyderby::CompetitionsSummary.new
  end
end
