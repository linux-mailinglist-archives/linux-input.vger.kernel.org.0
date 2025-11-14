Return-Path: <linux-input+bounces-16117-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7969CC5CD76
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 12:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32DBF3A9104
	for <lists+linux-input@lfdr.de>; Fri, 14 Nov 2025 11:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83381313E2B;
	Fri, 14 Nov 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="cDnBoiGZ"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5531352C;
	Fri, 14 Nov 2025 11:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763119471; cv=fail; b=uAr5chpBuwuFdSZyKeaRv9lsLmK2cINYW3yjkR7ZxQTZEtwPJbuQBZPHLN/eHS84lBqIpgLFvr2QjFJBwi1i0c37pjmFfzkD/k98A5KX332RnSQTT3XoGFo4Rqcnj05qZMRU7SPBtfeOOHm9SUVj5tEArDdtX69hD4eUzr2KWUk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763119471; c=relaxed/simple;
	bh=gKIyIGh6Fpqe3y7Q0ifZtiTMvsMcuPcsYmxGpXyOJqg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lg0VH4lzKjiKnE/m5eD7TE83+I4+TtzKyzbG97abS6FxRG/41Si4XM7O28ZJ9vscDkFgqL9ln+RFjx7eLeJNpLcbwMt6xOU8RN+GhxF0ZMPsPBL8qPumAZnBsIKE7PsoOYA1fNXpI4WJTfawoK8HP0PsWLc2IJNIOghuepCloO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=cDnBoiGZ; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBfFvJsnzyf//9S8EvsNg1xPJ9zHGIU+3vCfeS8DXbEzAksk8OFbm3Uk8cNAnw9d3GCA2Or6CzEWKx7Yg8apvy7rORL5uVTWZMcnR5CkldwFDq5EEz7T+QBgqO2r6FSqeZm4T5H2Fe6Dbdy+Ui+TU8hm8tGqjGKCjZs11KH1e3cz+9lon3Sa6CaqA4L4/MtHbopEc6prUt5rbXiAng5xLBrManmlBfLh3ryLC6wIrchTubm5m1OhiqkhgxVMBAWqKNvDNFYlsNBWjdMjhd1i3Acs8oAimZ82oz4L4/WgEgBKZzT0fkjhgoSmtSWEKtRozn9K5ThQYCfR94Uk1owY7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4Xawp/OUzZ7aCf0aFzpYMD9NlzuTaL6msuus2m+dNg=;
 b=mcLZ7TvB0nRKNQ8vvX2FokEKxbfe2P9yi0ZNseAox7SeOE9Ww5cMG2o4390mNysKTHjAMf5Pbfsd7j4kAOX6+J95QAlvXn89Nr2dENJi4+9onBkeQXJriVgfhlYKkNWqoJud1Mux1KtyAiOc8dm5MsSQoPxXBPvnrzwPRM5Fu6tTCa6pObRFj/3wlRVizs1q2Aq1f/nCP2GEqx22HqK220cO3z+X4cyDQpejb67L9vTQ5aCpAWMMB7GVNsX60szMO0qas9qEtQ0QNVIziRnZ3skIzx4d66V+TiPw1jROKpbieLG3lZg/gSWO8d9LQQKMdzPMoM+qUVqwuks21WoUYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4Xawp/OUzZ7aCf0aFzpYMD9NlzuTaL6msuus2m+dNg=;
 b=cDnBoiGZa4bF/SzdtCeA4UW5gQ5Vstu1GoQ4Q/QN+3IbwKNh+U4JXL5LdetEjqhDtAZuUyG98z+KD4MjXsgMpArSCdUKkLzkzOpwKLbmVn/Xw8OTAAmEC+zxjhdORZPmSYRag3EQm+uYT+F8oKFdhz6nzm5sxT9xLUPiiDIkR1A=
