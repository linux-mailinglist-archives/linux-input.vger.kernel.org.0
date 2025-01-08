Return-Path: <linux-input+bounces-9067-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE47BA05D43
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0520B3A5E32
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C03271FC7E8;
	Wed,  8 Jan 2025 13:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="VsNAt04r"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2082.outbound.protection.outlook.com [40.107.21.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106FC1FCD0F;
	Wed,  8 Jan 2025 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344000; cv=fail; b=rfy69H3bRuAsvdEQTW212EVPuUBsV3pgbKExCLiT4T7PJVBK4xBqPH2ynTxWDq14KbU7CJuWa7ez55YXwXUTb5y/YTbpHH+D/uETgZGDLOTBZTZ/QwgNCUCeOFS6smpAUcJPJWKQHqKrH9+MjDWoVoK/tlw2gwFrDb9cAZI2BW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344000; c=relaxed/simple;
	bh=PtNfreRErG6Ememj9StS71tOT+sXk8PbQLmN0jyAMB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KPmHrmQbxPI0hr7ge1gOOgr7mHvHvKPUTpUhpD8t4+Q1Nq7iCs+9FV2SepQauUr6Q9RQfxR4jK3i1XvQQSfs3H4Ijwzy40DE62HSLlWO8FQ8pts4Gn5EDIw0NdyXa51bg8YIS/MQaFhs0dp2RmVIZY0GM3q2HBW47U2Z3/0tOlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=VsNAt04r; arc=fail smtp.client-ip=40.107.21.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmqSEfzhC+6y7DQWShF1e17klvHZPasQgOq6z/eokmHiHiH/hUrg5KE7AN21ndMtWnfLWmsf2VfqUq3k3fFcNqwpPlJDRUJEj9XfaQ46bfN27IT5MbA5fxInSeX4JctjeBYjZrBZgBq0JeuD2ffYDuxGavpJ50kQjA26OytUSFvp76Nj/GCf4uidfsEo84gS8+mtbwlgUnI18ua3/055KFooSu+2lQqz9tXikQyJrkfor7LjMQvOmdelnxQj6HXca9Uj8DP0XwgGyR1kvKqq1qMzPa3gfcxI6/ork6DTyP3gPnJmzF4csPvU+SisPqGsw+P/rgJkMVTjDrx0GINfPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqtHxEYM7QcYboLT2+OkN14+SePi3bHq5c+sz15rPdA=;
 b=vd/3+rZ6m+Pbr4MlcBe7OmQKSOCx5vnfhrBVsDBzTM90TUPSkoEcITfIWA6FUsPk4vnERN9yvwvnvP9ubLTEmXSc7SKkdyvsDVnjTjhFCxuaOWc0j6FMY7RVWrXtahmkcbNXNnyCWuFJwaZH9PtjOLtsi79T8X+o9aT9NSMAPjvGSfQLqLrwHVFLPDXCp6a9s2Q+7hQz/U2qVF1kUGgqjivlurLp+eZGp4kwrS7MBja4TZIezR8T+ygSQyhWgD5nNDathNjMC1naaais2YmTa6hrpx/P/4SyJNK74cJpUa6mv/gf8iER38TCQkGmdvmedZKPeVqtqDcw7kpap5K5cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IqtHxEYM7QcYboLT2+OkN14+SePi3bHq5c+sz15rPdA=;
 b=VsNAt04rMFPDOwoaEC8ZKhT8PJ8nX035HskmdYjhOXoeE6apeek7XP9wAVszAReH6yT76tL378rXhR/aBbFHF1txbGGofzCmo+xBVU29jU9PjmKaew+xyRSwtFz6drXaVjZ0+BSzYdGc03mbWYQpElQ0kO8+kU9EoqQVcg5OjClveDbkBGhQLeMy7ACtDwgsDwWuPUz09p4vKXOnypdduiSOOp2HNabWj+gbLX9zJnKxvB0Z9ZkJCJiQCGMm7qe++JCnswEpYz8LQCJl/r1Eqpo1FtdBb9OGOwq/vczfEw6Ymay2K+oTPQjYAnOTbi3OCtdiF/dsHIPv03u5u1Zoeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DB3PR0302MB9259.eurprd03.prod.outlook.com (2603:10a6:10:430::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Wed, 8 Jan
 2025 13:46:32 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:46:32 +0000
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
Subject: [PATCH v4 7/7] Input: matrix_keypad - detect change during scan
Date: Wed,  8 Jan 2025 14:45:07 +0100
Message-Id: <20250108134507.257268-8-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108134507.257268-1-markus.burri@mt.com>
References: <20250108134507.257268-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0178.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::22) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DB3PR0302MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: 921d464f-8dd1-4f07-9b8d-08dd2feadc3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nfAOXqWw7Jvt+aR2Fxc+iQnpADjJpE7Cs+ogjf3+5mY+wpEySvbNp8seNT40?=
 =?us-ascii?Q?Erx+346qatq+lMM+eJKJDG5iJ39abAa6imEk++LW/32tBSy66CVcxx6nVPQc?=
 =?us-ascii?Q?ifYuJM0nr8gEbFZTzel+moNQg17ISYlANQZjA/9HDtcEIAB4yG9wzOS8xZQ/?=
 =?us-ascii?Q?a5SLwfgDiakpiEYtoNOqGbTIOM0LkdT9ZG1VSGNoNfvULA0KebL6RWDRbjJ1?=
 =?us-ascii?Q?8gskpPAVb3P1A8QSIFuk3C6kfoPNlBOh7GFew0EAu6xliA5+mROJrRCet7ub?=
 =?us-ascii?Q?m41ZqY02tJVFRbUTAKbenGIMUVTmlxIVqc/qWiS0NNIpfnw+u+WDkpXG1RJ4?=
 =?us-ascii?Q?gZPMaBCpizfUanXuyDEgqes0bTYNKAjrJLJ3TQnRTEDyt/fiQe5ZxwRVdnfU?=
 =?us-ascii?Q?Mw5M92rBvLfVoDFdfV03NS1BmlzGt4W1js5nJRIkMZzd3yrGVnHpoZ8yPhwj?=
 =?us-ascii?Q?LENxVJJ4O16rrF42VPv8TlL5AJtTc/jWGsIeZvySoWU9aYPBaV6PugSXBAwO?=
 =?us-ascii?Q?MITo8vI2kdzjl8fe0pK/2OF3Oy/wP3LTOlAA8MQjdPD5SimSQgtbf+1pszF8?=
 =?us-ascii?Q?6TFuZ81g78iDL2C/yddB72TeplaQ70kg+5Vo6kcqHmFLRP+SVxJWV+RbgFx5?=
 =?us-ascii?Q?Dw6z18frOn8Ii4lXjyxiXadjLMgfhQqM+DAkttao5pEa3kCq5TK6XajhCZCh?=
 =?us-ascii?Q?l0wjtjwmowD+YjDphbyDL275L2/B6uPuffASSHtiJXHTHLRjsdWjQUVrWAX7?=
 =?us-ascii?Q?a47FCKDuA54vU5lfsC11k81lnKEOM72gS6oDwB+ML2mxkU5X14g7ybxhTX08?=
 =?us-ascii?Q?8yl0Ob3PN/fH8vUAemjGnRo6uL9et71kNVfiVLeNBX7ZfWraLb/I9q0kEaB4?=
 =?us-ascii?Q?1ItuTA1otXeLNLTz81lyP/JfObYSitAGFcehI+WYeT07L6hhWhHl8obXCI1F?=
 =?us-ascii?Q?nXZrJaEpKTT+in4mRAhJO51LidFh+VhB91wIQhmQIFuNkC89/hGkStmSj6Ou?=
 =?us-ascii?Q?5vN59IK6ym3KBZA/dHm/Ay99VJV8F/Jtdf9UN+xUkysw+1aKuFcy5fksiV9N?=
 =?us-ascii?Q?Jtn2F5l0GAX0hGaIwMXL6m/ai+M7wSpheyXEvDpe1HjrJp9Pgc8IGz8YrHbT?=
 =?us-ascii?Q?7sRki8l/MWer8N5r4/DHW/DDGIOt+UPkIZadrkulelvdx4MxTy36zbI/ne+C?=
 =?us-ascii?Q?iLmXhLr/+XSpUWRa75uY9PrZMw+jM9OSf8UqDH98Xw9cz12SaKq6Au4ChL22?=
 =?us-ascii?Q?wFyhSJcO63v3GHYJ7Ww57C7xtnzZPj8bTmM0xWHELyB+BeGlolWexJspxeQt?=
 =?us-ascii?Q?Cd8TWNutG3FgLAUKH4insMIOmO4yh51XTvW/0Iy99JfFUyAlR3WchAQSlnzI?=
 =?us-ascii?Q?5PttdjlK2TE8IRgSgJCTauBtnk+VT2wMlbnNbZYQM7qkmqWo8mrxeitlL6T9?=
 =?us-ascii?Q?7kgqvsezf6jhuyUh0pq4c/IYEgufFBih?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J+R7VUc2g6GEKIb0KCmae08bNOZN/i4rVDIQVW6T+WNHWXrRCIDeUVV8abWe?=
 =?us-ascii?Q?pP4SsPDcoLfu/uSm9IruaXnH+FoA4aZ2ThtU1XWSsbi85oO+hZyiyBYRAYYR?=
 =?us-ascii?Q?dwY/BzASRDZff6srdMicLK8PsOBNxRZY69VocyFOPu5PonFt0N5BV/1T3qe+?=
 =?us-ascii?Q?5lDwb3KKrJ0L2ECPPq9jHO/h7ioGKPnLV6jO6ZzV1J6xDjpKetX6V/xMO41M?=
 =?us-ascii?Q?XK2qiabgWIeYK1BQSZYgTsck5JL6WF2N5cfpB6jTc3P2sejwxhaE3uHTdx7o?=
 =?us-ascii?Q?zYOs4FwtbNfO7koMALmhW1Mjt9OhrSg4Cq2s1NDMHn5Mor6PNyBxFN63/870?=
 =?us-ascii?Q?XGkQMmCTsGOwscyE5pfbAHR5MwixK0/SaUaATGkldUzkq02cXnSKht5BT5pb?=
 =?us-ascii?Q?6fE9Zbr9HPsYu67+OnXtSdIbL3C0tkI0w3UKCn4bthpbTmflSGOblLeCY+xY?=
 =?us-ascii?Q?S3cXr1mWeU3DuoreZIA3eXEfhQIp3F20eDHP1PhjNFiyZz0PABU6PEYMZKbl?=
 =?us-ascii?Q?Ayq2T6FHUNhc8xclOAZYvMRwlUav6c7lX5I/FHRwY58SNgTUeKsjawzouoGQ?=
 =?us-ascii?Q?e4qUvnZl8hG0LLwR0qTRVR0q62j5wVqQ9DviJQmgVVDjAMQ247XTGVWkVl4l?=
 =?us-ascii?Q?ZPdpXhNZJTYpBMHNjXBfsOm4oYoLPQLXh5XjmADLBVXZloCm3tzexcwbP/9w?=
 =?us-ascii?Q?bsSTnVNF+BV00/WDrmbEevFtZ1knzQB9bIVl89tZD17BMgHMaoEZnhLUjH0r?=
 =?us-ascii?Q?KpF51NdS3CBDi6JDLWl8s6tPa8Qyg1G3w/bwNh/MS6aqKFAZCr1ik9AR1xRc?=
 =?us-ascii?Q?XP8NcfNehaQP7xR3kAfeMEagd1fHGNr0vGAOOldnulQTL5Rc2QZ8rZ1pXJIu?=
 =?us-ascii?Q?3cTP5IIzTYFBKmMU2FSwRYgLYEPGhtKG/sSmbyrRjQ4x9ARWAqzjXmtACy5M?=
 =?us-ascii?Q?OT3ruDEu7o4A8rgmycLYcDt/98gopyY32y7JWHH0Eqfzn3VjPsO222HZqrs7?=
 =?us-ascii?Q?EujJ0Cr0xr1F3I7SRGivT7XkFtaM7pTajHsWo6QYmhSlaq3cuLS3nsofmZYs?=
 =?us-ascii?Q?lyrs8RLPdc6ofrRVWFtiKiXWbjqJHd09ABbdCEIDlxWWnRBX0Cbrb/UmUmGS?=
 =?us-ascii?Q?zjne+O49hR0feVlXrJW1ntLa7v3SSMgkYzNclBRz0zf/F6Ln3kLBMuYhsTnD?=
 =?us-ascii?Q?tbWX2uzWMaYiFPrbQLM/SDinfymrT6HKE2TyuT01EXh5cb32CHFlZ5weePKG?=
 =?us-ascii?Q?JPF3r0PUH988e6bHfG3orTZSXQDyum82U2z63J/FAOrh7EMpDnR8yf6sT3b2?=
 =?us-ascii?Q?ZeGa0avI21P3vlni9VQqkqtnODG57KNM1gm/W2pjeG7FFyHP7o3KrHRS725/?=
 =?us-ascii?Q?Bg/bVUlPsqFsmD9/GYUR+hPx7FHxh6HEyGwhR1LMeXXu9tHSP42FNqA61WlD?=
 =?us-ascii?Q?YK9ohOXYj6xwRnrt8EJqf6+wTBeZz1U1yyPCc90GqEjlvtEVFtO/DG+bFs3w?=
 =?us-ascii?Q?Wp6y+dqaSRQAQZtiNzcV+JGCXng0a0vn45uuqfHJkIn8KcjI/81DjWVD+z6B?=
 =?us-ascii?Q?HY/vbK3JJinDb6JqmPIhbZanNq4iZH7E/53WK3cbYUH4y3Xr5G8ojZDujafV?=
 =?us-ascii?Q?0g=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921d464f-8dd1-4f07-9b8d-08dd2feadc3a
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:46:32.1267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UBp3+EDDB/3GUo1VJ/2bNlh5LGy5e9N0RyQ/cTTeU7JDLhQejyHoTILYhh0dEO6xd6Xmf6nREbXxr4EsprP4UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB9259

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
index fdb3499..86ae4df 100644
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
+		guard(spinlock_irq)(&keypad->lock)
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


