<div>
    {if $activeTheme->getOption('showDescriptionInJournalIndex')}
		
		<div  class="alert alert-warning alert-dismissible fade show mb-5" role="alert">
		    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		<div>
		{*
		<h3 class="mb-3 mt-0 text-primary">
			<i class="fa fa-info-circle me-2" aria-hidden="true"></i>{translate key="about.aboutContext"}
		</h3>
		*}
		<div class="cover-journal">
			{if $journalDescription}
				{$currentContext->getLocalizedData('description')}
			{/if}
		</div>
		</div>
		</div>
	{/if}
</div>
<nav>
          <div class="nav nav-pills mb-3" id="nav-tab" role="tablist">
            <button class="nav-link active" id="nav-currentIssue-tab" data-bs-toggle="tab" data-bs-target="#currentIssue" type="button" role="tab" aria-controls="nav-currentIssue" aria-selected="false"><i class="fa fa-fire me-2" aria-hidden="true"></i>{translate key="journal.currentIssue"}</button>
			{if $activeTheme->getOption('showDescriptionInJournalIndex')}
			<button class="nav-link" id="nav-aboutJournal-tab" data-bs-toggle="tab" data-bs-target="#aboutJournal" type="button" role="tab" aria-controls="nav-aboutJournal" aria-selected="true"><i class="fa fa-info me-2" aria-hidden="true"></i>{translate key="about.aboutContext"}</button>
			{/if}
			{if $numAnnouncementsHomepage && $announcements|count}
			<button class="nav-link" id="nav-announcement-tab" data-bs-toggle="tab" data-bs-target="#announcement" type="button" role="tab" aria-controls="nav-announcement" aria-selected="false"><i class="fa fa-bullhorn me-2" aria-hidden="true"></i>{translate key="announcement.announcements"}</button>
            {/if}
			{if $activeTheme->getOption('popularArticles')}
			<button class="nav-link" id="nav-popular-tab" data-bs-toggle="tab" data-bs-target="#mostPopular" type="button" role="tab" aria-controls="nav-popular" aria-selected="false"><i class="fa fa-star-o me-2" aria-hidden="true"></i>{translate key="plugins.themes.EpsilonTheme.most-viewed"}</button>
			{/if}
          </div>
        </nav>
		
		
        <div class="tab-content" id="nav-tabContent">
			
          <div class="tab-pane fade" id="aboutJournal" role="tabpanel" aria-labelledby="nav-aboutJournal-tab">
            <div class="card card-body animate__animated animate__fadeInUp">
				
			{* Journal Summary *}
	
		
		
		
		<div class="cover-journal">
			{if $homepageImage}
			<img class="img-fluid rounded me-3" src="{$publicFilesDir}/{$homepageImage.uploadName|escape:" url"}" alt="{$homepageImageAltText|escape}">
			{/if}
			{if $journalDescription}
				{$currentContext->getLocalizedData('about')}
			{/if}
		</div>
		
			
          </div><!-- card card-body -->
          </div>
		  
		  {* Announcements *}
		  {if $numAnnouncementsHomepage && $announcements|count}
          <div class="tab-pane fade" id="announcement" role="tabpanel" aria-labelledby="nav-announcement-tab">
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
          <div class="tab-pane fade show active" id="currentIssue" role="tabpanel" aria-labelledby="nav-currentIssue-tab">
			{if !$issue}
				{include file="frontend/components/notification.tpl" type="warning" messageKey="current.noCurrentIssueDesc"}
			{else}
			<section class="current_issue">
			{include file="frontend/objects/issue_toc.tpl"}
			<a href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}" class="btn btn-primary btn-sm mt-3 animate__animated animate__fadeInUp animate__delay-1s">{translate key="journal.viewAllIssues"}<i class="fa fa-angle-right ms-2" aria-hidden="true"></i></a>
			</section>
			{/if}
          </div>
		  
		  {* Popular Articles *}
          <div class="tab-pane fade" id="mostPopular" role="tabpanel" aria-labelledby="nav-popular-tab">
			{include file="frontend/components/popular_articles.tpl"}

          </div>
		  
		  
        </div>