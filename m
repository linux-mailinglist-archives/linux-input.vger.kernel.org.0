Return-Path: <linux-input+bounces-9133-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DAA086FF
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:51:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 187993A23FE
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AEF52066CF;
	Fri, 10 Jan 2025 05:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="raXOZyir"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2065.outbound.protection.outlook.com [40.107.247.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0AD206F03;
	Fri, 10 Jan 2025 05:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488252; cv=fail; b=pGR8btrsO0UOrNq8jVkQBINxTI4mV2Ou+pRc3iL5zxXkIUQGl1kHUZ1t3NwZwuz9HXNYxwipk7FFHpK2kuVV86MprCej0Lc9TVfrR07VrFWHW6S0D8SBbXypJtapKlzeN9YJJt/1mMNuhoc+rQNRSgNDvGi2HbK56JebDq6qxRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488252; c=relaxed/simple;
	bh=nMe7EhCD91o19QktC0RODj/qDgszHJkHyESftwpSiRg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I36SZdZk/rQAj1Lhr/g35/sEb+oNWswBdBMypFrajGNZ26mAJlZpDtBREkXNfi6QCyoo8d6y8QATeCiJcRcZdKbPiXmXA3REzmfFCqSI841aU1T+5fpBA8HUCOx+LNYti9AJtfK2K+ybzdgg4CLOmPVPvZ1CMrS+K3Vk6fDOnYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=raXOZyir; arc=fail smtp.client-ip=40.107.247.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NTDGUxf2qNnwE7ROZ4VAWOPFhfD4diY99g7Z3z7vpMEk8GmxO8qKwRvZQmfC+g2iAR6Jb4yUAHlLWp11k00M226QLntcFboWYiFjcS5R1L5Ouf6IjMHBRFxUa5GcNiQv26P0rVNdT4db8rUS/qi5hTjopNXh7tzFxGu2aFjgQA7U92sf1p0DqCQSTVYUe8YWHD7LStIL3hVl+6JAXiFwRHRORyxQ0PSCEEqSruuo4KjyDdSFIf6tkGrgGw5t2rP8e1s/WZd0LR1z9ef4SBNQcosZQALMittMAfr/l6YTvhqzHmF2lw+ifez8dA/+w/AIkP5ZH1kCxtDIejVPs92Kkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCCAe3gwWWk/SzoxiQZ69oiM2Zdt3nZ74Ng8gDK68jQ=;
 b=r6YC2v4sSrxmrMC4jTwfKEhnYJeO5tef9W3VHxvODO8C8SQ3olJbRFCveT8fcsTNrkCsBviAPeozixO8PolV/uyy93e/xRjSTEPUa3Q207YU9Xc4s0+RqE3fHoEzYxDfokwjmPmRuANY0KixZfWirF2Pi7f+61T1CMJJiI4ZoWQtJ6T4DMdjm7EFEyE3L+n/nQy+Lpb5xU/6L6N+1wh0smUlkf5MkiMDOVuxW5/Vg4nDOlrnKXj5ljcqzf2JSCz0NmtUYdLs6q9HLqV5lKdqxYenIhmAP4LmEpfbDv7TAsIJyfE0vmVHklqCh0bPNJ9GTS5gGBQv6o9MD9pHwmP5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xCCAe3gwWWk/SzoxiQZ69oiM2Zdt3nZ74Ng8gDK68jQ=;
 b=raXOZyirz0t4odNIcjpZ8Th3IvXz7RVRDpbvg612D8pgL8hU8l30hnxbi9qzVMkmopnMHCRhkURQ4lD2FnXYaxGhMwMCSuypWpYuFR3sgh9kp66nxqSal+h0e163UJn9Ds8Mf9VSa0S+Pbz4jORzfOSMffWSmACCU6g1dk+byEJa87HMkxtYMCTsXOwHmJpgAx+lUs5oepFHmnE9lPRig5WES938pXzqfKf2NyuWUZ820b9gyu6agYJqdb40IVn8gZeQ3xfb41LggBTJ+CVOUx3FO5DJorX79NGRy6oO3mSCh2uWfQ5TMqnVXEh2rkjVHEgsyZrsBwTWc3hoXrvGrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:50:48 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:50:48 +0000
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
Subject: [PATCH v5 6/7] Input: matrix_keypad - add settle time after enable all columns
Date: Fri, 10 Jan 2025 06:49:05 +0100
Message-Id: <20250110054906.354296-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110054906.354296-1-markus.burri@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0034.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::21) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5dfae3-74f3-4628-ce4e-08dd313abb93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yqm/g1NmgjYbqoa0nic/9XgSuR1ar5H01VPS7wb8pOvpyOYzuaWzO4Jh2D7J?=
 =?us-ascii?Q?6yQc14rtmvJJl5/XVd5VXm0n87BSYBngjQxNRm4K3FK6KhZR2ZklgCakmWRB?=
 =?us-ascii?Q?Qnz2d1iahCfPC6FP9EWV8EW8IbVdJ4I48roy6KBQoFfipM24YnQZKBezyMo6?=
 =?us-ascii?Q?KqD4ht52GijxwEgC8ddakc9YXQKztElazEbgZxeJxODQ26g2oS8iyhB9fZet?=
 =?us-ascii?Q?zN3eMXy4F1+kmC5PL5nMHPz8pZrBp23/f0SvA3sdWuTY5mlRLp/8kODc2ZCU?=
 =?us-ascii?Q?X1lMwn2KSQB/N4hZn+kGcsL0aJIR0v+Yk//z9vpYXcl3gP+6/TMtzd7K7qb0?=
 =?us-ascii?Q?dX0MCNRYXsh4vqpHfLehV4dcS4e+GdwZMCp2P/OqiwKPSw8CMGLXipkVw/xf?=
 =?us-ascii?Q?8OGgq90v0wXXRHPbfDtGrbgrjHz6jbPHqDWdiwLKg5dN24Jz4JDTR2L0u/uA?=
 =?us-ascii?Q?aUPjZVXjvQ3YpJCEGzv266xbPUp5dLKlrSKytEfo3SWdq1TdbDP6dcq2IwNy?=
 =?us-ascii?Q?U4X22aFWLE0DzG4PRX92OIaGm/04e2eZiVRagmBcY5IebOvxvO12nWgiJEtn?=
 =?us-ascii?Q?E5uhmNwiwvfaZlgPrNyrj4WevRiza4VOht5UqDrAGTVpdVVGYxkAbsR7Z67O?=
 =?us-ascii?Q?UxyjCQFZ2pzRFhNB7EZTftP8D0AnfpbLD0sp2t28eW+ozP5U1RY4/jMqD8ed?=
 =?us-ascii?Q?4KcB8kMa4hFCEpT1ArK7H0jsX+0SNZM/VrqXLIu2NERQgz0kULAQm0+wOwte?=
 =?us-ascii?Q?Kxugp4rf4usVtRgfb+Js3ohYLN9woCYKEe74BDyGlxF0q7UdLC9xUCrn9aaq?=
 =?us-ascii?Q?uZp829sgDXJXvf5ntpRR8th1eqQgQqTvcwf79bMVbeLwI3jI+NvLYLLpw6yk?=
 =?us-ascii?Q?WeWbJZn+l85gezNDbZAHvGLLERHt/oUSjG+M3xoFILrwBwUo2VhdYqbSO3Yq?=
 =?us-ascii?Q?MhktkgVpZ7EpTamw3qHsjHN798UsP/fmZJcMrHuBGN57OYOa7zf+vI2CRErx?=
 =?us-ascii?Q?pX27V39m4dCZkQ0SeJfBOiM2cr8bJ+ZfKgHRKQBEjiJu6GAMCKyTFcQmiDNN?=
 =?us-ascii?Q?UAixLkHebVDH0Qkz97oyGlZc209/sh8oJ7m0y/IKwl+5vy/DtoZeLP5431DK?=
 =?us-ascii?Q?65FGiTEwOxpBnUdI6QQCt1s4eBYEf937UOskgrH+byxW7LeNH0kFgksRw4N+?=
 =?us-ascii?Q?v25N2gxrdzZ9beH3SgAWL03jv7FCGTVxR6WBkyzmF5yz9FsmnyQVgwx41h/4?=
 =?us-ascii?Q?p5/YVJCrOwl2hM5YR2LoIDMP6kVRjgR6kiZwkNU/kDTnI1LtIFkOrqCmVLBt?=
 =?us-ascii?Q?981RRA5P1Tk3cpyIZneCZs/oUvavBKfD5xRa0VrvPFIBm1eGdtRVQ/U7RvuQ?=
 =?us-ascii?Q?RvR5aSycjYt5y/vCqe3fG2kAURt6Ejg4ce8chH88o9uU5LPZEJ1r54H4ukgO?=
 =?us-ascii?Q?k4Pie4L+hlPPPQ7NLmLKUqLhlsgRBRcR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TdaHXaOvMzpni73ddgPARCewBSOL+P9yAlL54UlUZDbXs7IH5tGAAhVxTAjc?=
 =?us-ascii?Q?GqT6K5903RnZAp85OhwJ+ZV9M5FYa1gfANg6Ejd1UafZP0D52C3XwOkjJQmy?=
 =?us-ascii?Q?62nz83YIOxZKTwvC11VcrgtjdoIdNkGE1eZUHIYUO00aQkRFrw/NLVBPy+/o?=
 =?us-ascii?Q?8PmUrkBJ0Nm7aDxlI0B+sUI9uez9i/kCeTpwKtwxBt0XrsDwsM268TBfxWPa?=
 =?us-ascii?Q?LOtSyf65OhO3AdT6ZvCXBt01mZErvO/0aKYqOUNlT7aSif2170nRhqv5YsOb?=
 =?us-ascii?Q?z2aYqG9jC5slCZBla+jbgHZK2Gq7K0NlKANVKsUVek8F0wHTDp3iMXJeDw56?=
 =?us-ascii?Q?KuV68ZwLMr7acmFWamleDAborGjWFTcXVLrPYSHdtiESuEkOKXMwq5JGVSDs?=
 =?us-ascii?Q?9om1YgvfcLXJ458Cntlg/GbpRKL00IfynoTXscsaR82W45IIBxOnsIXidw68?=
 =?us-ascii?Q?KSZEd2NMhYkmWUdTzr2pIMX2p90M/e41cY71zcGz7tdA8J6FUlSbQcU2vJe2?=
 =?us-ascii?Q?oOLTPvIK4GpsqzXcyJMpg8ByPHIM1aTq7Ofup5exlI2VdDNCvlFBUQWceL0t?=
 =?us-ascii?Q?FkqundM1JPEFGR45nW0n97AaCx5qVfOJ2j8yyJgp7x882QQRewbSE8pi+k9D?=
 =?us-ascii?Q?dfw4ViAxvxrKUNI6CTFe+rDcCsgRjBXQzd2+4DPmDb9PUNzHprBFDmxI1CEh?=
 =?us-ascii?Q?ID4v3vfhisZdSJRcxNRlm6hty9oo8LUxMSmKxcfDc7Le/joBTrBPetcYxx/e?=
 =?us-ascii?Q?tKBhWSel6rFTebUb73+4xYipR7R9T1VAFmidfZ+r0miwIJwerRNFHGO1x8lJ?=
 =?us-ascii?Q?BQBolThZQsbYhH5aqe1EmgzRmWRRQMbxlrmwSR//XSQrwfDxSoGesup10IqJ?=
 =?us-ascii?Q?d1ZsIqzI2/DEEY6etzPxE3w+VAy51WodQYZfLebCE1k+QSBCreJdhlG71WFV?=
 =?us-ascii?Q?vZ9qc1AY57LYeReCCw/JBKvqmKwa+ErRFZrIv0Dwa0gVzF5qErlH3TfWM5Ek?=
 =?us-ascii?Q?xw/yRHwjbfVbl6PLoKo8NTRxp5FY6eyZDOLODsbLtC4o0FIH/XCmQnmmzgc6?=
 =?us-ascii?Q?ZCXdj+znjeYXf2E2EaLZYWGtvD/hsSVLJi+kNdxlikKxJl8agVvaAnX6tZHC?=
 =?us-ascii?Q?2/6sbSo+3PWUfW1mUTDeI11QyiEgTeCu2Rf406vIfVNgpYfYkqXM7ICAV9MI?=
 =?us-ascii?Q?Po+fcEuRat1OXjqaCexF3uW/WAcYgfKxZyoVdLDPIKlD/+7GBqUwlQY+th7S?=
 =?us-ascii?Q?kny0xiLTuNRyL8FAQvibyW/ByLzWTKr+vNLgbR55pCMvzJ+ZtmX8OL7yfEmD?=
 =?us-ascii?Q?XCD2SCJBmz/JUnLzq40nmhkPV1LnG5R/H6cXsaxueEkdDIIphhEob+2rMr3d?=
 =?us-ascii?Q?yg6O7ZkVXRIetu0sIRHsvJ7MjZ5LlvfLAZJPKS/3bmcc1Uu9IpsuBKU67Od3?=
 =?us-ascii?Q?HkZQg2I91GVqL2NoJmnNtOtDGZszLlhh9Qk6orVt8d9NjfpJhp8ZSUG26EVm?=
 =?us-ascii?Q?UADCZFeFvJ/zcMQFTEmnwsMz61In1A/tV0NEMbjlIAQS2GdtNtg4HxXaKKuQ?=
 =?us-ascii?Q?zOUsBVlU6K/OloJTpTzryibP9kLKhuLD5ZRwEHDM?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5dfae3-74f3-4628-ce4e-08dd313abb93
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:50:48.2254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AiI8UQXur4ou2pLhaxPqv/BRcvU1YrIOnIGcQoydhGp2L6QgrwA5IFfaC2ay287N7Svif4zIq2Yy6LK+me7Wjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

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


