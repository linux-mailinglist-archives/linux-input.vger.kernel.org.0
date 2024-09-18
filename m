Return-Path: <linux-input+bounces-6590-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CAF97B711
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 05:23:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54589B21450
	for <lists+linux-input@lfdr.de>; Wed, 18 Sep 2024 03:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8645588F;
	Wed, 18 Sep 2024 03:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="nPiteInV"
X-Original-To: linux-input@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2065.outbound.protection.outlook.com [40.107.117.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB2B658;
	Wed, 18 Sep 2024 03:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726629784; cv=fail; b=IXU512xxrNFSDCc6NTOzj5nwFhqcF6ERQx/PuBsp1W6f0VRBAODbUwhYJPMOIfIa302Uongc7XPvLU+BMIh6/tPmlWauCGM6ku2r0MfdgSHFjL0J/Lys1dPQcT3WDFlOoibD/UTrkI2tKpjSF9MG1Iz6/BHqIE2n1j4x9AsJU80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726629784; c=relaxed/simple;
	bh=APznGLQAUzguzTB2Tt/oS4U/n7hSWaKb6oUF6jqrWos=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZCDO+eJ68YgJZ7Z8uERA/Gd01XJBVplt32VzrjhPjYHhFIMG6Y7PV+6QgrKoBLjHTJ1N2kzAMpTumauG63166q9IjuVPvKTjDWTryhyRBUVJMeB+yTgWK5DTK2rakDS6Nx6G4k4nvqBF2fie7P04Py3Hk+hwylKCgCfj9CyZLns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=nPiteInV; arc=fail smtp.client-ip=40.107.117.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgHzZ4zXWZPOk6l4Nojq3z9DUWHovK1xvbTHA4NQins6urjHwEjzdWQ12+W+Kqgf/neXNdtp16xmiHN+CgpndyeODXeZa5Ct2zVUoIEHjREkeQhoTHCnn81tyHG61NGFo7PWn/uyCBo2eQSlItC9yuHdkGPhU+3WBDU7UclkM1RHsx9ogv91kmJAiTcp3t8HWNdPIokk97wq0KeMzEPIk1ZB5ayK8hqAyCLqd5+EkuhZMN+BOVwJVIZR0hFwFm4NPC4zNd6IbhekTITlAyaJda3yESQfdJkeXGkgMVoBlFIPuHQjV5K3N2ZEhNxFghd8zNrhv7ECYxWE8rrtxuFSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5vITygCQNsczM1GtrjR+e+dl5NU4ieByUGkM6mWtlE=;
 b=c4D/Jrs2M74oDaWKB6Fa3vXjLHoPEsLKgqfUPgPc2OjOKmobuv65iCaSCimDJhkINJ0RUicC9MQz3NgNxdfffwrdj1lrNdbdd/K41EIenni2pVAXxjKQh+vRe/qe6WWJENPja8fFhS9l+cxUnqi51re9oqj9jdMB3/mrUoza4f0E5cOq0o1FKsZJuj8+aFL7vOX5NlN/xmCvFE8G7NzKId3pi/2d8uwRFORB2BtV5WRu2ZvYugbVwHzc8X7UDgTcwU5dfgJiwAHZ5bQjTU0n+zJGQiZ0RgvISMZ+xX3fc/wu1CTPnZ9qLyG12mKPPU0lbpEV4CyTK/tHNnFnlu0jkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5vITygCQNsczM1GtrjR+e+dl5NU4ieByUGkM6mWtlE=;
 b=nPiteInVQodftj1GUul3yt96S/AFADxroSw0hd+YxVNXI/1/4FGIp/qp6ue9i8asjjfw8if7CfYzm2JDUxegGGswccTCo96v4QzcnVR3gyqw539jSdySJWZlbUVZIskDRZWRTrFvYYVLI5wlgQVhbTXdiBvzWIHbQ3+Eu3PMUIm+VIvoLTSsNoQwy4dYAv+HCEQQe9n3ptOIfmBnHDmHfSxwK03XePNzvwMyTJzN9o8pxMEGVHvn3fRxSTCzCNrk2+YDw8DVEjHNMxjjcmE4KO2keyHD5GhdksxKJODSzGltYQh0uVfayUKl9xASKVUE1wn4x+6Obi4nbYDbI0/1tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by TY0PR06MB5209.apcprd06.prod.outlook.com (2603:1096:400:21d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Wed, 18 Sep
 2024 03:22:58 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 03:22:58 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: dmitry.torokhov@gmail.com
Cc: rydberg@bitmath.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] input: Convert comma to semicolon
Date: Wed, 18 Sep 2024 11:22:46 +0800
Message-Id: <20240918032246.9147-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::22)
 To SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|TY0PR06MB5209:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f3b843f-eb7d-4b8c-97ff-08dcd79131bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?swm/v2k/bA2AbZH7/k8pPG0MAfAcSmh+GDLTBsjT7ugpgEfzwbKOVgxKAMld?=
 =?us-ascii?Q?I5kDvz+yXpjmss7sLHaJ8kLAJkDo0fugXojgWtcLchueVWrQl5yKfRfon1ZQ?=
 =?us-ascii?Q?lXwL4R18oeIQsfXOgLLCQ/PPoEDZ7j8yu5b6OMKL+BwnlMhKevdD4cp9dA3y?=
 =?us-ascii?Q?UTW9fvH45xb11kYQCPFl+9SlvLdsvbmQwklcJ6NvBe21TWljQ+QQPPJVr05A?=
 =?us-ascii?Q?LXggNUVuRTOrylDtbBhPk86MvsufESvSGEZLDge9ru2061iI2lPyzcDALivE?=
 =?us-ascii?Q?HCkUHCmaBmoFVoUV0R4ffQz3fvzmx6P8r3UITtDS7LaK8Hc9GxCxsT9fM0yh?=
 =?us-ascii?Q?ACfbI5N5IjQsUvb2QFfc0BynWqdet+r96oQT3H+ocHbHAGmi4b+hIs+WTlYv?=
 =?us-ascii?Q?MsSB2czoWg8RpTieGx2ZbPS22koAG/d7HfvP0OBq+8XLivMXeqecaXNgGXn4?=
 =?us-ascii?Q?a/4A/EwSdoUyoLlOGj6C/Shrbi4qU/jHN4LHIThmPyVzJPxC1fWcTKoTSjbx?=
 =?us-ascii?Q?Dmht/dsZ8+ioSvL1k4X0GdNg5KWD49TqiFV9cea5nEgfLwWcV+K/YtPM0kbH?=
 =?us-ascii?Q?mOb1QwIR3QEbn2zOG0qrVI1hHgK7wHYOmN3gvGpf+jDYuVHDqdcvc6E/5k+1?=
 =?us-ascii?Q?lRkgDJ4TsgiANVoXiaE644NWaLCWA9biqhUQYgSe9KGO1pxviaFzQQwUHo6m?=
 =?us-ascii?Q?nMtsnVG+Qm+XEaBoMcS7CCppYgPd6OW5cR9foD0DeMGCz1rU7ZcWMHJLdfOz?=
 =?us-ascii?Q?G7mgW4H9V/ms7B4mvBuMesmMlmkPgof2cC8j0VRStCHIMgcUcsl/smbsNBBS?=
 =?us-ascii?Q?wIh9mdOZHb6jfeelHVNtI3bVlHsOc1WPDC9kTJNNsPzs4onzNrfQeHl59m0q?=
 =?us-ascii?Q?5rR9UvO47adMlm2MTFWz3MGm8qSPFWSaHZfx0k/HAM6q+eGShqa8jpC9h1d3?=
 =?us-ascii?Q?QUnFguP02+2s5D5b+JIo4pS+e5iMRT6Bc51/Y9nVcLW4VUcvV5WQPcwNjS/l?=
 =?us-ascii?Q?/uajVYk0J7596WmNd4qbIlSe2DaDxhmmyBSVY9Ys21o8QmI03Hi/bajZnbL6?=
 =?us-ascii?Q?+4VOLd9Quv3pw0N3I2wiFaRLH8Imzhd/3iqaKu/PiprpZsTj/Csin4yjHJpJ?=
 =?us-ascii?Q?5lryuNq3QaP2WoGBtBZnXvtbmPGPmVuS7Oz4hZ946Cj4yKECtwJRE5XsBlfG?=
 =?us-ascii?Q?zZtevOE+7fWLts3Xndvb5qp61SBdbldYlc1tJYi+Ks7ieIwhm9ZLzI1chKNk?=
 =?us-ascii?Q?cKStOMEyqlyEwYQWYVfCa6HL408MDTwUOfxOTHVMGYRgheUkGyYUkvJlO4cG?=
 =?us-ascii?Q?EIXSi+IJo3ZeJl+HfDai3daWQA24ChzqUr9VJi6Kb/TWkg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vqJ2MZ6B3nxLU4zv9QlNLxzPa02eNNMnsXWS7cAhKNLiiJeVKEOskaRHyJhN?=
 =?us-ascii?Q?lbrHMsAh5jfcrBcCabQL7zvlJjJMb8fT4UJUxICuvNrkOdtjfMmdLE6IhiDf?=
 =?us-ascii?Q?0tySzdwPUHNuHOd1nvixHJyPBiQv1DQg4Tf3GLTQBECj7XyPc1ouBF1uKYK4?=
 =?us-ascii?Q?ouNl4Y+hGJ2NuS+D0lobyax/nBNaShhgwaMsknY68skmguOteT6DqwTAb/5v?=
 =?us-ascii?Q?XFIl0gBOowJTV8X4VkfzvLom+NL8Di0Ju1A5UaGOrPXQjmEPaEUDZpoo/Su5?=
 =?us-ascii?Q?tD+5qXGQLvqREKqeSyX5WIU2EDz8iRb4CEBg+m5k00TPV855vTsOT8y3AaSi?=
 =?us-ascii?Q?CLcgis5qJVubNv/SBoTvP/5H5yHN7hcHKF+7QQwClGNodaSxWQpj2z40Vr/u?=
 =?us-ascii?Q?jQgswjQ9XvaDenV/aB+4+bd0PSU0Xplpjebv67jqosKV/vzIn4U99WCKMPVg?=
 =?us-ascii?Q?i4TTxCDLCdhKBuR4V+S8G9slZcGUkOA4yQQVrKEV/B1rJ/mrO4Xz0Tj5mkKm?=
 =?us-ascii?Q?H158D+75a4daU2iWUc+Te4VbqeRnUZlOpGcySKtJlapb7vOq3zH7jIXmpB3F?=
 =?us-ascii?Q?Lf9ff+GZc+myO2ChhW/E33TfcG37f7+znytMf3QrP/Oxh+/PUlEAMUSN0Usj?=
 =?us-ascii?Q?nbWiPy3Wo5/fJztwaJ8DooOuyRJIig/yy6UlB+wzL5LZqljkOM9stwNwFv+I?=
 =?us-ascii?Q?VUC1JeogAIYtNqZ4nMjodVpHo9QoRoQ+jt39SQl5AFmiIetxuipBKSSo5FSB?=
 =?us-ascii?Q?P+OIWOAysfXcee3udw835pEA7pkygmHMkZPl8H3iWnnTS5tQlZ1SNp4b258K?=
 =?us-ascii?Q?EvfjN0QsCRjyx6dRv9sfnJsusSCcU0iefVTU7RY2BiKp8dlmFcZWrBDONBDW?=
 =?us-ascii?Q?RebL1AULm313RyCNLufR94ICyHsGILBrliPMX/SoyVCtHnXIXl9V6XyPhxCW?=
 =?us-ascii?Q?vdW2CNne6XUMHfThv7MerWu48b9nLmuldJIQQ86Lbmi+gABff2lmiTXd1qKP?=
 =?us-ascii?Q?xeECbL7EGJyj3PUwDFNtQDuACur6oy+k6LyJEAjUquOwWJK5Z5m0FRKTB7lS?=
 =?us-ascii?Q?40L4Upwgt9d2B+y6pDzccgYPyTwL/1gqs0fxaSNDqRML84DLQfREr6Ix+ZOr?=
 =?us-ascii?Q?kojKP4ETqvBlH5adHoKRA6s9xUMwRzjC+6RuxRQHbjlm2z5nyKA2i8vvUNQr?=
 =?us-ascii?Q?f/Yq0NYauGD3SjiIw3ECdWCurKcF7nXBgf+OppX60z8LdcHZauDfUa6eS/V8?=
 =?us-ascii?Q?uqPrbdYtLy7KkqF90kP+L2wuBmUL6v7F9fZPgBidISreuCOkmjch+fmfndbe?=
 =?us-ascii?Q?wcgs2J89eRMFs2gxachqZt71JCBKJKRvDxG4MWquLkhGemg5asnjALgy75PW?=
 =?us-ascii?Q?ERUfpcyYZzaSx+z2NT0JfPh8lffdeJoHEgVklkPFGC9fPzqJJ1IgyPkQ1nzt?=
 =?us-ascii?Q?333ha+x6zYiTUmjasMbsDtPUp1JaoBR5jxpSL8IPy2j4m73j8mawrjKheWMg?=
 =?us-ascii?Q?CT5S4j6ztHvnN7S4ND741xBPQExdstVuWqXxKSEWnHcbOGBHY7OZcnCCcBap?=
 =?us-ascii?Q?dTf082cqUW4Gf3ZYK6NzQS5tcEqp7fLtch31Q0aa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3b843f-eb7d-4b8c-97ff-08dcd79131bd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 03:22:58.6829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iIV73moZZmOyMEr5XGmFVPaR4GctsvcEPwDBN20EVNcep4xLu2OoDjJhmd3unoLznVLZLAcWwWRqmIaYTqdOEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5209

To ensure code clarity and prevent potential errors, it's advisable
to employ the ';' as a statement separator, except when ',' are
intentionally used for specific purposes.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 drivers/input/input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 19ea1888da9f..47fac29cf7c3 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -2221,7 +2221,7 @@ static unsigned int input_estimate_events_per_packet(struct input_dev *dev)
 		mt_slots = dev->mt->num_slots;
 	} else if (test_bit(ABS_MT_TRACKING_ID, dev->absbit)) {
 		mt_slots = dev->absinfo[ABS_MT_TRACKING_ID].maximum -
-			   dev->absinfo[ABS_MT_TRACKING_ID].minimum + 1,
+			   dev->absinfo[ABS_MT_TRACKING_ID].minimum + 1;
 		mt_slots = clamp(mt_slots, 2, 32);
 	} else if (test_bit(ABS_MT_POSITION_X, dev->absbit)) {
 		mt_slots = 2;
-- 
2.17.1


