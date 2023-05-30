Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC75671673E
	for <lists+linux-input@lfdr.de>; Tue, 30 May 2023 17:39:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbjE3PjC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 11:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjE3PjB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 11:39:01 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6CC109
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 08:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1685461136; i=friedrich.vock@gmx.de;
        bh=eY466nP/g7MQjKWbGT6bLS+1BuoRmaHBWLSnxAB6gyI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=FjqHzBWAHJhhoQIb+hMBR3+d/AzPnyy4HWjivOVtFe3SrOyHwg7DCrH16EPNS73yu
         hQgufPflyo3OraK9MlnfzXy6K0UYzfgnSpDxwuJGvrbi6QJWBw+gD+OV+kb/CsZVHU
         ihzJzu2JxIJhQ2BUPIi6Af3N2/B05u267+/idwvLL75fJ8NvTMCm3RIDDUz+tvCuYf
         FsQGC0tAOZHkN0bvNWSLD8NiLvopRnCQVmIKLSRFXVhZEHBCsKE1a7pEg/2vKPoq6k
         qbv+dEvu2bPCVS5w6K++KeHJGNpgyJoRzWfMBagZiBshuXADnC7SV16MXu9VAIKtCw
         6Bx2m/Awz1tMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from sus.fritz.box ([213.152.115.159]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mo6qv-1qS5vI3Zoh-00pdjg; Tue, 30
 May 2023 17:38:55 +0200
From:   Friedrich Vock <friedrich.vock@gmx.de>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Friedrich Vock <friedrich.vock@gmx.de>
Subject: [PATCH] Input: i8042 - Add quirk for polling the KBD port
Date:   Tue, 30 May 2023 17:36:44 +0200
Message-Id: <20230530153644.17262-1-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nq4IbBmU2DYQwHw5nHo4VmnCxUzxqIC/GGlHcHTs2Y8DYZnDnTU
 eR5qpYwim0oT7oP011e6vTALNVbOK7IkkcD93drk1qL3S+RO6s4w3ps7Rr/q+t141Wq3Mq/
 3STJFhe8uL0R4yfu29fy39UDtWTHERmfGVU5oD8pR/uEiKv44Cx0nj6Ddqfcdg5UxxHn9uh
 MF81R9WHRsEFlohnU3BqA==
UI-OutboundReport: notjunk:1;M01:P0:U33LS48FkuY=;YLQ3levY1Qt/eNGrkyN4H9kwx9B
 2UBUkT1T1vyQJHQ8eeNfbTbwioEqKSyP3F5K0mb8xFV1iuhlJc654lydWHK/UtYmqJvN7Z4FI
 xoMeUgZZaVYmqARpUManRZdI2Hd2e7XNjdr+dMhCDawzZ5SoD1ybLzyiYHduL4zXoe0lfCxVF
 aNZ5Q4eRFBzIlUWgdcHLkCCn/QjNcIa/RMaQAa3SiteUHC5xoSQKMYHfK/XSyyMpT57552pcw
 iqJOtmoYRKlZQZWl22sRumZT0pNS2Xy4HiMSFdq0Wp27UPAQhgye7+R1cFYXMKX9YNPyeXEbY
 UgCaY5FJWZNhs7sjr2HA63iM9QvWS3jmOOclZ0IYRAlWiZNE+4rFDthjWskP7e2d2Zs7sX2ng
 W4kYqIjx7GaUYHZdpMpSm/JLKZ1M22lTl0eZDMgK0Nhw58ckk3Ll89IhVUILwwygOMheQR66i
 q+oeks6Yk5qAodVlPGwVnknEMDAhXAb9p5uQCkLB3Tt9ak/j3+VLmDbLtRzUan5VkPiXg0/oz
 R28S8zq3RSMOdwU3FyOS2qphapgwXpx3qYGUClcoc14hCzgFihkNCNbn2bY7xmuaErfh5gTCJ
 lYpHj3Rk9woUVSCFZz2lDr25y508IWs4uB9R3Jc+NzoL44ypG8LRlRVEcLmJSLcpTmbmBGezb
 eMnSxDM3xQeqid717OrxSgiRWy1ueVJHWztOnISRvRfqiIm6rZlqQVMGFvU4iSDGf3giRA/Dy
 7mceG5j0LDKSdiKRJw8AIe4KniJi1JTD2xeniND55/tl0lpSPtQeZPtw3azUAw7iMNIeuS/zz
 cK9CV3ERomQJc9WvsM1/csQ9bjUQjJr7VovFdO5F5alKDQxA85YX2ub9qaH+ZY5oyaROeTmEF
 2w0RGQkZsk9AjMYVzEuK34p85ouGVDjtAFkVc1eesV5IWu7GscUXmKmG3SxYlzXhaNXicMm8/
 hevSr0B1MDFqX+6pFqr7cnneZfw=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It seems like there are some devices in the ASUS TUF A16 laptops that
just don't send any keyboard interrupts until you read from the KBD port.

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/input/serio/i8042-acpipnpio.h | 30 +++++++++++++++--
 drivers/input/serio/i8042.c           | 47 ++++++++++++++++++++++-----
 drivers/input/serio/i8042.h           |  2 +-
 3 files changed, 67 insertions(+), 12 deletions(-)

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i=
8042-acpipnpio.h
index 028e45bd050b..be2e72aaa658 100644
=2D-- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -83,6 +83,7 @@ static inline void i8042_write_command(int val)
 #define SERIO_QUIRK_KBDRESET		BIT(12)
 #define SERIO_QUIRK_DRITEK		BIT(13)
 #define SERIO_QUIRK_NOPNP		BIT(14)
+#define SERIO_QUIRK_POLL_KBD            BIT(15)

 /* Quirk table for different mainboards. Options similar or identical to =
i8042
  * module parameters.
@@ -99,6 +100,26 @@ static const struct dmi_system_id i8042_dmi_quirk_tabl=
e[] __initconst =3D {
 		},
 		.driver_data =3D (void *)(SERIO_QUIRK_NOMUX)
 	},
+	/* Some laptops seem to not trigger any keyboard interrupts at all,
+	 * even when there is data available. On these devices, manually
+	 * polling the keyboard port is required.
+	 */
+	{
+		/* ASUS TUF Gaming A16 with Ryzen 7 7735HS */
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FA617NS"),
+		},
+		.driver_data =3D (void *)(SERIO_QUIRK_POLL_KBD)
+	},
+	{
+		/* ASUS TUF Gaming A16 with Ryzen 9 7940HS */
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "FA617XS"),
+		},
+		.driver_data =3D (void *)(SERIO_QUIRK_POLL_KBD)
+	},
 	{
 		.matches =3D {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
@@ -1634,6 +1655,8 @@ static void __init i8042_check_quirks(void)
 	if (quirks & SERIO_QUIRK_NOPNP)
 		i8042_nopnp =3D true;
 #endif
+	if (quirks & SERIO_QUIRK_POLL_KBD)
+		i8042_poll_kbd =3D true;
 }
 #else
 static inline void i8042_check_quirks(void) {}
@@ -1667,7 +1690,7 @@ static int __init i8042_platform_init(void)

 	i8042_check_quirks();

-	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s\n"=
,
+	pr_debug("Active quirks (empty means none):%s%s%s%s%s%s%s%s%s%s%s%s%s%s\=
n",
 		i8042_nokbd ? " nokbd" : "",
 		i8042_noaux ? " noaux" : "",
 		i8042_nomux ? " nomux" : "",
@@ -1687,10 +1710,11 @@ static int __init i8042_platform_init(void)
 		"",
 #endif
 #ifdef CONFIG_PNP
-		i8042_nopnp ? " nopnp" : "");
+		i8042_nopnp ? " nopnp" : "",
 #else
-		"");
+		"",
 #endif
