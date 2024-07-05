Return-Path: <linux-input+bounces-4871-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2909287A7
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 13:18:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97EB91C21E3F
	for <lists+linux-input@lfdr.de>; Fri,  5 Jul 2024 11:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3A3E148844;
	Fri,  5 Jul 2024 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="j25ZAqmD"
X-Original-To: linux-input@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2067.outbound.protection.outlook.com [40.92.103.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154381487FE;
	Fri,  5 Jul 2024 11:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720178270; cv=fail; b=MdffoqSTIBkOkBUVH2vxc9PRyHMQc6Q6gL6FKIRjINgt+koz15421QqcRwOASSdjoqq0G+nUiQbQ8trYd8pACjSSD7gAvWVNTmYHFbR9y2U126c5iUaS5lzTj4N4gmYqNjam/E6rDkTfmowlVwFyDqg7Rw4e/gc6fqMq6HzeecQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720178270; c=relaxed/simple;
	bh=MKNHh0/+fBoXEgLap/b3GUxbtESwyLKtEKV37XNKYZI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Aw0HxnhcOUq1QZGILQbw/zHhBsZJleAtlV19kVHhBObfR+dF53QLtNX1JiZ54zPVcu8LLnGz7RsW2zM34Rzk4vLIuNX830esxt1d0hvSWtDHOo3HWs5MFjYlwl1691Cp1uzDEGj8iQtaIhXui3yeKEsBx/BuI8lm85301N7K2ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=j25ZAqmD; arc=fail smtp.client-ip=40.92.103.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCuvI2tv0IqAnGCYrFggwlO76YW6hWyAQl5ONqowFnCAMhrFku8mBpL7HgZzZjrt36coBB8Xa+tuBH5J1KCVhfk/spM1z/BaQXQkVqS09nnR5t5k03krT4CtkNONLaihq+Dz1dId7oeP9RLHtNsSOdwtdVXNQqog1qzQlhkfy+p6puXmIPbPTBZiW9UttLk4Ie4GlglJc7guP3sG82phXGcx3S9bTq08q76dUMorREVWR95DeFXKzAWLGMkLYfcfaL5TJb8OB2yF064gUNj3RFaMf1HMSYi34Y+4jhlv8SLc5R8lNHP0qXWVz8efq0LYyF4nds/E0mXRwU8XMtko1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=88AnSyO7W4Dz8Ljjwv5/j9uUHNWkfxU117bogXdV4Wg=;
 b=Xrb91pgZd8hIF5E8+o13d8CKYFVOP1pcSHgyEVuK8r9F/9gCVSWiewfUMPW48kkYAOAtdB2w5STF70FOew7rINxvTuJtgUDOCNMtJ4MJ5dMaHkdKf1odeFKQoh2UL9baTf+XjqNdXBqUD6Ccn6nemgFSLwVqAp5+j0FK+lcYTPZGqzK5rHCKMXRrM8AcJQLN6y9lCCQDBDPg0Lvz4FLTOFuzeoKh16jwo5LWn16v9MRFi+VzYcN1CbFPmU3cw1aI/mb34cPlSRm6BFRvKZdLcIFLH3XmqJ6ddk6QZ+J7J4yEBhZKk+iQYzI+GZ2zd5N8uf5w2asIZ+tadhzDhkPT7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=88AnSyO7W4Dz8Ljjwv5/j9uUHNWkfxU117bogXdV4Wg=;
 b=j25ZAqmDZafvuIxm/p/3WodAT9lJTKpKbaXq3hkqEl/2xfnDDNZGa1gWZVOLHcgwrcsTrdibsMvYe/z9Fjbn4U1RJ8tEiL0pwJn04s3wDKZVHppcbEWMEPFRqXKwIrBTvT4h1UiDMQ/KtwMuNINglBuOwUci5lRgMzB/vk2Ms7syVw9gafcZVDPy+pYR5+jmEZjy9YxQgrsouU3aa8zZZUvvSGkYYAbo0VYqvnSBXRHoWDdsfCwCqiFOjgwfRQe8VjTNkrqPgu2qcZRdsXlGJbvqxKqqCinedMlVYjepE8YO2BY+dQqaFjt0LW7SgfYDoVFLn8BYgOrd6AW/mEG49w==
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b3::9) by
 PN0P287MB0296.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:e7::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.31; Fri, 5 Jul 2024 11:17:42 +0000
