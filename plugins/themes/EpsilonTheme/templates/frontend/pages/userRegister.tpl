{**
* templates/frontend/pages/userRegister.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* User registration form.
*}
{include file="frontend/components/header.tpl" pageTitle="user.register"}
{*
{include file="frontend/components/banner.tpl"}
*}
{include file="frontend/components/content-wrapper.tpl"}
<div id="main-content" class="page page_register">
	
	{*
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.register"}
	*}
	
	
	<div class="holder">
	
	{* Page Title *}
	<div class="page-header">
		<h1 class="text-primary">{translate key="user.register"}</h1>
	</div>
	
	<form class="pkp_form register" id="register" method="post" action="{url op="register"}">
		
		{csrf}

		{if $source}
			<input type="hidden" name="source" value="{$source|escape}" />
		{/if}

		{include file="common/formErrors.tpl"}

		{include file="frontend/components/registrationForm.tpl"}

		{* When a user is registering with a specific journal *}
		{if $currentContext}

			<fieldset class="alert alert-warning consent text-start">
				{if $currentContext->getSetting('privacyStatement')}
				{* Require the user to agree to the terms of the privacy policy *}
					<div class="checkbox option-privacy">
						<label>
							<input type="checkbox" class="form-check-input shadow-none" name="privacyConsent" value="1"{if $privacyConsent} checked="checked"{/if}>
							{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
							{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
						</label>
					</div>
				{/if}
				{* Ask the user to opt into public email notifications *}
				<div class="checkbox option-email text-start">
					<label>
						<input type="checkbox" class="form-check-input shadow-none" name="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}>
						{translate key="user.register.form.emailConsent"}
					</label>
				</div>
			</fieldset>

			{* Allow the user to sign up as a reviewer *}
			{assign var=contextId value=$currentContext->getId()}
			{assign var=userCanRegisterReviewer value=0}
			{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
				{if $userGroup->getPermitSelfRegistration()}
					{assign var=userCanRegisterReviewer value=$userCanRegisterReviewer+1}
				{/if}
			{/foreach}
			{if $userCanRegisterReviewer}
				<fieldset class="alert alert-info reviewer text-start">
					<p class="text-danger">
						{translate key="user.reviewerPrompt"}
					</p>
					<div class="fields">
						<div id="reviewerOptionGroup" class="checkbox option-reviewer">
							{foreach from=$reviewerUserGroups[$contextId] item=userGroup}
								{if $userGroup->getPermitSelfRegistration()}
									<label>
										{assign var="userGroupId" value=$userGroup->getId()}
										<input type="checkbox" class="form-check-input shadow-none" name="reviewerGroup[{$userGroupId}]" value="1"{if in_array($userGroupId, $userGroupIds)} checked="checked"{/if}>
										{translate key="user.reviewerPrompt.userGroup" userGroup=$userGroup->getLocalizedName()|escape}
									</label>
								{/if}
							{/foreach}
						</div>
					</div>
				</fieldset>
			{/if}
		{/if}

		{include file="frontend/components/registrationFormContexts.tpl"}

		{if !$currentContext}
			{* Require the user to agree to the terms of the privacy policy *}
		<fieldset class="alert alert-info consent">
				{if $siteWidePrivacyStatement}
					<div class="checkbox option-privacy text-start">
						<label>
							<input type="checkbox" class="form-check-input shadow-none" name="privacyConsent[{$smarty.const.CONTEXT_ID_NONE}]" id="privacyConsent[{$smarty.const.CONTEXT_ID_NONE}]" value="1"{if $privacyConsent[$smarty.const.CONTEXT_ID_NONE]} checked="checked"{/if}>
							{capture assign="privacyUrl"}{url router=$smarty.const.ROUTE_PAGE page="about" op="privacy"}{/capture}
							{translate key="user.register.form.privacyConsent" privacyUrl=$privacyUrl}
						</label>
					</div>
				{/if}

				{* Ask the user to opt into public email notifications *}
				<div class="checkbox option-email text-start">
					<label>
						<input type="checkbox" class="form-check-input shadow-none" name="emailConsent" value="1"{if $emailConsent} checked="checked"{/if}>
						{translate key="user.register.form.emailConsent"}
					</label>
				</div>
		</fieldset>
		{/if}

		{* recaptcha spam blocker *}
		{if $reCaptchaHtml}
			<fieldset class="recaptcha_wrapper">
				<div class="fields">
					<div class="form-group recaptcha">
						{$reCaptchaHtml}
					</div>
				</div>
			</fieldset>
		{/if}

		<div class="clearfix text-start">
			<button class="w-100 btn-lg btn btn-primary submit" type="submit"><i class="fa fa-user-plus me-2"></i>{translate key="user.register"}</button>
			{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
		</div>
	</form>
	<div class="row mt-3">
								<div class="col text-start">
									<a class="btn-home" href="{url page="index"}"><i class="fa fa-angle-double-left me-2"></i>{translate key="plugins.themes.EpsilonTheme.home"}</a>
								</div>
								
								<div class="col text-end">
									{capture assign="rolesProfileUrl"}{url page="user" op="profile" path="roles"}{/capture}
									<a class="btn-login" href="{url page="login" source=$rolesProfileUrl}" class="login">{translate key="user.login"}<i class="fa fa-angle-double-right ms-2"></i></a>
								</div>
								
							</div>
	</div>
<!-- page_register -->
{include file="common/frontend/footer.tpl"}