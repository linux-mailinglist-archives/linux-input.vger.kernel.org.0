Return-Path: <linux-input+bounces-4027-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB40A8D7727
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 18:33:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D51A1F21433
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 16:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6F247F5D;
	Sun,  2 Jun 2024 16:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rMvGRPM8"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04olkn2027.outbound.protection.outlook.com [40.92.74.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD51537F8;
	Sun,  2 Jun 2024 16:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.74.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717346003; cv=fail; b=d8jaeJuSQ94Mp2PDMN4SUbmDZF1J7RLl3CBvI1qb5Ai3T13pOT1ymQ7gdjyEA/HAnvsNsP/y9kKEBFzdDn18KGXQb/ZIgd7OwzVcJXjJ26V6tsqmu+QEbMscctzK91xW9dp83lTuCSsceYxhCHrEDVeQoBs22gaoqKNVNDaL4r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717346003; c=relaxed/simple;
	bh=cBChBHO737Wd7Ghqsiz2cHiLLzXGuVoXzC8eVzmY0aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cuMo9a/LXrPgIAZvAAmo6gqr3QPt6hFDg1SXKfs3bSarQldKrt9DK+09Jie4NokzVJOYqhr0WqfnpSru8P14S4KQOaItA+dN3tXl7SyWnoXgn/t8UcRFFOhYH0q47bRwXX8IItPhdNYMQTti3biXBqZrvZLs5K0cg7lWqZfvmTc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rMvGRPM8; arc=fail smtp.client-ip=40.92.74.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZMqeSK26cpriT6uUDfoRXOvrqqslgGMl73PAijZEdwhpIr3JPEbxWph4iv12wDCcxLYhiRhJN9dlp/66mIJkQG4g3c5WUA+0Tw338NNeTAk+1uybKwTW5brrD2SljQAFYHCRf4M7OE5U8fo1uSVK4/Jz8/7L4OQxBoEplOnOiOiDCvIHsXksNJWEydHRL/Iq2pmhq22ycH/6CvZ3jDR4v3pWmuGCMSE7FD8Wu7Awgt58G3zyM4iVA9slvIa1iEpe/S26/tx7OznPGVpyphjzkteA96lFmqxBgi0lIG6UxG56COM3EF7kca/QCuFvDS18OiR0jmroWReHuQi+pe4iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvTYDSmCQj813tA15Pa/k/r5DLICiq1we8A6dJpQ5ac=;
 b=ijOEyQ2mfBwuwE7G8fopDG6WvnuDKe5O9A4bbOQY4Lirg9i39p13IQATENhPStjZafgo0xdQeSdnOZ/PaXbCPuWBdbeNq++J0nGvndxrkgPqkHyzWdEj//S3wuE/sILeenUfNWBWa9EB3ksnpNvOPcE23nHpuaWt3kYGER8Xn+M9830Oo7fxEID6DvErBobaqzWOP0oO5WX0tCGi5ZjsBhaEXNtQoaerh45QrFx50Ey0SrG5vWQOHteVygXPazZUqI7l8sOFC5MdDYzTB7L3Z49OOWsrrb2G+XzPu7Uwbgqk5+i1YJtSwc1CY5PLIVHPaJwm7h3hBHEP/OSmasyVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvTYDSmCQj813tA15Pa/k/r5DLICiq1we8A6dJpQ5ac=;
 b=rMvGRPM8ynC1GONkKnFztvycun7e3E0de7GBjNeMmkEGa6NYYCpSxZnBxa9hWtZ1t2QROAkIE5/o6nsJ735ah62eUoRDwtgoy2nlFuzyG725LpWrACOZzNFg73zKt/vYDJWiE4Ydpx7jQLtkldmbI8KvIdBv5QAEgGROPVzPsqHjp6zLBZ0wUWnUwrBO2XbA4NdDfa94OefzZTacFKTIC7P8/tAH+ongOZuDBzsFUrvs2L0gHPlmXpj1gQM5pEfNdyH/6vpAqruxbkQEkam1BuyWl1DZ2mQxIhND0ijny9fcH1PLDQE08KsVWPdvVGagi8l/QtiTxNKEuQf0TExXUQ==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by GV2PR02MB9328.eurprd02.prod.outlook.com (2603:10a6:150:e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Sun, 2 Jun
 2024 16:33:16 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7633.021; Sun, 2 Jun 2024
 16:33:16 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Henk Vergonet <Henk.Vergonet@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Arnd Bergmann <arnd@arndb.de>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Cc: Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	usbb2k-api-dev@nongnu.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] input: misc: use sizeof(*pointer) instead of sizeof(type)
