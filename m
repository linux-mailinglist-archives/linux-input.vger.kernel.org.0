Return-Path: <linux-input+bounces-11898-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A160A95305
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 16:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC2777A846C
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 14:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7408C1DFE22;
	Mon, 21 Apr 2025 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="EMV5aHeW"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD291DF751;
	Mon, 21 Apr 2025 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246877; cv=fail; b=DfYxB5dlckPmWyZfiCAdR2WRYzwuTdI+7Wr3lyDs/Ms1gGvky7s5s6ffJ8MptDAKfFg7NEBCxRngeLERAReYSJGCt5bLAtQTiUwXWwwqOmmt7UjlAE5dNG7wqPg9/QE6nawASLfVic3l1jYiZIHWkpbToKZzdfN/a0CK3U714D8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246877; c=relaxed/simple;
	bh=5Tx+ToFKEej0FRFLmgCMR9Q+LKDvLFC2UIzpNzM6Kr4=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=ACzYNI6UdFKDmwdpC+L9ZYLyfbGuf2MJMxuzzkjhETkS2n6bk5+t4UhG8DqXaIZlF9+pFblqTXfQ58YfH1yo+NfZlIEV3mZXBU2SA02TNbKymDzcITZc7S6lWg1iOrHvoyoki5ZvtcD7aokw9bfpqvZb98QH7gEyHI92MqM/mgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=EMV5aHeW; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIQ59k1hzJ+qtQvZnCIPLcchSWm7arUS87eofQvQgtab/xL5t+M7JvIg1DmZ1+mz7kye5UqWITFVDh8V+gErvND3Z26fIb3fJYA/peurS32hqm8eVixdIKgsEGdpJyAY62Ksng2tGFsDiUbIS6wZNa32c+OCpjO5z2rNFF/k1zpSItUFOHS9csQC7drNlhL9nqtHjtU3JyQPLTMOSsT0JWJ+nc5m5+3hTFcgviw0hibN38i9DDVAvz3zY7ATnM2nh/O2fNEkxj+kFCabUSJZBRf8S2HwV5MZFJMPlfBxE3sBhy7em4dEfP8DohIvcAcf/dOuSVFHR9gLpvwre/EfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwptqMdlGzxr66m2sTe3iqOC8vt3EIf8xP4xUDidl1E=;
 b=H2GZDRhBDG6wixAL51XDRv5YHhCmBieYz5+qpoiLL/MbiKg/f6Emm5bZgOFjXs4VP48bHHfJbQQQkzhVEHgDk4G8H90v3MM6FDdvSC0LOBNn2XwMyjk0uT4bJ+K2iKWIdGHBsWWqrGQG1n32d6Zs9XC8FDFOkKdpZHgPU5Q5b6Hiyx1bQPk7+L9KpUEt2n32njG00O42n/XS2enjtkDNh3IymzpeO9byYjZHHQVbv7ke+4xbdLEZVeW5NpIHzsXENUEWsvvLSblzrw9q5L8ccsklYiuCus2Rf0nPO3zrylyJT1I2ZyidbT8twYIcB/SX1AR7i4gpSn9hJabgwteskg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwptqMdlGzxr66m2sTe3iqOC8vt3EIf8xP4xUDidl1E=;
 b=EMV5aHeWnPPXdyQtJZj72TOTPIGYpuPb9lhZd8TcR3IKJuey8pioVZvayonsndkP9QO7Ool+gYISWlVx3JrcGhuOnDdiv/2bheXlYIMMd1baNHuo4PV179zh1RrV2S4xK/PQ6P5cxmE75L43ZqCS7TXb8KCllAuuLUepFW2XkS45jhS3A1XAgrkk04WZ/3Q0u3mV+/GhcIzbmNSFqwz2Mm0HQBT03IVysYdXy+MOEmim6Vt//u5lQvcfqi4k/dv3mRxcRV/epBAfIQFuI5bv3KllrKZRDOf+tedyNFJecZTq84zoL20ULxGOShuF8NoiJ8WyYC+5AUstTCDzqgX/qQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:47:50 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:47:50 +0000
Message-ID:
 <PN3PR01MB9597FE8E849880D02DCF4D71B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 15 Apr 2025 21:42:33 +0530
