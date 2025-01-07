Return-Path: <linux-input+bounces-9001-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FFCA041D1
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0CE31888DAD
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6591F9F63;
	Tue,  7 Jan 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="SVFN/g97"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E733B1F9A84;
	Tue,  7 Jan 2025 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258643; cv=fail; b=FD+hEpdmGMSW4crcM+cTB1tE42aOZPd8RSRpwyIHyXPOdNSt9+GBPKU6MK8zqpcP1oYU+/e00q/9ISu0TLwZaKUgvYdwrgXxalB1aJXPhdCmErn6EKgTfO7mUeDQOjXgWncozfboRAKDo5p7He7ay+pmUi/m73B3nxSlka5FFQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258643; c=relaxed/simple;
	bh=wZKztcSCxUa1Q0/2iO88ZANFu8JTsEu5QBy5/sq+cHc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N2ZqQc86ZzZHyiCr+5oa0SylUi7aYbuVTK8AI2p6dhW5kw1y9UC9+KX92JDJq5yiNMoywDK0XaluwHmM1P9BfhPRPXVrXISr/12Rl0kmkoCCK16J/AsZvU11UTJY0O7Wx7+NS8SGUPQtOKyvmV2askwOdjcMomNqan55urr4gGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=SVFN/g97; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F23z1+Fkfaxa33Dzjfy5W/BJOq1Vs15GWDV14GQteiOvLncaEUxFeMckwSemydjVX/SWiQ4PjpcvUklN7FYocOdXRXGExCsqckr3iFDY+RP5mTqzSh7LLhc+qeYiPL2sTot64LnzKvVsrWdDrDpkh0yl07GhDEGKrnWK4hv2f1E08N0iu/FH8vpWd/PZs95Qie1Iyt8ZB2L0D7A3x2UNtwAl0UYegI+NYxSA0vahl/RXsbbg7DhqgE04z/D4dJUetrFb9L+FpgAyVSpd3OO2n5Lz8xdMKwgy+TJG2SPwsXdvDn6GiA7rD+JfsB2z5pn1auauX89QyT1lHiRFcswnQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EdIlIoIZIKlDFiBC7W2CODcO88jqW/eEFkDLvDhehGk=;
 b=pMRVXuyFqZHdZmP2HsI94KNX5y3hQs+aCNNrYOY5vgyWgLqsxDdOz+8acp114pporTdYLc9j7MFUFjRWlXm5bZoITIKQ9tjZVAZTUUtG2BaUsxfa8A3FmEHWNAi50MafH3fx22oKGwfOqXoQntL70cfZalIXphQXfpPIf5PCHIhgQ1OfvKFY9STSj/k0S0e6NxMLdb7pQ2uqxwgfjSuh3IbjOVLYrz05RmmxjvbPvca9CCiqRwVK2/lPEuX/uzgWMt9PtK0+apEX2h2zreadeuEvFmSkQ/Ilb+vy3C8FSrG+saeTWlNLR3BwoCXskU+tS6o+E3blotpqQ+X9GTiEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EdIlIoIZIKlDFiBC7W2CODcO88jqW/eEFkDLvDhehGk=;
 b=SVFN/g97V0Ha96GLwMUfoAzvOh9RhEMxsqYApil0VUzDmwUnh3e+eoa12L2QhNC/iruWPnBk6DsPHJcwRNQEPwkseTttSZkYonaN5cOm2zni2BX2JR+NAPbABg1lRsBSpTG0t9Uyku/9jVHL58zqzom/dq6V2mHzLcR2prtdIwWuaSsdEswyB5fRVxra3IZYDCvqcb3mEW9RlWVdFYmerpM0HAI7MZpt0JV6DUSObGuFILtwjbcmTIE241/b7BTINdZG7zSnFzG0hKEAt/M6Pv23u1eZSz5dLv2gYGlJdp7+CSolPt0W32BWgOgRtZLnrENfWAdDeDDjr5cAzAwpyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by VI1PR03MB6544.eurprd03.prod.outlook.com (2603:10a6:800:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 14:03:32 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:03:32 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 7/7] Input: matrix_keypad - detect change during scan
