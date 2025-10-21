Return-Path: <linux-input+bounces-15640-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 14305BF8B34
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 22:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B854C4ECDBB
	for <lists+linux-input@lfdr.de>; Tue, 21 Oct 2025 20:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2991C2773D4;
	Tue, 21 Oct 2025 20:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZjnMKK6g"
X-Original-To: linux-input@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB7C27381E;
	Tue, 21 Oct 2025 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761077997; cv=fail; b=KNOcVlr3m7l5ef5aXdDyxBFgeTXN8tgmwRqe5qiWpLQ4gmTA77FIi4S/uS1/hG8DECz+hrCHLq0clGXjlAqFkx7dREJxW804XuCALbHf71eoS01o8szkeWyxOj5DUafWmBhRNrcuKuKksW65dck4thf6IlcShKrda2l+eiQEL7M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761077997; c=relaxed/simple;
	bh=x5yv9yCCn0FBXTohxg0QJWSpE3Oc0yTjNuaeukC1gCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nHlZ6SZSugJU9XcUXkOQF5dWp3My170ISOAdOBdst5ZhbVbIB/POM+FY9WKdvSxmeOo0j3gm5VLwI1rHFNTNIzS7CnArkrx9mcy9TotlUxr5Dc+WaaAOS96mmgPJ2mUw80C17ViHj0jg8Tn71Y+CRSauikw/GKlHd9Tvk4aPqG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZjnMKK6g; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bzx7HZ4bQunZ9GCSC0B033AfJWksZ1kX1M2AP7AR6xad9tYYZZZfCxRg7zeSXAGqKslcF2XSmR295AAU994+J8XbhJl6lmaPhp3belryEndMNMHKyEOuQHV+qsYndBHGXi08emTngxa76wb/RYQ5otp39aNkSHzeBReNPN6Kgmw8e0KI4VLP3kMpL2YXbU2HcPBANwdckYh40NP0A22OexdXa2lUYS5cID9mmaOzZFY5/TTqhp0XLJ1TQr+Bd8XddPcPmG7YUzng4VIfKx1/peRqmlv4CxZK571rpw6GHUSEiGXMzDd4LyaNnjHWYmoLbfccWeUu1cpyLA8iuePeQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S94hvKnAaF+BUMi+/zn2RO9xFZYwuq4g2Y6pGJ+5xRk=;
 b=fVSP+7e9t9DDG7MhwUBisf3XlSfwrIBwJTE36gWTAPatauYjnG9xoO6mzyeILutcks7W3JOy6vEZsdJRIkvN6ujYazRC15CTF62lY3CFvybCJDJJNSh/D9SMOGEAG/2uLbfDxkHeXw2V0uvaJO+j91rH4RmFCAru/YOF/Jcf9kg25pYF9wkWyYVOrWW8quYnIKBg09sWY/zIGdtMBTYZFsvPdxDxBmow9/X/IXa9/2AHPhtaBMJwb0XU+KJ47RHmMTYnnKAaAJj6bmJzfhUxIWRBt1kttKSmE9PzSDFsCCVmyMoQbBjw7YYbPLlbdCjjDZ3RcE6g67/V6yPVXjGArw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S94hvKnAaF+BUMi+/zn2RO9xFZYwuq4g2Y6pGJ+5xRk=;
 b=ZjnMKK6gJEXlfi61RxrqIheb1PDGJmKYj8OyXY+uJqY/q8WYik0JDXueA0nHNHCCoz/gSnxKJURwL6M0p1mw+E53xxk7AiNUYapnTqTXUi7XiTG8t0ks2TTmEH2ARS2POEppe2x1o/KOpJzQMQChRUuFmeUkkh63zEI+RgwRx6YZKI6XwTYhmQXrq7trY8Vk5FM2xPLTQVwTZ4EBVz8+dBFKzVcn93gS3MnL9TFRYnp0sSYbX8oxzJ9bJQB4XQRAYJhe4CjC79ets15wTkDgr3KazyFAPvH4Y/rRoHGzjXUKV43z/XamUAhdQHHzTIgN/tfwoedpHXG+ZorVV4H0KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by AM0PR04MB6995.eurprd04.prod.outlook.com (2603:10a6:208:18e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Tue, 21 Oct
 2025 20:19:51 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9253.011; Tue, 21 Oct 2025
 20:19:51 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Job Noorman <job@noorman.info>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v4 2/2] dt-bindings: touchscreen: consolidate simple touch controller to trivial-touch.yaml
