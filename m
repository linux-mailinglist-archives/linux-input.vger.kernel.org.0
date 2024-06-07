Return-Path: <linux-input+bounces-4230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CE0900B1C
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 19:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1ADF4B2460A
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 17:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F30199EBE;
	Fri,  7 Jun 2024 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="otFcK7Qr"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2070.outbound.protection.outlook.com [40.92.89.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFFF16D338;
	Fri,  7 Jun 2024 17:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.89.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717780696; cv=fail; b=FdZY3VzPRtnjhonM0Eb3Gi74n4uSBPJjnuw3L9afNeSt6PwGF/IJaAfvE1fWCxe2Y2v0zLzIlYhpE7xFDITYlN0lYT/qIHIvTHGLMREDvKJYKuRjCig9lY1Dw4y6wHKjo9Md8u3NEPqN+rs+qOajFPCFBRJwbXTY5FJOGe9HVtk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717780696; c=relaxed/simple;
	bh=hNqvvMmFtm+KUDtVgFDySpMNZ5jfEKKj69PMRQJGGzI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=EcrasLtUEt+D514ZP+rg+snI7Q4Xu8MyRLfVJ6WbJ55t1mAhUODe9+6Jz6XEwBwWP4UBZ2sjjaQvYwO8eK2Sct7Qh0UcaKdv48NMIpEaS6y6reZAMJ2r+uieMMJWCgWe2fby/2YCCnXNiojmlwQn2y66Qk1LqdKEnSgysEkx0P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=otFcK7Qr; arc=fail smtp.client-ip=40.92.89.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i3/b4UNbJb0hXKf91qsYWDDJ/hQqRfkA7xvqBY8w98X8B9Ji0WJmsoGcqIaz7U4y1XF/IlLhHLJ5UhH+Q3AOOmlsUoYzAJ9XsqhEyP08LSX7pqcpa5qDi4JGirgBL0lFH0l01qQx/eGQbk7tkCk0MIU+bCLMNon5+mCSl2oeVZmRJjOB+3spy7irMlzA8x9oXzIaNtxB50TTIa4/qUf441NfhfpqH4ZxSXu5pjnuSXvLdWrmg+hdguHyhyJZFkLHuweo8DKSU60elNnlJRW02IhHdgpgpL4Nl4wYP7Ke+W5Z0rZGMO6NvGldTcdTzjhd4FDKwP2jK32+GBE+ndfzbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/XREG9g6kiJWZRhiTfGDqFfGtNxQi+q3NxyQo6Humyo=;
 b=QyVub8eATYEGU9RunsHg865g/MHfAdj9ioYrikSQ4VBJZ/R6ACZGib9oJqwVujAc3IN9l10i2C+m+g+xdxMKLbOJCmqmGb+uv2s7Ezm7dq5CCu2IJuSlZxPdyYO3U3F9NDPTlZMvPZMaG8l7UWv6u4K+l3FC86Y6yUbRxMPLApix6tSz8h7T79wG23mUKWzFwOS0B2t647g7raH2IhKFmFkFThHCkuQIAUHeGVzhylgWiMdNxK2XM6xFqNaMiROsXfX6cMEg0qUT8yxKHRU+IjuZZhMC/0qrpPOwWy8x0O7ylzdLE0jsFp8HmdUshk+UvVdhtTv7V4XwbykZLRloXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/XREG9g6kiJWZRhiTfGDqFfGtNxQi+q3NxyQo6Humyo=;
 b=otFcK7QrZHHOGb2jue4hulncLFJ5I1P6GtC6+gof6abhUZ2T2de1uDd/imFYGDFvPqCIOG0YuGNzydgw5/yPtBilGhb7ZdqxQsp1OFcRwQ/g2e4vif39osQmG64FpEb+hCDL4nRvTguYntpMp+lah8DvbeLJJaOpm+BM6C9HhEV2EAkcDJb5APlbnIMlSUA5wOllvcshBDCsqcXxyF7TGe9n2P3TEbMkCBUVEr9w2g8H+PEHua/pKk72fGvIZQw5ecAGYoK1qCAQo4iR0wTR9H7iHXR60ArQAuHLHspo2ovVFvC+9NVTkHvX5Uoq5dUbZTsqzdL/BqIx6vIVUHiaxg==
Received: from PAXPR02MB7248.eurprd02.prod.outlook.com (2603:10a6:102:1c7::13)
 by AS1PR02MB8049.eurprd02.prod.outlook.com (2603:10a6:20b:4c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Fri, 7 Jun
 2024 17:18:11 +0000
Received: from PAXPR02MB7248.eurprd02.prod.outlook.com
 ([fe80::72f5:8a03:5810:be20]) by PAXPR02MB7248.eurprd02.prod.outlook.com
 ([fe80::72f5:8a03:5810:be20%6]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 17:18:11 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@kernel.org>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Cc: Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: gameport - use sizeof(*pointer) instead of sizeof(type)
Date: Fri,  7 Jun 2024 19:17:55 +0200
Message-ID:
 <PAXPR02MB72483F512F863C74A4AECA2B8BFB2@PAXPR02MB7248.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [0f7S5K1H/acP37tmgmkcfaY+34AR+dYT]
X-ClientProxiedBy: MA4P292CA0012.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::9) To PAXPR02MB7248.eurprd02.prod.outlook.com
 (2603:10a6:102:1c7::13)
X-Microsoft-Original-Message-ID:
 <20240607171755.11948-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR02MB7248:EE_|AS1PR02MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 00da58dc-3783-49b6-fade-08dc8715ceab
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	/r592CNKkysc4rhHdRNjuZVJwJBZK6O+9ufLNDC/t3yxwVrZg/jC4bARQqzrp24+JOHsv9mowviGPWlz2BR+DpQcSw89/BT9oklqgRftPsGQyAO976DtdR8CrLNvh76Bw8dWbAjib8IyCIXlCzsXHTkQbobF5IgNpgYtlZoDOtRbsMjatirVywnD8D/rBTvXPdCf9b4Y4IhzIo7T83na/4ts5R4o03eb26NfmNSm8vJPLjiY+xKvrvKNjIKhVCjIH7rDyH+03nenCBiDJLUaBKJnw6z70TlTNrwZErfA3pDJ+kxzbC+g5zwrJdnM939zpVMoQi51O6Wt3LXGVrkmWKmXZoFSV/7SdMNwlkw75m5UICnevskoYuc9f4KyZ7bxpaz1Ti09MugaA0k7+TprmAd8Mg3QYtBLVL7XaOQlfUfqYowX9kz3Ot8RUFmTm5IuVNUM9LV928Ln4sa5pvbDRPs/+0NKxEfUW7xRaaVdHbA4SMq1I6wxQJ/Yv8v3ANC//gvr8ZYUYNTG5tP1QuZf7c+6JZhvZNXDViTlat1ORT1fPv1VsC4x8Ld4rSJWgFCSsB1Kg+N97gKczvx6WfGjooMIIJsIZq2XI7x0hrE4QXCP0ht5WFTqfMI6YANlushf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MSFnjq7mVsxhr4jbsiDlk5wu47H/deq8C2mlmE7hPD9WoWq2kydKwVk+sf9V?=
 =?us-ascii?Q?1tfe+FWANecgcXHiGLblX+Lt3xZPVvYn7TEltpRGmNdQKi2MNZMraSw9I5Cn?=
 =?us-ascii?Q?vkNNjHXdOkmnHpbcE7+bOz7Dtqq3ZmdUOWhyzYB2clTJ32BUi1DIJjbXM82a?=
 =?us-ascii?Q?u0qMAaIYoRsI1F6ZqXQg/N9xPFlGOl9mjYRhx4PKhVHgaauliyGVUu0UuRbb?=
 =?us-ascii?Q?WSU/NLzoUp0823M6uIcIFShPh6sILbFZmdtDCn/iB/bR2wKmjp4MZpvU25VX?=
 =?us-ascii?Q?BtNXUYoZIcSlFuAe8BsLspizG8fpxT3wAhJuTyzJCw2I0N9d7kHp3K3yBkRo?=
 =?us-ascii?Q?9r19q6awarwz4Snngnl0t7ZvfedbmuiFjskBGskpuJMXJQLi/OkWMOaCBXcu?=
 =?us-ascii?Q?pI1PVmSnCUxuqlely8eCqVIegb3dEK/vxX82/Qr6uRbDQchVRP7v8r6nWjrE?=
 =?us-ascii?Q?s4uKTt2Ejv71WMdFxPB74u/uIQg5JvAUn0xy3iVw3APVLC6m25nqGRvOrAAo?=
 =?us-ascii?Q?eb5aya3JHESPoMOnS2prtweo+8QjKcr9TEyI/j+f0f2IjDrjgkLH+BANBNxT?=
 =?us-ascii?Q?XhTnnwi67YWjdbRp4cGFRDxI+vJwMUYNcCVB4JOne5DCG+rDMsqdOfSXg4W1?=
 =?us-ascii?Q?q0JE4Cao4Y0MPlWnL+Y71lyh/vpx5YR+qNm0wJfD/EBpdUwXe/ja4U5tnuB2?=
 =?us-ascii?Q?emDMbt0ELImeVznbY1+AiVhAXI1HnvbNDAYCHVp4qqoQ08NE1Cne/9b6JoTJ?=
 =?us-ascii?Q?c2EvpBVHki2vTg552MgA7yhRalZbprhuABVZDyyOE8w3yvQ25T1Vy3xom0hv?=
 =?us-ascii?Q?AyJUmkmgxSAqnaQ2NGhjKWX3cZEmR5XtFm3sWLWX7BSt8utVvLma/cSRnl7u?=
 =?us-ascii?Q?Wx58xSwvc5xXvjgarH5mfQTqqt8C8AcPMEu3IYBCgbkzHCPa9f8c+JttD6ou?=
 =?us-ascii?Q?lC/ZFfF+9g+1g4/j1YWljeZxVUsUJesELWPlkTFuhSeMsURkObkJiNfukmnj?=
 =?us-ascii?Q?H4BS1qZ/p+bmyowsmf+dsz9x7Xc77sZNHAVoFQct44l4+QNUwEBYQAMIV8YF?=
 =?us-ascii?Q?rYoS4jFKFWnqf/VrpJA4u3VqH/mS70PXEYmYtqyRbCVNFkec4GrzbqJDvtv7?=
 =?us-ascii?Q?uAQDmtblG1AVg233vIRGug4kCZeSOHZPnMLj+qON2++VfQUa5lQ9z7NRx7/v?=
 =?us-ascii?Q?jhx9bN6ilaJwyMpj1ee3x0dY2BRdQkYcueOpZthSCK7WimFY9UOVQMpzAKrY?=
 =?us-ascii?Q?qmUpMUvcZzdtzVZgkl2R?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00da58dc-3783-49b6-fade-08dc8715ceab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR02MB7248.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 17:18:11.3049
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR02MB8049

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter). This patch has no effect
on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/input/gameport/emu10k1-gp.c | 2 +-
 drivers/input/gameport/fm801-gp.c   | 2 +-
 drivers/input/gameport/gameport.c   | 2 +-
 drivers/input/gameport/ns558.c      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/gameport/emu10k1-gp.c b/drivers/input/gameport/emu10k1-gp.c
index 76ce41e58df0..4f4583048f24 100644
--- a/drivers/input/gameport/emu10k1-gp.c
+++ b/drivers/input/gameport/emu10k1-gp.c
@@ -43,7 +43,7 @@ static int emu_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct gameport *port;
 	int error;
 
-	emu = kzalloc(sizeof(struct emu), GFP_KERNEL);
+	emu = kzalloc(sizeof(*emu), GFP_KERNEL);
 	port = gameport_allocate_port();
 	if (!emu || !port) {
 		printk(KERN_ERR "emu10k1-gp: Memory allocation failed\n");
diff --git a/drivers/input/gameport/fm801-gp.c b/drivers/input/gameport/fm801-gp.c
index e785d36b1926..7ae5009385cc 100644
--- a/drivers/input/gameport/fm801-gp.c
+++ b/drivers/input/gameport/fm801-gp.c
@@ -68,7 +68,7 @@ static int fm801_gp_probe(struct pci_dev *pci, const struct pci_device_id *id)
 	struct gameport *port;
 	int error;
 
-	gp = kzalloc(sizeof(struct fm801_gp), GFP_KERNEL);
+	gp = kzalloc(sizeof(*gp), GFP_KERNEL);
 	port = gameport_allocate_port();
 	if (!gp || !port) {
 		printk(KERN_ERR "fm801-gp: Memory allocation failed\n");
diff --git a/drivers/input/gameport/gameport.c b/drivers/input/gameport/gameport.c
index cfcc81c47b50..ad39ac6fa96d 100644
--- a/drivers/input/gameport/gameport.c
+++ b/drivers/input/gameport/gameport.c
@@ -372,7 +372,7 @@ static int gameport_queue_event(void *object, struct module *owner,
 		}
 	}
 
-	event = kmalloc(sizeof(struct gameport_event), GFP_ATOMIC);
+	event = kmalloc(sizeof(*event), GFP_ATOMIC);
 	if (!event) {
 		pr_err("Not enough memory to queue event %d\n", event_type);
 		retval = -ENOMEM;
diff --git a/drivers/input/gameport/ns558.c b/drivers/input/gameport/ns558.c
index 91a8cd346e9b..880e714b49bc 100644
--- a/drivers/input/gameport/ns558.c
+++ b/drivers/input/gameport/ns558.c
@@ -120,7 +120,7 @@ static int ns558_isa_probe(int io)
 			return -EBUSY;
 	}
 
-	ns558 = kzalloc(sizeof(struct ns558), GFP_KERNEL);
+	ns558 = kzalloc(sizeof(*ns558), GFP_KERNEL);
 	port = gameport_allocate_port();
 	if (!ns558 || !port) {
 		printk(KERN_ERR "ns558: Memory allocation failed.\n");
@@ -192,7 +192,7 @@ static int ns558_pnp_probe(struct pnp_dev *dev, const struct pnp_device_id *did)
 	if (!request_region(ioport, iolen, "ns558-pnp"))
 		return -EBUSY;
 
-	ns558 = kzalloc(sizeof(struct ns558), GFP_KERNEL);
+	ns558 = kzalloc(sizeof(*ns558), GFP_KERNEL);
 	port = gameport_allocate_port();
 	if (!ns558 || !port) {
 		printk(KERN_ERR "ns558: Memory allocation failed\n");
-- 
2.25.1


