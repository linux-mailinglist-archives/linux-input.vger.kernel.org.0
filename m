Return-Path: <linux-input+bounces-5436-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC42394BD41
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 14:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF39B22995
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 12:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE25418C33A;
	Thu,  8 Aug 2024 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="kfGJwGS6"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2105.outbound.protection.outlook.com [40.92.102.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B431487C1;
	Thu,  8 Aug 2024 12:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.102.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723119586; cv=fail; b=jsDrCSf5aAeNG2urjS3J3Zv+WsB7tjAy4lkjM5xRZVpsWuIvb+xblRQ5fugSewN42z3/QGxsYoevGRd0HV9/a7npa3nACEPtbpHvZRC+xAN2tX0p1Hfv7PEKBkYhegasoo9RN9z85ZqBd4CCYpBmvHWsHVOeAvWBY6DoEAaCcE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723119586; c=relaxed/simple;
	bh=tvL36kUzJINyTUexTS/OE4MHvnNDxVVMa7QpbQbDLnE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kxSk51Vg4nY+XiddlMS6UwPoD3TsvyooDU7ZWIK9RZoUqRtpb5pURs/uq9MuimxWeXJA02qumi3WcXF7m2UeQqOqYiZ/GDpy9JprBbPH76DrCJoR8A/2YSHAQ2zShuWfTLW2YgXaf/9bCVF3nblb/+pWpcZP1df2BeCBSvvA1dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=kfGJwGS6; arc=fail smtp.client-ip=40.92.102.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhij9ym5elw+Zws/PTJaese6SHYltcVXPMraC5UsY1YLTturqZha3b8sonXLBacSrJakfzjKwmKy7m5ugGtOLWQiOecHyAzfXttwMMflTH53QKqb9JlZXE82Z7Y7rNdvogDFIgeKF57M23QOuezROYiaNEef/lz85cDWOFliH2Kv4yEeVRlUJNzhsIMMro+WWHgYiMFFwIrNtdsddlVwI0LCwNyxyBaQzCHrotoBnsbFwIQywQ3Dlk1aYpsMHBArv21czeoTjcsnl8c27zjynqnOkGIBkJSYRJ55/xiMrPpDSITtkEebLoBGanQUnp89RLuRUUu6fVod3zCSTG7zJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvL36kUzJINyTUexTS/OE4MHvnNDxVVMa7QpbQbDLnE=;
 b=OcO6i2CgIME1I85CzBlbcb6hvwjDxVirE1Sa8a2oEa/qOSf0qlPQGf2xtx+P6vf6ty5owjyuJrUmZw/N0vE5X8SqqIajRobsvn61tHNDxbQtyYH90Vro04lD7vyc1GEjFQAILvQ6ya+/o9T0M9nK+L0pAPatoLZvZRolUcLNAW/uDjK62v5/PWDHuahme32dL+1iVma1tof2MdTRWVbjvTb05RUes64TvAioCC82LYK0jwTUl//3daeZynfdcHOkoQQW6C+d6lH2KXvHYRnIvoKgIAWlEqNQkNFNQS/XiSR7ToXBIWFY4Zho8Lwp3wVoPZjblMs3kvc/yxQPK+MBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvL36kUzJINyTUexTS/OE4MHvnNDxVVMa7QpbQbDLnE=;
 b=kfGJwGS645o295Lw4TgWQJ7Y7ZxTuqhZnRR0rhXLxm+Iw8AdTLZFY4mRM6JX7SMXXydRlfZi0kFzlCY5+e7Wt38mHw4DN7xUnWVu7srP6yi89YqZWmsk9Ix5OrnNaPV5yy3khFAnV+tgs1Qj+A0neM4livz1SDiTsmAji4JvUr10T/GydoHcExEKGaSF2di/CWbnmKkhZGBdDVNdxFWV30wuyvHzK/c6yW84PXqhs3yIn0xrgHkUjYTiSzNF0ZkRXvr32xA57TB8fLR6eWndyzSKePiPnRoJAnj97n8/QVpbmwLJBoD2pNHTG65OkLGvoFt/0dI3QVwUCof5p3pJtQ==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 MA0P287MB0936.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7849.14; Thu, 8 Aug 2024 12:19:38 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%5]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:19:38 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "tzimmermann@suse.de" <tzimmermann@suse.de>,
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
	"mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
	<airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, Jiri Kosina
	<jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: Kerem Karabay <kekrby@gmail.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>, Orlando Chamberlain <orlandoch.dev@gmail.com>
