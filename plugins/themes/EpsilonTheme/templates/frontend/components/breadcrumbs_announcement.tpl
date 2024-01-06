{**
 * templates/frontend/components/breadcrumbs.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Customized and modified is copyrighted to Hasan Syaiful Rizal, copyright 2020
 * For more information, please contact hsr@yudharta.ac.id or visit hsr-share.blogspot.com
 * 
 * @brief Display a breadcrumb nav item showing the current page. This basic
 *  version is for top-level pages which only need to show the Home link. For
 *  category- and series-specific breadcrumb generation, see
 *  templates/frontend/components/breadcrumbs_catalog.tpl.
 *
 * @uses $currentTitle string The title to use for the current page.
 * @uses $currentTitleKey string Translation key for title of current page.
 *}

<nav class="cmp_breadcrumbs mb-4 animate__animated animate__fadeInDown" role="navigation" aria-label="{translate key="navigation.breadcrumbLabel"}">
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="{url page="index" router=$smarty.const.ROUTE_PAGE}">
				<i class="fa fa-home" aria-hidden="true"></i>
			</a>
		</li>
		<li class="breadcrumb-item">
			<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}">
				{translate key="announcement.announcements"}
			</a>
		</li>
		<li class="breadcrumb-item active">
			{$announcement->getLocalizedTitle()|escape}
		</li>
	</ol>
</nav>
