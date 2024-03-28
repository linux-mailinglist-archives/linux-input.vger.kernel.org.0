Return-Path: <linux-input+bounces-2610-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89D88F51F
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 03:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 800A21C291C9
	for <lists+linux-input@lfdr.de>; Thu, 28 Mar 2024 02:07:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5BD722EED;
	Thu, 28 Mar 2024 02:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="DGjdFRdg"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04olkn2092.outbound.protection.outlook.com [40.92.75.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B272374E
	for <linux-input@vger.kernel.org>; Thu, 28 Mar 2024 02:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.75.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711591643; cv=fail; b=ge5LU2C3G0rvt7GoEmoFTG8uHKZ+Jya8iGWU2ZZ+nKQREaT4ph6NqVlSu9RvqzqtkoMISLzwKALEl1dit1I8Ti1aohLD/BfkBHqv+gHXNNhJnLMRbkT2+Ot/JOUsdNc3O1spxMJhBdY4XVvgPPvaK1y8SYRZju7a0fIvZ0piiX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711591643; c=relaxed/simple;
	bh=zmHUM1ukF89NbOg7yFgUv1StRBZgvgixmVLWLjUg9wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bIo8EYIsVSwHyIViKfJWXZVFMwTL4kMTxkrP4RXQOLWzrrXWPml08GmigJdyay+P6sUiF8czCdCuA3/sEQoDqmHHzwZ8QW2FAdloUEeicjRqiMXV2pD92ujapC12Br8hrWuAnv+yaJ9n4OuqzzJPIoC4gjFUd+PfXZMjNGh3S/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=DGjdFRdg; arc=fail smtp.client-ip=40.92.75.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GaSqG7UmpgqnILhoUVeU/56wa1/hlhh6lDqVSvmSRn9LiE24ZluKif34IwlXumlSzjzFtk+gNAmX74uOL0Kau1hhgZk3CzpUfOgWcekDOjRTx/o+rXenYJAOJf/ki8kRLA6DOG5F9/JWBBr4gphpy4PvpUoYespwOn9ffIZaEL7/a2ANJd/S+eThdDK/rHWuhowBUKRWIkFZWOm3jz9PWDPkH/sWFR7F9pFDiHHp2wO3wM/+uh6l1U37lOEI5Y3IYCWi12zjx9CtjJ9nIwJgZUHRhTM1lAYiY+DdIgNC7NTdq+60Rx3V7IqQK7iRuZLXmW9/8e92XXjhRKWtSm+OoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Y1lEghSJrQ8R3KO67SGPlrrODMyoPjHi4QaDyiup1Q=;
 b=iHx535G0tZhGGvwEo1bZM6DlAsyhhxH7FPyTBxWpB7WixGktTbXqNJSH7kSEgENH5yTh+MWdoFT/ZmJ4wsVJdWDpZ2LSJZSO4QkzrEJZiC7IuZZd7t35c5g07862lX8ZHJ2fS8jCzcFPSCeUKnwwvsnxwdGeSmJLc5GW/OTFOPUzjpMz8eU1CpRl5sks1euw/ZW0w9L/GZYrpi+586mzs9bAIjATLe7X9XCrgqdSW7FlSVngFgr6wjZkYrKR8VzUO/7o4ovSEH2hUDiJQyaojeHvhK8uPu+eIDmyxuNPMhtnPC4NQMQdPxyOxp2vIF//rM8gQrmwk5idw6oF+lcDkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Y1lEghSJrQ8R3KO67SGPlrrODMyoPjHi4QaDyiup1Q=;
 b=DGjdFRdglKlkaHg2GoQ+kWGJnx3KXIRU7uFeP1xjNNHtp1cvQErvMQI3g9m+L2I79tfTNnRbIXj4RPML+SKGkJbxcnoe4uZbXp9nYit2PKSu5eDoQ687i3K2lrhGcUAtVV/lOpVu1TkhBh7LkoCmE3nsvbTo2Y+0w3xA6z6t6aJSkmD+52qi1UafuGfwBbm1kGeSs2Q0hntro/5XKX8MQ7itz1BhNEkH/qjDw7TSV7jJhMwmQTtp4oMBHQYjDvJ6XdtdUwWNTDr+jPtlJjGd/HeHoDc+cdUDb1jLoF2pItwXSp78qZOpE4rEC1rnJNny86iDnbNThWTVYKk+ImBBXw==
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:ba::18)
 by DB8P189MB0871.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:166::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 02:07:16 +0000
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::bcb9:1083:b7d9:e9a7]) by PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::bcb9:1083:b7d9:e9a7%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 02:07:16 +0000
From: Milas Robin <milas.robin@live.fr>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Milas Robin <milas.robin@live.fr>
Subject: [PATCH 1/1] Input: add gamecube adapter support
Date: Thu, 28 Mar 2024 03:06:51 +0100
Message-ID:
 <PA4P189MB14691B0AE72AC83713D8557CFA3B2@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240328020651.358662-1-milas.robin@live.fr>
