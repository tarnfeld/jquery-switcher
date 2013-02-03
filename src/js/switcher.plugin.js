/**
 *
 */

(function () {

  "use strict";

  $.fn.switcher = function () {

    // Switch object
    var _switcher = function () {
      var self = this;

      // Private APIs
      self._bind = function () {
        $(self).addClass("jquery-switcher");
        $(self).on("click", function () { self._switch(!$(self).hasClass("on")); });
      };

      self._destroy = function () {
        $(self).off("click");
        $(self).removeClass("jquery-switcher");
      };

      self._switch = function (state, fire) {
        $(self).addClass(state ? "on" : "off").removeClass(!state ? "on" : "off");
        if (fire !== false) {
          $(self).trigger("switch");
        }
      };

      // Public APIs
      self.destroy = function () { return self._destroy(); };
      self.update = function (state, fire) { return self._switch(state, fire); };

      self.on = function () { return self._switch(true); };
      self.off = function () { return self._switch(false); };
      self.isOn = function () { return $(self).hasClass("on"); };
      self.isOff = function () { return $(self).hasClass("off"); };

      self._bind();

      return self;
    };

    return $(this).each(function (i, el) {
      if (!$(el).data("switcher")) {
        $(el).data("switcher", _switcher.call(el));
      }
    });
  };
})();
