Return-Path: <linux-input+bounces-11340-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B4FA74C8D
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 15:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BEF91889D71
	for <lists+linux-input@lfdr.de>; Fri, 28 Mar 2025 14:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1797C1C5D5A;
	Fri, 28 Mar 2025 14:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="r7femB1j"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011036.outbound.protection.outlook.com [52.103.68.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29EE1C3BE6;
	Fri, 28 Mar 2025 14:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743172005; cv=fail; b=gx/aRLbzRPKubG1kXSfh1bBqDyCA+2y2GnY8Y9J3bqG5j9Bet/jMDO/V/BVWpkZPk9CZcjh16AyXwHft72Fpa+Q+ZCmCXUHo8GEVm6DO9UZdB+picbiUv8LA0+T9ZyA+Vw0a5inel1bLoWQm4lIzhd7UdszY8I4kCIdiHHPUUao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743172005; c=relaxed/simple;
	bh=8ppOinKG+Ux8XbsuPklEKG+0PTdyuwq786BAD+mKJug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AG/gZBHxBJHz+1/xeqavqrVTm/pRu1FT/6l/VrnqzV47hTCJHOLNG2KThDmQC62O9LZG1a+KR4ASgQMYHy2CDylGAy5buwvuA0rfbfH+nZiFEhHPrlLGjXx7DYg1m4GDCRtMRfTdrZ5wSDr27wAwmZo57oA6OChMbEc66w8RPck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=r7femB1j; arc=fail smtp.client-ip=52.103.68.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PeL8k46GNXT6SheEENh3QeOnWDNBGPwovds/d/hsWgX2zLR6Zand2rB15AO7AVONix2q0kZM1u/cnIXhOloA7E8Pv0Rvo5Lb/+jHEr1EJgM5JGiBrrhOR5LeuwaxjDr3q5O7FfcALNabCWIxYLr0dpCuc18YCiYo5ukUuHxyxRA8L3+GEKPNfg/LxE0rMgYzfAjX4C2G/iW8xjVHj4SeGpDbXsZVgmmmeiiWEliqSnMHisJwDIyegmKlju664+1+o2K800uTJALe0kcPpRSDO7HhOOoepwlV92wtyYU/Wt3H+qmmq48i5jf5C3mNXHXFuG7sNx57DFPySLZLPAjamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUUo35B4K3KLko/kfiwZ+bL6zz/SyMyBFCqBYG5c8to=;
 b=MUNkzUpx/5PqUkx/cTZBf4Ak14l4wlbmFyIQ6LqcUreTdNoSjGEvCmsel2moaawAOYfbNsB93hbocCxtd57TP3cKMBC0QTCYNpqYopGfGISaOD4s8tGCyTELXDsdnGJ6ePlzaxgC/wv/3MDx3KCuQVj99xmbRJshWLiPVaeCZzGRnHI3CAc+OQKLR5WWjd+AUU77Ikjjo39TsGKq4RkugFsrmOJr7e1vGXNhIJ+y9upNCYOurzTfbUPQDcLa3vxBl3A7aZqi1UN6LpjqAe8o9YFqCu0G8qphTcC56bLIH2BvNXgV9i54mEpV6huztS/O2KJTOiSFfwIjsvR2lPpccw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUUo35B4K3KLko/kfiwZ+bL6zz/SyMyBFCqBYG5c8to=;
 b=r7femB1jVIuUpCqhoS552I1lhOdH2uoZFuflplf1/OQO7QACgEtXUEAKXeiT6x/u/g5rAhQhzTDL93aKwvPd/WDKoHepfh4/zpFvl2ozRqS9tjAtoQvqqr33NCrqeOqU+K88kyVTuRyhjbg6VD/EUygxm4M7qenAIEjaBdflgXbr3DW4NhT0v9ak2wcnxDdry78HgjeIUXYXDojbeOfni4rsQagA+0U9QwCShpie+4WIlRUo8GCO3ETv0+w6lRwl6MG+fkkavbikJQJme7z5kNKRtdXT/4uFvutj5zcvE+XK+qoUdnzgKrhY326CB0bvZNV8xbT9OOnwhdlvd1fHcw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9447.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:10f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:26:39 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:26:39 +0000
From: gargaditya08@live.com
To: jikos@kernel.org,
	jkosina@suse.com,
	bentiss@kernel.org,
	benjamin.tissoires@redhat.com
Cc: g.sokol99@g-sokol.info,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	Aditya Garg <adityagarg1208@gmail.com>,
	Aditya Garg <gargaditya08@live.com>
Subject: [PATCH v4 2/5] HID: apple: use switch case to set fn translation table
Date: Fri, 28 Mar 2025 19:48:24 +0530
Message-ID:
 <PN3PR01MB9597491F56BE999E7B7BC910B8A02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328142625.12980-1-gargaditya08@live.com>
References: <20250328142625.12980-1-gargaditya08@live.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0158.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::28) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250328142625.12980-3-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB9447:EE_
X-MS-Office365-Filtering-Correlation-Id: d5709cbd-65c6-4154-bc25-08dd6e048dba
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799006|461199028|19110799003|8060799006|7092599003|5072599009|440099028|3412199025|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iT+fNeSvhML1BYpStJASd3VTtaNkQFUbrORDu+pFa8j/mQw9u6j15EIa27YW?=
 =?us-ascii?Q?gxM7CGiI5QrNry4AWeaFKip/8hhStsoCpFlrhPUK/v9hFMar1SYkeRiiK3Iz?=
 =?us-ascii?Q?aTbfbNr9xZq8hW4gO60zwtrqNxRV0deba3v+MmIjKbgoGa+BqhuS8b/4oc/M?=
 =?us-ascii?Q?UHjexI+ajNjFwh3Uuc78yLHcy6v4fEmlNR1ouqfHjzsw7nCK4cZNXUCXciDk?=
 =?us-ascii?Q?roTZAuNpFvHRKd55HzM4jtrOYwX/J1EsjlRcXqkvekHVPw/8mCfZcUSjb51S?=
 =?us-ascii?Q?k2lVDaGwaoFsPC3qdOTtet3ID+2DKMruE4mKzxmqp8Vx2lxMCe0NbzMbUGlP?=
 =?us-ascii?Q?5og+PTd2eOEwoptI6uMdD4kRBoBGYMlxj4tyUY6QSZzUpk5LD5oQcqzOi1+v?=
 =?us-ascii?Q?fl3N+sdBcxAwUxsI9Cu1YW2LQKm5+x5evV3IXsoLIMpZThMrzZ+VXDu3ai5g?=
 =?us-ascii?Q?DQbDYKyf66+4m39Mmo3Ab63QfSNIOIuiBcdossOvuyPqPOj2rVmUhP5QIOya?=
 =?us-ascii?Q?QLAx7prJZ0vLC0Oo0omGbzvmIyQ2WJY9ZhnPDA5QkVXM62tKhqRL6kSMTr7s?=
 =?us-ascii?Q?7bsd++5zsw7UXUxUS0BOim3xvNv/V5FUnIB+vkHmtZkgPymF+i6RB5bYVD/5?=
 =?us-ascii?Q?9n4nsQhp0HPY4URmLNZHwv8oLTCI15SXLAmX1shMemKC0rYu6w3mqXmJDOlL?=
 =?us-ascii?Q?VMCdMxn1EB018nXh9eIiP+prCESeAse6tdNOMUBSp69xSw65+IivaKhtSszk?=
 =?us-ascii?Q?SbvCmAfVE791IJmv7ahSihdxojyK+UIwv51sfTZWhQP2q6yCHQonSyaMgF4P?=
 =?us-ascii?Q?aTd+vz9UFgEMbn9iXRhwFsvv6Q+n1UQtvOkl+JmFr9fEf+efmG5K0OoXduUv?=
 =?us-ascii?Q?z5KXJYDEkqbRvEEaL2BroYj8WEi0GxJvKuAecSJERCFSH8kKhLIewpuNqM8V?=
 =?us-ascii?Q?KEvCmR4XXJ5khvSraYolkxeGJLlChUb21VQdvOw9Lsrafn0RJki2I7GqgvBp?=
 =?us-ascii?Q?jS77DzCwH/ApGCuqdiXS/BNi1bPS9RCpup9hcWGnUch0GwuKFaLyuiPBlPZ6?=
 =?us-ascii?Q?gJ1YDMXct6jGHyWWumhM/3WtGT3rKFh2g499bs+rqMJDYy9IPfZJskJ+12S+?=
 =?us-ascii?Q?FEurzhyn9YMKHwDYGNy+qlK4afQMCh1oVw=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3xAFN0qMNYHvBh7VP3e+btbDV16P1hE99xGmM0dwEcl5uPmKXSp/wSrnySXt?=
 =?us-ascii?Q?D2VhtWI8rtJZV6oojTNM8Mb9Mv7AD4DReiEv/Dcoe7cLEo3abVGs/zpMyUR/?=
 =?us-ascii?Q?VNtzqtrp9ufs1vKrMzSyF3fe0VopBxmD9goDjIhBvSPMSb8NH2obcsnTz+N6?=
 =?us-ascii?Q?NRK4fAQIRb21yl4MtVmhp7wlE3vhHFeVw9hdBa5fGTk3PcbUpVq7P8eZls/t?=
 =?us-ascii?Q?DvvpAxabaMGkjiPhRwcvK3YHeDLW9MGRm0G3KF8SNfcSfxRAD4waVjVfGDMx?=
 =?us-ascii?Q?0UmVIxlZNic+D0tgoBD9AA5kTXhC40jvWwxu4zlR9Wv/w/Chtk0xTQ2zl3YY?=
 =?us-ascii?Q?zXjShdqnjx4bB1eVbPEsblRsPSobhOpdkKgosiM6PLdZsn30ouyxV6y6WcDo?=
 =?us-ascii?Q?Ozrk221MAtyhlHGcaf5+DcLHGTA+8gdMh62zHji+MsUNnmTWqVB1Ii0sZlI0?=
 =?us-ascii?Q?xBo3zuk2cMhpOTJrFq498+YUommCQHLkKwvMP3zdPqtuDZojZqpdHi3gMqKL?=
 =?us-ascii?Q?XgrOpVuzK5lUomdEaG1ZszwhXeG2Zxt68MVBVzGmQtpfpT5gXoCD5mYJl7Pk?=
 =?us-ascii?Q?nABeYGQJb8Mu02aSiAZBcBNvsbQzyuzzHk+9S6d7mH5DLr3rHWhQ9yFbsd1z?=
 =?us-ascii?Q?HVhoTyP/SgoFg/nVofc9WVRQqo5LlWdGuoL8qnye8XIeIOwNDLRqhNapA4BE?=
 =?us-ascii?Q?pJMivEYR7aaj7ldk/bjmxyigDNdNZFJrajkOUiUe/hdiHg4tUwiqNuLeaNkg?=
 =?us-ascii?Q?8i6Rpey82FVa5qgGmIbVTaLFDvmqRCr4T7dpL3HpgGb/l256puOhdeHkmHrh?=
 =?us-ascii?Q?pfhlmkaC86LyMqdk2asSV75ZTfqb3+mSc1vL9LHYoqVY94AzeeukY5v77AlX?=
 =?us-ascii?Q?XJO/2RqRYNxShic3d0qjE4BhREYbRS1r6kGr2tVBMZLr1h0loSc4zWGjuvDf?=
 =?us-ascii?Q?NiFqKCkji/FSDqWN16FN0xErZUvcMDZdMe4KHz+i9qa+6W8JTUNryKwWNL6c?=
 =?us-ascii?Q?y+jo7V5szeTVp6N3KyxnITWvSiKJHMZcL1OJ9oF1kR/P44Fm7N0OMrR+2yth?=
 =?us-ascii?Q?Ef9CCVnJm6HKqyO2mY1+vdsGczeBUwwfh6C10yebLnlBPIw1ZYJPYpstAhfu?=
 =?us-ascii?Q?vIcseb7rLntwZPZ2nrOwspVmwnRo03SU1YPT7H3SWCDwtVAHdABHL0BQsqGL?=
 =?us-ascii?Q?h60583rsEYKinLSHPTZe/z9nWwO1H91/l8fdJox2m6zSBL2+C/0O5N3ih8Z8?=
 =?us-ascii?Q?0n65tlMDuwg07N1S4LNX1qiFIZXMO5Njj0J+qOqpICHIuigrEnjQwytMW6TX?=
 =?us-ascii?Q?H64=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d5709cbd-65c6-4154-bc25-08dd6e048dba
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:26:39.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9447

