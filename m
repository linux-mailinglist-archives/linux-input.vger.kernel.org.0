Return-Path: <linux-input+bounces-16144-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BE7C62DA1
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 09:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 013A44E2A8D
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 08:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BE530FF1E;
	Mon, 17 Nov 2025 08:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="QjeCMzCG"
X-Original-To: linux-input@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5595421E091;
	Mon, 17 Nov 2025 08:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763367056; cv=fail; b=Pr6zvaoaTLgKOZsMY9FldhXFD57km8ELLDJdgwX3Z9hBO+9FtWgGmUGSxcj/yHTz7wHAo3u1cadszuZOQEb05HOhhkNmD89U6uenn10mWb4zHN6k1+7RQRAq1PM9Zd8TP7rRs3I19qbsco2gMwG3wAH2bYbDe6Difrxo/p7mPxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763367056; c=relaxed/simple;
	bh=u/DDgtaOQBgkD+9s6NNeWpLW3g/4I24OgvyBu7px/cY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UtW7TiI0madN+U9y+eaanKVT64bLkp+F6+vBHzrox8XzgSCSoYX913D2AJQ4r/J9o1gk6z+sK0MrWLmhejPvydVyNuZ/Y3SsNwg0KY55honwitzkmUPaVz2hVBLy9AW3V+iJeJfXOm6fNvjE1fmQxrVmOQcgPbAlTHA7pqVFSlE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=QjeCMzCG; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYP/Bt/aAtf6fkKt/rPxgz2zDA/GRYBv4Y9ff5eB0katUI5HtwyIu3Ugx18ntl3rV+n2L5vrryyHfc8cUHjGf+xS11vIRtJjVIuzwH40TLI5R8FZcR0yT5gcmU2KVZC+UV6W2n3NzdjCalpBAwMe4wpb1Zetmpz29NA0iYP7x7CR4ivNMmRaaKD4xfQA5MCAkQMGm6UfmkVXlZk5tbef/1U8BJIdqvaK3DA0es41HBeuXk6ZKKO6MYNhK8zndtY278cnlztEWog/HmMsGkZ5mwWzNgjGs//H/nJRyUmtkxxcYoPGCuuzP0LFzZ1mJceFuZQE5r1fdleDAawOkckFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGOzXMu3ymFva3CyQURsF3ECTWkTs4ozUzpKlXOGSUY=;
 b=KbC5eXK9u6uepWtNN3poqe+TEaoygZU7t3oI8Pw1tS59qK5cmhMCIPXyxGg0DNc8LtK8oP4qnmqztxgsz9u2U6MN2VXMNLk91Ss9XWry0RCPpWvMECYkC3wsroS0gcZZg/tJ92aQatxRw8VI0tPqyYvGf2T0zKwSIzCKAgnrk4RIQ50Kd7oyNaLLIE4CU3j52eb/jntf+5j3SG0+REf1W9WWjlxRaP9yNV9ydXjQfLl71855JekQauxwJDrFNbxA6IQXQb1wM1Vk0CpD5VEsjNcogolEFB7FIWiefli5szap8GmTWQfAyFVPfPiuTpi6hNSqkdC/V4I+pgHzyNK6kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YGOzXMu3ymFva3CyQURsF3ECTWkTs4ozUzpKlXOGSUY=;
 b=QjeCMzCGpAgmm3D10lM/5AlHtIvW/zEtPuqA1h4NKWL2bbAfhyNRplO3Tao9C8tYdkB/rxIlb4QITmaPsPUmNYf+ZwRWFZg7xkwnRSkMuTDid38mUU+Ou+5Ys07iKnreovLXxQ7BoRqNHax1dRZIB6X/2k0W/4MUW+sc/SKUdM8=
