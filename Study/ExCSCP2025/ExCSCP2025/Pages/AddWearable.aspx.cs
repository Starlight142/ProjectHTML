using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

/// <summary>
/// Page for adding new wearable products to the database, including image uploading.
/// </summary>
public partial class Pages_AddWearable : System.Web.UI.Page
{
    /// <summary>
    /// Handles the Page_Load event. Initializes the image dropdown.
    /// </summary>
    protected void Page_Load(object sender, EventArgs e)
    {
        ShowImage();
    }

    /// <summary>
    /// populates the image dropdown with files from the Wearable images directory.
    /// </summary>
    private void ShowImage()
    {
        string[] images = Directory.GetFiles(Server.MapPath("~/Images/Wearable"));

        ArrayList imageList = new ArrayList();
        foreach (string image in images)
        {
            string imageName = image.Substring(image.LastIndexOf(@"\")+1) ;
            imageList.Add(imageName);
        }
        ddImage.DataSource = imageList;
        ddImage.DataBind();
    }

    /// <summary>
    /// Clears text fields on the form.
    /// </summary>
    private void ClearTextField()
    {
        txtName.Text = "";
        txtPrice.Text = "";
        txtReview.Text = "";
    }

    /// <summary>
    /// Handles the image upload button click.
    /// </summary>
    protected void btnUploadImage_Click(object sender, EventArgs e)
    {
        try
        {
            string filename = Path.GetFileName(FileUpload1.FileName);
            FileUpload1.SaveAs(Server.MapPath("~/Images/Wearable/" + filename));
            lblResult.Text = "Image" + filename + " sucessfully upload!!!";
            Page_Load(sender, e);
        }
        catch (Exception)
        {
            lblResult.Text = "Upload Failed!!!";
        }

    }

    /// <summary>
    /// Handles the save button click to add a new wearable to the database.
    /// </summary>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtName.Text;
            string type = listType.SelectedItem.Text;
            double price = Convert.ToDouble(txtPrice.Text);
            string image = "../Images/Wearable/" + ddImage.SelectedValue;
            string review = txtReview.Text;
            Wearable wearable = new Wearable(name, type, price, image, review);
            ConnectionClass.AddWearable(wearable);
            lblResult.Text = "Upload SuccesFull!!!";
            ClearTextField();
        }
        catch (Exception)
        {
            lblResult.Text = "Upload failed!!!!";
            ClearTextField();
        }
    }
}