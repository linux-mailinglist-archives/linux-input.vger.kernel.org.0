Return-Path: <linux-input+bounces-9066-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB47AA05D39
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119671885471
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6731FCCF1;
	Wed,  8 Jan 2025 13:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="cXQDDK3C"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2051.outbound.protection.outlook.com [40.107.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63E33D8;
	Wed,  8 Jan 2025 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343994; cv=fail; b=gjTBNR6hLYQ6RRJs5vuUvbT+Ybgwqsy0wL6wpC+vDTnS0xwWUb1waMpbPR9tgbUv+9JHD9dUaClIRQBZv0Iz5FIdue3RMRV0w2d0wPRMZhnHLmkF2AI5IAFc6Gy8RCnB2mhoalZJfiHr2i2Y27qhB1RWyiX68Cz90JaRKt4L8zU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343994; c=relaxed/simple;
	bh=nMe7EhCD91o19QktC0RODj/qDgszHJkHyESftwpSiRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QIYdpeP3kwD3A2THD5qoDryl4aq9qko6KI+REv0NHEJYXlbFDC8/ETucy4xDIZMci1DT+qqeReazX/g2sE6ou1hh/vEY7GsNP48UF2vL2Fru7m7TRV5V5adXFBU5O1uTXHKa4o8PWK2HTdAegbkPapZEYE3jQ82yQm+GgjJAWq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=cXQDDK3C; arc=fail smtp.client-ip=40.107.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1SOZEyI+KkIHfEfnFNSNZNKZpP4to5SHnOn6pFFRikX2EXASeiHE+E3/I1iMGm5Whq9VNUAsQ03HEcyJrZBLrcPG/t55kEvgrDt4Fcon1EuXyFEr1BSt9SVFnrEGd/+h/JKyumoN1IQeCFaLum+Or8IDafujBUfDu47p53D0WwOizZaFHoFnOnvtJ8eQVJylhcmXj9CW68Ca0FwiqgE1JGGpNxA+oZ0P3bCVYlApipdxucRyjNE9PfXxWUlGyardV64WOZuIhIbjQ/WAQd2TJAFX/kue1dBFpiY+RDE/0qVNemIcnyIPyPSTGrIyH5mxYlMKHlyeeMSXoTMHWL/Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCCAe3gwWWk/SzoxiQZ69oiM2Zdt3nZ74Ng8gDK68jQ=;
 b=es0Fd+uKzWX0Np8jLw+YaeT2FTB/T1xlalbveA2C9y5HLrF3cz13YTEb4IBr6BjAebsvieuinNUWHetkOhP9qj2n/ms5i0D57m/uXd2WXiqbsj09uFdnWgwbFyTpQwrg9TIxKhggUcA7o7bGeY4mvJAV0/rFwiX1P0UabAgSKmptNH2PmcIed2pS5dTXwtejAAYa9zMS+VfD2mLcmyHiyy6maqc3yfM3cchciQXRckjCsxaShXYBNo+weg8SER2PHoOi4cBVV4vRD1VHEs4QEpxrtUVPrZMvXjgiLJeeQB0TwuDiwL1AG81IPfw/bND1LoZPAM55UzgGOT2nFbEYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCCAe3gwWWk/SzoxiQZ69oiM2Zdt3nZ74Ng8gDK68jQ=;
 b=cXQDDK3C3I++LTSB4hi9S08uEKPWiEEIBWpUev/Dpk2ue0JBDVPFS8UqFdmzUyhjG8hoQI8N5OMZMIsjctOQcmcBpk6nHqzbKiAAofhCf+nycf0nlDsgBGJDJH7GIlbowvY2tTDw3hzNNt4cD7/RgEZDnE5vsnTm4dp5UNK58d2NOChfJBDY2sDbVE1kF79q9Rnmo39ZwhgLaASvhnticgOweu6iDhocjGMT4ca/h43V4KuQ8vTn/TJYrylRF626TjLE4v3TGdCAvbWmYKfPYkxvrJFI8LuVfcj0BhC9pJn+dRQA/FR7VW1tDYheSIC0LVQ9dSGAVZk2p1kFp/CZGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DB3PR0302MB9259.eurprd03.prod.outlook.com (2603:10a6:10:430::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Wed, 8 Jan
 2025 13:46:23 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:46:23 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v4 6/7] Input: matrix_keypad - add settle time after enable all columns
Date: Wed,  8 Jan 2025 14:45:06 +0100
Message-Id: <20250108134507.257268-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108134507.257268-1-markus.burri@mt.com>
References: <20250108134507.257268-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0220.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::22) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DB3PR0302MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 279a0e4f-f87c-494e-5c9f-08dd2fead6f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Pc3m/LfYJbkriiBT7n9cDKMD5cHTzdpsicHMro+cV2S7B6zlSOQO86nZDLMf?=
 =?us-ascii?Q?d/FObWC2P/CubvzDPp3uWaeg14lfp3jD55r8uqT3D+2aFfmoPXfuTswNp7zn?=
 =?us-ascii?Q?TY+YGSBkg6MkxevnCwfqw2pQCidVSAEzbM9uQW90Q97UCxfNocQs9DEvNUj1?=
 =?us-ascii?Q?hrDOfRrE1pxtCIz7lEH8+tK4+7FFQreU7iDWr4GT5zoBNras9iHezhP5XxU/?=
 =?us-ascii?Q?8IOLmkpYVf5ZbpufDLdDCRIpqh/SmW3AYAquCYlQYGF9fyblAg/fui479M5q?=
 =?us-ascii?Q?KTOt5IkwyKHUhTkZxZc+mim9FYpvXMKtBxPNih9U3okVRnvhfbMBg7QtMuwE?=
 =?us-ascii?Q?4yXCSe1b1yZLwNvnXJHm3I0iHWBI63JfkSVQv0rxIwz483O0igI656gLz68U?=
 =?us-ascii?Q?czFSdC2wYNKooP1genXTz0oP6WZ7FfHeuilK+OYB8hnUMx7f2ozrgHjFQe79?=
 =?us-ascii?Q?03a6cYDvkKJAX8J8cZUa+iSSlxDTuA8CXlkD2MySDp49q1NQZpJQJMrtUMtD?=
 =?us-ascii?Q?p1nfm60XNXAlTtlsiWTtx6gR6om4CYe+s+jdk6Ljwi9dvsoqO8VhKbb97Ba/?=
 =?us-ascii?Q?xdXh0cM4+MdLTu03DN87V0FTVVzNRMKXr0pNDBsKcHyq6ubTOEnqCKx/fQa8?=
 =?us-ascii?Q?T+mLl6bPJD0fXJtEMD0aETqmbmeBrBwG9g7sKKH82gCnA97vqoFRVkJJkY3I?=
 =?us-ascii?Q?JHRc2BnRg7/DAKTjNVknmxZTnAmt6m5XQSVYvu2QXqKnquiBIGL3Xj4m6hM2?=
 =?us-ascii?Q?JMwBqnRuWBS7r7IJkLf9VAG2eEZm7QfzQmvi5Owh5up2pcUNlwDlynb6xdg/?=
 =?us-ascii?Q?aCp14+wjLejO/dCPabA1TSXdOM5f56ajwsic5CZiWnzffz7ferrwWcsR9Jyf?=
 =?us-ascii?Q?Vj1yFd3OJprpZkIMiG26BS1ZPLpboF9I9ELWwJl3d/jd09G+lfE3PQbZ4Elz?=
 =?us-ascii?Q?/dqzDki4UgmKkrpQNHg4I8HgdiSLH8E4Wk8txv8PMHijNfWki9zqOk9Coj3p?=
 =?us-ascii?Q?NK/uOtbUid0f/KFbUa24f3ei+6q+5BtXGUh1n0/9Es6uiwz/WiXUB1k3lSnX?=
 =?us-ascii?Q?KXOPDr4vHTP9gJkTFkJrUoIycCILGVms87rjFaLsbpGWhF4chV/qKVw9NNCU?=
 =?us-ascii?Q?TdroU5CTHSD6rJyKKDaxt16bjzoci+czMtxilqRfcFxEu2yV5I7C1hx4hWgK?=
 =?us-ascii?Q?baim2dyQPZCnheRpqKpdBjk1lq3O+pS8Kmhlo9es8cqZJrhm0fZpk6ja+NtK?=
 =?us-ascii?Q?SMa0cVDopdcDsHw0L3w1/O8cTWiiyIYCNxxBi1AjQuU4ygmC8AwfAROzOvm4?=
 =?us-ascii?Q?OLNjhrF9bYagI/SXjQyFP3/Et+26OQRu2bDcco7AplT1bwpWJ1SiY6Mdw1Fj?=
 =?us-ascii?Q?ZN2LPe9MEHG9GpbFyzIOK+pasndchAlye4KjFywNmMEHGzvMgowu6Vl7VKP6?=
 =?us-ascii?Q?G8wYAZt1KzcxnVo5ulWXlUe0FDjRy02j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H4TcaFIj0v3hi4LIYxstoRpaFLtklSYbzg2h2sCrr0hj2fxFKNXO4OjX4bb0?=
 =?us-ascii?Q?wyBLHjD5txamFOYPd2vpr3obsOsSPdDz60yNd04GB4nrNjeDbno0uYvFlFDK?=
 =?us-ascii?Q?AvGBB3HZgalREm5YbIEkLsv42vMWM84oy3T9Pfa2F4van1P9zckuhIqxb7kL?=
 =?us-ascii?Q?j5OvnrqFUChl6YX+4NnxmCB28F9xuZNGIv/d3C9a91qwQP2dGwAR8waxR3aD?=
 =?us-ascii?Q?sZE4NXNJmiK3ADLInpUN3TlCqLnrgu3NEpLCqHibTirQoXMiIXRqPnxUSYyk?=
 =?us-ascii?Q?+32GlUiECLvFa1U8xUVMGKxFz24vA+Bjn75bCu3DmUnyhYmB26+97TzuRLDy?=
 =?us-ascii?Q?v5MpaTP1efpRIHHypbVwMzTI0yDeyhXoBntEFBUGIh08GkvvDMSSxhSHiBtx?=
 =?us-ascii?Q?y6kKb5gUVmGLrDhnvcsQsr9puCWiuO2YVlL6TKkwT1yxqPTG3UaH5TSJNTvo?=
 =?us-ascii?Q?w7hRDudh51IB2qyBie/vypn9RlXsNmglCpoFHFd9tiLUJxLBMkiDCxTol3wS?=
 =?us-ascii?Q?Ogrg76Efg0FOp895fyqv2hkjVNPk45fFrzY3Bz7P01TwdeYZgg0AUEtvh0i4?=
 =?us-ascii?Q?/Wb1IGY/F6chZP7BUOdxeWbfWUCr/3KaLgbHZU4+ffpgSKsuOw5YA7hm0lU4?=
 =?us-ascii?Q?t56pxYYnqoVTFw87ElSJjp1rEDZrVBNOOTybmhualgfLA+lubL/g6XfT5b3/?=
 =?us-ascii?Q?vxHpdzxcL687TOR2np5/Fbe1wQRyGdpvrnFc1/4draOReN3Tst0hECpZj6ju?=
 =?us-ascii?Q?dSSFjjzk5SrAtVb9qIQBgYHjT4vpPVY0875GTBlGQxNC4zjabY6wjMZlHajM?=
 =?us-ascii?Q?rcPv6MJx9JsNG6VmCw8AKWOYtmhRVnhnz2urdf7yrjUhd71Whe+b56kLwSt8?=
 =?us-ascii?Q?lWPnBDrYtyUojjzeKpxHpzROXaDJuu/ZtIwDu4VxnboM4fvBSNiuucChRTjD?=
 =?us-ascii?Q?b1UiQFmkuAg7tcPQ9XHaSEoPvPugqSpYHqGnkwMa1Mn4NEpf0NlLw5j2pwQs?=
 =?us-ascii?Q?lC5wTU7RtYwFXlUxMvn2m9grLVFH2MoGQmfpiNBTiTwzKz2tTj16IqW7jcFE?=
 =?us-ascii?Q?SD6C5AsMwAP+SjXbpQlA3aFGM1njcuDkPr5aFVwP3mQ9kTJ2IpgxFR9hIdox?=
 =?us-ascii?Q?+6WjG5ix3Rn/pTUwlRA82gbx98CnRBAYvt0Z8d045cQzy/0+8AdAksfdD8Fi?=
 =?us-ascii?Q?J6fPf66nn3qq+DwFzWHnjrDvfkJHd/L28tfwicich4V65Z1YtrkEz+uSrEp9?=
 =?us-ascii?Q?qvRHzYsTp+b7/XIcte/ddC5XK+b55lNYC00Gc8esLe/Mfmby1jel04rrFJq4?=
 =?us-ascii?Q?Id8+XGakJ4f5xyBl8YZHUDWsz6qYJlw1dD34iazDA2UUge95iiI3vJmx39uD?=
 =?us-ascii?Q?XIS+xG8Z8OSDCYp/CRTAr33U45I8JpAtdYNOPDD2jwVP1X03PtJQrjtFzvBO?=
 =?us-ascii?Q?qUTFjIcjX3nsUz6ecABIU4Cuh+PBuQJmnvkGSEl+LcA/Bc+INtwwLVhChFvH?=
 =?us-ascii?Q?bJkeYRO9HdDytRNTZSxmEG/QQoVTtJtigBkbO5RTAsl/WW5u1CoN3ZZeOssL?=
 =?us-ascii?Q?QeauFfuTZmEBmkKo/N0iwkFEyQGNhww8Ik2Ehao+yhQgnv2jApxOU6+2/gnx?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 279a0e4f-f87c-494e-5c9f-08dd2fead6f0
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:46:23.2367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3BTBQxwR4aHeYvxHjCtxaqc4iVtmZjgaihPrLHmjjHFwLY43NrQ/75eMTpTDEgcfJ3zKRjaG+SpxO6ngUtYwfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9259

