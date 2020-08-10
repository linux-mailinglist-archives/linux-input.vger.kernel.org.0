Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B7C24133D
	for <lists+linux-input@lfdr.de>; Tue, 11 Aug 2020 00:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727025AbgHJW34 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Aug 2020 18:29:56 -0400
Received: from sonic307-22.consmr.mail.sg3.yahoo.com ([106.10.241.39]:33420
        "EHLO sonic307-22.consmr.mail.sg3.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727019AbgHJW34 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Aug 2020 18:29:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1597098593; bh=Kmf4PGGAW4hFohRwP8VxB1XRE0jvKX4FRcFJqsGTJuM=; h=Date:From:Reply-To:Subject:References:From:Subject; b=F1jU7goiAInvX5VoicMIAoJuGCtMnXVFbKQQGo6MlWlTqPpQjrJj2Mgpg8XLq9tRkJxStnvvpXvjoN7kai3IOFbVp67YnX0SsqycU5ponxOSkB72oLeBnV137BMYaVRGDSebtQSF22Vra+nqkt2T6nSsHfgnTUM3rlOLx/Ngr7ovvXRrEvF9s/p5VIoq0slBZArrqGBkX40QNvRInpriIcpEdqPnZx9dTWOVOHAzpZM4Z+Oj+yK3elfVwTQXCq5JaegBpzX93gdN6h7j5I6Tbgkvs2bT1VkjeagQj1c7g7/fcUdYzvObMIGO0iQzWCv0PK5bVsbbe/yJwHEUxJwoyQ==
X-YMail-OSG: dvR71iQVM1kbbfci8H8Z2bXHBIjyUbTxaUj79eh16rupIFOjnAadhxh9JqMyk8H
 tqC7PX4xUk_xvqbJjX68qtzF9R8i0EjmxQxXdH52UfQPLVu31QAaO1aaYOsvU9BvIjih1roVT4Sc
 hbufYXGCSojnonVIrRINu3MlonJXRWCiTS2sBQNqM2H98JRCNztJCizK88xnKGYv4OpSCbm7Y4pO
 cMgCV1B8uNrDHGYFxjw8YmOAFNeRSsEVGLwbtDalJ2NLlOv5yXJxjMOJxCK8qb5Wi44xkjT_zy23
 83jgG1jCt.N0u0I4D2i6iNkyiVBKN63Nzd6wB8P8E8x5th9xSJ.NUJedzi4mM3o6F6fvwUMlbK3M
 Z7KSbHIuUT9iAQ1pF33ZI6BbZBCpKi5kuOKX9aE_F9OlN3Cqt7roB53Tk91xcZjsyz.4RW4wAZvN
 qUCXqK2gw2X0O6VC.36vfXY9zItzRWgtcu.P9JWT2yX5bVQKNWGau3xek2.Vmhtchy_zgvfyWE38
 J5SMz0bomklbJLiDcHvevM9okN.V5BqsYlZVRp5fEPCrBwqbNOTia7XhiopdZeRwDsDaZ853m7oC
 3Dg9FMZkPIzjctX9oC0h53wDDNRYtsNyKMIozteDA7vaTH4Qo656aIrPbdlTEls67LOnpbuoL8tf
 5SsCQWVlm1PLeWiXn7m_4f1iPwN1Qii5ihHFMiRTooRdAZgE88vpI7.3XKwAvABCP9rc0_nbZuVu
 .bQj6xVyODi_5mDZ3pyPiIG2enKJE0SQ8M7syOS9WEk1ZG35OVMx7u_wpvaM.g8C7QODAVDB7p5D
 w11DnEZ5CcfIAOV6Sgpu18Lz.NISdxmccZjIJg.CXQx3ldONNLOffhUkuoYWNP84Igk6_w4Xeq_0
 IyVGDjoRG1WVQ0nMQ0hxEV44ZdWsGR3d_MZuntchMRie_d4BvOc4YsHJZ9KqLQiS4VW2ESUDziKM
 gaP0b0Y.fp.7cWsf7iCu5M.BOWkksZG_1IJpc7LWxrjLk_RHU2g5YSjjUgGLaQyhLXC7AftH.7xR
 bLhy2LKiMmvQEPN58THTqrjj3OXYwQJqXbbOetCi5dxP.SNgPYqCr6aZl.b7377_DyD233ADyqTm
 DF0gfFOwq1YvDw8xm_4ustzb0tykT4bYKZECuSC8GtrwL6jWmCVCWRTWe9qkIsXIyOsIoeCURwBb
 5M6Ev3bPokkXj2ZMw.6FLx6QmKOE6ZcZcQ2XfcMXLkVO9mfMfsSc.rJdFrqwbUDmndJU3ICmSuaa
 IYz6V8O7.0O2RcBD5UjtjQJcW2P7oKF6aDP7DFDoiBnjce4aZAM0Mz7q9NCnTcgC0_7kboh9GWhj
 9cIlsS3n6wj1ocPJVswePyg5RjYjJxII0CQ5_zYwVoJsEbndUWYNl1Q--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.sg3.yahoo.com with HTTP; Mon, 10 Aug 2020 22:29:53 +0000
Date:   Mon, 10 Aug 2020 22:29:51 +0000 (UTC)
From:   Celine Marchand <official0178987@uymail.com>
Reply-To: celine88492@gmail.com
Message-ID: <266009723.1697459.1597098591942@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <266009723.1697459.1597098591942.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16436 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:79.0) Gecko/20100101 Firefox/79.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



Hello
Dearest, how are you? I am sorry for intruding your mailbox, but I need to =
talk to you. I got your email address in my dream and i wonder if it is cor=
rect because i emailed you earlier without any response. You should know th=
at my contact to you is by the special grace of God. I am in urgent need of=
 a reliable and reputable person and i believe you are a person of fine rep=
ute, hence the revelation of your email to me in the dream.
I am Mrs. Celine Marchand a citizen of France (French). But reside in Burki=
na Faso for business purposes. I need your collaboration to execute some pr=
ojects worth =E2=82=AC 2.800.000 Euro and it is very urgent as am presently=
 in very critical condition.
Please reply through this email address ( celine88492@gmail.com ) with your=
 full contact information for more private and confidential communication.

Thank you as i wait for your reply.
Mrs. Celine Marchand