Received: from DU2PR04CA0008.eurprd04.prod.outlook.com (2603:10a6:10:3b::13)
 by DB9PR06MB7419.eurprd06.prod.outlook.com (2603:10a6:10:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 11:24:22 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:3b:cafe::22) by DU2PR04CA0008.outlook.office365.com
 (2603:10a6:10:3b::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Fri,
 14 Nov 2025 11:24:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 11:24:21 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 14 Nov 2025 12:24:21 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: jikos@kernel.org,
	bentiss@kernel.org,
	dianders@chromium.org,
	treapking@chromium.org,
	alex.vinarskis@gmail.com,
	dan.carpenter@linaro.org,
	superm1@kernel.org,
	guanwentao@uniontech.com,
	kl@kl.wtf,
	Qing-wu.Li@leica-geosystems.com.cn,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] HID: i2c-hid: Add API to wait for device reset completion
Date: Fri, 14 Nov 2025 11:24:18 +0000
Message-ID: <20251114112418.3275211-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 14 Nov 2025 11:24:21.0444 (UTC) FILETIME=[39342040:01DC5559]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|DB9PR06MB7419:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ddc0e4b-7dbd-41fc-15a0-08de23705c0a
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vh6vZP4KywCBJHiQB1fDdqxwtlOWVxuknJ4HG+SPHah2jflj0D9PJq8gYDYu?=
 =?us-ascii?Q?AuWqSzLr0PfLKOXqBznumlQOtO52bKYXgf9lW4w0xLyl6FMt5td78T7kdR/w?=
 =?us-ascii?Q?v0uhchLGaESMPjSbmUea2bJkTabq6LY5bPJQv/IFUYO7ad2BpJdTIF0ifkTq?=
 =?us-ascii?Q?EbYZ0vgyC6m7WnKefBmhOxnljG1rRZWvKsqEs/ya9ipKTlYDpeTV4cSe625W?=
 =?us-ascii?Q?Qmn2Su+yfx69UsGvrC84dH21fiXACRYwL3Gn2YX591I5vZBlNYeOy2CyCWK2?=
 =?us-ascii?Q?nuUHluJ5EwPFF3lfRzuAY4AfXTXJjM9IgNQctgzB02PLYQV2IH/JgYHQAQ+0?=
 =?us-ascii?Q?EZR8AAEboF96ZLQOOKrvqknX6JmnmG8sghg04IbjR6YXtV35ZuWOtUM8BR7i?=
 =?us-ascii?Q?hPLPfn63ZgJy3vgzXj9Dkoq4UeBcpg0ne7vDkjOV2SnXAu4DXoLlMzdKZmYY?=
 =?us-ascii?Q?edga1dm3qbmWdVO4t64sbbn9wqeu5SeBm5n+RxYIOHC+gcpBdo0Is45SDR5v?=
 =?us-ascii?Q?P0MEf+rsDlJRb1t/356CGvi+4DBEwMiubKkh2qNSg3niKLlxTQ4lTpZCGbgt?=
 =?us-ascii?Q?TNK6coavVeFePFylpxrviFZlUSP0xug3X3pA3C/3UqofQkKLuQXVBqmvryP7?=
 =?us-ascii?Q?0Dat3qiqWpoon6BbBIrKPrWAkoD01iBfX24/MFm1c/r5Sp0HLjRj8ZfdX9Ox?=
 =?us-ascii?Q?g6/C9AEOAh+CELHvFWSrFblAj+PcmUYz3pZCA3nm1BzKfCsSOJ/r1K4peeH/?=
 =?us-ascii?Q?blr1LpnXQma1peP2TtqkUj91RAc6VG83YdIT+N0le7GMG3drvKq/Q5GKxh1m?=
 =?us-ascii?Q?Za/XwOoQK6FpQp7leaQ4sWjdPKH7mtZHBzV1snFSrbEmIQW2kxUc4owqnmPR?=
 =?us-ascii?Q?tw7V7Ex72MkoDCvZba2gpU0bLi9XnbkYhnHmsEu84FJLqvtWG73pCsu3bWpp?=
 =?us-ascii?Q?Kl65gSEPMJFUg6RnaTHSr/vwUUyqLCQkTFCkR4lj9o+yIncbGVofUB9d9qDW?=
 =?us-ascii?Q?vW8it9dcy/DwuFZfRstJPoqaM/nn7MMdQmXqNh5I9tCHsmaZ2Ky1wi9cjkHi?=
 =?us-ascii?Q?KbgUzPua6iSH8tY+Ep7kRuhzsI9WA+mV2nHMJM2agiJuF04WyVIff2KAo4Ah?=
 =?us-ascii?Q?Iq1xlpYNjov7GYvWAKh36aVj788PW2V7SDtFq6DAsBxsqeGtnlrU+04FDXvh?=
 =?us-ascii?Q?EwjoPtFYgta11bu+VpVZhc2vhrtInFQ+P8Dsn7nFehf9Cf9ZXhgbCcl55bk3?=
 =?us-ascii?Q?i2Ym8ARudtYZ2HHb9TgLZuChIzM97frQFgpG/dzsqBYNho1/a1h+xCJMgvGz?=
 =?us-ascii?Q?6ueq1TB+Lz8YsXXoDMpYGH2Sn63QHKuRX5jOnzl8e9/mfeUxSVnI3Ud/Upsh?=
 =?us-ascii?Q?5ruyhpw21knQ5NKF3qSx0V1HNXH3C1/6Fn4NV1Zd6Whu1cyaW35wQhwxaYaV?=
 =?us-ascii?Q?cpgO5s3Em4mfbEtUT3gVeFSnVUWjRv8PIcrZ9UjxkmXNHk46HqsDDjkSUD9c?=
 =?us-ascii?Q?JcAcTZFJivcBEYLR9CxZ+YT0c6sGe47K3j8RCUKtzuS3EYJhNdZrWmI9Vh31?=
 =?us-ascii?Q?LRcYUaZttqsnZtniOQDedxHgWP8NSIK175cg86Cx?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 11:24:21.9202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ddc0e4b-7dbd-41fc-15a0-08de23705c0a
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7419

