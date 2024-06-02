Return-Path: <linux-input+bounces-4029-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C28D7745
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 19:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD87EB217C2
	for <lists+linux-input@lfdr.de>; Sun,  2 Jun 2024 17:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3CF55C3E;
	Sun,  2 Jun 2024 17:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="pHxuNEJQ"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01olkn2074.outbound.protection.outlook.com [40.92.64.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B972D1DFF8;
	Sun,  2 Jun 2024 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.64.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717348269; cv=fail; b=a57AG4d37sBueEGnyRaOggD3OFz5ee/UpHcmgdl+S99QKzBzLSJGUCnham32VVfv8MYSmDFwhUamyrvd4u/AjPQEYibcvmslgxA9GfEaDLCvMMGQxFoyNUiRY/TfEomTQ/X/ouPjAcwNHiTbhxPRy636qpQwVI5ywcKdVXXIzY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717348269; c=relaxed/simple;
	bh=KHmW89Acb1Hw/39bfzA0Nu2TG1C20LQwC+0JLjG77eg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IPxjl+HeVwNlJcgGCBz/NvVP4ss9Y1Q4Ga+vf3myn78kMBaUStWs2XuI5XcogI2tqYiss6yuGdB3GnvNpM3oPA9X8v3kxhySOtlWOXjN5oR1rrB6OBdb56t41zmO5LZXRp6YaONH36/XetgeOYgYN6C59B78CgjtPwj8wMHF7ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=pHxuNEJQ; arc=fail smtp.client-ip=40.92.64.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWMtqZeDgJ3m1wxOd+diK0Yi3ObVE/+9ZsUG0t0ErL6NxAS0nC1qD90QjDmABVjEOhpV5Rbbnn806Qv4ENDubGnHrVTtScFxrfGN38oIIwER3nwY/eska1finqQ2mMUA5/BSn9fD98NkI9kghUnb+cN1G5laYTRtm8+CIE4GtZrnaSV2xo1F14MCcCrC1mNBstjCKDCtutUk+XYm2BbxLCkFbCnli2a6e6B7Z4cwcxgUq0EFLLg6Q4kEjxeGK+E5MRoLBOroGQuqzurzpnoVWLW5NsLSm8pZbElAHlaRBpTpvtWKQc5R0w4EgOmDMcNCWIetD6O4sUmSgut/FaYivg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IW+RyyDSezOkgMbbv59Y/eiBcPUapSik8JC7GYf8+VE=;
 b=Uax17Ny9AKi5yNECiKJxrYSyHBrGKpX/+eampyxaCQ0+u3F/mUcJ8zl/RnHhqDf7yM3VCXEpqxdMsOH1e4SuH92+z8NOBT0soYp7HoF+MgLC54/uKsE/QcVToVNPI85Pvm5nYkDm0NXBhp5viuyWiaUGw84EBbXoZ7q9QO+5mWpNnsWnaRSIuqLroMDx6MdZK8UzgoSBzmh+aRE15XbUSB6pl+3VtAhdbqa51vB/y8PjOm04is4/Scx4kcFlXDEO0P1IaoAORJT70afMASe0rD1ADe5uzYeloVLN04lQ171WFtTka17TyKIsA+/d9q9tKwCQ30w3hGdtsuQ+VZWhTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IW+RyyDSezOkgMbbv59Y/eiBcPUapSik8JC7GYf8+VE=;
 b=pHxuNEJQlHLX5MT+eLzu4ff3ENhp5Gm+/UNj8uaqR0hawFHrOqwKrNNHrhmCpmBYlw7o4AXC1WiSvCGZG13AicKSV0X5CAkicvif+HinkpD20fe6K/VNvPUyhvT7KPLvPd1fHmlWQEFLvo3TZ79DKOrsRGCuvGhsRZcyFqbuTS97+3LLWYPQH2v+603hU/ZA6jppyJImMeWisaAc72NALowEykrAMZpOMt7ce88WLo2UCcGn5C0b1S0AS1jv+cnr5UdscVtFI57TA3HCfawKpLM9SrirBoTy9k1J0f/p9Q6vsuf0+CvCBnmQfW95n+fRcuWZBmcTZEGiHSkvt15Ryw==
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com (2603:10a6:20b:3f1::10)
 by PAWPR02MB9709.eurprd02.prod.outlook.com (2603:10a6:102:2e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Sun, 2 Jun
 2024 17:11:05 +0000
Received: from AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658]) by AS8PR02MB7237.eurprd02.prod.outlook.com
 ([fe80::409b:1407:979b:f658%5]) with mapi id 15.20.7633.021; Sun, 2 Jun 2024
 17:11:05 +0000
From: Erick Archer <erick.archer@outlook.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Julian Squires <julian@cipht.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Justin Stitt <justinstitt@google.com>
Cc: Erick Archer <erick.archer@outlook.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] Input: tablet - use sizeof(*pointer) instead of sizeof(type)
Date: Sun,  2 Jun 2024 19:10:47 +0200
Message-ID:
 <AS8PR02MB7237B05083487507CFAF96B08BFE2@AS8PR02MB7237.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [qObYvI9HVNzCgr6TGBlgI2cko2faWttc]
