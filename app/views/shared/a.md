data-controller="notification"
data-notification-delay-value="2000"
class="transition transform duration-1000 hidden"
data-transition-enter-from="opacity-0 translate-x-6"
data-transition-enter-to="opacity-100 translate-x-0"
data-transition-leave-from="opacity-100 translate-x-0"
data-transition-leave-to="opacity-0 translate-x-6"



<% if message %>
<div
data-controller="notification"
data-notification-delay-value="2000"
class="transition transform duration-1000 hidden"
data-transition-enter-from="opacity-0 translate-x-6"
data-transition-enter-to="opacity-100 translate-x-0"
data-transition-leave-from="opacity-100 translate-x-0"
data-transition-leave-to="opacity-0 translate-x-6"
>
<p font-color="red">This alert will magically disappear!</p>

<button data-action="notification#hide">Close</button>
</div>

<% end %>