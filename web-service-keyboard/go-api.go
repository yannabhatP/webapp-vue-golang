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

/*
	func getAttractions() ([]Attractions, error) {
		query := "select id, name, detail,coverimage from attractions"
		attrac := []Attractions{}
		err := db.Select(&attrac, query)
		if err != nil {
			return nil, err
		}
		return attrac, nil
	}

	func getAttraction(id int) (*Attractions, error) {
		query := "select id, name, detail,coverimage from attractions where id=?"
		attrac := Attractions{}
		err := db.Get(&attrac, query, id)
		if err != nil {
			return nil, err
		}
		return &attrac, nil
	}

	func addAttraction(attrac Attractions) error {
		tx, err := db.Begin()
		if err != nil {
			return err
		}
		query := "insert into attractions (id, name, detail, coverimage) value (?, ?, ?, ?)"
		result, err := tx.Exec(query, attrac.Id, attrac.Name, attrac.Detail, attrac.CoverImage)
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

	func editAttraction(attrac Attractions) error {
		fmt.Println(attrac)
		tx, err := db.Begin()
		if err != nil {
			return err
		}
		query := "update attractions set name=?, detail=?, coverimage=? where id=?"
		result, err := tx.Exec(query, attrac.Name, attrac.Detail, attrac.CoverImage, attrac.Id)
		if err != nil {
			tx.Rollback()
			return err
		}
		affected, err := result.RowsAffected()
		if err != nil {
			return err
		}
		if affected <= 0 {
			return errors.New("cannot update attraction")
		}
		err = tx.Commit()
		if err != nil {
			return err
		}
		return nil
	}

	func removeAttraction(id int) error {
		tx, err := db.Begin()
		if err != nil {
			return err
		}
		query := "delete from attractions where id=?"
		result, err := tx.Exec(query, id)
		if err != nil {
			return err
		}
		affected, err := result.RowsAffected()
		if err != nil {
			tx.Rollback()
			return err

		}
		if affected <= 0 {
			return errors.New("cannot delete attraction")
		}
		tx.Commit()
		return nil
	}
*/
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
	//albums = append(albums, newAlbum)
	c.IndentedJSON(http.StatusCreated, p)
}

/*
	func GetAttractions(c *gin.Context) {
		attractions, err := getAttractions()
		if err != nil {
			c.IndentedJSON(http.StatusNotFound, err)
			return
		}
		c.IndentedJSON(http.StatusOK, attractions)
	}

	func GetAttraction(c *gin.Context) {
		strId := c.Param("id")
		id, err := strconv.Atoi(strId)
		if err != nil {
			fmt.Println(err)
		}
		attraction, err := getAttraction(id)
		if err != nil {
			c.IndentedJSON(http.StatusNotFound, err)
			return
		}
		c.IndentedJSON(http.StatusOK, attraction)
	}

	func PostAttraction(c *gin.Context) {
		var a Attractions
		if err := c.BindJSON(&a); err != nil {
			return
		}
		err := addAttraction(a)
		if err != nil {
			c.IndentedJSON(http.StatusNotFound, err)
			return
		}
		//albums = append(albums, newAlbum)
		c.IndentedJSON(http.StatusCreated, a)
	}

	func PutAttraction(c *gin.Context) {
		var a Attractions
		if err := c.BindJSON(&a); err != nil {
			return
		}
		strId := c.Param("id")
		id, err1 := strconv.Atoi(strId)
		if err1 != nil {
			fmt.Println(err1)
		}
		a.Id = id
		err := editAttraction(a)
		if err != nil {
			c.IndentedJSON(http.StatusNotFound, err)
			return
		}
		c.JSON(http.StatusOK, a)
	}

	func DeleteAttraction(c *gin.Context) {
		strId := c.Param("id")
		id, err1 := strconv.Atoi(strId)
		if err1 != nil {
			fmt.Println(err1)
		}
		err := removeAttraction(id)
		if err != nil {
			c.IndentedJSON(http.StatusNotFound, err)
			return
		}
		c.JSON(http.StatusOK, "delete success")

}
*/
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
	//router.GET("/", GetAttractions)
	router.GET("/all", GetAllProduct)
	router.GET("/slim", GetSlimProduct)
	router.GET("/normal", GetNormalProduct)
	router.GET("/keyboard/:id", GetProductByID)
	router.GET("/person/:email", GetPerson)
	router.GET("/person", GetAllPerson)
	router.POST("/person", PostPerson)
	//router.GET("/:id", GetAttraction)
	//router.POST("/", PostAttraction)
	//router.PUT("/:id", PutAttraction)
	//router.DELETE("/:id", DeleteAttraction)
	router.Run("localhost:8080")

}