Date: Tue, 21 Oct 2025 16:19:18 -0400
Message-Id: <20251021201924.2881098-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021201924.2881098-1-Frank.Li@nxp.com>
References: <20251021201924.2881098-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0008.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::7) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|AM0PR04MB6995:EE_
X-MS-Office365-Filtering-Correlation-Id: 7708d7f1-9f4f-47da-75cb-08de10df305a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|13003099007|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hTUOBF/0VGI4Ya+kAv1zT/Lm/WHQZ1i3HEyBEhSs1kwT4r8L1j304dLLFRqX?=
 =?us-ascii?Q?KO5/yDi++lZu64/7R0dqoAI+JHvtJ9gKXeGrYkn26gwNGJ/URDbA636qmM/x?=
 =?us-ascii?Q?+QkuPx21EBtisOecLiTHEt5QW1uNdk2nik2s1BMC/dJdxddl3cbi9STWm0of?=
 =?us-ascii?Q?wNewBrlZaCh8bLxK4RreImygp/90R7FjBX+NEgERMZzfBE8Z6iYpiFC4ZyJa?=
 =?us-ascii?Q?habrMECVKD20GTNp9xYRzBELF4/sOs9fFj9esTyyIrYjhgINx0RXQxrKoJue?=
 =?us-ascii?Q?Vzzx1aYTcsuyLwgOXluwqhZiEE6V6WarKe0nk18sNDLv09UFPL2oKQbrlTiM?=
 =?us-ascii?Q?/6PF8iejKnT7X7TtriUYkeq65Gl5zddNoarJg3VrORenLGiXlqcV0BiEyCNr?=
 =?us-ascii?Q?+ymTvMtykHG5T22sg+cT5+qBYV/cnVSvXf1wC4M1d1V2UsWN7/HlUjr3XZ75?=
 =?us-ascii?Q?bRHlgItgETINcoPE+foEOhuxhWfI2QEd4MnswOwkh/OUWdJtfg6Q0PPbwcS5?=
 =?us-ascii?Q?LEvE/RW77a0cwoylevJ/tyuxq3aNq1jjcekBbK8Qxm1ZrSBhlAGLeSye9Oaz?=
 =?us-ascii?Q?Dc9LrKfpxT6Sn4NSMQTq2Lx9XjAJ2UU7Sq5Jyi+5rgqPOrCk2WXnuWQQo3+O?=
 =?us-ascii?Q?31OASys0dV0Dx/wx2pRRe6JNE4qRMAb7Ds0LR0ZEXp/MezLw3AK+FZzRyN6o?=
 =?us-ascii?Q?Q+xCA60KGvb0zmziUgf8ZJrI73gG3LdF7AsmROD+d2NNcoVvARNfHfuOOK74?=
 =?us-ascii?Q?CXdQabsZPdodKKDKMQR6OYM8lUkHDcmUVwRZ5fDffu28DdldwJGUvN6nbE2m?=
 =?us-ascii?Q?SAvJGh6+p0/YjKQgyENPucTU0fKO6k1QFOW57Bss7xYOCdTmU43CX/lOrUAM?=
 =?us-ascii?Q?BfZBtW9JCd92mcwlT73noPXcpBR07FxcANFMxA6tYsBCmXKPeDLd3GdhswsD?=
 =?us-ascii?Q?8LjaAHd33Pwfb4mNf8ptx923Iharqlubb5iANOVkE1DCcUEQMMEWcE9RNzpp?=
 =?us-ascii?Q?0jeM5rKYkSgFCOw1Z3rZuGdOdTci2A/IAK9z/IGFb7xuS9670A06qFyQvdZJ?=
 =?us-ascii?Q?GN9P2BSHhxspY/YpMuuXxDW1+BRWYzhzkpM9DZYpXuNCIyi3i6QNH3yNpAKp?=
 =?us-ascii?Q?Wk/nCy50P/dt7VEl1yfSFTXLwRKb8uofThBglAH+4o7EsSjmCCkBoOgF/D84?=
 =?us-ascii?Q?mA1OCH8mbVsxK4kZOTFxc06xzkgkJ/53hzsWSgc1otyvZEfLn6FeUiu5pr+Q?=
 =?us-ascii?Q?9XaHiRF3dc1Mmpk6y2kGFTiLd8pE87JiUiZc98UsknADIYDxZiF4rRyq6Iiw?=
 =?us-ascii?Q?ktcuSZbkZ+4eJJi3u+wR2dWBUOXPgFEGrEnpBle3rNVqcJvva+Q9tzHbJElC?=
 =?us-ascii?Q?dwcZ/Sc/jZdnRxmM7G20oIZondwYqpzon8rFh8qdOly3JmDm0XS9gT8MZkYv?=
 =?us-ascii?Q?Jx2lcqRdznptl1AiqYBb/8vaD1j61sTQFopVW09wuSvT0dM4oXmZnmLxYhRy?=
 =?us-ascii?Q?74sDTQTUro+j5u8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(13003099007)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6drbPpHIclXSIQ58fK08lM2SOEpOWO0MNTysssGdwcPTM3Nk7uWKs7oNfIup?=
 =?us-ascii?Q?42f1f+z7wvroAD0tX6/JERrVG/GDPUMW/968/eHbI+BGBDLzYkhdi4v4vkZC?=
 =?us-ascii?Q?jJ9BZkzY/reb47kHfWIZzeC4GMb4z4LQcir7ovaR6fTxoBjt42RVLjOT+HIo?=
 =?us-ascii?Q?w2so9O80hruzKU7+atKAsQktYUOT842KLRN9MrXVDTUeOI9HNNp2lv8y7C3v?=
 =?us-ascii?Q?rXxjZqLUhQgo3FiICPm1UpqWId+1fM2Wlr/w2deC+BAEvkFq5zRs6Zr/qwUB?=
 =?us-ascii?Q?B3MrzQEBM7R6UiWEnZq9l+Kzp3y0vANnH7vZQJouEpGCxzhLEyW8zEB1Jmbd?=
 =?us-ascii?Q?D48Ex2Da3ncjZSxJ7blKTupAWn8jSXW/UoAb9XvTyFgosXHXtIlE+lG7OCP8?=
 =?us-ascii?Q?wcHU6tPy9LQrsaonSH+cy2T6gVxpvA8RuPso+EjnTjgeKSnTBwBQ+eI6JZ7Z?=
 =?us-ascii?Q?dsyBZhzptHxJXYJNq156k8C8Cx50Ik7iauyliMCdVbxz+p6vjpqPpLinVJbe?=
 =?us-ascii?Q?HlGpB8pGXns45zUPv4OX8GK1SZ0rhDTcHnEeSYFh8uIpdSCtsfFntb//sed+?=
 =?us-ascii?Q?J33SAjuTt1CXwToO28Bs27Z/WtA5bWlq8RfApYORcSoFsGK2cc9M5NN50+IC?=
 =?us-ascii?Q?2aRAZZTuf0UzGoY7YRZ6nKsIIc7L9riv4C73u6uSzXeeahTQbPEcmj3Q2KoI?=
 =?us-ascii?Q?6knZx1npilY5Opa0T1RH9hgm9zgZ6AsSnDWp7w1ojqBJuQLJk8OGeqcKdKX4?=
 =?us-ascii?Q?Y7n7j1yfzr3w1sq3I9Mi9WmZEJY12f3/NFS4swG3de6UrXor3F3+qVo61j+V?=
 =?us-ascii?Q?5VVmUXyMalM7bX9iryMoMJ0GqIBRlwlnAZTVX/2iBMoHLehKYchEWbjrsrA1?=
 =?us-ascii?Q?Ymp8OA1vJVULA7W9w9KPZWUqLxx0axvNIIpKNEbkbu2QkiksbH+gqUt/r3dT?=
 =?us-ascii?Q?/sZl8cU8QYdFoxX1QncTD9ipLygUucJz7ATe7bbA6GZYSp0374+CANu0bWN0?=
 =?us-ascii?Q?JX/3h29wN/AN5Yqo3YLAsh7kDJaq87vf/KQXlk16yRZy6Dolw6iME5bMy3eQ?=
 =?us-ascii?Q?ULPx61DhoxIJlhp284QeaubG9dO7I7k7KQX/dl0dSbZor6ElooUgazgaC9jI?=
 =?us-ascii?Q?qbIwb/PMuCXXmhCTB1MxxPW9xazHJz/OZi052XdM80QOd/L0buigbz+sx0OU?=
 =?us-ascii?Q?hgJDpFTlSKLRkW9jaxBfFC42RZ5KrMvPLYvfHCA23XOznklHwI8nFxiOr2//?=
 =?us-ascii?Q?7ie81lT0Q6lQ4AqjHiXOpxWHL50/bdXsDpspjPdmxRaMA+3DVnLwDp+nbHXZ?=
 =?us-ascii?Q?tN5C/+t3zxCeFZl6tYsuBQjghI+ct19CeIfG2wqxNfrNiuaRX6Om65IYT19J?=
 =?us-ascii?Q?YWwKWazdikLOw5ESd2yPPDrggk9CXRl88Gd5Qq5hQQvT3QFWJ4NxoVmPA0oa?=
 =?us-ascii?Q?jRa8fykXKRtxSsXfXSVt1HPXk7Yr6saGvbc+1XoEhFNX0wB+ymNS2TcaLYLk?=
 =?us-ascii?Q?LN+3xXTk+Hvv7oXsuIDMQcJFI1NPOkLW/hF9Fgg3sYCCisXXhMF2Qdk4ummE?=
 =?us-ascii?Q?1D3lIyIwda5qewV6GKQKLIiRUQjM7JCtzmoAMilr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7708d7f1-9f4f-47da-75cb-08de10df305a
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 20:19:51.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b4jKNdZNC7R0wyl2i0LR4KAQQN5k1meRJo1o4FEoFknixHzuuW669rqh21siU6TNglgPY0r2oe/V/7yfSfRC4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6995

