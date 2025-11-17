Return-Path: <linux-input+bounces-16137-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 554EBC62221
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 03:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56A704E739D
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 02:42:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C5025B305;
	Mon, 17 Nov 2025 02:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="uu9wJNft"
X-Original-To: linux-input@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013019.outbound.protection.outlook.com [40.107.162.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CB248F62;
	Mon, 17 Nov 2025 02:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763347210; cv=fail; b=DxfPii8tCZo08FN8S87tHaDVP9m1gZ8bXb5ICI22X6PipvWv8FPkxqXq0/XcHPK6OH3NsSXVMck6H7dTqOTNNO4IIt8AGkoWl2GV1p0kJxdcbDRA0641+KNgp5Ti9b9D6nIDqalOp5wXBFPB6Q7hTsn3W+4HuPiEI8JDI/V4km4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763347210; c=relaxed/simple;
	bh=qdsvVFCqvDnCqYUbU8oh/xCQB0PG7eNRux1xuojk8KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NidJU+k8DNBoLb0M7DCBjkLZAMVN+/C12t0eQ62QdZNZ/rqS1tmptTZsLFWdndS3IASdXQSeBOoNy/KdDDcQc4/SvzHdZe65Mg5jqFIaUZxagWSThl/eC5ekmpzBzruJkTib3v5MnHqkbbBKObmAj45d4w3epYyP2FUu30TWSI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=uu9wJNft; arc=fail smtp.client-ip=40.107.162.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bB+5cXZLwnrMGDi/ZL6YrgNYbrEqf0m7ZF+wK6oh4n0SHDvJ8XTC6NSOHHaBdgFrXBkgXBGQBcrje5yw7EeyA8j1NqxkONpIfLt8dBpK5HzFYETw+Qn0xma7L3wGv7PdgylG7jmGQ2bP6AisEHuhsSVuCyIwShQFrhb3PTlVXf0HqCkAXROfAzrdqeh3juclXPGb8nBqoYzmi5gQIYBSMCq0vuR/CW5nsFY7HkmGXHLmuEklGJwEARboCMufZ00UFZTCWCscOHdbHXchS7qNsi3zVtwBVjBV5QYNUbIdLetvKZQXSEVqst0U+YjvJQrLhi4hmX0ojDGwsqMrXXCWFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8YU2YaWQ+Ujv4tFQrt0bJ9HA5m0uIiKeBYHhgF7YDU=;
 b=YInru1aIbSB7zGB4woWHoAZHTNAA7MERcEeS3g/frjnwGN+gZNzNCwP20cTymiReAw3kNJJVbEU1LOaO4dHg46ibFD3ZWsNkuP76HHrdWphuGHLBOof8IvNBGGNvpqZ6UoTVa9o89BCmb5RZpm5vo5EzUxhQynbCBv0mxvd4kgKScr5amKoYtCBGpCgw9eCUVkxk+wcoLd2tulCy1Ixrx4pcFXOiruGWAwjsoMPfzzsYfGZPIMiRtWRPgjypJrks+jE79spBHYy2V/JYfYMhgn7ZGyONNitiADNzUWZXQS4WWipOCMvYenQtTQAClCXGe1g04ENN6xdCUX+AzznrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8YU2YaWQ+Ujv4tFQrt0bJ9HA5m0uIiKeBYHhgF7YDU=;
 b=uu9wJNftJrYBg6Sk2SQuLOECxPVzm5TeZK/MVoo0auzhKPAch3Y0ieV0RACyD139DL3ByqEU1UdAv/AouGOaHyeuJ4eXIsQKauk9QtqKu39waWYGAUW0FK7Hy5rimaMgI3SDSpxdy9sMIX4sSK+7EkrTkfSFSchjGuqhrBiQiQs=
Received: from CWLP123CA0195.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19c::23)
 by AS5PR06MB10651.eurprd06.prod.outlook.com (2603:10a6:20b:756::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 02:40:03 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:400:19c:cafe::48) by CWLP123CA0195.outlook.office365.com
 (2603:10a6:400:19c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 02:39:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 02:40:03 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 17 Nov 2025 03:40:01 +0100
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
Subject: [PATCH V2 1/1] HID: i2c-hid: Add API to wait for device reset completion
Date: Mon, 17 Nov 2025 02:39:59 +0000
Message-ID: <20251117023959.594514-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117023959.594514-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251117023959.594514-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Nov 2025 02:40:01.0661 (UTC) FILETIME=[78F372D0:01DC576B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A9:EE_|AS5PR06MB10651:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9625d527-06c1-4cfd-2614-08de25829c92
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+bfXdDLm6W801rWUeA+rJNn5BDCQvwQQL5D0cwQVVS19fBMa/BwSc2znnkI7?=
 =?us-ascii?Q?CFCLWzqVdWWpbuHnaHPUktt2ZmSekxq3UKXM7Ro9lZGxlc81e9eoRBJI9vNJ?=
 =?us-ascii?Q?kkh7bIjJXm9A+wQi3b+PMbgE2+wZT7Z1+OYpHGLodOvastRAb5HD25CNU4lm?=
 =?us-ascii?Q?TvemgICcDKwBspgZE/0pFyht0/atyrnBx0KwTWFthIhrEa97gxHeTxTmp60P?=
 =?us-ascii?Q?wsPLYRJjFJE9G/2THxr9jIJ8t1o7pfqwyDoPadepjMutfj994Gl8sdTJtqBk?=
 =?us-ascii?Q?1KrMY3LIAH8iSg3O2MNmRxpLX0ceHxsOah5XZRR3iPP+PSUBbg3Uz1UP9W/9?=
 =?us-ascii?Q?ydPhPW/VdREeUL4ECndJGFLRrZGsHzLeNuJMxMDmUCwXFdNTBYCzjyY/oLFe?=
 =?us-ascii?Q?2xLB3pNOStoMNu3sXO53clzsDBHGM8K1pg8B2P0OGSBpwCYxynfN1laT2wYW?=
 =?us-ascii?Q?6NL0QeJZ7eU5XQq71TNyqCZZeIDx6OLOgXDbz9xeC/CqVZfoxzW+zk610M+7?=
 =?us-ascii?Q?tDEWlB2OqNYpDKaGMU75VYrX9f99/qM3t/OzxFbxP2PkyF/MePdUDxKcKMjp?=
 =?us-ascii?Q?04FQeffMTLSvboscINIh7OYE1Ov0EL3RUN9dro36lDsHeN7Gp/lXG/+wtmsn?=
 =?us-ascii?Q?gWFQn+Xn4LpivqOBPlQLDZqu/rnVavMx8WW6+i9IPn5yO5MdCn72gw47CBrm?=
 =?us-ascii?Q?BYhaDVDOqfJrXNKWporzJU3SR8+zYgXTE5qKT6K22iSM7ajfrIh6ii805C2K?=
 =?us-ascii?Q?Nj6326NCr34csH1L+UeWKxrErzG3yBIxLCUaTCL4mfNXJ1UvJufzRtrxsnOd?=
 =?us-ascii?Q?qgVccsKBS/Kr0ei95e6PUb6S1iZlu2hzoK8bsrZOuPViDGOu0dXkG5JbAoGa?=
 =?us-ascii?Q?g7ISwqztF40oSmaHg4sB15JZMl1VV92qwcF2zZ5uYqLp/vbul935FrNzypAq?=
 =?us-ascii?Q?niAfOYKeWsT89goCbyyolX2YGk660D5JBsrt+mYhSGmzO1LRohKx1+pM6I+c?=
 =?us-ascii?Q?hhojLk5ClRCKB0KcavKHe7enFOcDJnft3pGZRFt52QyPUJjh6eKMvaSrPG3x?=
 =?us-ascii?Q?3JSG51uKzidDPptnsea9uHjbq1Di5jePZ3myJD6EcjJBFMKBCutel7L49g4c?=
 =?us-ascii?Q?u3Jkz3OGk2H/ZbT0Ran6kLcS/zmjpt0tzWUQCmuCotyEvXQusjxQA9V2XF/u?=
 =?us-ascii?Q?lO7bo8KYbtBWTLLYeeW0zgEaWJfctBb1jeMhCJUEzhVRGON0Wnkt5W8pOJx4?=
 =?us-ascii?Q?uxNgKh9xCiXSMnuOOAVMRKArkoEL7ZT7N8wwenop5s6Vn5tJVvk45UYqLU+o?=
 =?us-ascii?Q?wNoMw/Q9/PDME7Kp1x1u0wnxPaNhvGx8iMBPmVdCsmmORDniOkxfWHtwmM1w?=
 =?us-ascii?Q?XsYR7oNysmwWYjOhx7/y7xWScSUcYh+J6JngP0I5gc5lUiCIRjM3cbeRkZTR?=
 =?us-ascii?Q?DlOzYLT7ufu+nj9abrqtvyoQzKktI0a1gul/wx7DzSQ3n68V3Y/nHhlJr5Fp?=
 =?us-ascii?Q?ygDN+WCzCiVfAtEed28PxJ2C39/V3fBaqNiDYveH6hKmXR7fLyAi44uMVGYl?=
 =?us-ascii?Q?Iud+nBhp+MyuCRU02DyBuEzouH239/d1AeL6dS9m?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 02:40:03.5026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9625d527-06c1-4cfd-2614-08de25829c92
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR06MB10651

Some HID over I2C devices need to signal reset completion to the host
after firmware updates or device resets. Per the HID over I2C spec,
devices signal completion by sending an empty input report (0x0000).

Add i2c_hid_wait_reset_complete() to allow drivers to synchronize
with device reset operations. The function sets I2C_HID_RESET_PENDING
and waits for the device's completion signal.

Returns: 0 on success, -ETIMEDOUT on timeout.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/hid/i2c-hid/i2c-hid-core.c | 28 ++++++++++++++++++++++++++++
 drivers/hid/i2c-hid/i2c-hid.h      |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index 63f46a2e5788..906249c94395 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -1401,6 +1401,34 @@ const struct dev_pm_ops i2c_hid_core_pm = {
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
+	if (client == NULL)
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
+	else
+		clear_bit(I2C_HID_RESET_PENDING, &ihid->flags);
+
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


