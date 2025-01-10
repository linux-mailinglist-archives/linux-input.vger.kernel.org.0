Return-Path: <linux-input+bounces-9134-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D5AA08707
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 06:52:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B9E8165FBF
	for <lists+linux-input@lfdr.de>; Fri, 10 Jan 2025 05:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EFD206F09;
	Fri, 10 Jan 2025 05:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="kggrkIbu"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2050.outbound.protection.outlook.com [40.107.22.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EF52063F1;
	Fri, 10 Jan 2025 05:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736488275; cv=fail; b=L1Ngm2QcUBra+n2djDk+MUFeyIAjZM6utdqEXs3lY4pqs05lBqGvHKlNoZkRBFuEUM2EL3FjKSbWI2R55QVkR1Iwr9dBbS57elsK+TZG8qM/76lOz1at3mTLscAKkaBJBbYpmkiqarYALXwGlq9ClxGbevRoN2sOTMw0PKWWOAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736488275; c=relaxed/simple;
	bh=3HfJPmPZlLjr96yjsjXdBwID5n2TIvRXiatVPf6pTWc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CRochKReBKrEWxaOIE3wS5Pr0M5nuxbQ/tRdHwDPBNB7qRT2ME6BSLwXmqZ56awSM1MLN897y6kEORdYWvxEykZ5rBOgAmL8HP91hDD8xrs6gM8KMyDj41O+Q7q1H0ZlR6D/RMgrbhDFwm6inSykolrlA6uqxU/7yE4tDpoZHYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=kggrkIbu; arc=fail smtp.client-ip=40.107.22.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtftXbNhhBF5Ovm5zIt4tEIowsR3yYAA1Lw6sa/3jTACGxSmJDfCLJL0BpvqvDDOF1+KGfjHpbSu2hyCBzZRhJbbkSQZl6rRZTXd6nDaBu9dFjS5Bnubc19Q1vmg/nOg9Zwtlpk39qoSY2GEbE3WCgvseZmq+h4p5NuVKE7DHfqfAHA1kStTDY50C9r+qCbISHpjg7Vst0Wdm/UY2gZTwvYMrxgSEBaWN/Q/Ap4qvMdNmlhJlpLIbJ46UuEJSKnnvkdtSKUwX5+Bh3OowkSUWU6Zz3ewI8XsYn1iAfxUyH36dvwdnM0RJkI6HWe387GZFuScEps3ARwUFDxnNAjY4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhRkqoYDusx+RseikZlwjhJSquSZ4oL8edKb2jNujMY=;
 b=iaRCCgDqDYUby0Jl1YPpEHZlIeaXgryYZFKlvi4MLs5BGyf7CgdsfgzDdvfgcexMl5nDiodpCXnPq97c4gySc6kxN8uElOloone9mynv8T1mJqdfzoLA7BGLZwW8+a4P9di1Te60OTKRbPH7ASBXO9UN9YFH3NLgog24EeBTgWZ5i9Ob34ebNaQLKlAla4ryS05Y7fmLJOAqsY334jbn08FFuhjV6rqoCSUEKBIPRVQjFKUWTXh6v2IeUWTo6NL+W5aPug69Jw+Li5lhxZeDPixohUvw3DinhvMWEfNtNBOKHV5e8h41fjJN4OOyt58nGaeTP6gUf8CC78HxrQWvZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhRkqoYDusx+RseikZlwjhJSquSZ4oL8edKb2jNujMY=;
 b=kggrkIbum3R+sXmeenL+FJi8FaXpAC5N90WJf/iBYwVYylkKvLigyznc/7ntFcBd8/AIMb7I/Ff8Bm6wUM3xse9DscuQaqiCe5Fbh1Tn1jLfoazaB2xd32b2C3+BdJVLILHvRkD8Ygm4tNabHco/hNhzC83qq9QJdMOiXiQzMMrt6VQCoG0H1Brufet9QwKTnHaFXj4deBGaOgVh37lsFGqGdog0WN2gQ5m31qV70v7OYx050ASe4cxZedBzELAZ4c+Q8ujQTP56qIHzwr01g6dOQLGEjNiFPUA+K66mP+Z+0dZM/GGd8K2xlUsAfaITMptjQXlxxAS4PvvkZhevIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM7PR03MB6435.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.13; Fri, 10 Jan
 2025 05:51:11 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8335.011; Fri, 10 Jan 2025
 05:51:11 +0000
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
Subject: [PATCH v5 7/7] Input: matrix_keypad - detect change during scan
Date: Fri, 10 Jan 2025 06:49:06 +0100
Message-Id: <20250110054906.354296-8-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250110054906.354296-1-markus.burri@mt.com>
References: <20250110054906.354296-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0037.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:47::19) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM7PR03MB6435:EE_
X-MS-Office365-Filtering-Correlation-Id: 61588810-f65d-412e-006d-08dd313ac962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2F8DowvNvwCFtOlgawNN0LOU9JNh2PD9FB1PD+FYdnM8vnhmTBt+DQSVVyjA?=
 =?us-ascii?Q?vWMKsfjaFMj0teiTuZfnX7ap6Wua2FlaMTUN/1heG3U2nGk5oV/wU6eIl/5D?=
 =?us-ascii?Q?5gI8N6aJJlLu+b8FAJHqtSqqrNOs+PdYDn0LoPodL70iDTULeaAsI7rgY8hP?=
 =?us-ascii?Q?0Q+kQg4ea1f0RaWX/kY2+D9YpuLRaiaH39SJpWuYpPE2eKhUjkDMoz0CerKI?=
 =?us-ascii?Q?UP9q0HxnP7azjZS33ps4wKuTXy6fcVwzMQjtcWZL1rkMy/vHc+vNNssQhwC9?=
 =?us-ascii?Q?41EGf9+7JofiFHv5e0Cq7y2ivYoDTtI0QRbY/x1hu3JR8jutwgYXbWnS0Gug?=
 =?us-ascii?Q?bnAr1TTKgQIfW55f3vqbBbrqZvX/JRHd3XOqrOijrrmD3gKTv2o2Y5EHszkV?=
 =?us-ascii?Q?YoW+m7YCFrNwyTDxdrauX1ca9MmaclMUItux701EJaPYJbArm3oiaNkF2J/9?=
 =?us-ascii?Q?teDli8EpGz4N2JQoFiLyw/45ZmzHSv65EHQWJ8IwaiQdrdDpLb4Tly8J5pO6?=
 =?us-ascii?Q?0I+EvvOukWs3nl6fbFrePyQ25y/oir4YVrJKsIKezKkrTjoOjA6KUGGfuMwc?=
 =?us-ascii?Q?T/LJDTnafwc7L1tysfhIXlcaPdJNAq0BHoc6sUS+Gj7Of/CLlVvoXZWXmyL+?=
 =?us-ascii?Q?vFTvl9W4bAAfQyWGRVhgC+9WNeBgcGVk33IGPy/Qj9HM00HJfrKBVwKkzVwU?=
 =?us-ascii?Q?l38UZj0CUud+pkR6I1r4oMQis+pPjIQE/qIj0SZ+eTQsT38uxyEg2ciTVGc4?=
 =?us-ascii?Q?7+GFpUEechlcUR8i31CyHfrknIYmwFGpGNKL33OoUGcxhbTsrT28bIhrxpKY?=
 =?us-ascii?Q?Ywhjq+WxDLp1EXzOOH2SPStNYkZq7X2nCNe3x+TDyrdKiEet6JZOTQuUSLhJ?=
 =?us-ascii?Q?Vk4arMOt7G9DglnYz0wyOIzB9NSUsb1wY5S5XZsk/jOwd6w+Oa4mKs/Y4pYj?=
 =?us-ascii?Q?Q4p0ULTtrvsY4sAwrTNHDk/vl4cY6Tl8R8TKseO8bG+6g/5yLEtTjK4dXzwS?=
 =?us-ascii?Q?XD9DTW1BBjxsASYaRPH+RqiBs0TQDj3bylSkdO63fNJ+nzhueXGyT3/if8ME?=
 =?us-ascii?Q?JKgySu/JagiuMGHzATmFngVzo2/zbJaPbrIgBT3RHkf4/FRhpHBIYu0EFznd?=
 =?us-ascii?Q?5SgJOPtyU0kUy/nr7GTDEss3V5PV5Xgy5hP/8UXamdQZ1CqnG3Apd3enXuZ4?=
 =?us-ascii?Q?qHWfKj89T4cdhDpYwn5Knniy/HoHtlJJb81WgTBJKL/8KaKWXl7haIIbWbxe?=
 =?us-ascii?Q?WoRHvzfB2WYDV32W9kOW7P/UiaqcA3x//3JBbnoBY9Xf6xI3VaCLRvJKo0uY?=
 =?us-ascii?Q?YidcHU1IDtBfWWb0RCk3P5cqd92UeTLlmoHSpiUqvwmMi22MxIepR6B30wxJ?=
 =?us-ascii?Q?k0bG4IBOp3UeO7LZUAabIT3r4gsXR+MP5jnKfoadrBEHMmWD3tU6yytZQqS0?=
 =?us-ascii?Q?LZz6UoGBCYHabU4U8aCiYUlp6kuMIOrP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N6c/VqX1yBO02Qprbqc4ls+6Ho25L3WPzmc5Hxqz7H6HFx8HxCXy68ge95vx?=
 =?us-ascii?Q?om3fG8lDciNtzExsMkcls3SILVQ0fUJB0/LhGFMzo4hZWAPX+IG16mC/TBkQ?=
 =?us-ascii?Q?6tA2yPekrJOXIaBXK/fs7EXbW0SytDozWLt6LJk5OpVKRMtEM2/4MLU/hXar?=
 =?us-ascii?Q?PTGA3A3UpukODhPZP06p/oGkC0/gJ9SeWEfpSS8EI0unYVzyfBrYvBQdRE1P?=
 =?us-ascii?Q?FQez0Q7OPQs3KJHBoHzLHvvOdZm2FFCBWKgCyZcvhvXVgI2E1DIZJJUmhfl8?=
 =?us-ascii?Q?TtGYeiPb/kuAl3Ki1gwh09g56Fx1DrdTHLPARS3wzI+49RkylSSSbFBznBOg?=
 =?us-ascii?Q?OHTdPG9FGRheYBnACwp5vPr6z0NkYfDy2ROfxZA3OxCzGsYCYiV8pkkXrMv+?=
 =?us-ascii?Q?p2VBgC/QvLNxjqH5Xsn9ypXnk+96UmD8nHwyBGAJIaHxgsYC05HE/5+0r1zc?=
 =?us-ascii?Q?3BBZnJRX6kLHYmp31Oa7/tCGEwrI5gfGgKNo+CRp2ej6/A1/aDGkKAWFA0is?=
 =?us-ascii?Q?7SCnQYobHiL056n+weW1DuLjffQcloyXXT8gnOxJxqGA0jK7GSDFyDo6Wykj?=
 =?us-ascii?Q?rua2EXXQBi/Xo0+yb3D9Orjjr6E7WtT6E64RCtD0iVCqSF3YkCyFAmqba6u1?=
 =?us-ascii?Q?RDTtWHn/ycS6QeiM0lzJIDkJak1r9fqr+bXzrmwgHRDkGItdXUzlarOKxOop?=
 =?us-ascii?Q?tKt8l3nGLB4avFvfAs2l9YRwqbkJzZDz09iw4xfSbGhoSQxeu2GYrqjOx8yJ?=
 =?us-ascii?Q?B0IORutkQaa4Otv+bG/7rzGgti56KV85Jlej7qhTFz1R6TQmFf2PjJFnvsi+?=
 =?us-ascii?Q?xQepEIFNT1fvo42fJfGYCIzGHtyotrnIOZHGIYadsvkUNf1EPISXx2vDtWQ9?=
 =?us-ascii?Q?51A3VV+gQ0j0707r+GI30fRzoIilGREaBZXVPd7/vrHZU1Rw69B8XApx0lnQ?=
 =?us-ascii?Q?3V8JejdwHYih0PryfimsyrKoy31YKfuSS1Gevoj+j6rXhsxPhhConR8uuT9z?=
 =?us-ascii?Q?bQFf2777wLWjFcHKj/9HdQyvSAOmlmdsBhDH7ZkSw9xmZyt2olxI2SLOKjqY?=
 =?us-ascii?Q?OrlS/3UyxIjMfLVMoqHloOV1+YoTQf4VTab45MOGPKK76pblvZDYnTFJ9Rf+?=
 =?us-ascii?Q?aHicHYNHDgnGApwn/SPVfS7szREJNsBaohKfR3t4DH49Ay9DHf7zrEgMKqWf?=
 =?us-ascii?Q?yLSR3xu2efAyW0huwSsQqEiTPG6sWlNZVpDG3IEaJ4QYjqnta7RSJiCSFkQT?=
 =?us-ascii?Q?YhnJz5xNos7OKIqK3VZA42v8kJJ4xAACdQ8IsoBo57XvqPtqf71EOWkhANfV?=
 =?us-ascii?Q?7zOuPajXLOfLs0wiIgc9Y3qmgY0VnxhZ1qZQaO750zMjdJRsmP2L4MuBdHYF?=
 =?us-ascii?Q?XBjuHCBqR/agXrebzTF1A8Th4mEmXmKk4GPqjY/D6d5bnpPvnHkOMDDsVu6x?=
 =?us-ascii?Q?7xDGRSJUoHagb7hKRT9wTMwEErR0500zTBoDv9SsQAWbwxVlYkohnB1h2nZK?=
 =?us-ascii?Q?7G/1eKtIcjn1b/5S9c+2vJxVRrVpScoMSTSbCM5esCcb/kgBXvk2e14h0StD?=
 =?us-ascii?Q?yS/tdyjASbAlObj6R3JcEHD8oV9yCQrE7X45Wbr/?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61588810-f65d-412e-006d-08dd313ac962
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 05:51:11.3947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tztMLGTwd5s8VCyT3u4Z0DftigUhrC1m11i2wFsoWm2rK0YCXLmsQxwYG0/ILI2HiVf/ezW04Jgb3otrp4Y+3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6435

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
index fdb3499..e50a6fe 100644
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


