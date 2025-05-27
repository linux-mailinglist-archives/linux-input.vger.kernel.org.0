Return-Path: <linux-input+bounces-12600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DD9AC5447
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 18:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1937C7AA23F
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 16:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2E02820AF;
	Tue, 27 May 2025 16:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="F7pnVgOj"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC382281370;
	Tue, 27 May 2025 16:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364889; cv=fail; b=AnnkTqT+nSCzWjSbkyChmDZW+OBiqvPA3zi0lbAg4C8lLxytBG6Ko5M4l6C5cIrb4r/UfQktWy3Nz6yKyjDW5LJh5xTSCnDf9L/BtRdIqMP/92IESqDxisO+dQSHS0l9SyVEBb8azRe4b6hbnWRG1IUgNUtZ0YYvC9YgLu0Qocg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364889; c=relaxed/simple;
	bh=Kg3ZmBJxMCqMkFUNdT2qs37KtzpyBdhh7s0QQiwJeG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LE0g/xOaCuGw18+rwFGC22XPjcFbJ0PBCfqI/YTOYP+hqrcnC6p5WqvmpCQrA/heuP6Mc3crgzr9wYKxkCugexzGRf8S9enX42sHkW8NXU/9oUGA9OsTm5k8XbU7Pwx1L7Tlrm3DRLVuy3TAw2r+mrE5tEg3yK/Y73OcHzyuFg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=F7pnVgOj; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dbo4f2yRC9QX9OPV8/r+Ol4oB7unaHZRhYkkaHGporXHEJxuzWUABDoDpqfLliryp2B1BxK4LB3Q2hCAbnSqAdYiknz8y2tG8TKtGNmI6L8UdEDGK55PhJbN5AfwMO3LbPJ24a0+/ZZLwLeYzLoOWjtqRWgEH6REdxpCClJXscrLBCNC9R6a2YMkip1DsYABGCqWxOjXNwm17Oxxzlszyd/bYUxaAWedJjCyHE8V2qXjBlyZpPRbsCiEfErsMf+IXzMr5Cri2eudN0pctylVDk+n9mZpnckH7Bgj+qheED9NxmawkfOme50aJ+OxfsXLh8Z6AuPVdDClctpKtnnoiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKQyUYYyNKmH1MAw6hH4gxXdKtFLz7QQXQST2I31F0U=;
 b=bekhbGh26XzkNJzOjbNm4emFMSdVvykqTtf8cQebOThcUbGMEUXS5gZCBjEQ+oDZl8l/KXOCi4f06yMJvLaBY6gy7YspPPsSpcj0tjUmcBn7cRRNL9i7bEYmWFIMSh0T551YNxFYDfFUZ1404U05nmn9KGbmRy7u3Q29UzZ81kjzsvvaFixPeWZKXQEJqLyubAtxX0bcyGAsMAJC9Eugnx6vCHgmlLj+9f52UR3G/q8mYSu+lXp1PHMGIM4daacnmo7/N7VDeeDFss1J+JAcVS3NBmWOMaDwnrlA+H5WbYUfEN+wAVBrNMoWKuc3sfssChXUHEJEOpVbs2SJ0JB82Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uKQyUYYyNKmH1MAw6hH4gxXdKtFLz7QQXQST2I31F0U=;
 b=F7pnVgOjFCovpr//GRc9h2fA/vg/2t+eXuBmLbLimwqDf2PO1KDfK5KCsfDV+DW2T/J3y7Fqvl1B3dyqZnTvessIasS7IXj1DnDbxCkGVToJwaZ+OY9pFjZXlF0u3rNe+gr0m6V9AnieJ/DB32S/6LO5tbLy0OnDMBBBwPsdsoTuo//wWMDekIESplAwLt/b++ThI2qgdTXQB1CF9bLn/ecD7tGtJ/fJ6zw0s1VvIiXIU4rcQSzO4CnpGEHVCPyFTdJypCQsCBsWp27cLPK/7N4kVAPcwVj93iI3LkxEC508QnPHaa9dYCeTH0R/osto3iDSfpKEo4h/fEdsDYL/SA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB7799.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 16:54:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 16:54:39 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Kerem Karabay <kekrby@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v3 3/5] HID: multitouch: take cls->maxcontacts into account for Apple Touch Bar even without a HID_DG_CONTACTMAX field
