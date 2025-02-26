Return-Path: <linux-input+bounces-10396-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF2EA464F7
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 16:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4BBF13B90BD
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 15:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E9C22F39B;
	Wed, 26 Feb 2025 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="uO0+N0VQ"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2046.outbound.protection.outlook.com [40.107.241.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B2C22F165;
	Wed, 26 Feb 2025 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583755; cv=fail; b=Rtxp2BXx2Z3Y2hOLMiizu1qmuBkIm0rspltCFNkRK99VkPtPtNht7OcyX/EvWMoUf6M0cvE+FL3TnblmSNaRRUQcvk6RCAVsWc55zY3QLYXONkqQJ5XB811Dxp0NIVHNABgyKgfMpzFsidyNpFVtXozPId0UXB95+FDbO4CD+FM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583755; c=relaxed/simple;
	bh=4zxzajqMYeqboauBzwLHMFFhen+VsT5Zz+3TgMSPz+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fYeAObSpiVpRDWjgrN+IgFlie9hE31FY5NNplKEsutIleMGOhyLyl94y/YPPl/FUdfLo44U2/s7RVt6QkQymp+3/lDdc3Rsrwc0/N8zXGDN9N0f3uP5aQ8QVZ3Ix5zQQCa821P7bY4F3hnCggnHrMthpqolrmc427r9ZsUp3Goo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=uO0+N0VQ; arc=fail smtp.client-ip=40.107.241.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/MjwDcnyf/rW8Iw2W/XrlLuwLoNMrMHHftt2qQsxVDHXSYY7vTq0zPjSSslrNh73/Xl2EGISUqsNhYHNx7G4ajxw+kfPrAo180jQGcaAZvdYvTKlp8eVySCJl70xtAWSOO7c3F4IC73ihDulTamxJjwLT4f4nLzu3uxVAUVyfN0GM4hEAO9j1+IZhdauVid1ZNbb1PhCaGJmbXi79FihsNT3iLvPnjh5rWGMxCl65QsopOw6uJcsL16xxZTCX5rRRiOJ5EtEi+BBHP2VhNtAmiFjN2CVafVsUbci2WLbBOKbOo5tmhJFt0trkHPiRnhNb5XJ1YAiu8wdAiof9NWTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CD3uGpn5h6bgj9jBf5Y8YRD2GBXFQ7WQpSm1tJ82+iI=;
 b=nU1u6dvGLLhSGNcPMEKTGoyd9td8jwJ8icOdW/coBElVMI2x6mfkZuvIlUNQohVLvDWnN+8q1VIAW9cHF5us9D+gSVWzWjxuJYwAemRF+IOsTOSTkh9NCrklVFt7smJwsdga31SLpDjLM7f8Ka+0UjaiINbN+qRR/6xo+Z7U2Hy5nF1Ie9GdkCX2qORLxtL/VWd95NiO+jDghcesd1tKrUzGB22hlkAzVesOMgPwzO2RwVzd3ACCY1bIkVefyj/z4c1/LY19KUNgTVeChxqrERIq5klbr8BfP/huHwC0Y4hVn/jKBpT8/Em6dLlIqsA90TMSVvunVpxAf/Dx0xRgfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CD3uGpn5h6bgj9jBf5Y8YRD2GBXFQ7WQpSm1tJ82+iI=;
 b=uO0+N0VQUwXb3fNLt5QyZ1Z/uYxntCc9wfWZidk3Yyl0mXsPZL0JUofRQ7dovipd5NVrb9kCNfrppaRdbGVdW9hKpVx1NLE0Zw6UPE8PzZF5DgasWJyu5lnqk70mfTEhqe82hMqtfcCjkgnYSzFnwzc9Ct4w2jhCiqugAsbgbOO4/qOJSKriWjo8pELDj7zmcmttGYJpgpyklfxFXhO8IjhIke0CYnV7hMG9c4vwEuQlLRt7Y+VBl+bDnzQPwiF7DQ5q+1EbnBRZBwpX4yoAAok5zFzyN9Yw0mqvey04VwHPBIpEHlQ4iiYC3zMoYcCX8YY6mjAOj3aq+d+gU35vyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DU0PR03MB8218.eurprd03.prod.outlook.com (2603:10a6:10:321::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:29:10 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Wed, 26 Feb 2025
 15:29:10 +0000
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
	Markus Burri <markus.burri@bbv.ch>,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v6 1/3] Input: matrix_keypad - add function for reading row state
Date: Wed, 26 Feb 2025 16:28:41 +0100
Message-Id: <20250226152843.43932-2-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226152843.43932-1-markus.burri@mt.com>
References: <20250226152843.43932-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZRAP278CA0013.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:10::23) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DU0PR03MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a885b0-be51-407e-e905-08dd567a510e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?njyXIjofhh8Ni2mZ1HqhBFYB1QY02cTpqpJjWtJx4sIMyESRCh0pxg8we8rJ?=
 =?us-ascii?Q?3K3l75YzhtOTA8J2ylXS4RY2igfMVDyBdpb4nq5uwPk1bEFVTwHPdrG76gx/?=
 =?us-ascii?Q?8CLjoPtkb9+S1umOf2SEXlT/lYsbWjgZECPp7nPefg3236SUKUeBgJepREEl?=
 =?us-ascii?Q?wCHmbCG+wmPngUXKm+hmmA09c8fdmdWAzmjKYN6TkSM5FwqHqUke0sWP71xe?=
 =?us-ascii?Q?yYuRkeEDn5S/6Uls3APc47X5bnLi2QP2yLE4MLpI9eCr4VdbVG2KI1NoZijM?=
 =?us-ascii?Q?oMfnF09aaW1jRnpltmx0AF0kewpxsvnkcDbbaD5qccGqA5qaGn+5hTtS40Pd?=
 =?us-ascii?Q?HBK2KYBjC7emDyLVPKqpdOueExMmb9baTES2Mv4XwqM9gOo5hqXqfdRjNUdt?=
 =?us-ascii?Q?OR6pLZWr8MWJT/2TCibDKjpy49Dme3ZBuN0L264dk4GyDi68ukAHkG9bSMp/?=
 =?us-ascii?Q?tjXh1P/ILQfTrIgMRbZGz3NiYWK7Y6BIblB8Vb6tCDkAmIczQQbTuxwr7wBm?=
 =?us-ascii?Q?WGeTpLfAJt9RFicfkqn6+TvvuricO0poS5b0NKVRUThF7tTvws2eOmyaBX4R?=
 =?us-ascii?Q?gqC0gddkAt1xmYI4NMrdEGqkc6D9CXD7UUJqYvrMevrMciNL21xY2QAxOikA?=
 =?us-ascii?Q?cx6zlr7miWmLtTMaEqOQweJ3N+5SqJCXtKVk1/dSP7taoreg8HMMxvlze0Xv?=
 =?us-ascii?Q?QvodmLnlM867BsV6LnWYiWRIQKECHIo8OMeGoN+RNI8ELFrAGc7C1v5BzQQ5?=
 =?us-ascii?Q?gCYGqGC/ubH6ZJrxPDPT/CMxgj6Kjah9WG/efqmFUb8GsiVaaQ/soYbJqzBL?=
 =?us-ascii?Q?H7pf0vD3h9rKhnbp5JJAdhqAQvs57oUMfimPce6spp2jHij2Mohy19Hb82n0?=
 =?us-ascii?Q?OD1qCjNik97osNPOTIlLjOqf73SF82ibaYbfLvbGOlHlRrfe+LmrkZa2MRXs?=
 =?us-ascii?Q?X2e9Stfm0XaFvf6AdfGQSxYVkWU2IBAjz6UnqGIkqjCi2Z7ML2su7rWDlFiB?=
 =?us-ascii?Q?bZ5vSoDkKaToQCsJroy2xZP67mJwLG/gPVXUk2l1PIK2QsmKT1rRxMbcd0RL?=
 =?us-ascii?Q?LiP4lR5zLp6i3JiVznJ7/jDob79kBbj7TneZdAvcocL4L0fy8sy/uNlMqnxG?=
 =?us-ascii?Q?NpdN6iIfxyyrEfgRnagkCsrmWPJF8CB7ecpbTZmBvMyMHTz4uYAK3/V3eSQK?=
 =?us-ascii?Q?k7FO95/jvzTVZIyPffiB2PzQPqev/6M/v7TtrEKvlEz4k3somCZPtRwgT0+P?=
 =?us-ascii?Q?u4VxZr3/8WBbaJ3yPxITpXl88tYdv/Dh+r6/2LWlXUK79vAEF3unQmS2CRaB?=
 =?us-ascii?Q?J+sK/ZpXAc5taBSYYGYWRKAjXjMptvA/mBE1+WmyBy9nCQbn4dFuzjVn9NJh?=
 =?us-ascii?Q?OkSQ3RnS+4zCk7ZHGkY0Bpr9cYcP3X0hrNdZ6XdPYQywkR3pDaRCrRJLT0aa?=
 =?us-ascii?Q?Slr6h2rnNuCHV5mf0RU5pkEU8RwMBcRZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OTYsXmycUFZa+Vc/XCYazqxPbLWN/UPMEM9KzyPcCxon6yljcbYKCL/C+r4z?=
 =?us-ascii?Q?Uq4PaYp7jSKzQQt88ZXiNFYjEni95bqDmkRcZy9Fm2/RbaNIz8Vre/nm44/X?=
 =?us-ascii?Q?U8yrzvsH3OL/IetUmriwmOdMvnwRpGhnU2UoIRbf8aVku2Ff+3ZUMb0wfsyz?=
 =?us-ascii?Q?wKERmFqGAjaAEQl4HL1x4OW1etRdt0eYac/S71/l51EGpz4WqLf9nVCx27ro?=
 =?us-ascii?Q?zuuikO+WvHfJSYBpRTZ8XBccDnEza7R8kS5fDbAvC5jkqOygsnCQ3njXTcA2?=
 =?us-ascii?Q?PQT5PQrpARTSw3H7KBZPG+/W3qkahGkvWDeO4d3lslBUiBAgfc0FP5kKpVbu?=
 =?us-ascii?Q?mEIOo0gsbiBmhhbLGRfbbGEhHkzcSG8HiVoL83YVgHURO6LDQPERD5+ZfHlz?=
 =?us-ascii?Q?1wzhdEzrwnk8XNPwv+baar2mTjvXj3v9k+jNp7XE3RpVJ0t8F3JmXIYEdIsP?=
 =?us-ascii?Q?k2U1e1ZC5jegLvfD4qB5rGDGROWH8zZe5JYUgU36bFxA7p9cjVev9MFfxGwl?=
 =?us-ascii?Q?V+BQ7g31LAzLn5pSlqDHbdMK40PgBTDPvzzl1dM8QmcZTMbgQZ0EA7saIG1j?=
 =?us-ascii?Q?RCl4H7f98dHXIYsYHy3rQrWt/Edd0im1hcyBz7ZY8W0TZMoNN9uG25E+4tiV?=
 =?us-ascii?Q?gxRI3rfIocMHX6pHadteJPXIu42tC/5DpJ3kdvNogEitMaEpsFX9UhT8tT18?=
 =?us-ascii?Q?ZDgf1gwLVNDbZEhsTskRaiqzHawHjUXKQ1eLgEJs7/yQydF6l9tBuTiwKUrb?=
 =?us-ascii?Q?hbC1GhpEXWmjBf/eByWgskKCvLVN8q/L0EHu+yZF+1UUWuzP3UU1cGdaO1iK?=
 =?us-ascii?Q?+wdn2bmyGIdJysDk3P363rwQOtLUuv/5ZH9KhyfNGGwmt63p3AoZ1h+0pbba?=
 =?us-ascii?Q?+oH0LEFxJd+VBp9W5gXXn6Mtci5R2Tyq9BB8mrmXIL3NDlfaJ5GMLY77jV4s?=
 =?us-ascii?Q?r503nbgo0nvAmoF4INmxK+8MOd5P4hAcDDKHofw/nAZFnnF+eIm/0k8V07w+?=
 =?us-ascii?Q?ZwdtHWFQkSB8diyFExOIrK3cmtf0rcqZVrj+nUN/TDLGCDZnLCLD2EQQADiU?=
 =?us-ascii?Q?8MMdPqZ2QdArGPd+l83rSnCeXBTc/4b+eJzL3ag+sQwvmhGXyqrifty9StNN?=
 =?us-ascii?Q?4srymtrndVi5PYvgBuIKcVFQ3qzLzUNTI6iF33PSBmzx8SkmoN5nFjr2AAPe?=
 =?us-ascii?Q?kmgvBM0pRSvUJNM3mKVF6eL+cA3rldW4SQrQna/mwMoGdqkDXWhV5NmGdvoa?=
 =?us-ascii?Q?53T/Nab8Di3eXAB5nfVkdtN3S7MQWnebEj7CR0c405+x2bTUZbqUEQS5Fr9w?=
 =?us-ascii?Q?OFvl6aqQFJH3cUazpBlq/wDQKAKTdz091u2DsxJJAOdH6P+VSRYDrFENRy5U?=
 =?us-ascii?Q?xG74FfXeEiIgR2TeTVo8Faas91kSdlrbA7q718jyGcTFqp75EEgTtByi9nf5?=
 =?us-ascii?Q?FEkHlBIu+NzmG7fLPizd/XQjEMeTsH9Y12V9EqLHc45mqA5XPs7+ncAM68iP?=
 =?us-ascii?Q?0uZnA330EWNqi+hLhuby5/pd9I7/daX2YH3vupVoBIht5YFoZ4u+5T1cY9pG?=
 =?us-ascii?Q?IqBFsscTKqLH1L0iSg7tPN8hq0uSzGx2LSGrGGaz?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a885b0-be51-407e-e905-08dd567a510e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:29:10.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hSrAjJbA+fUsE0o4vLJCjgrNJWkl366HI0MRnktpdWTng18ZW3XkbyHYKQZuEDPYm+EdJlTj8Kkd6Sqz7bDz1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8218

Move the evaluation of a row state into separate function.
It will be also used by a change later in this series.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index e46473cb8..fdb349966 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -104,6 +104,16 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
 		disable_irq_nosync(keypad->row_irqs[i]);
 }
 
+static uint32_t read_row_state(struct matrix_keypad *keypad)
+{
+	int row;
+	u32 row_state = 0;
+
+	for (row = 0; row < keypad->num_row_gpios; row++)
+		row_state |= row_asserted(keypad, row) ? BIT(row) : 0;
+	return row_state;
+}
+
 /*
  * This gets the keys from keyboard and reports it to input subsystem
  */
@@ -129,9 +139,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 		activate_col(keypad, col, true);
 
-		for (row = 0; row < keypad->num_row_gpios; row++)
-			new_state[col] |=
-				row_asserted(keypad, row) ? BIT(row) : 0;
+		new_state[col] = read_row_state(keypad);
 
 		activate_col(keypad, col, false);
 	}
-- 
2.39.5