Matrix_keypad with high capacity need a longer settle time after enable
all columns and re-enabling interrupts.
This to give time stable the system and not generate interrupts.

Add a new optional device-tree property to configure the time before
enabling interrupts after disable all columns.
The default is no delay.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 90148d3..fdb3499 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -26,6 +26,7 @@ struct matrix_keypad {
 	unsigned int row_shift;
 
 	unsigned int col_scan_delay_us;
+	unsigned int all_cols_on_delay_us;
 	/* key debounce interval in milli-second */
 	unsigned int debounce_ms;
 	bool drive_inactive_cols;
@@ -77,6 +78,9 @@ static void activate_all_cols(struct matrix_keypad *keypad, bool on)
 
 	for (col = 0; col < keypad->num_col_gpios; col++)
 		__activate_col(keypad, col, on);
+
+	if (on && keypad->all_cols_on_delay_us)
+		fsleep(keypad->all_cols_on_delay_us);
 }
 
 static bool row_asserted(struct matrix_keypad *keypad, int row)
@@ -400,6 +404,8 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 				 &keypad->debounce_ms);
 	device_property_read_u32(&pdev->dev, "col-scan-delay-us",
 				 &keypad->col_scan_delay_us);
+	device_property_read_u32(&pdev->dev, "all-cols-on-delay-us",
+				 &keypad->all_cols_on_delay_us);
 
 	err = matrix_keypad_init_gpio(pdev, keypad);
 	if (err)
-- 
2.39.5