Date: Sun,  2 Jun 2024 18:32:58 +0200
Message-ID:
 <AS8PR02MB7237884EB989EFF55D1BEF8B8BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [H+04UGJ+xs2eFapSRMc/n7CFWc+xz3L8]
X-ClientProxiedBy: MA2P292CA0010.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:1::9)
 To AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:
 <20240602163258.7272-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|GV2PR02MB9328:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c912380-db00-4830-e0c8-08dc8321b46f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	j8u7VmLX612+DFPGe6Zgq+PFSORzbWYL0/LJAUVdfZhUkurEdlPabGIbCtQTsQnwrDuFSLvMLmiWwfzcQGTxzvpZOSIcfTapyZqaqwjyBX8S99Hh785rQ4p/S1qzHzGU/NUZk7hRfSO19qvi7RtxIkAv93iLf98Vc9voNeiNxFHAPDZThkROxSdcM3Bto09WSHl41wZhmbTQfBXGdLVA9Rs8FQIc1kKSEVh0rCIn8HIvhxhVcI6jbBByCm8/Izac5H0ASYFlWelqgZdORT6/rSFZTG9e2F0j+sHd94uhGQfdZawwUvj+JvIDOR0RC989r128MSTx2gyIwvW6kqrf3YniY4zlfOZ0E9ZiFANvhWOwznxLlv5xkJHC8CdQvUkgYQF8XjzNFz6tJyLT7F3+whdTJ8mUhQs2XbX5YyI9XerWn2aK712AMRIc+QDXLNMw2b4x+T1N+q0fwM+xQC9GT2ck5lMbQYnCqg7FX96jLgBaSnqThMPFVMWwOL2ZZnRBn31NXhQwz18ezru9io7IvsxE1StThPm2TE1BdtMUK+ZXxx16u4SakfMQWX2WGc/fxS7RvEdMQ0AplqcZlqBi5GsAvntgzmTelWwRyxX5G7uOr3kUpJyPC8G6DiApQyFu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Blae/+yWNCgLpNC2Ms87XiNRhDdsYjFQNf0qfZHjIp++qRjVQLttt+G86cDb?=
 =?us-ascii?Q?yDJWLwcMT+Cc9zP14FOx3mlQEC/5KY6z4501i5FTtIMTsAFLl3cKd4GNBORR?=
 =?us-ascii?Q?wRTOyvC1TBQIz1SrcSVvrtFrtKkQwICA9eTcfxQdDWKrcwPCcCJhVfggc3vI?=
 =?us-ascii?Q?3Ybu5IK47o6pAZusQOYjJ5EcAmO9BggslhPQQaU0gjTfkUirbu6EeWEimcdG?=
 =?us-ascii?Q?KRNkZ+bsTzkjg4DhCvgfSkH89OexQCwVkrhrQcpXqXdOOLBLItRsbFQ387Ac?=
 =?us-ascii?Q?v7tCTqwxmE0OMhCNUJJM+4sXxmB2PnX1iJBwZEazVdA0oL13dBVvsQ/Z9dZP?=
 =?us-ascii?Q?+FEaovS8zEQzmImhMJM5yEeeYQ/gzeZqNARV/8RQ5RAVD9BqZmJ+yygHHmEm?=
 =?us-ascii?Q?y26ha9sVRz3Gn/k6sz3G7s1/3IayTTsrpQbgXizYJrxxhuxDk1AifnpepIzX?=
 =?us-ascii?Q?EGoJptlISTXxZugazqm4sUw9QzxY43BSukJULWwTdi/XlI2R+v7vAS79VkiV?=
 =?us-ascii?Q?n4a7un29x8ano7eNtC5pfH962n3kiwwKYYuMkIo7FWvbvxCK+xRv3NlYcHLb?=
 =?us-ascii?Q?bed+oYwiDqSVXTQVa88pNESE+P7KdIomzdXOY8ORmY40W4jJOzi2/ZqqMSk+?=
 =?us-ascii?Q?z25Io17z6xZVwe3IfhJLvquaxbMOobdY5dVi3Aob2/AcCNRwx2JJG5JmvDDH?=
 =?us-ascii?Q?rBhuS6ZJjEWfPXQ/9nQ8Ch5mVmceItfjS8u3viidy3IlC+SAezf4jpOLNHqp?=
 =?us-ascii?Q?9kp7haKnDRcgUDXtjVzq7XPORFK1xFoy2ZnqD0I2qO62zH/z0FpDRHINZuo8?=
 =?us-ascii?Q?ECr9ZumQbPIy9BgfrOg3MM5yIyo9UxtvWFyGXp/KevydTAlxaX5G206lZnRV?=
 =?us-ascii?Q?oJ7IAkk+hqgG+eW/WzV98IjVgedChTmPNrl+5mRK0TJEzfj4mH4sdDXMelur?=
 =?us-ascii?Q?urmBQpU55q7MvqqOFMBarfLw1Z+lRpp01okPrzBl21en0RbKGE9GEBeAKeX0?=
 =?us-ascii?Q?hJm5BpWrxFuus/NJI6vR7a5bbcsT6liOxiS5QCLUmnkKx6Bou9eKCHRYENyW?=
 =?us-ascii?Q?SmcST2QT8nkTuCiDRsbEH8jrZGeqnhY3oDmdHZFMsX4een5rRW2/f/4rROmk?=
 =?us-ascii?Q?NSFKfZkI2nccu+eQAIVzL21USgXsiFKtzv0tbGNXgCWVUi0Ur/nZ7Yg6Qxde?=
 =?us-ascii?Q?Qy3SAKgfFiH6Pyhax0vbJjoh8KPgjFwjvCU5FcfG5lyX6nDTGCJFfeTpw5Za?=
 =?us-ascii?Q?j0nJV0nDYitVIheioZUE?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c912380-db00-4830-e0c8-08dc8321b46f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2024 16:33:16.5774
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB9328

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter). This patch has no effect
on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/input/misc/88pm80x_onkey.c  | 2 +-
 drivers/input/misc/cma3000_d0x.c    | 2 +-
 drivers/input/misc/ims-pcu.c        | 4 ++--
 drivers/input/misc/max8997_haptic.c | 2 +-
 drivers/input/misc/pcap_keys.c      | 2 +-
 drivers/input/misc/powermate.c      | 2 +-
 drivers/input/misc/uinput.c         | 2 +-
 drivers/input/misc/yealink.c        | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/88pm80x_onkey.c b/drivers/input/misc/88pm80x_onkey.c