Move azoteq,iqs5xx.yaml, himax,hx83112b.yaml, hynitron,cstxxx.yaml,
ilitek_ts_i2c.yaml, semtech,sx8654.yaml, ar1021.txt to trivial-touch.yaml
to consolidate simple touch yaml binding to one file.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v4
 - add Reviewed-by: Rob Herring review tags
 - rebase to next since v2 already pickup.

change in v3
 move more files into trivial-touch.yaml
 don't add rob's review by because big change
 prevous discussion at
 https://lore.kernel.org/imx/175937443731.2982292.3723741722041625819.robh@kernel.org/T/#m35cfaaee8239b7a9aad3354b80de5f44d267c2e9

change in v2
 move to trivial-touch.yaml

previous discussion
    https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
---
 .../input/touchscreen/azoteq,iqs5xx.yaml      | 75 ------------------
 .../input/touchscreen/himax,hx83112b.yaml     | 64 ----------------
 .../input/touchscreen/hynitron,cstxxx.yaml    | 65 ----------------
 .../input/touchscreen/ilitek_ts_i2c.yaml      | 76 -------------------
 .../input/touchscreen/semtech,sx8654.yaml     | 52 -------------
 .../input/touchscreen/trivial-touch.yaml      | 29 +++++++
 6 files changed, 29 insertions(+), 332 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
