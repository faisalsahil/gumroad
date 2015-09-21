$(document).ready(function() {

    // doublick textarea select
    $("#txtAmazondesc").dblclick(function () {
        $(this).focus();
        $(this).select();
    });

    // Hide an action when delete it 
  $('.btn.btn-danger.action').on('ajax:success', function() {
    $(this).parent().next().val('true');
    $(this).parent().fadeOut();
    $(this).parent().remove();
  });


    $("button", "div.btn-group").click(function(e) {
        var $this, hiddenInput;
        e.preventDefault();
        $this = $(this);
        hiddenInput = $this.parent().next();
        if ($this.val() === "1") {
            hiddenInput.val("1");
            if (hiddenInput.attr("class") === "hidden-double-opt-in") {
                return hiddenInput.parent().next().fadeOut(400);
            }
        } else {
            hiddenInput.val("0");
            if (hiddenInput.attr("class") === "hidden-double-opt-in") {
                return hiddenInput.parent().next().fadeIn(400);
            }
        }
    });

    $("button.msg").click(function(e) {
        var $this, hiddenInput;
        e.preventDefault();
        $this = $(this);
        hiddenInput = $this.parent().next();
        if ($this.val() === "msg") {
            hiddenInput.val("msg");
            if (hiddenInput.attr("class") === "hidden-double-opt-in") {
                return hiddenInput.parent().next().fadeOut(400);
            }
        } else {
            hiddenInput.val("url");
            if (hiddenInput.attr("class") === "hidden-double-opt-in") {
                return hiddenInput.parent().next().fadeIn(400);
            }
        }
    });

    $('button.optin').click(function(){
        var optin = $(this).val();
        if(optin == 0){
            $('#welcome').show();
        }else if(optin == 1){
            $('#welcome').hide();
            $('#myform_welcome').val('0');
        }
    });

    $('button.msg').click(function(){
        var optin = $(this).val();
        if(optin == 'msg'){

            $('#msg-url').hide();
            $("#input-url").attr("disabled", "disabled");
            $('#msg-txt').show();
            $("#input-msg").removeAttr("disabled");

        }else if(optin == 'url'){

            $('#msg-url').show();
            $("#input-url").removeAttr("disabled");
            $('#msg-txt').hide();
            $("#input-msg").attr("disabled", "disabled");
        }
    });

    $('#creatForm').click(function(event) {
        // event.preventDefault();
        $('#section1').toggle('slow');
    });

    $('#creatAction').click(function(event) {
        // event.preventDefault();
        $('#section2').toggle('slow');
    });

    $('#myform_listid').change(function(){
        var id = $(this).val();

        if(id != 0){
            $('#action_list').empty();
            $('#fields-groups').show();
            $('#add-group').html('<option value="">Select Grouping</option>');
            $('#remove-group').empty();
            $('div.item').remove();
            // $('#fields-rows tbody').html('<img src="/assets/ajax-loader.gif">');
            $.ajax({
                type: "POST",
                url: '/myforms/' + id + '/field',
                success : function(data1){
                    $('#fields-rows tbody').empty();
                    if(data1){
                        var i = 0;
                        $.each(data1, function(merges) {
                            console.log(data1[merges].name, "-", data1[merges].tag, "-",data1[merges].req, data1[merges].choices);
                            var html = '<tr>';
                            // html += '<td>'+data1[merges].name+'</td>';
                            if(data1[merges].req == true){
                                html += '<td>'+data1[merges].name+'<input type ="hidden" value="'+ data1[merges].name +'" name="myform[fields_attributes]['+i+'][name]"><input type ="hidden" value="'+ data1[merges].field_type +'" name="myform[fields_attributes]['+i+'][field_type]"><input type ="hidden" value="'+ data1[merges].choices +'" name="myform[fields_attributes]['+i+'][choices]"></td>';
                                html += '<td>Y<input type ="hidden" value ="Y" name="myform[fields_attributes]['+i+'][req]"></td>';
                            if (data1[merges].tag == "EMAIL"){     
                                html += '<td><input type="checkbox" id="disabledInput" onclick="return false;" readOnly="true" checked="checked" name="myform[fields_attributes]['+i+'][tag]" value='+ data1[merges].tag +'></td>';
                            }else{
                              html += '<td><input type="checkbox" id="disabledInput" readOnly="true" checked="checked" name="myform[fields_attributes]['+i+'][tag]" value='+ data1[merges].tag +'></td>';  
                            }
                            }else{
                                html += '<td>'+data1[merges].name+'<input type ="hidden" value="'+ data1[merges].name +'" name="myform[fields_attributes]['+i+'][name]"><input type ="hidden" value="'+ data1[merges].field_type +'" name="myform[fields_attributes]['+i+'][field_type]"><input type ="hidden" value="'+ data1[merges].choices +'" name="myform[fields_attributes]['+i+'][choices]"></td>';
                                html += '<td>N<input type ="hidden" value ="N" name="myform[fields_attributes]['+i+'][req]"></td>';
                                if (data1[merges].tag == "EMAIL"){     
                                html += '<td><input type="checkbox" id="disabledInput" onclick="return false;" readOnly="true" checked="checked" name="myform[fields_attributes]['+i+'][tag]" value='+ data1[merges].tag +'></td>';
                            }else{
                              html += '<td><input type="checkbox" id="disabledInput" name="myform[fields_attributes]['+i+'][tag]" value='+ data1[merges].tag +'></td>';  
                            }
                            }
                            html += '</tr>'

                            $('#fields-rows tbody').append(html); // hide the loading message
                            i++;
                        })
                    }
                },
                dataType: 'json'
            });

            // $('#groups').html('<img src="/assets/ajax-loader.gif">');
            $.ajax({
                type: "POST",
                url: '/myforms/' + id + '/group',
                success : function(data){
                    $('#groups-rows tbody').empty();
                    if(data != 0){
                        var i = 0;
                        $.each(data, function(groups) {
                            var html = '<tr>';
                            // html += '<td>'+data[groups].name+'</td>';
                            html += '<td>'+data[groups].name+'<input type ="hidden" value="'+ data[groups].name +'" name="myform[groups_attributes]['+i+'][groupName]"></td>';
                            // var html = '<label class="checkbox">';
                            html += '<td><input type="checkbox" name="myform[groups_attributes]['+i+'][groupid]" value="'+ data[groups].id +'"></td>';
                            html += '</tr>'
                            var html1 = '<option value="'+data[groups].id+'">'+data[groups].name+'</option>';
                            $('.groups').show();
                            // $('.groups label').show();
                            $('#groups-rows tbody').append(html); // hide the loading message
                            $('#add-group').append(html1);
                            i++;
                        })
                    }
                    else{
                        $('.groups').hide();
                    }
                },
                dataType: 'json'
            });

            $.ajax({
                type: "POST",
                url: '/myforms/' + id + '/segment',
                success : function(data){
                    $('#segments').empty();
                    if(data){
                        $.each(data, function(segments) {
                            // var html = '<tr>';
                            // html += '<td>'+data[segments].name+'</td>';
                            // // var html = '<label class="checkbox">';
                            // html += '<td><input type="checkbox" name="fields" value="'+ data[segments].id +'"</td>';
                            // html += '</tr>'
                            var html1 = '<option value="'+data[segments].id+'">'+data[segments].name+'</option>';
                          // $('.groups').show();    
                          // $('#segments-rows tbody').append(html); // hide the loading message
                          $('#get_segment').append(html1);
                        })
                    }

                },
                dataType: 'json'
            });

            $('select#myform_listid option').each(function() {
                var current_list = $('#myform_listid').find(":selected").val();
                if($(this).val() != current_list){
                    var html = '<option value="'+$(this).val()+'">'+$(this).text()+'</option>';
                    $('#action_list').append(html);
                }
            });
        }
    });

    $('#groups input[type=checkbox]').change(function() {
        if(this.checked) {
            $(this).next().val('false');
        }else{
            $(this).next().val('true');
        }
    });
    $('#fields input[type=checkbox]').change(function() {
        if(this.checked) {
            $(this).next().val('false');
        }else{
            $(this).next().val('true');
        }
    });
});

