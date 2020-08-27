$(document).ready(function () {
    $("#all-input").change(function () {
        if ($(this).is(":checked")) {
            $(".trash tbody tr input").prop("checked", true);
        } else {
            $(".trash tbody tr input").prop("checked", false);
        }
    });

    $("#inputGroupFile01").change(function () {
        $(this)
            .siblings("label")
            .text($(this)[0].files.length + " files");
    });
    $("#inputGroupFile02").change(function () {
        $(this)
            .siblings("label")
            .text($(this)[0].files.length + " files");
    });

    $("#add").click(function () {
        add_variant();
    });

    $(".remove_variant").click(function () {
        remove_variant($(this));
    });

    $(".update-variant").click(function () {
        $("#update").remove();
        $("#add").remove();

        $(".popup").append(
            '<div class="text-center"><a class="btn btn-primary" id="update" type="submit">Cập nhập</a></div>'
        );

        update_variant($(this));
    });

    $(".openvariant").click(function () {
        $("#id_product").attr("data-id", $(this).attr("data-id"));
        $("#name_table_son").attr(
            "data-name",
            ".table-son".concat($(this).attr("data-id"))
        );
        $name = ".variant".concat($(this).attr("data-id"));
        $(".variant").css("display", "none");
        $($name).slideToggle();
    });

    $(".offvariant").click(function () {
        $(".variant").css("display", "none");
    });

    // input name color // lặp code viết lại hàm chung xài chung
    $i = 0;
    $value = "";
    $("#input-color").change(function () {
        if (!$(".box-input-inner").text().includes($(this).val())) {
            $i++;
            $(".box-input-inner").append(
                "<div class=" + "span" + $i + ">  </div>"
            );

            $(".span" + $i).html(
                $(this).val() +
                    "<span class='d-none'>;</span>" +
                    "<span  class='close-span ml-2 font-weight-bold'><span class='fa fa-close'></span></span>"
            );
            $(this).val("");

            // chuỗi dài
            $value += $(".span" + $i).text();
            $("#input-color-hidden").val($value);
            console.log($value);

            $(".close-span").click(function () {
                $value = $value.replace($(this).parent("div").text(), "");
                $(this).parent("div").remove();
                $("#input-color-hidden").val($value);
                console.log($value);
            });
        } else {
            $(this).val("");
        }
    });

    $k = 0;
    $value1 = "";
    $("#input-color1").change(function () {
        if (!$(".box-input-inner1").text().includes($(this).val())) {
            $k++;
            $(".box-input-inner1").append(
                "<div class=" + "span1" + $k + ">  </div>"
            );

            $(".span1" + $k).html(
                $(this).val() +
                    "<span class='d-none'>;</span>" +
                    "<span  class='close-span1 ml-2 font-weight-bold'><span class='fa fa-close'></span></span>"
            );
            $(this).val("");

            // chuỗi dài
            $value1 += $(".span1" + $k).text();
            $("#input-color-hidden1").val($value1);

            $(".close-span1").click(function () {
                $value1 = $value1.replace($(this).parent("div").text(), "");
                $(this).parent("div").remove();
                $("#input-color-hidden1").val($value1);
            });
        } else {
            $(this).val("");
        }
    });

    $("#submit").click(function () {
        $(this).attr("type", "submit");
    });

    $("#name_category").change(function () {
        $("#uri_category").val(xoa_dau($(this).val()).replace(" ", "-"));
    });
});

function xoa_dau(str) {
    str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
    str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
    str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
    str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
    str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
    str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
    str = str.replace(/đ/g, "d");
    str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, "A");
    str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, "E");
    str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, "I");
    str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, "O");
    str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, "U");
    str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, "Y");
    str = str.replace(/Đ/g, "D");
    return str;
}

function remove_variant($obj) {
    // đang hiển thị thằng table-son nào
    var table_son = $("#name_table_son").attr("data-name");
    $.ajax({
        url: "/remove-variant",
        type: "get",
        dataType: "json",
        data: {
            id: $obj.attr("data-id"),
        },
    })
        .done((data) => {
            if (data.update == 1) {
                // xóa cái tr của nút xóa
                $obj.parent("td").parent("tr").remove();
                // bật no-data khi xóa hết variant
                if ($(table_son.concat(" tbody tr")).length < 2) {
                    $(table_son.concat(" tbody .no-data")).removeClass(
                        "d-none"
                    );
                }
            } else {
                console.log("thất bại laravel");
            }
        })
        .fail(function () {
            console.log("thất bại vì ko có dữ liệu");
        });
}