References: <20240328020651.358662-1-milas.robin@live.fr>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [n5pZybKzX6zdSmvFdRVxBTk4YM8XGoGRzTr9raVLDdYUGL6h73md5i/zTF91swWG]
X-ClientProxiedBy: PA7P264CA0166.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::17) To PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:ba::18)
X-Microsoft-Original-Message-ID: <20240328020651.358662-2-milas.robin@live.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P189MB1469:EE_|DB8P189MB0871:EE_
X-MS-Office365-Filtering-Correlation-Id: bdaa0ef5-f962-4794-3a1c-08dc4ecbca64
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0DiZJ8hK5p0OCTHCmJZacypdlbFSHFr25AwOwjXHW4Mvb6OugWsIVMLIrsYx4UEiP/9Gi1SRl6DgzQaVZlF3STHnWpEQlh4OGP9RIT7gDTiaEaXoB42Gd+PACck3E981AcDX0L2lqCTnwmMyklBW9eKL92lUqL4jB6p3e0orYBmEZQEsUcNRnu195bAHfa9krCI1wwQRQemHy410JNLy3l4kknIOHj0DGYVAqiI/wXbeCk3Se2UyrE/O6aaOXFYSn3YQC4TjRI2y60pILK/SwtAL9LuxyAwZN4HvLq6hzEU30jLsr52+q7PS53609e2SNRzrV7h7DFkYaUmSv7Q4pFMOUSmNvoHIUbZw0GKtb2ZpvUQQfAt/aY9V0KoXZsYQhG3YfqEEvic8Qi3UxDJFpD+0TIYbrQSY8IxGicx6B3p5u798i2nyMG+flM4YXaEDRbUgW3kgah5SZmse7GgfM/3iF/qTuM5kKUX8ha6qpZUsj6SYttewc6+Lm+1eMK2g3SIdlCPBIut/uQCkg5fuglyBCeAej20WueTTsz+9bH2zyckOoQOBVcDUtEoBkXVXvqj3hJOGCUcJSQITeL3UAAf6IDxgFmefnzmMsQqqWLljcP7Yhx0HaLHlIN3AbYJI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HhWOjwTwHVMd6KHI6IVogEyDcaoSrEokEEXpbZSeM5yXgfp9ACVs4s3N9Gam?=
 =?us-ascii?Q?rIZnaaxfX+FwaH7OnoNZp2VZ/d6vQzGbi9p0y6Ku2J+6WJWjAvnBluT7ti8F?=
 =?us-ascii?Q?szXQwXbiJiBpkwo7WXLc/4r/ZW47FSpb5TG4r9SvuE3O5aVlQgVLk7UCxN4U?=
 =?us-ascii?Q?Guddj5D+bmh5qpTe1KV1fUcBaexGJlo+8NvQ6QpyCp9dGUjW9xWecY/5IHhr?=
 =?us-ascii?Q?IoHBTuVxUL09sY1OqliImsbrSMtiJlXqEd7jGhFF98Ik+fEIcBjhzDoOuLWF?=
 =?us-ascii?Q?qGiYL8D8oT8eAWE/IKN65Wyo5y/zIrpFXVOL9adH1NYc5aijDJHyVmJjMbAg?=
 =?us-ascii?Q?xVtEQOLUWoxq1Y8/7uZe44ab7vH7rOPEE+x0rjrnXCnI8nrw57rOJ5xYPBEP?=
 =?us-ascii?Q?TE4tZGQsCkgdY3Yx9WhA67jasM1h1KyRZr00rsSloeWbY2dGfrYJeJ1csy6Z?=
 =?us-ascii?Q?NnBZAXISV/irPjXwGNWd8iTgVdBObrXFQxQbN5DDiWKjVX0pfFXGd4STH7Du?=
 =?us-ascii?Q?HqMF1Mudw+2+tYHz5K1QMEnrNHiFeoRZZIYeKgHBNygTYL/4srVZvMxsDQn2?=
 =?us-ascii?Q?b92CwN6EZkxUWfJ+Mlf+Lz2wahZb4yWiD8Sj99VXke+0/OEQ+T2efNEAGNEG?=
 =?us-ascii?Q?hri9G2bBfLPl6u3vPw31+Jjx82HtugaPqddHTSISo2tCbL0O/dn6dcfn9IUB?=
 =?us-ascii?Q?ZRIY7oB0I/JkkN6ZVCiddupI/a9FCm+byUopV1Uh1tMY1NpUj+9KOZt9c/jS?=
 =?us-ascii?Q?2pmuH2CMO0/X2T84vMuYZueDvHRnra1jMvGubKqki9H/F3uraLFEtLmxNTn8?=
 =?us-ascii?Q?42Z+VNS73VcccsKPdJ15Be838TuGRPHTjfPYzLOoToFOwz9IryWeNy3WQP9s?=
 =?us-ascii?Q?mPrfKeUcC21WSELieY0KMAYQxVF2MOrRNiIxTKwwEuro9YLvpPIl4QRTuHi5?=
 =?us-ascii?Q?nRFm/M8Ihjq0GBJi9n4GG+HBPjQdFTXyOrz7z/fnSjrYarg75/ZSljr5rkky?=
 =?us-ascii?Q?0Tp95cafCWWXqnY8g5mwXzE0ojJnGYTBwF6O0aFZOKYYqFFYprQzk/tsRxR/?=
 =?us-ascii?Q?mPvhvt8I1O/XOey/zH4jqGdYUUahT6myP1hZDbdAmrS4P7p3Xt0oFVQd0i76?=
 =?us-ascii?Q?HiamaLq/PocpRZTDOB5Y+fMXtKXKYElx9570Pma/PGcBGRfm6I3k5ftKQsB4?=
 =?us-ascii?Q?aL8eCSQeYOQ56e9StO0HEcSGY040gmuMRd6X/vTH3lmJby9wcUN3V1cDqiwE?=
 =?us-ascii?Q?Bjd6MoTbcbkOcl9GbcEmArRyiGmpqQMGT10XOyHXg102tC+ly88s877katY1?=
 =?us-ascii?Q?1iA=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: bdaa0ef5-f962-4794-3a1c-08dc4ecbca64
