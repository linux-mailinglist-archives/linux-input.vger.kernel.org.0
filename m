Return-Path: <linux-input+bounces-15198-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F4BB4943
	for <lists+linux-input@lfdr.de>; Thu, 02 Oct 2025 18:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 316D63B0578
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 16:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59FC22673AF;
	Thu,  2 Oct 2025 16:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AkYSLswi"
X-Original-To: linux-input@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4494264F9F;
	Thu,  2 Oct 2025 16:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759423494; cv=fail; b=G/XEyPfcs/Ug8wjodK37xZTWBJ6eqKgT6rSYTAjPbdDcm54/+JA1e1frxePbFI58OiiGmbB8BWTALj/K8vgx/LQvb0xX2yoUG84A3+ZfW90sD3+gpb1rGKDUUb0fQoMnYp5RsijFfVfxo3zvKhmglIR12vOgvnzTjxZP/vaNpyk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759423494; c=relaxed/simple;
	bh=HVqNePVZ9PNNt1h3Xn9O3401sB3qqN+UD3mgaj2mj58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IYVvnGooq6+kyDjgHnczdt5Bw1yU2AXPjOWkkPal1gcqBjspbQp+gKM9RAUSayshkDQPDfC91QsUl02x/8TohaLxiKUINMRdjZwgBbrlaYPk67DDLrhiSA3P+JSbHGyNTBOI16KfpANnj69GovUO+OvqasBPcejPUnkREmMORbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AkYSLswi; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gx0Nl/ceIZ3ysJ7eOvE5k4EWZgC98V0M83eMvllS8Bd8uu7v+ygKmYXR1SxcXGrrL66sNoMdxh8hI4y2D5Pe5b5iceIkdI4vtsNiNEEsX0O3ewtD67jE19nDmsm5nvZaYQVQ281u+R7gkja5NR/XXaBFaOlDfW4F6emprOUyA6iji+m0kc0bgMWRGdQ4R57DG25TfdqmPr23aa7Q7u0DKlm24NP0rAaj1++90duKbZx8X1HenynAhXohXlBFoDKFquTZU/WaUk6UorRnIIzJaXU5iGqqEgCRODvbHeTbE5KTwMBhvnTQ/9lEbakjWM2m97lZSJsCGnW1RvuwmbglqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biuXfVA0FsOVMXf1azuiZQktDz5/WLazm3ziGGRZ7LY=;
 b=VFT5YrTnf0ZbkYgkP4wWKHtmBio+aTrBowAhyuBcT/53+BBbOwvoUPclk5DVru9+xg/haWnBAqC3WukIh8NGA4vnIMKj9eK+spB6T9RUCAeNIgpgB+wcqN1l7GfEiCc1yEf1N7aftk0YZ5+5/2GTFSs7QKfXKHmHDtHaQf5Rbkum+fL2eWYJ7xit0iz7qpDflVwkuySAJZOX4ELObrVpSqxI8ZZrFq8KxHcRTl3P1030w9IdHT3ojVnM2CJlgVrcLQGN4/KqVV4gncGc/bA/4MsA8XxyPPOpY0ankJZKbPla6N6emKRR+51BrBB2itwgd6/9UJSofuZ4ugMJK6ng2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biuXfVA0FsOVMXf1azuiZQktDz5/WLazm3ziGGRZ7LY=;
 b=AkYSLswiu5yq0itSAv3EDrcVfdiceKYVxyZw+dARjTD6VUmZKnGFUV7/uuJwHQJjDplWIwtYFkG0j3niRwdS0yc1bzQCZnmG+s0FAWUt/fvxfFCoytPsv5JUj/ILXtsrrg6PLQ5LO5EhDybYLrvxG97EOoYipDAsYYBueEjs0f8JrQ1ftU4BTV0ngF8eqb+Ks1BukZ9ie7zXx3fcRj/0p1ziCWyhYHYTlcQGVyv8Emcroxdo5pT5AEzcq145mRmICcZcMMjvB5oddIMvhTcGsVh9qNkG68qgpNUO4UW3jbh9YpIUqXtFCWS4hnhE/8cLDIy6CVxCxCULPzsX3r3Jxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Thu, 2 Oct
 2025 16:44:44 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Thu, 2 Oct 2025
 16:44:44 +0000
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
Subject: [PATCH v3 2/2] dt-bindings: touchscreen: consolidate simple touch controller to trivial-touch.yaml
Date: Thu,  2 Oct 2025 12:44:05 -0400
Message-Id: <20251002164413.1112136-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251002164413.1112136-1-Frank.Li@nxp.com>
References: <20251002164413.1112136-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0083.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::8) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|PR3PR04MB7420:EE_
X-MS-Office365-Filtering-Correlation-Id: f6b04153-f02b-41c8-5f55-08de01d2fd4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|921020|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pmd9K22F4n65Gog2A5z9LzwSfRLJoVDco1+0DM9s5XJUxYiiSTuJT8rG7+n7?=
 =?us-ascii?Q?NzMADhQ4lMnO177GcrvDBlPgj8WPzIG5xR5IECcCVF26XDIuQItg0s8yhzW1?=
 =?us-ascii?Q?hWqquHAoL+H/TnTw+z1qcDg4pVdp8lhg0x44Kd9ez5LMRkQHzdJUTF+wt6hp?=
 =?us-ascii?Q?dC3NRt6wJFjD4kdnDL7dNOvSiGcffx/4zWFj1moxVT1zgDLxCsWC5Zy+bxut?=
 =?us-ascii?Q?jA+Z8syez59hEgyRBgipsnyYdm7RtLT0cZ6Tjn78yhCSxnIzusF4aLK/b0p4?=
 =?us-ascii?Q?A101gIVvAihxudYc7LA6UmzlIxD8fcDNfs6AWheDkm87zFhx1tZhsvRjA4Kg?=
 =?us-ascii?Q?/Nf22U4hgZC+Riu4GBHT72jA2xStvjo92d+0vq/pX0Y0PvFOQZU7wRsMxQkk?=
 =?us-ascii?Q?O9R3OC6Z11w6cSM7+CJf9+9e5O/QLhB6ujCqUaoPflL+kfrad4bhzeXtcAQq?=
 =?us-ascii?Q?x/jqadJZVMWeomy7yst4QOAExT00gMhvKE17dJglph+LexbTB2oxE061ShX+?=
 =?us-ascii?Q?wTwY0vEM+vpORFN/pK+iyPwz/s10BFccpM/7/wcMnyIvpMqyVModC9LTEL71?=
 =?us-ascii?Q?ZXrm5sWWbNXzU43VQACF5R3d9tcukNvWRAFZyYHyCtpcqD1kQvVk+XMvlna5?=
 =?us-ascii?Q?ezBaYTkUubk1sdkK/CenMR0CmMKNLUhvtsJe8cLgITa8Wiyi9yiOBUlogmKV?=
 =?us-ascii?Q?jltFB4C0Ug88bj5btBS7Zayhw1zolqgnN66/y06DwKRgaEn75YjTcysgT5ic?=
 =?us-ascii?Q?ghoxzqy3yMcsVgLRknJ2g7Oz9RZu0PMFH/tBLzjfzr5UaJNTkRQwEKo7zDWo?=
 =?us-ascii?Q?11tTCOXAjcNUQhOba8u07bFoBKI1kpG9oYu26MMSEeL2H0t/D8cShFLQDx20?=
 =?us-ascii?Q?ua+0qCa8iOGtzanleCy6eL7oiwaOkhRrpnoB6x90FXGWJgW17Aex+VAYgOzO?=
 =?us-ascii?Q?zcLkrRE1+SyXFz3YnrdGYUncnVHmj7Un8jNCgH4umi1to58zxAkVd6NwDFgv?=
 =?us-ascii?Q?hEy/iYhM+9dAXl27f/AVIxc8zfg5AT2qhPfYZ43ly5apEhf0KQRZPWUA51sk?=
 =?us-ascii?Q?HFLdbtKU9xvpZ9KGVfgymBVDDnpeo2ksIkXA28PwvsMwCdZrHCqpz0YXMS1e?=
 =?us-ascii?Q?nHIDune1a3HOZAk3a8r7pJEHALUyNscBVKuthTAmS/Nq0eIUCk6nvE43qNVu?=
 =?us-ascii?Q?49F52xbBw2HLMkD7vppowNmYlFVXtJF1nL8HJzR+VgzfIg9kSeGX7WOZUv3i?=
 =?us-ascii?Q?fZar/v5Tgcd91BXVKSs7WoaVKSwK6H7VpX5XmnWkxxG+L+YYOPR2Ybdq/AfA?=
 =?us-ascii?Q?xD83/cus2npbfw9C1il1V8rI/Eu5qZPiYwEEvcb+mU8m+HAuNdIM4yeD06y7?=
 =?us-ascii?Q?FNPlNryf3mT3+nwhdv0yvFO3vmefd+K/r4RCfWd7oR8YFJDqaSV1BiVmMYF0?=
 =?us-ascii?Q?9HZyjFKCNilkTDufp8F+RP1DodeqtW/vl1vzxOACEmsdLZ8k0J6qBCdQXnXO?=
 =?us-ascii?Q?JSxlxmJRlmfcsfM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(921020)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Sys9RuQj2BvTSzIMhNZYJzLomL2kYFsTN4ly/vIYj0Szfm2dVkMthYq35MzD?=
 =?us-ascii?Q?Bb4EeiUdgwlwXEQ9ziL9yNLVM5d8uuf/bQADsAoj1ZyMq0uLfek+WTlGpqhH?=
 =?us-ascii?Q?fv7tebp72aqNwIrbL4zQilv8nMCeh0mtxA+8j10IAsZoc0WWgAJbsDidYtpu?=
 =?us-ascii?Q?pxFxs6nMC5vJGl7fVRO5jI5YJbXmYWuaZVChsXF95f0kLw7+JFUDjcZGwZ6z?=
 =?us-ascii?Q?kRXUqozz14wm6NV2rhWhZUspA35OGFsLGItO/xRuWU+11VY1I7l5DX5pkbdb?=
 =?us-ascii?Q?H2HMFYYMe0JI1rvGJYUTp+7Uoc3fz97JkrujnKXAzZC0Nml3M3hw28a15M9A?=
 =?us-ascii?Q?nW/Rhi6pwatWig/cPiE24O+3bW7wTaHe0PvzqY5DV6Fu5RhysmQr8Nlrm9PH?=
 =?us-ascii?Q?Wy5nrK6uD/pue3pXHbsfPoI8SDNRUjadIaeRJBH8lRQd80ukGlyooGsNXihP?=
 =?us-ascii?Q?68y2Oa9P/lzTVUyaUww4eIVMINz4x++9dzWmKUFbzONKvkwOe/LnkwdV9f+9?=
 =?us-ascii?Q?tRgmjipssy+cE2XnFamrRWoQbVJbMN4GeoecJBdLMIM6D7mTVJwiwnUep+YW?=
 =?us-ascii?Q?vSONLJU1LW9yN9qtfGZykjJL/Ubnp+jetedxuTlqY55JxvztP1BEYuMXTREd?=
 =?us-ascii?Q?MNdOW4cGKAefYx7AEENoxKri1fYMLIWHyXCm3NgZbcceiisqpxmeKyiRbneI?=
 =?us-ascii?Q?fjgk6upJExDJcPveYnAU+tYCDbaj6/cxzzScYEPATWZSPfdPzZstOQNNj8F4?=
 =?us-ascii?Q?CvCGZx2syxxIB2ElqWxUCFncNe3m0bm74vV4QZMFT39CDf1qaQ9PiM0qvn7P?=
 =?us-ascii?Q?4eDIsVOSFJNXDPfirDTVK/sGn0dK3KX+BDJ/tmZtlzyFroSHqjyk0CwVkVgw?=
 =?us-ascii?Q?zqsrx2uXcAL/0KiFyUHkCU1AQsrw4gfUGxSo1s4K3KL74XhPtfrtbgwk5PDq?=
 =?us-ascii?Q?GtkGHnJv/POYvfjiXM3FrrMN8ooqwlb6x1fA1yAHkEfsQ60RtNfYv2hgtoEJ?=
 =?us-ascii?Q?1XCIxcnG9uIBeDBgEh50fVfdkau7YwGL/3SP3M2XC32IC2rBXS+0x+sFhHjn?=
 =?us-ascii?Q?GVibnujj8QKtizwyvnO/kmcx35QJOV1tRf4VKZQ9js6N1aSayqJ3XF9MSXG4?=
 =?us-ascii?Q?JQNFOnlZwDsTKuh7P4Iz6fLkGvEDb8wxcl4cBrewM6yzbUhf4UVYRiv4EVb8?=
 =?us-ascii?Q?eE5ti2f/Co0tJ5K047VjiDpJ4MqiEJ9Ns8ukVKbAEObWjQEbfEZ+HjdhDRzY?=
 =?us-ascii?Q?vQwFC6qsUq1R612CM2rUhhJaONUC10Wc4BThwsMbJNH/hMWslErPIDSvJRFs?=
 =?us-ascii?Q?QCJGzBzo0REStfdDKK5ID/dHIM7J34qviAXwhTkt+kO6FVmWCSBrNsPSXy7r?=
 =?us-ascii?Q?KGnQbYfgNHhbVVe4KsP6vi05FfqiGg17IrNiiHVAyffdGgMYw2/QS3YXiy6F?=
 =?us-ascii?Q?NerrdkCejub7xhwKgwujwmuW37+jghzYqtu9uJCA3TU8sfWPO0KvlD+7t1y2?=
 =?us-ascii?Q?88hjb2PdOv9GgD+xuWCfbyxAnT1LICEUTpJ/6Zgxd/LCMzVKMoQADKZSTkvG?=
 =?us-ascii?Q?MTIqvWcF2LZRZQeRsnQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6b04153-f02b-41c8-5f55-08de01d2fd4c
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:44:44.1060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xm1Ml/C6n71esWOTkZ6P1UUL+oDImoil3x76o8g0yNI4MCpAk3EKbttChyJu3dls1Vep+KnZNxpRMxzM+eb0gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420

