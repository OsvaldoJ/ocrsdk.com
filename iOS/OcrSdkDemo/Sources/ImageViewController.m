#import "ImageViewController.h"
#import "AppDelegate.h"

@implementation ImageViewController
@synthesize imageView;

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
	self.imageView.image = [(AppDelegate*)[[UIApplication sharedApplication] delegate] imageToProcess];
    [super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)takePhoto:(id)sender 
{
	UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];

	imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;

	imagePicker.delegate = self;
	
	[self presentViewController:imagePicker animated:YES completion:nil];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
	UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
	
	[picker dismissViewControllerAnimated:YES completion:nil];
	
	self.imageView.image = image;
	[(AppDelegate*)[[UIApplication sharedApplication] delegate] setImageToProcess:image];
}

@end
