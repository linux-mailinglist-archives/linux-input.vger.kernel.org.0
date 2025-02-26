Return-Path: <linux-input+bounces-10397-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A39A464F8
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 16:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D28F42180F
	for <lists+linux-input@lfdr.de>; Wed, 26 Feb 2025 15:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEBB22FF5F;
	Wed, 26 Feb 2025 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="pHQlrFKM"
X-Original-To: linux-input@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EBA22A4D8;
	Wed, 26 Feb 2025 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583768; cv=fail; b=gYIcZPMa/8rytFDfG4vquicFRwfKQCPYXiJkUgTLoMh5s5vP8Rao3Bny3C4Dr1WpqJqYUu395z9QOsG3ucDInON2zSyFucMq6XygrwBpODcZGQEYvgj6tqBVCAj3FYIuJLzxGiwPvuAWULPgcMIi9JQ/O4nG8WsNe6ni0gnclSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583768; c=relaxed/simple;
	bh=F40z4En3IHsolODL83PPxSysQDWjodPKGte38lcrirs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oDTVIVwJuTv6E4BWWzvcudNqUMkqocaNpWy/YjNVioovYKGeZeFVlgM5yVOKTsp09q5K+jrZPtxWR4bM2RrdLu1CFnGIjMTiHwabpDQFfKpw5tz5eUWEZ51mMDAxFOLaVox+qQ3fYEY03sWOpv0Uk0+uedYonThWSnh3LmBT3lA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=pHQlrFKM; arc=fail smtp.client-ip=40.107.20.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OYLt807kWAaMD8GDa8n1EgBewO7gksKR6XIe8S7C4B2Hgr2c6/xqJcybDpHv+UotBCqShthNLcJ51MT4MfsM0q7M7kI3kAsOtAUZRrzLkjUtIfJCE/qyyKeBG3VSXEjn4cXx8jO0fIsjKCJsNNnsrcMjJwTbJrZ+D/wB30UgJaMSaXFFVhGPY7lh70+jKcpT03KYfOw98cacPY+CGUlghxTaqNwVjGMcJOqmvsWCumgbjr9xg7fiqWOq1Zv8hPS4CDNklRo7dkZ9GrbotLtj+FORGfbZ36L7klJIeccxtCp/XP/LxyXOZTP0/wY46uyKcArlYIg14n/Ii1+zKVgmug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fgn5ME1PJvRVuA9yxp/e/wyd4ESffrBfiDUvxiNJy08=;
 b=Ybpe5h8txsWYLelk/5j9VgsdwfHt7TeGKfyFO5Sm9D4bpXR26kfhcDHwXA1UCCbgrZao427CLkvbC3lB2Kg0E2COldA15dPIzst3OZb2l3yrQmqlWKKb4tHxiIwPygKn6jGw++zyqCy1zwQN5wAfGKQKWYH2Kc2boBFEpLoX95MM9i4le+Iic0S0bX1klQJ+PjXAh7d6Ckoax9KMZLRMiuv8VmHKcRpaPYpwZbtyMJkftp9Xs+gCABf18ukoG/po846WnzIiPsonvrGbwGVjgfPZVjW/NvR14H6Q4jsBs5mZzYG5ugOxHAtSIddMG5V8L9ax0MzH7qZszBlSBzICLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fgn5ME1PJvRVuA9yxp/e/wyd4ESffrBfiDUvxiNJy08=;
 b=pHQlrFKMvTZjbaNLvCpkIs3vlUIPlJIaCEHmDOHiTX4DlkkSKZtC+cV5zUFMGdqzxMIFwTeVJAqsjHbWZMMZgAXc+n1/3jTb5URQDoVKvuvPhbccOqQUlzat9bxwK63dcf2bjX7qfC7BAM3ofrhxAdbsFAUE8ktulvcVCUQuwrkgNzL/+f6OtKOtwo8mpFEDZMApiaFX7jm48/HudOJC1BeE2gjnPhMZfdMfGIJqUyN7zjr09lUD7ehwiOYY1c6/Mv+Dy7RrS0WI9Q2lHFbRiswIxfhQbVjCNvIxtM+Nk06diH53t44ZFyAqVbVA90U2Bp6n/4/IvR9V8yZJ7eglKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com (2603:10a6:10:f5::22)
 by DU0PR03MB8218.eurprd03.prod.outlook.com (2603:10a6:10:321::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:29:24 +0000
Received: from DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a]) by DBBPR03MB5399.eurprd03.prod.outlook.com
 ([fe80::2fec:64f5:1893:f53a%5]) with mapi id 15.20.8356.010; Wed, 26 Feb 2025
 15:29:24 +0000
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
	Markus Burri <markus.burri@bbv.ch>,
	Manuel Traut <manuel.traut@mt.com>
