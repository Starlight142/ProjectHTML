using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;


/// <summary>
/// A utility class to find child controls of a specific type recursively.
/// </summary>
/// <typeparam name="T">The type of Control to find.</typeparam>
public class ControlFinder<T> where T : Control
{
    private readonly List<T> foundControls = new List<T>();

    /// <summary>
    /// Gets the list of found controls.
    /// </summary>
    public IEnumerable<T> FoundControls
    {
        get { return foundControls; }
    }

    /// <summary>
    /// Recursively searches for controls of type T within a given control.
    /// </summary>
    /// <param name="control">The parent control to start the search from.</param>
    public void FindChildControlRecusive(Control control)
    {
        foreach (Control childControl in control.Controls)
        {
            if (childControl.GetType() == typeof(T))
            {
                foundControls.Add((T)childControl);
            }
            else
            {
                FindChildControlRecusive(childControl);
            }
        }
    }

}