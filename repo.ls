/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 13:26
 */
Repo = (...req_actions) ->
  class RepoFactory
    (@options) ->

    validate_actor: (actor) ->
      for required_action in @required_actions
        @action_error(actor, required_action) unless actor[required_action]

    action_error: (actor, action) ->
      throw new Error "Required #{action} function not found in #{actor}"

    required_actions: req_actions || ['execute']
    repo: @options.repo || {}
    find_for: (class_name) ->
      # find validator in repository using className
      @repo[class_name]

    add_for: (class_name, actor) ->
      @validate_actor actor
      @repo[class_name] = actor

    remove_for: (class_name) ->
      @repo.delete class_name

module.exports =
  Validator  : Repo 'validate'
  Marshaller : Repo 'marshal', 'unmarshal'