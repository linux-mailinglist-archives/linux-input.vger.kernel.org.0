Return-Path: <linux-input+bounces-11895-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B39FA952FD
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 16:48:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 741C116EC1F
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 14:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194FC1AAA1D;
	Mon, 21 Apr 2025 14:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="QD0LdzOl"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011026.outbound.protection.outlook.com [52.103.67.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC461A5B91;
	Mon, 21 Apr 2025 14:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745246871; cv=fail; b=fomdkNFiMKTI/bpzRIAE4muwdvOiXXjm7mkdXyhJe8pktBgJAvKU+SR5tYnz9Lz9/veQrEb44CTC4lJUgf4b/xyHekJpNsFo6VZnlgogp/Ko4l9+agHH6Ro6vipiAhIPjuTk0Hx9TvNFy7lSs5yFCflOvEkTRl9cZ64qlhy7AK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745246871; c=relaxed/simple;
	bh=fs6ud18NXyJZoAmw5cQmVLwTo/eO4PV2uIf5k22xpnM=;
	h=Message-ID:From:Date:Subject:To:Cc:Content-Type:MIME-Version; b=sZvTkI1HCfaKE8xxcn3WMxIDQjyMV5f4xmecmIyPsbUL/EHxeWvgPnQ4NWuSggoXN2svDSHGc0mxAedrJbWV5rrCettQjOpgJVSST5y0s6btCX01WDEOqwX3IkNHj5Ty+S3dsSTp+Hc084UtkHJOIqCpuc4GJYfRxki8dRXHPoQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=QD0LdzOl; arc=fail smtp.client-ip=52.103.67.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXw8l9w7ypzr6aJ4lg5ZuahbpNkND8aNm43+ycqhPJPjglOOb5hEkyvpDuVr/XCvploq5BzlQCUlVVU2e+hauTHBPE6dDJ2J7ql+vnjsSYkXK7MD5vPMe7P2gDz9q7Wwg0SjliyTeuuhRgiywteFEhPc0HUFwHJN41RVqD+8WID0ME3M2tz7LLEOUcgFUsMZ9EqoOfibEt+l9I9wmab11WdXl2e/+JCFYVgVVVjIwkwffKck1GYh6g0P64BBYKhMwp1hkLgC/bY+xL8Xakwb0r9YUzCdWhBr95ALgMNWTZ0blWuytVH1LjB/Wo0Ik9684Qh08lDr1JzPP6uWq0NPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbgcaoHN8+dOCVt+svcZSMJj3y9ipKCfaXD/54MImbE=;
 b=MecaOd6+ivO7t6zJl5CSJZIpTefgEFJ/xnqx/uBKNZ+qvyAmrn3mi0PtsIyEhPGDLc/67fnAYbcAf05cCDvdZ3v1BhOPf8kOi8oYpMlFB1qWfxGe5Dv1GdbudtYR/tQUBf58vtN3g8L5owns0zzm/A/o/iRKCpNcfNQ5GrFmA4dmSImFugdZTxG9IcNyVDtZeXnThDpLng8SryYWhmIQ81T2cKmAlwKSEbmuwCsxZGMVctLH/UI3W/Rob4iGTi0XoqtWn1Kk3kSrYfq68naJVHILl12SEXjid4RBYrdY4FF1sJgkJa1I21Bgw39Z8Q5Med+qe2sMZjmckaYVfPO/mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbgcaoHN8+dOCVt+svcZSMJj3y9ipKCfaXD/54MImbE=;
 b=QD0LdzOlkb5Pft1geP4Nlh/k+WjRZpkOFveQf9ZlCyfJFu/1qJqsHTMO3RM+SGMWQuuwWOpaVWvKWf2VypryFjTg6o78idUlVpvwGgJNFASXJZBiTNtoNGiNDiBJtZokTC9RqulzBSR8/BHEx+ii6L7qiR2DYSx49FUwySSoAIZBMUFDlo8YYUHYdZ5lpBfzWotKa7I31O2Jt9Ojtslv2gHgiqNYin5zOoGLHcOf3RFZDfgJ3RjsjUV6H1Km/zy8Z7F0Nd8nJ3DLT5x5Bl42eMDrv9b60DShKuDf8e+zaDYMJwQ5CusSdDx35ay2WPkUvvO3naO5OafinuqG5DiTpQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5918.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:65::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 14:47:44 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 14:47:44 +0000
Message-ID:
 <PN3PR01MB959796962F41CBC4B7B2BD90B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Aditya Garg <gargaditya08@live.com>
Date: Mon, 21 Apr 2025 14:46:47 +0000
Subject: [PATCH RESEND v5 0/5] HID: apple: combine patch series for all patches recently sent upstream
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>,
    Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::12) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID: <cover.1745246807.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5918:EE_
