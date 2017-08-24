<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="form-group col-12 row" method="GET" action="books.jsp" style="margin-top: 1rem;">
    <div class="col-8">
        <input class="form-control" type="search" name="search_string" placeholder="Search">
    </div>
    <div class="col-2">
        <select class="custom-select" name="search_option" style="width: 100%;">
            <option selected value="Author">Author</option>
            <option value="Title">Title</option>
        </select>
    </div>
    <div class="col-2">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="width: 100%;">Search</button>
    </div>
</form>
