Return-Path: <linux-input+bounces-11890-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F65A95181
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 15:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D65C7172474
	for <lists+linux-input@lfdr.de>; Mon, 21 Apr 2025 13:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08310265CBD;
	Mon, 21 Apr 2025 13:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="NF0Kmj6O"
X-Original-To: linux-input@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19010001.outbound.protection.outlook.com [52.103.68.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C13526560A;
	Mon, 21 Apr 2025 13:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241712; cv=fail; b=PkFw62Q+OknQyPd84XiD75NgZRUtKO1n7KRktfS3JmtK3lx5QWkhpPuVbtbMvPJ3sjIxTM5/BSA32JXlvwPtwswr4VeEKI9jpGPmbgWa3Tv0jmBsircYCybhCJqMH734BxAb9Wk6u5Yar/PiN6RM+G9Yqs437wE4Ag3vNP5HJWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241712; c=relaxed/simple;
	bh=AABUJV60jkoyk9pf4/HftEI1WuCcagwn1KgS4S9M+Ec=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc:
	 Content-Type:MIME-Version; b=PpucNgDpMr4S0wJS5+nxiFGaz8VhAYRpZw2bcAb6TGJTpKJeJrltfTa4s4J5olcPWHO/ttW3AliyTuri+arfPZr82WDKQIXB84ccnDALMuwikhpPuctogkN5/1JJ60uwsY668DAovObcYtWd3jXpEqHS2zQMUfavP3mAfzZC6Vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=NF0Kmj6O; arc=fail smtp.client-ip=52.103.68.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbCimB5JzbPbQ9TBPv3SodtWuS+VZIpWx8kGeXVFt7wJkqdPyBsyJRlwcQ0nw39dbxY8Q87UAWvr5pCcSs+W9JSSNH0nZ89WlLzcjX4vXJOFv69I01LWtzCu66UljRGeLdYZ+p2Nz5mDZOtRMmsIYWBrPAY6qri5EE/F9fV4DnqshZb9K/PvtXsWuJRoLEKGDfF2HxbK6N0w5SGFgkPIT2e9qUbBiJHwNp1OZfbjzuCurT/YJ+bU2fw7Yo6ZX8VFSsXhG6zCGD4bTd5PCk4MT9CABC3O9+11zTka9p0d3QXT3n/L+cts5262Sfd/st40Um8L1zyI1tNOfERTGQOE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYHWEs+E0rUU0Aaji7IOwn3khWFDU08OfBnWr8FMw+E=;
 b=egS3fCihH7icXbqpsSyk4t3VeS+qZ+uPsbVfqdaggsxgNv4JJeYzBcRM5e6HwqMfbYjDGRLGzcDSVoPHSxEShJtrblthzmGG+nwT2MUqfYYWcKDQFN7jDfc50MDoH92HrgWIBr+/K9l1jC9RNen/9Tl55oAmn7bVTvnIuIJTbOhE8I+vG9xSMbXM4PjXk9NaLx+Yzk1/cfsvwMEk1qU9n4f9UfNKcvXsWCdAxFefEEe4ddy1sFgCfIUtQg/5wylSwTHimUx8B3WvlBtvYPfxf3En0DWmxsWroXj74q3rVvvqAtoadImEVVCpOhBcgsv0ciJ7BnJlhOSVR4UDWpCRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYHWEs+E0rUU0Aaji7IOwn3khWFDU08OfBnWr8FMw+E=;
 b=NF0Kmj6ObLCAsy5BaFyUThO/2xctsO4ZzxVYImagY2ROan2+jMVlyaqvb3enbyMp8ZANhE+HElLxe7PoZTOqKXylLjazBdoa6EWLii94PByftHbBGoZCVwRea2Wg92W67Lbktqkl2cZxGl4zUZWjx53Nslo46KCGK5JOqb10T3m7K6Ee4NhtMAfNILHePGPWvoZ+fCPqrXpweZQZROTSlsbCkPurQ/aSHDpw3ivuv1lfunB7F2OhxLoCgHcIq39KVMhcEs+y5n/08jpUhRo3fTbzdBjRn1ApHp9MkF7OAmTQN9Yd1Uk6OJmaqj8Qopz8iaHgpDFKdowI7HoPkWXhKw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PNXPR01MB7289.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 13:21:45 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 13:21:45 +0000
Message-ID:
 <PN3PR01MB95979FB4085AEE53F7134334B8B82@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
References: <ignoring system configuration file /usr/local/etc/msmtprc: No such file or directory
From: Aditya Garg <gargaditya08@live.com>
Date: Tue, 25 Mar 2025 17:57:24 +0000
Subject: [PATCH RESEND v2 1/5] HID: multitouch: Get the contact ID from
 HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
To: Jiri Kosina <jikos@kernel.org>,
    Jiri Kosina <jkosina@suse.com>,
    Benjamin Tissoires <bentiss@kernel.org>,
    Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Kerem Karabay <kekrby@gmail.com>,
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
    linux-input@vger.kernel.org
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::13) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <4a79a85fe0bc981251d0f49252731a7a8375c25c.1745241627.git.gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PNXPR01MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: d143e4b1-ff66-40e1-6a2e-08dd80d776c7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|7092599003|461199028|15080799006|5072599009|41001999003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J/Yp1esU5vYxcVxqL3i2+aXTSAKQ7DQMEaNFe6BZUw+6pNiZGX0/9J79pTMb?=
 =?us-ascii?Q?OkugIwAwPfNyuCK+SUrICSaIOAjbnnujXq1Fmowmr0RHsj4Or2At2XkeIUri?=
 =?us-ascii?Q?0Yw2pYVdm/XUTjLrxZPpF1q0Hifd7K8m01cpN64+rAntQF7E6uMivMI1Ro4L?=
 =?us-ascii?Q?36OWTuWKwEUvYxK6gPM93JpFXJ8P0yYg+quPc4TCZILByFqn3qwe6DveUoiJ?=
 =?us-ascii?Q?+sHAte8Y4f2IjzfAcx3qZ5NqAQ6awHoREL/AaBAMd+bJvHlYCSo5NJ1hf2E8?=
 =?us-ascii?Q?ACToFP2TgzaPfFJw5IOUEQ3AZ5H/SQ/WFx7EVOH2Xqo7QP5JiyB3DzlkoIUQ?=
 =?us-ascii?Q?//mrWsvohURGvelBrVg6eEUuBJDOqodHulCdYPY4IiSVob+mh1CPJhFl/YTf?=
 =?us-ascii?Q?XpBlyILlOPnWvoqB+1luEjFqoSbihz406nojJ3PwLH4vlclnvuA49tVb5W8n?=
 =?us-ascii?Q?X4NDhsinDmNMO1psOnOrnIIp2dUleV4vA8pNZHApwp8tkX92FrHEHcSccQmO?=
 =?us-ascii?Q?7dlM0N0ayw+PUxliEIhp9lxsVuy1wc5boopZAkO3Pto/Fkp8IB5INmAGDUf+?=
 =?us-ascii?Q?GlDYuwidwS30EkvB9ijorJ3BaZbLhhRzkpgNkSXGUCTwFiUM+D6jQ8mqCeqD?=
 =?us-ascii?Q?tTwEMV4LoRsU3hR5E7zFIRgYLCwe5ZXRR7T1Ip3J8RIy0KlB+gYaycAW8OOO?=
 =?us-ascii?Q?la1MfE650mZ4ClgB7oESPu98xfjRWsJ9Sc+xSW/FBNmFUi0dNCiDE3LA1lvw?=
 =?us-ascii?Q?cv4qO3r2mhzNxynyXC5ZdgX+AssiyXsOnmbQrNVoJvsOrtRF40wpMUj3xmWu?=
 =?us-ascii?Q?RKAO0pY1XIByfXkB7QkLVqrg+pwF15Zoou5RbwjwenDa7LNOWofnw69JwnhO?=
 =?us-ascii?Q?krs6iT5aqQHhnidpYW2ZXUzAhCDPLHTL3ZImmrzLKoWysiBga8gAvl+PVF2e?=
 =?us-ascii?Q?seQgmBciVIvQjLl7j5Bka5UY6+BxPJMHmV2H51HxCJ1D1+dIUYLKAzIb4fME?=
 =?us-ascii?Q?71eAeS/wXQMIPhkchknx1WwoHpAtjeJ7shmvf47S5dnz0QAoTo8IdPU6eQ5m?=
 =?us-ascii?Q?pNpjSx4E6HFgRJQQOMXYXHTKDuG4MO2OgSzb09Z3C073bJs2LBhY3JR8w/MT?=
 =?us-ascii?Q?FN+8ia5PGhbUfqe2rzUERtl9zyuCl41Wcg=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GwgRGIYmlVupujfm6eV7D1qFugWqfJaWgo7RXp38wsbUhbapmNNvrwPe2Ddo?=
 =?us-ascii?Q?OelWYEFOatlTKWdfggJsZaWr2TR/SEJ5JKdonKatRGNomd3nXHwNcligsuDm?=
 =?us-ascii?Q?UZb0W0e4tp2mbx4TGbPyo1sKa+aHza5nFkLEtzNl8zTvDkdzlAPsKsPtGOSs?=
 =?us-ascii?Q?BTAN+jG4j5qVUo/L4sKFbuCoGHHUlFlmmYDM26VmGaUF5ZsYCGp8Rr8wueZF?=
 =?us-ascii?Q?v16Hl++Q5FBWVh7Ix5VBUWXbgIojFffK5ah2kGl4E1/sfnIzuz4exMx3SL7z?=
 =?us-ascii?Q?zL26x/EFz0eBa80y1Y4wouK+rSnEfzU4mx777lmdC6qM6SyttFDz9GNRo67N?=
 =?us-ascii?Q?PtKIiTtoRKbQPKndusuzZzCrvi4hmFJ/UDQHjMvGx2BhftXrkPqsILqNnQ7K?=
 =?us-ascii?Q?dr5C4RBG2rrpxCml+CucQN5xbc3EyTdTMpQs0DD0dy4N7lNRUY5dmm1YtuWB?=
 =?us-ascii?Q?arPP6RhmNuIRWX2tqqrWARMJAOTFxGAhaZc7wE4+qGnNYf9X7P+sXcZCtSTM?=
 =?us-ascii?Q?Bq3wrSA4CF3k9S0xcwoFnPutGn8k0sOCsGRjqNmklugaL1hO4S9xrLMgb6E/?=
 =?us-ascii?Q?mIogRgqF8y1YACcuVIXoELHTusthkvQrKSVvWW+u8Zcdj7WoPZ0nrJZuRj9R?=
 =?us-ascii?Q?P1J1bZiaxZTsjdNvCFiik9fg12Qkekj9nSdddxeAosQwFuewIVIsiXm4tg4e?=
 =?us-ascii?Q?hjBBj+0lToHmJheuxpmyiDfxqdjzhi6zPlwQBcLU3WSndXiCmYs1NKCo8uUS?=
 =?us-ascii?Q?3DM8xzO5MNrowm60gdCck0EukuRFaq37sJ/VXa9YffLyx3rdOv3i19ZFdP5y?=
 =?us-ascii?Q?ykaxtCAXRJU5UuULk55MXmTw1EeO4ch45F8+GMBrF2aFOXcRah4T85ZTddGL?=
 =?us-ascii?Q?z2+rmChCK66yYEz0OYruYcUwQRguVb6aeSfyMlZ7RpeMfABaWXoG+LTCxxUq?=
 =?us-ascii?Q?141wpmLx9TqRKBl/IkZjUGCBdx2wmt72hD/N7loZv9GsE8PT+XVcf3kGvRS+?=
 =?us-ascii?Q?0zPTtmuXXQpNSKpzofp1r8EWJMWR3Pjpjz90qsAuRjLX1VLQRoTHZ7Itlrpw?=
 =?us-ascii?Q?jT5mTt1AEtFQicxIMeFUgOh5ycyI2bI77Ooxh64CuQxleMixJFlneVcwg/15?=
 =?us-ascii?Q?xsEVE/4oGKMH8XY+0ypQLmiwO6XNQAbMt0y552DR8zmaHy+Ez53TM7klWxFH?=
 =?us-ascii?Q?V06BTEyHe+iJflcB6+C4i1lrduseolXwbDUAwxehgaiMy1qauxUkoTse/Cg?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: d143e4b1-ff66-40e1-6a2e-08dd80d776c7
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 13:21:45.7663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXPR01MB7289

