<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-group col-12 row" method="GET" action="books.jsp" style="margin-top: 1rem;">
    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-12">
        <input class="form-control" type="search" name="search_string" placeholder="Search">
    </div>
    <div class="col-xl-2 col-lg-2 col-md-2 col-sm-6 my-2 my-md-0">
        <select class="custom-select" name="search_option" style="width: 100%;">
            <option selected value="Author">Author</option>
            <option value="Title">Title</option>
        </select>
    </div>
    <div class="col-xl-2 col-lg-2 col-md-2 col-sm-6">
        <button class="btn btn-outline-success my-2 my-md-0" type="submit" style="width: 100%;">Search</button>
    </div>
</form>