X-ClientProxiedBy: MA4P292CA0001.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2d::20) To AS8PR02MB7237.eurprd02.prod.outlook.com
 (2603:10a6:20b:3f1::10)
X-Microsoft-Original-Message-ID:
 <20240602171047.10890-1-erick.archer@outlook.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR02MB7237:EE_|PAWPR02MB9709:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c890169-e3ad-433a-43c7-08dc8326fc75
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199019|3412199016|440099019|1710799017;
X-Microsoft-Antispam-Message-Info:
	tmOcuAzJMBnieYN0Ss56eEOkxnuqfqMoylxXBq1viln0GLnPCFCrbK0h8DqPUMzOxjEyC+Zuc8DmdtR99jtfCMF/yhKnWQ4z2Hjil1dasNH7BK0ijIOnEDKq/1JNQ8YvPFGJlcyw4udjFjuA9InQVf7hs3KG4OUCOOH8j7k2jt6sD9Yk+9Is0gDz/a0ul11000kb1h9CCIKEW25vksu2BRYbnVSgjyGQK8Ql4lARmOk3RpWOoSNDgfqCoiXzsVb28Tj+t+OiaOSyZaVrblX3Faj5ETUoatqaowGYNK204MXrcvbj0+uQiEd/adicwDQawBJuuFvbqBtyHy7VQyGQjuBqhBuBw1XjjwMDSQ19pxmXsovuDpdUIcBDYtiJSdrq1Asb+jj/JfYYxJf2Hjg/pZC6lYUebdY+ptKwazbw4AzojCkIiW/AFxQDZ1cfcLcLGh8VF4+EToOUEGVmiCljuhN4QiIUkuKwiF9PqkDLBsBe2PQdWyseoa9qxSJt8LGwTL32Iw1PUrMQGwI/ULSjb9sNmAnVI3OvzQYV3tXE9NzA4zGOW1Ih9YQAR0BPgkuNm5f+AQ0S3DK/hSRAiNnF+op3ZVVWasPpM7XIDTqBO4mg8hRF+zR0U3Maq8lrpyaf
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IzondYzEPjmhmQ/EEGdHqFE2P34z2EflCXsRkf3iasIyQ0+/qneYpD2a44/m?=
 =?us-ascii?Q?PdTn5m817gGxgH8+CWXm0AfU/tzj60aY5KfLDokw1W+7Pve2b2t4+EmaLqsC?=
 =?us-ascii?Q?8oEUEsSViaNJoPztmvVIZKtFB8mMY7pyWx3U1B6zhJMsfjfcXJBUMeW1do2Q?=
 =?us-ascii?Q?WtjYD0FJEDga5m8Yzq3BYLCbmcXauAdx7WUNSHb7ocqfahkJJusqIkwI593N?=
 =?us-ascii?Q?YANnkL6KRiWqsVnzzOs3TwwwYo1feoBFklW3E62Nzqsp78cA+kXqolYjGVn4?=
 =?us-ascii?Q?KBRrk5oTDHgdst2f62gNG02jVgJegTwSOywktMjT1pGH+/W6fHEmTQtSw8UF?=
 =?us-ascii?Q?Oc58GLOC5HAtWuj86Yvy+hPdce1XRKoY8t92khrDLQGyi6amWlXsuTDum6z6?=
 =?us-ascii?Q?KSyQPvGy8bqlzEt5jK9gR8jy/+pMX/P8Z88piJj+GKea7de10VMP/AjkBN/w?=
 =?us-ascii?Q?GbFResZNHFjc9HKxjBtaKnU59bbfUMipn9pZX2MWoG1mJxCDvQwv9XvU+TzA?=
 =?us-ascii?Q?XfPAxo5OYXFR2OR4TN8/F6ltDVRLiPwCp9oK+shzcZz+SHP03ppstLclxIme?=
 =?us-ascii?Q?cyS25uC8rUrfiEuvbTkMBuZvzSYMi6DdQDX8rho2ferV1860VmCf1ecyjzTr?=
 =?us-ascii?Q?bDmNUKXjIJob29t31BMjjD3sFg4MsW/u4hfVDNpqw5VUoocOmdOH6LsOX7qO?=
 =?us-ascii?Q?o/7IsSEBpiaknlokCjy4ieEQEIshQlSVbR9X12Kx2uY2r4iAXsd3eFaDwuZn?=
 =?us-ascii?Q?5Li3albOQOXh9XaiGKGKCKV5OVJSoenvD1aLp+tFhRqOuY+E+dbp/8+1Rexn?=
 =?us-ascii?Q?+p8L3vocpLKxMXtZDFt7hhXlGj0Bgdnq9eHQQ5vGS3puJ50heDkFf/IdMrlM?=
 =?us-ascii?Q?KnKSl6BNYV9ZgggJtjGzcFcF5nwfgSzbl1bU0G2fVfsoPuYsDUsaj0qipI29?=
 =?us-ascii?Q?dzY/K/xAGGJvbm9Me5G258g4EVuaRYIuns75QWaV8cog0IFF6feAiN9duwRJ?=
 =?us-ascii?Q?xII2YPIrASBqscOTLXcwF/a3tWwggK74XxvRfG7ZIx1vZ8Cb+JQVCBitUTbp?=
 =?us-ascii?Q?VLWFGza/XxpoZYy74eqhMSNMkZi+rrH3iyQ4PxzPOD7vQ6/+2U/P7NeWEuq0?=
 =?us-ascii?Q?fYPcW4jQ+CM6tz5OMCDUN4QdjIo+2b6EiqngjnXEWQeVze9ESYAHrLvvmdiK?=
 =?us-ascii?Q?3N0K4pFmfpfYpgTrc4xJFJHJ9ZQjZgaEnQFS7Mzg72Uh3uwWwLIbk+5ncCsC?=
 =?us-ascii?Q?ZU4RMddpkwQpmuJTvjCw?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c890169-e3ad-433a-43c7-08dc8326fc75
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB7237.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2024 17:11:04.8631
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR02MB9709

