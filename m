Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CEAF6742CD
	for <lists+linux-input@lfdr.de>; Thu, 19 Jan 2023 20:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229898AbjAST2C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Jan 2023 14:28:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjAST2B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Jan 2023 14:28:01 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D605F9371C
        for <linux-input@vger.kernel.org>; Thu, 19 Jan 2023 11:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1674156477; bh=kTISmu4uC3Us/spnUCnaRjG9SseC+2DquuEiNUrDlw0=;
        h=X-UI-Sender-Class:Subject:From:To:Date;
        b=HQ9CkC0sB4zx5RzHVrco458f0rhEjSSiGX6JZoq6Wg2AM5rf4gux+icEkA+HeZcq1
         WglYp4mAibAgmZ65xQ8MPYN86qC4VcDz14j2r9n3SN5TQCUY8cY+ET+zbPw/96WrEv
         8C+iFZybBKKzIhr3Ho1KwXO3NkEuG+5jCQDINkAt+aHPW/UUJWltZPAOh/whl6VRkc
         2nXYIlmWbJxGBJauG/AaWTMFTgYKcd+d52/sKfGYpkSigAcCismC7xSj6ZBY2QqU1x
         uAWGhX0cR6oKgOr/GQmKTx/cnTGrBv0w5QdTTldJL9cC8tLKIGcJ5v9xTHiHMIUD2o
         pDl/pb8raWdpQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from silver.fritz.box ([46.165.133.178]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEUzA-1pU9Hb0kAM-00G2RP for
 <linux-input@vger.kernel.org>; Thu, 19 Jan 2023 20:27:57 +0100
Message-ID: <5bbc7e785a6ca2a58e565dae9394540f6a315193.camel@gmx.net>
Subject: Improvement for Joystick and Force Feedback section
From:   Hiran Chaudhuri <hiran.chaudhuri@gmx.net>
To:     linux-input@vger.kernel.org
Date:   Thu, 19 Jan 2023 20:27:56 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Provags-ID: V03:K1:YVWXng6PE6ob4kyejrHfkbZ8vQPqBxNyV05TLYcUx+PWLfq2y6/
 GHn9lx86IxSMHwKjtC8LzwLoZtJL9MW/RJqIWDwFKXeYRFFeIIWtHccWO8kNrn6l9HpgmKF
 Q9R2B0VD+DxLOiSUFQoxLVa0Cj7ZHBcY7WTtffKgMNgEUkSAS459pc2r7H6SJJZlCB1Y5az
 RM4ygDN0i9EpMtdObrMcw==
UI-OutboundReport: notjunk:1;M01:P0:1flET4fi6v8=;tIskBV+i0Wx20bx/V9+H6ZMAl1R
 ZLSdku9lzHyuDsBbfeadr1eN0evJzwk19GSjYjS1efq4Fuo6M+olnPJBS2mvZW6WKtJg8PjPJ
 /9CiYN0c1rlm0CAcxGWPdQ186kfF4Y7pkdGVVGKmo5WuTknK7MQJs29zWdhELgtGK1GVY3CZ0
 JSj5QwC+wzGFjdcjCKLAq2mC0mJSSztks4wUHQQrcrrsIZfuMQmb1TReVie/MeDVXJbSp37FV
 /hxfPuRJPqbAsB9TF059QPiMDiv2137JCafIXjP7ZcZytn9rM74KGVWRAHKJfRFpaZ2BChCL/
 LJQrbPbX7AnC8w+QvM1ZCQx5BimpqG83Lh+03y/3SIidAE4vTt+05FuZthSlBiF/ub2N1WMHK
 UZgidZQdqtOMWyiWjajTaFAH5Op9A8ocOYWQH2b8+AAqs/6pvn907Jk5dORkf1mm2PohdzJ5b
 x9drG67RT5jFvLx377OawCoLYmKzE+V8jgec1MaRajGDnCMWSsy45U+eOBq7M1NhS7ks1Y5tr
 /Qtmp2kQjDECs6enkAzfH63Yv44hYZFpua3wCYI3m+EGe6WDIhvH7otcO0nY3xR5+s3F9vh6R
 npCW7phh5o5jCVdksl6hftouiH2pKwL8VLwEql3he1hl7mYJr4xFIPeWga3s34ZOPrvVnj1OS
 8giWjP2lNTPFfp6IwpmdgOwHbBVyUZb3NALhfEHV8L6oRD8Eg/rNoLJMHq+bDNC5PvLKYuZ9Y
 4nQQHZEogt3hg0CrhJ4M62bkgP0ixlYAboNlePdem8I8sNH/seyS4PzyVPwNb4QMHn5nD/WSV
 +VeihsR5ZlJ+B6oavKdJOnLVzNsPjR76NUcefbhzdoChntjD9udeyqzSuZUIwPt/JXP4SH4W9
 grwm2b7NvAJs7Nxoa4VmnT2G+ibAQlM1mOkz6CJ35k9nEJ06HvMJoIv+W2bOLXwQn2yNJbjF9
 QET0Kb4uPCKIhVwvoOlf0yCyf8I=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello there,

I am neither developer nor committer on the linux kernel. But trying to
figure out the kernel support for my Microsoft Sidewinder Force
Feedback 2 joystick I found two things that might get improved in the
kernel documentation. Maybe someone could update it with below
information:

1)
https://www.kernel.org/doc/html/latest/input/joydev/joystick.html#microsoft=
-sidewinder-joysticks
The Microsoft Sidewinder Force Feedback 2 joystick is not listed at
all, but after playing around I was able to make it work. So it makes
sense to extend the list with that model.

2) https://www.kernel.org/doc/html/latest/input/ff.html#does-it-work
When trying fftest it is important to use the correct device node
/dev/input/eventXX. Unfortunately I was fiddling for a long time with
the wrong node (it may even change depending on the hot-plugging of the
USB devices).

Therefore first run the command `evtest`, which scans all
/dev/input/event* nodes and will print the devices found. From that
pick the correct file, then run `fftest`.

Also the command `ffcfstress` is a very nice test to verify the
joystick works.

Best regards

Hiran
