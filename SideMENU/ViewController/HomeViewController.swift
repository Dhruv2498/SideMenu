
import UIKit
protocol homeViewControllerDelegate : AnyObject{
    func didTapMenuButton()
}
class HomeViewController: UIViewController {

    weak var delegate:homeViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Home"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .done, target: self,action: #selector(didTapMenuButton))
       
       
    }
    @objc func didTapMenuButton(){
        delegate?.didTapMenuButton()
            
        }
}
