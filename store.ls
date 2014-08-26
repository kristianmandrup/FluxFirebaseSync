/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 13:27
 */
class SyncStore
  (@options = {}) ->
    @class_name = @options.class_name || 'Base'

  repo: {
   validator: new ValidatorRepo
   marshaller: new MarshallerRepo
  }

  validator: ->
    @_validator ||= @options.validator || @repo.validator.findFor(@className)

  marshaller: ->
    @_marshaller ||= @options.marshaller || @repo.marshaller.findFor(@className)

  update: (operation, data) ->
    operation data if valid data

  validate: (data) ->
    result = validated data
    unless _.empty result.err
      throw new Error "Invalid data: #{result.err}"
    true

  validated: (data) ->
    if @validator then @validator.validate(data) else true

  marshal: (data) ->
    if @marshaller then @marshaller.marshal(data) else data

  unmarshal: (data) ->
    if @marshaller then @marshaller.unmarshal(data) else data