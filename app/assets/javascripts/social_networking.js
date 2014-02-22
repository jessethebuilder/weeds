function userIsSignedIntoFb(){

}

//check

function addOpenGraphTags(id, admins, title, description, type, image_url, url, site_name){
    var h = $('head');
    h.append('<meta property="fb:app_id" content="' + id + '"/>');
    h.append('<meta property="fb:admins" content="' + admins.join(',') + '"/>');
    h.append('<meta property="og:title" content="' + title + '"/>');
    h.append('<meta property="og:type" content="' + type + '"/>');
    h.append('<meta property="og:image" content="' + image_url + '"/>');
    h.append('<meta property="og:url" content="' + url + '">/');
    h.append('<meta property="og:description" content="' + description + '"/>');
    h.append('<meta property="og:site_name" content="' + site_name + '"');
}