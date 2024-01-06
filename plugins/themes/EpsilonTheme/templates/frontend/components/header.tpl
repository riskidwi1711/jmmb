{**
* lib/pkp/templates/frontend/components/header.tpl
*
* Copyright (c) 2014-2017 Simon Fraser University Library
* Copyright (c) 2003-2017 John Willinsky
* Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
*
* @brief Common frontend site header.
*
* @uses $isFullWidth bool Should this page be displayed without sidebars? This
*       represents a page-level override, and doesn't indicate whether or not
*       sidebars have been configured for thesite.
*}
<!-- 
	**********************************************
	
	Template name: Epsilon Theme 
	Version: 1.1 for OJS 3.2.x/3.3.x
	Modified by: Hasan Syaiful Rizal
	Last modified: 8th November 2022 (12:15 AM)
	
	**********************************************
	
	For more information about this template,
	please contact me at hsr@yudharta.ac.id
	
	**********************************************
-->
{* Determine whether a logo or title string is being displayed *}
{assign var="showingLogo" value=true}
{if $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
{assign var="showingLogo" value=false}
{/if}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
{include file="frontend/components/sidebar_offcanvas.tpl"}
{* Primary site navigation *}
{capture assign="primaryMenu"}
{load_menu name="primary" id="navigationPrimary" ulClass="navbar-nav mx-auto flex-grow-1 pe-3"}
{/capture}
{capture assign="userMenu"}
{load_menu name="user" id="navigationUser" ulClass="navbar-nav nav justify-content-end flex-grow-1"}
{/capture}

<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	<div class="offcanvas-header bg-primary-lighten-2 text-dark">
		<h5 class="offcanvas-title" id="offcanvasNavbarLabel">{translate|escape key="plugins.themes.EpsilonTheme.accessible_menu.main_navigation"}</h5>
		<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		{if !empty(trim($userMenu)) || $currentContext}
		<div aria-label="{translate|escape key="common.navigation.site"}">
		{* Primary navigation menu for current application *}
		{$primaryMenu}
		{* Search form *}
		{if $currentContext}
		{include file="frontend/components/searchForm_simple.tpl"}
		{/if}
		{$userMenu}
	</div>
	{/if}
</div>
</div>

<div class="offcanvas offcanvas-top shadow-lg offcanvas-search" tabindex="-1" id="offcanvasTop" aria-labelledby="offcanvasTopLabel">
	<div class="offcanvas-header">
		<h5 id="offcanvasTopLabel"></h5>
		<button type="button" class="btn-close text-reset d-none" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	</div>
	<div class="offcanvas-body">
		{if !$currentJournal || $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
		{capture name="searchFormUrl"}{url page="search" op="search" escape=false}{/capture}
		{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
		<form class="pkp_search {$className|escape} my-auto" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}" method="get" role="search" aria-label="{translate|escape key="submission.search"}">
		
			{csrf}
			{foreach from=$formUrlParameters key=paramKey item=paramValue}
				<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}"/>
			{/foreach}
			<div class="input-btn-absolute input-expand">  
				<input class="form-control form-control-lg border-0" name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}" placeholder="{translate key="common.search"}">
				<button type="submit" class="btn-absolute" for="search_search"><i class="fa fa-search fa-lg"></i><span class="sr-only">Search offcanvas</span></button>
			</div>
		</form>
		{/if}
	</div>
</div>

<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">

{* Preloader *}
{if $activeTheme->getOption('preloaderLoading')}
<div class="preloader">
    <div class="loading m-auto text-center">
    <div class="spinner-border text-primary" role="status">
        <span class="sr-only">Loading...</span>
    </div>
    </div>
</div>
{/if}

{* Structure Page *}
{if $activeTheme->getOption('layoutStyle')}
<div class="pkp_structure_page container my-md-3 p-0 shadow">
{else}
<div class="pkp_structure_page ">
{/if}
	{* Header Desktop *}
	<nav class="navbar navbar-light bg-white navbar-expand-md py-3 animate__animated animate__fadeInDown" id="mainNavigationContainer">
		<div id="navContainer" class="container-sm">
		    {if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
					<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo d-flex align-self-center">
					<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if}>
					</a>
					
					{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
					<a href="{$homeUrl}" class="navbar-brand d-flex align-self-center">{$displayPageHeaderTitle}</a>
					{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
					<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo">
					<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}">
					</a>
					
					{else}
					<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo d-flex align-self-center">
					<img height="42" src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/Epsilon_blue.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
					</a>
					{/if}
			
			{*  hamburger menu *}
			<button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
			<span class="navbar-toggler-icon"></span>
			</button>
			{if !empty(trim($userMenu)) || $currentContext}
			<div id="nav-menu" class="d-none d-md-block navbar-collapse collapse justify-content-end" aria-label="{translate|escape key="common.navigation.site"}">
				{* Primary navigation menu for current application *}
				{$primaryMenu}
				<div class="d-flex gap-3">
				    {* Search form *}
			{if $currentContext}
			{include file="frontend/components/searchForm_simple.tpl"}
			{/if}
			
			<a class="btn btn-danger btn-shadow btn-sm" href="/index.php/{$currentContext->getPath()}/about/submissions"><i class="fa fa-paper-plane-o" aria-hidden="true"></i> Submission</a>
				</div>
				{$userMenu}
			</div>
		{/if}
</div><!-- .container-fluid -->
</nav>