Return-Path: <linux-input+bounces-12431-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83208ABBDB1
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 14:28:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 226E717D356
	for <lists+linux-input@lfdr.de>; Mon, 19 May 2025 12:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E362750E0;
	Mon, 19 May 2025 12:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="TNSB/E1Y"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010000.outbound.protection.outlook.com [52.103.68.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA3222B8A5;
	Mon, 19 May 2025 12:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747657678; cv=fail; b=TmZ2pLrbGXwa8+feX41jyRY1zwmsMU5QFlnbE74HVP+h0EVWuLJdk3Jj2JfN2uRZs7q6Rx2hxnlZ8eotnjiK3qSMgvUBbLzc42RRv4uu/ABFZx7zFXhkLKAIJjHac0RcIROtWnU90li8uC0SV7ic23Ks92sz7dbFr6eg7R9m7H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747657678; c=relaxed/simple;
	bh=w0kB/172dsEMmpcNAE1TTZzoPm2JSNHmEW5tAwEMkPA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=RkAWpXTh5VvWoEbjjAcc/+VGHajNhE5SQXPWKjBKgvqZL7cnNmE/Px0I1KLhpNYL/v/cSLCNVidUPwkH7+pm1DJgGodefQkIw4U3vObvgOYK5G1co8d7iv7ybXn5ax+jL22l8aUpYKmZRZfXlH+rj8Yx7S1LUOE4hzCvgEp7Aec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=TNSB/E1Y; arc=fail smtp.client-ip=52.103.68.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CoaTK7pLUIfqQejbge4sTemqtpwe2kbbrSGxZ5jmZOBKBjPVidJ7ooaBGQPKGlYX+6dtkcuzzKuYftTPZ158m2meoOwqL5TOBLnhWJHEzpZKZ9pV+mS2w/nR55O8znZS4Z0hdvJG+OBx72oN6Hc35VkMvmyCFGUEFgfzRgYeaGX+/cfNCPthdMP7bHEyxqPMzGDFku4HBOmkWc0W4WkWfJVgW0vA+6hlebBopWaincGhYohGHKN9jKSldld4IBpS+MYTuw/YuoVviRJK9fMzhNSIGdcSD+AtrVWanCBo7bKb75UygzBl7iji5wxvxo25RNUV841pw94LnCGM6kg3lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mdKyTOZJVA1+z+7cNdHuFZEJ6ezViQ5eVlym2waGV3U=;
 b=v+c8DswOD7ie3gA4nZ3Devp6Oru/7N3NW4Ui25lJBmb7FtJTcciKFqcU1mSB9QQDzinjmleNwE9ko1BwA4dLLkeK2xJFDw4AHPOy08TvmShEIQzELO3PEhOyFuyQULOHzHjGu96C3GOTqfyHlH8Tl9+0spwe34W35REom+p2ae9q6qkq/Tz85VJpbZGsBggi3NHWHswY1I31vEfdM1xRVQ9S1aQ7E37Flja1NVQWuVmWAdZjBk3GT+bscQhXPkAX1lZkf4WPOx1at6392Dn+iJNSJ+yD9aIWbDi01myU/Ki3BRcQL8/OWLUQvsc8tkKbA5mzJ8fvgmbB2+BLP5ZwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mdKyTOZJVA1+z+7cNdHuFZEJ6ezViQ5eVlym2waGV3U=;
 b=TNSB/E1YdfCQsm0nCgn8sk7anvXMm2ihhP/+hEaUb/LpZE2sc0TzMwpDORlsIMJrp+tlzApczs1AjriPP1Fq+S8QmUvlNBfrr0Afth42xUOQ4B12mIuixJxZzz2+qtcpxtw/pft4nfhNjVvzeuZafYYN9R6lDWJ6Co2dYO8N6HNSfa9QOfwJDS5TtcQ7PldVjQ/Ag1u23Mptz9sbpVSpbUXSWE3Hj0zFMpA70bLYRS21WNFnY/GL0T2DrTxeDhMUnNW2ld87YnjSfdqD2Mrxm69W2l7dp+h6by2ZT2QMHHJIhgLaYgbFVI4ff+NmhX96iqt9HnI9oPfmVHowpTs9iw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB5917.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:64::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 12:27:51 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 12:27:51 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Grigorii Sokolik <g.sokol99@g-sokol.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v6 0/8] HID: apple: combine patch series for all patches recently sent upstream
