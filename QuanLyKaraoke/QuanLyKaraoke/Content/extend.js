//Default time for filter
$(document).ready(function () {
    //Set date time field
    $("#min").val(moment().format('DD MMM YYYY'));
    $("#max").val(moment().add(2, 'days').format('DD MMM YYYY'));
    $("#test").val(moment().format('YYYY/MM/DD H:mm a'));
    var StartTime = moment().format('YYYY/MM/DD H:mm a');
    var EndTime = moment().add(1, 'hours').format('YYYY/MM/DD H:mm a');
    
    $('.Starttime').datetimepicker({
        step: 30,
        value: StartTime
    });
    $('.StarttimeEdit').datetimepicker({
        step: 30,
    });
    $('.Endtime').datetimepicker({
        step: 30,
        value: EndTime
    });
    $('.EndtimeEdit').datetimepicker({
        step: 30,
    });

    
});
//Time for NAV Bar
function clockTick() {
    var currentTime = new Date(),
        month = currentTime.getMonth() + 1,
        day = currentTime.getDate(),
        year = currentTime.getFullYear(),
        hours = currentTime.getHours(),
        minutes = currentTime.getMinutes(),
        seconds = currentTime.getSeconds(),
        text = (month + "/" + day + "/" + year + ' ' + hours + ':' + minutes + ':' + seconds);
    // here we get the element with the id of "date" and change the content to the text variable we made above
    document.getElementById('date_time').innerHTML = text;
}
setInterval(clockTick, 1000);

//Delete booking function
$(document).ready(function () {
    $('.btnDel').click(function (e) {
        //bỏ tác dụng bấm mặc định
        e.preventDefault();
        var atag = $(this);
        var idBooking = $(this).attr('data');//lấy giá trị thuộc tính data(mã máy)
        if (!confirm("Do you want to cancel this Booking Order ?"))
            return;
        $.ajax(
            {
                url: '/Home/Delete/' + idBooking + '/',
                method: "post",
                success: function (data) {
                    if (data.isvalid) {
                        atag.closest('tr').remove();//Lấy thẻ tr gần với thẻ a nhất và xóa
                        return;
                    }
                    alert(data.msg);
                },
                failed: function () {

                }
            }
        );
    });
});

//Search function
$(document).ready(function () {
    $("#myInput").on("keyup", function () {
        var value = $(this).val().toLowerCase();
        $("#myTable tr").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
});

$(document).ready(function () {
        $.fn.dataTableExt.afnFiltering.push(
            function (oSettings, aData, iDataIndex) {
                var cellDate = moment(aData[0]);
                return cellDate.isBefore(moment($("#max").val())) && cellDate.isAfter(moment($("#min").val()))
            }
        );

        var oTable = $('#table-mutasi').dataTable({
            "iDisplayLength": 6,
            //"lengthChange": false,
            //"ordering": false,
            //"info": false
        });
        $('#min,#max').datepicker({
            format: "dd M yyyy",
            weekStart: 1,
            daysOfWeekHighlighted: "0",
            autoclose: true,
            todayHighlight: true
        });
        $('#min,#max').change(function () {
            oTable.fnDraw();
        });
    });
