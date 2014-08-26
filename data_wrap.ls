/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 16:03
 */
Immutable = require 'immutable'

DataWrap =
  immutable: (data) ->
    Immutable.fromJS data

  wrap: (data) ->
    @immutable data

module.exports = DataWrap