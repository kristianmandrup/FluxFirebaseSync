/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 13:26
 */

ListMutator = require 'list_mutator'

class SyncManager
  (@className, @list, @list_ref) ->
    @listMutator = new ListMutator @list

  sync_changes: ->
    self = this
    @list_ref.on 'child_added', _add(snap, prev_child) ->
      self.listMutator.addChild snap, prev_child

    @list_ref.on 'child_removed', _remove(snap) ->
      self.listMutator.removeChild snap

    @list_ref.on 'child_changed', _change(snap) ->
      self.listMutator.setChild snap

    @list_ref.on 'child_moved', _move(snap, prev_child) ->
      self.listMutator.moveChild prev_child

module.exports = SyncManager