Return-Path: <linux-input+bounces-3632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D80A68C08FB
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 03:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C09E282BCD
	for <lists+linux-input@lfdr.de>; Thu,  9 May 2024 01:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9645013C696;
	Thu,  9 May 2024 01:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="jSvb3aGg"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2108.outbound.protection.outlook.com [40.92.90.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ADF13BC3D
	for <linux-input@vger.kernel.org>; Thu,  9 May 2024 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715217288; cv=fail; b=Ep+upMhbXh9TL2R6DjxN9vLetVvRUeBp6/bQ/VpuehwZ8FqrXCy65+gFZI5l17BhrEmTqbcAD3ZRAgdtv4M7+tECE4xaUIrb8FDslT+Fdq2tArk646x/A+tFzva8AITh60AkAAFsFqCB+cGAo8vb6WqiDLful+Mha7y2wbSOue0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715217288; c=relaxed/simple;
	bh=z4HBNn2h2ErwtDMs8f6+UUKK8UT6hBXgX7QTjDvLg+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eSmosenkrBrZa+3SjwG/Jt0x2bdY5NGhYIDufM8tlcbCN3ooHluvQCAzaTTAAG3pgwGV2VibZ0PUEAtGvoglkP2DLllXUukeg1k8LgxYq/QLO+1ksr0W3/QRlQh0YrkrG0EmpbhlsCCsNXdRiQQEnmFMQ4kcroEYXw6eMib2cgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=jSvb3aGg; arc=fail smtp.client-ip=40.92.90.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJo1bwQ1c73giIyr4Bdp4XaqHgfj4iskQGi+vXvintwS1y7I5p3f5QWhFw7edzp3fFyhwsUn4TsfFJvAspaSjh4npVoFInBx/1pHraLY0tOQ4mZJ+KVboPD9B/oMuA8QmDseXYLtM4I+qJg/0ynQtpppAvTfgxhuJ+jsAuIheh/B5uv1NVYHsHNwwhJyv2VyWzsA/yGO6vKYzVTXxCgBjdA/pZbmpHxqfRlSSRFXb5tmOhuiCmSAst8WpCBivo8yxFhoKWS9FKToZFQffTKcjR84FOuobD/SwD7oBW1RZCFgqj3vOE5HxrmPXiNWxfn9YBE/dpQTtkUR33YK9UbYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w88jx9yZpaCxCcC6jD3gXPMYcYOi8CEsMYBU67iAcLE=;
 b=UmIvdCGcgZzRPufxZAggWvFcQp6W8VGnjBgpnvI/l0st09iahaSztr8vmmamWArqcvZwSaDkLwaEm1ig1/O0GINQw3TRZ+PipuZYNUjf3UiTa6tLtMQh3Zo5JdMdXIFls1WAQ1Fq0/VnenlNVcs9qQhbz8d1DDTQm3wJuxuUqFu4ehonSZJp+7xyxsc5/ndrS4eoLgPW1mXJbphMa9Q86y134PWd3Ql0whx2VBmWlITi0fY1/Dlo0qr/POTV6mg9YyivGG6xBTbx6RVRFF8PtnF2/JE3QShhMsphgRZns2V+9cadCu5BB0BHbu8x92BjpDoY1hjYbE9Fd4SPqC/cFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w88jx9yZpaCxCcC6jD3gXPMYcYOi8CEsMYBU67iAcLE=;
 b=jSvb3aGgOsODf44t7+2kxOdq1bFuGF1Zj7BFAKF4GxN6pL6RNsu+nAEC4t/AaT6f55fz9QNtb04bZC6Emdc5WDKO8IbPUnMDqRtkXModt+P2cNMJSXF/Df4TcOqBqUl8d9GG7mDPpN04L4jiI58v2v1edOiiw0WlMLWRbj0e82+sHzp6WnaxLKkDTXh4FntJ9zBLlVGF8Y/7ZxM059QmK2J/Sf4BASHr3xMnZEUBXvOfTLX0/UMKtKckqGjvbBRPdrZLxOzqGgfXrtnlc5CKIqkUnUE6Rcjv+CQ5MywNz1PEtoDMxYumk4os7IqQogpynpdodNsMvo/D3PesFjxxNw==
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:ba::18)
 by PR3P189MB0892.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:47::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Thu, 9 May
 2024 01:14:42 +0000
