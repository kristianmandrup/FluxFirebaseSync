// Generated by LiveScript 1.2.0
/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 13:26
 */
(function(){
  var ListMutator, SyncManager;
  ListMutator = require('list_mutator');
  SyncManager = (function(){
    SyncManager.displayName = 'SyncManager';
    var prototype = SyncManager.prototype, constructor = SyncManager;
    function SyncManager(className, list, list_ref){
      this.className = className;
      this.list = list;
      this.list_ref = list_ref;
      this.listMutator = new ListMutator(this.list);
    }
    prototype.sync_changes = function(){
      var self;
      self = this;
      this.list_ref.on('child_added', _add(snap, prev_child)(function(){
        return self.listMutator.addChild(snap, prev_child);
      }));
      this.list_ref.on('child_removed', _remove(snap)(function(){
        return self.listMutator.removeChild(snap);
      }));
      this.list_ref.on('child_changed', _change(snap)(function(){
        return self.listMutator.setChild(snap);
      }));
      return this.list_ref.on('child_moved', _move(snap, prev_child)(function(){
        return self.listMutator.moveChild(prev_child);
      }));
    };
    return SyncManager;
  }());
  module.exports = SyncManager;
}).call(this);
