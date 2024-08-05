Return-Path: <linux-input+bounces-5335-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1E3947764
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 10:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1031F21A4D
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 08:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB441494D7;
	Mon,  5 Aug 2024 08:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b="vGBn2w4b"
X-Original-To: linux-input@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11022127.outbound.protection.outlook.com [52.101.43.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830F13D882;
	Mon,  5 Aug 2024 08:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722847005; cv=fail; b=ShjbL/i6+Lvw7tC/i/ig3Us5+fAp+ocmr469HIt+i/FvI+UWMUOfiiM3lS9lNzwTrkunJQNXdFWicxQYl2o2vRjSBEcdJz998If0K+PCWY9TFJVCAvPDpZIk+uVRwdeuEVJ6YFFo6pbdREkKBnugtI4TtxUS+wPSIz2Df6YfxM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722847005; c=relaxed/simple;
	bh=/x5sSpbHyabmiUSq/9zRWOv5e7rEY0SzHJpO2p4AE8A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=eCGVmf4QIpHewCnI0GoNiMJ6DDhE089rfNtXvkql8kf9z2De6DE/5HEf94Oq0H8sSYTe/l/UgJShrtE1S0AYEsONDSE2zpShhxt5/ScGYIHuZcshOY3mpvR5XMQclDQCVPuTNF4CP6bqqc0j6/sRLZiztmWyFJHvr8BJ1fM0hj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com; spf=pass smtp.mailfrom=tw.synaptics.com; dkim=pass (1024-bit key) header.d=tw.synaptics.com header.i=@tw.synaptics.com header.b=vGBn2w4b; arc=fail smtp.client-ip=52.101.43.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tw.synaptics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tw.synaptics.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upYlTtCqsOxqfFlxrvsdp6caaY9fB7kTihRrWxu8Fxv4WLZKYfLKqK5V+B8lGCU7WN9q2MxKP3EvwBO98gZLaSvqwZE6exmkGmbIJkb0LtRT5pTZ+0jA57i3UWzUM2y6pyz2YDW7T2KE71ZuqGbeJP+3/Byr7PjN6HZWlJ6cpZOT0O8C41fwQVMjlf2hGK7Tc42wE7Xq84MU65YwqfgAXFtSVR/UHb5hhmJpTnSVe4/kHyQn0UI6np98Gs0qgYS4FYASqC7RVbGURUdxZ6ko+B157/fetM1BUwd/rfI/kwFnXErWPDXyqC9l6Nhfl8rh5qhHi9s765uggr7cqhhHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngds/rDSRumAgmfS8R32L8V3QTdD2dLnSJ6Yq5Iilf8=;
 b=q5CyOflRED/+b8psg08TnxZ8PQ9xvs6ftgO6UxVnMhNquVsA5+SUGCc4w2v6WVxtsltfG7rkaJPvaCdHlo/JdW6kgF0t2/eSsrjEyHaWf4r/xsgLiggFtxBjtj2peQnjAvaXwuFVMeXq6La5pDUuvqgiNsXg9VxQ0f/gEkGSRWLppWFou2Zg3fGhyaKIyF5CqxuXTJYWaT5DbrKQjCfYIRXu58Dpk9UiZ7dL/LMFIHntCdvkFTK3X9rvVHUGK+jKhIxS8wRfuvnFXUvWcK7DkPyvQvqorJqePI2IZHezu+4OAV5tnNzex2bnZiSSJHBAxuJlszIAZwU5J0wPB9gYXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.147.44.87) smtp.rcpttodomain=gmail.com smtp.mailfrom=tw.synaptics.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=tw.synaptics.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tw.synaptics.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngds/rDSRumAgmfS8R32L8V3QTdD2dLnSJ6Yq5Iilf8=;
 b=vGBn2w4bsQufnrYTcbyc6KxOLEXM7y+aL7Cz56df9cC7knq2NeM7L1SGVVdLqspr7/aSeWCWmRyKIw/bhM8FM8FtRZO6OadQNdpqYdSxjVyQOEP/KB+JF66M0JMKpzXQdocG6bFXcN/vZy8kWrrI+k+RmRN05szdV9sRgzPPWlM=
Received: from DM5PR08CA0048.namprd08.prod.outlook.com (2603:10b6:4:60::37) by
 PH7PR03MB7105.namprd03.prod.outlook.com (2603:10b6:510:2b8::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Mon, 5 Aug 2024 08:36:41 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:4:60:cafe::e9) by DM5PR08CA0048.outlook.office365.com
 (2603:10b6:4:60::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24 via Frontend
 Transport; Mon, 5 Aug 2024 08:36:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.147.44.87)
 smtp.mailfrom=tw.synaptics.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=tw.synaptics.com;
