// var BaseControl = (function () {
//     function BaseControl() {
//         var _this = this;
//         this.container = document.getElementById('controlAddIn');
//         this.controlClass = '';
//         this.options = [];
//         window.SetOption = (function (key, value) {
//             _this.setOption(key, value);
//         }).bind(this);
//     }
//     BaseControl.prototype.setOption = function (key, value) {
//         this.options[key] = value;
//     };
//     BaseControl.prototype.setup = function () { };
//     BaseControl.prototype.render = function () {
//         try {
//             this.setup();
//         }
//         catch (err) {
//             Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnError", [err.message]);
//         }
//     };
//     return BaseControl;
// }());

// var __extends = (this && this.__extends) || (function () {
//     var extendStatics = function (d, b) {
//         extendStatics = Object.setPrototypeOf ||
//             ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
//             function (d, b) { for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p]; };
//         return extendStatics(d, b);
//     };
//     return function (d, b) {
//         extendStatics(d, b);
//         function __() { this.constructor = d; }
//         d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
//     };
// })();
var Buttons
function button()
{
    var placeholder = document.getElementById("controlAddIn"); 
    placeholder.innerHTML = "";

    var ifram = document.createElement("iframe");
    ifram.style="height=200px ;width=300px";
    ifram.id='iframe';
    ifram.title= "Iframe Example";


    Button = (function (_super) {
    __extends(Button, _super);
    function Button() {
        var _this = _super.call(this) || this;
        _this.controlClass = 'al-button';
        return _this;
    }
    Button.create = function () {
        var _this = this;
        var button = document.createElement("button");
        if (this.options.id) {
            button.id = this.options.id;
        }
        button.classList.add(this.controlClass);
        if (this.options.type) {
            button.classList.add("al-button-" + this.options.type);
        }
        button.innerHTML = "<span>" + this.options.caption + "</span>";
        button.title = this.options.title;
        button.addEventListener("click", (function (e) {
            Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnClick", [_this.options.id]);
        }).bind(this));
        this.container.append(button);
    };
    Button.prototype.setup = function () {
        var _this = this;
        Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnLoads", [], false, (function () {
            _this.create();
        }).bind(this));
    };
    return Button;
}(BaseControl));
}