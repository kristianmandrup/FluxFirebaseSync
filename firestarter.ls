/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 13:24
 */

class ListModelManager
  (@list, @firebase_ref, @path, @class_name) ->
    @list_ref = @synced_list!.reference

  sync_store: ->
    new SyncStore @class_name

  sync_changes: ->
    new SyncManager(@class_name, @list, @list_ref).sync_changes!

  synced_list: ->
    @_synced_list ||= new SyncedList @firebase_ref, @path, @class_name

  wrap_local_crud_ops: ->
    new ListExtender(@list, @list_ref, @sync_store!).wrap_crud!

  config: ->
    @sync_changes!
    @wrap_local_crud_ops!
    @list


class FirebaseSyncManager
  (@firebase_ref, @path = '') ->

  list_model_manager: ->
    new ListModelManager @list, @firebase_ref, @path, @class_name

  getSynchronizedArray: (@class_name, @list = []) ->
    @list_model_manager!.config!

new FirebaseSyncManager