Received: from PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87]) by PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 ([fe80::130e:978a:e067:2a87%4]) with mapi id 15.20.7544.045; Thu, 9 May 2024
 01:14:42 +0000
From: Milas Robin <milas.robin@live.fr>
To: milas.robin@live.fr
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Subject: [PATCH v2 1/1] Input: add gamecube adapter support
Date: Thu,  9 May 2024 03:14:22 +0200
Message-ID:
 <PA4P189MB146989BFEDE17B99FAA4DDB6FAE62@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <PA4P189MB146928AA17984371B61EB909FAE62@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
References: <PA4P189MB146928AA17984371B61EB909FAE62@PA4P189MB1469.EURP189.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [ZBQf05p3BEJew2teCafj8m0NM6p4XlrRr0e467FeFkgRPsgSHx+DfUCrxawsL1Hj]
X-ClientProxiedBy: PA7P264CA0076.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:349::15) To PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:ba::18)
X-Microsoft-Original-Message-ID: <20240509011422.80936-1-milas.robin@live.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4P189MB1469:EE_|PR3P189MB0892:EE_
X-MS-Office365-Filtering-Correlation-Id: 6114249b-3934-4570-85b1-08dc6fc567c2
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	JXl+pdBwMDEOj48IjYq/XzbLavVlT8X86E+Yktud7QvR5weKlad1XJb7gkd6CJrUBOIE/1gyNQRKg2npEdDONUzYhMJPsJ5Z33Hkmfot8R2yckV7TFc4/C19v8MaYaRAQdUPU7w69/Se3YEzXlWJ9WP6ATTaXKbvk1Uy32/49QZdstIVDszNPaUEsDbxOAiCUCkfjGF8ZdRtc9qPact6LqGGigsJwndG58u06zUYGwpUKdOqabYmuS3MgOKZx6MSBZe4vWV213Pw+1TXc+xZN02ifAKTdbyC5hdCMMf4Hm9nZCY6YiUmeVeQMvmBAX7KySUUOkxrFAxfhVIjameFzplrFzaUconBnkoPEME1pBEbJtWxJQyLv6biqdJY6fm3AKSdMXRCVmwB/om53Frii2s4ZWJj0Hy2B8VDiHMsjhWbAPwj2yj3v8fRV/XbQjsyRPlZFK9kn9qKE/Bl/yW8o1Pc0y74Foe3DLzJjfHbHhw0xqsVE0+64BstwgzW7SNURVgwQeLSt9Rjk4vkmXFnMHbHAC2PVGJrEOVeZkX7jAUZvCYTchitzLBc7TOS0GDGHoBuWYJLDYxGUz5Vi7iB1ihwd3pX+KPTQweVKUrDAhV/93og42rnYChV1vNlBLHE
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?x/UhKHa0FaXDpoVPYWIUa4dJRdNXGvhJ4DWFm/5775WqbNKiUfAis9e1lYQ8?=
 =?us-ascii?Q?86iR6KkY729wA/UX8mGi5su9GSJo+5IGzdvbZNHJDNbwW1j1zRlo69UPC9wV?=
 =?us-ascii?Q?zLnb1SYjrIDCEB2OiypGgI3vi877tMNi9Q5n/mkTX4GRnIWes/wDR7GfUXjv?=
 =?us-ascii?Q?RIZmz11ZsLtE4vb2FRHAeNQ1LShv5MQEDIFc/ce4nYcmmCiNGT0uhb6tb4PB?=
 =?us-ascii?Q?fRRqWrPK2RNcziU4Olacb2jBwCAmg7Y/wPLtx6wX5UJe9jC7uVffllXc+cjK?=
 =?us-ascii?Q?a41W4dJcgqoBtlGF405uicYfvM1RIku5EL1s8Lk4ClBELuJ7+sWiIYlKvB2e?=
 =?us-ascii?Q?AH9n9WZdCOXbf4ACQ8maG/Fr4Ncc7QbXvvY8Z2/peAks4tJ+sfcwPYZtSRDA?=
 =?us-ascii?Q?F21Kw4gluzB4XobisF54Zd1Q+UjSSnxcnse9c/SaFXg3t/yPB/2AlJAynLKt?=
 =?us-ascii?Q?oZd+jqy49/aDPA+b4BcsJR5SpP8t1XRVSE9eJxO5swD1Zl+3Y2e/BClXejVS?=
 =?us-ascii?Q?vktS1VfWSCFivOZqKd1Tq74BR3q27UkfjJ7zHw8JWq3mlTTwAJxvBfBUjsSe?=
 =?us-ascii?Q?41ifGTlevn8vIUPCAEjsXNlLm+UbJ90GnXAaCUhuJ7N5GyjrznYZYoKn7cWU?=
 =?us-ascii?Q?/SV94nUKuBcA72B0U/NL6pHi5/SWA2dypojF6jaILAkwIGFrtaM+hWUw8arJ?=
 =?us-ascii?Q?M+GZ/rZhv1Jr8lktb7BnyukZ08UI8CxZYcBlOhpQSslW56I/SmFKrsBourEw?=
 =?us-ascii?Q?aBYZWO5pJFyV3Jvbw3oFVE4QXO4RZA//6aG9bLFlpBUjx3EL2ZM8HqqOdCS+?=
 =?us-ascii?Q?QXS0zOQYkcovfRCo/7iwcL3Flxza2GFRxt0JoKKZbGezKU0uS1b35+WFj/kx?=
 =?us-ascii?Q?6vgfyX4JeNmXNWHhnAGyLnXI/pfUzPNhA4sr6Q5ouWQgd4CMWqDp4in11zuz?=
 =?us-ascii?Q?mUiR6rysSGAeeqXPz3Y9XT/bj5fFKVyyRD5YnQ4gpNCbZWi8ApOXGmFGBuCv?=
 =?us-ascii?Q?vtw5atTUkx9fDoyKt+TNhglWXi0JWNhZP7cNSSgujVwth8bKpzoT3HSEknJH?=
 =?us-ascii?Q?fCI2K9YJCwJ3j9ECmFsVIsXi/+zcgDrG6VVu64UAy6u6ZEcUtPcBDqMnp0vH?=
 =?us-ascii?Q?iZa9EpQGkl/uRHdlyxczzAod60lGk3Da4QIAbh8bwIOSjw/zHdxyNO8/Ulep?=
 =?us-ascii?Q?zPXQBlqEm9szIL9t01DLNfdT4WyOe1gshioKQ8MwgslvWqL27w6ls41QBwbC?=
 =?us-ascii?Q?IrVZcURvdnM7H4fOlddIstIL3z3Z47qnA8ylnO3qrJaI6Zc0TI8Xdtf+NPdj?=
 =?us-ascii?Q?16c=3D?=
