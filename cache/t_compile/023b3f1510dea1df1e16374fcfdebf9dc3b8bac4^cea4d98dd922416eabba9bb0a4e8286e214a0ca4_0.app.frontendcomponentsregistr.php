<?php
/* Smarty version 3.1.34-dev-7, created on 2023-12-10 03:24:16
  from 'app:frontendcomponentsregistr' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.34-dev-7',
  'unifunc' => 'content_65752f60743bb8_62142856',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'cea4d98dd922416eabba9bb0a4e8286e214a0ca4' => 
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
function content_65752f60743bb8_62142856 (Smarty_Internal_Template $_smarty_tpl) {
$_smarty_tpl->_checkPlugins(array(0=>array('file'=>'/home/u608281967/domains/cavemen.cloud/public_html/jmmb-ojstraining/lib/pkp/lib/vendor/smarty/smarty/libs/plugins/function.html_options.php','function'=>'smarty_function_html_options',),));
?>
<div class="reg-form row">

	<fieldset class="identity col-md-6">
		<h4 class="registration-heading text-start">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.profile"),$_smarty_tpl ) );?>

		</h4>
		<div class="row">
			<div class="input-group mb-3 col-md-12 given_name">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="First Name" type="text" name="givenName" id="givenName" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['givenName']->value ));?>
" maxlength="255" required aria-required="true">
					<label for="givenName" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.givenName"),$_smarty_tpl ) );?>
 <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 family_name">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="Last Name" type="text" name="familyName" id="familyName" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['familyName']->value ));?>
" maxlength="255">
					<label for="familyName" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.familyName"),$_smarty_tpl ) );?>
</label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 affiliation">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.affiliation"),$_smarty_tpl ) );?>
" type="text" name="affiliation" id="affiliation" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['affiliation']->value ));?>
" required aria-required="true">
					<label for="affiliation" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.affiliation"),$_smarty_tpl ) );?>
 <strong class="text-danger">*</strong></label>
				</div>
			</div>
						<div class="input-group mb-3 col-md-12 country">
				<div class="form-floating">
					<select class="form-select shadow-none" name="country" id="country" required aria-required="true">
						<option><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.country"),$_smarty_tpl ) );?>
</option><?php echo smarty_function_html_options(array('options'=>$_smarty_tpl->tpl_vars['countries']->value,'selected'=>$_smarty_tpl->tpl_vars['country']->value),$_smarty_tpl);?>

					</select>
					<label for="country" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.country"),$_smarty_tpl ) );?>
 <strong class="text-danger">*</strong></label>
				</div>
			</div>

		</div>
	</fieldset>

	<fieldset class="login col-md-6">
		<h4 class="registration-heading text-start">
			<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"user.login"),$_smarty_tpl ) );?>

		</h4>
		<div class="fields row">
			<div class="input-group mb-3 col-md-12 email">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.email"),$_smarty_tpl ) );?>
" type="text" name="email" id="email" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['email']->value ));?>
" maxlength="90" required aria-required="true">
					<label for="email" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.email"),$_smarty_tpl ) );?>
 <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 username">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.username"),$_smarty_tpl ) );?>
" type="text" name="username" id="username" value="<?php echo call_user_func_array($_smarty_tpl->registered_plugins[ 'modifier' ][ 'escape' ][ 0 ], array( $_smarty_tpl->tpl_vars['username']->value ));?>
" maxlength="32" required aria-required="true">
					<label for="username" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.username"),$_smarty_tpl ) );?>
 <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 password">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.password"),$_smarty_tpl ) );?>
" type="password" name="password" id="password" password="true" maxlength="32" required aria-required="true">
					<label for="password" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.password"),$_smarty_tpl ) );?>
 <strong class="text-danger">*</strong></label>
				</div>
			</div>
			<div class="input-group mb-3 col-md-12 password">
				<div class="form-floating">
					<input class="form-control shadow-none" placeholder="<?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.repeatPassword"),$_smarty_tpl ) );?>
" type="password" name="password2" id="password2" password="true" maxlength="32" required aria-required="true">
					<label for="password2" class="form-label"><?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>" user.repeatPassword"),$_smarty_tpl ) );?>
 <strong class="text-danger">*</strong></label>
				</div>
			</div>
		</div>
	</fieldset>
	<p class="pkp_screen_reader text-danger text-start"><strong class="text-danger">*</strong> <?php echo call_user_func_array( $_smarty_tpl->smarty->registered_plugins[Smarty::PLUGIN_FUNCTION]['translate'][0], array( array('key'=>"common.required"),$_smarty_tpl ) );?>
</p>
</div>
<?php }
}