index 4b0685f96113..6477a41c4bac 100644
--- a/drivers/input/misc/88pm80x_onkey.c
+++ b/drivers/input/misc/88pm80x_onkey.c
@@ -57,7 +57,7 @@ static int pm80x_onkey_probe(struct platform_device *pdev)
 	struct pm80x_onkey_info *info;
 	int err;
 
-	info = kzalloc(sizeof(struct pm80x_onkey_info), GFP_KERNEL);
+	info = kzalloc(sizeof(*info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
 
diff --git a/drivers/input/misc/cma3000_d0x.c b/drivers/input/misc/cma3000_d0x.c
index 1772846708d2..0c68e924a1cc 100644
--- a/drivers/input/misc/cma3000_d0x.c
+++ b/drivers/input/misc/cma3000_d0x.c
@@ -292,7 +292,7 @@ struct cma3000_accl_data *cma3000_init(struct device *dev, int irq,
 		goto err_out;
 	}
 
-	data = kzalloc(sizeof(struct cma3000_accl_data), GFP_KERNEL);
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!data || !input_dev) {
 		error = -ENOMEM;
diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index 80d16c92a08b..408a586f8c36 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -287,7 +287,7 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
 	struct input_dev *input;
 	int error;
 
-	gamepad = kzalloc(sizeof(struct ims_pcu_gamepad), GFP_KERNEL);
+	gamepad = kzalloc(sizeof(*gamepad), GFP_KERNEL);
 	input = input_allocate_device();
 	if (!gamepad || !input) {
 		dev_err(pcu->dev,
@@ -1993,7 +1993,7 @@ static int ims_pcu_probe(struct usb_interface *intf,
 	struct ims_pcu *pcu;
 	int error;
 
-	pcu = kzalloc(sizeof(struct ims_pcu), GFP_KERNEL);
+	pcu = kzalloc(sizeof(*pcu), GFP_KERNEL);
 	if (!pcu)
 		return -ENOMEM;
 
diff --git a/drivers/input/misc/max8997_haptic.c b/drivers/input/misc/max8997_haptic.c
index 8861a67be575..11cac4b7dddc 100644
--- a/drivers/input/misc/max8997_haptic.c
+++ b/drivers/input/misc/max8997_haptic.c
@@ -249,7 +249,7 @@ static int max8997_haptic_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	chip = kzalloc(sizeof(struct max8997_haptic), GFP_KERNEL);
+	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!chip || !input_dev) {
 		dev_err(&pdev->dev, "unable to allocate memory\n");
diff --git a/drivers/input/misc/pcap_keys.c b/drivers/input/misc/pcap_keys.c
index 8a7e9ada5952..f8954a2cab24 100644
--- a/drivers/input/misc/pcap_keys.c
+++ b/drivers/input/misc/pcap_keys.c
@@ -49,7 +49,7 @@ static int pcap_keys_probe(struct platform_device *pdev)
 	struct pcap_keys *pcap_keys;
 	struct input_dev *input_dev;
 
-	pcap_keys = kmalloc(sizeof(struct pcap_keys), GFP_KERNEL);
+	pcap_keys = kmalloc(sizeof(*pcap_keys), GFP_KERNEL);
 	if (!pcap_keys)
 		return err;
 
diff --git a/drivers/input/misc/powermate.c b/drivers/input/misc/powermate.c
index db2ba89adaef..4b039abffc4b 100644
--- a/drivers/input/misc/powermate.c
+++ b/drivers/input/misc/powermate.c
@@ -320,7 +320,7 @@ static int powermate_probe(struct usb_interface *intf, const struct usb_device_i
 		0, interface->desc.bInterfaceNumber, NULL, 0,
 		USB_CTRL_SET_TIMEOUT);
 
-	pm = kzalloc(sizeof(struct powermate_device), GFP_KERNEL);
+	pm = kzalloc(sizeof(*pm), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!pm || !input_dev)
 		goto fail1;
diff --git a/drivers/input/misc/uinput.c b/drivers/input/misc/uinput.c
index d98212d55108..d23f3225b00f 100644
--- a/drivers/input/misc/uinput.c
+++ b/drivers/input/misc/uinput.c
@@ -379,7 +379,7 @@ static int uinput_open(struct inode *inode, struct file *file)
 {
 	struct uinput_device *newdev;
 
-	newdev = kzalloc(sizeof(struct uinput_device), GFP_KERNEL);
+	newdev = kzalloc(sizeof(*newdev), GFP_KERNEL);
 	if (!newdev)
 		return -ENOMEM;
 
diff --git a/drivers/input/misc/yealink.c b/drivers/input/misc/yealink.c
index 69420781db30..c3221b960a75 100644
--- a/drivers/input/misc/yealink.c
+++ b/drivers/input/misc/yealink.c
@@ -868,7 +868,7 @@ static int usb_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	if (!usb_endpoint_is_int_in(endpoint))
 		return -ENODEV;
 
-	yld = kzalloc(sizeof(struct yealink_dev), GFP_KERNEL);
+	yld = kzalloc(sizeof(*yld), GFP_KERNEL);
 	if (!yld)
 		return -ENOMEM;
 
-- 
2.25.1


