{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the press's contact details.
 *
 * @uses $currentContext Journal|Press The current journal or press
 * @uses $mailingAddress string Mailing address for the journal/press
 * @uses $contactName string Primary contact name
 * @uses $contactTitle string Primary contact title
 * @uses $contactAffiliation string Primary contact affiliation
 * @uses $contactPhone string Primary contact phone number
 * @uses $contactEmail string Primary contact email address
 * @uses $supportName string Support contact name
 * @uses $supportPhone string Support contact phone number
 * @uses $supportEmail string Support contact email address
 *}
{include file="frontend/components/header.tpl" pageTitle="about.contact"}
{include file="frontend/components/banner.tpl"}
{include file="frontend/components/content-wrapper.tpl"}

<div class="page page_contact">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="about.contact"}
	

	{* Contact section *}
	<div class="contact_section">
	<span class="float-end">
	{include file="frontend/components/editLink.tpl" page="management" op="settings" path="context" anchor="contact" sectionTitleKey="about.contact"}
	</span>
	    <div class="page-header">
			<h1>{translate key="about.contact"}</h1>
		</div>
		<div class="row gap-0">
			<div class="col-md-6">
				{* Primary contact *}
				{if $contactTitle || $contactName || $contactAffiliation || $contactPhone || $contactEmail}
				<div class="card mb-3">
				<div class="card-body">
					<h4>{translate key="about.contact.principalContact"}</h4>
					
						{if $contactName}
						<div class="name text-uppercase">{$contactName|escape}</div>
						{/if}
						
						{if $contactTitle}
						<div class="title">{$contactTitle|escape}</div>
						{/if}
						
						{if $contactAffiliation}
						<div class="affiliation">
							<i class="fa fa-university me-2" aria-hidden="true"></i>{$contactAffiliation|strip_unsafe_html}
						</div>
						{/if}
						
						{if $contactPhone}
						<div class="phone">
							<i class="fa fa-phone me-2" aria-hidden="true"></i>{$contactPhone|escape}
						</div>
						{/if}
						
						{if $contactEmail}
						<div class="email">
							<i class="fa fa-envelope me-2" aria-hidden="true"></i>
							<a href="mailto:{$contactEmail|escape}">{$contactEmail|escape}</a>
						</div>
						{/if}
					
				</div><!-- card-body -->
				</div><!-- card -->
				{/if}
			</div><!-- col-md-6 -->
			<div class="col-md-6">
				{* Technical contact *}
				{if $supportName || $supportPhone || $supportEmail}
				<div class="card mb-3">
				<div class="card-body">
					<h4>{translate key="about.contact.supportContact"}</h4>
					
						{if $supportName}
						<div class="name text-uppercase">{$supportName|escape}</div>
						{/if}
						
						{if $supportPhone}
						<div class="phone">
							<i class="fa fa-phone me-2" aria-hidden="true"></i>{$supportPhone|escape}
						</div>
						{/if}
						
						{if $supportEmail}
						<div class="email">
							<i class="fa fa-envelope me-2" aria-hidden="true"></i><a href="mailto:{$supportEmail|escape}">{$supportEmail|escape}</a>
						</div>
						{/if}
					
				</div><!-- card-body -->
				</div><!-- card -->
				{/if}
			</div><!-- col-md-6 -->
			{if $mailingAddress}
			<div class="col-md-12">
				<!-- location map -->
				<div class="card mb-3">
				<div class="card-body">
					<!-- mailing address -->
					
					<h4>Mailing Address</h4>
					{$mailingAddress|nl2br|strip_unsafe_html}
					
				<!--
				<div class="mt-3 ratio ratio-16x9">
				
					<iframe class="embed-responsive-item" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3953.2867256215723!2d112.72784691477793!3d-7.759385294407638!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd7d3e20a363849%3A0x40843536585f1531!2sUniversitas%20Yudharta%20Pasuruan!5e0!3m2!1sid!2sid!4v1603192173769!5m2!1sid!2sid" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0" width="750" height="300" frameborder="0"></iframe>
					
				</div>
				-->
				</div>
				</div>
			</div>
			{/if}
		</div><!-- row -->
	</div><!-- contact_section -->
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
