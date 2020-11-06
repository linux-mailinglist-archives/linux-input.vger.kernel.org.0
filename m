Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD8F2A9530
	for <lists+linux-input@lfdr.de>; Fri,  6 Nov 2020 12:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbgKFLZH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 6 Nov 2020 06:25:07 -0500
Received: from mout.gmx.net ([212.227.17.22]:44691 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727177AbgKFLZE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 6 Nov 2020 06:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1604661887;
        bh=WSxvkPudOyyiaDfsj7a64kEkFfmRpiTIS3V8A1N+QYw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=etqnfdbIOZN4mdA2ptPsk4TlmkSR2oWTG3wqaS+b+0DKEDXaVh11WOR1gT3W5P68U
         emjb8vxUmNlvKf1ncXvjY/bcJJMIL+MllbDjjx23T7HAHu/YdAz9gxPMoWECP29obm
         1KDfKXdXDdNr1TNhpA/RfRA3OGzBWeVj0vUKTkwk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.214.162]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3se8-1kAlpP08Nk-00zqEH; Fri, 06
 Nov 2020 12:24:47 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-input@vger.kernel.org
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] Input: ektf2127 - Add support for eKTF2132 touchscreen
Date:   Fri,  6 Nov 2020 12:24:11 +0100
Message-Id: <20201106112412.390724-3-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201106112412.390724-1-j.neuschaefer@gmx.net>
References: <20201106112412.390724-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vERlqI5wF5dJQBwBqxI1frV7e4W3ngJu/BWVKVJRGgnmJW3XQMd
 Nf44Nwpuc7gSckua7NTfCK6YZ7ymjnhroUfTqe2KxOs8Vmk8T/j18CcSc94fH8FauEGJBDl
 czBJOX89C4Btxqi9P0AE92c5qg1sqHQvN4s8C1S35lpFEWWha8z/14d+nmiSZsH3gs5hSGA
 HAcT7EAhoy+B0GbCfLnKw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JmeZI+fofTc=:xTrhwkRo+iuuGollH7Z3L5
 Fu3YQiBqL+VMq5HOBV89zy5gDmMmzSNMynQW6TC6uOjxGxIfTX6ez6Jia9Qk4auCfOpzG18Mu
 /kH+0p8fzzD2aJ9kzq9tyS/oKI9UhqQEX1DvdB2eamX1kpKINwGgl0Hr30fqiDZ3yyc3kxxZe
 NAKQR4QLHdqT4/PNWZC7QK/MRKERDB0lFTJg+HhMuTC4gdlO+RFjqLR6AlAJFx4WV/vVXEbYK
 YKCdfCYxDpIp40Qxc0RGr5bwisQ02V23GOeB8MbpvIbiFiF01reNIv6FVuo9z7AtFs0HMwUg4
 thNwuYRQPfD0YLMOOmDbdJ870EmHlMssOyT63b3TCFOTYLXu3Zl3QHg17FII5RDTAW7FHKuca
 RQqO8jJzKidESfFdsKhb/akVsZYo/PHCFciL5Za/Qv1x5cHumLBSTRUlNZNZWGbkV8q4xj30X
 zPO3D//cvFjraEwDCmHnWrXutes7cJIVyw9G2hdhijhLKJTdkmGXNBgfe2mLFMZCid/MWD/dm
 7GlNeyCOwQuweKXXI3Wfz9si/PIVk8BQFahpuc5GAW6ponQCOP5uOajQahNczS78c9Z+Y4JDY
 IQXhyufKT9XZw1IkPpRaagkNbManveimsMiO4I/+XB2U6tavSkq5esLXC48HchE6McRmNNfe9
 66bYKUfUOB4rYMlCYN8LpJLEykQUyy19emM1kEcSEuXQn3diCg7ElwzggroZfXNFP9y1Y5l6S
 a5m/npoAOj2crj0+Hwhp/mP7h+jQqp/lJAA0tZpaMCzWsZAfMahGx0zrl3owCoeUS2Q/ffQrB
 oWz4Rl+DHY2J+AtDiPJjCrBTHWBKYZYzHrPzmSMdoAugzN38cnrVCDWlF4XGELqDgqNZ2G1xC
 HOjRKjFrwDpmsia6FX0WvZM7cXD12uXXsF9uQimeQ=
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The eKTF2132 is a touchscreen controller found, for example, in the Kobo
Aura ebook reader. It is similar to the ektf2127, but it uses a different
packet type to report touch events.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/input/touchscreen/ektf2127.c | 32 +++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/ektf2127.c b/drivers/input/touchscr=
een/ektf2127.c
index eadd389cf81fe..491de67ddbcd7 100644
=2D-- a/drivers/input/touchscreen/ektf2127.c
+++ b/drivers/input/touchscreen/ektf2127.c
@@ -28,6 +28,7 @@
 #define EKTF2127_RESPONSE		0x52
 #define EKTF2127_REQUEST		0x53
 #define EKTF2127_HELLO			0x55
