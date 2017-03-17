<?php

namespace Tests\UserBundle\Controller;

use Tests\ApiTestCaseBase;

class LoginControllerTest extends ApiTestCaseBase {

    public function testPOSTLoginUser() {
        $userName = "admin";
        $password = "123456";

        $user = $this->createUser($userName, $password);

        $this->client->request(
                'POST', '/login', [], [], [
            'CONTENT_TYPE' => 'application/json',
            'PHP_AUTH_USER' => $userName,
            'PHP_AUTH_PW' => $password,
                ]
        );

        $this->assertEquals(200, $this->client->getResponse()->getStatusCode());
        $responseArr = json_decode($this->client->getResponse()->getContent(), true);
        $this->assertArrayHasKey('token', $responseArr);
    }

}
