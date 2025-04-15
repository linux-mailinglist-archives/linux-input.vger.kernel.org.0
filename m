Return-Path: <linux-input+bounces-11792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD38A8A3BA
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 18:11:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F335442C10
	for <lists+linux-input@lfdr.de>; Tue, 15 Apr 2025 16:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B1821507F;
	Tue, 15 Apr 2025 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="SUVXBIzh"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010004.outbound.protection.outlook.com [52.103.68.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3F20AF9C;
	Tue, 15 Apr 2025 16:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733479; cv=fail; b=gfVN0EeRWy/JI04Gr0gKny6jOPEfaekYzxR5Ms+M9drzXI4mo2O5JdzmfjMcgrnY4CPodU8qsmhyalRmPi2dxJEfh/HcqdaZK9qxpfY6Rk9/jJ3W7/yPhPgi6nSjtJacsHzU/cUvKtKbCgwuezxwVLlVze31RaTfnF8TFMcOo7Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733479; c=relaxed/simple;
	bh=c/bcsGI9ArnTHe7C+Vm8OXHJovLxz3b8AsVksQH9hN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=de/6KxwZBS8BAwnSy5pwNBjVxuFrlbmIifiXUwCU8w8BJpI7iCG7GpBhbS/NFqoaxtBgU2mMR9WsKcAOUVeIr//kAgWGhEDKLfUR/nkKu/lGF70cy6Aai5zHhC5ckwht0/1LSITE97FhqEDWKGekbBUKlaa63tTJIxgUye4heZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=SUVXBIzh; arc=fail smtp.client-ip=52.103.68.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nejtUL+/x2/UXBXUT5KjpRGiyZPL9n26gkyQWHeq6C9K+cMWHl4uHc21YCGikbolGS1mnC1M5r/NePhaGeGqmLcLgPuw47Rlwzg0DqMsPw4b3KRS0EzDlQA0a2xrDPJlOXmoDlG/UT9/7LdKAxPVDcxo6CGJhNLXcmJif5S8jMPUgcZ0pMaOy5PdIhnFPRykL+VlzTxBYciZ5WozU+guBTZ/t1LCq/piRY3T+rkLgklBY7CLqgPUVoJUZ7+bY1lf2eRRPYZmZdM91CtuUzX50YLKptbk5Xw5ITD1VWDCYaFYpl88bjdF3icHiAf415TbEV8pW5lTBxVIfzs95/NFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qKaoUC+npZBwdQDavG4lgYj3cE4/HDK0k6zFpEGAtMk=;
 b=eLXPAV3wroEO8f2KAd9FQMs6EdfcHPsRt1dPEH0OcIJDP6JTr/ic3FXBNePaeHhFTqD1/srfLOb57jhlZMpd+COGKsOD8zqzAAg/BhHkLPOpQD5frbQRnhjFne1i5KWCWLyXF+A70HqN3psvYARR1mqTggTBdMEpqk8q1EQAo8hNdk0chFpCSYdyyLiFzS1zanOMPkDDrurMOQHe5PARlFO3SkYjcYx/s3REmHYWfScYxAGqSDQWNcFBUAS7806gAZ9y5Noc44cFG/bTgNXd88tR+36tC15Q4R1uI3T1WxltjbfGuVYSxtjH6t1oGx4VPASPLgkXsd5PJgVVYivLxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKaoUC+npZBwdQDavG4lgYj3cE4/HDK0k6zFpEGAtMk=;
 b=SUVXBIzhPnZsDvJQUGYdgD0lv+z626Ox77s9WdjWB4cnzRTnmCqDWfCOxdCljc/5pYfa/pTBfbtnGVLNXMoKp6AlPzZf6VrZAE+Fj05MLI3ITZVVxXNyjRQwFIbh0CJOzr8OF6InLQ6QNgrUJQKJdShtR7LOjuhXjBkznVvcHqfbzwm4s9I26WWNaVui/Vivf5oVVPCOS3LR6qu4nSXGCo6KlsgeSHCQLrCCC/DSFIO0sRIAKMB5oQPaIO924P7SHQWQBCes5fNrfEpoKKDd9fBBk4STxZ01M5PbXd+iZYw7T2RENHd8ttBJT8Yk/T92nfJYE2RkMB4FUSeflMZuaw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB9735.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:12d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 16:11:12 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 16:11:12 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, Jiri Kosina <jkosina@suse.com>, Benjamin
 Tissoires <benjamin.tissoires@redhat.com>, Benjamin Tissoires
	<bentiss@kernel.org>
CC: Grigorii Sokolik <g.sokol99@g-sokol.info>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org"
	<linux-input@vger.kernel.org>
Subject: [PATCH RESEND v5 2/5] HID: apple: use switch case to set fn
 translation table
Thread-Topic: [PATCH RESEND v5 2/5] HID: apple: use switch case to set fn
 translation table
Thread-Index: AQHbriEB+AGfGzOpvUKanNrSD/PNdA==
Date: Tue, 15 Apr 2025 16:11:11 +0000
Message-ID: <A91EB61C-39E5-4FCC-B16F-EDC51872A968@live.com>
References: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
In-Reply-To: <7EB9780A-026A-405E-AC07-DD33C11E7EE5@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB9735:EE_
x-ms-office365-filtering-correlation-id: dacb88a2-4dcf-4925-84fb-08dd7c3823d8
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8062599003|8060799006|19110799003|15080799006|7092599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6s9ylx64SSlQJbE9Cl4Gziocrf0WRneYAwzqqidbx14W5dgYZ4ax5b7UBcJV?=
 =?us-ascii?Q?k2J7Y8ktn1LCnsBU72evMhCvLl8bohV/+sHekh1bE5WXZ+1p/TlXQ3h7Rl7e?=
 =?us-ascii?Q?ceMJrlIdaI6x1ZJvnMpE/Hfg/HcghT7lhR7yLiPOysm9rrGurp+h2SUsnpw0?=
 =?us-ascii?Q?05pSnPVajfsVG2RN/vVCCjf8CuY/V6NqXH5YF7HalyHYvyFudL6r38KnlEyZ?=
 =?us-ascii?Q?GTvJjEn4M6EFIG6o+2EOLnFJcqsCNl7jHOf7uI2rYwElscbvicQP0lzmMBh9?=
 =?us-ascii?Q?GqlM4cIP9+OncmgVSqk3z/c9dbWCVe00KBu0sAu6inUU4kCTXGnVRJM/R/K9?=
 =?us-ascii?Q?jhCHl8isvXdGLI+1BC/6MAd9UITzKTEpKWqaxORDszVU499xmTd6JZoMwnlt?=
 =?us-ascii?Q?jYztzQJ8PDUlpBshzjPJ/JI9ISZ/8WDJldJhl4PjRPH3ccKvZ0qWTzEgfZEw?=
 =?us-ascii?Q?ob7C/Sc12P96h6b3WmRtS4hAJq89d8sMEd25jFW5NcC4f08mpjrrQsBFaHlT?=
 =?us-ascii?Q?4M+gL+3pr3XV+B6nVNS1J+MhFyv3/gahgA0z90AA1WPz5Qtbuc1SKC56rpT4?=
 =?us-ascii?Q?5AqExk+5x4Pwji2lsWfjD7n2PS6Q92azcHmQkWzqP3MQWQwV826chlLUDWwi?=
 =?us-ascii?Q?52qnViej7vxh0n0ujaghdf6SMxpTALXeXbWsIDEAGqHsXo8HXEdkUIjjGibp?=
 =?us-ascii?Q?sRqeJL97/iQAJf90IKGGtoeb4mAa2R9CC/FG9Dy44oPVwQ7BAMBlMTPyCaET?=
 =?us-ascii?Q?rw0kZGmRmg83K1EmptWTd0QpRU7JCktjZP4BLp0UX2kWBbW0n6oHYvTSzxgo?=
 =?us-ascii?Q?sPHi7PqbHzUUtiNkv+koZQCa36kwLIXf1rkBkFJOP6+imMPEChstV9Y0zmIk?=
 =?us-ascii?Q?ivASSWJ6fcV6EuSHiAxGI9J3bYaFuK7j6EO4L3EDvxqbXH/cHqe12LYsI5GI?=
 =?us-ascii?Q?lwKg9QXEQmUUzeOvNF19s66kVKSqxWdnUs0rQdoPvycA0SrzzqxZw/GKNMDf?=
 =?us-ascii?Q?HPmkNBfNS8EQVKuzZudAGilQTXgC6/uCkY1IH6koV+o1UEI4phMsvKSeaS36?=
 =?us-ascii?Q?Dq4SfVhFS6KEo7hiYVKR9LXhmjhFj0hLgRIVenkqnF66B+brawY=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+2mWsE9sumB+q8pfDWyYM5xNioguAquSz0NLYnKv6HHOuTsLJNFDio1EfnXy?=
 =?us-ascii?Q?bdIcZBJSawF9hBKLhbLpcZTrdxEhHY7SIZf8tkYDFnVzvpPUiyukqr0/y0R7?=
 =?us-ascii?Q?T3I1110I6h3zRns7uiKkdMq3ppye7A7z7zwGPdOfVPeG9V6YlfVqxWvQ/2Q0?=
 =?us-ascii?Q?7zlT5UW++PQnS/osuSZyT0XqyCBbVCJQpt07xMFp3E3nrwiNu3gLl2UddbKr?=
 =?us-ascii?Q?qV0jXdVUfFwynzN7lHT3JlCvMW3GSRxfRFnd0p8IUkY85cLcn0F8bPGCGwLU?=
 =?us-ascii?Q?E8paS7lnkZuFIOg1fC+DBk2Ylk5YQFp+yLAm8q/e7kylORgUubFTw55V8uEO?=
 =?us-ascii?Q?SPAf/JTKr04Z4vsqVl3MKllWJx4GlnbB9jRi4shFksBm+30fLxd/c30+VBS/?=
 =?us-ascii?Q?eVzTnSZCHWnjEVaaPkyuxyh35P09oCaXeOkVj87ntox1ZRtFI6SNAkXUDcrc?=
 =?us-ascii?Q?6Y6wYX9pnY9HkLuCLuWOOrbqllDYC8C4/J4KKPRnrSbg24+XQA+PraOWZkT8?=
 =?us-ascii?Q?O3L96tYevfnLITUfQv6M3G3/IbJf0ks25JcDAW+y+D3gyGyMfYk69jI/Ygu7?=
 =?us-ascii?Q?4HD73TLmK7ROuC79ciKGyV/ULAUcwfjOUs5qGuoHpxLKD4JyKkluy4cME3Pv?=
 =?us-ascii?Q?HUPQGLZDWmznWXde+gq7yXTjgKqUeJY1rc1aPADh5XRa/3B3ZSnVIDOEKJCa?=
 =?us-ascii?Q?ZW1E6uFOwOPvxrYGmOeGhBv5LoBF/NwSSeZree9jFhe7H25GMVh7cxTduYQ3?=
 =?us-ascii?Q?hG9Vqak8zCAKYWmIsga6MSi+QhOGyJNntMtqpy3kuoK0lZc7UZQgrRTWqYMk?=
 =?us-ascii?Q?BZB8to5raU4NV21mK59f41w9GKepSwjk5G1AkoE8+y5xcCZT1X8625zUVY/0?=
 =?us-ascii?Q?Oipm1A99CEeF+rMowSDeZY20Tp6fkyCqPTB7XULp332/hCKPlNWH/PhZci/5?=
 =?us-ascii?Q?3pY9rbWr1H1v3auykxNPyUkV3Y+pd02an41f2cl+Wjoa/pAW5d/kOFKoXo8b?=
 =?us-ascii?Q?+vN7o3NOp2gwZIGYb3EAm+r3hdy992N1sokOHxWIg4i/J/ki1rTR09HX/vWI?=
 =?us-ascii?Q?B3HsA4e21HEyCNBwe9HtwBdiKReEhEPbIDexrOvzmaUJ6XhHnBelSDXiLvfm?=
 =?us-ascii?Q?wWdGCqrvs7MbS8kL/ylY93ofNqP0JgUjIw/1nMr7ICvBz0/ovNMkaN0Oev6I?=
 =?us-ascii?Q?otE7JRTBxsL6YrJybV3Dn70xaoNc4+Gi1hdk41G6FJDVlUk9TmOl6yAhgh7J?=
 =?us-ascii?Q?t4VE19PbB6l+SstK26v+yPbKUj6SLLZ6V2VAHdDwYTZ6/Z51RU6Urv6RdrYB?=
 =?us-ascii?Q?9zAWjcLAZ6I75czSHWMJMeNl?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F98414D3C8422E4B9B4FB65F0D21D0FA@INDPRD01.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dacb88a2-4dcf-4925-84fb-08dd7c3823d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2025 16:11:11.7406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9735

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
index 93b990603..3d7befe0a 100644
--- a/drivers/hid/hid-apple.c
+++ b/drivers/hid/hid-apple.c
@@ -465,42 +465,51 @@ static int hidinput_apple_event(struct hid_device *hi=
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
2.49.0