Date: Mon, 19 May 2025 17:46:15 +0530
Message-ID:
 <PN3PR01MB9597843FE87D50116665ADC4B89CA@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250519122736.38469-1-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|MAZPR01MB5917:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d71368-0bfd-420d-a7aa-08dd96d09248
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrMi34iUpeHrvUBJkG+6rPgn8uQCaF1Aybw0Cb7ZCbQD9j93AIRRA3VkCz79XKyEvFkftL7tKUMiQTYblb6kCKMo70a5bGixzv50YDogGqXDp9cwK/GSEw6lezKfgTL3u6S4sJqFJOldfWmiZWnQgkVE/pRZcHjk1MI5RLDilayhP7LUA7U5ZwJlXVT5edxxT7oAaH0AYHS3pZlBC9y53mgg5zMs4aHN96HFqtJgj965ZnHtU+reF5z7i+HXOmYVStLn0L8ZOdtM0sAjX27Op43oAguOgXcqZCRrodnNh/R2EecPBKuQl0ysRQiS0IEjm8mYIjnrCGx4NXWnwfjkseOC3WGLVr1tjdj5WgPItBWsPsBkoFRSSupqLSbvu5bMLAFQD5OumN2L/V2D5344kOZZfqI/oDAaxWy7ddCxJxT5YZ2Fob7Wc+j1uUdKUp7I7blEGKQUW42b5q/uW9YKghFRsKoJVPHetOI62zhaiqOeJWS/8x3U1FYqHFhc5BxRknpCjxH+WXgJl7IZkBkPKhpI751AGQpji6Rp7l7EHl+6DmeCK/6+/ly0LKQO/ukfneHxaCkd1QmYJOM7gk+paT3p0LJnreFVhcqTpmmuUNDT8fsuhFOqVY/lyM6FqdsnzuADQDjgaVLmZ15B9ttwnAW/c+ZsrxGxMGYjbBxXovZya1sqz/7GceG09sBnnFhzwWKnM7M8PV0/FJZqyPWxf6McSnLfxIIyS5p6P1P4SRYmob1cKWSTMl5csty0X1fOZcE=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|8060799009|19110799006|15080799009|7092599006|461199028|13041999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?b1NFHzRu1KOcKA0Un86k7bl+FIPJTloVrrf503xeBPAYFOj4ebPTpBVdLxvO?=
 =?us-ascii?Q?4aJzMfks8LSLcXoIle1/JGL0L3kJ6XP+5hkpMCXDz1te6sm/SoLazf3ODqt+?=
 =?us-ascii?Q?ZuzF/FNxakOM15mFeUdAW9P0g/aTLJEKYdgP3cmKe9zc5UCc4n64qK1N5VIK?=
 =?us-ascii?Q?uCDmkWpnIBTTMlq/FX6lfUTs+ZB5LXYBTKRBbDS6y0vxrCw9eFCXImYRGSTA?=
 =?us-ascii?Q?1vk80AmLjG4HOePL6i58CENpVxp4Jo90WnH446IIEhHoXkaix5o8SSs3KrxI?=
 =?us-ascii?Q?cOti/noJ6NkVIQALVEUk+jvMHHZK1LqhKO2JtgluKmgFR8U7bqfpTZ/JzZIW?=
 =?us-ascii?Q?fmfnv/5NqHQd9QJxWjUAbSzmdhJjwlEtg3H4N3cKGh4x26G4kIZUqGieemhf?=
 =?us-ascii?Q?ji3gRE5eX8CONAOuWQZqTQ8VZQggn4YfnX4SMvO0C7LFIoaLdPmfN9HoYCvh?=
 =?us-ascii?Q?3nRLfnnh8AprlApg+CZwfDoHcq4KPqHEDYKoyb3YXruFVTwR4cEmcVDgTvsL?=
 =?us-ascii?Q?GUqVrR/x5jPhRgYglgHBuiFqAHqWrYvSn5GnO5Um4lDf4NIkzwPOjpZ/WLSZ?=
 =?us-ascii?Q?eSMLnriyI0w6F1hDPLUDU9LGAAGII99N09E8wRwfuFGmO2H3Jtz7qbwwF01s?=
 =?us-ascii?Q?CbJhU72s2r7EWdrDXoGYobWL6Ax8qyVayF/Ya7X0dyYKus0apXb1rUOTI4dG?=
 =?us-ascii?Q?ieV3oi6QmisDhhGT4xLHn1i2Txy8rZ4pwb6TcsFsYjPLDHZwwPe66ztqVB8k?=
 =?us-ascii?Q?Xwc0S3QVthZaTYq6dW4VQAAWkUO0Vh5AipIvDsxBfo3PlFzVulcWeke9MMHV?=
 =?us-ascii?Q?V7ZU5X2j9Z8g/2Fxy+afV5cAItQHcqC5lJGWWlAJ8VDaGvvlO18KXtnVJk2P?=
 =?us-ascii?Q?iMTUeCwCCQuQDW5zqpz1TVCue2kF801WNUgQPwbx7PqEHJM+Mr6s8heTNAmx?=
 =?us-ascii?Q?3e4GvXihHHEYZd0m7X1gzMpLRjnZiHlzqOVDYTgYeS79uycRNP4CG1SE0pgQ?=
 =?us-ascii?Q?jsmSpR4/qjI04C/Z2stEmDWONjHzUY9d25sZepr6pAqs4TvXwUM/vnK1ASpg?=
 =?us-ascii?Q?iuQswZtLULGASGJj+tZwyUEC5s1I/7wm6rFnw4+doLjYxOvUlSnCPWBcpy4B?=
 =?us-ascii?Q?6Iye1G27E42MYWjv6sHfU7h3M+Y7R4m3FQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Nt1CdJu583t2ob7ddkuYa6SLoztx49JM+f+Ymvn9HsLXwkNNd+fwtQDmIBJ?=
 =?us-ascii?Q?uQmketrKPlk39nyoMktQe2kWJtITQ96xkBuEN0MJRXXxPeS20H4PDmtBRQc1?=
 =?us-ascii?Q?5wRbqiTUfUnjQo+g+A7BkKwjuUNtNsPCRsX3OlhWLsdhzazuS38iDAvkGdNN?=
 =?us-ascii?Q?nDEKfUqt/FI+mBDWwbm4vmmDsmX5b0Qr4/T2VuE75RugqQ1jO/iFXAwMbTAN?=
 =?us-ascii?Q?/LoaxF+SvroHkyqt8gAwD3sIE6QvMq0f5JwRlkxUBNFV6Sk+IGxMcUgS84Eh?=
 =?us-ascii?Q?iBvcQHtL2P1K3iCJHW84FYWDYYqoBb834eQK5o4mtF1fKW/PKrPQDdLdemUJ?=
 =?us-ascii?Q?Y954BTEcoHMD7XlicZ1LVepAI6kVaby9+vHRYH+kU52AnHog6IidSkNpVO6D?=
 =?us-ascii?Q?uFn81yXn2ekibEsuZFCi5CVYCe+FHWcIiwsKJSxnZI4RYcM2KJzmHWGgI6sD?=
 =?us-ascii?Q?mss5wHgMmmjBV8HDNbnlUFJuoSZA5X8G202jMUcQHzCXD8hFK1anvhaICBh1?=
 =?us-ascii?Q?dJBYx3nw1iQeeZeKp6Fr592cGvj0nM39MGlHweANlif4pIx1O1hFNayi3SP+?=
 =?us-ascii?Q?K6YoOzMshJvRVoPRwagcjmxavbvpA5RvnPrhhzwgWKJc+q5EGrOM00ZNP7mv?=
 =?us-ascii?Q?fM61cNHEDZl6RvUCLPJ1h2UZ+R9xZED5wxNfzoTuCuQcIzUNrx+4bPA58d7L?=
 =?us-ascii?Q?trkPCKnusbWwYJQkugBkw06Xynf5X+1i450t0VGP6f1PNZBKI5WQJAqM2RDg?=
 =?us-ascii?Q?EfQ6LVZxD44zZSPKw2liSpKBIEw9kfZvGfeGfeRou8UqrCnX27FnM4eBohvN?=
 =?us-ascii?Q?/Fx1XQ6kzbOhdrQ3Rp4BvBxmQhFnm+IRHcXgsrlnsonAQNLTONREcfYkLS4A?=
 =?us-ascii?Q?CNVE0BnHLqz+tsX0qTIwHjwaaMUagd/rdPsX7tQax7N50ZfG9d+g36mbgqa4?=
 =?us-ascii?Q?NVOmjMNXXHARBWeb3vbATueGsCNU2TUeuVNhKYGkNWvdmeuuEXSt19J+yECg?=
 =?us-ascii?Q?/sR0Z4JMAnGyzT3MTI7bcriBxro3km4ymKdEF88VssmpMiRkwGMjKnUpX9lZ?=
 =?us-ascii?Q?Jz20cQghPGo+LZpOCZ8GE2Oq5V20o68JFnKRgVrGR87qfRktInQVc+OXfmL1?=
 =?us-ascii?Q?cVnXN+nKjM3OKVTP9NyqCwFhHeRO+NHQI5gATuHYGO1HOzVt/rCAUswYm/4Y?=
 =?us-ascii?Q?/FOLNMStHBAzh5UpwEmbnjEcwlC6lfveqVHFVPCiiwVVND/eTg6lcw0/lBDu?=
 =?us-ascii?Q?stOB+/36+PNAVVSJqJzrUpwVKzjiV3bAoBTv/IwLb4puRLqSNk0k8uEkWwLZ?=
 =?us-ascii?Q?f8g=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d71368-0bfd-420d-a7aa-08dd96d09248
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 12:27:51.1031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB5917