From: Aditya Garg <adityagarg1208@gmail.com>

There has been a continuous increase in the number of devices requiring
hid-apple driver during the last few years. Moreover, unlike previous
releases, the PIDs of the newer devices released cannot be combined in a
specific range, thus filling up the if else if statements with individual
device IDs. For such large table, its now more suitable to use switch case
instead of if else if for improved readability.

Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-apple.c | 73 +++++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
index 93b990603..3d7befe0a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -465,42 +465,51 @@ static int hidinput_apple_event(struct hid_device *hid, struct input_dev *input,
 		asc->fn_on = !!value;
 
 	if (real_fnmode) {
-		if (hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
-		    hid->product == USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
+		switch (hid->product) {
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO:
+		case USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS:
 			table = magic_keyboard_alu_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
 			table = magic_keyboard_2015_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021 ||
-			 hid->product == USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 			table = apple2021_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
-				table = macbookpro_no_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-				table = macbookpro_dedicated_esc_fn_keys;
-		else if (hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
-			 hid->product == USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-				table = apple_fn_keys;
-		else if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
-				hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
-			table = macbookair_fn_keys;
-		else if (hid->product < 0x21d || hid->product >= 0x300)
-			table = powerbook_fn_keys;
-		else
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
+			table = macbookpro_no_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
+			table = macbookpro_dedicated_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
 			table = apple_fn_keys;
+			break;
+		default:
+			if (hid->product >= USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+			    hid->product <= USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
+				table = macbookair_fn_keys;
+			else if (hid->product < 0x21d || hid->product >= 0x300)
+				table = powerbook_fn_keys;
+			else
+				table = apple_fn_keys;
+		}
 
 		trans = apple_find_translation(table, code);
 
-- 
2.43.0