Subject: [PATCH v6 2/3] dt-bindings: input: matrix_keypad - add missing property
Date: Wed, 26 Feb 2025 16:28:42 +0100
Message-Id: <20250226152843.43932-3-markus.burri@mt.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250226152843.43932-1-markus.burri@mt.com>
References: <20250226152843.43932-1-markus.burri@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0072.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::23) To DBBPR03MB5399.eurprd03.prod.outlook.com
 (2603:10a6:10:f5::22)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB5399:EE_|DU0PR03MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: ff190659-45a7-4ce1-9e44-08dd567a5925
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?06HsAuD4DyUjNPs0pH/OyiBS+3MAGgDOMSE54A9uYQXvA7zQRiCmxdFmXD0P?=
 =?us-ascii?Q?Ly8rcKzdGA6LgJbPQeOOjzjKtcU4u1zg+B0vWesQh770F/LyBySXR+pkawxV?=
 =?us-ascii?Q?Qz+F/qYsfS4cbtpEWplI350NnrSV4uR8iiFktOJ4FSnnjJ24W2Cc5IJXJy8M?=
 =?us-ascii?Q?EbnIN9ZqiBia2FyaY2BhkMw/mrQ7XYugdiNaJp6T7+FUJlkVy+khdlOxKAZu?=
 =?us-ascii?Q?maXeoPR6F1o+PlpbsE8zN6lHVClahIqZHLaROFMj8HXYlrVfu7vC59xBWT1z?=
 =?us-ascii?Q?HGMpF+zyUjB8nVxnCeLr/2aeC0pmuTbRGfx7836cWkpQ+5JHDaxBhsWHmKk5?=
 =?us-ascii?Q?nfSUV4klhTiNQvdOC/Waklhcj4DfMES/JDm++doWJZy4ylzznMuH/LHkBv88?=
 =?us-ascii?Q?Urz1cZvD4PV3k5yXDwgWT74+MF1DfTKKnhjsM6i0FheM9ugcm/bIwzDq8uvX?=
 =?us-ascii?Q?TkHvfSXEqzwdGDFYENetgqhl+ofIIfPhrIIjWPL3j/8htBd1MhyMtTuXtNbi?=
 =?us-ascii?Q?c0TH4vNZboTemvwjhqn5I9YX4QqMJdS/qyiFB35NES1z1rbKnZmnhKj0dG9C?=
 =?us-ascii?Q?seSeFoL0cxnOTYRM1RGMNQGJe6HrfQ0MvRwR4Hrw+efXEIDL3kgLf0tHyCW0?=
 =?us-ascii?Q?WeU9gE/X4MUUpZgaXsel/lvVs5tOwK/r2wtrJMMDL6oqFpBJrnwTgKFFU884?=
 =?us-ascii?Q?srUZbHWhA/NlPC0yPbyKWTcghMGJNwn2KvS6KaV9o78uFCm62NdJp17nuVqt?=
 =?us-ascii?Q?UE97MJEpfQMlzdj8IUzPysa5AWLPCWYMMYChe1ynIj/X92GxyHshNTVujb61?=
 =?us-ascii?Q?qe5zQXSHZNjg4m8UubQaZPLUjTZhDBpZc0XNdRo/xcX2Ij4zJ6DxJ0SeUTNO?=
 =?us-ascii?Q?XbJROlEHqEm2h8s9Bq3HsHG8X3rVbwXoOaUVW51/DA+5xmaHuOroFPtaeii1?=
 =?us-ascii?Q?wakalsVfbcKeWvF7FO16wAR5jNy4AITN+/KmdyfZqHuN/xcGpBXK3XBfTGJA?=
 =?us-ascii?Q?h5xWEra4Kipua88/x1j2PJkm4Iug4NMsoBMN3jyK9u3B2jm6DNCzKSiAgb2v?=
 =?us-ascii?Q?qH0I5ZNJOEjZdqjmwtETpRa2j69A3d95WnGkNYhmNNZqTWUI1ewudhcl9I+y?=
 =?us-ascii?Q?xg5+vuSFOqE9nH4GLRfI6bSa1sxKukcrdoWD21/MpOwqbEk8O3aF6P5jqRLD?=
 =?us-ascii?Q?/RYPqP9iRhXuUZWx50eOzJpytCWcROQbYjFFYdprkqTBiJsi7aJ8TDRuOC65?=
 =?us-ascii?Q?BqxLYBgq11NgdQKinjxCgvR5g9OJOvna+0/Mxn1faqq0Kye2izHJpQ/YCy3I?=
 =?us-ascii?Q?Q6Wz/Ti5bSUyeNzNw+VRWY7zHFB14uuNX1DJcyD2YMgbtrm2Z1BMsh4aECIR?=
 =?us-ascii?Q?ywySS7LS1DTTT8ZhM2Vrlu4+rGw5Ty+ePfExxqNFm8zbOcNCQKWWK6SvWrVc?=
 =?us-ascii?Q?iXbWEMwWtSe0wbL5UShfhHD3GyOl/0Kv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB5399.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OW6mJfGbbW61QvoCvHh9EBrHmgTSUXShPoWin4ZILWmVmnmyDJ3rsNhJG7O/?=
 =?us-ascii?Q?kpm+Qx3vQP5a6WYJed9DbKsbIY/a9ndvq4GLP9q1eATK+pPLStvpXbogYcnG?=
 =?us-ascii?Q?qeUWRKW8mpuzRXbzj6DwAr/iYLcaedIiGWolZ6N74zYs1tA2jhDh9lyq/YQy?=
 =?us-ascii?Q?hOed4IrlV9vb1ZC4bKyVj3NtfCKBvMZlTM9X761zgc1oU7ciLPGL1/6aANkK?=
 =?us-ascii?Q?zAd8LWXfSIJIeauobW/4pRt+2bS3mmVecqtwGK/FJEpCEjenkLTP2xQr7lxF?=
 =?us-ascii?Q?vJseN77/OTp9Gd0WQ073w2XBZ3oxd8vX8dwH8b/Cn4Ejhwak8Y/zqm/9JCqP?=
 =?us-ascii?Q?lAVwj4lrSmWz88HxjduJrx/MWx8IN9jUc/vapzNTMaJH26Nsq1S7SXu7naYi?=
 =?us-ascii?Q?+uUk6P9qN+c2+9g3y2C+JwkK0mZgoAQXFpo9RnU/sA3utUlSlPXbacub6h/q?=
 =?us-ascii?Q?ZeVCkli7CU8dh1qVe6XoDTViWgbSqmmXKQe5PQsP097aKYlUVS4uu4/pUVrK?=
 =?us-ascii?Q?R1ePV6ppPCdtxUpHnSFxXwfNMSrmhaou8SU6p8OexVfM/W7YHyQiakjk2obb?=
 =?us-ascii?Q?vOs9Xhn2lLZtaO0lHEWrTEvUmymjlVU1/BCxl8r/NyNB5zd34JN4y2lnl3DZ?=
 =?us-ascii?Q?yX4ko8nMDhtHnekx3WVxvUtv8w6nWcHYkDUWoFuylAKwO4Z2RbuDdTcdnvGw?=
 =?us-ascii?Q?rkHCXb1gDVUM9+mO/hkcUKsCa1tfR3pgc1d0XsfhEs9XrREFO32BEVfQPH63?=
 =?us-ascii?Q?AZO6kjr24nGbEnBiQ14GvSD7ZfJWruSPhyG321ep2Hg0NIAtA+IvkH8QkToQ?=
 =?us-ascii?Q?i7f7l7czd+B8pSu9TuEOt+IKJ0W4YworZK18j4f0cdm/V1fpOZmsN7hVv3j0?=
 =?us-ascii?Q?wHGrJHQqEeOIRCR6UjkL+TEurn0spzJNmEJxw7SW0VSQU9SPzgo/kt6LNCSw?=
 =?us-ascii?Q?J0vZl9TvRx7+G9kfK6Ac8FTKDvOgNMfwXPJckLKGX0rbhusCKMsgZc6rt5hB?=
 =?us-ascii?Q?LiSSouFy4A6JJj4wnxzOnWp1FtKIpqeIKiEE2vag7a3FnzjcwVwCP99oHivc?=
 =?us-ascii?Q?g57rM881gC8AeN3HzU70Enm3tdEo5+YMgoIGgpjBM88TZoZYe8Dp4GAx9ZHd?=
 =?us-ascii?Q?xFfztOVlQu/meFY9cRiW2gXl3eMOwEBEQkjmva6yhG4dHUaIeuYYeaFwPXCf?=
 =?us-ascii?Q?rz2t+D9JAfiyvsKfdMGrEnCAUE4gz689AMg0VHocGxh58siIiwouNbyMcrB0?=
 =?us-ascii?Q?p1m6wTgLZyf32dN5olsJOdQf0Opc9/vwz3leije1MyAGZCyRgUgbkz9rJXOv?=
 =?us-ascii?Q?zm9jlJQZjf50D5NAjy2T761OMEhC6vMTot1QcbbsQErqhDUj5JEepFEuMfgT?=
 =?us-ascii?Q?6kqbIjq4OdF1tX/cKeoEjIZV+di9OYbnPaCVUI+psYnhubQYZLqQH1oDrm8Q?=
 =?us-ascii?Q?UTroy30Ye6EhqfUAVlRD52EY3fAOck8pxlq4sGoTqYnJzBOxCTZCYag2fWmz?=
 =?us-ascii?Q?KMCizDo+Rgql0j3iVinFwCXpbk8jN6jXmKU+soeos/bPPhc2u4xoaC2tTyae?=
 =?us-ascii?Q?RvimrRAedC0XfimiJbnWcvJnyFZUYXrecy/OBSDs?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff190659-45a7-4ce1-9e44-08dd567a5925
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB5399.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:29:23.9490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1YsSFBSP2Dtb8bVAFA2AqUDty/owU6VuyLqjZ7kaMFNUxcObTD3nG2tTNNpC3xD8X9dOdSrrGm8B9i1N5vH3lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB8218

The property is implemented in the driver but not described in dt-bindings.
Add missing property 'gpio-activelow' to DT schema.

Signed-off-by: Markus Burri <markus.burri@mt.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/input/gpio-matrix-keypad.yaml        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
index 4a5893edf..73bb153ed 100644
--- a/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-matrix-keypad.yaml
@@ -40,6 +40,11 @@ properties:
     type: boolean
     description: Do not enable autorepeat feature.
 
+  gpio-activelow:
+    type: boolean
+    description:
+      Force GPIO polarity to active low.
+      In the absence of this property GPIOs are treated as active high.
 
   debounce-delay-ms:
     description: Debounce interval in milliseconds.
-- 
2.39.5