function addAction(){
    var row_count = $('input[name=row_count]').last().val();
    var num = row_count.split(',');
    var i = num[1];

    var g = parseInt(i) + 1;
    var data = $('.action').first().html();

    data = data.replace("actionslist", "actionslist"+g);
    data = data.replace("loadMoreActions()", "loadMoreActions('"+g+"',$(this).val())");
    data = data.replace("loadGroups()", "loadGroups('"+g+"',$(this).val())");
    data = data.replace("select_action", "myform[actions_attributes]["+g+"][action]");
    data = data.replace("select_grouping", "myform[actions_attributes]["+g+"][grouping]");
    data = data.replace("add-group", "add-group"+g);
    data = data.replace("add-intrest-group", "add-intrest-group"+g);
    data = data.replace("select_group", "myform[actions_attributes]["+g+"][group]");
    data = data.replace("select_segment", "myform[actions_attributes]["+g+"][segment]");
    data = data.replace("action_list", "action_list"+g);
    data = data.replace("select_list", "myform[actions_attributes]["+g+"][remove_list]");
    data = data.replace("get_template", "get_template"+g);
    data = data.replace("get_segment", "get_segment"+g);
    data = data.replace("select_template", "myform[actions_attributes]["+g+"][template]");
    data = data.replace('row,0', 'row,'+g);
    var html = '<div class="fields rule-fields action item" id= "row'+g+'">';
    html += data;
    html += '</div>';
    $('#actions').append(html);
}

