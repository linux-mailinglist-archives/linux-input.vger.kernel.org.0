Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8073EF012
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 18:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbhHQQTv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Aug 2021 12:19:51 -0400
Received: from mout.gmx.net ([212.227.17.21]:43191 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230311AbhHQQTv (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Aug 2021 12:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1629217129;
        bh=6d62GHaR16j889xQu227SMuKqAaGWdZSEM07ry1VbGY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=BE5Mg8MYOWJnslF41MFqHYWLuls9PRd2LVRL+VI7/j98Pzf9e15gfV/hVJJqUZKUL
         /IW2vsl32W/EhbkYL7wB30h4YMDItQoGQXASJnQyUrqWFwwW2yfdW5Y03ciiBV963Q
         BLNFtHfqREX412l4xNpks3z7qbOVUs+gyqBXocWY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1M5fIQ-1m8uGJ00Co-007GnP; Tue, 17 Aug 2021 18:18:49 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Len Baker <len.baker@gmx.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev
Subject: [PATCH] input/serio: Prefer strscpy over strlcpy
Date:   Tue, 17 Aug 2021 18:18:21 +0200
Message-Id: <20210817161821.4601-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cVjM42hyj7Yg2sdAFf92EXksKh4PjN9k4DJzqoGjImNXO1g2UpW
 mQCukzo8TYFLhmldeE5stsb1/XVg2WXEamu78uUt5YLtkbfluHJzVvA5EAnorW2XMqbwdTV
 M2xrfTCuMeKxruAO5hFZkuqVxxV77iB91E3lpHqldS5rxZv1I5PDe359pBT0pJVRopYVKP7
 6JIKaZFfzqRZs7oAN2jOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:iFSbFdrOfrc=:pXQUYiMFc47qV9zXttLrRn
 cfg26AjMCv1TkVP9SPYTS3rOYMwFKHUlrH9Ammcq5z4aYmn1+4opIBs5EX3osd6zcKRphG48X
 VfICfk/wdiJKQ/+FK0cbgDF6qpI6YnD2GBPkf8cm+NhQYKo/KVGcAAIHzbM0ZZ9bJq9I4cFSu
 gV7xTvTG4sF/nLpAb2c1Dz5zBdeVSKRqFkwb0mkxf8P+zpJIgwnHUfDQEVeZDUlfr/xYDBkbG
 g8FE7nhrtqNI0wNV4xXfRH7pXS3RRQNRAVxD0RT0tIw9QqI3E5apvWRUcWdgH9JVUjVgAM6z2
 8BuKUwr6sl5CsXno8vnsIHEV8eYUy6v0UzGf2J1PHaNlyEX7xgG4klo5HJrVsHuld1vhGm7rS
 9MWfn4WWpCG8bQXE7U3jn4tAj3UC8G31lnA/kTus3REyhSw05r7scjXo/B8X3rTvLC9H+Gz9b
 Vnho40uzPc/ucWDRzVMF0UazSnwMcYL4QYNy0MrwJX7/sNLNrLMU4eazkK9Ep4CnH5W/T/aGi
 d4Ewf5zAjKgjBG3acKdXfMaax497rhaUN4XDi3CQSLXWRiS9Bux74HcgCy3XpI47eXu3UtleB
 AVfrLkAs7uNt4J05X9jVKOkJy6uhFup7kfJgQu75IE5THwn65gWFhmgkvPJSwt0idFA7AUdi0
 C0/hvhiMy+enDms4Y8HQzRn5TPL03d2X8l5wy23TCasaVxkUL+9xM6Z2+MMJvetnM2YYwSaRn
 KVeNV0Fl8K+xeI8zY7IgsCwqTz5/q39MMyrdksvwi9sA/Pc97DW1Bg1JBt8r55Z+gegJNA3GX
 XmG83j9Mz+j2YT/oBBA/6gtM72HOH0neW8naD83Eq1kdpmryqfvFT4TfXugWtM9w0glfKEVsk
 1NBDtG18OuCSypgoZq+DgjaHOpA1QkUFlCcQJa0r8LNxymxDa4ow0wUeShOtkCwqxxUul9GWN
 vYTgC/InS1kDPZWISASm7yCErB0jXRPO/KOW8flZUpZ3YsEo6Zpg7qzzKSpk7WvuHOVPLFoTc
 412Lr9HtiXKdHtWbejBEMt8rHIHksdmDTQPrUidvLeLpFDcaGNseAOuHIorBERxAT0EkA8UPw
 AxY6nKIhC2elNFHAEFa6AStYzvwEtipIONjVs9yAJHi8ayk0ibyKl5DdA==
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

strlcpy() reads the entire source buffer first. This read may exceed the
destination size limit. This is both inefficient and can lead to linear
read overflows if a source string is not NUL-terminated. The safe
replacement is strscpy().

This is a previous step in the path to remove the strlcpy() function
entirely from the kernel [1].

In the case where a constant string is copied, the strscpy() is not
very useful (we know that a read overflow can not happen, and if the
dst is big enough that the string will not be truncated). However,
the change is made to avoid the use of strlcpy().

[1] https://github.com/KSPP/linux/issues/89

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
Hi Dmitry,

If you disagree with the constant string copy changes I can use
strcpy or memcpy instead. In this discussion [2] the patch was
rejected since it not fixed any real issue. However, if we want
to cleanup the proliferation of str*cpy() functions in the kernel
this can be a good start point.

[2] https://lore.kernel.org/linux-hardening/YQbXiwie4YPzPWKK@google.com/

Regards,
Len

 drivers/input/serio/altera_ps2.c      |  4 ++--
 drivers/input/serio/ams_delta_serio.c |  4 ++--
 drivers/input/serio/apbps2.c          |  2 +-
 drivers/input/serio/ct82c710.c        |  2 +-
 drivers/input/serio/i8042.c           | 14 +++++++-------
 drivers/input/serio/olpc_apsp.c       |  8 ++++----
 drivers/input/serio/parkbd.c          |  2 +-
 drivers/input/serio/pcips2.c          |  4 ++--
 drivers/input/serio/ps2-gpio.c        |  4 ++--
 drivers/input/serio/ps2mult.c         |  2 +-
 drivers/input/serio/q40kbd.c          |  4 ++--
 drivers/input/serio/rpckbd.c          |  4 ++--
 drivers/input/serio/sa1111ps2.c       |  4 ++--
 drivers/input/serio/serport.c         |  2 +-
 drivers/input/serio/sun4i-ps2.c       |  4 ++--
 15 files changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/input/serio/altera_ps2.c b/drivers/input/serio/altera=
_ps2.c
index 379e9240c2b3..3a92304f64fb 100644
=2D-- a/drivers/input/serio/altera_ps2.c
+++ b/drivers/input/serio/altera_ps2.c
@@ -110,8 +110,8 @@ static int altera_ps2_probe(struct platform_device *pd=
ev)
 	serio->write		=3D altera_ps2_write;
 	serio->open		=3D altera_ps2_open;
 	serio->close		=3D altera_ps2_close;
-	strlcpy(serio->name, dev_name(&pdev->dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(&pdev->dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
 	serio->port_data	=3D ps2if;
 	serio->dev.parent	=3D &pdev->dev;
 	ps2if->io		=3D serio;
diff --git a/drivers/input/serio/ams_delta_serio.c b/drivers/input/serio/a=
ms_delta_serio.c
index 1c0be299f179..ec93cb4573c3 100644
=2D-- a/drivers/input/serio/ams_delta_serio.c
+++ b/drivers/input/serio/ams_delta_serio.c
@@ -159,8 +159,8 @@ static int ams_delta_serio_init(struct platform_device=
 *pdev)
 	serio->id.type =3D SERIO_8042;
 	serio->open =3D ams_delta_serio_open;
 	serio->close =3D ams_delta_serio_close;
-	strlcpy(serio->name, "AMS DELTA keyboard adapter", sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
+	strscpy(serio->name, "AMS DELTA keyboard adapter", sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&pdev->dev), sizeof(serio->phys));
 	serio->dev.parent =3D &pdev->dev;
 	serio->port_data =3D priv;

diff --git a/drivers/input/serio/apbps2.c b/drivers/input/serio/apbps2.c
index 974d7bfae0a0..9c9ce097f8bf 100644
=2D-- a/drivers/input/serio/apbps2.c
+++ b/drivers/input/serio/apbps2.c
@@ -176,7 +176,7 @@ static int apbps2_of_probe(struct platform_device *ofd=
ev)
 	priv->io->close =3D apbps2_close;
 	priv->io->write =3D apbps2_write;
 	priv->io->port_data =3D priv;
-	strlcpy(priv->io->name, "APBPS2 PS/2", sizeof(priv->io->name));
+	strscpy(priv->io->name, "APBPS2 PS/2", sizeof(priv->io->name));
 	snprintf(priv->io->phys, sizeof(priv->io->phys),
 		 "apbps2_%d", apbps2_idx++);

diff --git a/drivers/input/serio/ct82c710.c b/drivers/input/serio/ct82c710=
.c
index d45009d654bf..752ce60e2211 100644
=2D-- a/drivers/input/serio/ct82c710.c
+++ b/drivers/input/serio/ct82c710.c
@@ -170,7 +170,7 @@ static int ct82c710_probe(struct platform_device *dev)
 	ct82c710_port->open =3D ct82c710_open;
 	ct82c710_port->close =3D ct82c710_close;
 	ct82c710_port->write =3D ct82c710_write;
-	strlcpy(ct82c710_port->name, "C&T 82c710 mouse port",
+	strscpy(ct82c710_port->name, "C&T 82c710 mouse port",
 		sizeof(ct82c710_port->name));
 	snprintf(ct82c710_port->phys, sizeof(ct82c710_port->phys),
 		 "isa%16llx/serio0", (unsigned long long)CT82C710_DATA);
diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index 0b9f1d0a8f8b..681b1f9678a7 100644
=2D-- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -1337,9 +1337,9 @@ static int __init i8042_create_kbd_port(void)
 	serio->ps2_cmd_mutex	=3D &i8042_mutex;
 	serio->port_data	=3D port;
 	serio->dev.parent	=3D &i8042_platform_device->dev;
-	strlcpy(serio->name, "i8042 KBD port", sizeof(serio->name));
-	strlcpy(serio->phys, I8042_KBD_PHYS_DESC, sizeof(serio->phys));
-	strlcpy(serio->firmware_id, i8042_kbd_firmware_id,
+	strscpy(serio->name, "i8042 KBD port", sizeof(serio->name));
+	strscpy(serio->phys, I8042_KBD_PHYS_DESC, sizeof(serio->phys));
+	strscpy(serio->firmware_id, i8042_kbd_firmware_id,
 		sizeof(serio->firmware_id));
 	set_primary_fwnode(&serio->dev, i8042_kbd_fwnode);

@@ -1367,15 +1367,15 @@ static int __init i8042_create_aux_port(int idx)
 	serio->port_data	=3D port;
 	serio->dev.parent	=3D &i8042_platform_device->dev;
 	if (idx < 0) {
-		strlcpy(serio->name, "i8042 AUX port", sizeof(serio->name));
-		strlcpy(serio->phys, I8042_AUX_PHYS_DESC, sizeof(serio->phys));
-		strlcpy(serio->firmware_id, i8042_aux_firmware_id,
+		strscpy(serio->name, "i8042 AUX port", sizeof(serio->name));
+		strscpy(serio->phys, I8042_AUX_PHYS_DESC, sizeof(serio->phys));
+		strscpy(serio->firmware_id, i8042_aux_firmware_id,
 			sizeof(serio->firmware_id));
 		serio->close =3D i8042_port_close;
 	} else {
 		snprintf(serio->name, sizeof(serio->name), "i8042 AUX%d port", idx);
 		snprintf(serio->phys, sizeof(serio->phys), I8042_MUX_PHYS_DESC, idx + 1=
);
-		strlcpy(serio->firmware_id, i8042_aux_firmware_id,
+		strscpy(serio->firmware_id, i8042_aux_firmware_id,
 			sizeof(serio->firmware_id));
 	}

diff --git a/drivers/input/serio/olpc_apsp.c b/drivers/input/serio/olpc_ap=
sp.c
index 59de8d9b6710..04d2db982fb8 100644
=2D-- a/drivers/input/serio/olpc_apsp.c
+++ b/drivers/input/serio/olpc_apsp.c
@@ -199,8 +199,8 @@ static int olpc_apsp_probe(struct platform_device *pde=
v)
 	kb_serio->close		=3D olpc_apsp_close;
 	kb_serio->port_data	=3D priv;
 	kb_serio->dev.parent	=3D &pdev->dev;
-	strlcpy(kb_serio->name, "sp keyboard", sizeof(kb_serio->name));
-	strlcpy(kb_serio->phys, "sp/serio0", sizeof(kb_serio->phys));
+	strscpy(kb_serio->name, "sp keyboard", sizeof(kb_serio->name));
+	strscpy(kb_serio->phys, "sp/serio0", sizeof(kb_serio->phys));
 	priv->kbio		=3D kb_serio;
 	serio_register_port(kb_serio);

@@ -216,8 +216,8 @@ static int olpc_apsp_probe(struct platform_device *pde=
v)
 	pad_serio->close	=3D olpc_apsp_close;
 	pad_serio->port_data	=3D priv;
 	pad_serio->dev.parent	=3D &pdev->dev;
-	strlcpy(pad_serio->name, "sp touchpad", sizeof(pad_serio->name));
-	strlcpy(pad_serio->phys, "sp/serio1", sizeof(pad_serio->phys));
+	strscpy(pad_serio->name, "sp touchpad", sizeof(pad_serio->name));
+	strscpy(pad_serio->phys, "sp/serio1", sizeof(pad_serio->phys));
 	priv->padio		=3D pad_serio;
 	serio_register_port(pad_serio);

diff --git a/drivers/input/serio/parkbd.c b/drivers/input/serio/parkbd.c
index 3ac57a91ede4..6bee653d1965 100644
=2D-- a/drivers/input/serio/parkbd.c
+++ b/drivers/input/serio/parkbd.c
@@ -169,7 +169,7 @@ static struct serio *parkbd_allocate_serio(void)
 	if (serio) {
 		serio->id.type =3D parkbd_mode;
 		serio->write =3D parkbd_write;
-		strlcpy(serio->name, "PARKBD AT/XT keyboard adapter", sizeof(serio->nam=
e));
+		strscpy(serio->name, "PARKBD AT/XT keyboard adapter", sizeof(serio->nam=
e));
 		snprintf(serio->phys, sizeof(serio->phys), "%s/serio0", parkbd_dev->por=
t->name);
 	}

diff --git a/drivers/input/serio/pcips2.c b/drivers/input/serio/pcips2.c
index bedf75de0a2c..05878750f2c2 100644
=2D-- a/drivers/input/serio/pcips2.c
+++ b/drivers/input/serio/pcips2.c
@@ -149,8 +149,8 @@ static int pcips2_probe(struct pci_dev *dev, const str=
uct pci_device_id *id)
 	serio->write		=3D pcips2_write;
 	serio->open		=3D pcips2_open;
 	serio->close		=3D pcips2_close;
-	strlcpy(serio->name, pci_name(dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
+	strscpy(serio->name, pci_name(dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
 	serio->port_data	=3D ps2if;
 	serio->dev.parent	=3D &dev->dev;
 	ps2if->io		=3D serio;
diff --git a/drivers/input/serio/ps2-gpio.c b/drivers/input/serio/ps2-gpio=
.c
index 8970b49ea09a..1e5e8d94220a 100644
=2D-- a/drivers/input/serio/ps2-gpio.c
+++ b/drivers/input/serio/ps2-gpio.c
@@ -393,8 +393,8 @@ static int ps2_gpio_probe(struct platform_device *pdev=
)
 	serio->write =3D drvdata->write_enable ? ps2_gpio_write : NULL;
 	serio->port_data =3D drvdata;
 	serio->dev.parent =3D dev;
-	strlcpy(serio->name, dev_name(dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(dev), sizeof(serio->phys));

 	drvdata->serio =3D serio;
 	drvdata->dev =3D dev;
diff --git a/drivers/input/serio/ps2mult.c b/drivers/input/serio/ps2mult.c
index 0071dd5ebcc2..902e81826fbf 100644
=2D-- a/drivers/input/serio/ps2mult.c
+++ b/drivers/input/serio/ps2mult.c
@@ -131,7 +131,7 @@ static int ps2mult_create_port(struct ps2mult *psm, in=
t i)
 	if (!serio)
 		return -ENOMEM;

-	strlcpy(serio->name, "TQC PS/2 Multiplexer", sizeof(serio->name));
+	strscpy(serio->name, "TQC PS/2 Multiplexer", sizeof(serio->name));
 	snprintf(serio->phys, sizeof(serio->phys),
 		 "%s/port%d", mx_serio->phys, i);
 	serio->id.type =3D SERIO_8042;
diff --git a/drivers/input/serio/q40kbd.c b/drivers/input/serio/q40kbd.c
index bd248398556a..a1c61f5de047 100644
=2D-- a/drivers/input/serio/q40kbd.c
+++ b/drivers/input/serio/q40kbd.c
@@ -126,8 +126,8 @@ static int q40kbd_probe(struct platform_device *pdev)
 	port->close =3D q40kbd_close;
 	port->port_data =3D q40kbd;
 	port->dev.parent =3D &pdev->dev;
-	strlcpy(port->name, "Q40 Kbd Port", sizeof(port->name));
-	strlcpy(port->phys, "Q40", sizeof(port->phys));
+	strscpy(port->name, "Q40 Kbd Port", sizeof(port->name));
+	strscpy(port->phys, "Q40", sizeof(port->phys));

 	q40kbd_stop();

diff --git a/drivers/input/serio/rpckbd.c b/drivers/input/serio/rpckbd.c
index 37fe6a5711ea..7008bc101415 100644
=2D-- a/drivers/input/serio/rpckbd.c
+++ b/drivers/input/serio/rpckbd.c
@@ -128,8 +128,8 @@ static int rpckbd_probe(struct platform_device *dev)
 	serio->close		=3D rpckbd_close;
 	serio->dev.parent	=3D &dev->dev;
 	serio->port_data	=3D rpckbd;
-	strlcpy(serio->name, "RiscPC PS/2 kbd port", sizeof(serio->name));
-	strlcpy(serio->phys, "rpckbd/serio0", sizeof(serio->phys));
+	strscpy(serio->name, "RiscPC PS/2 kbd port", sizeof(serio->name));
+	strscpy(serio->phys, "rpckbd/serio0", sizeof(serio->phys));

 	platform_set_drvdata(dev, serio);
 	serio_register_port(serio);
diff --git a/drivers/input/serio/sa1111ps2.c b/drivers/input/serio/sa1111p=
s2.c
index 68fac4801e2e..2724c3aa512c 100644
=2D-- a/drivers/input/serio/sa1111ps2.c
+++ b/drivers/input/serio/sa1111ps2.c
@@ -267,8 +267,8 @@ static int ps2_probe(struct sa1111_dev *dev)
 	serio->write		=3D ps2_write;
 	serio->open		=3D ps2_open;
 	serio->close		=3D ps2_close;
-	strlcpy(serio->name, dev_name(&dev->dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(&dev->dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(&dev->dev), sizeof(serio->phys));
 	serio->port_data	=3D ps2if;
 	serio->dev.parent	=3D &dev->dev;
 	ps2if->io		=3D serio;
diff --git a/drivers/input/serio/serport.c b/drivers/input/serio/serport.c
index 7fbbe00e3553..50295b17cca4 100644
=2D-- a/drivers/input/serio/serport.c
+++ b/drivers/input/serio/serport.c
@@ -171,7 +171,7 @@ static ssize_t serport_ldisc_read(struct tty_struct * =
tty, struct file * file,
 	if (!serio)
 		return -ENOMEM;

-	strlcpy(serio->name, "Serial port", sizeof(serio->name));
+	strscpy(serio->name, "Serial port", sizeof(serio->name));
 	snprintf(serio->phys, sizeof(serio->phys), "%s/serio0", tty_name(tty));
 	serio->id =3D serport->id;
 	serio->id.type =3D SERIO_RS232;
diff --git a/drivers/input/serio/sun4i-ps2.c b/drivers/input/serio/sun4i-p=
s2.c
index f15ed3dcdb9b..eb262640192e 100644
=2D-- a/drivers/input/serio/sun4i-ps2.c
+++ b/drivers/input/serio/sun4i-ps2.c
@@ -256,8 +256,8 @@ static int sun4i_ps2_probe(struct platform_device *pde=
v)
 	serio->close =3D sun4i_ps2_close;
 	serio->port_data =3D drvdata;
 	serio->dev.parent =3D dev;
-	strlcpy(serio->name, dev_name(dev), sizeof(serio->name));
-	strlcpy(serio->phys, dev_name(dev), sizeof(serio->phys));
+	strscpy(serio->name, dev_name(dev), sizeof(serio->name));
+	strscpy(serio->phys, dev_name(dev), sizeof(serio->phys));

 	/* shutoff interrupt */
 	writel(0, drvdata->reg_base + PS2_REG_GCTL);
=2D-
2.25.1

