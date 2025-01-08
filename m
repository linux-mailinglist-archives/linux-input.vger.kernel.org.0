Return-Path: <linux-input+bounces-9062-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBC9A05D2F
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 567B4167370
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515851FCD09;
	Wed,  8 Jan 2025 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="oG0xu3rq"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE91FC7C6;
	Wed,  8 Jan 2025 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343946; cv=fail; b=A/qKOtOtuSD0VxNGI4SHb1jfJmC9a0i50RlOws10eKAVztPvDAXBRJf2DSMnurY4TkkC1+aU6mCwc7Xx3mvWq+M7vWlP/giSIiP//dF6PoueU0hUgvnN+JPScSzyjSn1BsBai2J/d/ZonDkULmIIqXdISHREl1ub5EYaLWEBeZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343946; c=relaxed/simple;
	bh=Xfzox5PcAJY0Vf93eXYbjU2/B3WWS3ocjTDoCwCZ4yo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sYfkdphCe0CZuLOfFqcs6Em8dInrEG0uOBbijaxaIc4E20wH6275On9ik5XxIzZV7soySyJ8+h1OTrouajr35GiCX50MMtIz7MpH1PsNMjHV8PX4bKQLwmH9vyeCK9BeSlWvY7rK6pjE4Z28KhnIU1keMYRt6ugMzYgZIx28OJA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=oG0xu3rq; arc=fail smtp.client-ip=40.107.22.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNP6pkrrGdNpzDT0WtfpWiLZvTTGMxkw3YCoVrvEhjGOt7ffWKRzsICxoecuV28cKty0Oi4qppr6I8KKY1JzCaeMZmjG6Zr5WLBcrQcPR2oj3GTYTb4sKTMKOWvLGmy11oVq7HFlTJ74y73jN8wUQBFntbD+1ERHKgDPHtvrYb9xg/V4OBvyO4mVDIWivSvFhUq6T5FsBM5jJu8mPFibhLkL32w+kdj4NEadjQGeWNk9djUUnYh5EndBiuSm2Qyg8wKFU5l9qV/w5xiee/yF6lBBeynjHOhYpbo04gKP2BMv+DL4GzJyfOZ6qWsdx1g9ePG/JdlWOcKHwbByMz7TSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZI3BvU8z1GIGEddIcbgkXGABPLGMCgmwctzoeViF9I=;
 b=dybXYWLhiy17E0eCtXr7v/aBPrBQHOMWlq6d05COQkJvq0MqwDbx3aLDJOaz4WYYzKMtI1cRXzayk/xH9HHKlgYbM1MjIZAhwrf14NYUorPz3UAsTf+UsIctkSVnyqD0T6v05iCoPS5PDKwVUgKQcXIDPjnzfKFDv1b2U8qd8NLstqUkkMd/JqDtFrhHHSnRGgwjuPm31jNdGd08/yCZk7EDzm5L8/ohHeCtS6s7Ex3zvd9cnDCKiL9hyy4jGXMIjfp4BOOSr7rU7y6u3Fp6COTBolriDQHPZwwVfstMhO5+ew6QhQXo8TwU6izmaz32kTzkKppHKZMdh2Sg2fr64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YZI3BvU8z1GIGEddIcbgkXGABPLGMCgmwctzoeViF9I=;
 b=oG0xu3rqTNhXicxo5y7stYJ7aG1xs5o7aITJ8Q3kFMD0o0bHhnX1JT4pDZDAIN60yX7vEvBrF5p6RnEFx0HnfC7awxRxvPi8sQzQV3lVBJLiQ3EL+8HDAOypVpJzqlEckA/k8baL5KQsLTU49ZXDThM274PqR6mC9Cl4WK3HF1hnuL+1Mm1berAHJiwKow9P7mXp0TWHo8Z1iVbVkTx/Q6ojg7z+6oHqWeE35aKYLPDpg6+x0GVTy9aAgNiMskRVTQYxFgXZraH/k1QwTa9C3n+QrDL+V3EBQPTdG/8YGMZcCX07yQ4FZyGLknCyc9ewdQPXxAQs4as3y0UYB1/JgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM0PR03MB6307.eurprd03.prod.outlook.com (2603:10a6:20b:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:45:42 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:45:42 +0000
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
Subject: [PATCH v4 2/7] Input: matrix_keypad - add function for reading row state
Date: Wed,  8 Jan 2025 14:45:02 +0100
Message-Id: <20250108134507.257268-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108134507.257268-1-markus.burri@mt.com>
References: <20250108134507.257268-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0019.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::14) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM0PR03MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d7b5f1-9925-4270-5b21-08dd2feabe57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rgfZaoWg2gneDm/A6oA1ulqrOcjegUqf3nGvs6ITbzVcVLKAl+RWlqvmulaO?=
 =?us-ascii?Q?iqhAO8F6XDx1OqZb01RaqFZ54LadouHVsxijF6ZerhNEWVHoAxD4/mGXvr7M?=
 =?us-ascii?Q?hL6okfXZOgILru3S0quPHGnbzpuDpl5/sIE6r6UuXzg0kSkX9EunqZMIHHRk?=
 =?us-ascii?Q?XfipWCHjweMFdWQMSnq6B+fu6DPq5ujUdOs37KD1gg/eHlReLKAcnsTQW4p0?=
 =?us-ascii?Q?4IJlUNBdoTE1m8ObjVAtKbn/vZ5K1uw8a4mcohmsGS6Z42FWEKNcMB2xOcN6?=
 =?us-ascii?Q?jJXt4ZMU13V/9PGyZSUgLIbMfgHIMZ7VcsWc7Dgu2bxZhyp+hg6V34UwItW1?=
 =?us-ascii?Q?BbOmzUz+nVdwASBK7+y3L6lFU3zlY08vnKpyEe4SZpwfFr8Izp1La8v036+0?=
 =?us-ascii?Q?EbPhs/VwH0JfzaP0eTX4mbTwS8hWIHRpc+szMROAQXXf1m9CpvW+Tspi0pfR?=
 =?us-ascii?Q?3ICPbCFaxm6JEix5ai0ZT94d0dkqhe5kT/6u4ASM4KmGtu8nDASBPydFOWO0?=
 =?us-ascii?Q?Kp7bUdS6bo+METZlESAk5b6wERvmD4hRROXiQYW8wl2mR6yKAEOONCnv9bKI?=
 =?us-ascii?Q?N5ce0xYYf/5Fkl/rKPGKGhbjpAavKjp2MTiQkjrvHBL7ceZv0lmA1Ha2J+tx?=
 =?us-ascii?Q?xHumphm/8CBMvEZ7WCI6KP7pLBwOVcVKawrvvUq4E3+RLkFXK16/fqnd3hZw?=
 =?us-ascii?Q?cz1gFcsR4A5NlFXpx4XRHPiY1jUgAN4HZ5qA1I0bhb7LmrKNFvp/qlko9OMf?=
 =?us-ascii?Q?RxbHJWejy9bPQAqoH2WWDSaWUtM7oI0YTSZs54WCigiTTch492C2uHKIC3k7?=
 =?us-ascii?Q?cjtSsiBly6Ya77LfIxxNVZ0IEJq0gCsw7EoTwW4ADJ2ZELI4bpYyz/5LIzIw?=
 =?us-ascii?Q?u6/0KbEFy/4yAqXt2hef7r++CMve6UAZbK3lr9Z3pGPoTRItBCJIbOmnki6K?=
 =?us-ascii?Q?/GLYTf3p7WJFq2uLiEQuTDLbORlbl92e3ix4VKlzV2i/PX5c3/uOeBgf17No?=
 =?us-ascii?Q?osEHyT7OV7mt+qFlO+focr/40Qq+Y6wlfUhNUYh1lbh4PVJHrEx5Y8XEBOuV?=
 =?us-ascii?Q?SnDeMIGZ3y3S+L9P5L33zZQaar93WFqMm2rp3prZxTR6SkmpbbrpHJfgrPE/?=
 =?us-ascii?Q?4zF5H3CA+2fYizGZooc0S8cWTCcY2AznnpPFx5FjE/vTwJF9283+jCgLuvUh?=
 =?us-ascii?Q?U1hbue9j0URO3CKfM6rA65gYalJ7KbpdUWFgPe2xkavG4/G8AqDYWm2vppTD?=
 =?us-ascii?Q?krN72LWYKumcxX8Y5X6bGSRSDyEv10KiDYpCssOl77oSl/HuKNauBEsSYYZE?=
 =?us-ascii?Q?YxRkeYn2wZCGYE3Kfyv+V5/o+bgMI99FWpBgnoPkDRZQQXK7CVbpLiWP1ZjV?=
 =?us-ascii?Q?3Zby/VuOPURzoZE5qWj+PihF883itgNQ1xqqzon/nMHN0Tfydtzwt4sRXmsI?=
 =?us-ascii?Q?ggD05bhs3FNd99KcbDd2vAzDXiMbNoTF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Yoh0gs/+z4rqlJ3AGGZ/4KC+/coUR4cN09pyz358VQrAxlu3Q+4seqpQDSt?=
 =?us-ascii?Q?Up6v4v/U5nNTN83PzpGCJeIAhRibiyavywD+Sy3dSjKrKA7e+YvZ2DuAJ4os?=
 =?us-ascii?Q?3/LeXZQWKEvfKum+r02z67BhElceVSh/tENPvPJVrHpWVFNHMQziR5BlaPNi?=
 =?us-ascii?Q?4aopAAZ83/W4keUjybQqn7IRh2xSw8mFMfzxk99ONjFKafsL22+jMMFW73XO?=
 =?us-ascii?Q?fNZEoKofSxf81VpesXtLtVpbu/LLApvy0wWAjB7fGVTiza73Mi8IpIcRdVtn?=
 =?us-ascii?Q?gbcvfk+25qVZ6u+ivpGhM5n0QgJJm8yrQiugia//OvEEIqW1YiLnFE83l4vp?=
 =?us-ascii?Q?pfcIsAagu3MpaQIJxkDgA1ZjSXKJTd3T/iglhOiSu+0oihhNtQU4Xc6cIkZ6?=
 =?us-ascii?Q?+RI5o61gjHGDpOjhXqH9L0CcA3YuTXokJgMaaUQW9IQ2mgUEd0d5qv4E8qA0?=
 =?us-ascii?Q?6zMPmrolt/Jrh6TFxMPVMXlaRyojzJ+JJLOjrlENU20EgmbJEFmjKAfWrasS?=
 =?us-ascii?Q?3Cxi4iyadms63yjg/6hfl7UoRpObPTi/mFoYGkJiuk+QXaJqJ3YFnuYyLV+Q?=
 =?us-ascii?Q?ta0jhY/0ixKv0qudVhJmnysUiIy/dYZqoxv5cwVovWv6rqrvbLdmObNQl0s0?=
 =?us-ascii?Q?kxGQUSrrvRdKIwkpY45K52w4PSXtGMlRjWYQGHoWNzs/6PlkfKo2HKt/L2tr?=
 =?us-ascii?Q?YAvQ++ENqLqu0GwW+ihRhPmkPuRFmJcG+7Tf9s2e18RJhq/vOYpuCBdctYpJ?=
 =?us-ascii?Q?J1coiYSGNbU64bwrCMv7TBI37Bc8eAHeenRSIfD+NXrf6WnBIk4NIMFwDom4?=
 =?us-ascii?Q?F+vYjYLz8VHOVJ7PbzIgwpkyTKf0Sfsn04usC2z2qrHqa9iJI8b30373QcVP?=
 =?us-ascii?Q?YHan3crOIix0pSZYtgtV+REESMSu38xugcnwuaZdXQjdtdz9Kz6JJ4m64k7C?=
 =?us-ascii?Q?rOONFtC154OXckfSiHplF+hDfeAqX4qBxJ2BuAg+glSKcZw30htH2bRlPnz8?=
 =?us-ascii?Q?cyZbl1xIDRCtxIv7ZDbljS80G+M2U7bwN0jKeMDRqtj+8r2GTnyfThD1kF+H?=
 =?us-ascii?Q?6ezMvKmEKQholVnrKqjR4M7KleVm3TYwo4k4SPw4IKCiTpXagyzfPhztIAoR?=
 =?us-ascii?Q?aK3WdFffQQV3d1+HSeF7pjV0ZprFIJ/HL1cUbjgln5IiqsTKF/RE9IjQiCJN?=
 =?us-ascii?Q?Le5wn60MHWzKIeaYbDYMwGDP+eBEaXEFI0usmAWdwFoPI7KtM1dl9FT+LEw5?=
 =?us-ascii?Q?Qxlo0tb1PAVkeG20cYBx5lKhjT5QHHpk3uyCVqRHAFh9T2YAQPuojNNJAlmH?=
 =?us-ascii?Q?4sT0mo3ByWBRuIVljcdId5oH1VGfHm4j6TJP+Y5h84GYIYBAj/lfU5w0zUGh?=
 =?us-ascii?Q?zoMwIuEa5IMYiAQtO5LrJSUnQoVMcbZDQw3hQnYUIFOxXtS7cb+BdlE0sdUL?=
 =?us-ascii?Q?x58p+pNelnH1mnrKN1lXIbOlGz2cvqFPdEmu2K4VDUlEIdzMPCNPkp7mPKsm?=
 =?us-ascii?Q?h9los1ugEJ3k6qzb1PD/bCGHQ2Iy4mOg5IOzJUn3Phi8mvrywT5ORfzu+ZJ2?=
 =?us-ascii?Q?5hcMhXhOIt2t96T0/1yQoJbn5M1Xo3sVqLJtJOu5H0FpcjRgDlTtJA7dSNwn?=
 =?us-ascii?Q?8g=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d7b5f1-9925-4270-5b21-08dd2feabe57
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:45:42.0085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0HEEjK5NzYhWSp8HSx4cbQ+9IbdLcvxstBZr3d//CrKwt4IPLfJZNH1VsRhm/y62dwODH/jG4kNKdJqjlXwnKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6307

Move the evaluation of a row state into separate function.
It will be also used by a change later in this series.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 drivers/input/keyboard/matrix_keypad.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/matrix_keypad.c b/drivers/input/keyboard/matrix_keypad.c
index 5571d2e..90148d3 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -100,6 +100,16 @@ static void disable_row_irqs(struct matrix_keypad *keypad)
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
@@ -125,9 +135,7 @@ static void matrix_keypad_scan(struct work_struct *work)
 
 		activate_col(keypad, col, true);
 
-		for (row = 0; row < keypad->num_row_gpios; row++)
-			new_state[col] |=
-				row_asserted(keypad, row) ? BIT(row) : 0;
+		new_state[col] = read_row_state(keypad);
 
 		activate_col(keypad, col, false);
 	}
-- 
2.39.5


