Return-Path: <linux-input+bounces-10518-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4839A4D7B2
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 10:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 731261886FD7
	for <lists+linux-input@lfdr.de>; Tue,  4 Mar 2025 09:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A38B71FC7C1;
	Tue,  4 Mar 2025 09:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="Q5RQr5MG"
X-Original-To: linux-input@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazolkn19011029.outbound.protection.outlook.com [52.103.67.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1841F583F;
	Tue,  4 Mar 2025 09:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741079687; cv=fail; b=CWV+lCL8PN0ifWvtL+Qjt1Or37F0AK6CtPuN6drPPiMkX8CkF0o+nrsNoNgSGQTJmXFXmCnyhZXDAAZjCSNR953ZVlUzAAYwPkw8Jr1FVdN3Z0EDXr2ulBHsr4y4GTOsR4otcm3GRVaP3YRgtralzDXSJBMUDbViKzXWAM/fcRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741079687; c=relaxed/simple;
	bh=aSBWQDDFZfRmexFOcJBLob//rIJLHw5RlbPT0RQHKbE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IKZBvKF9Izulvh0RQWhpicSPd3LTEx/t2eriLW+h9lZl+Z+xyLrFijCS+bvAhvQcHyGo8Q+7jjpMIKRUCJ4Yd5Hfhr4QNz4wbuINXArQWxJ2d1SSbX+Dx17y61473fGEOERMqdEnrcFzDZUOqkQ9qVZFfEdU4Yogcswe1ZwnMTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=Q5RQr5MG; arc=fail smtp.client-ip=52.103.67.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGIIt3XZ5EuDC7kzVeihsz3e1AFlnxKgJaLfiySei5ETkuNzkQDqsfHzpczAWX1gVqHKazKuCO2HAtrEeDukCuuS5OzZHhvS/MqAb3+HvGfYwH7cTFx1lL/ms9xCKYTew6IF+ocnLZDkbrONl9q5s89U/LDMyUCuBlKJPPntwJjEG75AbFSoHS1v/JhrciaZbS9H9XS/quiMlGSf30GImBCc/gtC3+P8NqeUymWKZPXnt7BQuJPoQenzmsIoG4eU34he5oC+kOVnPWQPqpmIX5aY9Eym2d7j+mjylhkObBkUNEM6HK3sT4admstPOvYGXKlV2ui+WQnVVrVXzcX6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rXfPZl+HR7YCoV772OwU2QQSjQxng6fmzb6c7s1rpx0=;
 b=gzNXCdqdlKURKe7KR5BelR4DOT/da8TCxomkbx96q4rZf6GnV8f7DTUXAKSkFOmRBddDbkLed3KY/lnosYxeW+7E1jecUicKbXiunLb4nc/7sUGFbcxByCf6uHD05rjFEfflsGGWDcqDv5rqa4rM8osWl0S+De5mbtfPmhwotESwxyJHjX1tJPJ+awK0MvgNvvEEnQVnB02Azo/AiO5JXDNY3VK2N0rPdDQ/AxUSTzHC0XaGNvNvyltfwKxulatSYYZ/ADLr3EohYU2k0hij+vsOm1nsSwKBogoIZQjcIWR+ajkB+jPPPFUheqKG9Umo18fXLYJXTgu1PKjfIIWwEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rXfPZl+HR7YCoV772OwU2QQSjQxng6fmzb6c7s1rpx0=;
 b=Q5RQr5MGgwBmx6B/HpCZPQlHdrpZ04QmHjlJ1o1VYJf2RrcuC+5EKkkx1GosKsohsWCirqEZhrgDK4104vcSX9hJiWT4226X4pwjT88Mcj3UtNO+SgYlK+E+OyoccBKWke5z/47mv8SEUqL6X6HX0isXr9bBpWRZ7BhhN74xyLPNTcBNCFIzTt5IU2GdTKpXf3PxOcE8X/PCFCdO/OzfLXvGjG204ss77kwp3RvLIyHH0zrtgbBDOPmHh0L4JKAv304sYlrrLrNwd1Bm+9XTN3penrtq/gG1dczPndfZLZwU+oKbmbn2kEPWKXJtepEG/y1+wmdYfnjK/9RgAmyFvQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNZPR01MB4334.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Tue, 4 Mar
 2025 09:14:41 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 09:14:41 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "jkosina@suse.com" <jkosina@suse.com>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, "bentiss@kernel.org"
	<bentiss@kernel.org>
CC: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: [PATCH 2/2] HID: apple: use switch case to set fn translation table
Thread-Topic: [PATCH 2/2] HID: apple: use switch case to set fn translation
 table
Thread-Index: AQHbjOXcVKESNjxUtk6ggvi9UDhnyA==
Date: Tue, 4 Mar 2025 09:14:41 +0000
Message-ID: <A50C1CF0-B927-4FCF-828F-1F5F79BA3762@live.com>
References: <F4DF8D56-7095-43AE-A788-F10B8CE477B0@live.com>
In-Reply-To: <F4DF8D56-7095-43AE-A788-F10B8CE477B0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PNZPR01MB4334:EE_
x-ms-office365-filtering-correlation-id: b60e406a-743d-4ea3-7dd8-08dd5afcfefe
x-microsoft-antispam:
 BCL:0;ARA:14566002|7092599003|8060799006|19110799003|8062599003|461199028|15080799006|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?bQ2haDayHQnh52v4LpyT9CRnhLIL7yR+j9/OZBp09NMyeY5pDaU1TG/SQKtv?=
 =?us-ascii?Q?bbzIYVEHV571Xp5vdUsU55TxNKzheigJWmbNz+hg0LjJXxoaXYjSlR+RGrrP?=
 =?us-ascii?Q?oTc9u4gU+TKvB1iPdGGVsSa5/LWeIFRxdZTIFZKM3KswZIE+zpoh+pnaHUM2?=
 =?us-ascii?Q?PUI5aAaqdp976bHoL3UDFX+UGIiJNhCpqyO7VDMpsDV8lVzr/N5a0fszZe8I?=
 =?us-ascii?Q?ZQA7HktJ2q9eJV5C+huSixvyITqyD1uAkpLOiwB5gEup0slquK8+VUoN11Kf?=
 =?us-ascii?Q?Vt3jTvVOEu0rLda3GToW6MzGdeiYFbu7fT+a/yq2VXxccN0XsDTlr3E2R2rF?=
 =?us-ascii?Q?HK7tvgp4a7hMdGtgQ5Jc++32/7afgwhk8HeCd0wMkSDn2vNf7N7MTHkr0TYh?=
 =?us-ascii?Q?W4G2edpSUJX0MsE8axKSy2aCWxyK4immej+H0E+/tmWWw9Bgm9Z4UCKYFoxX?=
 =?us-ascii?Q?9O+kiPl+p6Y6uE/QDWFwL/EB1Qk5xuDjnqc/6R2ifOcT7iudrIwocz+KdpUr?=
 =?us-ascii?Q?FLKZmQGX6vFDt/YjWVkNa3plYt+cPT0nJta2l6OktJ5Zw4EOV7rHPkifxD+z?=
 =?us-ascii?Q?62TWescfOUDEd+hYfWq+hNze7ndyJ8+MZLljSRZvl4MuqcyuNrir5WWoEIsg?=
 =?us-ascii?Q?iF3QPt3gGk+++Oir+NV8rF0eM31du4KWMDRpVrN1rcVaMwt+QHW9X3aN5PdN?=
 =?us-ascii?Q?4b2OOiabCCW0yVZBaiWlOSJMkHQ6gYsz1tHJwG9g+vPF9UpLTl1oWOsant6J?=
 =?us-ascii?Q?R7cfM190mmAT54uZozqW7K1YqgsFogvaxbXXnKDE0+vdEqIO+V9LyfvqVTy7?=
 =?us-ascii?Q?t+LX6skRxK/+IjZEWtQzTZSwu9OB+kK2420EX7YKSq/32Qs31oSb3EByayVB?=
 =?us-ascii?Q?ULz0v1AkwoNJAFhAbQy9JUU1Qxjuz+s7GGODsEAb3Y9+XMvRB2qLfMDq51t1?=
 =?us-ascii?Q?c8L/Wav89LexHCRGpS3UYjLal3HSVt+1h6yLHjLdvm/Oqpm3SXZLWXlthd3p?=
 =?us-ascii?Q?cZEY2wOkTNkZMZTJy0NZgif5TomeTv4CEWEom8GZ/n3ql44Oo5Q/LUlYMwfA?=
 =?us-ascii?Q?b3FImHqdBmwtYVE/ayYzAOefQ1S6Xg=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sY8Mt/mPCaJT5d5BEKgpx+LsSlVMPbPAlHVFTIyWn/OQBdL7LhBgomLn2SMZ?=
 =?us-ascii?Q?PKwEwGTQifS7/fUyPmypGhzhe4LOixKTATHgvl5huIclg0A0FFPkb2GFpL4R?=
 =?us-ascii?Q?FN4HAsuMq3/1jtZxxmTvT4KFKOwnakD753BPNncA1ZfMg2FTDIlzCG5mmWjg?=
 =?us-ascii?Q?iF8xdRS7CWt/vnrwThTC5AP3aRnKb/CTGqwedqVf8l9ja27zeYkrqjjyH1rx?=
 =?us-ascii?Q?viyWYhfsbi5+rjDKUD/x56L+k2G0M0TXGuQwm/KFL8DJO/EJl+EN2juTC2Ei?=
 =?us-ascii?Q?Ceh+YDIlO1JbD7HGgLN0N7MFtS0VA5OzfaErgquEPxSAug4Y1SLmPTQGz0kW?=
 =?us-ascii?Q?/pBv/fzDLe/0UGAnNg6w3bDcIBwwnVF52YBNavk6WSWXCyNBEJFGJbNVP6jZ?=
 =?us-ascii?Q?3kmHlJaKytQ9fa4jZXG9VrahxdzcHWPf+jRVpen5WNWRBiB2d7ULtFp7OHWm?=
 =?us-ascii?Q?mC6A6HtgOCFNKc/1FkAClbo571THIKxfE7yZ9tSN7DrxOJZUdu/Y5T3/pS9I?=
 =?us-ascii?Q?V/zWiooNtCCBU8LupK7TVAd6TJ2YDVFV3hDluB8A+akywcrGTarCiiEvUwTy?=
 =?us-ascii?Q?BcPtnipyERqKC6minEjYcg9BmkAZ2t5lZgk9AMaxKWCeAOCrei30pGGyXc5m?=
 =?us-ascii?Q?CbhUsuJeP0S+bP3AWErSvN94XAnmo+xI1FtNkQem+YHNkjB084oJpxaBaAAA?=
 =?us-ascii?Q?R0/QGdegfffrZFnMfu5yHeimonBmDxQoxhXUo6LPJlhSQ8SH+wEhhDxDRcOF?=
 =?us-ascii?Q?5ApCYEJV40nGjuvUZt4+lhGv8aaqBIFzSfaYfIBjFC5C08gQYTiLLqSaK0Kc?=
 =?us-ascii?Q?5T9R6Af7hMs3tKXUgLLDqZTvzlRmj5QkT/jxU8rcPCI/SfUewZITmtHoLGFb?=
 =?us-ascii?Q?VTtGpSOzHfmcHgnPq0pBE2mNquuo8Qd3knfGSbRgLdHJORYzYyZw+6fI9qxb?=
 =?us-ascii?Q?MH/5BzCb5drrPvVSBJf5golSbxJtxJK3c+hEEfQfHnTL7MFXzHKZlMKeS00g?=
 =?us-ascii?Q?n1Z7bPOP74RFTjA2OPw+SIIc5/zRNQDP3Mch2bAoCjNsvPn3RIj1HLZDc7Qv?=
 =?us-ascii?Q?79+T9mbFO9rTi1HwCzX7UCk7VWav/8Tb33nh7Q0/suUUDAH4It4EMAqfJtE5?=
 =?us-ascii?Q?Cc3uIiDwuip6WkmR3CrJ8FMezH1Ldb3i3ghMkFXnW+Z+kr8fcgzOThRpfyis?=
 =?us-ascii?Q?iH8ab25RT7TZAa46yOelg7lzC+8YzXx+r8heWkNlKIPu0I/I1TOigY0x2q4f?=
 =?us-ascii?Q?QUNvhGzOlc7BL9nN6EQGh+C42rFEW8LgNCAbI0MkTpcxG8+dEni1xEpkWXLK?=
 =?us-ascii?Q?VIGWgY+jvmr9UYZzCJv+W4FP?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6B3D1ADE66DE5F40969096F0AD749FF5@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b60e406a-743d-4ea3-7dd8-08dd5afcfefe
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2025 09:14:41.2502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNZPR01MB4334

From: Aditya Garg <gargaditya08@live.com>

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
index 6fa4941b6..fba0bb68b 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -459,42 +459,51 @@ static int hidinput_apple_event(struct hid_device *hi=
d, struct input_dev *input,
 		asc->fn_on =3D !!value;
=20
 	if (real_fnmode) {
-		if (hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_JIS ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO ||
-		    hid->product =3D=3D USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS)
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
 			table =3D magic_keyboard_alu_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2015:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2015:
 			table =3D magic_keyboard_2015_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_202=
1 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021)
+			break;
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_2024:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_FINGERPRINT_2021:
+		case USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_NUMPAD_2021:
 			table =3D apple2021_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213)
-				table =3D macbookpro_no_esc_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223 ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F)
-				table =3D macbookpro_dedicated_esc_fn_keys;
-		else if (hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K ||
-			 hid->product =3D=3D USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K)
-				table =3D apple_fn_keys;
-		else if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
-				hid->product <=3D USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
-			table =3D macbookair_fn_keys;
-		else if (hid->product < 0x21d || hid->product >=3D 0x300)
-			table =3D powerbook_fn_keys;
-		else
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J132:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J213:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J680:
+			table =3D macbookpro_no_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J152F:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J214K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J223:
+			table =3D macbookpro_dedicated_esc_fn_keys;
+			break;
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J140K:
+		case USB_DEVICE_ID_APPLE_WELLSPRINGT2_J230K:
 			table =3D apple_fn_keys;
+			break;
+		default:
+			if (hid->product >=3D USB_DEVICE_ID_APPLE_WELLSPRING4_ANSI &&
+			    hid->product <=3D USB_DEVICE_ID_APPLE_WELLSPRING4A_JIS)
+				table =3D macbookair_fn_keys;
+			else if (hid->product < 0x21d || hid->product >=3D 0x300)
+				table =3D powerbook_fn_keys;
+			else
+				table =3D apple_fn_keys;
+		}
=20
 		trans =3D apple_find_translation(table, code);
=20
--=20
2.43.0


