{**
* templates/frontend/pages/userLogin.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2000-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* User login form.
*
*}
{include file="frontend/components/header.tpl" pageTitle="user.login"}
{*
{include file="frontend/components/banner.tpl"}
*}
{include file="frontend/components/content-wrapper.tpl"}
<div id="main-content" class="page page_login animate__animated animate__fadeIn">
	{*
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}
	*}
	
	
	

	<div class="holder">
		{* Page Title *}
	<div class="page-header text-primary">
		<h1>{translate key="user.login"}</h1>
	</div>
		{* A login message may be displayed if the user was redireceted to the
		login page from another request. Examples include if login is required
		before dowloading a file. *}
		{if $loginMessage}
		<div class="alert alert-info">
			{translate key=$loginMessage}
		</div>
		{/if}
			
				
					<form class="pkp_form login" id="login" method="post" action="{$loginUrl}">
						
							
							{csrf}
							<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />
							{if $error}
							<div class="alert alert-danger">{translate key=$error reason=$reason}</div>
							{/if}
							<div class="input-group mb-3 ">
								<div class="form-floating">
									<input type="text" name="username" class="form-control shadow-none" id="login-username" placeholder="{translate key='user.username'}" value="{$username|escape}" maxlenght="32" required>
									<label for="login-username">{translate key='user.username'}</label>
								</div>
							</div>
							<div class="input-group input-btn-absolute mb-2">
								<div class="form-floating">
									<input type="password" name="password" class="form-control shadow-none" id="login-password" placeholder="{translate key='user.password'}" password="true" maxlength="32" required="$passwordRequired" style="padding-right:30px;z-index: 3">
									<label for="login-password">{translate key='user.password'}</label>
								</div>
								<span class="btn-absolute input-group-text field-icon" style="z-index:5"><span toggle="#login-password" class="fa fa-fw fa-eye-slash toggle-password"></span></span>
							</div>
							
							<div class="clearfix row g-3 mb-3">
								<div class="small col">
									<div class="form-check text-start">
										<input class="form-check-input shadow-none" type="checkbox" name="remember" id="remember" value="1" checked="$remember">
										<label class="form-check-label" for="remember">{translate key="user.login.rememberUsernameAndPassword"}</label>
									</div>
								</div>
								<div class="small col text-end">
									<a href="{url page="login" op="lostPassword" }">{translate key="user.login.forgotPassword"}</a>
								</div>
							</div>
							<button type="submit" class="w-100 btn-lg btn btn-primary"><i class="fa fa-sign-in me-2" aria-hidden="true"></i>{translate key="user.login"}</button>
						
						
						
							<div class="row mt-3">
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
						
						
					</form>
				
			
			
</div><!-- page_login_container -->
</div><!-- .page -->
{include file="common/frontend/footer.tpl"}