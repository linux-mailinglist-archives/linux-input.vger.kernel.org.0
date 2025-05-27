Return-Path: <linux-input+bounces-12601-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C990AC5455
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 18:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9318E8A3091
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 16:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49507283CB0;
	Tue, 27 May 2025 16:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="RV0RZUsl"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E52028312F;
	Tue, 27 May 2025 16:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364892; cv=fail; b=QsOyDYq5dzuATr/zkVYfYzGeBQLM3ywb1PnMp9cbPSkjKP4c4Lt1utgLFXKqrGGaw5DpijAnEhdaCqIs59cU4pgVg/cxbGlF3RbBvfJW4SuFGGtpF0wsTqXv0aer966yeaj3xZPPF89Kn69VRDfsdA2p94hrGOZyILQwIhLo0Ug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364892; c=relaxed/simple;
	bh=VWo2/pKRl475eHOeHQqG+78qcRANLAq8Kk0387IaDLM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bpYKA8V7AWSBzNdo01z8dj4B5ThYlWG7UcK9VXDjTIlUf/RsXyt0aDZk+xksDxrtiVOJFAE3DolZd9JEiiunDzpNoyeAGSAoQ5TxiFRc3c/67mgTxT+AmiwgTbPuPbfWzyOZ0UeCImzMkZ1h88kwtjAcf+w/kZYJRU2a3eas9xk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=RV0RZUsl; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SW2RADy3Ap/WaCYYRt5tCQ/iSONbfiz7kApaowAc/1+/2uOYkFOdDgVe1dHE0mv9GjXISD4zNc/jdQxk1YwTGVK6elZ/tzntTDarXqUMegpm6xUYAZI5A1BRTjF1U+Dy1vwzdlWOO8NumXOwFnkfOSFh3ufWGKxM57J8cat7slOAHLdL8j91Q7dzbKKZvanl9DQq3QZBLrzp0wHhjMy9cg0CfSuwFtDFzluFC7Ha2IlOfthLl+I3mh4LHDxe2YrqWUXqadn52rwSGwc+b94g0YEeBWOmpAMdScXY7oR4A6acMzEePf4FJ/JEMV9/WyHF+bl/jyI725+m/8ZYwMr8yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v13E0JXPPtiDDbuJJ8tDxeHmRCiFlAoQxaIo5tKIM58=;
 b=tkGdteyzPXtZ1L9PeMj0mf9LDwdcCQysYOfF8sr/qNHs9Ke3b4t0lQK2LjPNpuQRRSQ39v7afeUdN2mQrWj8X2stQSOACiKuJTDuISmoyzzHWMr76BqjI5fOyNk5jUDroDPjzWZleo1VFzkWqGx9P0ebi2EU08Q8DzBWdeH5UC+dmX2+3Dj6C7UGh0LQMD5GxShSY8hN1fsHiDfqh1PkK1/8Y/WyxQI7y7d1bvkQ8tkRd1E9muMtPqHePkoMDLudE3Gttnb2CyWGXhdJ2DHM7ueLMci7YGnlSMq04uFJqBBwh2BXmE5fIOrls6AqHtHQS63gnZ43pRDBrJLv0kSLGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v13E0JXPPtiDDbuJJ8tDxeHmRCiFlAoQxaIo5tKIM58=;
 b=RV0RZUslYiuImAM/ZF8DASG+I0bRm8VOvwVQLw08gSVa+8By/61pfAL2PksgvqtOKziJkoKnVnkAY9XPHNsHpHVjmU1UnSErmycVn7gnCSLE7RmmTHuHS/5IMovjwkcK2Gavh7g3im+LH756B+HIyRP7JfdOAVGqZ0TXfd0O5Fa5a8IObsWl40h7YI0QU8JxD1+ro3EjJ3r6K1pWQa1m3gl54BDmPwpC5Zqj2BL0XcipceMg/xUp7nRFyUr/g58Ejh+2ol89Y65z1UPxRmnVp5hQ7/sRrIPof/hvkP3zFuovIDTEfr5bHctK4GZfMBoYK2xR8u6GRNqXPPaAoAs7lw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB7799.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 16:54:41 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 16:54:41 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Kerem Karabay <kekrby@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v3 4/5] HID: multitouch: specify that Apple Touch Bar is direct
