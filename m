Return-Path: <linux-input+bounces-10855-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F69A62A42
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 10:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 593D67A8306
	for <lists+linux-input@lfdr.de>; Sat, 15 Mar 2025 09:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98FE1F8BA6;
	Sat, 15 Mar 2025 09:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="pG/EKzUe"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE391F8734;
	Sat, 15 Mar 2025 09:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742031306; cv=fail; b=WHtxqkQT83l6cEyonCDgLWIVozZuNw7pJgREradPtz12fh1NvjmSv8Bs6cDwd1tc2GJHRYTS3zUzc15FkWN/mrWMXptZImhVMtzVcwZnzCslDK2eU7b1gPzwwricTPPtMkynh3KTgSwltJQ8Z5kZ41vzkukLbxvrFSPNyyCh1I4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742031306; c=relaxed/simple;
	bh=+4NvF9dh3JlTFzKI5JbZZm7OBNKWpLA9Stefkv1jZlU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEG14sPVZoJmIIYQR8Y0AX5bNDlsMlUTv163tq4Gz7Zvk7+bX3hVOV2yZvRvrYC6stICbIBRgG4eDB3v9jy8ekX2T4BdIhu34yoYpZ8y5kVzNDW8CfJZDZvhqGX9SJpQRn5Wb2l2E+i2IbHvOlxhEqbDcGHX6aINbn+OyB72dqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=pG/EKzUe; arc=fail smtp.client-ip=40.107.220.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SaxzFrSlZlvDxM2neSC5/CcNL+Ty2/z148z4XG98ZM1Ad+p1frt24DS0Jp2OZa+LDJ0I42dAftFEP+DmwmBecV+q+fuO815tgJOGZyzxE5wGXzp1IloY+kMhnLjd/77pGx9z6tCifHcA85i0DqEySGU7n7ZvETg0MutG4aLqnU+m4Jjl9+xqtl0Ryp0UQOpL2/H5GS3XWuJb4HXf2UDpSCjXeFDg47u8py0c2Oh7B5uoUK4RUukwj6EPMI8oedmcyHmBwzXJXvvSzZ6xmS7nao24U1vn10vuMNMWap0IxBjUDAL5AZq699i+GwouIxghTxdeG/If6AAjfpaZ1dBE7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuB9oAKyLs21Tr8Kt704Fur4JGYFdmKTwkfV3RqRV4A=;
 b=rHlWth725V461YDT+g8xXLFQ8kQn4CH262QJH7WJQGE2Cdls4XIfivwQzcgNhKtyockEsTnPcpsF2XUkMVYgpzRMOC7rjN7/NHtTZeKI4XqRWHYh7E5xgBlwAZRRYK6XnqnXVSfY+Rg9ftfhJlW1deQpQSC9Zw8nuZsUy2Tw4WVYMUWguRp1/I+4pA+/X2Iy8z8BSQnx1tynFq4Te6hCuR/00WeFLtJILw/Gmu5Auu88AMFE4JdRDHD8P5BAwvsoFIM8SckglbrZS2zc0FmLWDdjjr4j17xes9XJ8bL9xtVZOaE3hxqDDXotDQMDlz6SqOU96l3heGOR6wNZhOb7gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuB9oAKyLs21Tr8Kt704Fur4JGYFdmKTwkfV3RqRV4A=;
 b=pG/EKzUe6wBe39WHSCPoEHUSUFOcNdTrSAVQ7ILHAyxL9F2NVky9hQHG7nCtjKOmQTgHsJBhXR/pdZBZVa2u9LZOetikxneelwfodrZaJYdAvUqDzWL4ka7b5o3hRh+phz8LfWWKr1S9UWU5EHoxymi7AxA1k9xAbiQ2UO0QbdTueocoXfLQd8s6XOSZyfN1R1m06lZmrf+sGGazXVtj2QRoN6Qy34GF9gF9Jj8symRW5fEm34zbLhIW/u9i/TaZv4jsMrk4VZ97BhjPz7Y5L+gg91XRe146vAr7J9+/7khHmE+RwZHml+tV0Iyg+8V6fcDA14N56XIELz58OmlbhA==
Received: from BY5PR17CA0004.namprd17.prod.outlook.com (2603:10b6:a03:1b8::17)
 by BL1PPFAA7FD2635.namprd22.prod.outlook.com (2603:10b6:20f:fc04::f43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Sat, 15 Mar
 2025 09:35:01 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::9e) by BY5PR17CA0004.outlook.office365.com
 (2603:10b6:a03:1b8::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.28 via Frontend Transport; Sat,
 15 Mar 2025 09:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Sat, 15 Mar 2025 09:35:01 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 1A856CFB75;
	Sat, 15 Mar 2025 11:34:57 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ian.ray@gehealthcare.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] Input: snvs_pwrkey - support power-off-time-sec