Hi

This patch series contains various pending patches for hid-apple in a
single series.

The first patch moves the backlight report structs, that were incorrectly
placed between the translation tables, to other related backlight structs.

The second patch makes use of switch case statements for the ever
increasing lengthy device table for fn translation.

The third patch removes the unused APPLE_IGNORE_MOUSE quirk.

The fourth and fifth patch adds Apple Magic Keyboard A3118 and A3119
USB-C support respectively

The sixth patch adds a new fnmode=4 to hid-apple that enabled disabling
translation only for F keys, which is useful in case of Macs with a Touch
Bar, where F keys are shown on the Touch Bar itself.

The seventh patch removes T2 Macs from the hid_mouse_ignore_list since
no driver exists outside the HID subsystem for their trackpads.

The last patch adds support for third party replacement trackpad for
MacBookPro15,1 which has different PID from original one.

v2: Add A3118 Keyboard
v3: Add A3119 Keyboard
v4: The "from" email in patches authored by me was different from the one
    I signed off using (thanks to outlook's weird oauth2 requirements).
    Anyways, I've managed to get a workaround to get outlook working
    finally, so sending them again properly.
v5: The cover letter itself failed to send in v4. Sending again.
v6: Add 3 new patches to improve support on T2 Macs.

Aditya Garg (7):
  HID: apple: move backlight report structs to other backlight structs
  HID: apple: use switch case to set fn translation table
  HID: apple: remove unused APPLE_IGNORE_MOUSE quirk
  HID: apple: Add Apple Magic Keyboard A3119 USB-C support
  HID: apple: add fnmode=4 to disable translation of fkeys and make it
    default on Macs with Touch Bar
  HID: quirks: remove T2 devices from hid_mouse_ignore_list
  HID: apple: Add necessary IDs and support for replacement trackpad on
    MacBookPro15,1

Grigorii Sokolik (1):
  HID: apple: Add Apple Magic Keyboard A3118 USB-C support

 drivers/hid/hid-apple.c  | 220 +++++++++++++++++++++++----------------
 drivers/hid/hid-ids.h    |  27 ++---
 drivers/hid/hid-quirks.c |   9 +-
 3 files changed, 146 insertions(+), 110 deletions(-)

-- 
2.43.0


