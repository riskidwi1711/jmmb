<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-10 03:24:16
  from 'app:frontendcomponentsregistr' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65752f607546e1_18170937',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '2337a06e9cc4d931cf6ffcdfe9c920f5d6b5541a' => 
    array (
      0 => 'app:frontendcomponentsregistr',
      1 => 1702136552,
      2 => 'app',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_65752f607546e1_18170937 (Smarty_Internal_Template $_smarty_tpl) {
if (!$_smarty_tpl->tpl_vars['currentContext']->value) {?>
		<fieldset name="contexts">
		<h5 class="text-primary mt-3">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.register.contextsPrompt"),$_smarty_tpl ) );?>

		</h5>
		<div class="fields row g-3">
			<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['contexts']->value, 'context');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['context']->value) {
?>
						<?php $_smarty_tpl->_assignInScope('contextId', $_smarty_tpl->tpl_vars['context']->value->getId());?>
						<?php $_smarty_tpl->_assignInScope('isSelected', false);?>
			<div id="contextOptinGroup" class="context_optin col-lg-6">
				
					
						<div class="card card-body bg-light context">
							<h5 class="list-group-item-heading text-primary">
								<?php echo $_smarty_tpl->tpl_vars['context']->value->getLocalizedName();?>

							</h5>
							<p>
								<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.register.otherContextRoles"),$_smarty_tpl ) );?>

							</p>
							<div class="form-inline">
								<div class="form-group context_roles">
									<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['readerUserGroups']->value[$_smarty_tpl->tpl_vars['contextId']->value], 'userGroup');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['userGroup']->value) {
?>
										<?php if ($_smarty_tpl->tpl_vars['userGroup']->value->getPermitSelfRegistration()) {?>
											<?php $_smarty_tpl->_assignInScope('userGroupId', $_smarty_tpl->tpl_vars['userGroup']->value->getId());?>
										    <div class="form-check">
												<input class="form-check-input" type="checkbox" name="readerGroup[<?php echo $_smarty_tpl->tpl_vars['userGroupId']->value;?>
]"<?php if (in_array($_smarty_tpl->tpl_vars['userGroupId']->value,$_smarty_tpl->tpl_vars['userGroupIds']->value)) {?> checked="checked"<?php }?>>
												<label class="form-check-label" for="readerGroup[<?php echo $_smarty_tpl->tpl_vars['userGroupId']->value;?>
]">

													<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['userGroup']->value->getLocalizedName() ));?>

													<?php echo $_smarty_tpl->tpl_vars['userGroup']->value->getLocalizedName();?>

												</label>
											</div>
											<?php if (in_array($_smarty_tpl->tpl_vars['userGroupId']->value,$_smarty_tpl->tpl_vars['userGroupIds']->value)) {?>
												<?php $_smarty_tpl->_assignInScope('isSelected', true);?>
											<?php }?>
										<?php }?>
									<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
									<?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['reviewerUserGroups']->value[$_smarty_tpl->tpl_vars['contextId']->value], 'userGroup');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['userGroup']->value) {
?>
										<?php if ($_smarty_tpl->tpl_vars['userGroup']->value->getPermitSelfRegistration()) {?>
											<?php $_smarty_tpl->_assignInScope('userGroupId', $_smarty_tpl->tpl_vars['userGroup']->value->getId());?>
											<div class="form-check">
												<input class="form-check-input" type="checkbox" name="reviewerGroup[<?php echo $_smarty_tpl->tpl_vars['userGroupId']->value;?>
]"<?php if (in_array($_smarty_tpl->tpl_vars['userGroupId']->value,$_smarty_tpl->tpl_vars['userGroupIds']->value)) {?> checked="checked"<?php }?>>
												<label class="form-check-label" for="reviewerGroup[<?php echo $_smarty_tpl->tpl_vars['userGroupId']->value;?>
]">
													<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['userGroup']->value->getLocalizedName() ));?>

												</label>
											</div>
											<?php if (in_array($_smarty_tpl->tpl_vars['userGroupId']->value,$_smarty_tpl->tpl_vars['userGroupIds']->value)) {?>
												<?php $_smarty_tpl->_assignInScope('isSelected', true);?>
											<?php }?>
										<?php }?>
									<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
								</div>
							</div>
						</div>
			</div>
			<?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl, 1);?>
		</div>
	</fieldset>
	
		<?php if (!$_smarty_tpl->tpl_vars['enableSiteWidePrivacyStatement']->value && $_smarty_tpl->tpl_vars['context']->value->getSetting('privacyStatement')) {?>
		<div class="alert alert-info mt-3">
		<div class="checkbox context_privacy <?php if ($_smarty_tpl->tpl_vars['isSelected']->value) {?>context_privacy_visible<?php }?>">
			<div class="form-check">
				<input class="form-check-input" type="checkbox" name="privacyConsent[<?php echo $_smarty_tpl->tpl_vars['contextId']->value;?>
]" id="privacyConsent[<?php echo $_smarty_tpl->tpl_vars['contextId']->value;?>
]" value="1"<?php if ($_smarty_tpl->tpl_vars['privacyConsent']->value[$_smarty_tpl->tpl_vars['contextId']->value]) {?> checked="checked"<?php }?>>
				<label class="form-check-label" for="privacyConsent[<?php echo $_smarty_tpl->tpl_vars['contextId']->value;?>
]">
				<?php $_smarty_tpl->smarty->ext->_capture->open($_smarty_tpl, 'default', "privacyUrl", null);
echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['url'][0], array( array('router'=>@constant('ROUTE_PAGE'),'context'=>$_smarty_tpl->tpl_vars['context']->value->getPath(),'page'=>"about",'op'=>"privacy"),$_smarty_tpl ) );
$_smarty_tpl->smarty->ext->_capture->close($_smarty_tpl);?>
				<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.register.form.privacyConsentThisContext",'privacyUrl'=>$_smarty_tpl->tpl_vars['privacyUrl']->value),$_smarty_tpl ) );?>

			</div>
		</div>
		</div>
	<?php }?>
	
<?php }
}
}
