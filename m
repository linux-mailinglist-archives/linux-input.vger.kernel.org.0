Return-Path: <linux-input+bounces-14230-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374AB2F481
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 11:48:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08D2C3ADB75
	for <lists+linux-input@lfdr.de>; Thu, 21 Aug 2025 09:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5442258CCB;
	Thu, 21 Aug 2025 09:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="qrE0JwY6"
X-Original-To: linux-input@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012058.outbound.protection.outlook.com [52.101.126.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056782820AC;
	Thu, 21 Aug 2025 09:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769688; cv=fail; b=G9XGycynQ77wWUa+rm5reO7CrHOn3WgfXMYGkUHV3d/PEAxVKQ8QCljgH9Xpn/TGGa83wO7NQga7U0SwD5oA8TYZ/0u5msnKHhYRgTFzozU6FtC1fFyfy8ALoGlzQrUEBhf5u7uyK/k5LuJzCG2RtcKOEVMqs6ayruAFA1XwdIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769688; c=relaxed/simple;
	bh=C5vWkDZcm1RsojBuI/AkSOYji2GHi6LMBYRcc6Fm/mQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=B85PzFYjwVlThOsYsBXjr9mdbOgUeoooerDNkeuDwYSQ1Be4dTt433tvwstGvbLIYMPI/teAqbJ9GdOfYNoJXFC8OK4Om3c4DZdtXEfpAG5GHbXW3MplO9d8QMgHTBn5vN5p1BkrS1SLSuPzqF7OTtUISAkQBpslj3Mf3gZo9kA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=qrE0JwY6; arc=fail smtp.client-ip=52.101.126.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sARsOMoVbNBXDI5XyxUAdke9ja3g75qhNWVvtfxAR9qEqWnDaKQ/vudheGbbdxOQ+zToO75mlfw2gBcdza3uHSGjMR2r8swKSkWlGW8H+Rqh5KIRqX46JaqFU48Cz7uH5XRgJn70UN9fyfKrMpIqTvWuWCqVHGd4QhzJJirP0OFcxAuHGIzNRPugUe3E6El4f/M3ib2hxXoQQ06GXJ6feA6DOJNhsUa9cVUCJgcQqsTHglIyRj/qEQcqUbu0ESZbQCgXEpsVBnuCBKSGJqsonvf678qrS26Lf1segIV7sBYbbSlCMfS7g5ZQVYe84p/aN6TPkjJK9b0CdZGX8/bi/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYbnkWWiGv4LCmAesNplOhRwCVrWSp8sMp36k4x5oTc=;
 b=ZqHjFYN21A1Ck3BuKaELAaNM+2gBfO6GfOf9yGqEsW+6hCWsvOkr6NNIiMQ3YHNaHWMhDwVmGDtQTPgszOdLIwtCImoBWndiAMP+jF933nfQGYjlf/SEG0QkseSsnqOZqgqeaJc4LI8WEXUByKic6joRDp2NLu+3qTe5lG3VBR4Usb/IhtHRpkIygXOhPB8bEgb9/CpfBmMVq/B082V8BGk/cX+AJUbXY3Kv+mHc+ItO9L9q2MZsz0J30n4mQSAXL8GxAI6ax7XFUBMI/Pl/Pnoo9KGLn57Ys6zEp2wg/r8Gonr0P2me2lWarQxbyU7mFIZDP3CdORgdPSVuujVfzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYbnkWWiGv4LCmAesNplOhRwCVrWSp8sMp36k4x5oTc=;
 b=qrE0JwY6WDIjTWD7uIvBDjbblx7ot5wIJ5v1QWQr0jZyRj8Ek6KWgbXchrxp7wZVkW6xcCHiLwtOcXE+Ydki4z+zy+o7ihWEDNPl7BRqofljFVK7dHWn+WKKHFcXRBbIQSygxJUOGsRvBgvlxqw0o+uwbLzfXpw5w88C709R6SwIVwYfAUscHSZePu/2e/XfUdiMBg3t3t83e6XaszfU22mfhBGORVWC1IOnKUaoJXIW0ZslBaA5kVCiQbXr8mkXfygn8bxh6HXnCwa2aQW2QgNuiSB5iajav7bUK9SSFZcy3Rfyh8OdLb6CmQkTooaSjA0W2AcKhuLp38bvXyWB1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by PS1PPF5540628D6.apcprd06.prod.outlook.com (2603:1096:308::24e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 09:48:01 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 09:48:00 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: heiko@sntech.de,
	dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] Input: Remove dev_err_probe() if error is -ENOMEM
Date: Thu, 21 Aug 2025 17:47:51 +0800
Message-Id: <20250821094751.573411-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0210.apcprd04.prod.outlook.com
 (2603:1096:4:187::7) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|PS1PPF5540628D6:EE_
X-MS-Office365-Filtering-Correlation-Id: b83f86f4-5c80-4464-182f-08dde097d0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rwckx7dk7rUcWxUGOfK5cugjxVDoID0RFlSxCW3qFVjWmgvEid53MD+Fwu3L?=
 =?us-ascii?Q?Wmo1yB5+QIIF/7T3DGZkTdeah/30J/MkN7ttNXJdN+fH/gHDY2/tK0rmNeN1?=
 =?us-ascii?Q?Lcgg/7U/cxrcmhh8MHVmHdbjPUvkDPBLRaf7pA/iPprE2ReiELR2RxLWGm64?=
 =?us-ascii?Q?cOPjtYTOmvSa5Kjct64u+SbuhABBpYhJSZNKiaTZf1vqIEU/jrMoPq4beDtB?=
 =?us-ascii?Q?F1DQpv0NcGdDqFUl3lbJLyTZdkqMalK2XniLbz9rbVNiPtLFZ8p9SNuHvCyV?=
 =?us-ascii?Q?MCreMlK4lW+tOuLKrQLTV6zNL7uYIk4SKP1fBMkI1DcquITDWlHDx+I84sQY?=
 =?us-ascii?Q?7TNLKFMzsgQiUYpCOb9YDYuPiLecNBEkCUmALLo/+8zE81Qnx57yJG36v+3F?=
 =?us-ascii?Q?R3QiElMpSqOHA8IhrHUVS5mqqFO9LaXc5RhGCiCsEeWd/JwgSkJLcMcbvHQ8?=
 =?us-ascii?Q?OP/LEJfpivBT3MNzq8huGNQXVPDNsKbCPiigq6CvPxT13V66+JfQ+9/HmVnF?=
 =?us-ascii?Q?RNnOeNH2dQAVcYsR4vIZti3orPrt2x9sY/PfEiRz81kCPcG5bOmKsO3SvM0N?=
 =?us-ascii?Q?8UZx12a89JEIkpd63GGa6yIRYRbK1KKHwLMYfbz3VjGQJp3OXX2cEnyxQe4j?=
 =?us-ascii?Q?G5FRMP/Zt8ZT62He10fd8fyKjhgfg6A5k+ByIhCwJoH4omA+oMRlpqEWRBmp?=
 =?us-ascii?Q?dkyCh8i2s/Beyq/E3/2dCvsRqZVTW/uPNtE63biqPxYbRURBqHHN00WJa8rt?=
 =?us-ascii?Q?8y9HB7G/ATT58gJcR6d3t762+/7rRwLx2ocNCOgyA3DqyXr67HUQ8tu0MDTL?=
 =?us-ascii?Q?l2qS112bA05kRCN6T3OwmilZiZl3Is2E0KcYJEI/XOY/oex+JGD7t19Y/66M?=
 =?us-ascii?Q?xJk+zWdcqUOyzOv2Y4LVohQsLO21T9TzdbfcoZeIP5KvWer0Ottr0FYjv/qL?=
 =?us-ascii?Q?Ipy4qnS54COAHp6UQeNKm3MNz11gLuYkzlvi96TCqmj26IJpNWPEuE9D/6oR?=
 =?us-ascii?Q?wcwLfXMiFVY2/+CutjUSZi2Sr10qhnJzvLZEEwbd2tEEGiJejbzVpKWy+LRw?=
 =?us-ascii?Q?CnELGdHS6EA0K+bMvB1zmWDQuJjU0JHlORaHEGw+O+12ii8AV9o/+ucPBhbJ?=
 =?us-ascii?Q?40cA34g4YyqFy188iqhKdi5zayFd2/+IJXYV7dSGVpB/plWKsIpGQyiItoPS?=
 =?us-ascii?Q?oWE8sL9Dc2DDxXmmX56TT9ih5bb8KwRy/2wu2GFZAY4l3LVEuRYS4jPrMc+e?=
 =?us-ascii?Q?YXj17TD7drvlfsADrewdVyJ7dYnJCou+oy6Y27L1gqoPicDzdDAP6WYjaNFj?=
 =?us-ascii?Q?j0NLlteSkTqZWiO4GT7bOJEurC/xsxxA/uG9YHxC5LzvLHf2GGHgOjmtNk0j?=
 =?us-ascii?Q?B9uyyR12deu9nIo9jbrJ9QPPAb6r9gZfOyxcoPkoUjZ7lnE/OsGDYp0Gk0/0?=
 =?us-ascii?Q?q4ZC0BS6WEn5CtgmRqs74FluXxP5M7RTlM+v4ibiYn8Vr6s5IcpeTg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hJY9Cb2nAYHDVS0tPsH+R6ntHNLy2IGou5ZGpj37dx9ArPgmnZQ97Nj25qqV?=
 =?us-ascii?Q?k3dF1OdMCFmtBpV+CZr0z+lhufULPw8yIFov8Bw4WFxLddHdV5SD1mMzzSWA?=
 =?us-ascii?Q?SKw0AfF3V01WwlGLxfeQfz0X7hN21G0aE7tZL+7W8pgUvI1hXIcD/yj6y3B5?=
 =?us-ascii?Q?hbRYqBcXCSdXgmzeT/lRRblbals2J1MgBqSctuzuSv7b4PsZWuGdqLqYn3rJ?=
 =?us-ascii?Q?7SMaqnZJLiKMKm2i1dTzQuw2/mLaLxaoqJ9FrHg2KzDYJCj+DGZu0FIq6tNS?=
 =?us-ascii?Q?9L/+CK7Hx0IJ03l8DLsqmWs1gK50ekRPxzi/w5+/48wyScJsL8nxJ6mre0ZC?=
 =?us-ascii?Q?EPQrPzelEeK3vzZK59fWWPuRv1bPi0ooWfiD4D2L46o5zW1DlbB36mwXdj9U?=
 =?us-ascii?Q?jxMVdlogsyyJF1UsCFzJTK6W3JloU1mLCHW08cMm3WVQTMNOGb8VNLERYaLR?=
 =?us-ascii?Q?AKgOhDUDGyUfUI2sHkhcm4KGZzwqoj582u16koZ8H85OBhD6rYBqZXJKshC8?=
 =?us-ascii?Q?GyX/eC4uqplSxj32fO8dIfPgx2aXrYe0gQ/9Fg7ClwEVkANmvE2eeDHFJq0X?=
 =?us-ascii?Q?NxBtVrTL6PgWvs1rEJgkOtp+xg8uTM0hJy4/SBfvRl6va/Anhw/pS7p9MKU+?=
 =?us-ascii?Q?ajI4gJLs3F9Q2b3BTqxOySkFhRxe2Q7tZpssmC107iIuKrIdDLpX2FeB9e24?=
 =?us-ascii?Q?NwUVKlQRnc/snoyOOFkErNUa1WO8awvwrw4mRufpDG5fpcWA2CwMv8ty2iEr?=
 =?us-ascii?Q?mBUkOC+Sfd9S/B3trnK1tFu7G46RlrIBwqlPktfv5vCy5HJKfCVNdKbfduAg?=
 =?us-ascii?Q?u9+08gvCT5qQMM+mF9/gxORYgj9MbsMSHggNxQMo4VtgQKDHxT62UloAU0oF?=
 =?us-ascii?Q?zJ6VBPF8s1jX1ND7+Ri3S4e1qL7BMnqxoT5IAdlvDqQjyHeaIq4X0XHF7sHe?=
 =?us-ascii?Q?+fgm9ROQpHQnk4yB42F6m7+Y34eIzlv4NQl2kcP8rSdpio03HBXzTiSG3dkg?=
 =?us-ascii?Q?iLj5GHZdcoFIMedxlMnG9/a6v1s5cJ3iz33kXVwSOo+/s1fFSiyihFVb1dRr?=
 =?us-ascii?Q?AK0zKZWf9UuPzf0qKnU0fjZ8rHdbmGb2zxmKqTEa8SZOyQgq8b+mMkVvhvyp?=
 =?us-ascii?Q?+C9gJI6Zbzhs7+wSUE7BbvgmY8Ao0N5gZ+4FyebukiwokDfMp70aQ1Ssw+E1?=
 =?us-ascii?Q?NglFnAhyBjcWhr5dpELuujXXLOfG+mDpBkivxc+ZebUV1hGstvDvF/mA0uAY?=
 =?us-ascii?Q?iLuiYCupAF/yWIo0NndTMM+G0XNwoX37bkDq7QL+MVkAHeNMSs3gnJ+5K0Cq?=
 =?us-ascii?Q?lAzgYauQAuOjy5LFDJ99mHpvk04cfwvPT1NKZafZ0W72DE/axqA1GJ/aXcRh?=
 =?us-ascii?Q?HmlTOR/IpRMaaeWIYHPAMQ10kMC0dqdDEgMksdvXOR7iL12PrgdsbNV2+7uJ?=
 =?us-ascii?Q?0R8rQF9EghbM4GGPCpMdE7pHE7wvRwBCQWiQhyJRkvaRA3hZ7Wxjj6747lDc?=
 =?us-ascii?Q?kPJpt1qUjdiyrl6vjiZZXMPy8/iRoIYHDVE1ETkc38DmpoAvvzMKkETKFxA+?=
 =?us-ascii?Q?B2jV6/xFv7MrB+HByugMCO/YxEQ7e6zmr+ULMbsH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83f86f4-5c80-4464-182f-08dde097d0fb
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 09:48:00.9132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QP5hnBveaYpZpT5KU9uoHDz1BDv8jzGzJVKiLtQHYU4pPbRC/p5t2He39uM4Ko4b0gzx1xvwH0cE2VZpOnF3gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PPF5540628D6

The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
Therefore, remove the useless call to dev_err_probe(), and just
return the value instead.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/input/misc/qnap-mcu-input.c   | 2 +-
 drivers/input/touchscreen/zforce_ts.c | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/input/misc/qnap-mcu-input.c b/drivers/input/misc/qnap-mcu-input.c
index 76e62f0816c1..3be899bfc114 100644
--- a/drivers/input/misc/qnap-mcu-input.c
+++ b/drivers/input/misc/qnap-mcu-input.c
@@ -103,7 +103,7 @@ static int qnap_mcu_input_probe(struct platform_device *pdev)
 
 	input = devm_input_allocate_device(dev);
 	if (!input)
-		return dev_err_probe(dev, -ENOMEM, "no memory for input device\n");
+		return -ENOMEM;
 
 	idev->input = input;
 	idev->dev = dev;
diff --git a/drivers/input/touchscreen/zforce_ts.c b/drivers/input/touchscreen/zforce_ts.c
index df42fdf36ae3..a360749fa076 100644
--- a/drivers/input/touchscreen/zforce_ts.c
+++ b/drivers/input/touchscreen/zforce_ts.c
@@ -747,8 +747,7 @@ static int zforce_probe(struct i2c_client *client)
 
 	input_dev = devm_input_allocate_device(&client->dev);
 	if (!input_dev)
-		return dev_err_probe(&client->dev, -ENOMEM,
-				     "could not allocate input device\n");
+		return -ENOMEM;
 
 	ts->client = client;
 	ts->input = input_dev;
-- 
2.34.1