Date: Sat, 15 Mar 2025 11:34:55 +0200
Message-Id: <20250315093455.1100-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250315093455.1100-1-ian.ray@gehealthcare.com>
References: <20250315093455.1100-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|BL1PPFAA7FD2635:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b57f156a-4e0e-47c8-c416-08dd63a4a8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PqcG8zWChWcE2wBbFyGtSdIBP3Kr5p0Whf9HyHHG0WevZtrbmM8EUg71KLBS?=
 =?us-ascii?Q?5lgw/KhJgAngCQJGaYdczQNeVE7wp4RpmuBLSmiDffmbeSLB7ObmdEjh7Z1n?=
 =?us-ascii?Q?y5nnOxFLBmIRU4PKE3jzhATPvuXpUbqBQrCjxuE/ymorxK7bgfiS+WJDfgjM?=
 =?us-ascii?Q?F9TmmZvF3MOWw4gqmALgaer2h9c3QmIZ2fT/z8eHhGoCQSJBWLQF6FHXIeS8?=
 =?us-ascii?Q?tYn8ZDIQq62W2ftBtg4vVFHQHSxy2/WDSA/lhNXP25pvqPS1Dyb5/CADBbz4?=
 =?us-ascii?Q?z6xd+me9/B48jGjiUmlOllgVhmjqnTBi5wXO2eTsEdBpD4U7Kt3GgI/Ml4ER?=
 =?us-ascii?Q?lM/ElmFqk7ptjXwOR2P+unpnA6kSjHG+NcNmRBB6c5n8urGS8XPddNDc45NC?=
 =?us-ascii?Q?1olpvDdFT+T/IeZe4ogyR8D4r5fqbuDx1X2IeOSmUyuo4wuIYJ29wamYnWdo?=
 =?us-ascii?Q?qQQOZ25jUGYqHrJMod5ebogCmGRnEAa2r/D1ky4fCvIGsZZ74FCk48rayZQn?=
 =?us-ascii?Q?6aOUph5YdXEtec9g/A1ErxEiwlZHTAoHM71WnXmKJHhmxn9Lt3g26x11vuva?=
 =?us-ascii?Q?tA487u+9YJQ9XiERCq1epzXQT8V15o0tbdEja9iNII7HuY4SSZ/Tr7L3xZ5M?=
 =?us-ascii?Q?FBaIk5ZxD0N6zSmLTgsI6Xt30Ww3IuCYVHqlsFeR00/FPb5qgHna3of+Yre0?=
 =?us-ascii?Q?r+h/YfAf5zYE4CGo3fiy6eVbuqeF0H4e0UhkYYvOiNwIrUVWp2EXtdDuUkqN?=
 =?us-ascii?Q?NcAQocby9NS9/UvRhrL8NonwuZ+XUFetmf6ijcTuOXbbPCVBX8fl/53EGaRA?=
 =?us-ascii?Q?L1ptg3jPBbCXaLQABy1Ra9q+LGZcGUbU99j2z3dU98D0kYn3FoowzA2Zyhx4?=
 =?us-ascii?Q?LFd3QMYdvynysfDqKM9gov9nyypTsw1feVkH0VOePSXa373HY26ePh29tXKC?=
 =?us-ascii?Q?VezLLv68gov+2tpdceqw2FPqbhELzVeTM0DzfCxgEawQpX7uv+HO24TSTVxU?=
 =?us-ascii?Q?0vI2dhmpCSRj3OtbZI7pPvmih1wYxOTgCxMJGFFIqBJ+5RQSkyss83amXsN+?=
 =?us-ascii?Q?pu7HJYq34N2WiBOjCxgerMYVj7Jbrb2KEGpgPwbN9DDRdY/J4u8FTQUK3iff?=
 =?us-ascii?Q?UiK0nZubt4WAAl/+IMMKyO1tp3Q/bPxX1u/kFOJUnvLoTVm+O1LA3x7BE29Q?=
 =?us-ascii?Q?yCTMDGVHqKXjpSGJHyU5Nquj5au6a7Rbi3fJN/hWvNEyxbBHkUzNLbhWs1dd?=
 =?us-ascii?Q?EUEW4boWi4hWDMjkNdduZrvdaARHfMuFuX0B1bkqH5TLfAEEk/5LV56iVL67?=
 =?us-ascii?Q?wAg8Vk/Oc1qDFd9hrWWuWqoNrjHOIB6PMWXvdlX4EDr5aIkYpQgdHPBsMuuc?=
 =?us-ascii?Q?kmsffs025fJBgg0ESF3QY6V27o2P/YnRzhI6Gk5EBDwYmPXgNgnwDV1qizBu?=
 =?us-ascii?Q?wr4hApo2NRjhpHlpedFwbmGB4YgaprZTFnQ7ZcMloKfnzXE78qy3XzBMILVS?=
 =?us-ascii?Q?+Xv6aoR60tSTkzA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2025 09:35:01.0053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b57f156a-4e0e-47c8-c416-08dd63a4a8d1
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPFAA7FD2635

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


