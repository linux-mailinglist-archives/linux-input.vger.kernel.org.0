Return-Path: <linux-input+bounces-10754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE7BA5F364
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 12:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD2303BFDFE
	for <lists+linux-input@lfdr.de>; Thu, 13 Mar 2025 11:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1ED26AABE;
	Thu, 13 Mar 2025 11:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="mPmzjeGl"
X-Original-To: linux-input@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1860026AA84;
	Thu, 13 Mar 2025 11:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866303; cv=fail; b=FJvdu1tSvtg8/nqc2NSo+it3KbOxv6dEK1NAJ9jwRiStIUlkgnJ0qXNYBQtDYZBJ1KsNKamr2EEDbHol2QFaNEEfQeDcQdglhDjEBZjepa3dqAfnVET758Q53XcUvaYqav8VALmqWzwFVIUrpwp5/aRBgj8659L8MV8rfnU3kT0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866303; c=relaxed/simple;
	bh=hZm+4SZLX1WM+08hcadie1Luks34EGfXck6QoK+SY1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vgfol/kPRALukwFWjqYAlxKkF0KTj5Z+07tgzZLb/ofbHNJKaFlVEwLzAEtjCmqLpgZA9H2C1lsr6zfDeJL5ve3QdOsbTHqar3+UKeioMj+vrJlQmRDcvzmDJc7oxzw7Q6uDva+ESwY3zA013l53fQs+nn4YF8k1dZ2RqeLlQ8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=mPmzjeGl; arc=fail smtp.client-ip=40.107.223.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pvCihNDyGCcNEpfrN125woCWhr05IkhtMCg8oFWHYIzZHZrKE2EnrR+54/kJ1wOVUjLXyd2k3TMkAn26ajsh/a9gI4WCpDy4sK1PWX8xNTYYH8nmgYwvzActnP0Rrbp5v4C9OujPxSuFDVdpwM+OhbnOR3lhr98bsuWL6iDSGADpUrGKWDo2q3fBceATrMbx7iS3dr3ZoANF+FQDlFPzJSqv5kwn1Q5OUX4giLrHTnz9iyhVug9sqSWf7iOAMztKx2NifI31jUZAZsDqhuEWKpxu3sxl4YuUZ7CEzzMw+4NpVPtm44wHgiYnuHCcjG4WJKRtrT2NgkNXz2H6n37qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/W2G6LZovGPPsDa96ifJV/gp9H4gef61tOFbmHcnhjU=;
 b=eLjgBW2L3lponStvqUCPm1jsYu7U+qgXHxHmAu2arrW9fTd929hMTBmJjh4gTa7O/jTsEwEa+Z+ROWR4msd9yOIeDNh0hjQEGv1KFUfxCij1g4ICFcil1DQ2pN28fZ3bEPmeoFZqtXwsHkPbeZdMvyo6czRKAX7CbGslDh1Bb9xkfSRhPI1oeqEpSHbIuYw8VHbaOyk5Eo5rcOh6KWBK6TuqI+alu9i1ojH/XECnN5Q8qxuKTg+bRqQOSzxiKJD9n+i9+3EVloj6QBCvdQuX5xjY4M1LgE/fDcCyFQ0Oy+2irwCKOn+CVmLJCmgLCvUWIg5W/3ZNendIhiSXbK5C4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/W2G6LZovGPPsDa96ifJV/gp9H4gef61tOFbmHcnhjU=;
 b=mPmzjeGle+uwXmVlZHI7Ie/kzmCE9G8JzxDErlH5aRfpibPN/zdbN9Dez6M++QvWwY9jtPC5HJDMgkBF5uYXJf+lDk0v81Qu6KLsa2NBecLVlEcRYyB2OenmEjUEVxFAaMIomXRIqSxEh/nFxEQOniLi76PuhaTh+Lq9Zazxre/gqaUXVJsv/YF11lnOK3TkfGGhqj+u9HIEtfnt6/tTStILrj7G9O3VYPPDi4FtOnvBrikDhpWw4yEe6XEIx7glg/UBRvmSKtmxQFri8d8fqwHKx+pbW1YVzvB6JBzfjscyCJc94MGSqceBQnhdENC9uGlT9ZhKJ0opG5fyAzVHdA==
