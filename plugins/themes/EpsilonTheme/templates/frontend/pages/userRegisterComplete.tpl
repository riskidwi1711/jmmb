{**
* templates/frontend/pages/userRegisterComplete.tpl
*
* Copyright (c) 2014-2021 Simon Fraser University
* Copyright (c) 2000-2021 John Willinsky
* Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
*
* @brief A landing page displayed to users upon infoful registration
*}
{include file="frontend/components/header.tpl"}
{*
{include file="frontend/components/banner.tpl"}
*}
{include file="frontend/components/content-wrapper.tpl"}
<div class="page page_register_complete">
	{*
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey=$pageTitle}
	*}
	
		
		<div class="holder">
			<div class="page-header text-primary">
		<h1>{translate key=$pageTitle}</h1>
	</div>
			<p class="text-primary mb-4">{translate key="user.login.registrationComplete.instructions"}</p>

				<div class="mx-auto btn-group-vertical">
					{if array_intersect(array(ROLE_ID_MANAGER, ROLE_ID_SUB_EDITOR, ROLE_ID_ASSISTANT, ROLE_ID_REVIEWER),
					(array)$userRoles)}
					<a class="btn btn-outline-primary text-start" href="{url page=" submission" op="wizard" }">
						<i class="fa fa-eye me-2" aria-hidden="true"></i>{translate key="user.login.registrationComplete.manageSubmissions"}
					</a>
					{/if}
					{if $currentContext}
					<a class="btn btn-outline-primary text-start" href="{url page=" submission" op="wizard" }">
						<i class="fa fa-plus me-2" aria-hidden="true"></i>{translate key="user.login.registrationComplete.newSubmission"}
					</a>
					{/if}
					<a class="btn btn-outline-primary text-start" href="{url router=$smarty.const.ROUTE_PAGE page=" user" op="profile" }">
						<i class="fa fa-pencil-square-o me-2" aria-hidden="true"></i>{translate key="user.editMyProfile"}
					</a>
					<a class="btn btn-outline-primary text-start" href="{url page=" index"}">
						<i class="fa fa-search me-2" aria-hidden="true"></i>{translate key="user.login.registrationComplete.continueBrowsing"}
					</a>
				</div>
			
		</div>
		
	
</div>

{include file="frontend/components/footer.tpl"}