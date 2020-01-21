Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8B2143F46
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2020 15:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729030AbgAUOTH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jan 2020 09:19:07 -0500
Received: from mout.web.de ([217.72.192.78]:51253 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728794AbgAUOTG (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jan 2020 09:19:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1579616342;
        bh=9kRnx6Jx4zaILv3sEjaVmFzBKiRSW1pV8G1VB8CJASA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ODOAl3bYQl7SaKcOWN9MzrEsCh8KQviYNFjI1R0Zq/hIItUPDFXVPUk8fCfhSQs17
         iadm2Mbo2B6SNc+NaqSEEYPrcRW8paZMEXcyLflVHxw4Ig3MNqhYS0MXSBv3mL1nfi
         fq6eV8YX/0h8cCe1EWkdhsjqmu4YpvSxilhgxc48=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from LaptopNick.fritz.box ([79.227.106.217]) by smtp.web.de
 (mrweb101 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MUFGo-1j2GM00yEE-00R2Ha; Tue, 21 Jan 2020 15:19:02 +0100
From:   Nick Reitemeyer <nick.reitemeyer@web.de>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     stephan@gerhold.net, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nick Reitemeyer <nick.reitemeyer@web.de>
Subject: [PATCH 3/3] Input: tm2-touchkey - add support for Coreriver TC360 variant
Date:   Tue, 21 Jan 2020 15:15:26 +0100
Message-Id: <20200121141525.3404-3-nick.reitemeyer@web.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200121141525.3404-1-nick.reitemeyer@web.de>
References: <20200121141525.3404-1-nick.reitemeyer@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k2+u9ZfeHwTXo/d5p4ZrSG55i2emVHb8kyrVo/l1GUPLBrHNxY2
 V8ZN8Myc/LGrAiZl0hyphimMnp+hZhQ8tVuomgH9VjRa5+yisWx4FlojBTdPtJUFhS4WM9s
 3hx+0LywkSLQCCmQyWESeu+65CoKsWQYEIujYlksjwmL0BrgFyDHuGeMY9Xvjrvt7vNW0oa
 fhTOd0cS5Sd5WtFAZKEeg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZOgEio7KkAI=:MQnRiI+KYBY6HbEqOH9T7E
 pzuvNli34D6a+CMx/UuDppIiKsHEyKOiRITaPOHg5XHu8v882vmwD4gLvekHu9iQuvdkCK8Kn
 oVaYnvVU3wwMLaqY6jTQvwZYhPZ8z/8UGRBeUxGv6GoVRgsq46I5pQd8f9pfJ+5ZJXLBDq5cz
 5yP5CKcFjs8dwYLfYNkxMEWqUrnfo1Uech+ncdZkCJI1NwHgLq+XS4xDMVyHe3rLWtXGRxyuk
 a9pbOtgTcrQHazIV1TaMGoWegQKS219bUlPzt89RuvLq3/G1cx6doDP3IPUI7hurXBDpxqlPw
 eiVoz+TgblrqxOySGHhwupY+PlADf/R0C+uJvGF8qMRih8IpW2hWX8CnskHfYZnqUxvJ5WZL0
 lYc0t9HiBOPOt+yCE47ouw3AIEfPd9s/LYnru0fZ4/aMKuME2XTmPYaSSAbn7z/rU0D+BMbe+
 DJ2jHoSetadkZwG7UMyDMBKEHHF/81LZCC5V0Te4fT0ic0clhxqWRR4acZTNZ11VXfiazb2CP
 coWdyCRc0DEnmD77yV4NEAb5SglTkcVkYBeHL151PK6pcpKNtzMDJroWQAOjbxWN67D92QFNG
 /QsIFccoJAn4vkMP3krXn2FsJ7uu6wTTl+mF0czY3BrgGL0zEgyxgVJnCnob8KRYhy2jKSruG
 DpMsiDREtX6cTIWBC7xoZtoxN1WZCW0idt41cL0YwDIZOFanOl3wGHO/FXYFHGT6gTQ/3O7xa
 UMw+NjUbriO91hjPGAXLK9MTNcS3Oq4Uva9sw/KUWJK6S9LWL0q14r0euw7+G26Ax3bAj8zym
 nPRjCRZMuIrJy10gbNDKTa3CnDcRXQzDPuE97KK3AEvUklGa/SWCP8skqWm1AEcVT9QVjbA+f
 YzKmV1wP9O4HLtdFRxCRXKal8hL8cI4BChOmf54ulmmmc4+XmjE1mHk9Cq+0FsBZyA7p3u02J
 ICxpK+K/uM9obFhT3Raxc8WYb2aS6gPt8g7kyIWdma7fT77daqQgxFnG+RtVb5IL61brQ+25R
 5a1HFWexqxSPYa1acyPCB+QewBnL6RHV/UvI+xb/dF0pmNj6ww/MIL9SaB8sB3co5KdengFV4
 S2Sy1s83XZfCFUt7/ZRnDi3HkmIFrAwoXCPqxqXShhmJ4hnkQfUFUFsS4f0wdIcRKNOWFVRDh
 KRHa4nYbX+H95AWsZoNXgEOsqT5CqbmUyjYcL/eIv1loUIvFBH3H+ogv/dhIY3tz+NCy46bk6
 uhNn7CFiQk/mG8b0FLtux0dPjVeXLcmHswjnGR+yeXXXZ786ZtI1ff1hqMQs=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The Coreriver TouchCore 360 is like the midas board touchkey, but it is us=
ing a fixed regulator.

Signed-off-by: Nick Reitemeyer <nick.reitemeyer@web.de>
=2D--
 drivers/input/keyboard/tm2-touchkey.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/input/keyboard/tm2-touchkey.c b/drivers/input/keyboar=
d/tm2-touchkey.c
index 14b55bacdd0f..fb078e049413 100644
=2D-- a/drivers/input/keyboard/tm2-touchkey.c
+++ b/drivers/input/keyboard/tm2-touchkey.c
@@ -75,6 +75,14 @@ static struct touchkey_variant aries_touchkey_variant =
=3D {
 	.cmd_led_off =3D ARIES_TOUCHKEY_CMD_LED_OFF,
 };

+static const struct touchkey_variant tc360_touchkey_variant =3D {
+	.keycode_reg =3D 0x00,
+	.base_reg =3D 0x00,
+	.fixed_regulator =3D true,
+	.cmd_led_on =3D TM2_TOUCHKEY_CMD_LED_ON,
+	.cmd_led_off =3D TM2_TOUCHKEY_CMD_LED_OFF,
+};
+
 static int tm2_touchkey_led_brightness_set(struct led_classdev *led_dev,
 					    enum led_brightness brightness)
 {
@@ -327,6 +335,9 @@ static const struct of_device_id tm2_touchkey_of_match=
[] =3D {
 	}, {
 		.compatible =3D "cypress,aries-touchkey",
 		.data =3D &aries_touchkey_variant,
+	}, {
+		.compatible =3D "coreriver,tc360-touchkey",
+		.data =3D &tc360_touchkey_variant,
 	},
 	{ },
 };
=2D-
2.23.0

