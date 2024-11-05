Return-Path: <linux-input+bounces-7874-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F66A9BCD83
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 14:11:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7383D1C224F0
	for <lists+linux-input@lfdr.de>; Tue,  5 Nov 2024 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2331D799D;
	Tue,  5 Nov 2024 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="kj45WaKO"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2072.outbound.protection.outlook.com [40.107.103.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135461D79B0;
	Tue,  5 Nov 2024 13:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812207; cv=fail; b=mjSGcwlhqIO6FQzgssKAPjVmvaxywOlgKfmnMu1KpE0pPDrDnojuD33DIQ2xjau4iZWGfEypFk+0rvmw+NL5hkPn3UlLYTkHbM+U9ycmupypf/5Ii80aCsHe0FdtVV9QbLyf87Bssm7kpqgcGBhvvtSRctNSNhrJVsn6pCbjXAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812207; c=relaxed/simple;
	bh=HlA+B+bMsb9X0pL9Dak2Dxl2qB3bCXfHS/XszhS7Ci0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=udJXnk1r7l9sdbXxD8qnUjHV+14nVvAJ/EHwBxnf6cIaHHr02YqplCf5iDD/zUYIiwygazgE5KSzPHdHDsZ1CySTXgI2RVJ/al+XOCUCnXg68AhYhCnAz/PvvjrhbFiVV4fiZhXBII3cAzbiMKUmusbpldqzMLoFHOQYCfRUR00=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=kj45WaKO; arc=fail smtp.client-ip=40.107.103.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKh5fpaS8Vd6DuSkIsGPNu/E8sK+YfUXdYrl6xUL82PLM786eUfLxB67gAPs79SzX8rfDLtbTU11kLtrJvBvh8qvvYyssKT1+3q8+1h15bm+Y7mEqqo6mAqU+926/1LBnaR6xOERsdJHAVZ/dV9y7eYcmQAg8apFJ6IA6HbH+uPrHlzcpr4IaCHs1a0CskwB1F5LLgR4iS/QYHsrZV0zhREeaolxT6+8hMvZQjXCnu55L2vYQEQxMRMX47hHcxZKBJ7lLyHXLOjoG2fxa+cC3T5+rqVaxj+PUSmIGOOsPXcdgd1j17OTbaTo8v2zgUca5vAzM/tM9H1yy3B1jm4GZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjVRoRtT0K+lfU7ftwM2WRCcaz5bD9GFkcczj9oJ8Rc=;
 b=MyVS22HBnaB0V/xzbpGBajWD6BBGkqIsf6z8vSzs8s8dk0CDMzHjeEUKJpgCkbb9uoN0QQ6QJ133OdBFB8KuVIcOgSfKGnu39V2jkqVkJNuCYQXAxPz+OLnC+a2sAAS3OsC4yzfSZyesZltyfgJjuMbvRRpvaRnkM+J4v+VDolRMPDT5X4tfwHJ6xqHgGT2iZAvmJ/YQZsrEx4zr5Lf3XzCymVQl4z9+bHWfV/Fm34o2EaU8YRJfrzIMbmtugkn4ZZA3wh7PPI1gkQV0tRGJHS1Eepqg3L9a8P4yR/YOyAdUaF2l6pU1HT9IqikAav6IEn9eG/ZrRAMKXLo3NGYLBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjVRoRtT0K+lfU7ftwM2WRCcaz5bD9GFkcczj9oJ8Rc=;
 b=kj45WaKOsaiN737thigcQNeAT1bV8gBTQRKcQrqxk7RQkcy55vKxZgiPdlnHTNzkpf0cLdkBsNvGje1LyUHOPT/Twn/wq1KfFxnQaZDWYUwovXnAfqUiEv0scnxOCBdGkLH7ucVBEmpwJOeZVhan494TdbeQvdyYPVWv0De51ZpmmkGpz2D3m3u4XuCEMwKiFEMVJ986F8BcdHBi9ExExDNzC+1vha6s9Wkk4GZjufmqAdGvUZmp5AOoqvBTNuoZfaHDi7GgUTV0xbQEutGRzR8HOY0M3thakngyfQ6F8a9+ISKdtgtZW3qm0rA239/9ZgaEIylSe4PeSKtKQFAwRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AS8PR03MB8468.eurprd03.prod.outlook.com (2603:10a6:20b:52e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 13:10:02 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 13:10:02 +0000
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
Subject: [PATCH v2 6/7] Input: matrix_keypad - add settle time after enable all columns
Date: Tue,  5 Nov 2024 14:03:21 +0100
Message-Id: <20241105130322.213623-7-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105130322.213623-1-markus.burri@mt.com>
References: <20241031063004.69956-1-markus.burri@mt.com>
 <20241105130322.213623-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0080.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:22::13) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AS8PR03MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 29950423-6a00-47ef-81d2-08dcfd9b28dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PKrdB1iU6bYgq0rUjXR0uZQ6LZd16onv6+JC5zZCCJMglIqtol9aT4LIcWN9?=
 =?us-ascii?Q?P5aiBny9ABx0MQjFsx4KD16L+B1Vk58eDcCPcAChM0R4DP6/sij67/tMw2tf?=
 =?us-ascii?Q?TsYThr3nq3iqiiSZzaLv4fg7JJCEaDmthYT5LowOCk67mtUrYAnNl70karm7?=
 =?us-ascii?Q?p2CwLGgyLCssDQaoGvPrhsvkIYMw8VacjFOthl7t9dmRvQRHC+npsKWADeP4?=
 =?us-ascii?Q?8YLMiUv+66hWitXzrOcF4xPZiYr35vDhdjBe7nbaokxhcVr0bE81R7zlVlEf?=
 =?us-ascii?Q?qzoJSlEtLqBoJtnMsYkN8CTUqhxc6/9w8QS8CDp1TXSjuYhXBpfoaF/IJ/ny?=
 =?us-ascii?Q?p29lP4NHdq3j74r8TljSuS/dRa15/jB873xmKKs8usdEyy3jnQZSDfGC6zdE?=
 =?us-ascii?Q?ba/Wy+HoKuJO4ETTidCXI4P9gJyycF0uZjx9TkmnjrYZ254iDzTNy5t09x46?=
 =?us-ascii?Q?uhhBUCYUvDBzWlYIHp8gRX919uwsTWh6zotidC4pV3VYk/teHgJTwOoryA/1?=
 =?us-ascii?Q?0OflQF2+XGZvvNNRlwllmg/WYGKpBef47a+MXVznj+R5LDQ9bpZNUgUYRiv0?=
 =?us-ascii?Q?NsAkpXsm8GgIY3BtT/XURGcxV50pEk1jZdbxe3gE81h+3nB5pPAuJZn4bE7u?=
 =?us-ascii?Q?ph5Cw7vcxy56IiK9scpf+pmknivqQpl2uzaiAJez77icuN4UTYkdTb+x1CCH?=
 =?us-ascii?Q?KSm/YN1rgCke/HzoQ7axBtrx0L2473mFZPJUVoBExWceDd3Jdz6uOwQLwPv7?=
 =?us-ascii?Q?hnhyEJxeyVMAgxsO4qNuMNQBhA8XtZ84PpoRwe97PptZaAdbqr0u6+IgnUCK?=
 =?us-ascii?Q?jJ2C1Up8kcobTGhbQtLirouPMj+oTuJ1BSdGwP3CyhTsiAel+o0NiqxwzCBc?=
 =?us-ascii?Q?HPDIfELdME+GsD5CCxdvOr5SsEve/hqybKbB70gOf2OFEIGhIYvYdi8+QH+8?=
 =?us-ascii?Q?zbRvoE1OcweC8hF4OEzIzgrSLUrZ6lkcuWKWyF+YklCSvE+FklTm+nKUzXMF?=
 =?us-ascii?Q?YxwzDOp96Ue8NmhNZZxXqyCb/GC5+WkTSnHYQOedZDuo3rqCcOdJV/ZNoh2T?=
 =?us-ascii?Q?wE045HWG8EJDeEl3gTGsOF7Ba51jeJ9tFNZtw+Axmgbq/oriVu3F93rAFxpJ?=
 =?us-ascii?Q?+vgzEm7BTjdPvGqtexKnskE878dSZnd1xW+UfJASZ8ZfZhORmzTo7yLxsF/D?=
 =?us-ascii?Q?Hw2WydfdSXbHEZwUij19UHlUCXtJELiOv14qnjj9fL5CFijjgD7D0EN7IgdC?=
 =?us-ascii?Q?2nK8rnna9rspwroukd9ubFC+jLqscoBYM2UhiWpfaGTpzN1fOP/a4smV0RTK?=
 =?us-ascii?Q?YPZ330P4teITc7bfD8CAfmgSssnpiQN92JW/QjOeMxKQiHqiJrSZPv/iICTH?=
 =?us-ascii?Q?CJhHxag=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pfhU8neAxY65EyQktgnD4m0Vy71WCnt3t/oU6aaa3txHwiau1NZcosHp2Nen?=
 =?us-ascii?Q?1diuaMB2bjcc4ADVEFRLu+kPV++Wey+S8EO2DZr1pjcKA14miy7XnmulIqa5?=
 =?us-ascii?Q?CfiOg4wCPexLA7Bt5hjC6zWtXvBHp+f3eFwnCjNWYEutXCF1XnPF8IOedHAj?=
 =?us-ascii?Q?ZjS5qLOOyBkVyI3pL9++ObbzDpySE1wL51UJ7lqUkBkx6ggxbw58rEcBG0D0?=
 =?us-ascii?Q?eer1YmYmCbit6VcCERnsaBUt7aMcvVPqNTbbs4KGNYXpwRczBn2RON6hPaHV?=
 =?us-ascii?Q?z7k4Cz4lT0Z8nbcgcWYJcCQL8+OtSDDZx92cM7ESgPOTmiqg4YGsOi/GI9ah?=
 =?us-ascii?Q?Em4nuLx6JEyNt+gOQmRak7KaoQiaC1eqKXKhxrzgs8zUGawZPls89TiViYZ3?=
 =?us-ascii?Q?tqG0VgwMDtbcyxQmwkb8x7y9uMyTBOh+KNPNKk3SL1pPhsZ3JYD4KnUK4qxL?=
 =?us-ascii?Q?ZgU8sQQlnHLoiXHDgxL0JVjZp02QRxqiuS36PYfYw5J9z+Vue49VDhUwbqjD?=
 =?us-ascii?Q?bgOnkTnGXWU/gsE/wErrr/JXZoPWrID4nrpUUyRo5RYEbSELgtPg39T0UXaX?=
 =?us-ascii?Q?aRfSXGJacoCrW+y6y/LspGo1xMgTFWDxaS2xDtCD8WP7wTu9zlkztC9TuypF?=
 =?us-ascii?Q?DeWq48YDue6Y7ypt2XeAwCgxNtRSFmrgw/5Ggc7tqhpIeWjH466ZzgijsSdU?=
 =?us-ascii?Q?lx4R3tEMSTcm06HfRyBaR3zbBWOcJ5LAjV1icCkHnP+MPK+qfIPNdBHvDk2K?=
 =?us-ascii?Q?T1QwDpRZH7I6XxP1POgfdpn8oqpaR1+B3sYoW8NMNovsrj2WqdPsLrXo23XQ?=
 =?us-ascii?Q?PH4SS2rI5N03wCTTabQ7Xt3AAi3vF1sW558U4qN7R7ga0FoKGaRpXdKHUslu?=
 =?us-ascii?Q?+VVuPDYTlECJUV5Zsjs2GGqo5RJzjOX/i8cu7yvEqrUz0BwNnTtHQzpiyz3G?=
 =?us-ascii?Q?eV+D2jHbxoGM8L2+hP7saFxYmv0B8sZel05H9dA3X4ybmolCk+i/Rk4YbMYi?=
 =?us-ascii?Q?MtnfmBZJKveaQJNfT4bQXRFTZaFiBxkpc8Z3PrnWCt94ESmizXkV3ur5dwBr?=
 =?us-ascii?Q?nqXPFF298ZJZRBAYgbw9nrCNnxQ8dtUsPnycEQAJTQ/5OwxSjlpR+x/md5aL?=
 =?us-ascii?Q?DLRNo58D3m1usn2Pu0YFfRFuxt/6w+nhEs+jSGyY4dykET7mmZ8/BfPXpEZI?=
 =?us-ascii?Q?KIj+MtmJCvOAS78RdbQrJCErvm13yQ9q6dXihgNkC4/GaNHDveDlKSvNh4hO?=
 =?us-ascii?Q?DTQ8QAPRCZcm/PdBmdoN88JGIaNUQZ06Uitr9ntlNvRY+Dlm5Vw7PzbnHK5S?=
 =?us-ascii?Q?Cl1s2GD2alGm7Ok3L/hMv3R40e6yTTEjOPtVsdUAVuTVb6KAZMSgQ+RhA62x?=
 =?us-ascii?Q?QY7jRcnsHoyeU4CY079JY9s8K0wnx0pb1+95cqbmtFta1ZREqQ/3sHqtGQo4?=
 =?us-ascii?Q?eJ3tEtu8xhqG+ZKIiMcEZTtvqk62fQQYa2qoWKlvdHyCIPq8XYMX6ZpE/PUE?=
 =?us-ascii?Q?WSIQhyVRhZo4Usx+0MBLGalKOMXhMDRzB/yVbknWa+ZOqrxam6XfQf99Yl76?=
 =?us-ascii?Q?y7JnnKMDR77CWntBtO7n4rDgY4bLQskNlrF8scFT?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29950423-6a00-47ef-81d2-08dcfd9b28dc
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 13:10:02.7876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHoQzObrLOJFGrLUP9NQBFhsOLx0SB8P/aLqgvwDjZ7DHBPNXvJribDQRXJ/qolezGUPklh7ju9tQVOSE+07sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8468

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
index 2818915..46873b8 100644
--- a/drivers/input/keyboard/matrix_keypad.c
+++ b/drivers/input/keyboard/matrix_keypad.c
@@ -27,6 +27,7 @@ struct matrix_keypad {
 	unsigned int row_shift;
 
 	unsigned int col_scan_delay_us;
+	unsigned int all_cols_on_delay_us;
 	/* key debounce interval in milli-second */
 	unsigned int debounce_ms;
 	bool drive_inactive_cols;
@@ -78,6 +79,9 @@ static void activate_all_cols(struct matrix_keypad *keypad, bool on)
 
 	for (col = 0; col < keypad->num_col_gpios; col++)
 		__activate_col(keypad, col, on);
+
+	if (on && keypad->all_cols_on_delay_us)
+		fsleep(keypad->all_cols_on_delay_us);
 }
 
 static bool row_asserted(struct matrix_keypad *keypad, int row)
@@ -403,6 +407,8 @@ static int matrix_keypad_probe(struct platform_device *pdev)
 				 &keypad->debounce_ms);
 	device_property_read_u32(&pdev->dev, "col-scan-delay-us",
 				 &keypad->col_scan_delay_us);
+	device_property_read_u32(&pdev->dev, "all-cols-on-delay-us",
+				 &keypad->all_cols_on_delay_us);
 
 	err = matrix_keypad_init_gpio(pdev, keypad);
 	if (err)
-- 
2.39.5


