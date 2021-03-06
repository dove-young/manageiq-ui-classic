class ApplicationHelper::Toolbar::MiqGroupsCenter < ApplicationHelper::Toolbar::Basic
  button_group('rbac_group_vmdb', [
    select(
      :rbac_group_vmdb_choice,
      nil,
      t = N_('Configuration'),
      t,
      :items => [
        button(
          :rbac_group_add,
          'pficon pficon-add-circle-o fa-lg',
          t = N_('Add a new Group'),
          t),
        button(
          :rbac_group_edit,
          'pficon pficon-edit fa-lg',
          N_('Select a single Group to edit'),
          N_('Edit the selected Group'),
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1",
          :klass        => ApplicationHelper::Button::RbacGroupEdit),
        button(
          :rbac_group_delete,
          'pficon pficon-delete fa-lg',
          N_('Select one or more Groups to delete'),
          N_('Delete selected Groups'),
          :url_parms    => "main_div",
          :send_checked => true,
          :confirm      => N_("Delete all selected Groups?"),
          :enabled      => false,
          :onwhen       => "1+"
        ),
        separator,
        button(
          :rbac_group_seq_edit,
          'pficon pficon-edit fa-lg',
          t = N_('Edit Sequence of User Groups for LDAP Look Up'),
          t),
      ]
    ),
  ])
  button_group('rbac_group_policy', [
    select(
      :rbac_group_policy_choice,
      nil,
      t = N_('Policy'),
      t,
      :enabled => false,
      :onwhen  => "1+",
      :items   => [
        button(
          :rbac_group_tags_edit,
          'pficon pficon-edit fa-lg',
          t = proc do
            _('Edit \'%{customer_name}\' Tags for the selected Groups') % {:customer_name => @view_context.session[:customer_name]}
          end,
          t,
          :url_parms    => "main_div",
          :send_checked => true,
          :enabled      => false,
          :onwhen       => "1+"),
      ]
    ),
  ])
end
