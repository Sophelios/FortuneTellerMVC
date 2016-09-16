using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FortuneTellerMVC.Models;

namespace FortuneTellerMVC.Controllers
{
    public class CustomersController : Controller
    {
        private FortuneTellerMVCEntities db = new FortuneTellerMVCEntities();

        // GET: Customers
        public ActionResult Index()
        {
            var customers = db.Customers.Include(c => c.BMonth).Include(c => c.FavColor).Include(c => c.NumOfSib);
            return View(customers.ToList());
        }

        // GET: Customers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            if (customer.Age % 2 == 0)
            {
                ViewBag.NumberOfYears = 20;
            }
            else
            {
                ViewBag.NumberOfYears = 35;
            }

            //if (customer.NumOfSib.NumOfSibs1 == "0")
            //{
            //    ViewBag.RetireLoc = "The North";
            //}
            //else if (customer.NumOfSib.NumOfSibs1 == "1")
            //{
            //    ViewBag.RetireLoc = "Avenger's Tower";
            //}
            //else if (customer.NumOfSib.NumOfSibs1 == "2")
            //{
            //    ViewBag.RetireLoc = "Ilvermorny";
            //}
            //else if (customer.NumOfSib.NumOfSibs1 == "3")
            //{
            //    ViewBag.RetireLoc = "Casterly Rock";
            //}
            //else
            //{
            //    ViewBag.RetireLoc = "Hogwarts";
            //}

            if ((customer.FirstName.ToUpper().IndexOf(customer.BMonth.BMonth1.ToUpper()[0]) > 0) || (customer.LastName.ToUpper().IndexOf(customer.BMonth.BMonth1.ToUpper()[0]) > 0))
            {
                ViewBag.RetWith = 1000000;
            }
            else if ((customer.FirstName.ToUpper().IndexOf(customer.BMonth.BMonth1.ToUpper()[1]) > 0) || (customer.LastName.ToUpper().IndexOf(customer.BMonth.BMonth1.ToUpper()[1]) > 0))
            {
                ViewBag.RetWith = 9999999;
            }
            else if ((customer.FirstName.ToUpper().IndexOf(customer.BMonth.BMonth1.ToUpper()[2]) > 0) || (customer.LastName.ToUpper().IndexOf(customer.BMonth.BMonth1.ToUpper()[2]) > 0))
            {
                ViewBag.RetWith = 10;
            }
            else
            {
                ViewBag.RetWith = 61531325;
            }

            return View(customer);
        }

        // GET: Customers/Create
        public ActionResult Create()
        {
            ViewBag.BMonthID = new SelectList(db.BMonths, "BMonthID", "BMonth1");
            ViewBag.FavColorID = new SelectList(db.FavColors, "FavColorID", "FavColor1");
            ViewBag.NumOfSibsID = new SelectList(db.NumOfSibs, "NumOfSibsID", "NumOfSibs1");
            return View();
        }

        // POST: Customers/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CustomerID,FirstName,LastName,Age,BMonthID,FavColorID,NumOfSibsID")] Customer customer)
        {

            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Details", new { id = customer.CustomerID });
            }

            ViewBag.BMonthID = new SelectList(db.BMonths, "BMonthID", "BMonth1", customer.BMonthID);
            ViewBag.FavColorID = new SelectList(db.FavColors, "FavColorID", "FavColor1", customer.FavColorID);
            ViewBag.NumOfSibsID = new SelectList(db.NumOfSibs, "NumOfSibsID", "NumOfSibs1", customer.NumOfSibsID);
            return View(customer);
        }

        // GET: Customers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.BMonthID = new SelectList(db.BMonths, "BMonthID", "BMonth1", customer.BMonthID);
            ViewBag.FavColorID = new SelectList(db.FavColors, "FavColorID", "FavColor1", customer.FavColorID);
            ViewBag.NumOfSibsID = new SelectList(db.NumOfSibs, "NumOfSibsID", "NumOfSibs1", customer.NumOfSibsID);
            return View(customer);
        }

        // POST: Customers/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CustomerID,FirstName,LastName,Age,BMonthID,FavColorID,NumOfSibsID")] Customer customer)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BMonthID = new SelectList(db.BMonths, "BMonthID", "BMonth1", customer.BMonthID);
            ViewBag.FavColorID = new SelectList(db.FavColors, "FavColorID", "FavColor1", customer.FavColorID);
            ViewBag.NumOfSibsID = new SelectList(db.NumOfSibs, "NumOfSibsID", "NumOfSibs1", customer.NumOfSibsID);
            return View(customer);
        }

        // GET: Customers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        // POST: Customers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