Received: from MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a]) by MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
 ([fe80::98d2:3610:b33c:435a%4]) with mapi id 15.20.7741.027; Fri, 5 Jul 2024
 11:17:42 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>
CC: "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Orlando Chamberlain
	<orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>
Subject: [PATCH] HID: core: add helper for finding a field with a certain
 usage
Thread-Topic: [PATCH] HID: core: add helper for finding a field with a certain
 usage
Thread-Index: AQHazsz08zSvbznbdE+K+1fERfm8Mg==
Date: Fri, 5 Jul 2024 11:17:42 +0000
Message-ID: <3EA8F21F-2C0A-49DB-BD23-224CE9D65A0D@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [XjrJ3QoFAkSGBLwf8JbMC1/d6bXhMoLYadQTJADvgLCU/RLhtta06L5uOKDCs403]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA0P287MB0217:EE_|PN0P287MB0296:EE_
x-ms-office365-filtering-correlation-id: 0b4e9fc5-b631-4141-9847-08dc9ce416a3
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|8060799006|19110799003|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 a89g9b6zK81OBBznZqlvhyJNfunWeDg4ApT4vkZOb4+sxB0+6ZwzLy2dTLJaM1n6op8n8iQpJil94e8G9SyD70sXAONiZUW/pFeWtwn29n0ZM09VvArU0DdEsGumx+PJZ7HMjTqCV6g/eY+NShbqf4wrIxzd4/H74dQ9qnGLEGR6VkyySOego0v8n5v3gmixYOzihdyVMzZlEZn49kpSWUH0N+rjhH66AmERfRZS1yC4NAJDWlZN6UZfewKHQreoUjfxIwMH0JmJBQF/V8fCu+LTPRopFOtg23wYzRPWzFVv3tAqY8yLqvNvGioBJ2ZMm7QWNhQZKwpsSUZBYJIK1UJ0fXsG4qNBAKGr5f5ds1S78iBRPiaSbxo7EWzQmY/fp24YjsuXAr/pv0TFbsOsd4dZwxzBbtg1N6nDgpSV9zxWn9zuj2Weo8qDIS2ZOi1mgpSoHQIb4R2POGQ1dv9oAWYXnBgWe/gkWbU0vXY0uT7Kr/nz4coilzrKpsnR9cY2yBubqDSKZWG9Dgjc8aATZ3psQGS8vI2XL6v3NgmDpxJpIY8QBYAZNKZm5y5RlwjcjAyEzNNI30sgnWW06IcJAYV/KUXODXSbsqzsnXmzOmd8iqy+8QHaLa7tXjxr4jpdHZLgM10wZXDD3o43vdPVJg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WeGyp0Cti6lHLn+uU5NPbVqf3zUDcjfXlngBceM0C6Seq/xSK5E6bgCOVheF?=
 =?us-ascii?Q?Y+fiJ38PGBmVExoNHulszGnFRKQb8N/UXiUegxth/jeZF7c3co880G2QIwwp?=
 =?us-ascii?Q?daucSXmJjPAwxQH+Ge/SbQ8Tb0Jjm7A3LtL9fDGleO+xC1/tenPcVLHjvuAa?=
 =?us-ascii?Q?Kgve5EKkd6Jh6739ch40QBIA97JP10nG2k8AZPUzizc7oMbc2ZB3SoB8b6tk?=
 =?us-ascii?Q?wuLtmTI2kzL2pwWcRrpZBy/P6h0QVriG+nsDuEKS9+pPBgSr8Fz03qp3+ozJ?=
 =?us-ascii?Q?for1IM8h5lfhdMVUgOXIhUKiYtAXbkKmlv09D+Quyk6P3d+GbiXUCB0wBiLD?=
 =?us-ascii?Q?Jv7+xzYdbVNLH8dsJIFboxHb/hmNC8tMfPCwbCtNSCvHttrv4uZZ+DcEkpek?=
 =?us-ascii?Q?1rQE9D9HPWh+FibZkrZpWLo0lmyrI7+RBH4e6oOYHcaXIPNFy6EigQ1So/Mj?=
 =?us-ascii?Q?2o6O5XFIcf5L8vfA5/ELtIvrkgPaBeQ5Q9DNBEseyiLQH+4A4hqkWxqDMqIV?=
 =?us-ascii?Q?mlgnfRzjqC0HOauFhsLHRnOt0+Q27U5Bk95yl/iIuKBvmGVZbJmbmjHdjpdT?=
 =?us-ascii?Q?MRadPp4b3Opk2tSrHZu/Xbww4PuZN6aKDn/1PxXdYq4Krqj+G2blmm18KPTo?=
 =?us-ascii?Q?p6A9qkWc6FqnhzLw+twFsMAh/R2EwCwtQhTrtWYHHYA/etSs7/3XkP3s4UkB?=
 =?us-ascii?Q?vi5D+lubh/NbuC7FzBoA7d+wbrDl539RgWDcMT7QlUoyNTmdDBaV+y2TJbxn?=
 =?us-ascii?Q?sQe3QlvQGWfegarMeEIRF435RT/MJuv48p5hBrXlALGjzsWF2Sn0cEumQmAS?=
 =?us-ascii?Q?GsA9yzr3znXA81b1GxZfIzHS4g688zBwfguA5VExHRfnw8iFq1aIvKzHHY9p?=
 =?us-ascii?Q?n3RQP72vVeRPDp0n7eKB10sF+8kZRzbdy9BPndLkMqBai5qHNp/0r77idW04?=
 =?us-ascii?Q?3wVvIInsdfQAOdAEnHfkUgv6JAKn5oAnepBHwxXh6i/ifsTVl9u792VUPxis?=
 =?us-ascii?Q?E/mERzaxZqD49j+oLujrrTql+SOxkrKPhL/D92Hzv0/bCeDcO8FJDNgBWkJn?=
 =?us-ascii?Q?eBjARG7V7waDXp62tD4UlrbYKFZxUgPO7c08ZcSOBzPmPN/7j2aW/w/jMkva?=
 =?us-ascii?Q?T6+9GF9DM4Wf6v9Zl5i2wuwYh+Gnx2HEXdL6+h6yIZxPrEkHjkscgUdWtY8X?=
 =?us-ascii?Q?eNJNuzTuim99xHd8hR8S/X6qQCWSZ2y8h5SvkLU3SogNE5hD0M4g3pfVIZik?=
 =?us-ascii?Q?XqQ/oiFpL/CnUhZ5l3gYb1dr4NST3Xpd461jmiTH5eOR0Sn1U5nmkfUPuFSW?=
 =?us-ascii?Q?6urSVazjznvPdnDAkxkp+qCg?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E17288F1018C6D49AE0260278A367514@INDP287.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-bafef.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB0217.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4e9fc5-b631-4141-9847-08dc9ce416a3
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 11:17:42.5621
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0296

