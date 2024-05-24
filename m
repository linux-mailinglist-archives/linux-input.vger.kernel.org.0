Return-Path: <linux-input+bounces-3827-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5C98CE937
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 19:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27F241C20336
	for <lists+linux-input@lfdr.de>; Fri, 24 May 2024 17:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FA61EB31;
	Fri, 24 May 2024 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="lO6F+Odk"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2098.outbound.protection.outlook.com [40.92.90.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D595179B7;
	Fri, 24 May 2024 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716572015; cv=fail; b=UUY3bNlXRpOc7BMkB/kNMoSLDOLhFh26MR23v8l48tI1TGMa5mrQOGMQ/zdz74bByACyRTVHc2Z99ufiB9l8Wrl/l6PNJf77hFc0Oi7U1oZoIH4gAJeDa3qzo1flGmDqYeBT8ZaL+5VnGWmTDm2wO9Yepi7V9fqwt32EXLo4kCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716572015; c=relaxed/simple;
	bh=Q31t9AfSFTGD1nA2S9hpHTFJ0954zY5nXdtDkSQPNOs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RFREx3AOOk7NhaWvBbjY0/e2RQ5/vjgXASt/YgGwR10YJDJ8U6m/Ris280GtvSNHa/m/bz7DgAyLeZF7pHjb7sYg0FGm1vn+bb03kAGtjpp0O/XJExy58zFEDrhfd0h4nrCiSA9p1b5oC6iIymWuvHheRg7fyTgP7seiMqUuRQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=lO6F+Odk; arc=fail smtp.client-ip=40.92.90.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fr03JE9MXbkVAI51NxwwDwjYhvOAWjD4SczG9ewnK1hzTtqIGNrfLgniiLiIrySqTwZnLKLwcbE3o9647nty7Yiuu4pvBFZX/OmclbRrzE76kYm9HeAsDZkR6uWXt+GhnyNr9cdB5dRTOH4EzyTaQYy4rxFiTurEJbbhP2jbyoeShFBbv/pxV1Hc7VJRZyueLEVIVpiqmheQnqCu5RlguaULDA1Z9Yab4EJ9jtdH1FB6foYns4FFWZ8PxWl9yuozKkSSVI22qLwvP6CU++4qxKyuuM+/pV4RHrMGOjcR9tJbuXknKh5Q0H+yAT0vgYHSWi2Acz4C39Lay7XIL8RCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlE7rAHTxCTTdZqdWyQduhiKowc3A0D0B1yRqkyKxks=;
 b=oQIyxk7WWhTDa+1XtmCT3M85rf5d3aRgGp7feRo/YpwSngYzEvgdkzEX6BkymGzCtOn7ybGyfE74dPMRUQJZhODCwM6b/ZZnRRnoz6J+dCgGFcBibOxkQM0w6lQPSHoe8ecLJSjhmrYE3RBHyo81ViU/REYd0s2COBd+P6KYti27nRqAYMOw6/ugqiH9+R52GXf1dhRB5h2ry2LlEuW9KkLuxYvW8nGlRTxpMk0xBprV6saMbIeUP2lXxkuh5V6dSZ13Sk5SqE5iOn6YyflIwV2LWWL95dXJGjwcGmpl3KBSCPpWAw0Hce2REi6e98eK6LZ80C1fp7C8VTU5jl0Aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlE7rAHTxCTTdZqdWyQduhiKowc3A0D0B1yRqkyKxks=;
 b=lO6F+OdkkXTN2NE+Ra2J5NlI82fXPGFoWcqY1EKhncswBo/5Svaa8CY76FRcBFGi4KkOMV1OWSMPHdsVLxbrvP9ZPxJgT2rBOenK5rEK5D0b1NO2pKFmPjywYIyuSsSQFJnf4e9ovw44pPv9M0KlTKMEb93/5qHTK6EmGbbBUBprIt7mSnlb1oJkQdvg8aDgFyeXQattHncRay0Og5SK7lSMPPsaAEbb5Via4qAEL6grDynUOgGhDmff3eYuNSvkJnpdWOFHhE9RUzUXcVIsG7RVNOUzhAQfKRqBT3wMwUNRpdZa7NtqEUBBFfIyztnIAhocpOFDLb8/lTZeQGn0XA==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by AS1PR02MB8092.eurprd02.prod.outlook.com (2603:10a6:20b:483::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 17:33:30 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7611.025; Fri, 24 May 2024
 17:33:30 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Cc: Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: keyboard - use sizeof(*pointer) instead of sizeof(type)
Date: Fri, 24 May 2024 19:33:08 +0200
Message-ID:
 <AS8PR02MB7237277464F23CA168BFB3B18BF52@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [5yBEfCPLmRFezr6QgX80E+0C1AAXsjIs]
X-ClientProxiedBy: MA4P292CA0002.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::19) To AS8PR02MB7237.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:
 <20240524173308.17189-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|AS1PR02MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: da199884-9f06-4cf5-a4bf-08dc7c17a069
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|440099019|3412199016|1710799017;
X-Microsoft-Antispam-Message-Info:
	TfczYUtds3mfrNQuLOhwKhpt+0m+cgWaY7LiZt9cMO6cwI5pzU6ILVklQIm9vweEBunT+3/N9OvPt8epckK6GFjNfoO7iTUyH1VwZoFMSOJlHpUjeNosZ4IoJlj6+TzleHppAN5IB7ryjlzMKYvtfIGQb9MsxCVjpiPklDANlnUY36BcJv+PH4JYGzXJYEr/ruMcrQvEeP0LfkOiK6a1oAIrfAteASiFM+CuQ6dlZMw+I8SQl6eQKCi3gsjTEIK99nCqSZnBRLmzQrp4dZF65s8IIm7p6vpgB80HNqJmwxgqxWn0p5ldXffMGBu/aoPdfONBl3UTFUncLGIg8oXUsAWJdhryG+ExO0cFWoDRu02ufoUt1nPYnvRDWTx5SByUHJomtP3u5YpUKwWYeTl9Mck+0GgjTz8qL25K07bMfiZMEq74Kwa8dC/yJ8uayAgzDMPNKTwX735RlquHj8IBM16lOcwp9pvBuoTqlfytjCqkBFuesm8ztE8zd4KRdADpNmwryit+/dk0BpPOzNH6Tkz4NSRE3ml4BF+9fr6Xu1b9h9XKXWD/qk+uA1svOo8UOc1E8E8RdZGb5F5ixNvxGXsMcs+dXnkAYr45Q41X0yZeXYOfuTxckprFc+i9zx6p
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mGesQWM0aueoZJq1iYZVxNOCzrhdINLYHPa/snexDQw8/1VQYeBGLF1MZgTX?=
 =?us-ascii?Q?WNnVDgQ7R8BBpxt2lgdf+hRFrequ9r4QN+2dFPoELilSxvoA3Gv5sf5iJdQt?=
 =?us-ascii?Q?OeUKnq8KS9bGZle5h+KFNdCST2jD4dOfIm+qMc9+d2B7EuHMgLXdLPxre3qO?=
 =?us-ascii?Q?p+BactK0GfBm6YITy6f7xMqGvAp3oBak5t+AqfkLBcWKTfIy8bz+wwPsrK6G?=
 =?us-ascii?Q?KUUcPTxO7pBlGCHaCUJ5EcsN6Igcjyhy9x4rGS8yaWh+tT29BubpU4Ci9Kw2?=
 =?us-ascii?Q?7uGRT5402qqnNGdH17koiCFk5hB0CQmRml9EuLFsKykvMWefqEUJuPPW/Z59?=
 =?us-ascii?Q?FWfu3Xfjv0zdQjoh/LH7fHm7FawjD77kjzj3GvQyP960j85eviLRoJWUpYf/?=
 =?us-ascii?Q?Rootk7WHnToB8Tgibj7bNGrkDd7FswXh4IbJI6SGvmakJgkoO2cAb2EhNcdZ?=
 =?us-ascii?Q?YkPWp2VGEVmyor56aF7Nv8yaiVcyWu2YCFq7S4x0O8QHqsm2E7cV8x5Zn6au?=
 =?us-ascii?Q?J5LqRN3HyzEj4HTcqwewPL7sr2BpmvNn0SmPbpUMKDb+x7a70rLTOYRESNRN?=
 =?us-ascii?Q?3Uakv9PDiittiBawjBU8Cf2/rBLVnjGW1vSDzEvzTNdnaadGaaW4xA+NaPer?=
 =?us-ascii?Q?iujjx1kJwskweOaOfQNgwlzYn59iWPsE1Y47RD9e/0n9+Dyi5PABRRzp1WNC?=
 =?us-ascii?Q?IuEx4v2dQxDIw5/EdCMV7jqp8SqCvVOU6e+v8wGIeJ+5h0s4o/RkqLAKar4b?=
 =?us-ascii?Q?9pDFmaZ8eNzBAq9atL0/5rQOaqkCwApGyTDcIwLG+15wkngspFraBZBqb9Y7?=
 =?us-ascii?Q?vhIFF3/ggA2ti1ioufIgyZEAw625t5MSFNU3JUbLbyCP+JdVKgPxDln4K3E4?=
 =?us-ascii?Q?50skgdFlaxxnhTSpbfBzt7WDSiQq2ZvQGIG1TtCnBeMv7BlzRK6nhxwiOJv9?=
 =?us-ascii?Q?EOXbrZAPTTLxRf1Qj7LUZurwiWzh43P1Un1YP0rhqFILns4U8qnXMWkGdkH4?=
 =?us-ascii?Q?u50FWxx5a4c5kj7opS2YIzFo9pFtcQn9cxJcUHAvf+1T2YNIdvCiaxlDatc2?=
 =?us-ascii?Q?QoCAdo0BRPx55ooZ7qTKZaS+nehTnC3JlK43Ur5+gJ6kvWf3asgJ+jjEZBwR?=
 =?us-ascii?Q?TPhiDBoPrG0dfC/gvNO/coHsjdm7N6EYRH0OImPMb8r7tWLPwnHTfCJY8AsK?=
 =?us-ascii?Q?Rg+bDNgqv20Ry9j6Pg25kTBEcubEUGHP+QdRFIJU/SheVYD6vAb35YgG/3cu?=
 =?us-ascii?Q?u6ZOLU1uX11WSrx24xt6?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da199884-9f06-4cf5-a4bf-08dc7c17a069
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 17:33:29.9833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8092

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter). This patch has no effect
on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/input/keyboard/atkbd.c      | 2 +-
 drivers/input/keyboard/lkkbd.c      | 2 +-
 drivers/input/keyboard/locomokbd.c  | 2 +-
 drivers/input/keyboard/maple_keyb.c | 2 +-
 drivers/input/keyboard/newtonkbd.c  | 2 +-
 drivers/input/keyboard/stowaway.c   | 2 +-
 drivers/input/keyboard/sunkbd.c     | 2 +-
 drivers/input/keyboard/xtkbd.c      | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/input/keyboard/atkbd.c b/drivers/input/keyboard/atkbd.c