X-MS-Office365-Filtering-Correlation-Id: f929d1c7-27f1-4909-ed91-08dd80e3793e
X-MS-Exchange-SLBlob-MailProps:
	AZnQBsB9XmpI8tRyoOXaSUmOkLVCBKasY3hvKgfccIJeDyj4Wnrza93EzJOCfCoxIL2q1oI8DIBmDdEiUQaUFzsuWw2INp9w0MlO2fNSKdvhNkaCdqIT2wkyI63S93tE8SA5SEBRT2rveJdShpi8WS7bJSdqeI1MNNWVnLN5lH8FvpomtXxPHuRY34fz7WoIyXgCtTvzur8YScS0f6kJm0IaITFvlbxQMXG81fFJvaPmaCLM/Oglv9rkX4A5FlHH5YZbvVbnPj1XgDvTwWRKAIad9rYcaB8ly+g5fQH4KBMzOKF2FLUrxCD02q4i2OFEfwN3iJ7qGVi4aW76CLfHKAVVdkWooiQKUvCJq9jT2LRdeAo39de4xgYryW6nf267/IAX0W8CAVCOgEmjwniTNf8MSquK17YyL51jBk4mJGKaz35QgAWUuVkRI8915SCf6QVzypr6gD7qyWNKZoe9S0fcB59D2ms38+2s4864R491/pbeLl22npJvFZQRYaY6RcMOnYkCZE8997qNIONuKrrNOgJI9jeUIzIwpsZOdsYpdSqknwfpDiKcAu1vxfCJVgyswVZ2hKbLF4oWrfqErpgiY+j71H6NfE7pkIEdj1J2eGd4xtKdoHkb1t8kkF2iA2p8vBeszhde2cgbRWXwlcwRmtJAHVUk3Ix9BfEERuX/ynDttl51s7qX2NZKfVjXBuni8VEFptD1EWkXxdCIkEwBCcCmcwEZ1cMel8ItT5wbBHUTaQ6mA23Z/9ZD3kDZTkAbw4NFYMQ=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|7092599003|15080799006|8060799006|5062599005|19110799003|5072599009|13041999003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WH/UEjkw2TqPtFKV3RT0BrH8j4No8a9ZDT2RoKHd8Y0DYt3EPxtFf6cVoi9d?=
 =?us-ascii?Q?V28Bm0zvFfBveTL//8y8E0umiVXRHKrj+g03yyleOtsOXZRckDVfHHKFC4ic?=
 =?us-ascii?Q?V+VV6ZoZ594BX05YWLaa68OHcPqdA5ukhR0M4mEHCrJdZFhyr80j/m2NgNKZ?=
 =?us-ascii?Q?yWDkXzwy7OP/TE6smlVecvlV2s+9wb3mWGliVsnJ+glf84NOdhs1c970JsR8?=
 =?us-ascii?Q?MZwclmoFq3bB6XImTdwf2595dm/JQerS0KyB5TSsNuLG5eeaYCelHBmlWrjM?=
 =?us-ascii?Q?Pw2udjLajuiqQuteFtsgIn6I1RsG8uak07rb3nZnBZ3tv+RfmFWxQD2eH/k8?=
 =?us-ascii?Q?DIrWDjyrWPDokFwdD6JWTN/nZP371kTwIND3QUjSq+HOmqeoSJ+l99Gmcu7N?=
 =?us-ascii?Q?KA66rmmOxIHY5Z/khM8T1TAhd9F6o2aK/TESVJ+rB2PfvOG0KLY/9CZEjR2f?=
 =?us-ascii?Q?2cNzpHBMMkO9yVJ6nIyA+Xh+RV55hc3j2QebVtEjEqYg3EmHrD8ft3rZiYoz?=
 =?us-ascii?Q?PbReIykzYC/iDGlEJZ5i8JcY3ihCNlNe0Xa6k2fLA2PmFprD4/Q1J4y0DAxU?=
 =?us-ascii?Q?peaLF1CMYesITWGrMyl/JEekK7JP0qfsd+n79qW2+G0gKhswQVFFaJhbIsZy?=
 =?us-ascii?Q?ZgN9IyoQcLXVm8hOb8Vpsywt8wQVPbUWNzXBnN/xBf8DUHrPIvVACOwKjWwR?=
 =?us-ascii?Q?ZL2BZXEelEAZ0YdWanfiKv061qRvgHjEpPbrpiTWB1OXNk5LbKs0y5QAG8YD?=
 =?us-ascii?Q?XeIROcjKci7ZpJpYkmx/ylMScc4edPxicFSqH9juN1MIuGXye3WCvCJ4fBzP?=
 =?us-ascii?Q?+Ei6htPYTv/gmORCXSiXHy+fCkj7oDMlORa5bdqIFCtEV6hwRZ12QOLZeTxB?=
 =?us-ascii?Q?3XFnk1iNP9+Gj2FsxzezC+q1XTVmyOeMIIuaZuox4RKdehDZBSGFfzbFkHJs?=
 =?us-ascii?Q?I51c7ZpAXveWYoNfMlGzCuQkaHatRt18CcVCAIstsG5egj0fZnQKDvVceb12?=
 =?us-ascii?Q?K59HMH85MEa7UENjcd3VoCDBZa9CmZ2IdUyTpvVeYhXdwhuuLie+0skLV4ne?=
 =?us-ascii?Q?m0LrNlKA10IX0G10c6GEeeCpeWZbX2mZ7y/8BCtow1TTc6VHceRZYoOcpxKt?=
 =?us-ascii?Q?UChHFLCS/vnD7wbjPvo1VKVHU8RxHf2+XtYu+zgYSVVCAqV+n2uZVrs=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O+YEzipaUD2JYyTJiIig75RpCH5egS8rejXFJr7HkR7IxyBd0PXrN2kEi1kV?=
 =?us-ascii?Q?CtslQhtXNc9CXUDOu+eO1w40KmsUIBasTkeQnbQUVkewgVA/Md7MMn/TZa12?=
 =?us-ascii?Q?76RWalcN3G8KCU04shfb4q8dgH8ZgUi/jjHN3U8Gp7WneLsrXy4gPgOymbv3?=
 =?us-ascii?Q?km0fqHglCcCfTEdl/tOWKstwAOreUoi/tEX7YDXyy7oo55+FyQqDRLhIDDl6?=
 =?us-ascii?Q?u961uxenwO/8jBPOQsg4YtDatdHrpBGfntHJdK54rfyy2ivd7ia8Mkk3bIf5?=
 =?us-ascii?Q?yj0FrU9KxErR4gLH7s6/8Tv1Zbfr8vxeHAbBESWO+ICWWpSNDwYJD+hQZRzW?=
 =?us-ascii?Q?PvADfVMJSmgR1yl9RwR9/VwfYyiuJrcK+GXMDphPlCa4Z0eHKVJkp1gUH0nk?=
 =?us-ascii?Q?jJQhUyDgDbP+djCHY5iup+2hkpVCzqvU8Rur4n4RyqKdtuCVug4sRh486x+/?=
 =?us-ascii?Q?HOpWOHGT6robeWRxjBrQKHBrRGXCyG6vCUX+dseJgWgxPB69Lp80l/TkJRaT?=
 =?us-ascii?Q?X04gSi4PhcBJSN438oOQFG5huWsjqfmWKsa504ZhiwOPOdU4LzEu1PmNIQab?=
 =?us-ascii?Q?OKKJJ8qWzdV/mc1qNY0bNyrBCOcpC6YFqBFeczZ7Ot3LskG0vglxKtHqMcR4?=
 =?us-ascii?Q?bvJu3SHxiHj7W2cKjIquqcMNdjjH49HUbK6tdT1xeGqk313daATwBL98aPl/?=
 =?us-ascii?Q?8vzIr/XxjlRmh1Yh2iYl/8pAlcnL33oL4te1XfRdvDuV7O2hfIBVsD9K6Obf?=
 =?us-ascii?Q?wrrPf5+94PrnE0ouRyhrpDlGgO01A/oEUy6a4ybTg2UNCBLC7fl1DtNPp1sn?=
 =?us-ascii?Q?KljJ/873hjQwmOusjV8bHc7EU7Tjy7Npjj3orv057NoBm52W+A4wlEM5OAEZ?=
 =?us-ascii?Q?BujHPdElewElFGX00Udl5c/Qu7O31+3abZlnjluy0MHf2PYzqcD2T2y8R+DI?=
 =?us-ascii?Q?LG85jDYuwnGBHkjpsUNE9R8clTRuk/2BzFHT2VJccavdxu8YBXV4g3Mr51VP?=
 =?us-ascii?Q?mBrbEYxvSHjOsyEM7E7RDAxEu/g+WwiLOTwBF6m2ineZnklpxNx85G6geKgd?=
 =?us-ascii?Q?Fh7pm1mHdx2Gx92p7pqnoH6A0Cz4nr20RrTAx/VRTCmqEv6dWFYN+HTusTzf?=
 =?us-ascii?Q?XIhrJsI4n9ub5itTIw+pDDglTl8PCoRao64WwoSveSw+0jm4REr7AbHIDx4k?=
 =?us-ascii?Q?+lgjo2EkLBSbfhkw9joe2T9xUdf4ZOVPCTSPOLUS/2uNoUcw4+dVeHolk8c?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: f929d1c7-27f1-4909-ed91-08dd80e3793e
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 14:47:44.1102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5918

From: Aditya Garg <gargaditya08@live.com>

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

-- 
2.49.0


