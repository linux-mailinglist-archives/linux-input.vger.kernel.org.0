Return-Path: <linux-input+bounces-10829-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A723A60D99
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 10:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 265C63BA17A
	for <lists+linux-input@lfdr.de>; Fri, 14 Mar 2025 09:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE0561F153A;
	Fri, 14 Mar 2025 09:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="Adu/Vqd0"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0A51F1508;
	Fri, 14 Mar 2025 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945355; cv=fail; b=JKYDs9QVBNxANY54kdk0T46J08Y3ZET40goE4zw1oDA4DpzGFxrmHKzR+2KLx2oovAj4iExtGTLq3s0+gVSgzCmpChZbAxnK+0UwGAi1VeWEK7n+f2d1rXwR1rTiIzoFKcp8kPzNlWlYAbVCvlgESD4VdVYNMVbXDLP0H5VQG8M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945355; c=relaxed/simple;
	bh=+4NvF9dh3JlTFzKI5JbZZm7OBNKWpLA9Stefkv1jZlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hpo+KTpjV8Ap+khH0fYkr10XROYhqFKqLuOZBbxIrST3PCqnoScdZ+uzoKp4NOTate+baGhrJ7n12LI70e4jbNZiXE57rmD6v5JAK5UUp0TrVWvJik6RyQ9uGiRRT4sUGXAbqT6SU1AcfRQS10qrtxpNg/wy1ROfi8W4WPZnVSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=Adu/Vqd0; arc=fail smtp.client-ip=40.107.212.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MYiz/37mFNYc+MJ7f7E0fIwixOEmeD6BSpy4xXqiu/6fT/tsRsIlfzxd68qXrhduLUNyd6utYaxbTrK8VZk+kvTS9Jw92imZaD3N8A3lumC1w8v2+0SEyi9dsvHMxQRhdpCFw8aKbnPD3Y2WgBVMVdoeYHBReoTK1M6oSKo56KtPnDYmEmoKVqJcqMLDQdcuq37ghIlD1F1K92SeYdbKMjY+UMqHoW/sKRiBxmlz8h+mCTVpgDxWTE1KWTZkh6yUU6oFQxxhznICIIGNTqL75DYMSw+z4qg5m9Qe5heMVZTOJT07V/ZFvb7h6sEURKlwjr68f48N0JOgFpmVg2/xsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuB9oAKyLs21Tr8Kt704Fur4JGYFdmKTwkfV3RqRV4A=;
 b=QWEdjM7PPq5wwC4cwV9aYcHcTwdssc5Lsqbj+eWsJzp3mKZ2XpU91m0dMBeILsZOOf2n8kyHV9mHijqW03wMbZIZiBoqbZPNSxs9Pucl18Pm+T5N/4s7xvae1El3/uoB1bvh6mH1BjtDZHv+p7fmTpux5I3qn8Lr9VZboLXP/t/DFSTAH6yBTTeo5n+LGbjlTf4LcA3mvis/D3iWsW774d5oK7Ssy8N7W8RQl6p/2YsXm1u748xMjWv+Wo6TteMVnl719RuYAiaZ77u3MuU1nolOQu8Eca4D1lyq1d3liZ1Nyf/W75gRcJMN/MyUSh5k/bC9/6RO6R5+ILdwbSNyOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuB9oAKyLs21Tr8Kt704Fur4JGYFdmKTwkfV3RqRV4A=;
 b=Adu/Vqd0BoiCEd8vtJZLG9iTQ2KTLQhDp1vBF5XI6vy2wZ4B5eMh3Uk1C8Eo0fJhW/StocJxCWmhdxtVVcTff1xeNpQ3/Xqj6s33AIHknI7Z2nVeSF5wD6gsk23uPGZyruBGtdemoBpbFdr8J9eXjLw0iMD5t9Xa/EGjWMc+1clkOU6H/iq41GjQlRIqmpMGT/0XJ1Igr19xU8+nHTN2/h5p/g84iHXMepVVQ9ZTQvtYUZFk0Nxdy/t6RRsVvcUBIgeluLtzvIZfM1q7b6Wr7CDSWx7eVEnJ+M/NZyuDjXNSixiCDBSoiYxBsKp5xnBqGdMBtue2geW9s9GNJEL8og==