deleted file mode 100644
index b5f377215c098..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
+++ /dev/null
@@ -1,75 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/touchscreen/azoteq,iqs5xx.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Azoteq IQS550/572/525 Trackpad/Touchscreen Controller
-
-maintainers:
-  - Jeff LaBundy <jeff@labundy.com>
-
-description: |
-  The Azoteq IQS550, IQS572 and IQS525 trackpad and touchscreen controllers
-  employ projected-capacitance sensing and can track up to five independent
-  contacts.
-
-  Link to datasheet: https://www.azoteq.com/
-
-allOf:
-  - $ref: touchscreen.yaml#
-
-properties:
-  compatible:
-    enum:
-      - azoteq,iqs550
-      - azoteq,iqs572
-      - azoteq,iqs525
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  reset-gpios:
-    maxItems: 1
-
-  wakeup-source: true
-
-  touchscreen-size-x: true
-  touchscreen-size-y: true
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-swapped-x-y: true
-
-required:
-  - compatible
-  - reg
-  - interrupts
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-
-    i2c {
-            #address-cells = <1>;
-            #size-cells = <0>;
-
-            touchscreen@74 {
-                    compatible = "azoteq,iqs550";
-                    reg = <0x74>;
-                    interrupt-parent = <&gpio>;
-                    interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
-                    reset-gpios = <&gpio 22 (GPIO_ACTIVE_LOW |
-                                             GPIO_PUSH_PULL)>;
-
-                    touchscreen-size-x = <800>;
-                    touchscreen-size-y = <480>;
-            };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml b/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
deleted file mode 100644
index f5cfacb5e966d..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
+++ /dev/null
@@ -1,64 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/touchscreen/himax,hx83112b.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Himax hx83112b touchscreen controller
-
-maintainers:
-  - Job Noorman <job@noorman.info>
-
-allOf:
-  - $ref: touchscreen.yaml#
-
-properties:
-  compatible:
-    enum:
-      - himax,hx83100a
-      - himax,hx83112b
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  reset-gpios:
-    maxItems: 1
-
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-size-x: true
-  touchscreen-size-y: true
-  touchscreen-swapped-x-y: true
-
-additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - reset-gpios
-  - touchscreen-size-x
-  - touchscreen-size-y
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/gpio/gpio.h>
-    i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      touchscreen@48 {
-        compatible = "himax,hx83112b";
-        reg = <0x48>;
-        interrupt-parent = <&tlmm>;
-        interrupts = <65 IRQ_TYPE_LEVEL_LOW>;
-        touchscreen-size-x = <1080>;
-        touchscreen-size-y = <2160>;
-        reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
-      };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
deleted file mode 100644
index 9cb5d4af00f75..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
+++ /dev/null
@@ -1,65 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/touchscreen/hynitron,cstxxx.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Hynitron cstxxx series touchscreen controller
-
-description: |
-  Bindings for Hynitron cstxxx series multi-touch touchscreen
-  controllers.
-
-maintainers:
-  - Chris Morgan <macromorgan@hotmail.com>
-
-allOf:
-  - $ref: touchscreen.yaml#
-
-properties:
-  compatible:
-    enum:
-      - hynitron,cst340
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  reset-gpios:
-    maxItems: 1
-
-  touchscreen-size-x: true
-  touchscreen-size-y: true
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-swapped-x-y: true
-
-additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - reset-gpios
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    i2c {
-      #address-cells = <1>;
-      #size-cells = <0>;
-      touchscreen@1a {
-        compatible = "hynitron,cst340";
-        reg = <0x1a>;
-        interrupt-parent = <&gpio4>;
-        interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
-        reset-gpios = <&gpio4 6 GPIO_ACTIVE_LOW>;
-        touchscreen-size-x = <640>;
-        touchscreen-size-y = <480>;
-      };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml b/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
deleted file mode 100644
index 9f73289997568..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
+++ /dev/null
@@ -1,76 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/touchscreen/ilitek_ts_i2c.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Ilitek I2C Touchscreen Controller
-
-maintainers:
-  - Dmitry Torokhov <dmitry.torokhov@gmail.com>
-
-allOf:
-  - $ref: touchscreen.yaml#
-
-properties:
-  compatible:
-    enum:
-      - ilitek,ili210x
-      - ilitek,ili2117
-      - ilitek,ili2120
-      - ilitek,ili2130
-      - ilitek,ili2131
-      - ilitek,ili2132
-      - ilitek,ili2316
-      - ilitek,ili2322
-      - ilitek,ili2323
-      - ilitek,ili2326
-      - ilitek,ili251x
-      - ilitek,ili2520
-      - ilitek,ili2521
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  reset-gpios:
-    maxItems: 1
-
-  wakeup-source:
-    type: boolean
-    description: touchscreen can be used as a wakeup source.
-
-  touchscreen-size-x: true
-  touchscreen-size-y: true
-  touchscreen-inverted-x: true
-  touchscreen-inverted-y: true
-  touchscreen-swapped-x-y: true
-
-additionalProperties: false
-
-required:
-  - compatible
-  - reg
-  - interrupts
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/irq.h>
-    #include <dt-bindings/gpio/gpio.h>
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        touchscreen@41 {
-            compatible = "ilitek,ili2520";
-            reg = <0x41>;
-
-            interrupt-parent = <&gpio1>;
-            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-            reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
-            touchscreen-inverted-y;
-            wakeup-source;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml b/Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
deleted file mode 100644
index b2554064b6888..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml
+++ /dev/null
@@ -1,52 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/input/touchscreen/semtech,sx8654.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Semtech SX8654 I2C Touchscreen Controller
-
-maintainers:
-  - Frank Li <Frank.Li@nxp.com>
-
-properties:
-  compatible:
-    enum:
-      - semtech,sx8650
-      - semtech,sx8654
-      - semtech,sx8655
-      - semtech,sx8656
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  reset-gpios:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - interrupts
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-    #include <dt-bindings/interrupt-controller/irq.h>
-
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        touchscreen@48 {
-            compatible = "semtech,sx8654";
-            reg = <0x48>;
-            interrupt-parent = <&gpio6>;
-            interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
-            reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
-        };
-    };
diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index 46cf833344b11..fa27c6754ca4e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -12,10 +12,39 @@ maintainers:
 properties:
   compatible:
     enum:
+      # The Azoteq IQS550, IQS572 and IQS525 trackpad and touchscreen controllers
+      - azoteq,iqs550
+      - azoteq,iqs572
+      - azoteq,iqs525
+      # Himax hx83100a touchscreen controller
+      - himax,hx83100a
+      # Himax hx83112b touchscreen controller
+      - himax,hx83112b
+      # Hynitron cstxxx series touchscreen controller
+      - hynitron,cst340
+      # Ilitek I2C Touchscreen Controller
+      - ilitek,ili210x
+      - ilitek,ili2117
+      - ilitek,ili2120
+      - ilitek,ili2130
+      - ilitek,ili2131
+      - ilitek,ili2132
+      - ilitek,ili2316
+      - ilitek,ili2322
+      - ilitek,ili2323
+      - ilitek,ili2326
+      - ilitek,ili251x
+      - ilitek,ili2520
+      - ilitek,ili2521
       # MAXI MAX11801 Resistive touch screen controller with i2c interface
       - maxim,max11801
       # Microchip AR1020 and AR1021 touchscreen interface (I2C)
       - microchip,ar1021-i2c
+      # Trivial touch screen controller with i2c interface
+      - semtech,sx8650
+      - semtech,sx8654
+      - semtech,sx8655
+      - semtech,sx8656
 
   reg:
     maxItems: 1
-- 
2.34.1