Received: from BY3PR05CA0024.namprd05.prod.outlook.com (2603:10b6:a03:254::29)
 by BY1PR22MB5535.namprd22.prod.outlook.com (2603:10b6:a03:4b5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Thu, 13 Mar
 2025 11:44:58 +0000
Received: from SJ1PEPF00002312.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::d7) by BY3PR05CA0024.outlook.office365.com
 (2603:10b6:a03:254::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Thu,
 13 Mar 2025 11:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ1PEPF00002312.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 13 Mar 2025 11:44:57 +0000
Received: from 67fd243a5d78.fihel.lab.ge-healthcare.net (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 2CE91CFB7A;
	Thu, 13 Mar 2025 13:44:55 +0200 (EET)
From: Ian Ray <ian.ray@gehealthcare.com>
To: dmitry.torokhov@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ian.ray@gehealthcare.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Input: snvs_pwrkey - add configurable force shutdown time
Date: Thu, 13 Mar 2025 13:44:53 +0200
Message-Id: <20250313114453.702-3-ian.ray@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313114453.702-1-ian.ray@gehealthcare.com>
References: <20250313114453.702-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002312:EE_|BY1PR22MB5535:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c11f7d8d-8739-43cb-845d-08dd62247b44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dCylMviGCSR3rNxr15Ax1ztXB0n3+H2n03a2MN1CBeBlKkqG7ySRYdNGKnVZ?=
 =?us-ascii?Q?rKkKLyOzWJQNMB0/N2AFoCmOwrhpCcpoLLylROkLx0J7UForWJN0ezXyTNSG?=
 =?us-ascii?Q?+Kx6/YNZ7KxZxKva+P6JvFPGaN8hFCMuozS+TVz0gbOiW6llALoVfQD3iiHr?=
 =?us-ascii?Q?wvWxOBPbgADgvmfg8mFQ6oiRFWmDu1a8D/2WMCRcSavwsNAEmUgHiJOKwvnB?=
 =?us-ascii?Q?cL/e8lrFSyhZRTaV6540Hhow7DJmJ6ElAsokLSM8ifd+lbVnFPh0OXliIifk?=
 =?us-ascii?Q?V6hPbw4gx8Fhn1tMY1Dtui3b79PhQZ7TBP82evf3sEhBKNd4AlLDrNA2HDFj?=
 =?us-ascii?Q?f4cAsIImtX/8Vs78AenHZvOHni2ERCHlqWpsHbGBHdL5a5BIp/8UQ+zeieQQ?=
 =?us-ascii?Q?dYXOWtk1B1jcQaLXbNnBW6lbUJP3Ssrs3ZlmS4UUjoydQHSyf/vdUoJlNB2n?=
 =?us-ascii?Q?y88zAQmqvWBo6X6oEXlQORcWFeYJWezpfocfK+U41080RV382SCBzRR1K2Ri?=
 =?us-ascii?Q?B54sKqqIarPGR06XO/nV2npR88RPIgxVP+/tQEU9xB3WZzvfse4STG8N3baF?=
 =?us-ascii?Q?vQpQg6ArtQQKYqv6JPWwFmZizY3Xqy5UtAhbElPEslatWpYGD06pUwxDO1jg?=
 =?us-ascii?Q?wC2DXnU49uN++vVRwoPIKqXw5/UpkO9AzfoXEOuC8R3Fo8RYBAeZ12aRV3di?=
 =?us-ascii?Q?jLNQDBLv3EALkjbifWHqGenvFRbJEioY/y8ioB48sZdZ9iV/SABSi98BfpIP?=
 =?us-ascii?Q?cVuQbWq0lksZXv9kWNtG8YR/kHvsWVBTXQUoWzY9jZKTS09pxcKLpFuFC4Zb?=
 =?us-ascii?Q?HuBvox4jl/qLgRpXyGCUE9cRLpDm6RM/w5n0pNURsahGkoJ4iuE6jkmxZJqX?=
 =?us-ascii?Q?B6BqoqmFrVu1vLggVJmBplJPWbVDcLJJFAwZcSfr2yg/4txq7qDxso6OKDgm?=
 =?us-ascii?Q?6w12O3LK1hux9OuiM+ZKpvOKeFKf6xXiyvLgmD7X7S/EM7ICPAbIvkp7plom?=
 =?us-ascii?Q?RR2lwm1SBJT4m2wzhit/sVMy/Kl+N3aWd+k1VIFE+oouQzT2Z+aXuJFrLC/Q?=
 =?us-ascii?Q?MIyE4LcuyobHVIG4bu3hQnMpt5aom0QyGmeWTV5THSfQDO9iY3KpNsQwsM+D?=
 =?us-ascii?Q?o9KR978tIQQglutxDdEaf4bCzyvnzcCUiMSpnHz1eCLFY3/s1i6/pVmfaO2/?=
 =?us-ascii?Q?aPpFDA7uGSRpQOlmG/yH3/XfbwqjgLmYxwOP+7+j5/5sC4zEUNVho8q8YRKn?=
 =?us-ascii?Q?RGv43yPevbPuIk6YIs384TBIOpxhehHTFHes3PSemOxeYVRhlWbvKzstpSmn?=
 =?us-ascii?Q?aIdDBmPJZXLCThzYQZGzphx+enih9QcWaj1DP4Zu5rrFM9IMfOuPl2eWw82N?=
 =?us-ascii?Q?z3KQI3FR0nQjnaz2+cEIPo0QxaXWEURe9G6R/Zs+YOXzFk2LN4QV2egf89UO?=
 =?us-ascii?Q?ur0InDJ2tu9vOOyhNqDtMKPTiKd1KympAjSLXr0uoAyQJBwRxeK3eA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 11:44:57.8848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c11f7d8d-8739-43cb-845d-08dd62247b44
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00002312.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR22MB5535

Support configurable shutdown period using a new, optional, device tree
property.

The force shutdown time is configured in LPCR[17:16] BTN_PRESS_TIME:

 * b00:  5 seconds (SoC default)
 * b01: 10 seconds
 * b10: 15 seconds
 * b11: PMIC is not disabled

Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
---
 .../arm64/boot/dts/freescale/imx8mp-ppdv2.dts |  4 ++++
 drivers/input/keyboard/snvs_pwrkey.c          | 24 +++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts
index 7cc427f23e59..921eda35154a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ppdv2.dts
@@ -699,6 +699,10 @@ &pinctrl_usdhc2_200mhz {
 		<MX8MP_IOMUXC_GPIO1_IO04__GPIO1_IO04		0x106>;
 };
 
+&snvs_pwrkey {
+	force-shutdown-time = <0>;
+};
+
 &usdhc2 {
 	/delete-property/ cd-gpios;
 	/delete-property/ wp-gpios;
diff --git a/drivers/input/keyboard/snvs_pwrkey.c b/drivers/input/keyboard/snvs_pwrkey.c
index f7b5f1e25c80..2ba848df061c 100644
--- a/drivers/input/keyboard/snvs_pwrkey.c
+++ b/drivers/input/keyboard/snvs_pwrkey.c
@@ -27,7 +27,10 @@
 #define SNVS_HPSR_BTN		BIT(6)
 #define SNVS_LPSR_SPO		BIT(18)
 #define SNVS_LPCR_DEP_EN	BIT(5)
+#define SNVS_LPCR_BPT_SHIFT	16
+#define SNVS_LPCR_BPT_MASK	(3 << SNVS_LPCR_BPT_SHIFT)
 
+#define FORCE_SHUTDOWN_TIME	5	/* LPCR 17:16 default */
 #define DEBOUNCE_TIME		30
 #define REPEAT_INTERVAL		60
 
@@ -114,6 +117,8 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	struct device_node *np;
 	struct clk *clk;
 	int error;
+	int force_shutdown_time;
+	int bpt;
 	u32 vid;
 
 	/* Get SNVS register Page */
@@ -148,11 +153,30 @@ static int imx_snvs_pwrkey_probe(struct platform_device *pdev)
 	if (pdata->irq < 0)
 		return -EINVAL;
 
+	force_shutdown_time = FORCE_SHUTDOWN_TIME;
+	of_property_read_u32(np, "force-shutdown-time", &force_shutdown_time);
+	switch (force_shutdown_time) {
+		case 0:
+			/* Disable long-press detection. */
+			bpt = 0x3;
+			break;
+		case 5:
+		case 10:
+		case 15:
+			bpt = (force_shutdown_time / 5) - 1;
+			break;
+		default:
+			dev_err(&pdev->dev, "Invalid force-shutdown-time %d\n", force_shutdown_time);
+			return -EINVAL;
+	}
+
 	regmap_read(pdata->snvs, SNVS_HPVIDR1_REG, &vid);
 	pdata->minor_rev = vid & 0xff;
 
 	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_DEP_EN, SNVS_LPCR_DEP_EN);
 
+	regmap_update_bits(pdata->snvs, SNVS_LPCR_REG, SNVS_LPCR_BPT_MASK, bpt << SNVS_LPCR_BPT_SHIFT);
+
 	/* clear the unexpected interrupt before driver ready */
 	regmap_write(pdata->snvs, SNVS_LPSR_REG, SNVS_LPSR_SPO);
 
-- 
2.39.5


