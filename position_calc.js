// Generated by LiveScript 1.2.0
/**
 * User: kmandrup
 * Date: 26/08/14
 * Time: 16:01
 */
(function(){
  var PositionCalc;
  PositionCalc = (function(){
    PositionCalc.displayName = 'PositionCalc';
    var prototype = PositionCalc.prototype, constructor = PositionCalc;
    function PositionCalc(list){
      this.list = list;
    }
    prototype.valid_pos = function(child){
      return this.valid || (this.valid = this.cur_pos(child) >= 0);
    };
    prototype.cur_pos = function(child){
      return this._cur_pos || (this._cur_pos = this.position_for(this.list, child.name()));
    };
    prototype.new_pos = function(prev_child){
      return this._new_pos || (this._new_pos = this.position_after(this.list, prev_child));
    };
    prototype.position_for = function(key){
      var i$, to$, i;
      for (i$ = 0, to$ = list.length; i$ <= to$; ++i$) {
        i = i$;
        if (list[i].$id === key) {
          return i;
        }
      }
      return -1;
    };
    prototype.position_after = function(prev_child){
      var index;
      if (prev_child === void 8) {
        return 0;
      }
      index = this.position_for(prev_child);
      if (index === -1) {
        return this.list.length;
      } else {
        return index + 1;
      }
    };
    return PositionCalc;
  }());
  module.exports = PositionCalc;
}).call(this);
