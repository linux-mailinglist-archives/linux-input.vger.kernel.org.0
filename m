Return-Path: <linux-input+bounces-11896-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63002A952FF
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 16:48:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C2BE518940D8
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 14:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384E11C6FF9;
	Mon, 21 Apr 2025 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="ExBnJ2vL"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492631B5EB5;
	Mon, 21 Apr 2025 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246873; cv=fail; b=gBUeppOpTq2/UNLFlfz5HC+BdlrHjStfVglOuRKn+XbDkV80hMvX3pzsYx1PtUkxI9PxOucFFYkcHtlOC/Vxc6lsO65kK+ndBuRwa9lLT+STnYlyABqZtm3R4Zp5CPmAK+DCjmDUOayZjQVravoUgxE96kTWYOXvUEl58ATL3bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246873; c=relaxed/simple;
	bh=gc8M6oRBe6hH0YXdyzMaVhgbu1D3GCNvLImc79QKxaA=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=tJSAclA5ktGpNJv2rvZChOx5TlH1LcG4K7E7F7B/XjAsq3B42iRe9/UFTjDMZaaGAmI8DvkeXPUXR7vsEpSl1tl/g3v2ZC7I/8lSFfNNAIDHrK52ZKoXZ5LofwXhRHCgi6/zC7QqFvYp6AcKLZ58l7QZx2j0uSanCT+H/9/RQNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=ExBnJ2vL; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ya//uKdheJ7nPs8YhmLWAIeGBNS5lt20b4txVWYnVKAbgeQ/2DTj4B3zzltnOZHEqgOONSMhXDhV+NPX6Ur6lyAFBVKbWU+zxqgWP5evA7g4cb0ndYSnA5nD25OJhxIS6lnlGYFXVlVXaPvUfDSsIO4YUB42BSV/tMgqxLNV6WwpDGbLLC+t6sAL4Sk9kOgKMLNkzI1scdSx3yQHjkm6gKJB+h7+GsD73rzHEw++N2W6jQjiOQBNVzxCNEj4wFV8Ym/LRxgI/BEvvpO2QJlXwDA6u/ovhEdcyCwl71JVI33VEywI/LbzypNK+VFu4ZuxXOAQYC9kLcZV+zAdTjXppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqbG3Z7aN3q9LJVS6LtGhj8FGDhgkeXWsNHVwYoGZ4U=;
 b=Q6Z0/KSMvh2a52CS7Cq5RdG/9+i54ir00ZU1NmdechdT84guyXHOd8tOsZhAMVBtyzye17JDgFfg/XeHYCTo10bST34ToeYT6QcR8aQs3w2cKBO/KmgRHt4TcO3W3GChD3JP4920KIOicSDS9Nfecs8X34+CqgsqlNhTctHzxrEjTC/v9xBSi9/CNOl7h/3pbd7zk0IxE6w07Zk7QQSnng1rONAZ9xP62FWs128NFrs9eVa/D3Zu4QcZSdD8tqsI6CHGEIKalsovvRg3QWwnb+jHYfKAhpBomk3umptAf5v+YRU4TWiFzWAgUtvQQa72KSJJyuJhgbF0lLGvuUXm4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqbG3Z7aN3q9LJVS6LtGhj8FGDhgkeXWsNHVwYoGZ4U=;
 b=ExBnJ2vLWfPWcqY1g0dNDXAbvm+z961aIucYwSfZC2hCG24/06V/hjmzmaEMTUrPI3UfKleRYbsGqpnKhCP1zTWG9obQRehjBtm7gD/q6aJmXJLKGikwPYEhDzqoSIDDprYhh1r/1h2taIERDtuV0X4nqcG5JuaaPCkNYH7oZxeuMPBcgcR9cNB7RunmPQToq5VyN9nD6SsrkGMEZwgFLmC0lTSFdzWTnX3QOGoVEUkFnyLpQT8Mpa76PWthPq8dV1gSrggkQrQSQhP9qlgNXNX2WhmD8GJWV6ktRiyAYBlTmxuVBRYCLUY7yoHHBHQi29zd6APoRPDEL76YsyzU1g==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:47:46 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:47:46 +0000
Message-ID:
 <PN3PR01MB9597EA007F3B5E2896DA8144B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 15 Apr 2025 16:10:33 +0000
Subject: [PATCH RESEND v5 1/5] HID: apple: move backlight report structs to
 other backlight structs
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>,
    Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <9b0f55baf9e03176098180c8474a5e32a8ea644d.1745246807.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 9673ac14-466a-4de1-1b6b-08dd80e37ab1