Subject: Re: [PATCH 0/9] Touch Bar support for T2 Macs
Thread-Topic: [PATCH 0/9] Touch Bar support for T2 Macs
Thread-Index: AQHa6AcVDkG9cKryKEG7+2pjFRiDnLIdSluA
Date: Thu, 8 Aug 2024 12:19:38 +0000
Message-ID: <FE390780-D2AA-48D3-9836-9F33D56B22FC@live.com>
References: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
In-Reply-To: <021EE0BF-93CA-4A37-863F-851078A0EFB7@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:
 [F1mvpj4uq9VT+IFIX7WC43hgyM0e14m5KW7IwsFbWwkS9G47gcO59OMtjrd16OTHouMHjWmZJIk=]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|MA0P287MB0936:EE_
x-ms-office365-filtering-correlation-id: b1d0e486-b3b7-4c4d-9ffa-08dcb7a45f9c
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799003|19110799003|8060799006|461199028|1602099012|4302099013|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 /obuF4JAfBDwHQvW6dNkEX5d2kKVMJnemr71bjFWTBuMzVIDLuBbLAhicf7WNpF4C9lj/0uph/LkA/JFIOwvndrMJE+zE9sNFjCMj6eUHwPlWXLPqOB6OJVFWUP+HPeSV1ftWgs7OtlT7JNFNZRvxjoskxuZol3WnMyEFYLUWLf48tXsWwUxJjHLvTyn9KmdifnPGEVN/4aCPgwvKh4bd0rLBSdQHpPMQtbaFVzrtMetkB2BO091xZGdjOVfaKsUniuRtsUT1Nuv2NoO5OHYLFNIBXM6BEmIpOMgnIf/ldDKid3/PIrLn0EzQX+/dsunS/bK6twfI/Bst79s9c0vHU0QIkzZ3WKf1aJWLcAT5+tBWk1Swmy9BakjQ5xOk1DrYKLFh+JN5ReRkhR4P57tkCe7RWHiPPDO54DZTH0pf/mlL5k0tsn6hjWLsmpzSaYjLNil/kxTg/DcST/70qWfaHA8sv+X6+/wPZMc3HzVwshUXyGzvN/Nv0+bd5ahWyYFiejKDujKTnsIqHM29c7JOlxAYUdCEtKpQNuM85VqcPOHqYDjnIH3lNPl0zRvsSI+mxfBjRe/q/QxUaaGr3nGJSGK6CJEw5k4IJDdh/V7fpW+dguRzrVHvQS/fFZ9NFBydElbE8le5X8Xxbiv2XMrFGThHNTtl1mNghidmSdqGooyOFSob0MxHtIbJjLwHJLaqydvnUbd5TaDtT+nqDm0J95YyQGz2OTGZsTjEPnKvak+jVD6mxBCI9oug/00hZ4yc5ypiQn564XFO73kgpL5BYoXNG287bZjwaLRfdmUiQo=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?E0ZceOuco4v4e0bll5TaMy73L0rzuew1IJ8jIYVVMH3JRFBRmQDEiXMaEdHW?=
 =?us-ascii?Q?nsw1Vuba5kEFktoiVNGTMK7nAYx1tRDwZfuUU1hvImwf4fdGXWl3DbkpUpu+?=
 =?us-ascii?Q?YsgFC0urEuwCdPgEHq6odSgRV0oclwbC49KNIx6k++ddJaofX4rKmJuQKok0?=
 =?us-ascii?Q?v1nKZHaTShEQ+DmC5Csja9k7UX+fcTq43VjmR6vBJMMep+JFh/nx/tOHNIlz?=
 =?us-ascii?Q?QIiX0rdKg9eJvlSZyihUyRoV3M4coaL6gz00/uBY26MVuRNmKgiKxPfFQLDd?=
 =?us-ascii?Q?eN/7roT9WKDb0ia4FfZuvi690/zxzsv5VHNeKu84hnvB6DsFi86F7kbq+SeG?=
 =?us-ascii?Q?j8gIGQVsxcRZjiUIrdCWAk8wUYkMq3mcQD0cMqVKp14GkIHf2Yc89S8JOONK?=
 =?us-ascii?Q?4JH+szUCDLdI2OiU5MjVwqXgxnjqbY7gezsgZwwzlcKJydG2xLz/MeNO1tR1?=
 =?us-ascii?Q?kJ4UP9hgdHBfnFQtipxBkGxEdAbt3B4aZB32LDP2NKIAkhSiYojxWag9pZ83?=
 =?us-ascii?Q?3Gv0O+4fjzvgt9ewNLZA9Ed/bVmhI+S+KUMiZXmObzjtr+HFSHfDDtQ82BC7?=
 =?us-ascii?Q?9t3Q/2TJj3MKERwG7LKPr3oE29LytI6UzxwJ4MYW6Tqy9YSW71rrYs4I0dib?=
 =?us-ascii?Q?WMdfh9iMuzfhlPeRdKpF4Zczr+EbTTgpkWYmkkS6NLvu2pPru8ZfhAqnkOvw?=
 =?us-ascii?Q?GPZeUN/trdXk4DdlqVATFtdr1GC2/7DjcWaTFuv/uhB06ncyYnQrzhv3l98Y?=
 =?us-ascii?Q?1f2vE/GcfJEduZfc+BQ61hMIX+kf0YHvbJPF1bQejUkgPL0vUdA7lKFMvM7V?=
 =?us-ascii?Q?JJPn3kdiUXbSsq5ErpZhfKCrH6QMWfVy4pqc3JaiQWERmZE+d8KdxaeQS/1h?=
 =?us-ascii?Q?BVwjKlCGl0tIYMDWy9hxRT4c7DryHgDMCYwU7oBlRfVvdyUnRu0G1ugSz2XP?=
 =?us-ascii?Q?b/1UY6AFphuaI9qVmmaWLNdNZ5EjUyf+O7E7WR6BAw0WiXknkzqcqQEaS7IF?=
 =?us-ascii?Q?tqLl0qLXsmJh166C5JuMtvEWrxZifrSMmtxDJXxfcnmmWgyBvNiIjQ3xxqsH?=
 =?us-ascii?Q?xYxEeL4/wjFWWrR63Q7JmekxNuq/58JqGQNB7wYwhGNWOThfiPCmPkyXZMUo?=
 =?us-ascii?Q?Wfz4E79rEFzCZrULZy0MEc1msDyskFp+5iF2c1cR5BRb/YuHyZ1/eTQ24oqe?=
 =?us-ascii?Q?q5e+9PitegSCTapHiAxstmONLj1gOyu94lC5hxgD2ZYR8wetbdeh0SDq1fVU?=
 =?us-ascii?Q?uCDd2LQL9Vnz06qVgr9yNKxrkL22Fmmbq30LjHFu5Mq+ZeovpImQ+xGchK5p?=
 =?us-ascii?Q?hiI9uKCogpAenPv6kFxXJyu6?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <80B93C1F46CDE3459A7914AFD0EE681F@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-24072.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d0e486-b3b7-4c4d-9ffa-08dcb7a45f9c
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:19:38.5861
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0936

v2 of the patches sent here:
https://lore.kernel.org/all/752D8EEA-EE3B-4854-9B5E-F412AFA20048@live.com/