function addEditAction(){
    var row_count = $('input[name=row_count]').last().val();
    var num = row_count.split(',');
    var i = num[1];

    var g = parseInt(i) + 1;
    var data = $('.action').first().html();

    data = data.replace("actionslist", "actionslist"+g);
    data = data.replace("loadMoreActions()", "loadMoreActions('"+g+"',$(this).val())");
    data = data.replace("loadGroups()", "loadGroups('"+g+"',$(this).val())");
    data = data.replace("select_action", "myform[actions_attributes]["+g+"][action]");
    data = data.replace("select_grouping", "myform[actions_attributes]["+g+"][grouping]");
    data = data.replace("add-group", "add-group"+g);
    data = data.replace("add-intrest-group", "add-intrest-group"+g);
    data = data.replace("select_group", "myform[actions_attributes]["+g+"][group]");
    data = data.replace("select_segment", "myform[actions_attributes]["+g+"][segment]");
    data = data.replace("action_list", "action_list"+g);
    data = data.replace("select_list", "myform[actions_attributes]["+g+"][remove_list]");
    data = data.replace("get_template", "get_template"+g);
    data = data.replace("get_segment", "get_segment"+g);
    data = data.replace("select_template", "myform[actions_attributes]["+g+"][template]");
    data = data.replace('row,0', 'row,'+g);
    var html = '<div class="fields rule-fields action item" id= "row'+g+'">';
    html += data;
    html += '</div>';
    $('#actions').append(html);
}

function loadMoreActions(i,val){
    if(val == "add_group" || val == "remove_group"){
        $('.empty_msg'+i).remove();
        var len = $('select#add-group option').length;
        if(len == '1'){
            $('<span class="empty_msg'+i+' empty_error alert alert-error">No Groups Found</span>').insertAfter($('#actionslist'+i));
            $('#actionslist'+i).attr('name', null)
        }else{
            $('#add-group'+i).show();
            $('#actionslist'+i).attr('name', "myform[actions_attributes]["+i+"][action]")
            $('#add-intrest-group'+i).show();
        }
        $('#dmandrill').hide();
        $('#get_segment'+i).hide();
        $('#action_list'+i).hide();
        $('#get_template'+i).hide();

    }else if(val == "add_segments"){

        $('.empty_msg'+i+'').remove();
        var lenSeg = $('select#get_segment option').length;

        if(lenSeg == '1'){
            $('<span class="empty_msg'+i+' empty_error alert alert-error">No segments found for this list.</span>').insertAfter($('#actionslist'+i));
            $('#actionslist'+i).attr('name', null)
        }else{
            $('#actionslist'+i).attr('name', "myform[actions_attributes]["+i+"][action]")
            $('#get_segment'+i).show();
        }

        $('#dmandrill').hide();
        $('#add-group'+i).hide();
        $('#add-intrest-group'+i).hide();
        $('#action_list'+i).hide();
        $('#get_template'+i).hide();

    }else if(val == "remove_list"){
        $('#actionslist'+i).attr('name', "myform[actions_attributes]["+i+"][action]")
        $('.empty_msg'+i+'').remove();
        $('#dmandrill').hide();
        $('#add-group'+i).hide();
        $('#add-intrest-group'+i).hide();
        $('#get_segment'+i).hide();
        $('#action_list'+i).show();
        $('#get_template'+i).hide();

    }else if(val == "send_template"){
        $('#actionslist'+i).attr('name', "myform[actions_attributes]["+i+"][action]")
        $('.empty_msg'+i+'').remove();
        $('#dmandrill').show();
        $('#add-group'+i).hide();
        $('#add-intrest-group'+i).hide();
        $('#get_segment'+i).hide();
        $('#action_list'+i).hide();
        $('#get_template'+i).show();

    }else if(val == ''){
        $('#actionslist'+i).attr('name', "myform[actions_attributes]["+i+"][action]")
        $('.empty_msg'+i+'').remove();
        $('#dmandrill').hide();
        $('#add-group'+i).hide();
        $('#add-intrest-group'+i).hide();
        $('#get_segment'+i).hide();
        $('#action_list'+i).hide();
        $('#get_template'+i).hide();
    }
}

function loadGroups(i, val){
    var id = val;
    if(id != ''){
        $('#add-intrest-group'+i).empty();
        $('#add-intrest-group'+i).html('<option value="">Select Group</option>');
        var list = $('#myform_listid').find(":selected").val();
        $.ajax({
            type: "POST",
            url: '/myforms/load_groups?id='+id+'&list='+list,
            success : function(data1){
                $.each(data1, function(groups) {
                    var html = '<option value="'+data1[groups].name+'">'+data1[groups].name+'</option>';
                    $('#add-intrest-group'+i).append(html);
                });
            },
            dataType: 'json'
        });
    }
}

// function insert_group(val,text){
//     var array = val.split(',');
//     var len = $('select#add-group option').length;

//     if(len != 0){
//         var arr = new Array()
//         $('select#add-group option').each(function() {
//             arr.push ( $(this).text());
//         });
//         var exist = $.inArray(text , arr);
//         if(exist > -1){
//             $('select#add-group option[value="'+val+'"]').remove();
//         }else if(exist == -1){
//             var html = '<option value="'+val+'">'+text+'</option>';
//             $('#add-group').append(html);
//         }
//         // if(array[1] == text){
//         //   $(this).remove();
//         // }else{
//         //   var html = '<option value="'+val+'">'+array[1]+'</option>';
//         //   $('#add-group').append(html);
//         //   $('#remove-group').append(html);
//         // }

//     }else{
//         var html = '<option value="'+val+'">'+text+'</option>';
//         $('#add-group').append(html);
//     }
// } 

