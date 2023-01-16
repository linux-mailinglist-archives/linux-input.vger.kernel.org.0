Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45F0666CFDF
	for <lists+linux-input@lfdr.de>; Mon, 16 Jan 2023 21:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbjAPUJr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 15:09:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232314AbjAPUJq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 15:09:46 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE00DEE
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 12:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1673899783; bh=kTISmu4uC3Us/spnUCnaRjG9SseC+2DquuEiNUrDlw0=;
        h=X-UI-Sender-Class:Subject:From:To:Date;
        b=sK73O5w2c0QFkjw9D9brW4iQeWXRoNUxQy4udYPh2N2XVnqy39dKLtaOzLBjkGKAo
         QG+0H9JsIcq98Gv5zM4gJmgRf5RrVvfWpY606nqPYRul9VEJ7yhZqyZ3Bk4ywtXxGg
         wwDFC1jY9mY0i8rJR+ZYquYI5y4Q4Zf0oR5ZpCZvhX4uZuPyxBrWLKN2h6iPB0N9VA
         X8WnZZ20gNH2CL3Opn4p0YBbRmYs2gK7SHKfVLGxHo+pZPBqcwn3phyjPaUv2c8LV0
         c7CMauq+iKmfqxTqvdYmRLqyiyxN9r+GLa3562ViOL2TW+Sv0jon7KW7ATpjRaTA6a
         cJx22wunyVPdA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from silver.fritz.box ([46.165.133.178]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mxm3Q-1oWhPU3wbO-00zFK4 for
 <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 21:09:42 +0100
Message-ID: <36391e32d48bbe071a327ac981860fce01b9c1f8.camel@gmx.net>
Subject: Improvement for Joystick and Force Feedback section
From:   Hiran Chaudhuri <hiran.chaudhuri@gmx.net>
To:     linux-input@vger.kernel.org
Date:   Mon, 16 Jan 2023 21:09:42 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Provags-ID: V03:K1:ONu/T+Q8RehyXxj7QMJk7at8gIamGyLOefCFxRbecU4SbdqSPFI
 qUz6zhE/bgi9NV5pgypdMa+eeTE6kNxTCYSxPSsFRAASLEYJYCnAb79J0eMQbPiLCqRqSQ4
 veTWLwI2EMBnrDZhWzSb9rlbzbTgoA/UEYHJYB9g02X8Dggswj1uaV8t4FpwoAmwL7tHMiF
 6tAUHYSG0JiyRJreV3OiQ==
UI-OutboundReport: notjunk:1;M01:P0:7MJuYS6tOOg=;/hD2NjTDWOPeqEonUM++lG0SbH1
 4UCtSOEvDwx6bhc1CX6gIZZckRWT7HgQDYTh/kza/d2U7KfzRrRpHedAxa8XZJnolAbwPDx65
 hg55IMTKskNVlDBqnxpvrHkUaomU4uhOJVx1rE6o2HNygH97rC0sAULTtSjx6fP5bXL9/ZG8p
 gqThhrwHeYZO6t+AdxyajO3RRALqBmRR1UW+e0bYDz1t0eYBkgxLffVKVZ2bQ438uvNhvfaZb
 baPBkJ2muu+NakQVJ+FD66fFmNNgDdKgWqdIcctCEksN3je4TJxSCealMMsY/UHv//Q0ou8xP
 ijZIHdhSvnqKQGH5MkGPb5CQ3E2Hled0mYXS1D00YzH83NGRzk+JaJdqTVoa34oOz8AUE7s5Y
 bWHWrrumLo/BCObcoJbgx8LMqTyt9GL1exkEb4/Gze69yqugXFCCPmXLT6kMhaU2jKpaxDoIA
 wktwc57RS+if0/xJ4Vzp1+2ERVSzZWMIVGn2j/s7BvZfSZX2Q8lP3a13Co0X/U0UFELPU6nLA
 oGsk4cZm/G8xfLmSbgA4lEE0Nw6Htjmt6ZAvyLBJXKaYNEVUhY/Sv34QjWrjuAhKcn+WylOCh
 tQW0ZENl6dyz+GlWrB2LSSZLozVcsVnsSPLY9ACw0srhDOx79loHdZVpsXqC3HN2HutgX4cCN
 n0siWtux3bZa/VrAue8PBPZjIXKSa8426cXKpE/pyyu3TsQYw6Sug8Jpfnud14dhFb7/H40ih
 +16UYNjE3VDhRGd9U2JjS552SdmhfqooTNQ8dGbahV7A6gPNILY7KcdsCb8VKpuokEA9aswSq
 p+BpoWMlkimjTivjxeQKJDwq7B+/GyXIvyreiXpp0OzybaBgCMzpSblOdFwrwUYy+GpeuKydz
 ZfI0i6enuTqZWJZUJa+FCQZi7rhgNyEu/+bkNT8g0oShOnKj/ZGxQV+uGcnjy07ZKn2GWGgwS
 GY5Yk5PgdyXWHDSOlIGtKhwCVms=
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
