Return-Path: <linux-input+bounces-10398-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAB8A464E6
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 16:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6902819C0903
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 15:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AC122A4D8;
	Wed, 26 Feb 2025 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="LmlyTE8z"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2066.outbound.protection.outlook.com [40.107.22.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE2122A4E8;
	Wed, 26 Feb 2025 15:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583779; cv=fail; b=PxPywBktHvTzjOjQbzZXcX3myJOrjiNBOxAqMTIghqvOevC7Uw7o+u5bpfcJPoLrbvaxwa3KETF5iUk+QmT9bqsYO1o0mBrD+hbwEA5EJoddAmIPH5qMjdCCFDgNvVIX0n43a0MHJ3EosS4WyoGSFnFAnMmPqpgKkBTGZw6xIOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583779; c=relaxed/simple;
	bh=y2HxHuRFLKn8DTghO+TgZ4Z9JNjEebt+HpbJu8eOd0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b7osAOwwPxKmv2dyr8SdhU3D84PCMH0lgOvrGiUEidWiGArl2VlnkZdBR7n/+4uNs8fgg0jXG0fyExLjx3VFqHk5fPZi0zFL+exEL6u34xjGHiA9nC1PAyks93k1ZlrkiA6SSbC6jIREjDCQ0mqdgVR1/xiglY6AStPH1kiLhBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=LmlyTE8z; arc=fail smtp.client-ip=40.107.22.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osd2usyBVnAVUZsHkC3Wvz2WwaqlpUPnUfWogLSmG4jc006rARvsHR2mv7hoJ6Xl6PY5T5n1ORqZppZbSt+7L9bn822srLjERR12pdPyGClhf5oFdwldNF/UJqCVBlXbJmxlBASEqMEssnKBems/uewxLSSKEkV7rVh0xwDwxC6ayDRcymdfGws8MIqkSRiyNBiAhUQusYrZpIG1iGn2FvcG0ba7rEIKw5We604vsSGeEpd/MmrOWJA7yl3U6VZdPJOQwb42E+W8DdmWTLZT7w5hC1P4pK7795E1esOCPZv0iLfU8J+4bUcK8+rucf0e81FRlT4tbTTgEWog2Fjkrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QB2kpU5Uv0L30YKYAGkR1NVDT6pOy/h1j/mnSrcsLgI=;
 b=yHpUgWHRewerPoPqBOLCuH+Ctre/9lFd5WUWHmowCF6qSlbIp6wwgb+X/0leprdvm4+dTq8cbQkfVuaXqeagA00JeQym4sSeKnbuKoFutnNoNwsyUs+AGe/mn+EWRXqnpTDNuS0lYpm3UNwZRhr5ZeNZ/rk2iSEwQ1HS+/1lY5nUVysMbGnZiAQapuZf4q5B+JOLmvOi9FaUhuBUH4BXMmQ2PI/kVpt9WoFlMqLSf6RC9nC4x7ZdmRW16nWX1lCTCtEOfnXrMXgmrAMpvGwY+aCregjpt58CEf5q/z9+oGDh6NFn2YkwypE294XnkbDQHMi/GJpKFWhGVMqMh4mLAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QB2kpU5Uv0L30YKYAGkR1NVDT6pOy/h1j/mnSrcsLgI=;
 b=LmlyTE8z/iPPPJ1D2xo9U6WfOIKk4xalG8iWJjjTS6ENRNSmDOGMolTkJlgpSPeMJM09Qfit4hB+4Ta/nGnVB5p7y0Ty3rMjk0OQPxVwoM0R2Uqa+8SoKGQnseLsNZHayLr0Hh/ZfQtJrSjfLVm6GUKaDQjbejI5skBz1ek8GTLDNNJCsQYRJrhLJ9/W4aRRFPUbcl7SvFhV4Szl1HeL4rGgPrDkX5LKjOyfwHLsuWadw+IEJhOheeiJj2rVHSdP+yv1MZ/KWl0H6pYVTh01uC6jz/MIVORb21H/OvEuRSX1KCiVhftbk2ujnAOGmA4AB4bmAmr3ccrbmNBCdFAiRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DB9PR03MB7194.eurprd03.prod.outlook.com (2603:10a6:10:22c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Wed, 26 Feb
 2025 15:29:35 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Wed, 26 Feb 2025
 15:29:35 +0000
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
Subject: [PATCH v6 3/3] Input: matrix_keypad - detect change during scan
Date: Wed, 26 Feb 2025 16:28:43 +0100
Message-Id: <20250226152843.43932-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226152843.43932-1-markus.burri@mt.com>
References: <20250226152843.43932-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0048.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::13) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DB9PR03MB7194:EE_
X-MS-Office365-Filtering-Correlation-Id: ac2d55bb-1559-43f1-0b0b-08dd567a5fdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qotn3rrdkhY2QIsOcJJoM8z/7gGDMZSzn1dDmP+fZewBrcOaiMZta+gaFhoe?=
 =?us-ascii?Q?J6N+ctXC25Z6UcLLw8SVlCOy8m+E1m5V4zTrHmQZyXyKqYzsnJXV3sPa/o+S?=
 =?us-ascii?Q?RavEgWRdtSazwAhVrpUwU4Rx8SSi2XFkmECvKsyIudkhusiXrbnTsDY3vKcw?=
 =?us-ascii?Q?FrhC5QnW8+zmbETnvbQfjGb3CWHtw8LGW+BoutVuCbku9WVvYQQZe+OmSTsh?=
 =?us-ascii?Q?h9bmyZgytKYKCiDeWFxbfQM2WJRXGlp/jawVnZwRO+B/QEf7CrYJow+Akdmr?=
 =?us-ascii?Q?SzYwMum0CPTC+LGzmySWvNWruMidqzxedn+ZqLTZrYLdJDtIlMNXEOAr+2GG?=
 =?us-ascii?Q?xwL2ea2hfBXslycAX21ELoNgqYU1RGUVh4BQVlpHdSHQ5QjMcQXgb3iGoGWW?=
 =?us-ascii?Q?d6NFx0qCf/AjVuITLA+x87XEniXvZle3HDjoXnPplQjFhxbgfkzByhsV7IPt?=
 =?us-ascii?Q?o2bglB5o77CFh/ifs1arTrElnoXu+79RrkAYsBMT0g1ERx+HDJUsgwV5+tr+?=
 =?us-ascii?Q?mOL75gxBmr3OHdb69NXLjZoEzsG9htzVCJk4Z39ooXFA+J6JuTYnFkFRnvTV?=
 =?us-ascii?Q?58gMT9JnlJY3N2/eEjzG4Vb5SbTUoIIPDANjqKqnUAZKZ1WFFQp4voy8ZUoJ?=
 =?us-ascii?Q?0yj14sUPSZJ6lrcR8JH4bdo8RmHFTvYxTtoP+884J2B5KnB+Tcz0pRuJk2qW?=
 =?us-ascii?Q?p0djL1ZttG3es5XhYA6wzUiDI7B3m0o2tsozTGSIrrgBHFcAxLl2Ca4Loouw?=
 =?us-ascii?Q?FrPY0fXfwqQfx0V7gU7c/NFW3uVImt0PPwlaREc/WwVHjFo0jEWkqliANYze?=
 =?us-ascii?Q?IcHkf4whO3mw/gcRi561Gg3AIlsVuw1B1zfnAJS7PN2sewFXcLKcWq6lcfcu?=
 =?us-ascii?Q?tpWegoWh3DS8WOw4V6ZrGyturCSnJdBo1XqiA91UpdI/+0kXs/RS+LzdMVSI?=
 =?us-ascii?Q?iZV19xa3Xtdy2tHFVE8v9nnfVyT3NU+KdIFjDG5c2OwQI6+UlmHtqtTzRj0T?=
 =?us-ascii?Q?hQs15jM83JsfWWQ8kfMCRXoZdLBpwfKdf6hFrWcDWx4V++TXD6DWsO0360Do?=
 =?us-ascii?Q?exJdqFZcRV1XirKbFi/zG1RPVY5iQKISUT5sskAY9Ue8XIxh8F0uP84W9Anu?=
 =?us-ascii?Q?HSOAS0B5/x8fj5SapD+RdG399PYp3Sg20cv0MsQ2slsvTabz8VtY9UpSOz64?=
 =?us-ascii?Q?T6c87M8VlYCSt0YqkoL+DN9b554zS7dERUvOhhaZqq95+FOC45TVzIXpu/xW?=
 =?us-ascii?Q?ro6opLvek5h3gpVsVxGeX9UMZtiY2Ynm7EVHatMCCnObpsdX9SXbOowf3tJM?=
 =?us-ascii?Q?K6UVDQ/+LS6gQ50ZrdXBXHAlNJAD2Tgkphi5TZ4/Tn1BjVEWPuWfLncYNUn3?=
 =?us-ascii?Q?bIZQ5VsEOIvqKQHLrHdxCfj/W/dOzgC9+ZMK7Ucqp/mHWFYCfrUF5CllPK/7?=
 =?us-ascii?Q?GqfPTRuRdstKsdR+BWC0cYXcqQ5W6G7h?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Pz8QKmgpU/M5WGrZ4/MdsL/2keESa5qD9J7LclEwTMpSvAEO24vm5VtKFgNe?=
 =?us-ascii?Q?dZSU5gLhSjqEiSna0zmLQyXDIlY60bQE0Pyh8mShFzvqxwq5aS1XDjJDs0Ij?=
 =?us-ascii?Q?9pIzGrG16nWUVo0nBgNGWOXwhClE8VpJ6ZbY421Tr/yF+DylDwImiN7U0f/0?=
 =?us-ascii?Q?tc7PUqIrSKy4huq04/0RVAG/vV9f5wRFV6wf4OVkCRWiAdvU1jrVw24em9MR?=
 =?us-ascii?Q?p8UMP+hofMgYExCH5veOWf19kkyrnFPYVc3yqQlJBht/1GKC08m23FGn2l33?=
 =?us-ascii?Q?sxrjdVz1fcRsxBpZdDzoG4hdQ9ynM37G+8tQpjMaPR/rg9I6ZZ5Ez7fr7lXz?=
 =?us-ascii?Q?L0EJShSPfX8/90nx+OpiNmQJu80TYoz+IQQhMF10x8S4U8mbJPid9hHJl9gs?=
 =?us-ascii?Q?T2bYGNnnYT3WOgEcVBKBJMtyyCtyANvFJZjpHGaKGJA/7fXElf16CAQ/4GRh?=
 =?us-ascii?Q?kiGSCmYEQIuS1wrwTsKRafbhFr6xIYNmQ7+TSpS8pIOqavogRKJm9nNUBzJs?=
 =?us-ascii?Q?UADq3Dm6qOVQ/NRxANhfUtgjwGj/RU2Wek2dW/R9AO4YXhziJNYhAfPG/lNJ?=
 =?us-ascii?Q?/Utgr6ngS9jDv+PRnPKsMGzLFjeMxjh6cmNoQdmY/JGTkQFk1uItWGC83KmH?=
 =?us-ascii?Q?IXDMxaC20DSRCPvSDZm+b8Wa5YNEbev3PSLl6vYrHVWYTV3wRNUhOnkoq0lE?=
 =?us-ascii?Q?1idtjGgpaYMqTtcWb+t7yJVQeomx8BLH94BUguzpnhgLcdullFh9tYbn8j8k?=
 =?us-ascii?Q?S05zeaYX/KTS9KyHBqasGJ5BctAtxEVrjSki8WhD11ALpv3KQ9zc+i1o67RN?=
 =?us-ascii?Q?BnrhPezZp7aEq/X/Flh60SehTsZdOnjdFOhFlG35sX8xpniNEReatZ3QKxR9?=
 =?us-ascii?Q?mj2P/cDTfX+GVyG0AawvBHyEQPimOzWhPFAWQB+HVDMZu/Ltot0XCuWB3z86?=
 =?us-ascii?Q?dTDwvvv21WInELuXtpypjs5NiNxzaAyW3JkwBoAW/nyR7AT696tot15omnNF?=
 =?us-ascii?Q?FFtB9qlFPd5vt5sUoa4NwPn9y2i0GmX797rzBqzliHUK8FfSAOA7Ns+ZVg3z?=
 =?us-ascii?Q?jgEAyhLKomPB7Yj0GaUOepI5EwPbowcN6JH63ropYLBsBrn6tFdf5rvPBxGR?=
 =?us-ascii?Q?C6dRXqc+X4SJtQPGxJYDehv2c9DvDdfPaShmxCu67dO7Y0c68syJjOHMPmDD?=
 =?us-ascii?Q?N7Ey6b2ThV7EeHc/oFrHrLt8eYoDkN45h7uks2RU/0J7VQTapCU3iUrrm/WM?=
 =?us-ascii?Q?mhS3iBy/Uvqdw6smE/rK9HyJfRvDSa8GHGMqrTGjUYxAffCOvttzGoBaeyVS?=
 =?us-ascii?Q?J2gN5dIjAXrRxNqNqsZo6ylDaLhzPhYQsRdOi8OKq1netJIQgREXqd6pSryp?=
 =?us-ascii?Q?QeVMfedfcXAO9/boCW9mjbqWyPuPw+SokFfSx3o208Tfh09oXlWZUQ+ZpaSl?=
 =?us-ascii?Q?uf9Y3pcLkaY5kf/NOkEmX7bY933VGCxWRmxT4b/Ieo655AEaTxBNkLH6cTyi?=
 =?us-ascii?Q?m6Gx9IrcVqBfXhkKtsgmN/8Eu7rTr73uulZ1sx/j9v4Ddt7HvuPRNcfqtpr+?=
 =?us-ascii?Q?BDpcz6fXi1W8BST8ieWF+Fi9s379PIad8aFVLFil?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac2d55bb-1559-43f1-0b0b-08dd567a5fdf
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:29:35.2037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TxgTX8JH6M2MPBrJDoZCavRaumM3ceoyBbuZ19oZb7grsjTxlA+yz21tltSR2+eKG74U8seMIOnoc7wIAMMGiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7194

For a setup where the matrix keypad is connected over a slow interface
(e.g. a gpio-expansion over i2c), the scan can take a longer time to read.

Interrupts need to be disabled during scan. And therefore changes in this
period are not detected.
To improve this situation, scan the matrix again if the row state changed
during interrupts disabled.
The rescan is repeated until no change is detected anymore.

Signed-off-by: Markus Burri <markus.burri@mt.com>
---
 drivers/input/keyboard/matrix_keypad.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index fdb349966..e50a6fea9 100644
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
@@ -173,6 +177,18 @@ static void matrix_keypad_scan(struct work_struct *work)
 		keypad->scan_pending = false;
 		enable_row_irqs(keypad);
 	}
+
+	/* read new row state and detect if value has changed */
+	new_row_state = read_row_state(keypad);
+	if (init_row_state != new_row_state) {
+		guard(spinlock_irq)(&keypad->lock);
+		if (unlikely(keypad->scan_pending || keypad->stopped))
+			return;
+		disable_row_irqs(keypad);
+		keypad->scan_pending = true;
+		schedule_delayed_work(&keypad->work,
+				      msecs_to_jiffies(keypad->debounce_ms));
+	}
 }
 
 static irqreturn_t matrix_keypad_interrupt(int irq, void *id)
-- 
2.39.5