Received: from DUZP191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::13)
 by DB9PR06MB8073.eurprd06.prod.outlook.com (2603:10a6:10:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 08:10:50 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::9f) by DUZP191CA0059.outlook.office365.com
 (2603:10a6:10:4fa::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 08:10:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 08:10:49 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 17 Nov 2025 09:10:48 +0100
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
Cc: liqind@163.com
Subject: [PATCH V3 1/1] HID: i2c-hid: Add API to wait for device reset completion
Date: Mon, 17 Nov 2025 08:10:46 +0000
Message-ID: <20251117081046.3140656-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117081046.3140656-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251117081046.3140656-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Nov 2025 08:10:48.0610 (UTC) FILETIME=[AEA78820:01DC5799]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|DB9PR06MB8073:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6de3497e-5da0-4933-59d1-08de25b0d1ee
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vsTvJ4Jsw04/V7rLkz4fYT6RKQ93Wi+KtubIZYn6j7jkd2OUAzJvcIqNoWdc?=
 =?us-ascii?Q?vyvH1DyC0vLAkjTUXWcYVVDioOr+btET3RoPEAKBL36buyuHS6NN715HMGcB?=
 =?us-ascii?Q?ocT0XhMCW+zsp3Xlh9fkMgXMa/b7aun9E/ree56gvG+0axgSgRZg8fdLFZOH?=
 =?us-ascii?Q?pUYT9kg5RT4xqUee/YUjYatEc31SoiPu06VJkV7hLRUbWz1qGlUJ99waM7EY?=
 =?us-ascii?Q?GmX2fMDFF/drFaeqzcefNOV5z2eKpYIX4OrvssK3kYufHKEkY7hdbuelPbEe?=
 =?us-ascii?Q?8tTFBTYCqHzr2hLaOuqD4Xqh5cUsAKC3mts4jxVk4j8IPVJsXCTea99mGnSk?=
 =?us-ascii?Q?O+wCvZoHvC3UhJaKLNUYq37u9Ra42qbx9YoSKC6dU7PP8mXKrB6xSJ2P1Hoc?=
 =?us-ascii?Q?UFEvBj/HykzWiD/wjpbALdKWmws+Q5xUkoMlMGiTDTSmkdCi4lZqaWugtfQB?=
 =?us-ascii?Q?NN5dgeMWz8mYUB+ts4tgAtkUNoSlQ/Zl6Y/wD4lFsguwF8q1lCKmKDSAnxcL?=
 =?us-ascii?Q?Gmr42PToqT8JTm4MyQyP4RH8bufospUltbWxXXVbQQeq0yS14Dn2kpUwD2GS?=
 =?us-ascii?Q?IOdh76n4a2vdRkBy6A/ORFmznzC45+hZpjQOQQMmKPA75cq8gE4s6DRsmB42?=
 =?us-ascii?Q?wJoD3QnBF8bNWhtAkxRkTEYhv4TTB8licVWONFL7Svu6lcV6frJadI1txfnb?=
 =?us-ascii?Q?s6dBFeamRQiaD0pz1x7zgB+duttmNMUQ0c46KY6Zici6rOm0kpsqGf+FMthn?=
 =?us-ascii?Q?uLAgAVzc+wznKq7Rx2RP599iwCpkoDQIX9/1sC49P4qrRXaOZaVe+ZIqFgwu?=
 =?us-ascii?Q?852013DurdijDZGEWoln2DLWxxsqzyWVqqi8IcuZCFtFJg93Qx8D9JuzzE+1?=
 =?us-ascii?Q?E9dQ/J787whOzrZZHx0aG2oftY8g8nfjmJRhXj7pb00w0YmehcpvBM25nsHt?=
 =?us-ascii?Q?PDUHZ7omxaVDHSvSGxcPeFhvPsRi1oj3OlpGm45j6n/MRtpENHeiWmNRrQxY?=
 =?us-ascii?Q?+N+InZOPnPVOLEm9mk1i+P1P3wLTJZ4UkzTIFTBAU9e6shuhLv3hFXsCcWqE?=
 =?us-ascii?Q?CFZedJc3GS0WQdLZBRnhwgPXqE3spDM6Yg2K11/uKENvVQxUbLDH+c7xObpJ?=
 =?us-ascii?Q?8KeDmSnK5JoAiTQGcv2GJSTag2r3tQRJdrCQQZOnGA6ltKFVVDC3nbWHVUvw?=
 =?us-ascii?Q?IOpvFiBtMnKFGV/J4u/U1AHZr/FyR3ffI4s9ZIbnMbQsSHsB//567Fra1d6l?=
 =?us-ascii?Q?U3/LlE89OqQ/g0UjMdGe75H8vhvDTwlL3WSlbqkhB2TETCLw9/m07amTE+MO?=
 =?us-ascii?Q?wfP9VhccJnmJEIzAVFufySxi14k/NDa6hW6Ff1siDTKi9dgIrB6BC/QpCJYs?=
 =?us-ascii?Q?NTmdZe01mkpKxHU8eYrWfogY5/sLVlHCM2vHL7luoSE0z+td6JWCX0NdDcBs?=
 =?us-ascii?Q?AUSE3rP0O11HJ0kdR6TfHGkG6YclZXYmjc+CxGe7qCuf4I8n88AnvCc6waUM?=
 =?us-ascii?Q?G3ckQuG6A8hjIMZCXyPBm4Z0RNz0zcagArZO3hW1r5gDphUCGAxFlZ1aD9VD?=
 =?us-ascii?Q?KLOHP1u26P/rCyhW0WbFDql0NKF8za/lvcZ9315y?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 08:10:49.8226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de3497e-5da0-4933-59d1-08de25b0d1ee
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8073

Some HID over I2C devices need to signal reset completion to the host
after firmware updates or device resets. Per the HID over I2C spec,
devices signal completion by sending an empty input report (0x0000).

Add i2c_hid_wait_reset_complete() to allow drivers to synchronize
with device reset operations. The function sets I2C_HID_RESET_PENDING
and waits for the device's completion signal.

Returns: 0 on success, -ETIMEDOUT on timeout.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 27 +++++++++++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h      |  1 +
 2 files changed, 28 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 63f46a2e5788..067ad0770dd9 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1401,6 +1401,33 @@ const struct dev_pm_ops i2c_hid_core_pm = {
 };
 EXPORT_SYMBOL_GPL(i2c_hid_core_pm);
 
+int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms)
+{
+	struct i2c_client *client;
+	struct i2c_hid *ihid;
+
+	if (!dev)
+		return -ENODEV;
+
+	client = to_i2c_client(dev);
+	if (!client)
+		return -ENODEV;
+
+	ihid = i2c_get_clientdata(client);
+	if (!ihid)
+		return -ENODEV;
+
+	set_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	if (wait_event_timeout(ihid->wait,
+			       !test_bit(I2C_HID_RESET_PENDING, &ihid->flags),
+			       msecs_to_jiffies(timeout_ms)))
+		return 0;
+
+	clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+	return -ETIMEDOUT;
+}
+EXPORT_SYMBOL_GPL(i2c_hid_wait_reset_complete);
+
 MODULE_DESCRIPTION("HID over I2C core driver");
 MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/hid/i2c-hid/i2c-hid.h b/drivers/hid/i2c-hid/i2c-hid.h
index 1724a435c783..8e5482baa679 100644
--- a/drivers/hid/i2c-hid/i2c-hid.h
+++ b/drivers/hid/i2c-hid/i2c-hid.h
@@ -42,6 +42,7 @@ void i2c_hid_core_remove(struct i2c_client *client);
 
 void i2c_hid_core_shutdown(struct i2c_client *client);
 
+int i2c_hid_wait_reset_complete(struct device *dev, unsigned long timeout_ms);
 extern const struct dev_pm_ops i2c_hid_core_pm;
 
 #endif
-- 
2.43.0


