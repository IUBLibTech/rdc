$(function() {
    discs_for_link_ordered_lists();
});

function discs_for_link_ordered_lists() {
    let unordered = [];

    unordered.push($(".attribute-domain_subject").parent());
    unordered.push($(".attribute-holding_location").parent());
    unordered.push($(".attribute-campus").parent());
    unordered.push($(".attribute-rights_statement").parent());
    unordered.push($(".attribute-title").parent());
    unordered.push($(".attribute-expert").parent());

    unordered.forEach((item, index) => {
        item.addClass("ul-links");
    });
}
