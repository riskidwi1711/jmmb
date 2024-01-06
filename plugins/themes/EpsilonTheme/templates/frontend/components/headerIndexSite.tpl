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
	Last modified: 20th October 2022 (03:15 PM)
	
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
<style>
    .nav-link{
        color:white!important;
    }
    
    #pelindung{
            background: linear-gradient(90deg, rgba(23,50,122,1) 0%, rgba(9,9,121,1) 0%, rgba(20,99,168,1) 92%);
    }
    
    
    @media (max-width: 768px) {
   nav#headerNavigationContainer{
        background: url('https://ik.imagekit.io/y7lmhpzx6/header.png?updatedAt=1686639624328');
        background-size: 100%;
        background-repeat: no-repeat;
        background-color: unset;
        height:100%;
    }
    }
    
     @media (min-width: 768px) {
   nav#headerNavigationContainer{
        background: url('https://ik.imagekit.io/y7lmhpzx6/header.png?updatedAt=1686639624328');
        background-size: 720px;
        background-repeat: no-repeat;
        background-color: unset;
        background-position: center;
        height:131px;
    }
    
     @media (min-width: 1400px) {
   nav#headerNavigationContainer{
        background: url('https://ik.imagekit.io/y7lmhpzx6/header.png?updatedAt=1686639624328');
        background-size: 1170px;
        background-repeat: no-repeat;
        background-color: unset;
        background-position: center;
        height:210px;
    }
    
    @media (min-width: 1200px) {
   nav#headerNavigationContainer{
        background: url('https://ik.imagekit.io/y7lmhpzx6/header.png?updatedAt=1686639624328');
        background-size: 1140px;
        background-repeat: no-repeat;
        background-color: unset;
        background-position: center;
        height:210px;
    }
    
}
</style>
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}">
	
	
	{* Structure Page *}
{if $activeTheme->getOption('layoutStyle')}
<div class="pkp_structure_page bg-white container p-0 shadow">
{else}
<div class="pkp_structure_page bg-white">
{/if}

		<nav id="accessibility-nav" class="sr-only" role="navigation" aria-labelled-by="accessible-menu-label">
			<div id="accessible-menu-label">
				{translate|escape key="plugins.themes.EpsilonTheme.accessible_menu.label"}
			</div>
			<ul>
			  <li><a href="#main-navigation">{translate|escape key="plugins.themes.EpsilonTheme.accessible_menu.main_navigation"}</a></li>
			  <li><a href="#main-content">{translate|escape key="plugins.themes.EpsilonTheme.accessible_menu.main_content"}</a></li>
			  <li><a href="#sidebar">{translate|escape key="plugins.themes.EpsilonTheme.accessible_menu.sidebar"}</a></li>
			</ul>
		</nav>

		{* Header *}
	<div id="pelindung" class="bg-pelindung">
	    	<nav class="navbar navbar-expand-md navbar-dark  animate__animated animate__fadeInDown" id="headerNavigationContainer" role="banner"><meta http-equiv="Content-Type" content="text/html; charset=utf-8">

			<div class="container">
				
					{* Logo or site title. Only use <h1> heading on the homepage.
					   Otherwise that should go to the page title. *}
					{if $requestedOp == 'index'}
						<h1 class="site-name">
					{else}
						<div class="site-name">
					{/if}
						{capture assign="homeUrl"}
							{if $currentJournal && $multipleContexts}
								{url page="index" router=$smarty.const.ROUTE_PAGE}
							{else}
								{url context="index" router=$smarty.const.ROUTE_PAGE}
							{/if}
						{/capture}
						{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
							<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo">
					<img style="display:none;" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if}>
					</a>
					{*
					{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
					<a href="{$homeUrl}" class="navbar-brand">{$displayPageHeaderTitle}</a>
					{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
					<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo">
					<img src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}" alt="{$displayPageHeaderTitle.altText|escape}">
					</a>
					*}
					{else}
					<a href="{$homeUrl}" class="navbar-brand navbar-brand-logo">
					<img height="42" src="{$baseUrl}/plugins/themes/EpsilonTheme/templates/images/Epsilon_blue.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" />
					</a>
						{/if}
					{if $requestedOp == 'index'}
						</h1>
					{else}
						</div>
					{/if}
					
					
					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#nav-menu" aria-controls="nav-menu" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
					</button>
				
				
				<div class="collapse navbar-collapse" id="navbarCollapse">
				
				
				{* Primary site navigation *}
				{capture assign="primaryMenu"}
					{load_menu name="primary" id="navigationPrimary" ulClass="navbar-nav"}
				{/capture}
				
				{capture assign="userMenu"}
					{load_menu name="user" id="navigationUser" ulClass="navbar-nav nav justify-content-end"}
				{/capture}
				</div>
				{if !empty(trim($userMenu)) || $currentContext}
					<div id="nav-menu" class="navbar-collapse collapse justify-content-end" aria-label="{translate|escape key="common.navigation.site"}">
						{* Primary navigation menu for current application *}
						{$primaryMenu}

						{* Search form *}
						{if $currentContext}
							{include file="frontend/components/searchForm_simple.tpl"}
						{/if}
						{$userMenu}
					</div>
				{/if}
				
				
		
		

			</div><!-- .container -->
		</nav><!-- .pkp_structure_head -->
	</div>