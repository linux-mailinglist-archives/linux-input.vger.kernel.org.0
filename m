Return-Path: <linux-input+bounces-11893-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 147F0A95188
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 15:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E287172B1E
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 13:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 102A5266B51;
	Mon, 21 Apr 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="aNESS0em"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850626659A;
	Mon, 21 Apr 2025 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241719; cv=fail; b=CgKuEYNIdq7s2H1bxpGoEOaosBxbjaDQoLKJgkfOl9nUhMaRD2tZkbTlOgSKX7WKD6/qdamcAQJ0RAnX2rzPSXO+0fnswNes4DU4MHQLApBBeEpK35pVaeIVj6CWHCfW9yMLdoZCXaVKWFhzwnF7RkWXAsSOwVFCheohfH5sxmk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241719; c=relaxed/simple;
	bh=bXlLctPeVGlGJrqa34Jka5xzX/KIYnzZYX8+ZQ+432A=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=qGSC6F6/Ai6T+bEqqdlo04I1dxShXspLk9cjK3VTTOTMfxtvdFcxeLzyOY4hnLJwclACSEgN+vO3LoDWh6TEfw9D7I5awks85O19NmQNnqap6hXH/lAY+jOtUr0j4VU65jREuMz3QAWLbMG8CJI2fyOOQ3CUIiqjOi6iAtcXzf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=aNESS0em; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFE22vmP1Gi7PrJFoYe/QDHNI82xoZAkPnpnGFj790yF6bNnl+qks2tnOkEKoHAnittorXoDhz+tnr0yzv0qUAj02/FAYaFwDdKsnSCU4VP666h+po4e6ymJ9dGI733dodFT6bCcnnObblzj/CsOh2HB0rLn6Qxa5pcHnKT5kaYpUxjz7C3OZbiVi/gyp8GqWO4dukeJhh/g+tMe1l4MYWJdSGGuSU/kueAKq0kV96xD5orzQ+xMOSyLuV0L/AhlAUCp1UW47scQ4ShQtjZLOJCwHcWlRQJcVFtwNdPWC2l+SGAPG/MHlNuM+a0r0SW2tC21gJF8ts1bd8FzMX6STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/Te0v4hGtRNcdSngXiTjjPe8iuK5NM3az5ug1NQwmw=;
 b=KufdLJ2zHrBq79u1oParpZGFiU5JwIjQRTaZy/oJGzMQh28bWD45zNij9+Gc5UMBlcvCi3DwgOYTC1CD7MaAeIKgXlUqiR4jKdZWjqw5uIyBA+U8BEKgPOEaXmgsCVxLtVspwXfCtdVskL6pzs4ygirqRmKI5p2OhY3kNbmPKWSQpiINieI/L3X3q3p6N6fTWi5AtE/hakPS30gzOnRQsZ2i6XZdYM7Vhq7byAB37btrVAnbC4bc9l+ixZcz6pme+My01PG2BpebDcRVOEALgNkchPsvs0B9aET8Z9SBgCFcMm/kovTw9fBHpoLx3MjFiNkqAB8FPE0gTqS4li2oPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/Te0v4hGtRNcdSngXiTjjPe8iuK5NM3az5ug1NQwmw=;
 b=aNESS0emOOD/3wvnoCc1Ha7rIyWvxXq9PNvojD7cm83/Tet+UliC5LBdyYRwemm/lBwRd1KXhcc2pStwqFOsQ9wqkS7BIQGD9lE+kiWK49QIUAJDHEUZ5jVxuavKF4pEMZI1KMlN8J0hKFUfx2M5Ntw8V9ec4H0tQhgf2faIRjzllAPFFA3ze3Rku7X+mTdOskb2hgrdvii+gJnZt+Ho2lFJIxMwO/Vcg6qs3eednPsMF4cCPq1vihaHN5AAk3D1yllxBkFmsxLrt7bUe2Y8eEbho46EXtMrvqZVfqDw2fvv+p5L20r5w9xt07I125/8G7bPKZxCuNSr0MYbcbQi6Q==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB7289.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 13:21:52 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:21:52 +0000
