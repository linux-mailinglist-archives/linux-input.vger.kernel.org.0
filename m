Return-Path: <linux-input+bounces-8997-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F2FA041C7
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 15:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABCDD3A7333
	for <lists+linux-input@lfdr.de>; Tue,  7 Jan 2025 14:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0863D1F427A;
	Tue,  7 Jan 2025 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="N7vdTPwB"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500441F473E;
	Tue,  7 Jan 2025 14:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736258623; cv=fail; b=A71bx2Ate0qyvhFD9uPq2TdgSoPGgnStiTOqVhITbGPdqyIgbkP5RWfsQ5trVCLcPm5UfGsRMpfEshdw39iHPm0IFclRkSapPJuB+Y9yT4zKk0j2tRHErlucYcxdK1JGdI5nzjITcmKM6197vV8+xOkNbXOwYf4ck9uh2ZX5dzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736258623; c=relaxed/simple;
	bh=lo1JZHFh1bx56WO3zjG5NJDCUvVKRuMOKiC3Me7DG80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cyyO8P47gQkPWiqIkHhY1vYI/TLpE7YzBs1fHRRZnZICHlCAp0ctJa+mc64gJJTbPOVQmbDamZySaauP5Y4isuJvLO7jMBrOqkiJUnwVHCBoVH7Clsw9W29wPx6PQzUqQZxlW9OrEnTDGcDhPLWSxbEYLwxhEOTl+ODMlF+EiJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=N7vdTPwB; arc=fail smtp.client-ip=40.107.22.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3I98qsXnWZLmGF8Vr/SKPuk9uBdxIz407V2uMg5vu/1jfjFO1o9bV6LPFeFiTHI9/Sceb4mYMeE0+MOayONyM8L9AlVHMG3rttD+YIWXV2DBcDpCAwBYZB9TYzA1miYPtX/wrcuwn1CSWDODrIjTFxFPj3ox9X1RtoRUyfPS/+MXI+GTC3SDka3cJ6kL3b0AjGV5Y8eYCxNq+f/VxCbCpZ2l/aMz96oGsMTSjJctZ3omnSnDXt5+q/4dIawjVhL62VmoAHlO6ShXdT1eygcXPVD4oRaZFInWZ4S88pVntS6Vcwk9sXhgT+gtvb/zVHlZ8kiJ7mtUADGUFrXrzOYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vUQq9nW9RLfwuf1Tsz72XuEDcFwyKJoZZ7YDR/csMM=;
 b=mV0RKoOlitnICuGoAteCcxmIvPzJCRZ/UwK/izm/p5WcUzJCyQTAG2pqUYRzE+DOyFyiJb2mvYQLCdxNZqdkrh6XAarhl6fdYLZHksGJWyWRL/9qrssWyl8PBSxMsMuYGFP9ow1o85sjj3uoab51eihHjNrHM2Syv6m1KouvqTpRLUlHd9ycQZ5FDYGmiehhHIzquDslIogp6/xAgZsL/7su2O8GMkTv2LdKpHt5Ee4wD4EC6PiskUQW/LgnzjAO6bVpOHJW6iNCpPdYpOayoT2gsjtv1+HRyJgtVdFzbEgiz1CWWE9HJ3JtGmeKn4fKtyDuBq71FbAIuudzVRR0xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+vUQq9nW9RLfwuf1Tsz72XuEDcFwyKJoZZ7YDR/csMM=;
 b=N7vdTPwB+DZqno/Py8pNYTQ+bW7BMcNdPnOxu3vlC39KCq0mkwy4m1mI6PveHg0y/BZ1nDzrJjYUInc1buKqh3B3xB31fjQKoYanoIj/hKczewJridcSoSyF2BZF32c6tJ+nqHw982pub8rPgMuhh5wEJ7T+tjdEDjajJfDtyJs3YS5B2W/eZw96w0aXajgjrjmFUA3WmtLdg6EQ+OCUjvtkd1jwAPz38qJ++HNu+F+yQLTUkvbUCs+bwq3jCZOLbANuZN6QqRckWmblSDnGzNHtFEPlbRhslJzT0reYtG2aek+KKEU/wRwrZV/yS5AJyQZvqQ5WEsVk2IVMUA1ZbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by VI1PR03MB6544.eurprd03.prod.outlook.com (2603:10a6:800:19c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.16; Tue, 7 Jan
 2025 14:02:56 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 14:02:56 +0000
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
Subject: [PATCH v3 3/7] dt-bindings: input: matrix_keypad - convert to YAML
Date: Tue,  7 Jan 2025 14:56:55 +0100
Message-Id: <20250107135659.185293-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107135659.185293-1-markus.burri@mt.com>
References: <20250107135659.185293-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::7) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|VI1PR03MB6544:EE_
X-MS-Office365-Filtering-Correlation-Id: 00615f96-dfab-4095-8441-08dd2f23fc7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lAGnVijBBVk7yJ9ZXit31LLZTMjEyFXU5uPC4aOpbrjIl/gm0gtZdrGzghu0?=
 =?us-ascii?Q?VWWyDXHqbSpLMV7/hVZ/S3gvPpqfLul9sqTmD4NYqrvVFV0HBy6KzqntQGOA?=
 =?us-ascii?Q?BID/EiLi8wKa6r24uHQIZDVWfMifrjeUh+M0Y0s7wRMR/bRad5a0UNfYeKlX?=
 =?us-ascii?Q?uOPtEsBB/12jGz7t8pak6/0lJbMOKLcwY3po5kfrIobVX0kw/TlVhRgbJE0k?=
 =?us-ascii?Q?sG/IWGBq0cRxYvvQFBOsNQWXb+r1pHRx26j+v1XjgTo7U2dRmcoby7uv63f0?=
 =?us-ascii?Q?gYuniUayfjJ/KDPNUUt0JCKsl8gJDHuiRvq012AeBPmEX3d+t6M+ePlnibXl?=
 =?us-ascii?Q?dgTB0hYiZb6f6JJ5Oj2FmGY2WJpYbGkmue0+hbCVTiXmnlTh+m1RMlNTl5qI?=
 =?us-ascii?Q?QY62dVeIUc5qFPsxbCQ/exNhLY9T/pGNbCyNyi3OvqSTXsQ56wtovHa7W5IM?=
 =?us-ascii?Q?4TnvX5hosJwP+A60wTDUjO/PpRr/yjRn3Xw9QW39RAIYlOG3XiXCpcTB0cef?=
 =?us-ascii?Q?f2S+pcq0OnNFi3cfXHaI9lzUz7VoDhCEsFNXyYVT4VI2bwtnWs8dlyWiQCyR?=
 =?us-ascii?Q?BCrGMd37IVPZ+k/lyue7nixVZbXgm0E9HN0VgRkqLEpYdR8PYMc4KBGKZCTw?=
 =?us-ascii?Q?8BGlRNNCJ7R/3hzSBUMPJHDbcH+MlfSnkxPb6oD4vMXPp/J7FmFD3BE+c/ap?=
 =?us-ascii?Q?n9BzffYaoVOfvwQOzs/Ik1HWqI8GJKsi6fv02qRQl5mtPcPmdoz5BfB0rWYc?=
 =?us-ascii?Q?iuzwm7Bq5RjUV+OwrEyN+6w5uuycXCZKOZhBz5sctPpFoLR54YPRF8owkjns?=
 =?us-ascii?Q?qECYDaYYAVXdyUwQwI2T4lfqE9+/ey2P7PwBfkeumj2WmXDx4LgpP6XvqXag?=
 =?us-ascii?Q?JJBJOD13qspkx07UDrQbsBkRMtN04Fzf1L3j1c6hXKXvkxMEN+uA2CHDSQAe?=
 =?us-ascii?Q?PqDwb6RZvWxWF3TEKsCS4YNoQY2C66ZrZmQ+kXgJD7ik94/fb29dhbVioFpk?=
 =?us-ascii?Q?XScbM7dIQsgvRPz35prvMOjb7TetajjXHd3SH1edlVv2phhczYRMvPnYuToN?=
 =?us-ascii?Q?BPI0Lmq7ylgwWfLkT5HeQ5zk4aA9jK9sgUDDorhIP1xKHexrh2PqvoLLxxRC?=
 =?us-ascii?Q?ZTnns764TDYqLecMU8G2uJiR4yXGlW6v60SJDfZyfK3S4L9JeXluzn+rRPkz?=
 =?us-ascii?Q?LNU1SvmFVl3XzHFsiCqddgA1WufBySdaw8naw4l66eAWGW6GUoDb8yAnSNIU?=
 =?us-ascii?Q?wRqqKQphFiE5k/C++I617Yho3saGPtpKZVnVAKZeLLpxwq3UY3j0dDUV78sb?=
 =?us-ascii?Q?axZse/QK89EPW8U8/TZ7Xz19uLoZYMjvyTvXrV9CAc/cWDuW3m9XUtJKV760?=
 =?us-ascii?Q?lMy8DhB12Jfm/yluty2Q5SxhVgwq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z1IFZr4YvtvjBlsmIbP6kSfBZIMkgzWghxl8lskyTVhBdarqe++9ITQ1UR42?=
 =?us-ascii?Q?Z2TQjg+8jy/Fw827Jx+XLXDbhZJ0/61Ys/aSW+Dr2aCw/6ZpnUdQEQHbzN+O?=
 =?us-ascii?Q?hL3g/tZCCZLV+CQQwFIcKNEU4HO2gjNdZL2meM+in7iXOSOnNnKAMliFPU1E?=
 =?us-ascii?Q?x7dpg1tfql+f6f67zqzxeobvlFXw0EkHv6yuFVbUOnsbOD8+Y7GWOWwdeqd9?=
 =?us-ascii?Q?MBNv6Umb9NN1GVUhyoV1nbobdgEYJwLkgVZ1402t6oM6po+LicK7/fZz8z4z?=
 =?us-ascii?Q?7k7ifW4CEayGVo+0OG2LD6Rrib4dCvSLSEDnH6vt9JOIU/WkRb7G7Vcb7Ir3?=
 =?us-ascii?Q?5tmdEOdLJ9xDYovpC3JGZHeC/I1IcUtINIoccHCKEbvB4JkPwJIsR8Akah0i?=
 =?us-ascii?Q?AvF75M6wVtFjieDhVhf+nYZqmzZ89h8s3xP7Mo7M9UkmjlSlhlQyULaU8y30?=
 =?us-ascii?Q?sVxqMXm6XvGQHYDPn8rs+5BjUyVwmquGd3pvH0LbN74cf/4jpAh+KCiJN1IF?=
 =?us-ascii?Q?kqPx7XGjKnM9I/fIMZkWp6PUbzIHajPOVuEXX8ex/hZwWQ8ARCkSX01bouME?=
 =?us-ascii?Q?tKH+P7vUSUCSPpL7pj/JjQckW4QEnKq8xFMRb5zsTbRL/oSokpjQR1EPBiWz?=
 =?us-ascii?Q?0uRD0TMVm40kKChJ2tp28aq41BTA0HWn0KEPRr7ypZ0SlAV1JQwcSwcZuqzf?=
 =?us-ascii?Q?eI0RTgAUcwdIhOcEQd9dZqyzQ5aATX1OkYyw27sviqXEKTn2jI0vuwnlbZk0?=
 =?us-ascii?Q?4Tjp/03A8eysUMe9JnRXNKErE7g+ZNKP3LBUkBeR51yuJ0l3k20fdyuRbjSZ?=
 =?us-ascii?Q?Ozc8R5Ql/9VFSPUC3ZLny1Rozr1LRs6qPTKWiYAGQsUVAyz7wWZoRZskjRUK?=
 =?us-ascii?Q?FmaWIPx9ZEemzQpgugAhlqNze+LaWul/vhZOVdQT6aGwQ4Ftxa9lHo/5viQj?=
 =?us-ascii?Q?rZNuRDa+gX5+La0QMbs1KMxgzjJFcqEoslBWaMFFLTg8kv9mv0WvGcYMHwMl?=
 =?us-ascii?Q?TVtWmLo+qI1VcJpbxagHgLU9fcBGkBNWavW0qPRkfG0OcoaOto9ojdIgKxzs?=
 =?us-ascii?Q?lMcCn9pR2T89tPInvFBuhVkDJXDcbfEtA9FZpIzpIiIJPEPvH0KM31yf9Z7H?=
 =?us-ascii?Q?xGy2b3bIQx8Fv3I6/EnR3TlGoWirZlcZ7fYPhcUaQuSCVgsHD11H7Lt/23Kf?=
 =?us-ascii?Q?k4SsrNbpWYaLwahJbTQYNAgJbpFuzQk0y2gNsZdFrgu0qa4PQq62tDoo7yHu?=
 =?us-ascii?Q?l7wuznueflbBHTn2yXQp7RYdpDGMmjlluzrmhPubRWkoJBKHBx10vdsne1yZ?=
 =?us-ascii?Q?E+gvOYj498jv3FMeicM5GdPjSD/dSxa/N/dAiQoZQwAQTL/+gEW9fpsQxMwa?=
 =?us-ascii?Q?sBychEChSvq7lFaSaiO4BP5GMPrusBBJMu/6ql2dvmMl7bBBs/boL5GKNNyw?=
 =?us-ascii?Q?hEUwZRMC6RWlYVkdtFReTNrBK3UEBh2dq416RoVWCuXPATVv0JOru3tYvjOL?=
 =?us-ascii?Q?jCzdUzks3iZQMvtpqgeq+/LfEtTkhCyc2Rh6U7/M83mk87/V6zGOwQqNUiN8?=
 =?us-ascii?Q?gzVst9hLOsFVoCk3O/OifADwly05piEUdNvX51qk?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00615f96-dfab-4095-8441-08dd2f23fc7e
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:02:56.3970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HY0aggMBApK0pQd00mt+DuNZ29TdZe/fVok+dHX/fBEASSgxNOcF/Opxhfa59LcZaVuZIMqXLCz88vJUNn3Ymw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6544

