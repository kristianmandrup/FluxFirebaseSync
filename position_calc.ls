/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 16:01
 */
class PositionCalc
  (@list) ->

  valid_pos: (child) ->
    @valid ||= @cur_pos(child) >= 0

  cur_pos: (child) ->
    @_cur_pos ||= @position_for @list, child.name!

  new_pos: (prev_child) ->
    @_new_pos ||= @position_after @list, prev_child

  # similar to indexOf, but uses id to find element
  position_for: (key) ->
    for i from 0 to list.length
      return i if list[i].$id is key
    -1

  # using the Firebase API's prevChild behavior, we
  # place each element in the list after it's prev
  # sibling or, if prevChild is null, at the beginning
  position_after: (prev_child) ->
    return 0 if prev_child is void
    index = @position_for prev_child
    if index is -1 then @list.length else index + 1

module.exports = PositionCalc