X-MS-Exchange-CrossTenant-AuthSource: PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2024 02:07:16.2670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0871

Add support for the Wii U / Nintendo Switch gamecube controller adapter

Signed-off-by: Milas Robin <milas.robin@live.fr>
---
 drivers/input/joystick/Kconfig            |  20 +
 drivers/input/joystick/Makefile           |   1 +
 drivers/input/joystick/gamecube-adapter.c | 607 ++++++++++++++++++++++
 3 files changed, 628 insertions(+)
 create mode 100644 drivers/input/joystick/gamecube-adapter.c

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 7755e5b454d2..18ab1f893ed0 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -422,4 +422,24 @@ config JOYSTICK_SEESAW
 	  To compile this driver as a module, choose M here: the module will be
 	  called adafruit-seesaw.
 
+config JOYSTICK_NGC
+	tristate "Nintendo GameCube adapter support"
+	depends on USB_ARCH_HAS_HCD
+	select USB
+	help
+	  Say Y here if you want to use Nintendo GameCube adapter with
+	  your computer.
+	  Make sure to say Y to "Joystick support" (CONFIG_INPUT_JOYDEV)
+	  and/or "Event interface support" (CONFIG_INPUT_EVDEV) as well.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called gamecube_adapter.
+
+config JOYSTICK_NGC_FF
+	bool "Nintendo GameCube adapter rumble support"
+	depends on JOYSTICK_NGC && INPUT
+	select INPUT_FF_MEMLESS
+	help
+	  Say Y here if you want to take advantage of GameCube controller rumble features.
+
 endif
diff --git a/drivers/input/joystick/Makefile b/drivers/input/joystick/Makefile
index 9976f596a920..db0f137ba57f 100644
--- a/drivers/input/joystick/Makefile
+++ b/drivers/input/joystick/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_JOYSTICK_JOYDUMP)		+= joydump.o
 obj-$(CONFIG_JOYSTICK_MAGELLAN)		+= magellan.o
 obj-$(CONFIG_JOYSTICK_MAPLE)		+= maplecontrol.o
 obj-$(CONFIG_JOYSTICK_N64)		+= n64joy.o
+obj-$(CONFIG_JOYSTICK_NGC)		+= gamecube-adapter.o
 obj-$(CONFIG_JOYSTICK_PSXPAD_SPI)	+= psxpad-spi.o
 obj-$(CONFIG_JOYSTICK_PXRC)		+= pxrc.o
 obj-$(CONFIG_JOYSTICK_QWIIC)		+= qwiic-joystick.o