Move ar1021.txt, azoteq,iqs5xx.yaml, himax,hx83112b.yaml,
hynitron,cstxxx.yaml, ilitek_ts_i2c.yaml, semtech,sx8654.yaml, ar1021.txt
to trivial-touch.yaml to consolidate simple touch yaml binding to one file.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
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
 .../bindings/input/touchscreen/ar1021.txt     | 15 ----
 .../input/touchscreen/azoteq,iqs5xx.yaml      | 75 ------------------
 .../input/touchscreen/himax,hx83112b.yaml     | 64 ----------------
 .../input/touchscreen/hynitron,cstxxx.yaml    | 65 ----------------
 .../input/touchscreen/ilitek_ts_i2c.yaml      | 76 -------------------
 .../input/touchscreen/semtech,sx8654.yaml     | 52 -------------
 .../input/touchscreen/trivial-touch.yaml      | 31 ++++++++
 7 files changed, 31 insertions(+), 347 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs5xx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/himax,hx83112b.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/hynitron,cstxxx.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/ilitek_ts_i2c.yaml
 delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/semtech,sx8654.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt b/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
deleted file mode 100644
index 82019bd6094ee..0000000000000
--- a/Documentation/devicetree/bindings/input/touchscreen/ar1021.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-* Microchip AR1020 and AR1021 touchscreen interface (I2C)
-
-Required properties:
-- compatible		: "microchip,ar1021-i2c"
-- reg			: I2C slave address
-- interrupts		: touch controller interrupt
-
-Example:
-
-	touchscreen@4d {
-		compatible = "microchip,ar1021-i2c";
-		reg = <0x4d>;
-		interrupt-parent = <&gpio3>;
-		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
-	};
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
index 349d1a6687a05..fa27c6754ca4e 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -12,8 +12,39 @@ maintainers:
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
+      # Microchip AR1020 and AR1021 touchscreen interface (I2C)
+      - microchip,ar1021-i2c
+      # Trivial touch screen controller with i2c interface
+      - semtech,sx8650
+      - semtech,sx8654
+      - semtech,sx8655
+      - semtech,sx8656
 
   reg:
     maxItems: 1
-- 
2.34.1


