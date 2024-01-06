{**
 * templates/frontend/components/navigationMenu.tpl
 *
 * Copyright (c) 2014-2017 Simon Fraser University
 * Copyright (c) 2003-2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Customized and modified is copyrighted to Hasan Syaiful Rizal, copyright 2020
 * For more information, please contact hsr@yudharta.ac.id or visit hsr-share.blogspot.com
 * 
 * @brief Primary navigation menu list for OJS
 *
 * @uses navigationMenu array Hierarchical array of navigation menu item assignments
 * @uses id string Element ID to assign the outer <ul>
 * @uses ulClass string Class name(s) to assign the outer <ul>
 * @uses liClass string Class name(s) to assign all <li> elements
 *}

{if $navigationMenu}
	{* navigation Primary *}
    {if $id|escape == "navigationPrimary"}
	<ul id="{$id|escape}" class="{$ulClass|escape}">
		<li class="nav-item">
			<a class="nav-link" href="{url page="index"}">{translate key="plugins.themes.EpsilonTheme.home"}</a>
		</li>
		{foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
			{if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
				{continue}
			{/if}
			{if !empty($navigationMenuItemAssignment->children)}
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                </a>
                <ul class="dropdown-menu">
					{foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
					{if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                    <li>
						<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                        </a>
					</li>
                    {/if}
                    {/foreach}
				</ul>
			</li>
            {else}
			<li class="nav-item">
				<a class="nav-link" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</a>
			</li>
			{/if}
		{/foreach}
	</ul>
	{/if}
        
    {if $id|escape == "navigationUser"}
        <ul id="{$id|escape}" class="{$ulClass|escape}">
            {foreach key=field item=navigationMenuItemAssignment from=$navigationMenu->menuTree}
                {if !$navigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                    {continue}
                {/if}
                {if !empty($navigationMenuItemAssignment->children)}
					<div class="dropdown-center">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-lg-end">
                            {foreach key=childField item=childNavigationMenuItemAssignment from=$navigationMenuItemAssignment->children}
                                {if $childNavigationMenuItemAssignment->navigationMenuItem->getIsDisplayed()}
                                    <li>
									<a class="dropdown-item" href="{$childNavigationMenuItemAssignment->navigationMenuItem->getUrl()}">
                                        {$childNavigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}
                                    </a>
									</li>
                                {/if}
                            {/foreach}
                        </ul>
                    </li>
					</div>
                {else}
                    <li class="nav-item">
                        <a class="nav-link" href="{$navigationMenuItemAssignment->navigationMenuItem->getUrl()}">{$navigationMenuItemAssignment->navigationMenuItem->getLocalizedTitle()}</a>
                    </li>
                {/if}
            {/foreach}
        </ul>
    {/if}
	
	
{/if}
