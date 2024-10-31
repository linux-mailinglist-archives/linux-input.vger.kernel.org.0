Return-Path: <linux-input+bounces-7788-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5D49B7488
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 07:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A16AA1C24579
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 06:30:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D037413D899;
	Thu, 31 Oct 2024 06:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="bSSB/tOC"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010033.outbound.protection.outlook.com [52.101.69.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1427A15A;
	Thu, 31 Oct 2024 06:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730356225; cv=fail; b=fl2pSIa3tRuY4QKfytcQr7/POCjtus5saysxEfJK5sUAH5T9dkNftiZddDC/0KuRP2Gzd7FedPW+vGsVzEHMgwkBUTwur+sUyONmV/Riqtv47ca6k6RsvzNp1CDCowH1LB9ioL0Lnap7D31RMbt07WH5VQURGShoAveYAiLaoQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730356225; c=relaxed/simple;
	bh=MYMmdM1VcwuBgOTYwMOchao5d9n38PtXS2JsUYADEFk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=GQaiwkEF2zwALww1BIKORYTSAvff16ocYrA6AGsgIeFCU8ENQLqBctdDKDvZuHkUj6QBfsF/W9Wt1+KS2M8WLDaW5S7ekSTmvAm5+J6q95Hsyv325xjqSbneaFT1qbGQYeZRSNTHOFXglIQd7KJMnH/8fmA2N9GwuGiu4PPmRB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=bSSB/tOC; arc=fail smtp.client-ip=52.101.69.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fy2C4Q85znVcXpzT2uB2yr+7yh9TA6RNcEgJvWfiWqLxro+FAAJyhp7vUElu9UXBWSic+Z/MjxZUt7mCDRH+gIVxavYCd3SN63f9UZemQ1CZh5XrhlkDh7s9SQJRulGY9P7ozg6lbTWjfZqG8ghR20r8tSLa+QXDq9ZyWMnUfvMekVCjLK6d9rAq47v47NzxlZKC4S8PKWkhkTEfEcA2pia2lVajZq8UR5C5Yy0OylWKwcOzR+Sa8+dJApqX19vzCyMaLdtUP9RJ0GiOilPSAp2PTI9Wk/bocRstFZe9Mbl3IgTjM9gtikpgve6dUQhL6mskV9oGxmM0HWLYkdMXHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWlL/gL9RSjjpN59b9Ktwr/6InsedDPlLeG8dve9NIM=;
 b=K69bAnS3ujan0tp2qjY88CVlunR6CIStSAIQMp8oCe78vt3sY8Umc3Vk0RyEiJWZRru0I51oy4i9HVeUAjFy8q5NKgAjtXJj/04c61lbpiF+eTSWWwO72JEx531wsqD47lk2pIbNZcT/6W17z5a3xTunoUuFoew3hWnliNudD7d9/KkhtXJKDwIBvqV+Dl89+qn3184beGjYJCWzlzlRyFtnCEQFqrvlhTFhRciU3wSu9WDflqvzesfU+NiKoU9yNOiHHj9NJmKB9znWGAuploaQDhzsLkAfduxjmJXinetZMgYzatWIrzaQYZA6zT2Dlbf37CrZ1H53qEb0JsgtDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWlL/gL9RSjjpN59b9Ktwr/6InsedDPlLeG8dve9NIM=;
 b=bSSB/tOCwmMXtgJ38NqO1VuFhOYAj4JHz2bjQlVRvx3mf0V+ktuHymfWwt5f6jyhIUOleYWz646Gza0xd9SmCMje+Ry9RPWT9Rgk/x0k7LGCJBGpiVu9rU4xaPg7cpyl7D0Knyr92f5ZO7d4dCLpof6W7Xrh8O3g+O7WC1z75UyQBkfuRyjpqnJJfHWyKaT4Y9BKf7mTQbqui/UwgwaPZieos/wXflztQP5EGncuok7mJFZqHBs5djnWeZlJvUbBvW9TC5plgvZR+/yHkHxLlaT9ZNt75Of5KVOxCGYxLKpye1bXHWXJiTudTgslCDZoyj6yoy9GOAIqw+zkSPrP8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by PAVPR03MB9797.eurprd03.prod.outlook.com (2603:10a6:102:311::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.18; Thu, 31 Oct
 2024 06:30:19 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%4]) with mapi id 15.20.8093.014; Thu, 31 Oct 2024
 06:30:19 +0000
From: Markus Burri <markus.burri@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Markus Burri <markus.burri@mt.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	Manuel Traut <manuel.traut@mt.com>,
	HeDong Zhao <hedong.zhao@mt.com>
