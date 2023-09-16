
// var controlAddIn,type,id;
// controlAddIn =$('#controlAddIn');
// window.label = function (id,type)
// {
//     id.html(id);
//     type.html(type);
// }
Button.prototype.create = function () {
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