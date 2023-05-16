<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ecom.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

    <link href="StyleSheet1.css" rel="stylesheet" />
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-0 py-3">
  <div class="container-xl">
    <!-- Logo -->
    <a class="navbar-brand" href="#">
      <img src="https://preview.webpixels.io/web/img/logos/clever-light.svg" class="h-8" alt="...">
    </a>
    <!-- Navbar toggle -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <!-- Collapse -->
    <div class="collapse navbar-collapse" id="navbarCollapse">
      <!-- Nav -->
      <div class="navbar-nav mx-lg-auto">
        <a class="nav-item nav-link active" href="#" aria-current="page">Home</a>
        <a class="nav-item nav-link" href="#">Product</a>
        <a class="nav-item nav-link" href="#">Features</a>
        <a class="nav-item nav-link" href="#">Pricing</a>
      </div>
      <!-- Right navigation -->
      <div class="navbar-nav ms-lg-4">
        <a class="nav-item nav-link" href="#">Sign in</a>
      </div>
      <!-- Action -->
      <div class="d-flex align-items-lg-center mt-3 mt-lg-0">
        <a href="#" class="btn btn-sm btn-primary w-full w-lg-auto">
          Register
        </a>
      </div>
    </div>
  </div>
</nav>

<div class="p-10 bg-surface-secondary">
  <div class="mb-8 text-center">
    <h3 class="mb-2">Crafted with <a href="https://github.com/webpixels/css" target="_blank">Webpixels CSS</a></h3>
    <p>The design system for Bootstrap 5</p>
  </div>
  <div class="mt-8 text-center">
    <a href="https://webpixels.io/components?ref=codepen" class="text-warning" target="_blank">Browse all components -></a>
  </div>
</div>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