Message-ID:
 <PN3PR01MB9597D7496B32DD2D087D1B87B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
References: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 25 Mar 2025 17:57:27 +0000
Subject: [PATCH RESEND v2 4/5] HID: multitouch: specify that Apple Touch Bar
 is direct
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <bentiss@kernel.org>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0036.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::11) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <dfff5fd168f4a55f20dc801da8ed31668804b974.1745241627.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNXPR01MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 70e09b83-ab69-40c0-4e68-08dd80d77ac9
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|7092599003|461199028|15080799006|5072599009|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?C0dLNr79gK/Mj2/yBv1zht6169ilFD32ww5r2vKXC7hwkSILhNN5Bj+ZJQty?=
 =?us-ascii?Q?Ki2rfZszgbKpS7nVR6SdQqk7Y+8HMLeArHxHIIPoOvqy0ayaA07mWOz/UC79?=
 =?us-ascii?Q?RPkG0PvR40Kd2SxlIQoZPDE3MDok9V+K4XqyGxJz15geiniBbO/2nXPccYaF?=
 =?us-ascii?Q?KIOoMaF5/6FVdn2ZkTtHQBUEAIUdMqTseomb6s9g1MlAcFTAM73raN92Kjf7?=
 =?us-ascii?Q?eHADnJI9wtJHdgJOXCx2H3NEy2tDfJoJwtuTVBRvJWECk1F0oiYMmucgSQKt?=
 =?us-ascii?Q?5OfyEGMcHpwK4ss6XKNegcEuDgQ2Fle27a8zN089x96tkvgST1aiTXlHHwB+?=
 =?us-ascii?Q?QRkK0pIWBDCZy8etOiiTbsNKxeOtrrn72hnwVaOU7lRyczcsMEvrytD/9Q/8?=
 =?us-ascii?Q?nOdRvtN7eUQ5fAYri9kBliiVVbl/AsMGBzZrC9yc5gZgETcg9pbsjUKN1lpk?=
 =?us-ascii?Q?X7oJuo1+5sdCcsSbHvqV+6B3JjAOAxecLMD56svpdduY3sGPCbuuMOGn4fFs?=
 =?us-ascii?Q?ZzIhkCco4vOqx1UGsj7jXj2UP1oKMCmKzduspuzI+w5yUaYetmg8zTUdvq3y?=
 =?us-ascii?Q?oCBiZjOZvxnJTBOMg2m8Qb9j1eYqmokXtTFK8bIGZ9oh6KkaFQVfhwcqqGrF?=
 =?us-ascii?Q?RPExtp6uR+lPaA5O2uUHVF3vCmHKhydKFtbFYHRIxOPV6ruBtWBvEpnSckPT?=
 =?us-ascii?Q?BoC2l2ZBj0VIUceXrg6ZTMaIj9vI/f3f15S7eHkj2feXAXrNNN4u5cdGVOoG?=
 =?us-ascii?Q?C0EJK6gCWUQSGsuP5ZwQXUdChGjbQCzif5jvGTuSqetyG8bLpaPmh5u2moZG?=
 =?us-ascii?Q?AF0tFtloG/7WiIwf3SJt7v09otPtwAdTLpfChWQLwqO3rlY2JNG6IIjqsvYz?=
 =?us-ascii?Q?akqVPnbIctbu/XHj/XShI39wmE9bLL4+m0udcUXB4hpKryPFWl/Fo/sgAaDf?=
 =?us-ascii?Q?/3kZU6oZmYkMEAuri1RxzjXRzP33sQsCwqNxzxZ6wuRudbaAG8nmCIRxxWMc?=
 =?us-ascii?Q?Q1Snr3WTXXYuTXXuMlUP3V99n/fPYRWPkktqjdjkVh8fuagnJDWF5eNn0jmd?=
 =?us-ascii?Q?/T1OpCPEzDcMl0LGhPs5ZE0Dl9eQSKDwvBq5XpMkvu5PFpPxJ8E=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TeqW6AB7F0RM9rV6FyuKcsdCxUMljHDP4OBdSy23WgQj6K45PJMfnNrHeASF?=
 =?us-ascii?Q?xQohl28hPWnUGkqeJ6vTVXvw9As6s9ORR7YFbsmJ+W9PBv4QyhH8FmIEgvrg?=
 =?us-ascii?Q?3nm4+XGtWgTWTjdbkhUYNN1sxQBaiTQ8p0z9IA9B42lgQFLv64o162bg0neJ?=
 =?us-ascii?Q?x47MVDvZN2XAfP/wftFzqd7OswWnEWPBfR9jT/MO1aU5Dti5MTD9cyPWeuZP?=
 =?us-ascii?Q?Nyoon7116EDqRJ817AYtvsDuOnG44qiKS+rqMzZmL5764xRVODZ4rFqGjyes?=
 =?us-ascii?Q?u08Eb4cyWMT3B7l446nNw6ncqa+d3yiUJgsOXNQaXyBXZTUmNO7ij76bEkgB?=
 =?us-ascii?Q?Meumk8a5R0CT6RGwJUMXKAp6XX9jJFfK5RDUgfEdIZ6Fji1DHDCWg/pbYeWm?=
 =?us-ascii?Q?U4eTukEqlawrkP+WmlQRryST5kN1yZHZMZ81PHQz+u5ZaIqzxoSz9uqD7IRM?=
 =?us-ascii?Q?wjC8QL8vqKT3MdkJUPY1Fb8nHMnxAhpZqG9I8xTXmZ7ycSWWayBr7k/eSlzm?=
 =?us-ascii?Q?oooqB3KYupoubpuQrS2NSiIJlfOiJB997cuSnQ8L1B+WgyIzbQmctHa9WRfX?=
 =?us-ascii?Q?kOPHhQXBHbU+xCHUJ8xFuk5FoA1uST2rYN5xcYVxQW168wVRD9mdnqHgwnGK?=
 =?us-ascii?Q?Rvh9V2gKOyPGjKgB7LgxPzY1Xa2Hqc2tKyVDXKIvwU/sWhlQq90xfwz/w1I8?=
 =?us-ascii?Q?x/9aLliXuYoa3G69cTliTyaDPg/fUiMicgIvUT2vrt6qwDUu8crE8cKj7qLE?=
 =?us-ascii?Q?+RW38AaLXjJjMflGJMjjLORsUfi2y+cDceyR+8jit5Ulz83r9V3I4SF1NtxK?=
 =?us-ascii?Q?Nq/UDf9mMP8SvPPp/cHD8625yUeGS66yNMoFe9HJR6GIFRwvW/J0epIzefhC?=
 =?us-ascii?Q?DvBkam77veYQZFZlvLbmLpcQubxptRsbU7K8q5rCYsgMQVtQ6yojGy12xit2?=
 =?us-ascii?Q?A25Z4LgcEhSv11yAmcyHUTh7LSJuZVvtaxvMsi5fIlcqsmh5hBab5GcBZEHf?=
 =?us-ascii?Q?YgWS4WwVatliP0YwXCM32nXtKVSDGWOYvlBzo3QzAsuLMhcjlIoC++/6o8Sm?=
 =?us-ascii?Q?qGer6abL2eIZznHLeYdWzWuAkEUPr2wLF4+iqAw0zDkQ3ZAa3k2U9UcK0bFn?=
 =?us-ascii?Q?gGkkCmB8SFHSgDyhOszC21GqH8Rbwgb9Lt7/fsl4MaqnVqbXFOOcuWXFNZkW?=
 =?us-ascii?Q?o6OAtcBlQ7SqiDwrNTtsSzSqMMJ36CZij0AoSi5DlbcGphzvtbhZBm5p7U4?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e09b83-ab69-40c0-4e68-08dd80d77ac9
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:21:52.4956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7289

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
index f7fe6aab8..66e33a482 100644
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
2.49.0


