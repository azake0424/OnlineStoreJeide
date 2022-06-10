package models;

public class CategoryModel {
    public int id;
    public String name;
    public String image;

    public CategoryModel(int id, String name, String image) {
        this.id = id;
        this.name = name;
        this.image = image;
    }

    public CategoryModel() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