Some HID over I2C devices need to signal reset completion to the host
after firmware updates or device resets. Per the HID over I2C spec,
devices signal completion by sending an empty input report (0x0000).

Add i2c_hid_wait_reset_complete() to allow drivers to synchronize
with device reset operations. The function sets I2C_HID_RESET_PENDING
and waits for the device's completion signal.

Returns: 0 on success, -ETIMEDOUT on timeout, -ENODEV if invalid device.

Upstream-Status: Pending
Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 24 ++++++++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h      |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index d3912e3f2f13a..4feab2327e92d 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1365,6 +1365,30 @@ const struct dev_pm_ops i2c_hid_core_pm = {
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
+int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms)
+{
+	struct i2c_client *client;
+	struct i2c_hid *ihid;
+	long ret;
+
+	if (!dev)
+		return -ENODEV;
+
+	client = to_i2c_client(dev);
+	ihid = i2c_get_clientdata(client);
+	if (!ihid)
+		return -ENODEV;
+	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	ret = wait_event_timeout(ihid->wait,
+				 !test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
+				 msecs_to_jiffies(timeout_ms));
+	if (ret == 0) {
+		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	}
+	return ret ? 0 : -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(i2c_hid_wait_reset_complete);
+
 MODULE_DESCRIPTION("HID over I2C core driver");
 MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
index 2c7b66d5caa0f..1c6d959716858 100644
--- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -40,6 +40,7 @@ void i2c_hid_core_remove(struct i2c_client *client);
 
 void i2c_hid_core_shutdown(struct i2c_client *client);
 
+int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms);
 extern const struct dev_pm_ops i2c_hid_core_pm;
 
 #endif
-- 
2.43.0


