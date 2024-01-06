{**
* templates/frontend/pages/userLostPassword.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2000-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* Password reset form.
*
*}
{include file="frontend/components/header.tpl" pageTitle="user.login.resetPassword"}
{*
{include file="frontend/components/banner.tpl"}
*}
{include file="frontend/components/content-wrapper.tpl"}
<div id="main-content" class="page page_lost_password">
	
	{*
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login.resetPassword"}
	*}

	

	<div class="holder">
	<div class="page-header text-primary">
		<h1>{translate key="user.login.resetPassword"}</h1>
	</div>
	
				<div class="">
					<div class="alert alert-danger">
						{translate key="user.login.resetPasswordInstructions"}
					</div>
					<form class="pkp_form lost_password" id="lostPasswordForm" action="{url page=" login"
						op="requestResetPassword" }" method="post">
						{csrf}

						{if $error}
						<div class="alert alert-error">
							{translate key=$error}
						</div>
						{/if}
						
						<div class="form-floating mb-3">
								<input type="email" name="email" class="form-control shadow-none" id="login-email" placeholder="{translate key='user.login.registeredEmail'}" value="{$email|escape}" maxlenght="32" required>
								<label for="login-email" class="form-label">{translate key='user.login.registeredEmail'}</label>
						</div>
							
						<button type="submit" class="mb-3 btn-lg w-100 btn btn-primary">
								<i class="fa fa-refresh me-2"></i></span>{translate key="user.login.resetPassword"}
							</button>

					</form>
				</div>
			
				<div class="row">
								<div class="col text-start">
									<a class="btn-home" href="{url page="index"}"><i class="fa fa-angle-double-left me-2"></i>{translate key="plugins.themes.EpsilonTheme.home"}</a>
								</div>
								{if !$disableUserReg}
								<div class="col text-end">
									{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
									<a class="register-button" href="{$registerUrl}" role="button">
									{translate key="user.login.registerNewAccount"}<i class="fa fa-angle-double-right ms-2"></i>
									</a>
								</div>
								{/if}
							</div>
			
			
		
	</div>
</div><!-- .page -->

{include file="common/frontend/footer.tpl"}