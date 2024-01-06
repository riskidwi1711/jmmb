{**
 * templates/frontend/components/navbar-bottom.tpl
 *}



<nav class="d-none d-md-block py-3 navbar navbar-dark bg-primary-darken-2 navbar-expand-md animate__animated animate__fadeInUp" id="bottomNavigation">
		<div id="navContainer" class="container-fluid justify-content-center">
		    
		<ul id="navigationPrimary" class="navbar-nav">
		
		<li class="nav-item">
			<a href="{$homeUrl}" class="nav-link">{translate key="plugins.themes.EpsilonTheme.home"}</a>
		</li>
	{if $enableAnnouncements}
		<li class="nav-item">
			<a class="nav-link" href="{url router=$smarty.const.ROUTE_PAGE page="announcement"}">
				{translate key="announcement.announcements"}
			</a>
		</li>
	{/if}

	{if $currentJournal}

		{if $currentJournal->getData('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
			<li class="nav-item">
				<a class="nav-link" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="current"}">
					{translate key="navigation.current"}
				</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}">
					{translate key="navigation.archives"}
				</a>
			</li>
		{/if}

		<li class="nav-item dropup">
			<a class="nav-link dropdown-toggle" href="{url router=$smarty.const.ROUTE_PAGE page="about"}" role="button" data-bs-toggle="dropdown" aria-expanded="false">
				{translate key="navigation.about"}
			</a>
			<ul class="dropdown-menu">
				<li>
					<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about"}">
						{translate key="about.aboutContext"}
					</a>
				</li>
				{if $currentJournal->getLocalizedData('editorialTeam')}
					<li>
						<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="editorialTeam"}">
							{translate key="about.editorialTeam"}
						</a>
					</li>
				{/if}
				<li>
					<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="submissions"}">
						{translate key="about.submissions"}
					</a>
				</li>
				{if $currentJournal->getData('mailingAddress') || $currentJournal->getData('contactName')}
					<li>
						<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="about" op="contact"}">
							{translate key="about.contact"}
						</a>
					</li>
				{/if}
			</ul>
		</li>
	{/if}
</ul>	
		</div>
<!-- .container -->
</nav><!-- .pkp_structure_head -->