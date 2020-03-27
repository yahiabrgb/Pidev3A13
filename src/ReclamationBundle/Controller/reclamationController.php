<?php

namespace ReclamationBundle\Controller;

use Doctrine\DBAL\Types\TextType;
use FOSBundle\Entity\User;
use ReclamationBundle\Entity\avis;
use ReclamationBundle\Entity\reclamation;
use ReclamationBundle\Form\avisType;
use ReclamationBundle\Form\reclamationType;
use Swift_Mailer;
use Swift_SmtpTransport;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\Encoder\JsonEncoder;
use Symfony\Component\Serializer\Encoder\XmlEncoder;
use Symfony\Component\Serializer\Normalizer\GetSetMethodNormalizer;
use Symfony\Component\Serializer\Normalizer\ObjectNormalizer;
use Symfony\Component\Serializer\Serializer;
use Symfony\Component\Validator\Validator\ValidatorInterface;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Validation;


class reclamationController extends Controller
{

    public function AjoutAction()
    {
        return $this->render('@Reclamation/Default/create.html.twig');
    }

    public function AfficherAction()
    {
        return $this->render('@Reclamation/Default/read.html.twig');
    }

    public function readAction()
    {
        $user = $this->getUser();
        $em=$this->getDoctrine()->getRepository(reclamation::class)->findBy(array('user'=>$user->getId()));
        return $this->render('@Reclamation/Default/read.html.twig',array('reclamations'=> $em));
    }

    public function createAction(Request $request)
    {
        $user = $this->getUser();
        $mail=$user->getEmail();
        $username=$user->getUsername();
        $reclamation= new reclamation();
        $reclamation->setUser($user);


        $reclamation->setDateCreation(new \DateTime('now'));
        $form = $this->createForm(reclamationType::class, $reclamation);
        $form->handleRequest($request);
        $validator = Validation::createValidator();
        $violations = $validator->validate('description', [
            new Length(['min' => 50]),
            new NotBlank(),
        ]);

        if ($form->isSubmitted()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($reclamation);
            $em->flush();


            $transport = Swift_SmtpTransport::newInstance('smtp.googlemail.com',465, 'ssl')
                ->setUsername('talentaholic2020@gmail.com')
                ->setPassword('yahia212');


            $mailer = Swift_Mailer::newInstance($transport);


            $message = (new \Swift_Message('Reclamation'))
                ->setFrom('talentaholic2020@gmail.com')
                ->setTo($mail)
                ->setBody('Monsieur,Madame '.$username.' Votre reclamation a été prise en compte ');
            $mailer->send($message);
            $this->get('mailer')->send($message);


            return $this->redirectToRoute('readreclamation');
        }

        return $this->render('@Reclamation/Default/create.html.twig', array(
            'reclamation' => $reclamation,
            'form' => $form->createView(),
        ));
    }

    function deleteAction($id){
        $em=$this->getDoctrine()->getManager();
        $am=$this->getDoctrine()->getRepository(reclamation::class);
        $reclamation=$this->getDoctrine()->getRepository(reclamation::class)
            ->find($id);

        $am->DeleteAvis($reclamation->getId());
        $em->remove($reclamation);
        $em->flush();
        return $this->redirectToRoute('readreclamation');
    }

    public function  updateAction(Request $request, $id){
        $em=$this->getDoctrine()->getRepository(reclamation::class);
        $reclamation=$this->getDoctrine()
            ->getRepository(reclamation::class)
            ->find($id);
        $Form=$this->createForm(reclamationType::class,$reclamation);
        $Form->handleRequest($request);
        if($Form->isSubmitted() ){
            $em->modifier($id,$Form->get('type')->getData(),$Form->get('description')->getData(),$Form->get('fichier')->getData());
            return $this->redirectToRoute('readreclamation');

        }
        return $this->render('@Reclamation/Default/update.html.twig',
            array('form'=>$Form->createView()));
    }

    public function  consulteAction(Request $request,$id)
    {
        $user = $this->getUser();
        $avis= new avis();
        $avis->setUser($user);
        $am=$this->getDoctrine()->getRepository(reclamation::class);
        $reclamation=$this->getDoctrine()->getRepository(reclamation::class)->find($id);
        $avis->setReclamation($reclamation);
        $form = $this->createForm(avisType::class, $avis);
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($avis);
            $em->flush();
            $am->avis($reclamation->getId());
            return $this->redirectToRoute('consultereclamation',array('id'=> $id));
        }

        $em=$this->getDoctrine()->getRepository(reclamation::class)->findBy(array('id'=>$id));

        return $this->render('@Reclamation/Default/consult.html.twig',array('reclamation'=> $em, 'form'=>$form->createView()));
    }