Date: Tue, 27 May 2025 22:13:15 +0530
Message-ID:
 <PN3PR01MB959786A9957498A707EA4FB1B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250527165417.24165-4-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f44441f-afc3-4ed8-fb85-08dd9d3f2b69
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|21061999006|8060799009|19110799006|15080799009|7092599006|11091999009|5072599009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SBevcHr8aYXcvVl48hY4/CdujPUktNd52ki/9g3HgoB2vjz1xMb2fIDt+Krb?=
 =?us-ascii?Q?g12NdFH7dHOUHSyGwdSPRdXmGWPrgnMFqkNF8GXHy52KT83WCKpEOVeOFIR7?=
 =?us-ascii?Q?2yQ2KhVg3AySNhLxV36FuIWzvTkB5Ejj5LsK7AfDphQcVtZsioYr5VFCYDSf?=
 =?us-ascii?Q?J8PQhKL+JEhLCIEl2lsiaXQhCuV1oTsFHj2ivfFN1wadHIo4jpqlrjrbjmfA?=
 =?us-ascii?Q?Zi56ethau9JBEgeKlUpoJsQG4Lp9PsQ/4APYpGKgNPfYFSHSZKt9tNlRRi1D?=
 =?us-ascii?Q?91hbPN1oqNOBqp8Ja+cHuXGCai307gm98dpSIKv0YZTFLoFTgDQp49jeZqFO?=
 =?us-ascii?Q?fc8w5gY3Nk3mhJHu3zXa2mCp9T4fqppJxBWFaZVc4FriJG4OGLD+QjZXop9H?=
 =?us-ascii?Q?dEYBzWeRiB1Za3vRQENyR/4nf9oZN8CXU6t5GNHLBGuxcs/lc5MSpp3ONGXw?=
 =?us-ascii?Q?OojgCSndVvZUmOkhDvLrdT5F2js5iZ1alqDzitL36QbICoIHwfm42QiNK7v/?=
 =?us-ascii?Q?Z7otxJmdqmbK6vkVxJIVd86jGAndJKXCzYiH1S9MDs8WTe7xURBJAJWfD2qL?=
 =?us-ascii?Q?v1o2D6ErcXt72UeOPqB7OTd8EYc2urJQjNYdJlhdHbJfTUwjNYpSr6rvju3W?=
 =?us-ascii?Q?5UqHqiCt2AHisc9en/i/v/Cq+dLihNkw/TgwCuqelMAt0bPr/P5YYlzyEW+v?=
 =?us-ascii?Q?w/P7ItmNw4X9Uvmh+nwaxBKlpEIGSeWaIZcJgUNlZ9/6Ai0vHL+EXve9z7W6?=
 =?us-ascii?Q?Fp10lxha7B/xenBdS5WR5fBUL+t1uqjxxTWBvM3+xVio3OhBf79K0AzY5kcE?=
 =?us-ascii?Q?REbdGn765GgBQsr3XBgyZl4O9JJn07UUO53WuTOG7MV1pwEtW/dHaix24ZC1?=
 =?us-ascii?Q?TuorAkJ7WWCWeG38tl1dNTwThS1G8saHgOz/yOL2vkwAwtUqzf+ttEVCyx4J?=
 =?us-ascii?Q?1Hmgp5DJhU6X4mAQI7vXuQw1fgFTheyBo5bg80k09P8zoqNqkzuNKoF1UzdX?=
 =?us-ascii?Q?QvBhl1xIjGG9PsSiXMX2XT9yopHNMy+1efaJYOBUy1EpbOBT8ahUascIByrO?=
 =?us-ascii?Q?h30Upd3735eadBW3WVRCAYju62dIx1NUTEfbYurgKXx1H8WfWJKj/l9UPb5m?=
 =?us-ascii?Q?Zm9LsX/NP4HZ6I85Si0rpgow6V4Rw2Aue6hVuU2Zct91IucRMIwkRRU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FC+MUNaEmtIRzIv0ZJ/Q2i+mOlNbaWT39uibwintTJKD/4Qe3QjqsgAFRGkI?=
 =?us-ascii?Q?eJH/n65ghTOj4lr/D45d42K59aKgfP5QKACQYW6Kc8PQO4tv1au45G2EffPJ?=
 =?us-ascii?Q?dYcaTOMtSEIrEsegHcFM9EkpTRsR+EiHbK/VfQaLMXOG/7lIJwVL9v8WMm20?=
 =?us-ascii?Q?hXIkV9+Yc2JQPTmE2DzmSK0629NVR/uvRwpJM+mFU8tuAtBvSdLBgpB3scTN?=
 =?us-ascii?Q?yRH2tilfYfit+RmCaNbBxDld5GMvBy9dGUliVopmBDM/726RfcQam1HABKcD?=
 =?us-ascii?Q?gzmZBVoU4z+FrrN2+DwrbUv0wvGPi8AtgKlwu4nwCRkySG3ndtEusgQhCAOE?=
 =?us-ascii?Q?nBZ0jVNM+dveaAsB/THXMTTNO+l0RyvixraRIAtdN98CMrdqiRG6emdf03P3?=
 =?us-ascii?Q?kY5nXjP3PAl/HImSssS38ARSXxtPdBIBymdOvrMEIyumKH35ZVm9R7U9Y0X5?=
 =?us-ascii?Q?HGFxSlEbqW4udq9YY2+EkWCW+sNDlEa6X+wChp8iF3jpNjdU3/Vro/NPG42B?=
 =?us-ascii?Q?jjchZ+lA6MR3LccZYxtsAZHFLk+gyswOsVHFVZRwf68W62Rx4IRwO9VqAzan?=
 =?us-ascii?Q?9XtLcWMIyzQ/3aAlEnsYRDQGjJ3ccFVT8y91djgCpSi0wRT0BXbuvKIA/Znn?=
 =?us-ascii?Q?l5dtxcI+wKwaBEr/vO0RvftxQtNCEWonxJfp2oDs3mLhPLi/S03KoXVcggtB?=
 =?us-ascii?Q?J5uAlTCIOX7BbPu2IA9WAPACQmlN4evQei7rc5+pkW7nBHacG9FHId+WQLLi?=
 =?us-ascii?Q?wAaRBMJzb3NkQez/NPUjhf4OSLBQxi7DyWzqs5+t0T1VOP94I44+jZszywhE?=
 =?us-ascii?Q?OoRKyy7XIMLb1ALe4TYVrjdq1DzkwoCQSuDnpZgYwJZp2fj6fQP8GVOT6WQ3?=
 =?us-ascii?Q?MiP7LOFQDOBA5xpSTowp7GG7IH+7Rld+hKlSFMf4PYsChn9ErvAof4+8CrpY?=
 =?us-ascii?Q?9hOQZDKCgnvALcauStDCK6pSSMTVFwSD+D/yvq87CMMV8CDAu9wv0iMCGFil?=
 =?us-ascii?Q?HNexsvpg3WUqYZdvf1jyCUIPoDGnd9kDfOUorIoUrehb1UX8KNaCq3o/18HU?=
 =?us-ascii?Q?nWjKL4arCzDZlCbiONtQvageR2Wf/NSBhAV1/rUIcXEW6eunXXg3OuRgN9Vp?=
 =?us-ascii?Q?JME+Gzk8DUNBO8d4MtXuRUoRgOBlB2UD3W/dHxWZeRKE/s1Nw49nKF2pE6eI?=
 =?us-ascii?Q?EdrSrgGQSGtnWii8fKqarEAL7YYi9jfCYZfVZl1PRL/IUSzNjUTfFvSDJ8fC?=
 =?us-ascii?Q?G0H+IOxP0GNpYrZ8HsWA6ZfwGM9mT5L+fACFVu+JO47ehIq06UwvhDg7k8An?=
 =?us-ascii?Q?m6Y=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-18ccf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f44441f-afc3-4ed8-fb85-08dd9d3f2b69
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:54:39.8062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7799

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the HID_DG_CONTACTMAX is not present, but the maximum
contact count is still greater than the default. Add quirks for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 99ecf6c8e..f71500d1f 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1335,6 +1335,13 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	struct input_dev *input = hi->input;
 	int ret;
 
+	/*
+	 * HID_DG_CONTACTMAX field is not present on Apple Touch Bars,
+	 * but the maximum contact count is greater than the default.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR && cls->maxcontacts)
+		td->maxcontacts = cls->maxcontacts;
+
 	if (!td->maxcontacts)
 		td->maxcontacts = MT_DEFAULT_MAXCONTACT;
 
-- 
2.43.0