Received-SPF: Pass (protection.outlook.com: domain of tw.synaptics.com
 designates 192.147.44.87 as permitted sender)
 receiver=protection.outlook.com; client-ip=192.147.44.87;
 helo=sjc1uvd-bld04.synaptics.com; pr=C
Received: from sjc1uvd-bld04.synaptics.com (192.147.44.87) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server id 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 08:36:40 +0000
From: Marge Yang <marge.yang@tw.synaptics.com>
To: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vincent.huang@tw.synaptics.com,
	marge.yang@tw.synaptics.com
Cc: david.chiu@tw.synaptics.com,
	derek.cheng@tw.synaptics.com,
	sam.tsai@synaptics.com,
	Vincent Huang <Vincent.Huang@tw.synaptics.com>
Subject: [PATCH V2] Input: synaptics-rmi4 - Supports to query DPM value.
Date: Mon,  5 Aug 2024 08:36:36 +0000
Message-Id: <20240805083636.1381205-1-marge.yang@tw.synaptics.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|PH7PR03MB7105:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5fa1b471-cf47-416a-4c73-08dcb529bacd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jULVj4kjxTAnOnrnhx8Ua2Su0vE4OSOq3sj2xmeSAFGzO9EVI9/ROhRutwi9?=
 =?us-ascii?Q?E4pVZiLGlYu3/Uj0Zos97GI5et4xl4ylbUx7Mr70K9m0tqcI52OI5QU6nHjF?=
 =?us-ascii?Q?z/sILdDrPEptY17i+2OJHS+eNBNPTK27c5bcVEVDBKDqzKTc8C+70OqHC23n?=
 =?us-ascii?Q?nydF5Cfa86fkq8DkrBOdzejEf19SGC2X2wCiT1Um3S3vnUn6QXEjn0BDi1pI?=
 =?us-ascii?Q?1kjvUboCDj7jac7QeNbYKkeh9amMinKOvyXDRUviRONcfaIIVWt1Zrk60i/P?=
 =?us-ascii?Q?W9dW7th2vl8Te4U1QKqmE3017dIs3p61+txK+d2dhJDmX2D2rwG4PQw/h8J+?=
 =?us-ascii?Q?amSOOasXXf1IdRROGzUchwAr7GgGJRSM3gq459ULF+IMZYQMfpZmpkE4H4OA?=
 =?us-ascii?Q?t+Vqu56C5f0zxpGSP1kUNn59rV5eIbzwZKF052PMIKk7GmjAgtnoerZ1R5hL?=
 =?us-ascii?Q?njg07jg5l5YuryeCLcvnroPjKAnbeJhjgOEXmcXs79T/RJH4emuNM7R18QoQ?=
 =?us-ascii?Q?/Nqn3GnI3LC6koPT0qJKbGBRdcuCf2kRRw4U4ZGyW/QLov5Wjv58r2LUwyBT?=
 =?us-ascii?Q?LE6gyLBQ8BzhjAnL3zzz5PeLKiD6V1w1LQCc3KT3O85LXB99H5J2x+QHNwSm?=
 =?us-ascii?Q?sOoQtwjXMDmj0cDQQ6vwlQ//jnJgRpI0L8SJH1V0nqM5vdyG0CUZd/u6GOLc?=
 =?us-ascii?Q?fQZAEIwkQgTmxF9bjfMGrnVg0O/eoIR2X9xcynFAQbndBLYQLHFyZ7HxhdKk?=
 =?us-ascii?Q?BWeXNW6bJfra9xKcoh5FGVHUUpFnCev7fbArNz5ISeh+8kQ7a7v9Bnv5j4/V?=
 =?us-ascii?Q?IJu3pomn1tIQthMxeW9YRZobSPjQ9CFx32Dno2P78GmZ2TfezlqRsfzUOK3e?=
 =?us-ascii?Q?1e677klMrHvxEWegzJZ8B1lUp+CkXC5S5muAU8Yo/fomwlKHYZ+hPcNsCeFa?=
 =?us-ascii?Q?OM9n5ZJn9PE6OYcfbMTlJxfTNpu6F2QltIjdzm/+oVBTWuMdm+obH7j4AEmc?=
 =?us-ascii?Q?XbHyJxq3Vhh/tOaL1NfJ2//XXcjQjzaMxGiCpkUbDx9upNIrIv4oJQSYzrZ7?=
 =?us-ascii?Q?jkpyhrMORVTKZQmOA7QpNb5k2y/aoU0yoxtIj6SlbUfhWWY3wNtinodSSjHz?=
 =?us-ascii?Q?Q9Gu4pjuem74R+pvL8IaXUv/8s4kSVbyX4Go5fZ0Md+50hdbiEXqgWHVd9V6?=
 =?us-ascii?Q?UfePEl6gzkx6lLxuIbe00cHBqhsWY+BS1iGT6H2rRB8GMqyqcVT4yikqB4nb?=
 =?us-ascii?Q?ANkT2Yz6oKEGvfQUQJXTiv2x+nM8ZsNmF/svNloRLOucSpukidMbvnRxh0YX?=
 =?us-ascii?Q?r3qwa39JvyRqX7sYhRG+L8HJnQAYR8yivCDKV2KrggcXko0NzaaqtVfGRTxl?=
 =?us-ascii?Q?HMEIe7iBbwrR7ydf6ErQ6KPpf9GkWeYPgs4bP75TPLxTfrduWzWOQtEXWnvc?=
 =?us-ascii?Q?qoqrCJtU2iBWi8LyVGaHBiM1fZuJB3Lx?=
