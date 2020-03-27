<?php

namespace FOSBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class SecurityController extends Controller
{
    public function redirectAction()
    {
        $user=$this->getUser();
        if($user)
        {
            if($user->isSuperAdmin() )
                return $this->redirectToRoute('read');
            else if(!($user->isSuperAdmin()))
                return $this->redirectToRoute('createreclamation');
        }
        return $this->redirectToRoute('fos_user_security_login');
    }

}
