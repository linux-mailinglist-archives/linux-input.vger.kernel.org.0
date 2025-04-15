Return-Path: <linux-input+bounces-11790-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F183CA8A3B0
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 18:10:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA43D7A2809
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29DE2957A3;
	Tue, 15 Apr 2025 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="P5leUwch"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010000.outbound.protection.outlook.com [52.103.67.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCA5E571;
	Tue, 15 Apr 2025 16:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733390; cv=fail; b=iAQpm6hFPaRZJE9FTnYiyRkYn8Kmk/03RImgFgmwVFzSf0lZSnnKDSl5okyg6Vq+o1puxbi8D1DdEr+rxdL9sOrTQBX866AtO7lZ9gpJEscm//NHbQFvoQJk9YFwjFqSp0pBTAz4/BaYMkTNADNATVAziDWNfgwKMokG9qpDGbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733390; c=relaxed/simple;
	bh=kAxJXqzZ83NvCGssgeFP402YRmKBgo71wRp6emorqZk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KsErdp9eAwJIqwIBBa+Rx1wQ8vTteFb2byO8Le+tTuI8BdAT2MbNiScDsROxA8lEkkO5fe29AuIZ9pHQtydHieeya8LexJ9k9+Fjl1PK4VzV9TsYRQqszP31j4JaiNmk5spq/7WL58ui0Qxno7vtira+0UKKEp3cVfFmzUNYsWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=P5leUwch; arc=fail smtp.client-ip=52.103.67.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aFEKqu1KfQLKZBb6bR6hsuYfxYaBKeD915dZS5XNrekAaXq9SZZ3PlOWJWwsK066HlrZ3cgFAAFdeEIyM7oXcdHpHNiQnLQ8QKagoov1+/3BEs+iiw5ueFgRXU83hCYv75jzHbu6aBbhpLf5A8y1n3JvrNjr30D19IqVUnQBHekCP/7fKbDsGkTjjRoyKcxFncMbKfChbjVhaS3CouDySgEYlnNyml7zbtMVYGKvG1KL8H99ja48ICWr54cSMp1KRW6n4ApPk0C/3Rs2glkn4H9Bn5uUrOot00w4n0e14gxzld6cv8tqoFpzzUggoMlWzenKyLQx6cKvkoKElblQZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd4wwgSAA83O1Nt329QuNOPCvDl1RHGk0he1I38L6YA=;
 b=shPMp55sRR+KtP6aQiQsQ71VIyBeCno7yacipAWD9tHsanldutandXu40rmufStjgoEX1ARBgmWrjnJlx73LInJw0FQv2MEH3JmtI6BFI7btJNXJ4g+NjYydEbvlRD1Gcrdm5V6m8tFPj3INKtPgXPmfvhJRZ2hGvX32mjbN6dO+dQMMM04377QvIQb08RZdJwmaKie0mTJ/Xv/5s1cEfCmXNF0V0lxMJ78SAZVhKRNduASf6RL6nUtn8zk5es/dZ4iO93gJaIJGfC8KHfXa+irLRa8Sx9OH8GTUVBUnT1UybL7d+dAUbTBArWFYNUz1nvE4yG4y1sXs7yLl6aFQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd4wwgSAA83O1Nt329QuNOPCvDl1RHGk0he1I38L6YA=;
 b=P5leUwchuJT7+zofxDTSKVb06VTiGVzNr0iX1QWzPnsdQxjWfxI6AVJp4AqDEyIwURxMd0X3Bg/bRHm0LabZob4WJ3740Za6Ki9OGYIX9vbcaYd5Y5CmpWh+Qoa0WzF1s3IQjiXXj3/Z47p3ut4qNelWx5/dn/KEwjcobnZOKgKHcr3Hm2yM+iC7MOT5VQ0JVsy6CFulzMgh6/3wJncDZMaYfca/bfmT7DwHBLo0YpKRGwrr51jkrHe86s2E7akU27GBlFy/Ud2WMn21S345YIOVW6XgM9fTiqlWt83oUxpaU9U29L3VAJIA/c4DuTNo3JCvTuPRXa70KJYRKvLGHA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB5744.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.36; Tue, 15 Apr
 2025 16:09:44 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 16:09:44 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND v5 0/5] HID: apple: combine patch series for all
 patches recently sent upstream
Thread-Topic: [PATCH RESEND v5 0/5] HID: apple: combine patch series for all
 patches recently sent upstream
