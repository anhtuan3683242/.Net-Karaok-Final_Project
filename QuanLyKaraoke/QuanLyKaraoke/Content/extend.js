
//DATE TIME SETTING
$(document).ready(function () {
    //SET DATE NAVBAR
    document.getElementById("date_time").innerHTML = moment().format('MMMM Do YYYY, h:mm:ss a');;
    //Set date time field
    $("#min").val(moment().format('DD MMM YYYY'));
    $("#max").val(moment().add(1, 'days').format('DD MMM YYYY'));

});


//Set date time field
var today = new Date();

//set curr date
var dd = String(today.getDate()).padStart(2, '0');

var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();
var hh = today.getHours();
var mn = today.getMinutes();

//currdate
today = yyyy + '-' + mm + '-' + dd + ' ' + hh + ':' + mn;
$('.currdate').datetimepicker({
    step: 30,
    value: today
});



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

//delete room


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
    console.log('adada');
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