X-OriginatorOrg: sct-15-20-4734-24-msonline-outlook-c54b5.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6114249b-3934-4570-85b1-08dc6fc567c2
X-MS-Exchange-CrossTenant-AuthSource: PA4P189MB1469.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 01:14:42.1839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB0892

Add support for the Wii U / Nintendo Switch gamecube controller adapter

Signed-off-by: Milas Robin <milas.robin@live.fr>
---
 drivers/input/joystick/Kconfig            |  20 +
 drivers/input/joystick/Makefile           |   1 +
 drivers/input/joystick/gamecube-adapter.c | 564 ++++++++++++++++++++++
 3 files changed, 585 insertions(+)
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
index 000000000000..abc0da9ab8d2
--- /dev/null
+++ b/drivers/input/joystick/gamecube-adapter.c
@@ -0,0 +1,564 @@
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
+#define CONTROLLER_COUNT 4
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
+	u8 *odata;
+	dma_addr_t odata_dma;
+	spinlock_t odata_lock;		/* output data */
+#ifdef CONFIG_JOYSTICK_NGC_FF
+	bool irq_out_active;		/* we must not use an active URB */
+	u8 odata_rumbles[CONTROLLER_COUNT];
+	bool rumble_changed;		/* if rumble need update*/
+#endif
+
+	struct gcc_data controllers[CONTROLLER_COUNT];
+	struct work_struct work;	/* create/delete controller input files */
+};
+
+struct ngc_key {
+	u8		byte;
+	u8		bit;
+	unsigned int	keycode;
+};
+
+static const struct ngc_key ngc_keys[] = {
+	{ 1, 0, BTN_A },
+	{ 1, 1, BTN_B },
+	{ 1, 2, BTN_X },
+	{ 1, 3, BTN_Y },
+	{ 1, 4, BTN_DPAD_LEFT },
+	{ 1, 5, BTN_DPAD_RIGHT },
+	{ 1, 6, BTN_DPAD_DOWN },
+	{ 1, 7, BTN_DPAD_UP },
+	{ 2, 0, BTN_START },
+	{ 2, 1, BTN_TR2 },
+	{ 2, 2, BTN_TR },
+	{ 2, 3, BTN_TL },
+};
+
+static int ngc_send_urb(struct ngc_data *gdata)
+{
+	int error;
+
+	lockdep_assert_held(&gdata->odata_lock);
+
+	error = usb_submit_urb(gdata->irq_out, GFP_ATOMIC);
+	if (error) {
+		dev_err(&gdata->intf->dev,
+			"%s - usb_submit_urb failed with result %d\n",
+			__func__, error);
+		error = -EIO;
+
+	}
+#ifdef CONFIG_JOYSTICK_NGC_FF
+	gdata->irq_out_active = error == 0;
+#endif
+	return error;
+}
+
+#ifdef CONFIG_JOYSTICK_NGC_FF
+
+static bool ngc_prepare_next_packet(struct ngc_data *gdata)
+{
+	lockdep_assert_held(&gdata->odata_lock);
+
+	if (!gdata->rumble_changed)
+		return false;
+	gdata->rumble_changed = false;
+	memcpy(gdata->odata + 1, gdata->odata_rumbles,
+			 sizeof(gdata->odata_rumbles));
+	gdata->odata[0] = 0x11;
+	gdata->irq_out->transfer_buffer_length = 5;
+	return true;
+}
+
+static int ngc_set_rumble_value(struct ngc_data *gdata, u8 controller, bool value)
+{
+	if (controller > CONTROLLER_COUNT)
+		return -EINVAL;
+	guard(spinlock_irqsave)(&gdata->odata_lock);
+	if (gdata->odata_rumbles[controller] == value)
+		return 0;
+	gdata->odata_rumbles[controller] = value;
+	gdata->rumble_changed = true;
+	if (gdata->irq_out_active)
+		return 0;
+	ngc_prepare_next_packet(gdata);
+	return ngc_send_urb(gdata);
+}
+
+static int ngc_rumble_play(struct input_dev *dev, void *data,
+			      struct ff_effect *eff)
+{
+	struct gcc_data *gccdata = input_get_drvdata(dev);
+
+	/*
+	 * The gamecube controller  supports only a single rumble motor so if any
+	 * magnitude is set to non-zero then we start the rumble motor. If both are
+	 * set to zero, we stop the rumble motor.
+	 */
+
+	return ngc_set_rumble_value(gccdata->adapter, gccdata->no,
+				    eff->u.rumble.strong_magnitude ||
+					eff->u.rumble.weak_magnitude);
+}
+static int ngc_init_ff(struct gcc_data *gccdev)
+{
+	input_set_capability(gccdev->input, EV_FF, FF_RUMBLE);
+
+	return input_ff_create_memless(gccdev->input, NULL, ngc_rumble_play);
+}
+#else
+static int ngc_init_ff(struct gcc_data *gccdev) { return 0; }
+static bool ngc_prepare_next_packet(struct ngc_data *gdata) { return false; }
+#endif
+
+static void ngc_irq_out(struct urb *urb)
+{
+	struct ngc_data *gdata = urb->context;
+	struct device *dev = &gdata->intf->dev;
+
+	guard(spinlock_irqsave)(&gdata->odata_lock);
+
+	switch (urb->status) {
+	case 0:
+		/* success */
+		break;
+	case -ECONNRESET:
+	case -ENOENT:
+	case -ESHUTDOWN:
+		/* this urb is terminated, clean up */
+		dev_dbg(dev, "%s - urb shutting down with status: %d\n",
+			__func__, urb->status);
+		goto shutdown;
+
+	default:
+		dev_dbg(dev, "%s - nonzero urb status received: %d\n",
+			__func__, urb->status);
+		goto resubmit;
+	}
+	if (!ngc_prepare_next_packet(gdata))
+		goto shutdown;
+resubmit:
+	ngc_send_urb(gdata);
+	return;
+shutdown:
+#ifdef CONFIG_JOYSTICK_NGC_FF
+	gdata->irq_out_active = false;
+#endif
+}
+
+static int ngc_init_output(struct ngc_data *gdata,
+			 struct usb_endpoint_descriptor *irq)
+{
+	int error = -ENOMEM;
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
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ngc_keys); i++) {
+		input_report_key(gccdata->input, ngc_keys[i].keycode,
+			!!(keys[ngc_keys[i].byte] & BIT(ngc_keys[i].bit)));
+	}
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
+	int i;
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
+	for (i = 0; i < ARRAY_SIZE(ngc_keys); i++)
+		set_bit(ngc_keys[i].keycode, gccdev->input->keybit);
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
+	u8 status[CONTROLLER_COUNT];
+	bool enable[CONTROLLER_COUNT];
+	unsigned long flags;
+	struct ngc_data *gdata = container_of(work, struct ngc_data, work);
+
+	for (i = 0; i < CONTROLLER_COUNT; i++) {
+		status[i] = gdata->controllers[i].status;
+		enable[i] = ngc_connected_type(status[i]) != 0;
+	}
+
+	for (i = 0; i < CONTROLLER_COUNT; i++) {
+		if (enable[i] && !gdata->controllers[i].enable) {
+			if (ngc_controller_init(&gdata->controllers[i], status[i]) != 0)
+				enable[i] = false;
+		}
+	}
+
+	spin_lock_irqsave(&gdata->idata_lock, flags);
+	for (i = 0; i < CONTROLLER_COUNT; i++)
+		swap(gdata->controllers[i].enable, enable[i]);
+	spin_unlock_irqrestore(&gdata->idata_lock, flags);
+
+	for (i = 0; i < CONTROLLER_COUNT; i++) {
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
+	for (i = 0; i < CONTROLLER_COUNT; i++) {
+		updated = updated ||
+			 gdata->idata[1 + 9 * i] != gdata->controllers[i].status;
+		gdata->controllers[i].status = gdata->idata[1 + 9 * i];
+	}
+	if (updated)
+		schedule_work(&gdata->work);
+	spin_lock_irqsave(&gdata->idata_lock, flags);
+	for (i = 0; i < CONTROLLER_COUNT; i++) {
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
+	gdata->rumble_changed = false;
+	gdata->irq_out_active = true;
+#endif
+	gdata->odata[0] = 0x13;
+	gdata->irq_out->transfer_buffer_length = 1;
+
+	error = usb_submit_urb(gdata->irq_in, GFP_KERNEL);
+	if (error)
+		goto err_deinit_in;
+
+	error = usb_submit_urb(gdata->irq_out, GFP_KERNEL);
+	if (error) {
+		dev_err(&gdata->intf->dev,
+			"%s - usb_submit_urb failed with result %d\n",
+			__func__, error);
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
+	usb_kill_urb(gdata->irq_out);
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
+	dev_info(&iface->dev, "New device registered\n");
+	return 0;
+err_free_devs:
+	usb_set_intfdata(iface, NULL);
+	kfree(gdata);
+	return error;
+}
+
+static void ngc_usb_disconnect(struct usb_interface *iface)
+{
+	struct ngc_data *gdata = usb_get_intfdata(iface);
+	int i;
+
+	for (i = 0; i < CONTROLLER_COUNT; i++) {
+		if (gdata->controllers[i].enable)
+			input_unregister_device(gdata->controllers[i].input);
+	}
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
2.45.0


