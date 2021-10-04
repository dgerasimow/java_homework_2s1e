<html lang="en">
<#include "base.ftl">
<#macro title>Users</#macro>

<#macro content>
    Hello,
    <#if users??>
    <#list users as u>
        ${u.firstName} ${u.secondName}
    </#list>!
    </#if>
</#macro>
</html>