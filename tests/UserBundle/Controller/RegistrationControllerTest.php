<?php

namespace Tests\UserBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class RegistrationControllerTest extends WebTestCase {

    public function testPostRegsiterNewUser() {
        $data = [
            'username' => 'matko1',
            'email' => 'matko1@gmail.com',
            'plainPassword' => [
                'first' => 'test123', 'second' => 'test123'
            ]
        ];

        $client = static::createClient();
        $client->request(
                'POST', '/register', array(), array(), array(
            'CONTENT_TYPE' => 'application/json',
                ), json_encode($data)
        );

        $this->assertEquals(
                201, $client->getResponse()->getStatusCode()
        );
    }

}