Date: Tue,  7 Jan 2025 14:56:59 +0100
Message-Id: <20250107135659.185293-8-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107135659.185293-1-markus.burri@mt.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::7) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|VI1PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f2bd340-9d65-4363-2f92-08dd2f2411e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qvri4j3t2n7nddTaPMn6PZb9VxyMQdQq5JTM3ZsFheVRhssqbRXF/KIHEaAK?=
 =?us-ascii?Q?70daX29B+WNq8K1oaTt2DG/EkLRy6aaGHrzVgyUm1tZ8NlbgGnsUADr9AYt0?=
 =?us-ascii?Q?a5GfmN/KLmFFvdHkFKRq0uVgMPIJFWcswkSqoWJZl6qQvrtWHlGtlXPGFNXX?=
 =?us-ascii?Q?WQpRaHcVP7RpkmMDqjO2PJn229TptSocEFKn/swKAEozfY5AjhAUVIODMNPF?=
 =?us-ascii?Q?HeWJKg6lOq2XgxYKS1WAPz+dMmferBPh6bkKEWhHxnRRnZPD6TW9WTM3PVPs?=
 =?us-ascii?Q?Kwnoy+2DoJc+9Iy3DWXWY7+ADQqx9J/lQVgl7nmmgCk7Jv64z+KWhBeqn7K2?=
 =?us-ascii?Q?FGvR9RA5szywgP+8aUtcu/4Ehu2NCfdwF8tK07KDwwgnDKGDMi5RFTXLtYxo?=
 =?us-ascii?Q?luvalkHfw2gEfqcQrZ+02/M/gleP3LrR51p6WyGoCqAvmXoG+nLkEr3LNOJF?=
 =?us-ascii?Q?GAo8sLPvMEBC/3CI4k+qg7uBe/24aRrRsH1Utlm1CQ7K3yMzjvXfOkuZXpZn?=
 =?us-ascii?Q?kRhhx5LeT1AL4CRwr9NMoWqqdFqhMe1/ihBidiZ9EhXKErMpKCgCPPcLAqRB?=
 =?us-ascii?Q?qrPx+mYhRApyxC+SxLv710QIGTfQKEirKyiHOvW3fdqRi8Nsiijgboz3ULjB?=
 =?us-ascii?Q?M9ALfsKYesUWcOjPXf8Jzv1xD2ZUDXpGhxjVC/cgyHfqPG0DhaDJp4egV2kd?=
 =?us-ascii?Q?qWSe4PZGVYO2TTKOoK8yxElAoHNgFqG14XRs9lcug9A4haN/xZDtOwCeIDqK?=
 =?us-ascii?Q?oyxsD7p7D19EeSyt5CX8CkzArKpKAqo4xbjGCIKgD3HCPpCMIl3sXpiKdIZ5?=
 =?us-ascii?Q?bXtfA6FBuwz5HYGoT1rWs0mZTNsAREVvKMkFB4WHkZYMn1q64SpJYHf00RYZ?=
 =?us-ascii?Q?X1rgWaDlmoRqIy8Q/8jXKEE7vA8aWfuk92HmSs0QcyYuNINrQvBjQNLLyVTG?=
 =?us-ascii?Q?+rlvmqcTBBWXJRViLePD0L+nZBFpXkopb6oXjHFpaGv7PFMCqLxwOcuY4qAu?=
 =?us-ascii?Q?oh47sRlteYL77Z0ooc8Wteq4q0kcaGTvuh/TielxZZ1sUW9JuSINPTpF93Jb?=
 =?us-ascii?Q?kGev8VmcjU8xk2HNGZG6jNcu0sutHsVtY5fNVQFOQmQKRCvkOZdC6NHLY72c?=
 =?us-ascii?Q?bPVWKjbhFa9qXWhxv70rS59TOl+Co9XBFYiEeU0bPA5c7AaYrXy7Amw2YeW6?=
 =?us-ascii?Q?rhBTaTcnfzvPbHpqtK7hbnGAQq/F7UE6sHYauYgGSkIBVzTpuqo2VsGqAU0V?=
 =?us-ascii?Q?wzrRIEPlqpXhD83UyC2fnXiNYulO0PC81Gdbim5JMS4/3RzbTxSeaabs/u66?=
 =?us-ascii?Q?nBzU/zNn3WVjDuBEZmGKQUAlvkvoF9z9gZMAHr91SUF/4VPb4d9H/VOUXLvv?=
 =?us-ascii?Q?/zN6AAvYZpbbnap5MDflSscDbqwT9bYn2zKtghwFRr/uZsm9yTpYM7ihkz3r?=
 =?us-ascii?Q?rYaZwlpPIAIosOzhCBm6ofaDWPR1sskc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?znCn+JRiEemlprdGv132SqNS9j3nB0gCixpzlaOfWTCMCQCB43CWkhS0sBTU?=
 =?us-ascii?Q?6TT0t0a6yeITQBMd8yN+WYza+627v6sJtGfzftD0IbUjZzn8S1d5/M0i4e12?=
 =?us-ascii?Q?mN1RQk9o9px4bSINajdC7kUf35eJbsJB0ZTLhJEMp7XiTVclxCEvufbaefYg?=
 =?us-ascii?Q?CdU3u0lreyP68DfjYVUZiGlmPG7WaOLcI32pv1cXQtOyCjPed3nYSYFd00kG?=
 =?us-ascii?Q?tsprbgU5bnZFfMW//EQpxVZWXX+dc9W6knPcC5DRfhDRJeKMpSQKeog/XnqH?=
 =?us-ascii?Q?e/VhnIQ932FSc/GjS+wvFuc67KNpv4Pk1Pw/4p36Ci+SRT93f6IpqQYa2XRg?=
 =?us-ascii?Q?Wf2+2Mzt24Jk8KEiVQo8zRAkbwGYxcL+87gEcBbUy2eoWFp3bGP7KUqTB3H+?=
 =?us-ascii?Q?Qhui7gUF5YuspB8PU/EznX4SZA018336N7tudKuC90c+kDteMLU48gcaUaIa?=
 =?us-ascii?Q?Rl39GDogmV60QHzblesGGbTpFe4TLGcTrqg3rz5R7HBxU+pGe7uRTP0xRpUl?=
 =?us-ascii?Q?sizYH1rtwkqWXG2zH+hu6qIUMUIYNFatVCOeu0iRz+DgT+pI8yyfIQJVKZq+?=
 =?us-ascii?Q?r5kQRUpF8aahHpG2yB5wCTfES39MlkuoG7zYwZTdCAvKLQThqKoWxhqW7obX?=
 =?us-ascii?Q?8g/TRK+HYEgj3zT/MAHzFxkQfHU8zxdbn6PBsmzKpkTOLQJxHcWhtuzWLQwW?=
 =?us-ascii?Q?f2aXK7xlCPh18oWUodcwfGJrnXTA4iQD/EJ5etzZFzAp2In0UgZCeUkJnURi?=
 =?us-ascii?Q?I25CnIrfCGK99xRpYDpRsVo1ouHo2Y3sckLmkle49vj6ohqkYxs2RrSIsiOU?=
 =?us-ascii?Q?ZL9ZE+3S7SOcdnmjl/1q+G19axScklaWLzJGd+mkbnN9gdFJ8FOLzrIYRnuO?=
 =?us-ascii?Q?Pf+Xw+DNeB0sz9/HkgajTEtO9PO+GlpM6/tvig64h8QWOLhBNJJnWUW6ldrA?=
 =?us-ascii?Q?Dh8/dryc4YkSwuHd13fI+rHR2KXI/F4nO3VAWNuIYhGbNaAaigNQ3Ay2Sd+w?=
 =?us-ascii?Q?/vnbrZzQyRWtzcWjQmQ3QsvoaHjR0WGWP2tjpU95XE8MvwRo6PCQG15MjJLT?=
 =?us-ascii?Q?Im9+nIccWf0AAy7z2jVQnKv/w2T3wuuy+RlvbvreUdAaDA9nNEPkxecUjnh5?=
 =?us-ascii?Q?4F6M+ilXAkrQh4nS8J0oHLmnZijAtFyAjR3aGoeSZwy2a7XL+WFVaVm6c4GY?=
 =?us-ascii?Q?XHWW1CLA+/gcVKm148xnRD7ZKtTSLSzkFwm5uSSA7AyP7Wcxug2X8pUGnnJj?=
 =?us-ascii?Q?RvD0BdEIlRUU7MXHJs3V/vpKamQC6XOwU89yQYtd7Qfz5BW9kS9SHrR5zzIA?=
 =?us-ascii?Q?/dKTE+7NItI1hl0r8rZDZor42JGbKm7L9jfefd4Txi8uRWrxjejE8Y7dFMfb?=
 =?us-ascii?Q?eoyuJqjm7p4NG3IL4cpfMku1Yuyt3tGS9/b32oufisjrgBQbYnGA10wTP6fu?=
 =?us-ascii?Q?SE7XotD9lyNSEjfgOQJmIFFS99fMNR5RKBJfu4XRRnZL/Z0C2Ay6Me2LWBLg?=
 =?us-ascii?Q?m0FsFdN8bG4ngaQidoZaTS8H/nup1R1Ig+Wk43woGKFJbpYTnq31cm8xF0yq?=
 =?us-ascii?Q?skTaH+iu9W7qoIN3cNUVvNqhRYLdM5yIaMgRplvZ?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f2bd340-9d65-4363-2f92-08dd2f2411e2
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:03:32.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WJXdlJhSfuFPGzV+lAHFtLro03/teUm5HqkHBZViMw9hCVxOnMtdp+D8NPX3Ouh6FkuUpv/qsNcY/UpRSi+xJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6544