Subject: [PATCH RESEND v5 3/5] HID: apple: remove unused APPLE_IGNORE_MOUSE
 quirk
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>,
    Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:274::17) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <b921fe451201b6bd7430b017379ad9ea2761d960.1745246807.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ac2fb5c-17e2-4197-3b67-08dd80e37d30
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9XmpI8tRyoOXaSUmOkLVCBKasrSdv1SKkzqOUArzoKVJgEhmkgFFlpJfXMT2wHVFBmqfyC8WpW4UKpeEfDGRqoUxY8uehmAApx0eJqdm0P+Po8V5h0eRmVMpJwjNDMig1PbaLREOtcwj4ATqFieFZfBINhWdNMXg6s0CbS9EysE3gaMuolPSTkw+gs82kTDhkpl2Q8pA5+ScEHXUzwchrjU8py7XpnPL3RQju0T/CfBAgW1LdM/Vgzdp88C0ANqNRYSezLCv9mbXSfiKIPYdrCFd3cL1vIOuxvSTasnKyegtJagju7vNUPvfde5l0S7PgPELgW5RAOAQxbO/KGPS2rPZx9EZHXRMGIHf2JBwOzaTe66C95+x3f2Y4WddTQKLeIALyg92p1s9NQYeZu94jqeoDX5KrqNOLj558Ixt7Q8rCwGaRZs12dJ+M9eA3LAqhEeQAQ2nCbt1/Khihu+Yf5I0wTbZgmLVLKsUC3DyC+0WwTP0eT1RfhzHVsU5n9U2moYKOFwM+g34WQ0QLf6DmOh9655P4VgAGtCJWbz9pTnKkrLKdHkA1DLfvJiMuuvtMX+EdrkM1aTVDGEbMNBF789YBSEB6bI0W2U1RY/80I+5iMzaejj5yaCUsHyaLNO/156A/hYpX6sEGju/AtJYQ+siX1BlYwltAUB8wD44OOMBVEZpnwmLTXzR6Hv2j1nNT9dO9WCLEbG2zl1BxLI2SGq04Gtk3HHVdppZUtu95mKKoBb1sgxeTtyFsLDvu87oLW/0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|19110799003|5072599009|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hrjaK7l1kidIuS5BuJ6Tvv0leE2iEY/ztvz8aBXhpFZuDA6XLZO0hlT8oU+J?=
 =?us-ascii?Q?pBXNG3zZbfF0qGmzOrIhxOTBRHR8mQ9N1C5/yxEM4FW7V49J8kv5E8ycMBrW?=
 =?us-ascii?Q?FX5e0fdeX09+YjJ3w3DRcwXvWi2J6aF3BpPQKYLXhawIou6QqzM1ofKJSKoF?=
 =?us-ascii?Q?c3mylwSJg2MNVwQTPTj64mCQrUuwmMqDrGTHmhqEfGDZEDfi3Ne/DGpeMwzW?=
 =?us-ascii?Q?f5/kTq43BPrpR/uTnudEKjnx2OaytflJHwcHUNU0wiiLPcW3vPoe7+8+b39p?=
 =?us-ascii?Q?xmzqaStSiG/e0YkSNv3Alo6ZZQIV12+M12flz3xschF8iIIJDEY9Bw3pPWxY?=
 =?us-ascii?Q?mrqrlQ6eVBOmQXXgD8uxLBWrgj+1pb6j3mfhrq15IhggpS3INWZnsOuSXizP?=
 =?us-ascii?Q?/jqSdxBXvK0cTCxBNgQdZxrG3Ny53dtfDUIbGX4DgmEGN5RGfg6zpKA/Ng7I?=
 =?us-ascii?Q?xxT+QQ7JXHphc/DCRyqpKFwY9Qy7fL6X6veBjfWa89+daVD3G1/epMXIbPOT?=
 =?us-ascii?Q?Dr2Ikybr6jvT1bvhbTTyic7zLvAqJxE336oaKHXdY2kc2DGBq5bhNU+j7I1R?=
 =?us-ascii?Q?7IKlg3/zw+WWK+685RGjtHx/51VvI3U+bDAqWSvhcOiiilr+7IvEc0ovsO0L?=
 =?us-ascii?Q?oAg0atIb4+8+bT+jFJ2Ef9jZdOTkP4ASWI4jowSyx8fMCYuxzrn9NQrlceUD?=
 =?us-ascii?Q?LkAk0VWYCMF6mXFsY6LYBkhZGc9B3soXye4halQ6eqKDJuPZaJcAUOaf5u48?=
 =?us-ascii?Q?5OiPW1Z6YHS/bdbV6wXSOKQHk7KoyCr68i20kO7fG5DOC+cu9iY38ISOua+d?=
 =?us-ascii?Q?O++Sm4Gsf4PC2hq8IphWosvLKncBK7wIlTkkzZlTx7DgR8Z4zlYkNep08UzP?=
 =?us-ascii?Q?EVk0n8dkUDf6OAOUiRd3HXGUG/KcR12GILT+tpaKqqFW4Z7kS4a2rX5f1yZT?=
 =?us-ascii?Q?9p79ivu6UWDQC/L9rcVRpPbmkSOqdJuDF1lfO9cEBrpck5Lv4dO9xC1kfTqm?=
 =?us-ascii?Q?6LIXyp8Ey2qhdHRKEXHRap4U1RSLC95aUykV0RtxasnQBbm4e51Y1GDxngWD?=
 =?us-ascii?Q?IVLfvmHPl0hiOKule5m6Kc9Whz9Vfau/nVnG1IKB6bc+o1vzUBY=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bnwDu99EG8PBL4lhE3K+iOVVdYYCZ5xJ4gGagiRuIoS1/nnJ2fgiV5Vak+do?=
 =?us-ascii?Q?pSOuVwnGOwANyBfa9rbC/P/FFOTk/ToMnkzS78W0U2LPLf/QPipM7MZTcwSZ?=
 =?us-ascii?Q?qjSQlXafJ2xg/jWft3juV1EqY7E4f+O2wuiB8yh+5jnHPNbCEmMvQfuJo2Si?=
 =?us-ascii?Q?hVRl/9CmW7MQmL3UsRfW+udwCTPvVrQveb91PVSp+G4w9NGLQB/n4Lq8IviI?=
 =?us-ascii?Q?PxcKuxBa+QqAuMICK5XRx9uFHU0mdeR6VLUNFjDE+XRQaAP8exXqLdP6p58T?=
 =?us-ascii?Q?FmJRCE4o5LiVaOaO6K6AFgrEZIDCRF1qq+vvgvdpOnbDpfZ3EDbD0a9p2kjL?=
 =?us-ascii?Q?BM+L+Pk4jNIZnpFchiOQHobVU53mVZCJMVkEzH1pouqgwmIjAF8pKdyKnyiv?=
 =?us-ascii?Q?OpuBRf7q4N6P19eW28maZvs+HOaD3hxF3UZLi8g4IWBPQp+xTeBqv6pH8clp?=
 =?us-ascii?Q?bYOvQH3XM2Zms6SJDu0/sM7JnNHJU50pqblD6tGtY8U8kIKN5uY7HIkCSLsm?=
 =?us-ascii?Q?69VOxPKfYnc8y+xSv2tqrba/1yCPfoisNRxnFfZBSCnaIsC98HFiA2aFT+Ps?=
 =?us-ascii?Q?L7SiN7ip0hJ09KFCdUbF6gf7r2+/r9xdNJ4t9ny7W4ZjTHKsMcfuJlRJSvDs?=
 =?us-ascii?Q?G5GxRPtzEYvah3dzZD3GtsDEH8AnzlQVqVWCrg6xnQz5fvZT+1AGnKDyjH2O?=
 =?us-ascii?Q?j1yrC9ki9LIaLjTFyjeLFNkq23kLj/SVoJ13nU0LMX8NO0lh+Yr+NceEAsys?=
 =?us-ascii?Q?rp5Bu3/6xOJmxuKRHEP4f9jOmOs4VJP2QJ01mMNfw+CWOilYDY/tZnUU46Vq?=
 =?us-ascii?Q?XCBtrOApupzPGllKgHlBHneezKDLSFQMSF1fHckf1hGLQG75zX48wAq/5PEh?=
 =?us-ascii?Q?KwyvioP4LCEI9K1ofGPUei5E12o+mtMlvavoCtx0d8veCgtiLGIkJTfKocMd?=
 =?us-ascii?Q?i7G21sQ93g/rjn5fwwy2dpe8/qbRZhA3MHC9akyaAkFNZESGmwoBjUcYervK?=
 =?us-ascii?Q?2BT/R3y6lAITF3OdfRBsoubeh+GlyuyTM5XnARizPT8f+JeyUs37xsN0N8/Q?=
 =?us-ascii?Q?22RlT1RiTpYjphKtswD7ZQ3vYu7vyKAriu5Le/LlNFXhEQ+wjlEhLqxJpSL5?=
 =?us-ascii?Q?gODz2IA+ebfIHT6gwnEqGSKnj02Pko27Sc+K2QZlky86c1lDa8c9FPm5haZm?=
 =?us-ascii?Q?dShJwwvsqv6qXmV916RiUqyBjTmnisqihQbHGZHKuzchoY3iILcz/iUHAAo?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ac2fb5c-17e2-4197-3b67-08dd80e37d30
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 14:47:50.4341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5918

From: Aditya Garg <gargaditya08@live.com>

The APPLE_IGNORE_MOUSE quirk was not used anywhere in this driver, so can
be removed.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 3d7befe0a..fde438bee 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -30,7 +30,7 @@
 #include "hid-ids.h"
 
 #define APPLE_RDESC_JIS		BIT(0)
-#define APPLE_IGNORE_MOUSE	BIT(1)
+/* BIT(1) reserved, was: APPLE_IGNORE_MOUSE */
 #define APPLE_HAS_FN		BIT(2)
 /* BIT(3) reserved, was: APPLE_HIDDEV */
 #define APPLE_ISO_TILDE_QUIRK	BIT(4)
-- 
2.49.0