X-MS-Exchange-SLBlob-MailProps:
	EgT5Wr3QDKyfA/kqhNtxhLoDzMvzACCov1uu2AEVZ0h9WBuxKPFWdDkfAml6b+WfWlab3IHr9II8vyAz1WjgWitWEYMNwcr7wPF5+ijp70IqrA+7GALI9Nic6k53f72FFreklTkWVjDhRK/iONwOEXvquXf8peFs4qLPPbkeBodVBRGLxDNDPixEIx5dkUZTXi3hVvl8hJVCWweMOKOEZgmNXW57TJQcVp34oOufQlM8xqaUPviEuctF+Qm9qy7qNehUTcig9Xt5SReRSlIFe0p/iSW/Za5N0oGknEXDpbbOHJgh00HM8in6brvwjsL/COEH9Lsdj+dPJSUqh5M5I6vXAALRb2IQs4K5ViYTCPKDH1ir6tEb/GWOFR/kqCGWfS8DRm+IMBhJk8Znd0nzlTGjjgLxV0hxR6aG13K3XcmhDOwkDt9RHf22oyIjDNDdG6i6sHnkl1KKo9+gvnqRBKKRT9xTMyKuxzyqQ7KWk0plu9w6BYHmIzempp/cdcWWVDLg8SZIsZ12Z+PC21GC1QCRXO+0Ej34slw38kRF+JPvoraQDuWk3ikoZUHJlxbCTglqYvTBu83nqDkZocROtVdjB0jkbPF1QmIFmQ2avXUU7ZIxy25pXKjCOVGJlhxWiuW484fWX/FbTCzSs3/1DQg9NBsAnU+MtrbXwlS0KrMseSIAZCGi5oLyrGnsJ336HzIOSa8VTY0PsF+4b6BcUwG4xx6fdxsBPNV77rbbgxM=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TY1ZfSmYfyt4lqbN9xZrYDMdzhu5F0QE4I6s6LrKnhEURP5GPTfGouPN9ynn?=
 =?us-ascii?Q?m9ahUfuA5pWNnX2pVjMg0rCtJCyBRZXNW6I4S2RT0bRXAghSGsijb92l/bQ+?=
 =?us-ascii?Q?TwwAhbPjqQA0FiQV57PXKBu70oYcPsr8NZCsR6TObbceeukE5aXdLmMyB3/X?=
 =?us-ascii?Q?qSvl4ClKgHRgECkRT9WSmCMd1NabN8cH+Vv1hOJ6ukpfDD+NVAe00RUl8Bqi?=
 =?us-ascii?Q?eUEODCUU0d4IGzWGNOn6pxlpb+zO7S9fEyipQAk4CFNkw21GWSKpjuPNMjS+?=
 =?us-ascii?Q?6EtK98/QjbUeIWzLDWqpW/K/LIVHf4B++YpgHTeR0x0KwFJdc6l9QrNZ6nPI?=
 =?us-ascii?Q?wB41QnTqrmtfprZgNoluLEuWxbh9vwfnA5lwF0z/pI9e5m1bc3xEHRQka5NS?=
 =?us-ascii?Q?OTnbKE5tWtvI72lGdJ8lTgkwe64G78adgF/XFPbZrPi7no56+BM8NP2oMALV?=
 =?us-ascii?Q?tVU9puYVoG2dfzZPQIRm6CzRupe9/Q1ZUsoEfAQ5zfx5fyIsn8uyMnpLbsDn?=
 =?us-ascii?Q?RZFgnaFp6eMrE9Lsdvj2DSEtt+MPBsIOcw8n2ppsk7rmuueukjIXnP4NocKc?=
 =?us-ascii?Q?aPY9y4qMZtMvu8SPJqq4dk+mozpbMJU8KXqGIGNbZXewoPz2jU91t6LgS3rT?=
 =?us-ascii?Q?2FdB6q+KNHiY0ATbYyUEe+J00UArrmaa+JG2r9HSlPkpYES0HRgkDEBYMBgx?=
 =?us-ascii?Q?Qw5de/9/04umTHcztWw3+WNR8C4tzDq0fq5Db/57AtojR/Ipv0uyEIQ9HzfY?=
 =?us-ascii?Q?6kl76E7vAWrvKlvIWYpYsXUzt9RV7ls6WLrowphmlrxHpp++BLzdRmZXm3mX?=
 =?us-ascii?Q?RkXYYflZsaONJiPJw9qjj68G4dHD3ulohKsIamIwJqFszyDVwBBSWmJjfv/5?=
 =?us-ascii?Q?3/t7qMclogwRydeH4nsW98qTKAxj5hahKwJR8A1QJJKbG6jnS8IyYTP4mmgg?=
 =?us-ascii?Q?NvHFWxiulfbGsb5xCDJ5ATrkIV7bEUTdpBCRcrvpdwH47vQUq9voV13rh7O+?=
 =?us-ascii?Q?H/P9ueHuOvi5bVe9HcIIu99Iu/R8MkwFX29rDVnc1BUAARLdW4x3yy0yImNi?=
 =?us-ascii?Q?P1VgkteBRSbyhcQn7rJP5WBS+9e6v8uurDAOTf23Lna49exXUfY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?izrM8rDQ9KZ7K8lFTAPii27us2ykBMNYpsMcTI13rVihoEJHM+fA6NQUKeue?=
 =?us-ascii?Q?YPeri41qsbvHQ2Hlz8vVYQmaxNPwamBvhK+cg2NEuAMidg9MG08CZgTJ81pA?=
 =?us-ascii?Q?Lv57oqBtFpW4GZ6cYgfb98FOQsEFt8XzeUPovDoIw0EZiuqXBowQnnbpkoKu?=
 =?us-ascii?Q?MWyu3rWyp8iqb9YR9sdOApaSSC2Su1QDNXzYIKbDxDJko6ueR1U+uSE6F2aX?=
 =?us-ascii?Q?+EpC5pg+aB0v6OE5EYVgVF8EVQKf+yQO3InkcFHakMthOEwe/jLCj4w5QXin?=
 =?us-ascii?Q?OV7MbswxqV9TjLs9B43ZC6HtLI09fnkcP0GK8ORdCsedpjPg091RAC2lN5uo?=
 =?us-ascii?Q?ZPUoJVq2UFZW3RgHpHBRThJXnUCHwHyRJyaolTgf/HAJvc1BWNWxvmvX2crI?=
 =?us-ascii?Q?cQ6sgLwOxQEtd+3XtZ+slySgcrwcUDmjNsSkcYBYJRU0jlkCFikxb0rj8htf?=
 =?us-ascii?Q?vKnQfCxJSqabMmj6oa/NWgy3pC2hpJ3C0zuR8bjTBEZ0LI/lvREo/yvcGb36?=
 =?us-ascii?Q?6i2APjzV0JBlG5tLQUCUNfDAKtCeE6INckdYWzHVA54Wj82iGfQgCnfJ03kX?=
 =?us-ascii?Q?pEkhPjHxV5PAYpA3U91uu85ZyPABWeHsXY63Tyf3RkGSwrCbEwhPcPmIPRgH?=
 =?us-ascii?Q?f9jBbEH2izmQbc38+jiigv3/0DT7X28YZ153WqH3PQhkNr4FpQWzxSaWQugt?=
 =?us-ascii?Q?3TtU+hYnWvUrKXXN2w8HpjnlTg9PsCksSDJ7/sbKqa+kY9gg+Anj/EQGJbhC?=
 =?us-ascii?Q?HhOozGLZmDWhWdlqtzf7PFgd7zgS+l1sb51rdjrSsO0Cq7DGIWfLhrHusKla?=
 =?us-ascii?Q?gOfbwAyIbLtoinok3B3jPW7C8Jh5CXOC0wAnN/pvfiRcQhVGo3RCbBvWzch0?=
 =?us-ascii?Q?RIi/17OQFpuZt4zsLv6Xame4BYEU8k6sPD53Zh0T2C3TjRDkwUoJujVErdGb?=
 =?us-ascii?Q?JmJ/knPNZ5EiGyoWNVt0gtMNyt70QrKvIKKMg7wBKz8XVpeLJqDcezXHHSBh?=
 =?us-ascii?Q?F64CQuXOeRIjhNal5dB2LkFAbgsrcfaYyd/UBf+FwGA4ifgSSUFNDIAUrtga?=
 =?us-ascii?Q?qaKWBCQooKcbbN3BZsX8rGooultAQkJ8ndfFzCWWJiPnWYM3wxkiRkbUF4Sq?=
 =?us-ascii?Q?izSCJfDAwT17k0ilcq0GuuvnBcjGpZNlSPSyd7P7RZWd7+BLc/RtVWLID0Jy?=
 =?us-ascii?Q?mHoWaEUL56eec+mefLOZQM3PwXLwOa59BznwCjxZVgItumOYzvgPAmI6jik?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9673ac14-466a-4de1-1b6b-08dd80e37ab1
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 14:47:46.2577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5918

From: Aditya Garg <gargaditya08@live.com>

The apple_backlight_config_report and apple_backlight_set_report structs
were incorrectly placed between the translation tables. Fix this.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index d900dd05c..93b990603 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -89,6 +89,19 @@ struct apple_sc_backlight {
 	struct hid_device *hdev;
 };
 
+struct apple_backlight_config_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight_off, backlight_on_min, backlight_on_max;
+};
+
+struct apple_backlight_set_report {
+	u8 report_id;
+	u8 version;
+	u16 backlight;
+	u16 rate;
+};
+
 struct apple_magic_backlight {
 	struct led_classdev cdev;
 	struct hid_report *brightness;
@@ -152,20 +165,6 @@ static const struct apple_key_translation magic_keyboard_2015_fn_keys[] = {
 	{ }
 };
 
-struct apple_backlight_config_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight_off, backlight_on_min, backlight_on_max;
-};
-
-struct apple_backlight_set_report {
-	u8 report_id;
-	u8 version;
-	u16 backlight;
-	u16 rate;
-};
-
-
 static const struct apple_key_translation apple2021_fn_keys[] = {
 	{ KEY_BACKSPACE, KEY_DELETE },
 	{ KEY_ENTER,	KEY_INSERT },
-- 
2.49.0


