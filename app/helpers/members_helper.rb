module MembersHelper
  
  # Returns the HTML of a second-level title and links to edit the member.

  def member_title_links(member)
    content_tag :h1 do
      [ link_to_icon('show', member),
        link_to_icon('edit', edit_member_path(member)),
        link_to_icon('destroy', member, {
          :confirm => 'Are you sure?',
          :method => :delete
        })
      ].join(' ').html_safe
    end
  end
  
end
