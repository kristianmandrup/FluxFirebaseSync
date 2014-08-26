/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 13:28
 */

class ListMutator
  (@list) ->

  remove: (items) ->
    any_removed = false
    for removed_item in items
      if typeof! removed_item is 'Object'
        any_removed = true
        @list.$remove removed_item.$id
    any_removed

  add: (items) ->
    any_added = false
    for added_item in items
      if typeof! added_item is 'Object'
        any_added = true
        @list.$add added_item
      any_added

class ChangeDetector
  (@change) ->

  any_removed: ->
    @change.type is 'splice' and @change.removed.length > 0

  any_added: ->
    @change.type is 'splice' and @change.addedCount > 0


class ChangeManager
  (@list, @change) ->

  list_mutator: new ListMutator @list
  change_detector: new ChangeDetector @change

  try_remove: ->
    return false unless @change_detector.any_removed!
    # one or more items were removed
    @list_mutator.remove @change.removed

  try_add: ->
    return false unless @change_detector.any_added @change
    # one or more items were added
    @list_mutator.add @added_items(@change)

  added_items: ->
    @list.slice @change.index, last_index

  last_index: ->
    @change.index + @change.added_count + 1

  # TODO: should be done in parallel
  doChange: ->
    { added: @try_add!, removed: @try_remove! }
