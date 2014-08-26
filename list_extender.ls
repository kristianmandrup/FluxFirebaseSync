/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 13:27
 */

PositionCalc = require 'position_calc'

class ListExtender
  (@list, @list_ref, @sync_store) ->
    @calc = new PositionCalc @list

  reference_for: (key) ->
    @list_ref.child key

  wrap_crud: ->
    self = this
    # we can hack directly on the array to provide some convenience methods
    @list.$add = (data) ->
      self.sync_store.update_data @list_ref, 'push', data

    @list.$remove = (key) ->
      self.reference_for(key).remove!

    @list.$removeList = (keys) ->
      for (key in keys)
        @list.$remove(key)

    @list.$set = (key, new_data) ->
      # make sure we don't accidentally push our $id prop
      delete new_data.$id if new_data.has_own_property '$id'
      self.sync_store.update_data @reference_for(key), 'set', new_data

    @list.$index_of = (key) ->
      self.calc.position_for key # positionFor in examples above

module.exports = ListExtender