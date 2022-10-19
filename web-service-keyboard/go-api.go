package main

import (
	"errors"
	"net/http"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
)

type Product struct {
	Id          string  `db:"id" json:"id"`
	Name        string  `db:"name" json:"name"`
	Description string  `db:"description" json:"description"`
	Price       float32 `db:"price" json:"price"`
	Image       string  `db:"image" json:"image"`
}

type Person struct {
	Email   string `db:"email" json:"email"`
	Pass    string `db:"password" json:"password"`
	Fname   string `db:"fname" json:"fname"`
	Lname   string `db:"lname" json:"lname"`
	Address string `db:"address" json:"address"`
}
type Order struct {
	Email  string `db:"per_email" json:"email"`
	OrderD string `db:"product_data" json:"o_detail"`
	OrderT string `db:"order_time" json:"time"`
}

var db *sqlx.DB

func getAllProduct() ([]Product, error) {
	query := `select id, name, price, image from product where description= "default" OR description= "default slim" `
	product := []Product{}
	err := db.Select(&product, query)
	if err != nil {
		return nil, err
	}
	return product, nil
}

func getSlimProduct() ([]Product, error) {
	query := `select id, name, price, image from product where description= "default slim" `
	product := []Product{}
	err := db.Select(&product, query)
	if err != nil {
		return nil, err
	}
	return product, nil
}

func getNormalProduct() ([]Product, error) {
	query := `select id, name, price, image from product where description= "default" `
	product := []Product{}
	err := db.Select(&product, query)
	if err != nil {
		return nil, err
	}
	return product, nil
}

func getProdeuctByID(id string) (*Product, error) {
	query := `select id, name, price, image from product where id = ?`
	product := Product{}
	err := db.Get(&product, query, id)
	if err != nil {
		return nil, err
	}
	return &product, nil
}
func getPerson(email string) (*Person, error) {
	query := `select email, password, fname, lname, address from person where email = ?`
	person := Person{}
	err := db.Get(&person, query, email)
	if err != nil {
		return nil, err
	}
	return &person, nil
}
func getAllPerson() ([]Person, error) {
	query := "select email, password, fname, lname, address from person "
	person := []Person{}
	err := db.Select(&person, query)
	if err != nil {
		return nil, err
	}
	return person, nil
}
func addPerson(per Person) error {
	tx, err := db.Begin()
	if err != nil {
		return err
	}
	query := "insert into person (email, password, fname, lname, address) value (?, ?, ?, ?, ?)"
	result, err := tx.Exec(query, per.Email, per.Pass, per.Fname, per.Lname, per.Address)
	if err != nil {
		return err
	}
	affected, err := result.RowsAffected()
	if err != nil {
		tx.Rollback()
		return err
	}
	if affected <= 0 {
		return errors.New("cannot insert into attraction")
	}
	err = tx.Commit()
	if err != nil {
		return err
	}
	return nil
}

func addOrderDetail(order Order) error {
	tx, err := db.Begin()
	if err != nil {
		return err
	}
	query := "insert into order_details (per_email, product_data) value (?, ?)"
	result, err := tx.Exec(query, order.Email, order.OrderD)
	if err != nil {
		return err
	}
	affected, err := result.RowsAffected()
	if err != nil {
		tx.Rollback()
		return err
	}
	if affected <= 0 {
		return errors.New("cannot insert into attraction")
	}
	err = tx.Commit()
	if err != nil {
		return err
	}
	return nil
}

func getOrderDetail(email string) ([]Order, error) {
	query := "select per_email, order_time, product_data from order_details where per_email = ? order by order_time desc"
	ord := []Order{}
	err := db.Select(&ord, query, email)
	if err != nil {
		return nil, err
	}
	return ord, nil
}
func getOrderDetails() ([]Order, error) {
	query := "select per_email, order_time, product_data from order_details "
	ord := []Order{}
	err := db.Select(&ord, query)
	if err != nil {
		return nil, err
	}
	return ord, nil
}

func GetAllProduct(c *gin.Context) {
	allproduct, err := getAllProduct()
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, allproduct)
}
func GetSlimProduct(c *gin.Context) {
	slimproduct, err := getSlimProduct()
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, slimproduct)
}
func GetNormalProduct(c *gin.Context) {
	normalproduct, err := getNormalProduct()
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, normalproduct)
}

func GetProductByID(c *gin.Context) {
	strId := c.Param("id")
	prod, err := getProdeuctByID(strId)
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, prod)
}
func GetAllPerson(c *gin.Context) {
	allperson, err := getAllPerson()
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, allperson)
}
func GetPerson(c *gin.Context) {
	strEmail := c.Param("email")
	prod, err := getPerson(strEmail)
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, prod)
}
func PostPerson(c *gin.Context) {
	var p Person
	if err := c.BindJSON(&p); err != nil {
		return
	}
	err := addPerson(p)
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusCreated, p)
}

func PostOrderDetail(c *gin.Context) {
	var o Order
	if err := c.BindJSON(&o); err != nil {
		return
	}
	err := addOrderDetail(o)
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusCreated, o)
}
func GetOrderDetail(c *gin.Context) {
	strEmail := c.Param("email")
	order, err := getOrderDetail(strEmail)
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, order)
}
func GetAllOrderDetail(c *gin.Context) {
	alldetail, err := getOrderDetails()
	if err != nil {
		c.IndentedJSON(http.StatusNotFound, err)
		return
	}
	c.IndentedJSON(http.StatusOK, alldetail)
}
func main() {
	var err error
	db, err = sqlx.Open("mysql", "root:12345678@/shop")
	if err != nil {
		panic(err)
	}

	db.SetConnMaxLifetime(time.Minute * 3)
	db.SetMaxOpenConns(10)
	db.SetMaxIdleConns(10)

	router := gin.Default()
	router.SetTrustedProxies([]string{"192.168.1.2"})
	router.Use(cors.Default())
	router.GET("/all", GetAllProduct)
	router.GET("/slim", GetSlimProduct)
	router.GET("/normal", GetNormalProduct)
	router.GET("/keyboard/:id", GetProductByID)
	router.GET("/person/:email", GetPerson)
	router.GET("/person", GetAllPerson)
	router.POST("/person", PostPerson)
	router.GET("/order", GetAllOrderDetail)
	router.POST("/order", PostOrderDetail)
	router.GET("/order/:email", GetOrderDetail)

	router.Run("localhost:8080")

}
