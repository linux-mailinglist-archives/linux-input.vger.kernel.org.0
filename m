Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB6427ADCC4
	for <lists+linux-input@lfdr.de>; Mon, 25 Sep 2023 18:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbjIYQJz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Sep 2023 12:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbjIYQJz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Sep 2023 12:09:55 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2407BB6
        for <linux-input@vger.kernel.org>; Mon, 25 Sep 2023 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1695658185; x=1696262985; i=matthias_berndt@gmx.de;
 bh=zEvS7KDsueG78QcJAA4HKWn/NDlWgSltMfCNF21N1dE=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=mpZ8VmzEJIXokA16oH8QKvPrULZaVf/H4Pyw0tgPRCEr7Z1aLE4ZxgOMNtjo4jqPmMTvJ/o6Yro
 R5cMhacoYEYlSrt63v11VZljmQ0rPV0arg0S1QstPTNppoVhoodGGLGYgvJvLpjBwV5hSiCnshWLk
 /33GqY45zPuHup8oubraRdo9USVjbgp7P64fvAjio7SK9cVkTBiwvTIaamwJpCIWHEp8sICov+iAw
 iExXD8aF6AX+4gfE6PAgPXODlyaaUFk093UeWeoaf5KsZz2+4Ez3doUmxz9zdKIz7bRnxsOTdfAlN
 CmULlkqAsHtQ+B3voE7RlrJ/ih1uzRwtGOsg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from fedora.localnet ([89.1.217.222]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQMyf-1qxmhc2J4T-00MOfJ; Mon, 25
 Sep 2023 18:09:45 +0200
From:   Matthias Berndt <matthias_berndt@gmx.de>
To:     linux-input@vger.kernel.org,
        Ismael Ferreras Morezuelas <swyterzone@gmail.com>
Subject: [PATCH] Input: xpad - add PXN V900 support
Date:   Mon, 25 Sep 2023 18:09:45 +0200
Message-ID: <3255345.aeNJFYEL58@fedora>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart3261580.44csPzL39Z"
Content-Transfer-Encoding: 7Bit
X-Provags-ID: V03:K1:qDmNLHow8g5fQjmpqx2OjfM4TcwAsRrHuV0+elY/osTn9kR5N41
 dfOB7REy+oeiitMRbEQtcCobgEH21uNjqocGwD6UcVKTxxq08kr/AiB3aKa/x2M/SfP5/ow
 sPMjLd5UChRWDxejVu436Ww5Olq8Npi4KH5zTlkig8g9tyUJg5dkHc7XPKA90coHDoqWP1i
 al2ovEf/tvbpr/xKHR9ew==
UI-OutboundReport: notjunk:1;M01:P0:ZAYZl3z2lyA=;MuNwz0y7RIqyYTU5A12i/qXLPmI
 ohc0a05rY6MnA9gFaIlPz2iS6gxSoJiYmE1KzQiv+ttdoQBvt74NcwnTaQIZMKWY5hGQLgv+H
 HJRl2SaQwzdVYRnhiEyZjoH63ep6HO/5acPg6QoFN9AeBBJlyqrGNKI+Vdv6l9O491A35GibW
 G05KA2UQXZHf7MekwgE1TrlbFCAC74YQZN1MMoHj4qNMmDbVjuAYF0VJ9ehbGnyqU4VqqA6XN
 Qk7o1y4sfDHsdLMMzhyv/Xq++RspLPly4iziWe7jpOXED9Y3Qi5CtZlAPqudC076obwq+HWpH
 boMulTtYEKsd5ZZxGKkoVbcHgVFYlWmfzof9miHKLGxqDYrFULkmLJpooIhDie+TYuvAKECxp
 vmdykA/De0TldNlMTKEAlc9wDZvtoYGmNoYqB3nYxa4Nck83EvhY0LcPPWRCJYOnvlBEnBgJ9
 YtWedkjLBR56xd1TEcHkKbNriaPO+NV8O9ivdUitWyBTQw+gb23sRuYfJD7+dkiIuywGvZuV+
 hTuQ1MnPZ7WI7w5eWy+av8P4One1Rey/++7SofIO2kumPa2dt7nPVA9FQay9UdJIaLEn6z37S
 mrbgT2k7eaveCW+6eBdtYdJCMG3IGseQ4hmuL9R7HKCQX/MzIpeZSLQ41OqxN+R2vQo82HwBA
 AbT61CSWrKcHm82O6RcJl3W6100IeGMZKK4iML1BWOiuAewmA0EjKTFOLUEuQpXROZTWTt5Yy
 0MPmd6bD6R5wLfnNKQCQfV1RLhVdXo8USIXUn5ySzEX+Fr63WO2Ex/3Mnjz/nugtaBLyOanJo
 LQQguZFP+Ue1cxkq3SrroTKDJxM1htuprIi8mNQjG7Br2c+mfaGI+ThSYYyXPYLm1Ju1kJszX
 7PoPlZiy1vWsw1hQtzWuaVVuwKTVCLJbYKG1xkrAgRSCYTx7FGpCL7bRLL90EU3umphXlu9WL
 R/Wo32wCwdnwob8T+rvEWW6QXDI=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This is a multi-part message in MIME format.

--nextPart3261580.44csPzL39Z
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Ismael, Hi linux-input,

I recently got my hands on a used PXN V900 steering wheel which didn't wor=
k
out of the box on Linux. I've attached a patch that makes it work for me,
please consider merging it.

All the best,
Matthias

--nextPart3261580.44csPzL39Z
Content-Disposition: attachment;
 filename="0001-Input-xpad-add-PXN-V900-support.patch"
Content-Transfer-Encoding: quoted-printable
Content-Type: text/x-patch; charset="utf-8";
 name="0001-Input-xpad-add-PXN-V900-support.patch"

=46rom 9b0af40bc3c064be1c7c5ba36d7fb4b8d6535fc7 Mon Sep 17 00:00:00 2001
From: Matthias Berndt <matthias_berndt@gmx.de>
Date: Mon, 25 Sep 2023 17:54:13 +0200
Subject: [PATCH] Input: xpad - add PXN V900 support

Add VID and PID to the xpad_device table to allow driver
to use the PXN V900 steering wheel, which is
XTYPE_XBOX360 compatible in xinput mode.
=2D--
 drivers/input/joystick/xpad.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index ede380551e55..478bf657efc2 100644
=2D-- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -272,6 +272,7 @@ static const struct xpad_device {
 	{ 0x1038, 0x1430, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x1038, 0x1431, "SteelSeries Stratus Duo", 0, XTYPE_XBOX360 },
 	{ 0x11c9, 0x55f0, "Nacon GC-100XF", 0, XTYPE_XBOX360 },
+	{ 0x11ff, 0x0511, "PXN V900", 0, XTYPE_XBOX360 },
 	{ 0x1209, 0x2882, "Ardwiino Controller", 0, XTYPE_XBOX360 },
 	{ 0x12ab, 0x0004, "Honey Bee Xbox360 dancepad", MAP_DPAD_TO_BUTTONS, XTY=
PE_XBOX360 },
 	{ 0x12ab, 0x0301, "PDP AFTERGLOW AX.1", 0, XTYPE_XBOX360 },
@@ -503,6 +504,7 @@ static const struct usb_device_id xpad_table[] =3D {
 	XPAD_XBOX360_VENDOR(0x3285),		/* Nacon GC-100 */
 	XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
 	XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
+	XPAD_XBOX360_VENDOR(0x11ff),		/* PXN V900 */
 	{ }
 };

=2D-
2.41.0


--nextPart3261580.44csPzL39Z--



