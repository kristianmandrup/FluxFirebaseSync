// Generated by LiveScript 1.2.0
/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 16:02
 */
(function(){
  var PositionCalc, DataWrap, Marshaller, ListMutator;
  PositionCalc = require('position_calc');
  DataWrap = require('data_wrap');
  Marshaller = require('executor').Marshaller;
  ListMutator = (function(){
    ListMutator.displayName = 'ListMutator';
    var prototype = ListMutator.prototype, constructor = ListMutator;
    function ListMutator(list){
      this.list = list;
      this.calc = new PositionCalc(this.list);
    }
    prototype.data_wrapper = DataWrap;
    prototype.splice_data = function(from_pos, to_pos, data){
      return this.list.splice(from_pos, to_pos, this.unmarshalled(this.valueOf(data)));
    };
    prototype.value_of = function(snap){
      return this.data_wrapper().wrap(snap.val());
    };
    prototype.unmarshalled = function(data){
      return Marshaller.unmarshal(data);
    };
    prototype.set_child = function(child){
      list[this.calc.curPos()] = child;
      return list[this.calc.curPos()].$id = child.name();
    };
    prototype.remove_child = function(child){
      if (!this.calc.valid_pos(child)) {
        return;
      }
      return this.list.splice(this.calc.cur_pos(), 1);
    };
    prototype.add_child = function(child, prev_child){
      data.$id = child.name();
      return this.spliceData(this.calc.new_pos(prev_child), 0, data);
    };
    prototype.move_child = function(child, prev_child){
      if (!this.calc.valid_pos(child)) {
        return;
      }
      return this.splice_data(this.calc.new_pos(), 0, this.move_data());
    };
    prototype.move_data = function(){
      return this.list.splice(this.calc.curPos(), 1)[0];
    };
    return ListMutator;
  }());
  module.exports = ListMutator;
}).call(this);