Received: from DM6PR08CA0056.namprd08.prod.outlook.com (2603:10b6:5:1e0::30)
 by DS4PPF21B479845.namprd22.prod.outlook.com (2603:10b6:f:fc00::b0b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 09:42:31 +0000
Received: from CY4PEPF0000EE39.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::5) by DM6PR08CA0056.outlook.office365.com
 (2603:10b6:5:1e0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.25 via Frontend Transport; Fri,
 14 Mar 2025 09:42:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay2.compute.ge-healthcare.net;
Received: from atlrelay2.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000EE39.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 09:42:31 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id D2FD2CFB5E;
	Fri, 14 Mar 2025 11:42:28 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ian.ray@gehealthcare.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] Input: snvs_pwrkey - support power-off-time-sec
Date: Fri, 14 Mar 2025 11:42:13 +0200
Message-Id: <20250314094213.902-2-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314094213.902-1-ian.ray@gehealthcare.com>
References: <20250314094213.902-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE39:EE_|DS4PPF21B479845:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5a627876-53ce-4016-b9b2-08dd62dc8aaa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qyf40GBHskViWGZH6D7vxHyvJ/1Dyf7d8i3hBmb+CC5ouhIdi2hdoB3o1Mfx?=
 =?us-ascii?Q?lmkMUefrTfKhQGVd7e0brxDNuc8GE8cQDsAdTYYX6tbIPpHUW9H5Dnaph6EK?=
 =?us-ascii?Q?ADX37jdAUvPF/3jJ7IMX0D+wCI8jnDFzJzVlfMylTN60Wu95HRc6q9tSc/7j?=
 =?us-ascii?Q?cjnpGoV6NWO4Rt2vCqGDnFEcjcy3+754lUZROTv6ATDYWjYQvF6iwH4RFV3S?=
 =?us-ascii?Q?UWl28nN40DhOg6d7HYFWsqXJqTuslsY/j2ZwU1b22Dz80FlH7iHzy8oU3UK5?=
 =?us-ascii?Q?DmdwmV+rdnyfASZtNlgEZgRH+PTM06UkACwvuO7qELOrWOVheNwSAsZMx9ba?=
 =?us-ascii?Q?nFzdBBK3d9wtK0Hym5OKv4FYQi2f22TBadEPiZlUtp72pxMKH5rhVvVgoOY1?=
 =?us-ascii?Q?bbZo7M/FMekY8RD9WhZe+f2JkKUNMSBEIVVL2f4VRn9xl/eSN1IUrPNIKXfk?=
 =?us-ascii?Q?C9CtOUoqmZo/LfORL3X+DCo/1H76Qg5bRoCzLJ8P4qfTYWzZpueHfhzXqQOg?=
 =?us-ascii?Q?5g4R8XgTKjuIASyT+J7JA+l9wlLWR8ZNG+ipcu3jFB+r9NMVCzx1hqYFvFdj?=
 =?us-ascii?Q?kxtRg8OeYCcjtRcLSeE4/l87GOj7nPgqUT/TkzwqCb2kT0QKvx2ms8Vp6F/M?=
 =?us-ascii?Q?0XLtaf2/+mvNbIIE/UK6XuUUVqVXkIMdc6B4du8fsa4wOHEbz6yEhRR5GexW?=
 =?us-ascii?Q?6em3WaO/44wN8+o3t9DK1b2KaLZ6aoTaHglQP2KXybfp16kKb21Mpax0ZyC0?=
 =?us-ascii?Q?HkSMg5ME26Fyfkb2t9QIjyawAO2uZIEA6yVI6vOde7iFp38cS75aezzHk0rm?=
 =?us-ascii?Q?W71thmOg/8TOhp2RpBjfNoN1sv973doT2bWtCJJHolANr9fcbsDAZ4Qzym+H?=
 =?us-ascii?Q?JAhKye7MGfsmP2UhhzuzyR5WGphc97CttUJDcAsOR3nnEopPgkLiAjmC7+Gm?=
 =?us-ascii?Q?uV5jGGAJ9Mmm416xOtPFKJV2FaZj9Wq1QDbkwhqVT6ceCEdVqeCi3qGyGon4?=
 =?us-ascii?Q?pEhWzk0RiqYqlqpFaRvwHGrZL3wratuFQPHUT5Z8Ta/rcOT1V/OClTXP6Nho?=
 =?us-ascii?Q?DlbZIDZ9n8S5bScIT5LZpGeiPuoOJouVq+tAzrC0NykUvl/DVd/fTasUkCMM?=
 =?us-ascii?Q?D5EX2qw6jpqrjXT8ck7FiMaYHHlNNc6ssL8WrFTWf+eoLUhC/s+akauBLn7k?=
 =?us-ascii?Q?QyhsYX/rj9CIQsTcZIB4p/vdTZCsnzECYKW9hdeUuiTUIKdMX/cNAcLbT7q5?=
 =?us-ascii?Q?0YWhOW8YVfl6pV0YNuHtX5p73Qgs33IKw+3xELbb0GGc9Z8QRBUlvXSbRjmD?=
 =?us-ascii?Q?ylQfE3OzIJ0XqfC6Hy9/4DEff1xRA4g+QXmDnKUmwxsu6jmMAZ8UPBPAthWi?=
 =?us-ascii?Q?90zsksUd40021omcKDx6GKx1ZwFdw4PLvKJHvQhEuIebwVFuUaNpvcUsMLfY?=
 =?us-ascii?Q?2GgOoMbQGCO/Pjj+hi82QSL//BsUukKfho+/EI0cSuQK0q1blZra0QWfL/w1?=
 =?us-ascii?Q?iasD+HEhBbF4lTA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 09:42:31.1500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a627876-53ce-4016-b9b2-08dd62dc8aaa
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EE39.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF21B479845

