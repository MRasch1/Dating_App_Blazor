using Employee_Crud_Blazor.Context;
using Employee_Crud_Blazor.Data;
using Employee_Crud_Blazor.Pages;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddServerSideBlazor();
//De tre linjer nedenunder bliver lavet i forhold dependency injection. Scoped betyder at der bliver lavet en instans af servicen.
//Et scope er normalt den tid en bruger er på en side (page), når en bruger navigere til en ny side bliver der lavet en ny instans af servicen.
builder.Services.AddScoped<UsersService>();
builder.Services.AddScoped<UserProfileService>();
builder.Services.AddScoped<LikesService>();


//Connection to the Database

builder.Services.AddDbContext<ApplicationDbContext>(item => item.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();

app.UseStaticFiles();

app.UseRouting();

app.MapBlazorHub();
app.MapFallbackToPage("/_Host");

app.Run();
