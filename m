Return-Path: <linux-input+bounces-15483-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CD2BDAF75
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 20:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93D71192662F
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 18:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7953A2153E7;
	Tue, 14 Oct 2025 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M8xvBnmf"
X-Original-To: linux-input@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EAE18A956;
	Tue, 14 Oct 2025 18:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760467550; cv=fail; b=f3xIVafB6EWICco9I3g1xqM+sLjplu7nsg4xu29nwT1P8f0uFfIMNlX1kho1cPmxzC+zWItV4lo8pBqj5aLqvJS8LRtMmD8HbStCFzUF6f5z+MFpCwR9fG59sC5GnkoIRv6jsW0nAQAbeGmp0GCXMeGAZZL+GewQJ2RqNZWnR4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760467550; c=relaxed/simple;
	bh=UXrHshifozNNBCvEZV0Ki/W1Kh62nu29OpS9gN0FdDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=aAL5CsUuNmmFZYL/jBH+V7Ou0hD337aFVYmLe0aIsqIB6h2yMyUElMmvBHWvFwnTcy1YEvh3qceHHjwBgItUJABlqhgXjtJ+mDqFZP1t7DNCECUZTdYx6bc+AGDvf2cjDId7dbZ1poRMx0Fw1n/xGw5D8U+zDkfZZwc/9fz4MNk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M8xvBnmf; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQMCeysssRXHTCy9QD/95pm+PTFKp9Z3w8SGPkN6aL3Sk0/7skZpZWsiT9Xy/qgMXHKrQZ4IoNunqBmBvSAjundQN2A7O8rOda9nLzhXpqM3dXEFNxBZx5yuycBboAu2CYP3mPG8Z3NkvwT9Q96nnaI6cNTTItpANetUIX2o4DlSdK1BYNTQMUoKeJ0ayoG6VU9ep8ao5M+WPmFgbd4qlB+vUX/BzsV3q6CsrbdmtpAkq3hM/21zLpzz1OVPUJlVWS8L3Zn8WoUOpqiVTBY81VguJo4fQnpqUmbsHU8aK3NVzqyZpIhBomduVA+U29r4dNzHMV/kKb5tjvRTPYO94w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQ/FZaMKtMwSRjzDE0m63ZjNEIuYbIjHQzmwXrmWVVM=;
 b=P90Xlt5nx/SsfSNCZYj3JfOqfbllKJGUHClmLEfpn6qcieJlIje2ijH55ooD/T74VuOf2OP8g4PH1BDRulxEaDaFC4YJUpj4M7hcpuSg6yJMEUptn6QdswjrFv4TC4M0Md0Albc6qpkm8gxHYHpj1evyT9Qljb1EHqwNLIwqbaEglc1ESQ3Rjg/GlI3Zdy2B8FlKJYxekEexaO4CkBmNSMCEfVlFCEFOV4ZNzdhs3YVDlnDZGskKrltzM1gWh6VB/MQGe2XEWI9y6kbDGdjHqpVy14hhdoWlnuXU8bVMsiXscFacpICTfXz0fwPARUhFccBrOER+lduRXYxscBVtjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ/FZaMKtMwSRjzDE0m63ZjNEIuYbIjHQzmwXrmWVVM=;
 b=M8xvBnmflmAb2durzIJpSxAM2tl5G1DPkLdzzVUEgNoLTwYzZsTR82P9baHJBxwU9odaWK/oWMBubEAmU4UqrvIt1BWzbYnp00Tf5aGJCFMmH3+Q9UCWR7bnisGzPKwt/9jO4cvL7Pi7oqge2vUHnYv8+vo8xN1sbKWNkLNpDPHaXmqdJCYMKPEnhms2dsg6jxY2BC8etp7FGbFzbpNwiXz0Aw/RPrygMGMDao4zcntNWMiXszlsN+gZu7JHii4Vzlurk+3p+N8wy8MP3cRmouPiRxVyGiFVEHgTR/E6PK31skW4eR8mPrtXxEOrt0kUDHBmTu2xhQgUOdgHx3eCNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 18:45:45 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 18:45:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Support Opensource <support.opensource@diasemi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: mfd: dlg,da9063: Allow wakeup-source property