Thread-Index: AQHbriDN7QwoyctSr0ibRdfxjCLfCQ==
Date: Tue, 15 Apr 2025 16:09:43 +0000
Message-ID: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB5744:EE_
x-ms-office365-filtering-correlation-id: f9908d03-930b-44a5-8d9a-08dd7c37ef85
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599003|19110799003|8060799006|461199028|15080799006|7092599003|3412199025|440099028|13041999003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rxrAoHD++Rz/tbnJGpSoM7zcqomvr4zXDEVkWcbmtEGSyp7q6IbroB+XKi+J?=
 =?us-ascii?Q?zOxRHwGHPfm5QJiRmpDIkWErlzexJZuG+3n2R7K2u4bhTmxQIKoanQXOFMr2?=
 =?us-ascii?Q?wbpQSVRC9N6p3H1k6BDzu/a40ZCDCHzv8ec4TlqrxhwN55OiE8W7gFigYaWP?=
 =?us-ascii?Q?9YSx1MaqLawr/7rDS1QVo3L2dp0PhdUCg+BxEnrLZTwFSsLcXyuIslg/hEC+?=
 =?us-ascii?Q?KP1hVwM6KF/GfMdEDPdss4r8kFRABnT9A2FGsyXWh0YVptAgb0V0i9OYiS95?=
 =?us-ascii?Q?vdya8ZYlD270oVzSMzGI6fSmpBVjhIZpRLZbhhKa4WvwSNn5CK++rHQynsea?=
 =?us-ascii?Q?G7jOhw5l9mfZ+Vv7W13Q032yjudpczdM/oz4VDG2UbyqwKuCStubcpjOXa6o?=
 =?us-ascii?Q?vN4n2sTZiXb+Zo86v0bMBBDO/ylPhlBBinf9P4hFd3NajBt3ZFR782u2GoMk?=
 =?us-ascii?Q?gDStsCAf3QKS3HRmJE6UmNCaNbg9WGb9ktE8lKOajBCVoc8BdSyvyOCwRi/y?=
 =?us-ascii?Q?fZALWqW8j3NzvQdGkkSgg7JzOZm32uMcCvZrdOm5TTYBhZ5r5Ut6y5oWRye8?=
 =?us-ascii?Q?7FF1h+4nvBhib7GGnGriXcGpJ/isbzokU+Rs0EdGl04mUveZMaxLgHYUZD3X?=
 =?us-ascii?Q?igZIZicmf5NCHQHNjHRMvVCVYKaAERIhEem1TGGRoex8ns3TOJflWVp89MNe?=
 =?us-ascii?Q?JkVuDp7cYKbbun3MisEGDOZzYTgLTnioiyfHIq3Lrz0Vif0Uirc2QePhL5z+?=
 =?us-ascii?Q?4lwGTJoWzfYrYhKNJGrQgmDM3OVFjXrpLei11GiTm90MSXdi2GUCCjaWDLDq?=
 =?us-ascii?Q?DluTMYFwCBTico0GCYUCyQQbFEsmTypkJYQSUUk6baOTkTLmmh2SdAcI5PnY?=
 =?us-ascii?Q?Nmck36nsbGYAMr1IfS7C+F43hathfg7YntZBHl8Ufx4WfNq+NWbBN6wBQi7N?=
 =?us-ascii?Q?Yl0L3V9YiVEk28wEYK3i9+zhbdXe/tb69rpxfE2/lmGkDwssJg1K7o2LJ7d0?=
 =?us-ascii?Q?d74oXfGR7UR6WQ5/dnNdUA7FMNC+z6A9lyb1eq5FIyhuEop4gf4nodJi4YYm?=
 =?us-ascii?Q?eHdntOR6dpdIFhpwzNwBtT0w+bv4VDxWLR92IifkoiRWeWpBhgdloZaKYgfI?=
 =?us-ascii?Q?4/+BZwVzaAOWmhHi2HIqcdjxr4U7vYepZA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?mvN68h9PqqP5bbaVgWtaXZ1cmZYVA7P0pwcxtfJE6EsmbhuROltsOfbXAN9P?=
 =?us-ascii?Q?Un+H3OapiQeVSx8CjF+4Adg2Lg3uRr1OqIOnIZ/V3toy+TcoimGR+QgJYu3x?=
 =?us-ascii?Q?+rwiK5XDJ37mg6O9DxuvBsR3DVE10aYPDIj4DQzNCK48ThbjLRfy+eQa5eIz?=
 =?us-ascii?Q?/ah06m8FxDTM2O5o7JB8fRZjlnppe0oLDQglW/PTkMlhUwgUQX7MpZJezf+x?=
 =?us-ascii?Q?Uy9I3Z7df3mwYP498SWzqHbvW/9V7VsCRoUmobSOtHKzlJvVmfWXWScisgM6?=
 =?us-ascii?Q?lm4ookHgvO41DREdVYon3Fkum03p4KUXDXriOTMZkrUZbnedfHz9ORYOP0xQ?=
 =?us-ascii?Q?msGHyZfXTXqQMlZeW/8p02dAptfytiEIwjLLysD5iyGjsYL33G23f9z9grSP?=
 =?us-ascii?Q?qkXrkUbVod1iz50HMMhwvDZbM9FriaH+lsG/p7Izx7+gvNSczQ01xO61nY0M?=
 =?us-ascii?Q?C4/wM7GTgahAu53T4XFWeX+r14AHzE+Xsk+mxeQrLSgCssNjpp9IZ9L8o3/W?=
 =?us-ascii?Q?rPrecVJSDk5wx9hPxhFKl7968uFettWAjjEtpyFfjJI3KafMxVsCjKXPfDVa?=
 =?us-ascii?Q?RtXw2Zsj5HFcyqqWCMktLKeE4uSLcIRkClWx9Umj1aegD8oRWB7lYrwDsAWD?=
 =?us-ascii?Q?i5MJPng4DysRLN+HopjZ5NJGmRYEFH3dRlLk1S3EHC6Hmj8aCkYwIND4i3J2?=
 =?us-ascii?Q?9Lm+sQiFW/g6G5WY7sZLNx8WcG2+NMpAD24A+kUBmmMpuTN/cBk/y+/UbwNr?=
 =?us-ascii?Q?pZlXOErQEnR+tuy9oWTiJbsFXp9Hd61Q4W9pBiasrxLovy/5aShva8U16XPq?=
 =?us-ascii?Q?j7HEin18Y1SyLMEWSOLI5O9vjpcUsgzVi9qWsjKEwhWUbYq318xF+h+oOhAc?=
 =?us-ascii?Q?h2j4Zma67m+dh7/k6jo0Fd7askVvBZnQeqOFCCmJqqydv1/Cb86i/QBdQnox?=
 =?us-ascii?Q?dQ7r+1YLUBZfFFunJITxwvp3PfF91MxfbpKaTvilNjQqWCsJPngK92uZx6sz?=
 =?us-ascii?Q?JputkElw1mDFarJoXm8lZQWxdcruUfNUPRQr38nCCP905FnKvnqONKdZLgKd?=
 =?us-ascii?Q?gknCXhbIpEu4TwFBrUiIiTIwoXY+tawGuzZzlsEGVqe70DZu/FdwerDxO7fC?=
 =?us-ascii?Q?59MA1Wj7nJMsP0c+hReIBN8KODx/5ajrQ44kIoqvboxb6SHwz3CW9+hGZh90?=
 =?us-ascii?Q?0axemIqaAMYhoGPnJcDa/7MiUbDmSACxHHrsS0Q+CRac6aTxhhGdcqM6Oo2A?=
 =?us-ascii?Q?5OoWDtXol0HMd1KYh7SK1dxYFGyBBRQS2Yrw2pe3Y60jQ+c8Qs5RFY9hZmi7?=
 =?us-ascii?Q?m9Oi1dNj4AKPOw+5TQ7xUAfe?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D8C0E93722716549BD6CC0D5A9ECDD98@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f9908d03-930b-44a5-8d9a-08dd7c37ef85
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 16:09:43.9729
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5744

Hi

This small patch series contains various pending patches for hid-apple in
a single series.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

The third patch removes the unused APPLE_IGNORE_MOUSE quirk.

The last 2 patches add Apple Magic Keyboard A3118 and A3119 USB-C support.

v2: Add A3118 Keyboard
v3: Add A3119 Keyboard
v4: The "from" email in patches authored by me was different from the one
    I signed off using (thanks to outlook's weird oauth2 requirements).
    Anyways, I've managed to get a workaround to get outlook working
    finally, so sending them again properly.
v5: The cover letter itself failed to send in v4. Sending again.

Aditya Garg (4):
  HID: apple: move backlight report structs to other backlight structs
  HID: apple: use switch case to set fn translation table
  HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
  HID: apple: Add Apple Magic Keyboard A3119 USB-C support

Grigorii Sokolik (1):
  HID: apple: Add Apple Magic Keyboard A3118 USB-C support

 drivers/hid/hid-apple.c | 126 +++++++++++++++++++++++-----------------
 drivers/hid/hid-ids.h   |  10 ++--
 2 files changed, 78 insertions(+), 58 deletions(-)

--=20
2.49.0


