{* Journal Summary *}
	{if $activeTheme->getOption('showDescriptionInJournalIndex')}
		<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3">
		<i class="fa fa-info me-2" aria-hidden="true"></i>{translate key="about.aboutContext"}
		</div>
		
		<div class="card bg-info-lighten border-0 mb-3">
		<div class="card-body">
		{*
		<h3 class="mb-3 mt-0 text-primary">
			<i class="fa fa-info-circle me-2" aria-hidden="true"></i>{translate key="about.aboutContext"}
		</h3>
		*}
		<div class="cover-journal">
			{if $homepageImage}
			<img class="img-fluid rounded me-3" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:" url"}" alt="{$homepageImageAltText|escape}">
			{/if}
			{if $journalDescription}
				{$currentContext->getLocalizedData('description')}
			{/if}
		</div>
		</div>
		</div>
	{/if}
		
		  {* Announcements *}
		  {if $numAnnouncementsHomepage && $announcements|count}
          <div class="mb-3">
			<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3">
		<i class="fa fa-bullhorn me-2" aria-hidden="true"></i>{translate key="announcement.announcements"}
		</div>
		
            <section class="cmp_announcements row g-3">
				{foreach name=announcements from=$announcements item=announcement}
					{if $smarty.foreach.announcements.iteration > $numAnnouncementsHomepage}
						{break}
					{/if}
					{if $smarty.foreach.announcements.iteration == 1}
						<div class="col-md-12">
						{include file="frontend/objects/announcement_summary.tpl" heading="h3"}
						</div>
					{else}
					<div class="col-md-6 animate__animated animate__fadeInUp animate__delay-1s">
					<article class="obj-wrapper obj_announcement_summary ">
						<h4 class="obj-title">
							<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
								{$announcement->getLocalizedTitle()|escape}
							</a>
						</h4>
						<small class="date text-muted my-3">
							<i class="fa fa-calendar me-2" aria-hidden="true"></i>{$announcement->getDatePosted()}
						</small>
					</article>
					</div>
					{/if}
				{/foreach}
			</section>
          </div>
		  {/if}
		  
		  {* Latest issue *}
          <div class="">
			<div class="mb-3">
			<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3">
		<i class="fa fa-fire me-2" aria-hidden="true"></i>{translate key="journal.currentIssue"}
		</div>
		
			{if !$issue}
				{include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}
			{else}
			<section class="current_issue">
			{include file="frontend/objects/issue_toc.tpl"}
			<div class="text-end">
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary btn-sm mt-3 animate__animated animate__fadeInUp animate__delay-1s">{translate key="journal.viewAllIssues"}<i class="fa fa-angle-right ms-2" aria-hidden="true"></i></a>
			</div>
			</section>
			{/if}
          </div>
        
		{* Most Popular Articles *}
		{if $activeTheme->getOption('popularArticles')}
		<div class="bg-primary-lighten-1 rounded px-3 py-2 d-inline-block text-white mb-3"><i class="fa fa-star-o me-2" aria-hidden="true"></i>
{translate key="plugins.themes.EpsilonTheme.most-viewed"}</div>
		{include file="frontend/components/popular_articles.tpl"}
	{else}
	
	{/if}