index 7f67f9f2946b..f4f2078cf501 100644
--- a/drivers/input/keyboard/atkbd.c
+++ b/drivers/input/keyboard/atkbd.c
@@ -1279,7 +1279,7 @@ static int atkbd_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *dev;
 	int err = -ENOMEM;
 
-	atkbd = kzalloc(sizeof(struct atkbd), GFP_KERNEL);
+	atkbd = kzalloc(sizeof(*atkbd), GFP_KERNEL);
 	dev = input_allocate_device();
 	if (!atkbd || !dev)
 		goto fail1;
diff --git a/drivers/input/keyboard/lkkbd.c b/drivers/input/keyboard/lkkbd.c
index 047b654b3752..c035216dd27c 100644
--- a/drivers/input/keyboard/lkkbd.c
+++ b/drivers/input/keyboard/lkkbd.c
@@ -608,7 +608,7 @@ static int lkkbd_connect(struct serio *serio, struct serio_driver *drv)
 	int i;
 	int err;
 
-	lk = kzalloc(sizeof(struct lkkbd), GFP_KERNEL);
+	lk = kzalloc(sizeof(*lk), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!lk || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/keyboard/locomokbd.c b/drivers/input/keyboard/locomokbd.c
index f866c03b9d0e..4b0f8323c492 100644
--- a/drivers/input/keyboard/locomokbd.c
+++ b/drivers/input/keyboard/locomokbd.c
@@ -227,7 +227,7 @@ static int locomokbd_probe(struct locomo_dev *dev)
 	struct input_dev *input_dev;
 	int i, err;
 
-	locomokbd = kzalloc(sizeof(struct locomokbd), GFP_KERNEL);
+	locomokbd = kzalloc(sizeof(*locomokbd), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!locomokbd || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/keyboard/maple_keyb.c b/drivers/input/keyboard/maple_keyb.c
index d08b565be24c..91a1d2958109 100644
--- a/drivers/input/keyboard/maple_keyb.c
+++ b/drivers/input/keyboard/maple_keyb.c
@@ -154,7 +154,7 @@ static int probe_maple_kbd(struct device *dev)
 	mdev = to_maple_dev(dev);
 	mdrv = to_maple_driver(dev->driver);
 
-	kbd = kzalloc(sizeof(struct dc_kbd), GFP_KERNEL);
+	kbd = kzalloc(sizeof(*kbd), GFP_KERNEL);
 	if (!kbd) {
 		error = -ENOMEM;
 		goto fail;
diff --git a/drivers/input/keyboard/newtonkbd.c b/drivers/input/keyboard/newtonkbd.c
index df00a119aa9a..71e0a3f830dd 100644
--- a/drivers/input/keyboard/newtonkbd.c
+++ b/drivers/input/keyboard/newtonkbd.c
@@ -68,7 +68,7 @@ static int nkbd_connect(struct serio *serio, struct serio_driver *drv)
 	int err = -ENOMEM;
 	int i;
 
-	nkbd = kzalloc(sizeof(struct nkbd), GFP_KERNEL);
+	nkbd = kzalloc(sizeof(*nkbd), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!nkbd || !input_dev)
 		goto fail1;
diff --git a/drivers/input/keyboard/stowaway.c b/drivers/input/keyboard/stowaway.c
index 56e784936059..7ef0b3f4f549 100644
--- a/drivers/input/keyboard/stowaway.c
+++ b/drivers/input/keyboard/stowaway.c
@@ -72,7 +72,7 @@ static int skbd_connect(struct serio *serio, struct serio_driver *drv)
 	int err = -ENOMEM;
 	int i;
 
-	skbd = kzalloc(sizeof(struct skbd), GFP_KERNEL);
+	skbd = kzalloc(sizeof(*skbd), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!skbd || !input_dev)
 		goto fail1;
diff --git a/drivers/input/keyboard/sunkbd.c b/drivers/input/keyboard/sunkbd.c
index b123a208ef36..72fb46029710 100644
--- a/drivers/input/keyboard/sunkbd.c
+++ b/drivers/input/keyboard/sunkbd.c
@@ -263,7 +263,7 @@ static int sunkbd_connect(struct serio *serio, struct serio_driver *drv)
 	int err = -ENOMEM;
 	int i;
 
-	sunkbd = kzalloc(sizeof(struct sunkbd), GFP_KERNEL);
+	sunkbd = kzalloc(sizeof(*sunkbd), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!sunkbd || !input_dev)
 		goto fail1;
diff --git a/drivers/input/keyboard/xtkbd.c b/drivers/input/keyboard/xtkbd.c
index c9d7c2481726..befa713268ae 100644
--- a/drivers/input/keyboard/xtkbd.c
+++ b/drivers/input/keyboard/xtkbd.c
@@ -70,7 +70,7 @@ static int xtkbd_connect(struct serio *serio, struct serio_driver *drv)
 	int err = -ENOMEM;
 	int i;
 
-	xtkbd = kmalloc(sizeof(struct xtkbd), GFP_KERNEL);
+	xtkbd = kmalloc(sizeof(*xtkbd), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!xtkbd || !input_dev)
 		goto fail1;
-- 
2.25.1