It is preferred to use sizeof(*pointer) instead of sizeof(type)
due to the type of the variable can change and one needs not
change the former (unlike the latter). This patch has no effect
on runtime behavior.

Signed-off-by: Erick Archer <erick.archer@outlook.com>
---
 drivers/input/tablet/acecad.c        | 2 +-
 drivers/input/tablet/aiptek.c        | 2 +-
 drivers/input/tablet/hanwang.c       | 2 +-
 drivers/input/tablet/kbtab.c         | 2 +-
 drivers/input/tablet/wacom_serial4.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/input/tablet/acecad.c b/drivers/input/tablet/acecad.c
index b20e5a1afbcc..0ac16f32b31f 100644
--- a/drivers/input/tablet/acecad.c
+++ b/drivers/input/tablet/acecad.c
@@ -129,7 +129,7 @@ static int usb_acecad_probe(struct usb_interface *intf, const struct usb_device_
 	pipe = usb_rcvintpipe(dev, endpoint->bEndpointAddress);
 	maxp = usb_maxpacket(dev, pipe);
 
-	acecad = kzalloc(sizeof(struct usb_acecad), GFP_KERNEL);
+	acecad = kzalloc(sizeof(*acecad), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!acecad || !input_dev) {
 		err = -ENOMEM;
diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index baabc51547b8..2d176fbab251 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -1673,7 +1673,7 @@ aiptek_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	 */
 	speeds[0] = programmableDelay;
 
-	aiptek = kzalloc(sizeof(struct aiptek), GFP_KERNEL);
+	aiptek = kzalloc(sizeof(*aiptek), GFP_KERNEL);
 	inputdev = input_allocate_device();
 	if (!aiptek || !inputdev) {
 		dev_warn(&intf->dev,
diff --git a/drivers/input/tablet/hanwang.c b/drivers/input/tablet/hanwang.c
index 9bc631518b92..42c1e5eaddd5 100644
--- a/drivers/input/tablet/hanwang.c
+++ b/drivers/input/tablet/hanwang.c
@@ -322,7 +322,7 @@ static int hanwang_probe(struct usb_interface *intf, const struct usb_device_id
 	if (intf->cur_altsetting->desc.bNumEndpoints < 1)
 		return -ENODEV;
 
-	hanwang = kzalloc(sizeof(struct hanwang), GFP_KERNEL);
+	hanwang = kzalloc(sizeof(*hanwang), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!hanwang || !input_dev) {
 		error = -ENOMEM;
diff --git a/drivers/input/tablet/kbtab.c b/drivers/input/tablet/kbtab.c
index aa577898e952..38d36d25f6f4 100644
--- a/drivers/input/tablet/kbtab.c
+++ b/drivers/input/tablet/kbtab.c
@@ -121,7 +121,7 @@ static int kbtab_probe(struct usb_interface *intf, const struct usb_device_id *i
 	if (!usb_endpoint_is_int_in(endpoint))
 		return -ENODEV;
 
-	kbtab = kzalloc(sizeof(struct kbtab), GFP_KERNEL);
+	kbtab = kzalloc(sizeof(*kbtab), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!kbtab || !input_dev)
 		goto fail1;
diff --git a/drivers/input/tablet/wacom_serial4.c b/drivers/input/tablet/wacom_serial4.c
index 1cedb45ba497..cf7cea77dabc 100644
--- a/drivers/input/tablet/wacom_serial4.c
+++ b/drivers/input/tablet/wacom_serial4.c
@@ -521,7 +521,7 @@ static int wacom_connect(struct serio *serio, struct serio_driver *drv)
 	struct input_dev *input_dev;
 	int err = -ENOMEM;
 
-	wacom = kzalloc(sizeof(struct wacom), GFP_KERNEL);
+	wacom = kzalloc(sizeof(*wacom), GFP_KERNEL);
 	input_dev = input_allocate_device();
 	if (!wacom || !input_dev)
 		goto free_device;
-- 
2.25.1