+		i8042_poll_kbd ? "poll_kbd" : "");

 	retval =3D i8042_pnp_init();
 	if (retval)
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 6dac7c1853a5..7212263d3a41 100644
=2D-- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -115,6 +115,10 @@ module_param_named(nopnp, i8042_nopnp, bool, 0);
 MODULE_PARM_DESC(nopnp, "Do not use PNP to detect controller settings");
 #endif

+static bool i8042_poll_kbd;
+module_param_named(poll_kbd, i8042_poll_kbd, bool, 0);
+MODULE_PARM_DESC(poll_kbd, "Continuously poll the KBD port instead of rel=
ying on interrupts");
+
 #define DEBUG
 #ifdef DEBUG
 static bool i8042_debug;
@@ -178,6 +182,24 @@ static irqreturn_t i8042_interrupt(int irq, void *dev=
_id);
 static bool (*i8042_platform_filter)(unsigned char data, unsigned char st=
r,
 				     struct serio *serio);

+#define POLL_TIME 1
+static void i8042_poll_func(struct timer_list *timer)
+{
+	unsigned char status;
+	unsigned long flags;
+
+	do {
+		spin_lock_irqsave(&i8042_lock, flags);
+		status =3D i8042_read_status();
+		spin_unlock_irqrestore(&i8042_lock, flags);
+		if (status & I8042_STR_OBF)
+			i8042_interrupt(0, NULL);
+	} while (status & I8042_STR_OBF);
+	mod_timer(timer, jiffies + msecs_to_jiffies(POLL_TIME));
+}
+
+DEFINE_TIMER(poll_timer, i8042_poll_func);
+
 void i8042_lock_chip(void)
 {
 	mutex_lock(&i8042_mutex);
@@ -1437,13 +1459,15 @@ static void i8042_unregister_ports(void)
 	}
 }

+
 static void i8042_free_irqs(void)
 {
 	if (i8042_aux_irq_registered)
 		free_irq(I8042_AUX_IRQ, i8042_platform_device);
-	if (i8042_kbd_irq_registered)
+	if (i8042_poll_kbd)
+		del_timer(&poll_timer);
+	else if (i8042_kbd_irq_registered)
 		free_irq(I8042_KBD_IRQ, i8042_platform_device);
-
 	i8042_aux_irq_registered =3D i8042_kbd_irq_registered =3D false;
 }

@@ -1497,10 +1521,14 @@ static int i8042_setup_kbd(void)
 	if (error)
 		return error;

-	error =3D request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
-			    "i8042", i8042_platform_device);
-	if (error)
-		goto err_free_port;
+	if (i8042_poll_kbd)
+		mod_timer(&poll_timer, msecs_to_jiffies(POLL_TIME));
+	else {
+		error =3D request_irq(I8042_KBD_IRQ, i8042_interrupt, IRQF_SHARED,
+				    "i8042", i8042_platform_device);
+		if (error)
+			goto err_free_port;
+	}

 	error =3D i8042_enable_kbd_port();
 	if (error)
@@ -1510,8 +1538,11 @@ static int i8042_setup_kbd(void)
 	return 0;

  err_free_irq:
-	free_irq(I8042_KBD_IRQ, i8042_platform_device);
- err_free_port:
+	if (i8042_poll_kbd)
+		del_timer(&poll_timer);
+	else
+		free_irq(I8042_KBD_IRQ, i8042_platform_device);
+err_free_port:
 	i8042_free_kbd_port();
 	return error;
 }
=2D-
2.40.1

