Return-Path: <linux-input+bounces-9063-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27685A05D32
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 14:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1E4618877D7
	for <lists+linux-input@lfdr.de>; Wed,  8 Jan 2025 13:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CFEE8635A;
	Wed,  8 Jan 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="PRKEM5+y"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605731F9F4F;
	Wed,  8 Jan 2025 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343956; cv=fail; b=kVJi7ON4ZYPClYRXXsCSfFxL+eEg7MgUPQWiqsSXncd2Vz6rrZLMoyrSYuX/iDTAVOv/KzYiRIr338hv0w/xQSmUj56bT0T35hUr2L774iHe8U441pYpPPMbbYpHV2t8QDicPU7mFpPb2ieW6Zw4cKSSNUopSxps4sCV81alga4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343956; c=relaxed/simple;
	bh=v8k8ugvjybQT9dxu2k0Uyuxpx5+LWRXd0lMgHhFUN9I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tKbqzn2JrbxlUMtcoLEk39tfNQoY58kfnJ6htBbAg62WniuzP/3/8PExksGYJdgPbm2IwVBAzLS9unSGE6R9UeL/tW73oz4Bw2GPUaFXD+W9vk5MfbG/mIC1JkYDRulpSG3ywgpgUWX1+GiLN0flBzU1DU45MIpz+XSxr0LsWG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=PRKEM5+y; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IzokMikDlBvg/QrooZK5YxWyQZxm5z13Fl953AyZiMBY4Ze4TRz/hF7XQI9oSIMsaSWAjjlKrqhQfwOJs9bk638j4pFONYxqZvmCAVMXmarG6FPyXMayVgF5bj42ohcCoSIEZ4vHbttjf4pYmtq7iwevNbKWbfppPFJMFLroi/MKXGpOgCFz5jYaZvXqVuZGo5Y7dR5cFV08lHMiXEt0pGM/yExnyAVs1Luos6VGrwFLvzPb1BD1yNmQYLLZIcfVOk1T8SgsfJt86rKIFVqqaeEZiZ30H2hsbTDiIbopFtYm0JGWEJJEwegR2C6KKX5t3KCH4ph5IkauH5R9RADxyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vd3cgXOZNocABuSffotEqyOPH5w04TTyG8W7gsEZz0c=;
 b=U1Wqb+gJuUMHZDKUX6tXkMogN23AYEboSAcfzSpm/BkOqh27WmtarHm7QOCJUEd2bLDoDqGArG0FLkgpAgNbD8BxqcYKW8ZbwSGXAV/t4mwGFy2Rda7VS+rCWad7WLlLhhhKnzdiudFVLhCQx7i51RszgqfUrHijuc1mZZQJfPv7D6l1E6qInWTPLMaCb8lXvLwOi/7zJ1v1KioZI4qBtp9PQxsSobdEb04TWE0Y+v5xL/NIlAnOkrp131HcJ7ZVoh5oplv9dmzwO0Mk8GTgFOJl1V6Nk3zTtphUnzx1Jj/ZbvC5xO1SHeu1tPRBcm5P5OTEZFLobiZ9Iwdt2txcdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vd3cgXOZNocABuSffotEqyOPH5w04TTyG8W7gsEZz0c=;
 b=PRKEM5+yo1UOM2DSoKRUnUv6qT7tMMoYMJUdcn1uTgRTRMuN0oMqCMUqOYadGajjD5lRMMnFTm8+8n7Qd5c2jGHDMb53gBlqH38MLeyhAAuBuozX+IsGYfd921eapZ2Ug1wAm0Nc03feiFAzrECuERLzj7oSqWToAgvQnmcZQUVjbkXRkZk6/iocGoOV4yQKSlxNPsvco9DaQ11SZwHN0sHpOHHOFZAco6DRp0XBuHigEymjvC/7Jtom2I512Gq110xdpQuywtpuTC0cGQ+W3imH/NFexzmbN+UMRpXJqQRRo/66OKCLr4jtcnSvJqznsQfR/hNlpFZ2N+nzhJiw4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by AM0PR03MB6307.eurprd03.prod.outlook.com (2603:10a6:20b:15b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 13:45:51 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%3]) with mapi id 15.20.8314.018; Wed, 8 Jan 2025
 13:45:51 +0000
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
Subject: [PATCH v4 3/7] dt-bindings: input: matrix_keypad - convert to YAML
Date: Wed,  8 Jan 2025 14:45:03 +0100
Message-Id: <20250108134507.257268-4-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108134507.257268-1-markus.burri@mt.com>
References: <20250108134507.257268-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::14) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|AM0PR03MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 60be4389-c45f-4f62-dacf-08dd2feac412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iK+mGLKXlEohHch1R/Zt2DaMUaCz9TS19YK1RAMBk2BeCfyXa+5je/+TEtU0?=
 =?us-ascii?Q?ECVsr7JQYsyXz+GKVel/MfzIaIkaDtMjEn6VAJ6Smxf+XxYbPAuW7nKPlJyg?=
 =?us-ascii?Q?Xxvxhu7jjRj6u0yEjrqxV1B1+avU3DEGUKZHF4CwiC7NTx13lTYhwdMLqz0D?=
 =?us-ascii?Q?3MjvHTpuguT7dxEo2FAnytUcBTwomNp/Bhwimqp39cJuZy3am45fYxIg7d6b?=
 =?us-ascii?Q?tw8UsAnJbF5R0QQtE6Tqp1t1GjU+jmHX0zahyFfkQcWKwZqnEAC1JpWW0et4?=
 =?us-ascii?Q?BXZ2ZmoKLdhPW/obAafBOBooEtIG7Zav7mivM4x3DDYE2Qo6HuuhS0CIrDy0?=
 =?us-ascii?Q?NnE2RnGLE9hEbdXRP1cWCb9rL+58HZBn05BvaVVlqh+laEQUuHZqCwZ1prwf?=
 =?us-ascii?Q?SkvcqavsBgL87rtbOuCtHGfoWyw42K/tWoYW3PmuRl70iQk2xKCnwk6aMOU0?=
 =?us-ascii?Q?MKBdPH2ffxx8ZD69B/9OEcBBqNs6L7d3yIXb+sF2Z1aLvjBR44XMn89xJL4f?=
 =?us-ascii?Q?M6U/yrS8WPNFD+u/Za3v1ds4zp8T26+vEZo6ZAK4AVCp8aBS3saTyJWOoyNp?=
 =?us-ascii?Q?H7eisLnYK+N+0qOkZk42b6RzxShJLnpJygTZ7fbIJLkcLzOvbJqvD/oYR3ia?=
 =?us-ascii?Q?ND2IVlDY1A33nw/89j87Wm1bEDG4E9Zlh5pJpDpf11dmwFRYp+7aXgpNy0Zr?=
 =?us-ascii?Q?5rmMgwyUv0dNPJkN9WdRm1xs83GmIggNWUeLykERuLOVPxkLsSr4fU9YgymW?=
 =?us-ascii?Q?MFX3zy2mTWcKKH86sAGQ6uB/qM1dx3tDFKKYwMvU2lRbSTg6YhZBuEmJ/cUP?=
 =?us-ascii?Q?vOHIvbzr8BviBFvxZ+388WDo619n6Yc3mfkWXmhgfFMyLQEFWLBwu71RyGQk?=
 =?us-ascii?Q?VBnlvwcyS25T7U3HmHAmzptByc83ThxMNlv3VBpNVnKvpTDZg9DJW+r+5sI4?=
 =?us-ascii?Q?fjSR1yfWUT6jsOjrFLzTIpqiVJs3s82fGvDNPgfbnnO6JCqPWYyjIcKm6kRI?=
 =?us-ascii?Q?J8azGcPsaXq/yChuFkf+zFS4/mModD0fnszO8YI+jOVPWKBS6evpPf0Uu4uK?=
 =?us-ascii?Q?KDa3J1jn+VYxqVBgNMV/6plo6B5m+nr+vXEBqMbnc6qaNT6VY696E7A3+ZZj?=
 =?us-ascii?Q?SKXAEcFMbiNId/s3/PGpxcSBV5HKJDuJfwDh8qghaRag6kjVyM1UTWH90Jwt?=
 =?us-ascii?Q?C31th+w4tn44bGwgnr2FJXaUsFsOBnUCH1issKwkwuV0O1WUZmrbG88r9Wnw?=
 =?us-ascii?Q?nMoivVPQL7V78OJj5UYdUxu6Ro48330hMu35xfoWkCRi7tp+WjYsRTLVL2hO?=
 =?us-ascii?Q?otqBiw5iVLnIJ9aZtY1SGoccdLjkYQHz3ywseNB5IaNXL1gBNMvM9IioHiCd?=
 =?us-ascii?Q?GEu7TjYSYcMIgGRQOCmm2AfjuT0U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RMc3XhmpIpBRtCGJAqvnAmGTmyqB5RXiH5LgdquuMwt/gMJ/u+BiDHLJ9PdT?=
 =?us-ascii?Q?edOQCg4HqYoq+WhIv0HGTaUkWePO8pqRt3UONhCPDee9y5n36sYQ/Bl7rdiF?=
 =?us-ascii?Q?pdFB8LMvVcMaauYYjBhFM9SAEiNqvhiHhOoSBvf3+skzQ453YNyOo9KKwnQs?=
 =?us-ascii?Q?6+4sL9CAJK+BywQaPtuG1wAXizHGlTc/he/Y6FxLKY78QP6sqRfhakZuO/Ia?=
 =?us-ascii?Q?zjkEIzxo/jUjvbOyPp3Tbf1D6CYMAiTOlClHQ6PdKFN1MawDYxbOLZ/VSbeN?=
 =?us-ascii?Q?g1aYjwdcdS5+zUfGrQUnAu6cIyybbsIHtjiBW95ht7K4CgRRYrthQv5918SD?=
 =?us-ascii?Q?w66rs2TvZVpFibn/ht/nzggeW8uIfPhujAAoXc3HNifdoSHkbgiZjzIa3lNL?=
 =?us-ascii?Q?BFpduAWsX/JC/oqiSDpDGnCFIH4MJeVmNjRQf/+WnOkw0NDSKNK7sZ6c5gW4?=
 =?us-ascii?Q?Ng4N8zqj+8vtPtlAH+fBAyRz6QpbhMR4wnjJbswbmZxGsXXHtsq8Y+VNh+Ei?=
 =?us-ascii?Q?iHBTX/pVmSO1qs2AMItwqtCV7cp7Fpj0f8VwtyM42Ij6UeU67NpSzlYTnsJr?=
 =?us-ascii?Q?hwvIvZwRAAMrkpClkwXyOVbzmjloopBkYiDJqZbEEOjj2PVoDul4oqYio6A7?=
 =?us-ascii?Q?8n1Ve5q0Kyn90Zo2F09Wl/Ol3CI8NHNCTrU5+IUDc1QHlHW7BZ/yyzxI8QFu?=
 =?us-ascii?Q?wDnGCNqXJqOrHyr9Wws/yE1yH36hFBG1RF7I8Sekx/cTr7PxnQvo/hITtliE?=
 =?us-ascii?Q?qDrfFkMncU1LN4m7w9Qh20KgYLiaeKbMe4zuyDtPN9H4/vQrAN8giXETlvl+?=
 =?us-ascii?Q?ujR3EqSIoFtN1Bxej2bYIdR/bRdsQ8bPnKmf5Sk6TNgpUBvx1r3GYzVdBAp4?=
 =?us-ascii?Q?3AZUh9+3N2KqRraDDaYD4nLnVqd+Nx69JI+5cfbtyVYfFNC2sYfNZmdMxcFd?=
 =?us-ascii?Q?C6WVDE0UOxc/jhVI1xza0J+q8T+oZED/JDxU+cCCvvE1JMTmjHUYqmJygLJg?=
 =?us-ascii?Q?JyQZ8iBVrsEM6lgN4Iudr7GwfZEYDAz5HOO8Xrjy09tUf3A9TL/dewTa8gka?=
 =?us-ascii?Q?7Uz9aMk8hUnIeMI0r3TP6xuA3Q0V0nf8WsMB7FifMduYjcHVJwycdGoIrJlt?=
 =?us-ascii?Q?SnbfgubUo/p0kSoUPX/AN4cKCR+rvgidbWz1PhJ9G8c9Lp6IBGPu6muD6pzE?=
 =?us-ascii?Q?31NB33G82Fk0sJOJKPw+rJWP/N8Q59qbkTe7op0DWwCyz8+0Td6OJPt64POI?=
 =?us-ascii?Q?CWuZ/e2objVIpPoAMDatZkNa7f+mUb92DotPfiOG4J1mW5fLgDDA4M+TfHgl?=
 =?us-ascii?Q?L8BrLWopSH/ILZ14H5L35ADxU+uIWMavUivKOdo3ZYktXhi2n3hQvFNJTl/c?=
 =?us-ascii?Q?NB+YxYqnyjtz5tW4aPELSHhxtPbd4ju4zvmCfmXEgo+wChsSBproVko7Qxzo?=
 =?us-ascii?Q?erQ8ty+VpnE+XYkm+aZYHKAj8qn9MzO7UI4M8aC/SOkO1iRdFaDGZ4fIzIpI?=
 =?us-ascii?Q?xU9E/C1OUqYESQYComgxarGy43RcEr872kYD6wMo2n7nqBgzMWT7plHrWEYn?=
 =?us-ascii?Q?rIu4JVqYuBKWGni6E0b4ik0ll9i52Q61xJrFrgc+2paGstHeUY8i/WfW7KUc?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60be4389-c45f-4f62-dacf-08dd2feac412
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 13:45:51.5933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8GwHdvoJ1Tiv4s21jVHPu0JCaj/q3rjXoLgBMqT+mXG6oLKemLh7ZptfLFCDNgQTu339V27skWQ+qwEslxLi8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6307

Convert the gpio-matrix-keypad bindings from text to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>

---
 .../bindings/input/gpio-matrix-keypad.txt     | 49 -----------
 .../bindings/input/gpio-matrix-keypad.yaml    | 88 +++++++++++++++++++
 .../bindings/power/wakeup-source.txt          |  2 +-
 3 files changed, 89 insertions(+), 50 deletions(-)
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
index 0000000..0f348b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -0,0 +1,88 @@
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
+allOf:
+  - $ref: /schemas/input/matrix-keymap.yaml#
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
+  linux,keymap: true
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