From: Kerem Karabay <kekrby@gmail.com>

This helper will allow HID drivers to easily determine if they should
bind to a hid_device by checking for the prescence of a certain field
when its ID is not enough, which can be the case on USB devices with
multiple interfaces and/or configurations.

Signed-off-by: Kerem Karabay <kekrby@gmail.com>
Signed-off-by: Aditya Garg <gargaditya08@live.com>
---
 drivers/hid/hid-core.c          | 25 +++++++++++++++++++++++++
 drivers/hid/hid-google-hammer.c | 27 ++-------------------------
 include/linux/hid.h             |  2 ++
 3 files changed, 29 insertions(+), 25 deletions(-)

diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
index 8992e3c1e..6395bdc2e 100644
--- a/drivers/hid/hid-core.c
+++ b/drivers/hid/hid-core.c
@@ -1906,6 +1906,31 @@ int hid_set_field(struct hid_field *field, unsigned =
offset, __s32 value)
 }
 EXPORT_SYMBOL_GPL(hid_set_field);
=20
+struct hid_field *hid_find_field(struct hid_device *hdev, unsigned int rep=
ort_type,
+				 unsigned int application, unsigned int usage)
+{
+	struct list_head *report_list =3D &hdev->report_enum[report_type].report_=
list;
+	struct hid_report *report;
+	int i, j;
+
+	list_for_each_entry(report, report_list, list) {
+		if (report->application !=3D application)
+			continue;
+
+		for (i =3D 0; i < report->maxfield; i++) {
+			struct hid_field *field =3D report->field[i];
+
+			for (j =3D 0; j < field->maxusage; j++) {
+				if (field->usage[j].hid =3D=3D usage)
+					return field;
+			}
+		}
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_GPL(hid_find_field);
+
 static struct hid_report *hid_get_report(struct hid_report_enum *report_en=
um,
 		const u8 *data)
 {
diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hamme=
r.c
index c6bdb9c4e..fba3652aa 100644
--- a/drivers/hid/hid-google-hammer.c
+++ b/drivers/hid/hid-google-hammer.c
@@ -419,38 +419,15 @@ static int hammer_event(struct hid_device *hid, struc=
t hid_field *field,
 	return 0;
 }
=20
-static bool hammer_has_usage(struct hid_device *hdev, unsigned int report_=
type,
-			unsigned application, unsigned usage)
-{
-	struct hid_report_enum *re =3D &hdev->report_enum[report_type];
-	struct hid_report *report;
-	int i, j;
-
-	list_for_each_entry(report, &re->report_list, list) {
-		if (report->application !=3D application)
-			continue;
-
-		for (i =3D 0; i < report->maxfield; i++) {
-			struct hid_field *field =3D report->field[i];
-
-			for (j =3D 0; j < field->maxusage; j++)
-				if (field->usage[j].hid =3D=3D usage)
-					return true;
-		}
-	}
-
-	return false;
-}
-
 static bool hammer_has_folded_event(struct hid_device *hdev)
 {
-	return hammer_has_usage(hdev, HID_INPUT_REPORT,
+	return !!hid_find_field(hdev, HID_INPUT_REPORT,
 				HID_GD_KEYBOARD, HID_USAGE_KBD_FOLDED);
 }
=20
 static bool hammer_has_backlight_control(struct hid_device *hdev)
 {
-	return hammer_has_usage(hdev, HID_OUTPUT_REPORT,
+	return !!hid_find_field(hdev, HID_OUTPUT_REPORT,
 				HID_GD_KEYBOARD, HID_AD_BRIGHTNESS);
 }
=20
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 39e21e381..9520fdfdd 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -913,6 +913,8 @@ extern void hidinput_report_event(struct hid_device *hi=
d, struct hid_report *rep
 extern int hidinput_connect(struct hid_device *hid, unsigned int force);
 extern void hidinput_disconnect(struct hid_device *);
=20
+struct hid_field *hid_find_field(struct hid_device *hdev, unsigned int rep=
ort_type,
+				 unsigned int application, unsigned int usage);
 int hid_set_field(struct hid_field *, unsigned, __s32);
 int hid_input_report(struct hid_device *hid, enum hid_report_type type, u8=
 *data, u32 size,
 		     int interrupt);
--=20
2.42.0