diff --git a/drivers/input/joystick/gamecube-adapter.c b/drivers/input/joystick/gamecube-adapter.c
new file mode 100644
index 000000000000..85d69f39d732
--- /dev/null
+++ b/drivers/input/joystick/gamecube-adapter.c
@@ -0,0 +1,607 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *  Copyright (c) 2024 Milas Robin
+ *
+ *  Based on the work of:
+ *	Michael Lelli
+ *	Dolphin Emulator project
+ */
+
+#include <linux/usb.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/input.h>
+#include <linux/usb/input.h>
+
+/* Did not use usb-hid as it is not an hid driver */
+#define USB_VENDOR_ID_NINTENDO		0x057e
+#define USB_DEVICE_ID_NINTENDO_GCADAPTER 0x0337
+
+#define EP_IN  0x81
+#define EP_OUT 0x02
+
+#define GCC_OUT_PKT_LEN 5
+#define GCC_IN_PKT_LEN 37
+
+enum gamecube_status {
+	GAMECUBE_NONE,
+	GAMECUBE_WIRED = 0x10,
+	GAMECUBE_WIRELESS = 0x20,
+};
+
+struct gcc_data {
+	struct ngc_data *adapter;
+	struct input_dev *input;
+	u8 no;
+	u8 status;
+	bool enable;
+};
+
+struct ngc_data {
+	char phys[64];
+
+	struct usb_device *udev;
+	struct usb_interface *intf;
+
+	struct urb *irq_in;
+	u8 *idata;
+	dma_addr_t idata_dma;
+	spinlock_t idata_lock;
+
+	struct urb *irq_out;
+	struct usb_anchor irq_out_anchor;
+	u8 *odata;
+	dma_addr_t odata_dma;
+	spinlock_t odata_lock;		/* output data */
+	bool irq_out_active;		/* we must not use an active URB */
+#ifdef CONFIG_JOYSTICK_NGC_FF
+	u8 odata_rumbles[4];
+	bool rumble_changed;		/* if rumble need update*/
+#endif
+
+	struct gcc_data controllers[4];
+	struct work_struct work;	/* create/delete controller input files */
+};
+
+#ifdef CONFIG_JOYSTICK_NGC_FF
+/* Callers must hold gdata->odata_lock spinlock */
+static int ngc_queue_rumble(struct ngc_data *gdata)
+{
+	int error;
+
+	memcpy(gdata->odata + 1, gdata->odata_rumbles,
+			 sizeof(gdata->odata_rumbles));
+	gdata->irq_out_active = true;
+	gdata->rumble_changed = false;
+	gdata->odata[0] = 0x11;
+	gdata->irq_out->transfer_buffer_length = 5;
+
+	usb_anchor_urb(gdata->irq_out, &gdata->irq_out_anchor);
+	error = usb_submit_urb(gdata->irq_out, GFP_ATOMIC);
+	if (error) {
+		dev_err(&gdata->intf->dev,
+			"%s - usb_submit_urb failed with result %d\n",
+			__func__, error);
+		usb_unanchor_urb(gdata->irq_out);
+		error = -EIO;
+	}
+	return error;
+}
+
+static int ngc_set_rumble_value(struct ngc_data *gdata, u8 controller, u8 value)
+{
+	unsigned long flags;
+	int error;
+
+	value = !!value;
+	if (controller > 4)
+		return -EINVAL;
+
+	spin_lock_irqsave(&gdata->odata_lock, flags);
+	if (gdata->odata_rumbles[controller] == value) {
+		spin_unlock_irqrestore(&gdata->odata_lock, flags);
+		return 0;
+	}
+	gdata->odata_rumbles[controller] = value;
+	gdata->rumble_changed = true;
+	if (!gdata->irq_out_active)
+		error = ngc_queue_rumble(gdata);
+	spin_unlock_irqrestore(&gdata->odata_lock, flags);
+	return error;
+}
+
+static int ngc_rumble_play(struct input_dev *dev, void *data,
+			      struct ff_effect *eff)
+{
+	struct gcc_data *gccdata = input_get_drvdata(dev);
+	u8 value;
+
+	/*
+	 * The gamecube controller  supports only a single rumble motor so if any
+	 * magnitude is set to non-zero then we start the rumble motor. If both are
+	 * set to zero, we stop the rumble motor.
+	 */
+
+	if (eff->u.rumble.strong_magnitude || eff->u.rumble.weak_magnitude)
+		value = 1;
+	else
+		value = 0;
+	return ngc_set_rumble_value(gccdata->adapter, gccdata->no, value);
+}
+static int ngc_init_ff(struct gcc_data *gccdev)
+{
+	input_set_capability(gccdev->input, EV_FF, FF_RUMBLE);
+
+	return input_ff_create_memless(gccdev->input, NULL, ngc_rumble_play);
+}
+#else
+static int ngc_init_ff(struct gcc_data *gccdev) { return 0; }
+#endif
+
+static void ngc_irq_out(struct urb *urb)
+{
+	struct ngc_data *gdata = urb->context;
+	struct device *dev = &gdata->intf->dev;
+	int status = urb->status;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gdata->odata_lock, flags);
+
+	switch (status) {
+	case 0:
+		/* success */
+#ifdef CONFIG_JOYSTICK_NGC_FF
+		gdata->irq_out_active = gdata->rumble_changed;
+#else
+		gdata->irq_out_active = false;
+#endif
+		break;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		/* this urb is terminated, clean up */
+		dev_dbg(dev, "%s - urb shutting down with status: %d\n",
+			__func__, status);
+		gdata->irq_out_active = false;
+		break;
+
+	default:
+		dev_dbg(dev, "%s - nonzero urb status received: %d\n",
+			__func__, status);
+		break;
+	}
+#ifdef CONFIG_JOYSTICK_NGC_FF
+	if (gdata->irq_out_active)
+		ngc_queue_rumble(gdata);
+#endif
+	spin_unlock_irqrestore(&gdata->odata_lock, flags);
+}
+
+static int ngc_init_output(struct ngc_data *gdata,
+			 struct usb_endpoint_descriptor *irq)
+{
+	int error = -ENOMEM;
+
+	init_usb_anchor(&gdata->irq_out_anchor);
+
+	gdata->odata = usb_alloc_coherent(gdata->udev, GCC_OUT_PKT_LEN, GFP_KERNEL,
+			 &gdata->odata_dma);
+	if (!gdata->odata)
+		return error;
+
+	spin_lock_init(&gdata->odata_lock);
+
+	gdata->irq_out = usb_alloc_urb(0, GFP_KERNEL);
+
+	if (!gdata->irq_out)
+		goto err_free_coherent;
+
+	usb_fill_int_urb(gdata->irq_out, gdata->udev,
+			 usb_sndintpipe(gdata->udev, irq->bEndpointAddress),
+			 gdata->odata, GCC_OUT_PKT_LEN, ngc_irq_out, gdata,
+			 irq->bInterval);
+	gdata->irq_out->transfer_dma = gdata->odata_dma;
+	gdata->irq_out->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+	return 0;
+
+err_free_coherent:
+	usb_free_coherent(gdata->udev, GCC_OUT_PKT_LEN, gdata->odata,
+			 gdata->odata_dma);
+	return error;
+}
+
+static void ngc_deinit_output(struct ngc_data *gdata)
+{
+	usb_free_urb(gdata->irq_out);
+	usb_free_coherent(gdata->udev, GCC_OUT_PKT_LEN, gdata->odata,
+			 gdata->odata_dma);
+}
+
+static void gcc_input(struct gcc_data *gccdata, const u8 *keys)
+{
+	input_report_key(gccdata->input, BTN_A, !!(keys[1] & BIT(0)));
+	input_report_key(gccdata->input, BTN_B, !!(keys[1] & BIT(1)));
+	input_report_key(gccdata->input, BTN_X, !!(keys[1] & BIT(2)));
+	input_report_key(gccdata->input, BTN_Y, !!(keys[1] & BIT(3)));
+	input_report_key(gccdata->input, BTN_DPAD_LEFT, !!(keys[1] & BIT(4)));
+	input_report_key(gccdata->input, BTN_DPAD_RIGHT, !!(keys[1] & BIT(5)));
+	input_report_key(gccdata->input, BTN_DPAD_DOWN, !!(keys[1] & BIT(6)));
+	input_report_key(gccdata->input, BTN_DPAD_UP, !!(keys[1] & BIT(7)));
+
+	input_report_key(gccdata->input, BTN_START, !!(keys[2] & BIT(0)));
+	input_report_key(gccdata->input, BTN_TR2, !!(keys[2] & BIT(1)));
+	input_report_key(gccdata->input, BTN_TR, !!(keys[2] & BIT(2)));
+	input_report_key(gccdata->input, BTN_TL, !!(keys[2] & BIT(3)));
+
+	input_report_abs(gccdata->input, ABS_X, keys[3]);
+	input_report_abs(gccdata->input, ABS_Y, keys[4] ^ 0xFF);
+	input_report_abs(gccdata->input, ABS_RX, keys[5]);
+	input_report_abs(gccdata->input, ABS_RY, keys[6] ^ 0xFF);
+	input_report_abs(gccdata->input, ABS_Z, keys[7]);
+	input_report_abs(gccdata->input, ABS_RZ, keys[8]);
+
+	input_sync(gccdata->input);
+}
+
+
+static u8 ngc_connected_type(u8 status)
+{
+	u8 type = status & (GAMECUBE_WIRED | GAMECUBE_WIRELESS);
+
+	switch (type) {
+	case GAMECUBE_WIRED:
+	case GAMECUBE_WIRELESS:
+		return type;
+	default:
+		return 0;
+	}
+}
+
+static int ngc_controller_init(struct gcc_data *gccdev, u8 status)
+{
+	int error;
+
+	gccdev->input = input_allocate_device();
+	if (!gccdev->input)
+		return -ENOMEM;
+
+	input_set_drvdata(gccdev->input, gccdev);
+	usb_to_input_id(gccdev->adapter->udev, &gccdev->input->id);
+	gccdev->input->name = "Nintendo GameCube Controller";
+	gccdev->input->phys = gccdev->adapter->phys;
+
+	set_bit(EV_KEY, gccdev->input->evbit);
+
+	set_bit(BTN_A, gccdev->input->keybit);
+	set_bit(BTN_B, gccdev->input->keybit);
+	set_bit(BTN_X, gccdev->input->keybit);
+	set_bit(BTN_Y, gccdev->input->keybit);
+	set_bit(BTN_DPAD_LEFT, gccdev->input->keybit);
+	set_bit(BTN_DPAD_RIGHT, gccdev->input->keybit);
+	set_bit(BTN_DPAD_DOWN, gccdev->input->keybit);
+	set_bit(BTN_DPAD_UP, gccdev->input->keybit);
+	set_bit(BTN_START, gccdev->input->keybit);
+	set_bit(BTN_TR2, gccdev->input->keybit);
+	set_bit(BTN_TR, gccdev->input->keybit);
+	set_bit(BTN_TL, gccdev->input->keybit);
+
+	set_bit(EV_ABS, gccdev->input->evbit);
+
+	set_bit(ABS_X, gccdev->input->absbit);
+	set_bit(ABS_Y, gccdev->input->absbit);
+	set_bit(ABS_RX, gccdev->input->absbit);
+	set_bit(ABS_RY, gccdev->input->absbit);
+	set_bit(ABS_Z, gccdev->input->absbit);
+	set_bit(ABS_RZ, gccdev->input->absbit);
+
+	input_set_abs_params(gccdev->input, ABS_X, 0, 255, 16, 16);
+	input_set_abs_params(gccdev->input, ABS_Y, 0, 255, 16, 16);
+	input_set_abs_params(gccdev->input, ABS_RX, 0, 255, 16, 16);
+	input_set_abs_params(gccdev->input, ABS_RY, 0, 255, 16, 16);
+	input_set_abs_params(gccdev->input, ABS_Z, 0, 255, 16, 0);
+	input_set_abs_params(gccdev->input, ABS_RZ, 0, 255, 16, 0);
+	error = ngc_init_ff(gccdev);
+	if (error) {
+		dev_warn(&gccdev->input->dev, "Could not create ff (skipped)");
+		goto ngc_deinit_controller;
+	}
+	error = input_register_device(gccdev->input);
+	if (error)
+		goto ngc_deinit_controller_ff;
+	gccdev->enable = true;
+	return 0;
+ngc_deinit_controller_ff:
+	input_ff_destroy(gccdev->input);
+ngc_deinit_controller:
+	input_free_device(gccdev->input);
+	return error;
+}
+
+static void ngc_controller_update_work(struct work_struct *work)
+{
+	int i;
+	u8 status[4];
+	bool enable[4];
+	unsigned long flags;
+	struct ngc_data *gdata = container_of(work, struct ngc_data, work);
+
+	for (i = 0; i < 4; i++) {
+		status[i] = gdata->controllers[i].status;
+		enable[i] = ngc_connected_type(status[i]) != 0;
+	}
+
+	for (i = 0; i < 4; i++) {
+		if (enable[i] && !gdata->controllers[i].enable) {
+			if (ngc_controller_init(&gdata->controllers[i], status[i]) != 0)
+				enable[i] = false;
+		}
+	}
+
+	spin_lock_irqsave(&gdata->idata_lock, flags);
+	for (i = 0; i < 4; i++)
+		swap(gdata->controllers[i].enable, enable[i]);
+	spin_unlock_irqrestore(&gdata->idata_lock, flags);
+
+	for (i = 0; i < 4; i++) {
+		if (enable[i] && !gdata->controllers[i].enable)
+			input_unregister_device(gdata->controllers[i].input);
+	}
+}
+
+static void ngc_input(struct ngc_data *gdata)
+{
+	int i;
+	unsigned long flags;
+	bool updated = false;
+
+	for (i = 0; i < 4; i++) {
+		updated = updated ||
+			 gdata->idata[1 + 9 * i] != gdata->controllers[i].status;
+		gdata->controllers[i].status = gdata->idata[1 + 9 * i];
+	}
+	if (updated)
+		schedule_work(&gdata->work);
+	spin_lock_irqsave(&gdata->idata_lock, flags);
+	for (i = 0; i < 4; i++) {
+		if (gdata->controllers[i].enable)
+			gcc_input(&gdata->controllers[i], &gdata->idata[1 + 9 * i]);
+	}
+	spin_unlock_irqrestore(&gdata->idata_lock, flags);
+}
+
+static void ngc_irq_in(struct urb *urb)
+{
+	struct ngc_data *gdata = urb->context;
+	struct usb_interface *intf = gdata->intf;
+	int error;
+
+	switch (urb->status) {
+	case 0:
+		break;
+	case -EOVERFLOW:
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		dev_dbg(&intf->dev, "controller urb shutting down: %d\n",
+			urb->status);
+		return;
+	default:
+		dev_dbg(&intf->dev, "controller urb status: %d\n", urb->status);
+		goto exit;
+	}
+	if (gdata->irq_in->actual_length != GCC_IN_PKT_LEN)
+		dev_warn(&intf->dev, "Bad sized packet\n");
+	else if (gdata->idata[0] != 0x21)
+		dev_warn(&intf->dev, "Unknown opcode %d\n", gdata->idata[0]);
+	else
+		ngc_input(gdata);
+exit:
+	error = usb_submit_urb(gdata->irq_in, GFP_ATOMIC);
+	if (error)
+		dev_err(&intf->dev, "controller urb failed: %d\n", error);
+}
+
+static int ngc_init_input(struct ngc_data *gdata,
+			 struct usb_endpoint_descriptor *irq)
+{
+	int error = -ENOMEM;
+
+	gdata->idata = usb_alloc_coherent(gdata->udev, GCC_IN_PKT_LEN, GFP_KERNEL,
+			 &gdata->idata_dma);
+	if (!gdata->idata)
+		return error;
+
+	gdata->irq_in = usb_alloc_urb(0, GFP_KERNEL);
+	if (!gdata->irq_in)
+		goto err_free_coherent;
+
+	usb_fill_int_urb(gdata->irq_in, gdata->udev,
+			 usb_rcvintpipe(gdata->udev, irq->bEndpointAddress),
+			 gdata->idata, GCC_IN_PKT_LEN, ngc_irq_in, gdata,
+			 irq->bInterval);
+	gdata->irq_in->transfer_dma = gdata->idata_dma;
+	gdata->irq_in->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
+
+	spin_lock_init(&gdata->idata_lock);
+	INIT_WORK(&gdata->work, ngc_controller_update_work);
+
+	return 0;
+
+err_free_coherent:
+	usb_free_coherent(gdata->udev, GCC_IN_PKT_LEN, gdata->idata,
+			 gdata->idata_dma);
+	return error;
+
+}
+
+
+static void ngc_deinit_input(struct ngc_data *gdata)
+{
+	usb_free_urb(gdata->irq_in);
+	usb_free_coherent(gdata->udev, GCC_IN_PKT_LEN, gdata->idata,
+			 gdata->idata_dma);
+}
+
+
+static int ngc_init_irq(struct ngc_data *gdata)
+{
+	struct usb_endpoint_descriptor *eps[] = { NULL, NULL };
+	int error;
+
+	error = usb_find_common_endpoints(gdata->intf->cur_altsetting, NULL, NULL,
+					  &eps[0], &eps[1]);
+	if (error)
+		return -ENODEV;
+	error = ngc_init_output(gdata, eps[1]);
+	if (error)
+		return error;
+	error = ngc_init_input(gdata, eps[0]);
+	if (error)
+		goto err_deinit_out;
+#ifdef CONFIG_JOYSTICK_NGC_FF
+	memset(gdata->odata_rumbles, 0, 4);
+	gdata->rumble_changed = false;
+#endif
+	gdata->irq_out_active = true;
+	gdata->odata[0] = 0x13;
+	gdata->irq_out->transfer_buffer_length = 1;
+
+	error = usb_submit_urb(gdata->irq_in, GFP_KERNEL);
+	if (error)
+		goto err_deinit_in;
+
+	usb_anchor_urb(gdata->irq_out, &gdata->irq_out_anchor);
+	error = usb_submit_urb(gdata->irq_out, GFP_ATOMIC);
+	if (error) {
+		dev_err(&gdata->intf->dev,
+			"%s - usb_submit_urb failed with result %d\n",
+			__func__, error);
+		usb_unanchor_urb(gdata->irq_out);
+		error = -EIO;
+		goto err_kill_in_urb;
+	}
+
+	return 0;
+err_kill_in_urb:
+	usb_kill_urb(gdata->irq_in);
+err_deinit_in:
+	ngc_deinit_input(gdata);
+err_deinit_out:
+	ngc_deinit_output(gdata);
+	return error;
+}
+
+static void ngc_deinit_irq(struct ngc_data *gdata)
+{
+	if (!usb_wait_anchor_empty_timeout(&gdata->irq_out_anchor, 5000)) {
+		dev_warn(&gdata->intf->dev,
+			 "timed out waiting for output URB to complete, killing\n");
+		usb_kill_anchored_urbs(&gdata->irq_out_anchor);
+	}
+	usb_kill_urb(gdata->irq_in);
+	/* Make sure we are done with presence work if it was scheduled */
+	flush_work(&gdata->work);
+
+	ngc_deinit_input(gdata);
+	ngc_deinit_output(gdata);
+}
+
+static void ngc_init_controllers(struct ngc_data *gdata)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(gdata->controllers); i++) {
+		gdata->controllers[i].adapter = gdata;
+		gdata->controllers[i].no = i;
+		gdata->controllers[i].status = GAMECUBE_NONE;
+		gdata->controllers[i].enable = false;
+	}
+}
+
+static struct attribute *ngc_attrs[] = {
+	NULL,
+};
+
+static const struct attribute_group ngc_attr_group = {
+	.attrs = ngc_attrs,
+};
+
+static int ngc_init_attr(struct ngc_data *gdata)
+{
+	return sysfs_create_group(&gdata->intf->dev.kobj, &ngc_attr_group);
+}
+
+static void ngc_deinit_attr(struct ngc_data *gdata)
+{
+	sysfs_remove_group(&gdata->intf->dev.kobj, &ngc_attr_group);
+}
+
+
+static int ngc_usb_probe(struct usb_interface *iface, const struct usb_device_id *id)
+{
+	struct usb_device *udev = interface_to_usbdev(iface);
+	struct ngc_data *gdata;
+	int error;
+
+	gdata = kzalloc(sizeof(struct ngc_data), GFP_KERNEL);
+	if (!gdata)
+		return -ENOMEM;
+	usb_set_intfdata(iface, gdata);
+	gdata->udev = udev;
+	gdata->intf = iface;
+
+	usb_make_path(udev, gdata->phys, sizeof(gdata->phys));
+	strlcat(gdata->phys, "/input0", sizeof(gdata->phys));
+
+	ngc_init_controllers(gdata);
+	error = ngc_init_irq(gdata);
+	if (error)
+		goto err_free_devs;
+	error = ngc_init_attr(gdata);
+	if (error)
+		goto err_deinit_endpoints;
+	dev_info(&iface->dev, "New device registered\n");
+	return 0;
+err_deinit_endpoints:
+	ngc_deinit_irq(gdata);
+err_free_devs:
+	usb_set_intfdata(iface, NULL);
+	kfree(gdata);
+	return error;
+}
+
+static void ngc_usb_disconnect(struct usb_interface *iface)
+{
+	int i;
+	struct ngc_data *gdata = usb_get_intfdata(iface);
+
+	for (i = 0; i < 4; i++) {
+		if (gdata->controllers[i].enable)
+			input_unregister_device(gdata->controllers[i].input);
+	}
+	ngc_deinit_attr(gdata);
+	ngc_deinit_irq(gdata);
+	usb_set_intfdata(iface, NULL);
+	kfree(gdata);
+}
+
+static const struct usb_device_id ngc_usb_devices[] = {
+	{ USB_DEVICE(USB_VENDOR_ID_NINTENDO,
+		     USB_DEVICE_ID_NINTENDO_GCADAPTER) },
+	{}
+};
+
+MODULE_DEVICE_TABLE(usb, ngc_usb_devices);
+
+static struct usb_driver ngc_usb_driver = {
+	.name		= "gamecube_adapter",
+	.id_table	= ngc_usb_devices,
+	.probe		= ngc_usb_probe,
+	.disconnect	= ngc_usb_disconnect,
+};
+
+module_usb_driver(ngc_usb_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Robin Milas <milas.robin@live.fr>");
+MODULE_DESCRIPTION("Driver for GameCube adapter");
-- 
2.44.0


