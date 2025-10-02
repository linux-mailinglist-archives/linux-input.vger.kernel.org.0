Return-Path: <linux-input+bounces-15197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F346BB493D
	for <lists+linux-input@lfdr.de>; Thu, 02 Oct 2025 18:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEC5717066B
	for <lists+linux-input@lfdr.de>; Thu,  2 Oct 2025 16:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792A1266584;
	Thu,  2 Oct 2025 16:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PHW5Oy3C"
X-Original-To: linux-input@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011032.outbound.protection.outlook.com [40.107.130.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E2825A2D8;
	Thu,  2 Oct 2025 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759423482; cv=fail; b=Ksn+lZb34NKWJPQ0r+uPKwz0+0XIYWXHSHFMQBcagDTqnD0MG53lPlrvT2LFuhWhcsykGM6MGNe/PNsq7zoApQB/pYZezf4MjuXTbjDqhSKuTOtDM9EzdGcmMJ6i4une/d/dZdcT1oYkIubPf/DN3VjBmA3EMYsmtMkZfqVvqFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759423482; c=relaxed/simple;
	bh=aD3ylG6g+gWXU6zIKJKKC8eyXN7efwK7C3JX4FQUQSc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=dUUX7CinmfgkR5OmQWXyU6i30aFNfBvcIYwh1YATftg4cCEPSGX9ALTA788CLB+I+TSOh4oL8oU6ZFGFopprwUv0fNQdY+X+IMGjaGK8XUYX+30fDhBbia4N/lVyQazBp1aqvo3CbT+sjH+FB3K8tO3OTr6lD2G2+GzqjY15qHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PHW5Oy3C; arc=fail smtp.client-ip=40.107.130.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oF6VrD3HvS1ZZ/QmNuXFQaavCQQbGcdVzYlwahwwRX+NZrV0M9h7uteWlRvCcMtX/XxZaJZGx9c2zLa7kXteZ4gcABm8UpB7Ikt6jaQKPoGqBqx1fj46/jUKCecetRTlnx95nPB+Y6C1QiXaK9TuMICtwkdLGS0a53uP2O1MgPUqQ1AtYbmYPFCSrTe25z+D9EteQ1Eg3lMaK860qwnwyUIi7Rs10RB5DCV6Q6c4U6msi5Qub2PBVpT9qm8r0M2JpMN6RoNcqKtqxP3Mk0hQs5A/kZFqRgLaVu9ZkvgI1s9KYleu7LivRQu74bzmxUGuSWrbvYT4ZfpXUXuntauJVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xp6B1lSUblKW9zGvA7tlto5LPW2fjFNL+2l+a/fIY+E=;
 b=YizPEb17TiM+UJTtqGGQ9HB9xlm2DO714Byo6BlpqlTtuSoRHAzQCB2179OaMN9y8L/CLxE9HPKGYIu3J2E+raoR6VhJvSMxhFgcy6Y5/r4NmOxOx3Jq6oFF034QHejp+dJsNopzXTzgvdW7kWdEpqsfPSQXfU+7jb7Ub0FC4rWm2IgOxlr6AaG4WaF/12Zfu2CPLDALNx1oYb60dENk9qLwhHCjXfuK/jLDuY9A5rohuOCgcuhGr18aVDeRS2AszH0dRmP+b89FEx7xqJCUWCbA86kGxvm6cPxXdfxFfd9IuM1wycfbiaL/1hQMlOsIJ0qTHhWuNDn26ztBdML2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xp6B1lSUblKW9zGvA7tlto5LPW2fjFNL+2l+a/fIY+E=;
 b=PHW5Oy3CdkVWa1DO3cO3HSXxmPGhhg0dyhITMmKYSJSz1VmzQhFwiPsbPUxF/HNHMbwgoDUAUvmpTmEy2upXKsWuVM8uowUU55Wjx9bEh+N4UWP8JGFDQy6ZxBRzZANr3xZoG1ueJsBXE1Lk1hSF3BwQFi+EdJyro8sjE8oPgEneProSLPNlf/80QluU70Vf7YLQz2R5ssePAhW8PsbTmF3JSVoXfCjGuzrhtms3Wi7KTo++3jYwPL3VhB6ImpzqWn4z0oV/Mqa49XB2skdAOV2T8ai4h3XXkdzvWpZM3rY2kihjn9P4gtFQSmCVGVVnDapKEU93JGl/h0n9F/OWmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by PR3PR04MB7420.eurprd04.prod.outlook.com (2603:10a6:102:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Thu, 2 Oct
 2025 16:44:32 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9182.013; Thu, 2 Oct 2025
 16:44:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-input@vger.kernel.org (open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/2] dt-bindings: touchscreen: rename maxim,max11801.yaml to trivial-touch.yaml
Date: Thu,  2 Oct 2025 12:44:04 -0400
Message-Id: <20251002164413.1112136-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
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
X-MS-Office365-Filtering-Correlation-Id: 9813ff47-a8de-482c-9099-08de01d2f630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TMMPeWkw9zRhq3nAaq7Vxee634LCA0/ebopPMolYnYFfkEXU8VymRoGl/lx3?=
 =?us-ascii?Q?pcHVUk3mGMiNAiA4rIqULv3M7H3lhDB5wIKmnDDj3gDDGe5cQHOOnX0KLoDJ?=
 =?us-ascii?Q?XeeGvBefSj1NoEMOEMZ20aQ5cslGv86xBoDx7+EA4evWUF6ZYNiXEdiNtvb2?=
 =?us-ascii?Q?5g4cKOTJw06OIlWLhV+OR/hMndH45uQ2L1dR3XQ5ZWbLRjIZyGp3xjaC4mxv?=
 =?us-ascii?Q?2uUmPZRRaOSHH3Zsnt8Zqsp2KglPO7z2RYSxEvjgKDV9rUBXf8+ycToun2/J?=
 =?us-ascii?Q?mUVV7TR96uKgLx9h8iAxJiMBH7qTl38M2VfFhuCo3BycI/jkobAbpmXo26gT?=
 =?us-ascii?Q?qcaSX5dBU/fxa8kZhvMZUbbJdNH8UfJFPMvED5h0Vd5lnV7eLGehQJlw2Zqs?=
 =?us-ascii?Q?rpmSUZT/pzXCmQtyNHFwVEk6UvoI2+Xi1783JFJJenV6WUn6WMi4vpqtd6sF?=
 =?us-ascii?Q?MKzDUmMkSeKqc6cZb0unQlXf6Jpi8ufgE5d4zRO/zA/u0nwzBupZv4pI8T3J?=
 =?us-ascii?Q?qYJADQx4G+8GBEj3DJTha5f3VSZjeTnWrZyMh4e36RteT4EnYhvJxrqOcMT8?=
 =?us-ascii?Q?T01Wnjv5dbqFtgRo5gPOZJC1MbHgWT+hjhC6hAAoMkY4dtTIVqj0Zr/A9jfL?=
 =?us-ascii?Q?IruXthzZkq3UFJpzNEmLjlOpCzIUWWdLH83+15AtPqVJTBiBAm2lmY/Gsu3n?=
 =?us-ascii?Q?jyG3iF9PeiknwZR/XJlCgHm7LsIKXPK5LCp39Wgjssb+yfeJjW0N2dGYeIwi?=
 =?us-ascii?Q?hGiUX2EtzO991/ByuYeRdegdcwklQU1iLZrP7otoLeDGWSa+Ixx5TC0kleMg?=
 =?us-ascii?Q?K0t1o4zegOF0YIbiaaqxXhGB/FxBxx5mUvj8owX+N6uO+g/vCr3H4SYKqRG3?=
 =?us-ascii?Q?rnK1uqcRGQcupNQtNOlTNC7+qunbM1AQISyBx/VVGxjcQs6PTKr1qD520s2t?=
 =?us-ascii?Q?qc/2fkNqBhG3LPz/uEkYVMVLIeNAXPIYiOB+UhSHL5tBuu0BS3eIy+1YPoeS?=
 =?us-ascii?Q?1Ga2TmDSS8TZk3Ss5kZzY4wKrWYaZBi1vh2qWiIaNEu6yGwyigiefsrfHEup?=
 =?us-ascii?Q?Atr2xPc1zoTK8D2169xyh/7rGT4zdkPWr3a1od23LhIYXeF3ceUjN+i1eqnZ?=
 =?us-ascii?Q?R3LpW42RSrO76HmCineTff4zNEn8RLQQtFvgB3n3pO8t7m8Sz+/opoFiuAyN?=
 =?us-ascii?Q?YWJL+2jAKLe20IOKw1cL4GuJd2C4QrUW+H/smWe4A9r1vi8J+gtEhDRzCu3s?=
 =?us-ascii?Q?2I7/JWGkOLmOBnmaY5Ky7Yb3TV53qlHgkguDs3pxmragDah8q51sWFTev5QQ?=
 =?us-ascii?Q?d1rf9pFX6uyeTtOzEo/HGvUYXMYJq5thXnE5GRG7tT2PEG+HKBF0jnoJOlWg?=
 =?us-ascii?Q?Lfg9CkYOH1C17EuTd1KlhCQdoyeYRZY/yBZ73ojj1mjjs9P9eYKJFXyOXQl3?=
 =?us-ascii?Q?TjZxQib9UGe8VCOkAZIjbikCZRcUYBFg2QyNqYuW84N5VYUHCXmQDJx+LbCY?=
 =?us-ascii?Q?jePg1WZznSO0SW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Von8L7iYTbptd+v+KETqTS/cEMoRf3tUEMxq17Aegcuso8g0fQSjoVTejBlh?=
 =?us-ascii?Q?NewS04iff6DxUjdL7iVktjEoAKq6NsZcm/9YukGFMuWoRNF9S+sqcWaM9CCU?=
 =?us-ascii?Q?nUJVng1JLuBqrnAlDfVM1Wpeq/cFkKCguNtPORxU7taXUiw10NzZufQQnYJW?=
 =?us-ascii?Q?koFRkcFK+cY12PKhZFa419dhK5W0ivGGCMpdG4tZTMQZHrbqLeIZvH2esFT7?=
 =?us-ascii?Q?MN33l6phfq6STF7qcrIPsxB24it45Wo/k8AlPpi0fo59fBrytM+OoRn4BaiL?=
 =?us-ascii?Q?EaZ+sDbYgrDjuaHqI+jx98C3CqgireRHOGsESTqqqhfr8VVjOn+mJqu+VJ4I?=
 =?us-ascii?Q?K+C/udQZVNYo9Kz+ayfqnQUXQc7YxDO+wmHHoxNgaOWd4J0U6K+XgCmoS19F?=
 =?us-ascii?Q?WX7mHwNB7MDpZNXpP1uMXs8HsvfKKqGO9b2hQv7JJ34Ur7MePLSvmlFeGLdm?=
 =?us-ascii?Q?3K5l7ierzGn9NG5WqPsMdP+HJctFgJbMClukH1LQUoaQ5xeYqfWLy26DFDfw?=
 =?us-ascii?Q?Et7+WkxOv26s7TZs/8VJYWrUDAB5R2GFytYObaI4fjkBKgF0F3xo785W89zm?=
 =?us-ascii?Q?QdSbcNysvUXBjWmWXeS4wFQUsbsdJXMzRzEJNacRlB8bTyD5STX7eAjHjMVI?=
 =?us-ascii?Q?VxhAvfjn9Ij+nr7trTcHTyOF6FuLpGcbiAUcFWb9ZEde6hUgB7gHdX6DsfS/?=
 =?us-ascii?Q?vBICdEnudCb4lUpjb9SmX41rBwtsPgYMqm3qzbcr2kiEYO+EO3VyPn0oQOMP?=
 =?us-ascii?Q?5wn+ZFzUUr0HCkq7DKbBVsILO+P6etfzldnr+8WNHMrpIdWDZacIZPbmVJeG?=
 =?us-ascii?Q?Wf+jL40P8OeTpuG531eNqoa00N8dPR4OMrJq+DwaGyFXOmOxdvfdBPKOCbMk?=
 =?us-ascii?Q?iWyXgY551bUDvgdX0o7MfvTt5ID4dxR29CTg5XcEyl5p3gzZ0Q1dYNDb3ykU?=
 =?us-ascii?Q?qjpymmtY9MiBTXFumtIVaJt8etCX4Qz6NK69ygFO5JYCyCQVU45RZvz90liV?=
 =?us-ascii?Q?kSiU1yCzteNWTE5iB7m3oYHWd7FG8t6BqXckEO9EyWoBbNOMvNcV8f4eOLND?=
 =?us-ascii?Q?whX/sWPsbt64IVcFH4K0hJIr4yB+UiiXLpqo+3X+u7Kfx8WY7u9quNqisk7D?=
 =?us-ascii?Q?/i9aL5MkNXx6bzVFuHTobbJBK0mon8KAhCDLzmxRPQX1AerHDc6ltrYhIhlB?=
 =?us-ascii?Q?zs6QGgw7DIDwHx40kv2W9JBt+lqhpITLVCeXjKj4ZMyHA612l/XmRC0Ki1xN?=
 =?us-ascii?Q?kJ8MoLC/zTfqRHyllu4jTb3u2lehbgI1r2K3PAkRePNwUR3lXAI/0eI86IlL?=
 =?us-ascii?Q?u5CP3dYy1+0QcrZfSbjVJFl0nzCm90ZYMjfHwvSO0WHtHsr0Vo/vb7/p9ueM?=
 =?us-ascii?Q?MHQIjKq6yDAEfTuIIcaNyxsWtgvOCgFj8N8oNayW/pPPw8k0BGLzXakXlZQU?=
 =?us-ascii?Q?9eANdBhRXL3qVe0NLYUa5R91J1LjhhSt3sumZq0bJmjEc8mIaiai40XnViwS?=
 =?us-ascii?Q?DL/MZ2mWqRyeUpkLLgvbz3/2JfcKsrLLNnj6ovK6Sjv9d9H3BmNNjUGk8d0F?=
 =?us-ascii?Q?kMP8Zt8b0g8o+aWz798=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9813ff47-a8de-482c-9099-08de01d2f630
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 16:44:32.4915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEtzlauyXjusSi4TqmWVI/z8Ywl4tz68Yoz5uWFyPmtQPTyUK38QDto/3XTlNMv4uNC+OGxSClNKU4xN2qMfYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7420

Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
controller with one interrupt and common touch properties.

Add optional reset-gpios and wakeup-source properties.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- add wakeup-source and reset-gpios optional properties

change in v2
new patch

previous discussion
https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
---
 .../{maxim,max11801.yaml => trivial-touch.yaml}     | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/input/touchscreen/{maxim,max11801.yaml => trivial-touch.yaml} (70%)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
similarity index 70%
rename from Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
rename to Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
index 4f528d2201992..349d1a6687a05 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/maxim,max11801.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.yaml
@@ -1,17 +1,19 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/input/touchscreen/maxim,max11801.yaml#
+$id: http://devicetree.org/schemas/input/touchscreen/trivial-touch.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: MAXI MAX11801 Resistive touch screen controller with i2c interface
+title: Trivial touch screen controller with i2c interface
 
 maintainers:
   - Frank Li <Frank.Li@nxp.com>
 
 properties:
   compatible:
-    const: maxim,max11801
+    enum:
+      # MAXI MAX11801 Resistive touch screen controller with i2c interface
+      - maxim,max11801
 
   reg:
     maxItems: 1
@@ -19,6 +21,11 @@ properties:
   interrupts:
     maxItems: 1
 
+  reset-gpios:
+    maxItems: 1
+
+  wakeup-source: true
+
 allOf:
   - $ref: touchscreen.yaml
 
-- 
2.34.1