+#define EKTF2127_REPORT2		0x5a
 #define EKTF2127_REPORT			0x5d
 #define EKTF2127_CALIB_DONE		0x66

@@ -95,6 +96,29 @@ static void ektf2127_report_event(struct ektf2127_ts *t=
s, const u8 *buf)
 	input_sync(ts->input);
 }

+static void ektf2127_report2_contact(struct ektf2127_ts *ts, int slot,
+				     const u8 *buf, bool active)
+{
+	input_mt_slot(ts->input, slot);
+	input_mt_report_slot_state(ts->input, MT_TOOL_FINGER, active);
+
+	if (active) {
+		int x =3D (buf[0] & 0xf0) << 4 | buf[1];
+		int y =3D (buf[0] & 0x0f) << 8 | buf[2];
+
+		touchscreen_report_pos(ts->input, &ts->prop, x, y, true);
+	}
+}
+
+static void ektf2127_report2_event(struct ektf2127_ts *ts, const u8 *buf)
+{
+	ektf2127_report2_contact(ts, 0, &buf[1], !!(buf[7] & 2));
+	ektf2127_report2_contact(ts, 1, &buf[4], !!(buf[7] & 4));
+
+	input_mt_sync_frame(ts->input);
+	input_sync(ts->input);
+}
+
 static irqreturn_t ektf2127_irq(int irq, void *dev_id)
 {
 	struct ektf2127_ts *ts =3D dev_id;
@@ -113,6 +137,10 @@ static irqreturn_t ektf2127_irq(int irq, void *dev_id=
)
 		ektf2127_report_event(ts, buf);
 		break;

+	case EKTF2127_REPORT2:
+		ektf2127_report2_event(ts, buf);
+		break;
+
 	case EKTF2127_NOISE:
 		if (buf[1] =3D=3D EKTF2127_ENV_NOISY)
 			dev_dbg(dev, "Environment is electrically noisy\n");
@@ -305,6 +333,7 @@ static int ektf2127_probe(struct i2c_client *client,
 #ifdef CONFIG_OF
 static const struct of_device_id ektf2127_of_match[] =3D {
 	{ .compatible =3D "elan,ektf2127" },
+	{ .compatible =3D "elan,ektf2132" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, ektf2127_of_match);
@@ -312,6 +341,7 @@ MODULE_DEVICE_TABLE(of, ektf2127_of_match);

 static const struct i2c_device_id ektf2127_i2c_id[] =3D {
 	{ "ektf2127", 0 },
+	{ "ektf2132", 0 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ektf2127_i2c_id);
@@ -327,6 +357,6 @@ static struct i2c_driver ektf2127_driver =3D {
 };
 module_i2c_driver(ektf2127_driver);

-MODULE_DESCRIPTION("ELAN eKTF2127 I2C Touchscreen Driver");
+MODULE_DESCRIPTION("ELAN eKTF2127/eKTF2132 I2C Touchscreen Driver");
 MODULE_AUTHOR("Michel Verlaan, Siebren Vroegindeweij");
 MODULE_LICENSE("GPL");
=2D-
2.28.0