Date: Tue, 27 May 2025 22:13:16 +0530
Message-ID:
 <PN3PR01MB959710514692B90137884D27B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250527165417.24165-5-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 104ca5e8-3821-4868-755d-08dd9d3f2c40
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799009|19110799006|15080799009|7092599006|5072599009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VL2z7O4oblp20Yda175Cwj3R4kn4Hr1IJrxq9xLusRQLz0aDA/L0+aENObwE?=
 =?us-ascii?Q?SyRoJK0NPEiS3f+iPcjAY5E/oZdEX/QU8AcnW1Jfx5olvgcPx+9MaTVvHPJz?=
 =?us-ascii?Q?PpH7v9UVoTmLyIOW9spt2RCNZQjyunvJ2be8tzGxN4WqGNdNz/7s3x41atZG?=
 =?us-ascii?Q?Wp8T3CmZsvvm9UXq/p5aefOYyxxuIs8BHoIMI22LMtoT/ZgDCy1qdhrOkNDt?=
 =?us-ascii?Q?2Fpo8sbelqFH31lK8jCSQWoNL2SQhxW1i5MceVeVi92GnmuIDQrc9QRTpMPj?=
 =?us-ascii?Q?pShok2PC6BbPEjlQyy2PmCVwjUP2ItZrmjbtXk9jO02Cjlh2XVRJBwrBdJiw?=
 =?us-ascii?Q?aEtE0eGdbMZPHXv0HOhAerFlNAZJWUJlF/Ak8JkSm1eVA/LAzg1MSUZReaJl?=
 =?us-ascii?Q?HCOWHlbdnqa2COZXWHAVjcpC9D5GB3DQaTpQSlf8G3LGhQUtYsi7mkkCI1Je?=
 =?us-ascii?Q?xfuKTbZDgB3FJy8CJ9FQjbC/a3Eb7nmQFZtlyraSIqL5gC7nZiTswZIY6NW0?=
 =?us-ascii?Q?Zt5pJaOUjcfZtVpnjQ3/xbUXj7PMvsUB5H1MQe95l4vcKdOBzuQmh97yuj9G?=
 =?us-ascii?Q?C9tHSLVKKOQSUHpd6wY0bFw++2okdgX+r9ac46WE9YBtM25WhgAuJRtW+89E?=
 =?us-ascii?Q?/eZBjQFC/e0L4hgSGOgRfO1k3k9FU04q7ZhV1JpxhOEyLWrFyFc/hyavmBG5?=
 =?us-ascii?Q?zAkElmXctA7cBrZ8yVTAsaifL4MzDH7ZPprbUo7jTINXwbm2rvS3zaH9UB8e?=
 =?us-ascii?Q?fJZ7jzEZ/seOG+LH3MH8Qlcrt6VM6rMw51oFbR7AjfZiH2oRgwCmXRsm7V0P?=
 =?us-ascii?Q?/HLCrIewJ2VI5sEZ7lrQl7mx3Iy5o4uAuA6IHpfiJMI/S0HCNAlIY72qUgWT?=
 =?us-ascii?Q?NhKNEy/J8MUPfl2aaj4LZF1Q272/kK2XWkVd35Dnys7dMvbRlvw/OeNQg4JP?=
 =?us-ascii?Q?3YsU8H4qec0YmOmQ+1nn9k/lzM2tH+xbi9nF59EsfQObZlP4PUCS8Votdahm?=
 =?us-ascii?Q?6jViRucCYi91yQsfEHiQzwXpNHpc+UZ8OPavNXHxOI3hPMuVI35m1F8c0IhI?=
 =?us-ascii?Q?YXPO4p8JpmdgMvKUuIXhHrHVCB3GgU8JN67qmqpjzqoo2s/qq+4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2cLPHx8stZ5jYptKVAY1vb16B3je1b9metLK+CQh+Wh75Bwm5UJQ2Fk9NIbL?=
 =?us-ascii?Q?6ofOrPEIsKnLlj4mQXwAAWwoTUN9EfE4e9zktmJ/ZOTBfSqLt7pLWStgxToX?=
 =?us-ascii?Q?ogdrcL/ADhYzb2q+GRQozCdqUhWE6AB8/tWCRs5Sq9BYS1JTwDGO8+NLm++c?=
 =?us-ascii?Q?m4MsaEujkqlIF0M2DXfglj1hJ5XGgccX107T3DMElRbMFk+z8LeTWvV/Nga4?=
 =?us-ascii?Q?+hPrjYLSF8s6wcfbSVLCFkPET2qmRRpk9y6J8COt6/JCUnTE8AXPjtrC92sq?=
 =?us-ascii?Q?arcfg/SldbBWPMNkXq4x9RoQAWX5UguYwoRS6xG7zkV+RgF64v4eHvyOTuRk?=
 =?us-ascii?Q?I3YS21NOs00avUAzwYwQYKxU1Oz4wOnf2IMiRMSPZB3mZ3MqLHpKoJ3CLay8?=
 =?us-ascii?Q?xUHmWZ8M6XoKvs9BZJGkTEq8PcxlCdQrreNPO23ilvYgO7xQIpm3faM6bbEO?=
 =?us-ascii?Q?kXbS02Q16UFkKv1XEketJ1D8TCBfZHC3+nX9qPWQH5ogOpyyg6+9yC6rL8KJ?=
 =?us-ascii?Q?2pkbO2eeqo1GZaIwmvrQYNi2HTWAb6AvP06xD3v7RE9CZ8YxmkFLCOTgCZ1U?=
 =?us-ascii?Q?ZGeRXG0JsZDQPg7UeiKSleqMTci1XabZaYxxG+UUrwvfo6oKIBSaQ2E6KEsI?=
 =?us-ascii?Q?Eff5reCaVCdvfqfj5DFkWE+i8574lFaWU4XMk35BiPqX3hh2bLSX/J8HEbYy?=
 =?us-ascii?Q?Xul95lpXV/daRdrNKQSnwyTCACJxO76wp+mCVWWRfEgjkpGU6/KumlX9dizl?=
 =?us-ascii?Q?JoiKI7K9bRh84VkyzWKFM7aTPu9PQC4J2B7WIjE3mbmeBhBebk8k0ISh/1tX?=
 =?us-ascii?Q?dKNRbs1zEUgQWesZBNHN6Nw7jPigH+YoDgQRuXpYFimWn1UXgLenIwE52iLr?=
 =?us-ascii?Q?DYdSziBJseetJEgZ+wNdQRmpG4BHUvWNO9ELpgv+f7hYL/WlCI08OSl7jQt8?=
 =?us-ascii?Q?BnYDyK5HrKw9iIUBpo51VtCELfDjwGQbsPX/r44OknToI6ZFk1Cm3s9mb5PU?=
 =?us-ascii?Q?Q7SqluoIXltjBkSLoXBN2Clf2ev46tehMD/oZuZRzwzilmWHAX2gqhltnQDF?=
 =?us-ascii?Q?sl8/v3o47BOF0zLRrrn/knaOFhZ+5JW0FFViJpph2SLgcxTNZQ52xwYgYl2K?=
 =?us-ascii?Q?lxPU8pWjlxjoPY0YwZGLMQ8UvzTieP7oUqo+D5nFWzJnbnduxU2qK3W2O0nO?=
 =?us-ascii?Q?Ne3VPsrUDiBFfV7Nuq3Exg+unRm/HfNHYr5Uf+5hw98MRXj5K/fmD53xQZ+K?=
 =?us-ascii?Q?ibiTdvBE+pW92w5GqpE9oB4JeKUo/DBRkoFSTPja/mGP/6k47yLp6jFBaBr/?=
 =?us-ascii?Q?PKE=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-18ccf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 104ca5e8-3821-4868-755d-08dd9d3f2c40
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:54:41.1754
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7799

From: Kerem Karabay <kekrby@gmail.com>

Currently the driver determines the device type based on the
application, but this value is not reliable on Apple Touch Bar, where
the application is HID_DG_TOUCHPAD even though this device is direct,
so add a quirk for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index f71500d1f..81c02138f 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -1349,6 +1349,13 @@ static int mt_touch_input_configured(struct hid_device *hdev,
 	if (td->serial_maybe)
 		mt_post_parse_default_settings(td, app);
 
+	/*
+	 * The application for Apple Touch Bars is HID_DG_TOUCHPAD,
+	 * but these devices are direct.
+	 */
+	if (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR)
+		app->mt_flags |= INPUT_MT_DIRECT;
+
 	if (cls->is_indirect)
 		app->mt_flags |= INPUT_MT_POINTER;
 
-- 
2.43.0