//    public function  updateAction(Request $request, $id){
//        $em=$this->getDoctrine()->getManager();
//        $reclamation=$this->getDoctrine()
//            ->getRepository(reclamation::class)
//            ->find($id);
//        $Form=$this->createForm(reclamationType::class,$reclamation);
//        $Form->handleRequest($request);
//        if($Form->isSubmitted() ){
//            $em->flush();
//            return $this->redirectToRoute('readreclamation');
//
//        }
//        return $this->render('@Reclamation/Default/update.html.twig',
//            array('form'=>$Form->createView()));
//    }


    public function afficherrecAction()
    {
        $em=$this->getDoctrine()->getRepository(reclamation::class)->findAll();
        return $this->render('@Reclamation/Dashboard/dashboard.html.twig',array('reclamations'=> $em));
    }

    public function  consulterecAction($id)
    {

        $em=$this->getDoctrine()->getRepository(reclamation::class)->findBy(array('id'=>$id));

        return $this->render('@Reclamation/Dashboard/dashboardConsult.html.twig',array('reclamation'=> $em));
    }

    function deleterecAction($id){
        $em=$this->getDoctrine()->getManager();
        $am=$this->getDoctrine()->getRepository(reclamation::class);
        $reclamation=$this->getDoctrine()->getRepository(reclamation::class)
            ->find($id);
        $am->DeleteAvis($reclamation->getId());
        $em->remove($reclamation);
        $em->flush();
        return $this->redirectToRoute('read');
    }
    public function  traiterAction(Request $request, $id){
        $em=$this->getDoctrine()->getRepository(reclamation::class)->findBy(array('id'=>$id));

        return $this->render('@Reclamation/Dashboard/dashboardtraiter.html.twig',array('reclamation'=> $em));
    }

    public function  repondreAction(Request $request, $id)
    {
        //$em=$this->getDoctrine()->getManager();
        $am=$this->getDoctrine()->getRepository(reclamation::class)->findBy(array('id'=>$id));

        $reclamation=$this->getDoctrine()->getRepository(reclamation::class)->find($id);


        $form = $this->createFormBuilder()
            ->add('Reponse', TextareaType::class)->add('Repondre', SubmitType::class)
            ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            $reclamation->setStatus(1);
            $reclamation->setReponse($form->get('Reponse')->getData());
            $em = $this->getDoctrine()->getManager();
            $em->persist($reclamation);
            $em->flush();
            return $this->redirectToRoute('read');
        }
        return $this->render('@Reclamation/Dashboard/dashboardtraiter.html.twig',array('reclamation'=> $am,'form'=>$form->createView()));

    }

    public function RechercheAction(Request $request)
    {
        /*$em = $this->getDoctrine()->getManager();

        $reche = $request->request->get('rechercher');
        $result = $em->getRepository(reclamation::class)->rechercher($reche);
        $html='hhhhhhhhhhhhhhhhhhhhhhh';
        $response = new Response(json_encode(array(
            'html' => $html
        )));

        $response->headers->set('Content-Type', 'application/json');
        return $this->render('@Reclamation/Default/dashboard.html.twig',array('data'=>  $request->request->get('request')));
        //return $response;*/

        return $this->render('@Reclamation/Dashboard/dashboard.html.twig',array('data'=>  $request->request->get('request')));

    }

    public function test2Action(Request $request)
    {
        $rr= $request->request->get('rrr1');
        $titre='test test';



        if ($request->isXmlHttpRequest()) {
            $em = $this->getDoctrine()->getManager();
            $reche = 'ali3';
            $result = $em->getRepository(reclamation::class)->rechercher(array('event' => $reche));
            foreach($result as $e)
            {
                $id = $e->getUser();
                $type = $e->getType();
                $date = $e->getDate();
                $type = $e->getStatus();
            }

            $response = new Response(json_encode(array(
                'texte' => $titre,
            )));
            $response->headers->set('Content-Type', 'application/json');

            return $response;
        }

        return $this->render('@Reclamation/Dashboard/dashboard.html.twig',array('data'=>  $request->request->get('request'),'texte'=> 'ssssssasas'));
    }

    public function searchAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $requestString = $request->get('q');

        $entities =  $em->getRepository('ReclamationBundle:reclamation')->findEntitiesByString($requestString);

        if(!$entities) {
            $result['entities']['error'] = "Aucune Reclamation trouvée";
        } else {
            $result['entities'] = $this->getRealEntities($entities);
        }

        return new Response(json_encode($result));
    }

    public function trierajaxAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $requestString = $request->get('q');

        $entities =  $em->getRepository('ReclamationBundle:reclamation')->Tri();

        if(!$entities) {
            $result['entitiess']['error'] = "Aucune Reclamation trouvée";
        } else {
            $result['entitiess'] = $this->getRealEntities($entities);
        }

        return new Response(json_encode($result));
    }

    public function getRealEntities($reclamations){

        foreach ($reclamations as $reclamation){
            //$realEntities[$reclamation->getId()] = $reclamation->getDescription();
            //$user=$this->getDoctrine()->getRepository(user::class)->findBy(array('id'=>$reclamation->getUser()));

            $user = $this->getDoctrine()->getManager()->find('FOSBundle:user', $reclamation->getUser());
            if($reclamation->getStatus()==1)
            {
                $status="Traite";
                $bouton="Voir";
            }
            else
            {
                $status="En cours";
                $bouton="Reponde";
            }
            $realEntities[$reclamation->getId()] = [$user->getUsername(),$reclamation->getType(), $reclamation->getDateCreation(),$status,$bouton];
        }

        return $realEntities;
    }

    public function affichertestAction()
    {
        return $this->render('@Reclamation/Dashboard/testajax.html.twig');
    }

    public function trierAction()
    {
        $em=$this->getDoctrine()->getRepository(reclamation::class)->tri();
        return $this->render('@Reclamation/Dashboard/dashboardtri.html.twig',array('reclamations'=> $em));
    }

}