function add_variant() {
    var table_son = $("#name_table_son").attr("data-name");
    $.ajax({
        url: "/add-variant",
        type: "get",
        dataType: "json",
        data: {
            id_product: $("#id_product").attr("data-id"),
            color: $("#color").val(),
            size: $("#size").val(),
            price: $("#price").val(),
            price_market: $("#price_market").val(),
        },
    })
        .done((data) => {
            if (data.update == 1) {
                // tắt no-data mặc định save thành công
                $("#add").remove();
                $("#update").remove();

                $(table_son.concat(" .no-data")).addClass("d-none");
                $(table_son.concat(" tbody")).append(`<tr>
                        <td>${data.color}</td>
                        <td>${data.size}</td>
                        <td>${data.price}</td>
                        <td>${data.price_market}</td>
                        <td></td>
                        <td>
                            <a class="btn btn-primary update_variant" data-id="${data.id_variant}" href="#">Cập nhập</a>
                            <a class="btn btn-primary remove_variant" data-id="${data.id_variant}" href="#">Xóa</a>
                        </td>
                        </tr>`);

                // hãy viết lại hàm remove_variant vì đang trong hàm xử lý
                $(".remove_variant").click(function () {
                    remove_variant($(this));
                });

                $(".update_variant").click(function () {
                    $(".popup").append(
                        '<div class="text-center"><a class="btn btn-primary" id="update" type="submit">Cập nhập</a></div>'
                    );
                    update_variant($(this));
                });
                off_box();
            } else {
                $(".msg").removeClass("d-none");
            }
        })
        .fail(() => {
            console.log("thất bại");
        });
}

function updated_variant($obj) {
    $.ajax({
        url: "/updated-variant",
        type: "get",
        dataType: "json",
        data: {
            id: $obj.attr("data-id"),
            color: $("#color").val(),
            size: $("#size").val(),
            price: $("#price").val(),
            price_market: $("#price_market").val(),
        },
    })
        .done((data) => {
            if (data.update == 1) {
                console.log("update thành công");
                $("#update").remove();
                $("#add").remove();
                // xóa popup khi update thành công
                $(".popup").addClass("d-none");

                $("#color").val("");
                $("#size").val("");
                $("#price").val("");
                $("#price_market").val("");

                // HIển thị sau khi update
                tr = $obj.parent("td").parent("tr");

                tr.children("td:nth-child(1)").text(data.variant.color);
                tr.children("td:nth-child(2)").text(data.variant.size);
                tr.children("td:nth-child(3)").text(
                    data.variant.price
                        .toString()
                        .replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " VND"
                );
                tr.children("td:nth-child(4)").text(
                    data.variant.price_market
                        .toString()
                        .replace(/\B(?=(\d{3})+(?!\d))/g, ",") + " VND"
                );

                $("#add").click(function () {
                    $("#update").remove();
                });
            } else {
                $(".msg").removeClass("d-none");
            }
        })
        .fail(() => {
            console.log("thất bại");
        });
}

function update_variant($obj) {
    var table_son = $("#name_table_son").attr("data-name");
    $.ajax({
        url: "/update-variant",
        type: "get",
        dataType: "json",
        data: {
            id: $obj.attr("data-id"), // id_variant
        },
    })
        .done((data) => {
            if (data.update == 1) {
                $(".popup").removeClass("d-none");
                console.log(data.variant);
                // reset lại form input
                $("#color").val(data.variant.color);
                $("#size").val(data.variant.size);
                $("#price").val(data.variant.price);
                $("#price_market").val(data.variant.price_market);

                $("#update").click(function () {
                    updated_variant($obj);
                });
            } else {
                console.log("thất bại laravel");
            }
        })
        .fail(() => {
            console.log("thất bại");
        });
}

function off_box() {
    $(".popup").addClass("d-none");
    $("#update").remove();
    $("#add").remove();
    // reset lại form input
    $("#color").val("");
    $("#size").val("");
    $("#price").val("");
    $("#price_market").val("");
}

function open_box() {
    $("#update").remove();
    $("#add").remove();

    $(".popup").removeClass("d-none");

    $(".popup").append(
        '<div class="text-center"><a class="btn btn-primary"  id="add" type="submit">Thêm</a></div>'
    );

    $("#add").click(function () {
        $("#update").remove();
        add_variant();
    });
}
