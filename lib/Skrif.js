var CodeMirror, Skrif, View, jQuery, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

jQuery = require('jquery')(window);

View = require('space-pen').View;

CodeMirror = require('code-mirror/mode/markdown');

Skrif = (function(_super) {
  __extends(Skrif, _super);

  function Skrif() {
    _ref = Skrif.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Skrif.content = function() {
    var _this = this;
    return this.div({
      "class": 'Skrif'
    }, function() {
      return _this.textarea({
        outlet: "textArea"
      }, function() {});
    });
  };

  Skrif.prototype.initialize = function(settings) {
    var _settings;
    _settings = {
      theme: 'default'
    };
    $.extend(settings, _settings);
    if (settings.content) {
      this.textArea.val(settings.content);
    }
    this.editor = CodeMirror.fromTextArea(this.textArea[0], {
      mode: "markdown",
      autofocus: true
    });
    if (settings.elem) {
      $(settings.elem).append(this);
    } else {
      $('body').append(this);
    }
    this.addClass("theme-" + settings.theme);
    this.textArea[0].focus();
    return this.editor.refresh();
  };

  return Skrif;

})(View);

module.exports = Skrif;

if (typeof window !== "undefined" && window !== null) {
  window.Skrif = Skrif;
}