Date: Tue, 14 Oct 2025 14:45:31 -0400
Message-Id: <20251014184531.2353879-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DU2PR04MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dde452e-4d1a-44b1-7660-08de0b51e1a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|7416014|52116014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8hiQSDyKhIG6J207P9cMxdwvJQQExN+ds+zNSIw5wU44F+fUrHcrA9bgXUBk?=
 =?us-ascii?Q?c15EIDfBVsiur8zp7N+ie8YSIPma6rLiomqhJAS9bSYPLFNH+r00vNPljJGc?=
 =?us-ascii?Q?gxoHN7INPTVNLQlPwgIC634ejfj4h6pR+dvfrctXqeiDMIr8wc4t5q3Ya9lx?=
 =?us-ascii?Q?FhgAQto7kcC05EAsZVL9jqb7RcnAIJCFhtaTkbo5vH/MIKsCMRqVKOTIOcNu?=
 =?us-ascii?Q?lD0vYzNp0ucZXfN5Zbmf2HgkAOk2xXbvsiKW7Tbm9DEePk8wQsuvZJp7e1Sl?=
 =?us-ascii?Q?6cI/j0aWzeQZBHWfx+9kd0gie/nP2DlSz6isUpY2GWkMXIWa0MoJYx0JbYZ2?=
 =?us-ascii?Q?uU4cX9/gGKEiqNF2GHaiGQvV9h9/BuNkf9/w/HqzZC0wgm6Ea4RS52Dffm2D?=
 =?us-ascii?Q?jFc1mmZIlRtqoirqzTXxN558LN3/YQGCcROU28THPR7zTyy9fBcB1luNrecN?=
 =?us-ascii?Q?uDNS9tINFjw3KQQl/n9w9DEfQWIfEPvWf5VSUWxL86yfg8WW9oXxs68jFTaI?=
 =?us-ascii?Q?SFSTb+T3Zx/SdYAhaWCfg0kxBRPbJYhLD7JZn3Q7Jn72OTO4wEDkpQrAA5qh?=
 =?us-ascii?Q?+TLZKNQ2f4IN09e+5JiGRNudt8Sq6x8llm74XS8BmW98mv2AEizMj0mEAWGz?=
 =?us-ascii?Q?/9JgCsMJGYf55U5nDwME9oILFY2NViso7rrYKexpwBePEC0kV4jLU+dFT6mD?=
 =?us-ascii?Q?lyfphzqfEcZJKOtlnGYDgYamG5RRULBMi1xCpL5VfylkIJwsbq/Uy6JuW2Jr?=
 =?us-ascii?Q?h2tgKWGD3kAY49uIYhE1vq89dlRPDU45zsB28Ag216iJYHJ+8SSWEFz9QY8E?=
 =?us-ascii?Q?mzHepy6FTHn2tLnfx/prG/HZl6PPtmh9DiVGukoOSk145kvNNHVhWp85mmgS?=
 =?us-ascii?Q?TNPc+1XnnjhmBP1Ak3uwOb30UIIQP2TS7uCt5h8veoeLrPeKD9Z7gldA65o8?=
 =?us-ascii?Q?6O4b5QpuMaIdkwDQIC9ycbCpzT59C0Pnf4jPj8jIkgUuuzit0oiH/nC647LB?=
 =?us-ascii?Q?HOSM1dQwZhF5b44bdGiC+024JhbBnjp89bDhQHXGJuFgxVjwZ4//lloItR5O?=
 =?us-ascii?Q?rDSLVplhMV3szy8/yaj2MWRj+HgFeRGKTOpFguCthJ+xk3UTutnF5MbeNdyU?=
 =?us-ascii?Q?5rSsiDcugBsUaY40e/Sg2S3tkbQ79vIKzdNG5zEc+9aVCdgrc3d8LTpvNAd0?=
 =?us-ascii?Q?8/TwZyy+DqfBF0Cl/YEI+kh7UxDpCD/UYkGUKSUFxIYSLlc1c+C1p+NlK0bZ?=
 =?us-ascii?Q?QPAvAmXW/oaxX7+PU/VgLK4iTAXikfg2U+yfX+JHWoAzd2nn87Vip08xShlA?=
 =?us-ascii?Q?wGGhfTC6Zjfb6U/kTrP2zHQQhR5JUkc7hE7QRjTIfkLLA1HjNxZndq2yMbRM?=
 =?us-ascii?Q?hlZyWOjZJcYevzV7mmzOF/icx3exfk7plcy0yNqrt08gRkTHtzjFqBGQGlCH?=
 =?us-ascii?Q?ilieOl9GJDJ0rTjYFFqnOPlXn1mgRVU0QJrqvxy9RSGE+beQ5/9vYAMAG5Fj?=
 =?us-ascii?Q?s2bcq92jCBNJXWQ+KRqmvkcn5ec5bD6aHiaWnGxSpPKcn1kalfrl0WbBgw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(7416014)(52116014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mg8eN5STIOylv3eZbXf0tsOYHTs1AQXdaFLvM02r9AAQs5d9zJQbDQxAO2cu?=
 =?us-ascii?Q?TT7QNIzfVL+VaiR9KhC5eRgmUet/m4AtOLblhgfDuCSagAMiFlBKv+w2P6o8?=
 =?us-ascii?Q?VgXE3xeNt5pkW9pMW7PVMZl7Qjuq22B0O9DtBpRbbNK9TzNetfssyNygTwYG?=
 =?us-ascii?Q?9VLT9gmf471zuf9gp1AZ0RdvV6Irk6xlhxsNUTCBqjchodELra642bYKK9EB?=
 =?us-ascii?Q?I+e1ewFcM0MRRrSE0B5eOzhc0e07U8A1no0s3k9AGE8z4iiOH4xEUsL5tSG9?=
 =?us-ascii?Q?+7Q87WR5d3lEyaGA5Z/oWm0RmrKL8ezbxIMPTHPqdHnVA8ZMklMvkjnfJpNs?=
 =?us-ascii?Q?kHFI1aTl5IcZ1lg8mY1k6esoVlIPVu2ohbyn1KL11xaiu2nG4D1TPtwWuHwO?=
 =?us-ascii?Q?bH35XPxN6GYP2eJRhjdVHXU9uNCoIkfTiRF6eayCqDRHjWmbyMrDEB5bCZkT?=
 =?us-ascii?Q?zEnuO4f/6wv8+b9MFStKWSVpbFeEZJzf+e6+9w1aXWgRI+Ws/pKrB0SLA+4j?=
 =?us-ascii?Q?z2zIHx3qxMWns0drjKmK2JXBq1wnv1QzZo6IeOCXhj1WHq7mLMDorRMU0wN/?=
 =?us-ascii?Q?gkKjpiqiW4HKmuY0GCQLQHaVn1zujBn/JDnzhkrUx7zMo42OnBLOY6Ki27xf?=
 =?us-ascii?Q?3e6TIWa997b0zTCJ3KhRKO/pfpZaBrgTtTFxax1184/AcLI03eGkz9N7EJbc?=
 =?us-ascii?Q?m6y9p7/n8bAgCeAGxwOMwQqnYu/+++TvxJT7WFvsDXFdwi+QFbWmw61Tgnpx?=
 =?us-ascii?Q?Sl2e3o9px/g7Zf4T3wyyS//+NJerPU2lQVc//kDx+W2QrnDvtAagvaTYUY+K?=
 =?us-ascii?Q?n2HPZTgNqbJ930ZUP2zvgb+jeFVSAsyiQIqb3d24blAm8RlTC0nphlxCEpml?=
 =?us-ascii?Q?EfZe0mq/pPi4f9Kvy2WOTsxhWpHFn9UGcUjUCuyz/a6TmAnR/dB7USEzrmA7?=
 =?us-ascii?Q?bivGZBNZtz2MG1F4oqR+w2DpoGo0mH5ZfAg0RnD3eFSX1/awH3vJauyIY4WC?=
 =?us-ascii?Q?pe3Uaj8f7TVGOvMWhWOz0YFE8MuLlUOTm5Y06cYj1J8tlvzAF+Yj3xFNLMH4?=
 =?us-ascii?Q?V2xJa/rOUFoZf3sdIBQTNkpvAxxE+ULxPORFXf1PyNHynsth51rABGmGzg/j?=
 =?us-ascii?Q?IY/1O5aCd2Jsir7vl+Yktdm7AznVq+gyvljS/Ymxh90uzG6KTEXDQnukMrRj?=
 =?us-ascii?Q?RwUo7juB6EpU4D9E/MJ8qdDwHDtPqHCmRG9Zc1TuRGhA/D1cY+9IsaXQi8hv?=
 =?us-ascii?Q?dBNJa42jzWD/ayyFhBrP+tKCmqn5FHGxCFJXckixIzwU0xk80flMh23tXERV?=
 =?us-ascii?Q?KTC6V4zIGSbs1qxfkwfCnVTZtcOI42ThYtiZUd81Qf+Lkoa+Yi46wVlbybkW?=
 =?us-ascii?Q?IkY6IbKfdNaSPxXlfZ4irhh0wsDi2Xk3iU/humulha0w2fmiPfMX/ylJxpWz?=
 =?us-ascii?Q?o0JhwKiRADs8et0gZhjjN81KH4NqxXajoP9/3QG9/4l+hWVimSp1988xpqZn?=
 =?us-ascii?Q?oUe0EdlZF6Dy5u72MPW19KLpDgcs5EYqOUSfQHQiIowln7noFyqz4rJSd6bX?=
 =?us-ascii?Q?Vg0SWaz28AQjy/lUx2o=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dde452e-4d1a-44b1-7660-08de0b51e1a4
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 18:45:44.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KnTVJ7/U/ndc3Ntfxm474DGMuMtDss5AZuug8+6KB07UnQ1ScQ0k4aJ1YzVYwqhnuwJjBwhXlAngM3mwNJX/yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8616

Allow wakeup-source property to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: onkey (dlg,da9063-onkey): 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
index 1480d95421e18..29ff8fc0d02ec 100644
--- a/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
+++ b/Documentation/devicetree/bindings/input/dlg,da9062-onkey.yaml
@@ -32,6 +32,8 @@ properties:
       the OnKey driver will remove support for the KEY_POWER key press
       when triggered using a long press of the OnKey.
 
+  wakeup-source: true
+
 required:
   - compatible
 
-- 
2.34.1