From: Kerem Karabay <kekrby@gmail.com>

In Apple Touch Bar, the contact ID is contained in fields with the
HID_DG_TRANSDUCER_INDEX usage rather than HID_DG_CONTACTID, thus differing
from the HID spec. Add a quirk for the same.

Acked-by: Benjamin Tissoires <bentiss@kernel.org>
Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Co-developed-by: Aditya Garg <gargaditya08@live.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-multitouch.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index e50887a6d..6e7f34a47 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -73,6 +73,7 @@ MODULE_LICENSE("GPL");
 #define MT_QUIRK_FORCE_MULTI_INPUT	BIT(20)
 #define MT_QUIRK_DISABLE_WAKEUP		BIT(21)
 #define MT_QUIRK_ORIENTATION_INVERT	BIT(22)
+#define MT_QUIRK_APPLE_TOUCHBAR		BIT(23)
 
 #define MT_INPUTMODE_TOUCHSCREEN	0x02
 #define MT_INPUTMODE_TOUCHPAD		0x03
@@ -625,6 +626,7 @@ static struct mt_application *mt_find_application(struct mt_device *td,
 static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 						      struct hid_report *report)
 {
+	struct mt_class *cls = &td->mtclass;
 	struct mt_report_data *rdata;
 	struct hid_field *field;
 	int r, n;
@@ -649,7 +651,11 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
 
 		if (field->logical == HID_DG_FINGER || td->hdev->group != HID_GROUP_MULTITOUCH_WIN_8) {
 			for (n = 0; n < field->report_count; n++) {
-				if (field->usage[n].hid == HID_DG_CONTACTID) {
+				unsigned int hid = field->usage[n].hid;
+
+				if (hid == HID_DG_CONTACTID ||
+				   (cls->quirks & MT_QUIRK_APPLE_TOUCHBAR &&
+				   hid == HID_DG_TRANSDUCER_INDEX)) {
 					rdata->is_mt_collection = true;
 					break;
 				}
@@ -827,6 +833,14 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
 						     EV_KEY, BTN_TOUCH);
 			MT_STORE_FIELD(tip_state);
 			return 1;
+		case HID_DG_TRANSDUCER_INDEX:
+			/*
+			 * Contact ID in case of Apple Touch Bars is contained
+			 * in fields with HID_DG_TRANSDUCER_INDEX usage.
+			 */
+			if (!(cls->quirks & MT_QUIRK_APPLE_TOUCHBAR))
+				return 0;
+			fallthrough;
 		case HID_DG_CONTACTID:
 			MT_STORE_FIELD(contactid);
 			app->touches_by_report++;
-- 
2.49.0