For a setup where the matrix keypad is connected over a slow interface
(e.g. a gpio-expansion over i2c), the scan can take a longer time to read.

Interrupts need to be disabled during scan. And therefore changes in this
period are not detected.
To improve this situation, scan the matrix again if the row state changed
during interrupts disabled.
The rescan is repeated until no change is detected anymore.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index fdb3499..ddf2672 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -125,6 +125,10 @@ static void matrix_keypad_scan(struct work_struct *work)
 	const unsigned short *keycodes = input_dev->keycode;
 	uint32_t new_state[MATRIX_MAX_COLS];
 	int row, col, code;
+	u32 init_row_state, new_row_state;
+
+	/* read initial row state to detect changes between scan */
+	init_row_state = read_row_state(keypad);
 
 	/* de-activate all columns for scanning */
 	activate_all_cols(keypad, false);
@@ -173,6 +177,19 @@ static void matrix_keypad_scan(struct work_struct *work)
 		keypad->scan_pending = false;
 		enable_row_irqs(keypad);
 	}
+
+	/* read new row state and detect if value has changed */
+	new_row_state = read_row_state(keypad);
+	if (init_row_state != new_row_state) {
+		scoped_guard(spinlock_irq, &keypad->lock) {
+			if (unlikely(keypad->scan_pending || keypad->stopped))
+				return;
+			disable_row_irqs(keypad);
+			keypad->scan_pending = true;
+			schedule_delayed_work(&keypad->work,
+					      msecs_to_jiffies(keypad->debounce_ms));
+		}
+	}
 }
 
 static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
-- 
2.39.5


