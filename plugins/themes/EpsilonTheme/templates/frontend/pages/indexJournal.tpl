{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * UPDATED/CHANGED/MODIFIED: Marc Behiels - marc@elemental.ca - 250416
 *
 * Copyright (c) 2014-2017 Simon Fraser University Library
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div id="main-content" class="page_index_journal animate__animated animate__fadeInUp" role="content">
	{call_hook name="Templates::Index::journal"}
	
	
	
	{if $activeTheme->getOption('indexJournalLayout')}
		{include file="frontend/components/indexJournal_content_tab.tpl"}
	{else}
		{include file="frontend/components/indexJournal_content_classic.tpl"}
	{/if}
	
	
		
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