X-Forefront-Antispam-Report:
	CIP:192.147.44.87;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:sjc1uvd-bld04.synaptics.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: tw.synaptics.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 08:36:40.4102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fa1b471-cf47-416a-4c73-08dcb529bacd
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=335d1fbc-2124-4173-9863-17e7051a2a0e;Ip=[192.147.44.87];Helo=[sjc1uvd-bld04.synaptics.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7105

Newer firmware allows to query touchpad resolution
information by reading from resolution register.
Presence of resolution register is signalled via bit
29 of the "register presence" register.
On devices that lack this resolution register
we fall back to using pitch and number of receivers
data to calculate size of the sensor.

RMI4 F12 will support to query DPM value on Touchpad.
When TP firmware doesn't support to report logical and
physical value within the Touchpad's HID report.
We can directly query the DPM value through RMI.

Signed-off-by: Marge Yang <marge.yang@tw.synaptics.com>
Signed-off-by: Vincent Huang <Vincent.Huang@tw.synaptics.com>
---
 drivers/input/rmi4/rmi_f12.c | 41 +++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/drivers/input/rmi4/rmi_f12.c b/drivers/input/rmi4/rmi_f12.c
index 7e97944f7616..b8dfb9ffdbf5 100644
--- a/drivers/input/rmi4/rmi_f12.c
+++ b/drivers/input/rmi4/rmi_f12.c
@@ -24,6 +24,7 @@ enum rmi_f12_object_type {
 };
 
 #define F12_DATA1_BYTES_PER_OBJ			8
+#define RMI_F12_QUERY_RESOLUTION		29
 
 struct f12_data {
 	struct rmi_2d_sensor sensor;
@@ -73,6 +74,8 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
 	int pitch_y = 0;
 	int rx_receivers = 0;
 	int tx_receivers = 0;
+	u16 query_dpm_addr = 0;
+	int dpm_resolution = 0;
 
 	item = rmi_get_register_desc_item(&f12->control_reg_desc, 8);
 	if (!item) {
@@ -122,18 +125,36 @@ static int rmi_f12_read_sensor_tuning(struct f12_data *f12)
 		offset += 4;
 	}
 
-	if (rmi_register_desc_has_subpacket(item, 3)) {
-		rx_receivers = buf[offset];
-		tx_receivers = buf[offset + 1];
-		offset += 2;
-	}
+	/* Use the Query DPM feature when the query register exists for resolution. */
+	item = rmi_get_register_desc_item(&f12->query_reg_desc, RMI_F12_QUERY_RESOLUTION);
+	if (item) {
+		offset = rmi_register_desc_calc_reg_offset(&f12->query_reg_desc,
+			RMI_F12_QUERY_RESOLUTION);
+		query_dpm_addr = fn->fd.query_base_addr	+ offset;
+		ret = rmi_read(fn->rmi_dev, query_dpm_addr, buf);
+		if (ret < 0) {
+			dev_err(&fn->dev, "Failed to read DPM value: %d\n", ret);
+			return -ENODEV;
+		}
+		dpm_resolution = buf[0];
+
+		sensor->x_mm = sensor->max_x / dpm_resolution;
+		sensor->y_mm = sensor->max_y / dpm_resolution;
+	} else {
+		if (rmi_register_desc_has_subpacket(item, 3)) {
+			rx_receivers = buf[offset];
+			tx_receivers = buf[offset + 1];
+			offset += 2;
+		}
 
-	/* Skip over sensor flags */
-	if (rmi_register_desc_has_subpacket(item, 4))
-		offset += 1;
+		/* Skip over sensor flags */
+		if (rmi_register_desc_has_subpacket(item, 4))
+			offset += 1;
+
+		sensor->x_mm = (pitch_x * rx_receivers) >> 12;
+		sensor->y_mm = (pitch_y * tx_receivers) >> 12;
+	}
 
-	sensor->x_mm = (pitch_x * rx_receivers) >> 12;
-	sensor->y_mm = (pitch_y * tx_receivers) >> 12;
 
 	rmi_dbg(RMI_DEBUG_FN, &fn->dev, "%s: x_mm: %d y_mm: %d\n", __func__,
 		sensor->x_mm, sensor->y_mm);
-- 
2.25.1


