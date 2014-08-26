/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 16:02
 */
PositionCalc = require 'position_calc'
DataWrap     = require 'data_wrap'
Marshaller   = require 'executor' .Marshaller

class ListMutator
  (@list) ->
    @calc = new PositionCalc @list

  data_wrapper:
    DataWrap

  splice_data: (from_pos, to_pos, data) ->
    @list.splice from_pos, to_pos, @unmarshalled(@valueOf data)

  value_of: (snap) ->
    @data_wrapper!.wrap snap.val!

  unmarshalled: (data) ->
    # unmarshal data, fx add aggregate properties etc.
    Marshaller.unmarshal data

  set_child: (child) ->
    list[@calc.curPos!] = child
    list[@calc.curPos!].$id = child.name! # assumes data is always an object

  remove_child: (child) ->
    return unless @calc.valid_pos(child)
    @list.splice @calc.cur_pos!, 1

  add_child: (child, prev_child) ->
    data.$id = child.name! # assumes data is always an object
    @spliceData @calc.new_pos(prev_child), 0, data

  move_child: (child, prev_child) ->
    return unless @calc.valid_pos(child)
    @splice_data @calc.new_pos!, 0, @move_data!

  move_data: ->
    @list.splice(@calc.curPos!, 1).0

module.exports = ListMutator