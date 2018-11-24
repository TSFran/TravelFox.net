using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TravelFoxProject.Models;
using TravelFoxProject.Controllers;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace TravelFoxProject.Controllers
{
    public class LoginController : Controller
    {
        TravelFoxEntities db = new TravelFoxEntities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(Usuario usu)
        {
            string conexion = ConfigurationManager.ConnectionStrings["TravelFoxEntities"].ConnectionString;
            SqlConnection cn = new SqlConnection(conexion);
            string sqlquery = "select username,password from Usuario where username=@username and password=@password";
            cn.Open();
            SqlCommand sqlComm = new SqlCommand(sqlquery, cn);
            sqlComm.Parameters.Add("@username", usu.username);
            sqlComm.Parameters.Add("@password", usu.password);
            SqlDataReader dr = sqlComm.ExecuteReader();
            if (dr.Read())
            {
                Session["username"] = usu.username.ToString();
                /*return RedirectToAction("Welcome");*/
                return RedirectToAction("Index", "Home", new { area = "" });
            }
            else
            {
                ViewData["Message"] = "User login details failed";
            }
            cn.Close();
            return View();
        }
    }
}