The power-off time is configured in LPCR[17:16] BTN_PRESS_TIME:

 * b00:  5 seconds (SoC default)
 * b01: 10 seconds
 * b10: 15 seconds
 * b11: PMIC is not disabled

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 drivers/input/keyboard/snvs_pwrkey.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index f7b5f1e25c80..d7372ace694a 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -27,6 +27,8 @@
 #define SNVS_HPSR_BTN		BIT(6)
 #define SNVS_LPSR_SPO		BIT(18)
 #define SNVS_LPCR_DEP_EN	BIT(5)
+#define SNVS_LPCR_BPT_SHIFT	16
+#define SNVS_LPCR_BPT_MASK	(3 << SNVS_LPCR_BPT_SHIFT)
 
 #define DEBOUNCE_TIME		30
 #define REPEAT_INTERVAL		60
@@ -114,6 +116,8 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	struct device_node *np;
 	struct clk *clk;
 	int error;
+	unsigned int val;
+	unsigned int bpt;
 	u32 vid;
 
 	/* Get SNVS register Page */
@@ -148,6 +152,24 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return -EINVAL;
 
+	if (!of_property_read_u32(np, "power-off-time-sec", &val)) {
+		switch (val) {
+			case 0:
+				bpt = 0x3;
+				break;
+			case 5:
+			case 10:
+			case 15:
+				bpt = (val / 5) - 1;
+				break;
+			default:
+				dev_err(&pdev->dev, "power-off-time-sec %d out of range\n", val);
+				return -EINVAL;
+		}
+
+		regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_BPT_MASK, bpt << SNVS_LPCR_BPT_SHIFT);
+	}
+
 	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
 	pdata->minor_rev = vid & 0xff;
 
-- 
2.39.5