Subject: [PATCH 0/6] Input: matrix-keypad: Various performance improvements
Date: Thu, 31 Oct 2024 07:29:58 +0100
Message-Id: <20241031063004.69956-1-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0055.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::9) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|PAVPR03MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: da4ab807-382e-4771-20e3-08dcf9757d4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uTg7N7e/QtvY7erCHkCPUeuI6uezNNPClBgBhLkkqYZEQndSwtftfk1qZ7mD?=
 =?us-ascii?Q?W8qzPVG7O84ce0s8bZuLuvxnNyj04cxAYTDnPe0Zfy7U3f5DyrSOswIP3GLX?=
 =?us-ascii?Q?sd7S/LonP7F6R5/JjRWCAVHZNqYL5TZJbyBfB+2RUaOtMV+xqa+ztpubtFP/?=
 =?us-ascii?Q?8ySbrfehbvo+PDUY9VrPqeeCmOx+U5LZnmKJI4SBSEVZNF1fHUwG9i3Lk3Q9?=
 =?us-ascii?Q?/nzUIjhGQ2OQLqciJLfB8RPTsJM3CP9+9KfismL3G1kCNh3zVOoNUQpXLqZ7?=
 =?us-ascii?Q?JfjhvxlcFdi+B1cZssNMk7k2EUnlJ6O+X15ojtLDmXXDkKAPSmF/rZZq4Ew4?=
 =?us-ascii?Q?D6oDtHLRc/usEK0S7qQ7VCAXGqFO59CF1Yl9M7q9SoaqFRjajUmEFPa7w7bF?=
 =?us-ascii?Q?kawgRl3G1yU/UA4Vjet9XumiiJv27NIXGxfSf5SmDhpSSY3oZ3DXqtHeQj1d?=
 =?us-ascii?Q?bn+L+9gpUAVF/xaivf1E4NT19SOIcXVEuswN+sqjj338Fp5xWLGyRrth4aOW?=
 =?us-ascii?Q?LxL0AqXtTaWkj6J3AzTpyzJ9Yl1t7GiFnNAw5SWoV82JlqPhTNr5E+nV2nwL?=
 =?us-ascii?Q?nuDBPdfYkToTsTBGPzWH0wl7rq/NJCLN6gWyzheyDMKbQ22B2i6PZiL6cfr1?=
 =?us-ascii?Q?Ey6J5Y0gkuJ2aviir+7PIKiJA2Au3Mp5BtbcoxHvUjBBV+O1QwlCceDZnZNc?=
 =?us-ascii?Q?K2f3Cyc+zouyqVIHev/Ab4x08Kq3q3WleW9Ut69agdtFRLgzqOnYMRcVb/4B?=
 =?us-ascii?Q?S5hrncgJieoILIIbZMsXcFNDoJ4hMwRJ7JCuRnKOiquv9ImXfGpkoFS9vCU4?=
 =?us-ascii?Q?LMMiPYvR0HsUqR7xFnULqFZg52h6aWc3QGVRGf528ePFaW+gZaZuzAlLftIW?=
 =?us-ascii?Q?YizIL77SsueNgJMHhWPv6sdp6HuGGSykqP6UIbBAS3qJ5tp51uExq3NUgSS2?=
 =?us-ascii?Q?SSgK/PYJZcL0nE+LI4746+mezPKliOwunfRNyUOEPWttcpemrQI5B3RX2uKR?=
 =?us-ascii?Q?Ec41X8Jc6Q/4eHT2P1xMfDdzEFEY7g0ATJ1fZZP96PL4+vBC0Qy7TU2PZYwj?=
 =?us-ascii?Q?DPaF3q0K+FXQi7xZboKQV8h27qKTZAhScFy0wzjeExqRTJts1j34Tl1n2SUO?=
 =?us-ascii?Q?ue6JnvjLVxdOsalNW3eChY5JEbpGGOvtVI1WdKYHoujPkdGhc1nphcKrUkNR?=
 =?us-ascii?Q?0nnvGAY39wohL6DRbD8qLz0xqPs0uidXHV/kP6TdG7cxFsGhj0iKsTl08UkJ?=
 =?us-ascii?Q?EU1nNE9LPYkjvofGXfL76N5pRR1BtnbZmKK7vNbwNYEjKGV8uxZhMrR717Hi?=
 =?us-ascii?Q?VmL8q/5YoqF0brclw/iKWh2W/cQG9A73dchv7V7aVLgjVC4NCmCC1dEHLMM/?=
 =?us-ascii?Q?D71mLw8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?f5i+T854/GrDS91i7aJM/k4TcrSz2przuSw1Rg4etiVdv7d/oXzr0GK/FUPF?=
 =?us-ascii?Q?MNbkp3pV6Ufp5wukDvufi/07PgRxO0c/B9F0WUk+qzBRp9uF2TsdHVp+ug76?=
 =?us-ascii?Q?fALLx2o58Hsru3Um+0vrQAdsx+IamedsSuuJ06gY/9RfzhryQLhODH/o7FHN?=
 =?us-ascii?Q?wn0nd4wuHPt/jOhm318wqltaaGAqHsxjoX9wPzArMaqmyhFYAq/U8GkBZ4XN?=
 =?us-ascii?Q?1e7zMuARL8AOf6Lf5cvWVgaELuon70nkuK+YpULutYoikudVeUqB2UOakkPn?=
 =?us-ascii?Q?+cyc4bsqkimc+GSGj9ki9VKQU5b7tBal5Ie6BgassG8SNAnMxjUxyyHZmF6C?=
 =?us-ascii?Q?XklIDWc4E3d7V0tRgOJF5epBf8RXs18CMCWSwlKCW5kZZoWeH2ou4cOnZ/8G?=
 =?us-ascii?Q?/+9NGLUNjyrcYdL4pqFNQvuo02EYO8nmMaQ4BHzoAMst3zbnhv5j+UCIaUqb?=
 =?us-ascii?Q?jmcXG/wejR3ocJv9Ce7z40/eDk8E74LYCLeKFVyuoUL4AIeYN0xI0SLU2T9j?=
 =?us-ascii?Q?gsjrjNNp7NiBgTPpBzEenBXv07NdZIQ5lL4l/vuIMqVXwschkvyMPZBueCeX?=
 =?us-ascii?Q?TvUYX+0fXFr3qmIXdOF88BB4kIg/yBMu/iWroyBKIz0Ybbeyj0npzX4RnZ8Y?=
 =?us-ascii?Q?+goXEbebUlEreRo7mQIVNe7sl6+TzUSBOW03V8FH9uQdZD4ivFQ449m8mZ4k?=
 =?us-ascii?Q?pzVXnniM67YiLF7wCzcOg6//tcJh8uz8JSIEO7ZDWjrYNl7pMipRujn05yiH?=
 =?us-ascii?Q?uxtFgsHBpoTXfaXLb3DES4i9903kw4GcRyk4xMXcDbvWyKpyAO/Ba9Kdn9yP?=
 =?us-ascii?Q?2g6HbbAdO7fnrXBfJ3oexfOwskrFaSFlO/Cpl29s4WC01Gis/NCGdQ+LlPoj?=
 =?us-ascii?Q?p3DDOdwGS/mnYv6pSZTDr83NskQ576pZjXd/E61HdOLD0zZgfXnS9uIjDQ5E?=
 =?us-ascii?Q?B5FbHyZdxQooJWTJSlK/nRcvArPdBM0Lwum2UsiyDXmwBEtvT7av+SBXkga5?=
 =?us-ascii?Q?YdarLYMqDQzHBA3ZJdPaZKG8iBItlE2nnsgbKC8HVIdERZDJBQ0wZSEjbN+Y?=
 =?us-ascii?Q?7F3YgDw9m193Ig3E/d/QNIygIvxR/a1F8OfSD5T3RNted8sibINeK81uBUlN?=
 =?us-ascii?Q?Lt8bozyQrqNgjt/rK+iPAUvmFRUexUZKa+kbgkWXuBU/6FBD6eTCjJ9UmW6D?=
 =?us-ascii?Q?v+LlLMEoFwL6r1baQkUL2+syuBFoLa8cqMNtYZ1coC3JF0vK4+WbCDL6O5DA?=
 =?us-ascii?Q?htPM5DP4rXaLiVt5IDd2fUbMORw9sr6zOpBKhz759TX0aia3aZ5Bcpye6MDn?=
 =?us-ascii?Q?riDnXgsENIjKbmoOuZakNcthDAH9VVP9K4biIffY76P5TK71iyk8FieCknv0?=
 =?us-ascii?Q?dBBX5HExacVGAcvabVG5CGd456/X4UMePlzW0U2jPMsXO7VcQyWRYZxjpz7u?=
 =?us-ascii?Q?gwzU7Grb767dCrVikPNi8stke6pwqd3SBiMxdCyQmlfeVJZXatODSJItqIjN?=
 =?us-ascii?Q?wcXHzi1V5Xue8ziBciK4SlUP7DkDlF+/ncljo5DU2P7TXOLdYlSAUkjTjbXH?=
 =?us-ascii?Q?2yNNGMmHuOxNa6MI81Sa7nB6ZQnjxWpcQ6++Oj/O?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da4ab807-382e-4771-20e3-08dcf9757d4e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 06:30:18.9637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XxaiXuCzKEyBx+xwlI/YMJi9NHKGjuhfY4MAIMF03VbOPxH63Usq2tcCJs44osKMvUUMQPFaiftrcT7u98+TFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9797

This series is needed to avoid key-loss if the GPIOs are connected via a I2C GPIO Mux
that introduces additonal latencies between key change and matrix scan.
 
Patch 1, 2 and 6 in this series introduce a performance boost on its own
and can be merged separately.
 
Patch 3, 4 and 5 depend on each other.

Markus Burri (6):
  Input: matrix_keypad - move gpio-row init to the init part
  Input: matrix_keypad - use fsleep for variable delay duration
  Input: matrix_keypad - add function for reading row state
  dt-bindings: input: matrix_keypad - add settle time after enable all
    columns
  Input: matrix_keypad - add settle time after enable all columns
  Input: matrix_keypad - detect change during scan

 .../bindings/input/gpio-matrix-keypad.txt     |  2 +
 drivers/input/keyboard/matrix_keypad.c        | 44 ++++++++++++++++---
 2 files changed, 39 insertions(+), 7 deletions(-)

-- 
2.39.5