Convert the gpio-matrix-keypad bindings from text to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 .../bindings/input/gpio-matrix-keypad.txt     | 49 -----------
 .../bindings/input/gpio-matrix-keypad.yaml    | 86 +++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |  2 +-
 3 files changed, 87 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
 create mode 100644 Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
deleted file mode 100644
index 570dc10..0000000
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* GPIO driven matrix keypad device tree bindings
-
-GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
-The matrix keypad supports multiple row and column lines, a key can be
-placed at each intersection of a unique row and a unique column. The matrix
-keypad can sense a key-press and key-release by means of GPIO lines and
-report the event using GPIO interrupts to the cpu.
-
-Required Properties:
-- compatible:		Should be "gpio-matrix-keypad"
-- row-gpios:		List of gpios used as row lines. The gpio specifier
-			for this property depends on the gpio controller to
-			which these row lines are connected.
-- col-gpios:		List of gpios used as column lines. The gpio specifier
-			for this property depends on the gpio controller to
-			which these column lines are connected.
-- linux,keymap:		The definition can be found at
-			bindings/input/matrix-keymap.txt
-
-Optional Properties:
-- linux,no-autorepeat:	do no enable autorepeat feature.
-- wakeup-source:	use any event on keypad as wakeup event.
-			(Legacy property supported: "linux,wakeup")
-- debounce-delay-ms:	debounce interval in milliseconds
-- col-scan-delay-us:	delay, measured in microseconds, that is needed
-			before we can scan keypad after activating column gpio
-- drive-inactive-cols:	drive inactive columns during scan,
-			default is to turn inactive columns into inputs.
-
-Example:
-	matrix-keypad {
-		compatible = "gpio-matrix-keypad";
-		debounce-delay-ms = <5>;
-		col-scan-delay-us = <2>;
-
-		row-gpios = <&gpio2 25 0
-			     &gpio2 26 0
-			     &gpio2 27 0>;
-
-		col-gpios = <&gpio2 21 0
-			     &gpio2 22 0>;
-
-		linux,keymap = <0x0000008B
-				0x0100009E
-				0x02000069
-				0x0001006A
-				0x0101001C
-				0x0201006C>;
-	};
diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
new file mode 100644
index 0000000..75975a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/input/gpio-matrix-keypad.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GPIO matrix keypad
+
+maintainers:
+  - Marek Vasut <marek.vasut@gmail.com>
+
+description:
+  GPIO driven matrix keypad is used to interface a SoC with a matrix keypad.
+  The matrix keypad supports multiple row and column lines, a key can be
+  placed at each intersection of a unique row and a unique column. The matrix
+  keypad can sense a key-press and key-release by means of GPIO lines and
+  report the event using GPIO interrupts to the cpu.
+
+properties:
+  compatible:
+    const: gpio-matrix-keypad
+
+  row-gpios:
+    description:
+      List of GPIOs used as row lines. The gpio specifier for this property
+      depends on the gpio controller to which these row lines are connected.
+
+  col-gpios:
+    description:
+      List of GPIOs used as column lines. The gpio specifier for this property
+      depends on the gpio controller to which these column lines are connected.
+
+  linux,keymap:
+    $ref: /schemas/input/matrix-keymap.yaml#/properties/linux,keymap
+
+  linux,no-autorepeat:
+    type: boolean
+    description: Do not enable autorepeat feature.
+
+
+  debounce-delay-ms:
+    description: Debounce interval in milliseconds.
+    default: 0
+
+  col-scan-delay-us:
+    description:
+      Delay, measured in microseconds, that is needed
+      before we can scan keypad after activating column gpio.
+    default: 0
+
+  drive-inactive-cols:
+    type: boolean
+    description:
+      Drive inactive columns during scan,
+      default is to turn inactive columns into inputs.
+
+required:
+  - compatible
+  - row-gpios
+  - col-gpios
+  - linux,keymap
+
+additionalProperties: false
+
+examples:
+  - |
+    matrix-keypad {
+        compatible = "gpio-matrix-keypad";
+        debounce-delay-ms = <5>;
+        col-scan-delay-us = <2>;
+
+        row-gpios = <&gpio2 25 0
+                     &gpio2 26 0
+                     &gpio2 27 0>;
+
+        col-gpios = <&gpio2 21 0
+                     &gpio2 22 0>;
+
+        linux,keymap = <0x0000008B
+                        0x0100009E
+                        0x02000069
+                        0x0001006A
+                        0x0101001C
+                        0x0201006C>;
+    };
diff --git a/Documentation/devicetree/bindings/power/wakeup-source.txt b/Documentation/devicetree/bindings/power/wakeup-source.txt
index 27f1797..66bb016 100644
--- a/Documentation/devicetree/bindings/power/wakeup-source.txt
+++ b/Documentation/devicetree/bindings/power/wakeup-source.txt
@@ -23,7 +23,7 @@ List of legacy properties and respective binding document
 
 1. "gpio-key,wakeup"		Documentation/devicetree/bindings/input/gpio-keys{,-polled}.txt
 2. "has-tpo"			Documentation/devicetree/bindings/rtc/rtc-opal.txt
-3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.txt
+3. "linux,wakeup"		Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
 				Documentation/devicetree/bindings/mfd/tc3589x.txt
 				Documentation/devicetree/bindings/input/touchscreen/ti,ads7843.yaml
 4. "linux,keypad-wakeup"	Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
-- 
2.39.5


