/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 14:18
*/

# Firebase = require "firebase"

class SyncedList
  # path must use / as separator
  (@fb, @path, @class_name) ->
    @set_class_name!
    @set_reference!

  set_class_name: ->
    unless @class_name
      last_path ||= _.last _.split('/', @path)
      if _.empty last_path
        throw new Error "Class name can't be resolved from path: #{@path} or className: #{@class_name}"
      @class_name = require('inflector').singularize last_path

  set_reference: ->
    @reference = @fb.child @path



