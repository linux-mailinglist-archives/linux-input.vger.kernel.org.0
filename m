Return-Path: <linux-input+bounces-12598-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18656AC543D
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 18:57:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EB778A1C63
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 16:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5511528003C;
	Tue, 27 May 2025 16:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b="fxArrHDl"
X-Original-To: linux-input@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazolkn19011032.outbound.protection.outlook.com [52.103.68.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32F28001F;
	Tue, 27 May 2025 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.68.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364885; cv=fail; b=eLAm04TLE9H9Lrgs1o1LxireS3g/U5lOLgcfB/oeRH/LyHdmRXBtsC6CVnim2NVnDm/koFM20LpT7e6E/EAEc7dyvy0Zr0vbqOVUBz75zK6qnwBnpLTVK8alZ4eVB/wnIZFzwCFSx/vWCQXTqznm36KNghUpKw5FrbRHGhI25cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364885; c=relaxed/simple;
	bh=WDisLZN0lncwAmicQzdWcGHd4aGcLG8mgtLVQFxjO+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o4yj3tjtBYMfKVQc+f9RP0xLqh9pIk8Y6PqTmEFZjbHpACuXX7SJKlr2YFXaNobrpUy/oCruL8QYwPw/12ZAKWZk35mAmBgfN5Ja5RYJJ022tyjqC1ikjuLFqktndm4H0nR+OeojIrBALduGDh8SAFBqeQ7fEhJinSBAnPQTp80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com; spf=pass smtp.mailfrom=live.com; dkim=pass (2048-bit key) header.d=live.com header.i=@live.com header.b=fxArrHDl; arc=fail smtp.client-ip=52.103.68.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=awSmlGtMQLcL8zZroSG5SFtxNsCwbFfmUQN9DuHYEqdMU2XvlzH6wEFKtVcdMdDw+3PjF/EL1zNIApsb+EqyjSArZ9L5qPIwH4dYZy7TGfD2SoSuqpB5XIv8qSQqjWYmg3GzpZlshhgIT1dhMzS94UKFOIQyzeyoXn8sQkm/vmJmE+doZCPxDwS5SJ0q+uVHnNNSWCINe5zQXk/M7PKie+bMMLfkD95lGwAXZq+pwPclRrtDFdH8Ku5MR4YrOAo72DsaGVJwxQqq/IT3vgTAP7zRsxyRbvDFNrJK8WPbaM4ij2HICc3IeB6GAIQx80qgUzmXi6QNVhp80VjlVCD4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SYnZMdjIf8WonY7IkWD7YO9byuS/dH6X4qZdHuFW9B4=;
 b=zVCHxQmWtAzKsLF+mnGeVdt2BbKm6DTohY7ZwJMwGmGDesVNRnDyE34XxkpEeJCrC3KamZVFLnnwc5FXu5Q65xKqacIS1kKcEcNWjRvpbyBvsybd8LEYIvLCkNUD1jzIiTe8PcCB76AWPtdvydq2SaKDydPZpI7E2FeAmG6IePsy0RQRkf1wU7eKA0N+WjCqaUpKgKPXsI//MCeWizA6onDE5BSIZY+OUbAf4uwJBBcoOsHVngcGLQqN0p2/+LT83P+vzt1tNotA/jXHlEy5AsqojLZSMndmOsVJvlHi0zuv8lzTIronB0zSRKVCm502BkKCxgDExjbqR41nX5l/yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYnZMdjIf8WonY7IkWD7YO9byuS/dH6X4qZdHuFW9B4=;
 b=fxArrHDlVPGDEKrDQTrLhB3WW/NrvZmV3CsVIQHgYYqIC9OKA9eoA4/7EF5RaeP/OEK8lTQo4gNH8Gu1IDftNCFxDTxQiQU2Nf5M8dVn/xXgNX/LkH6iGXmmygz4wqs+ga2Is0VJhR4HatxwbNIxN2chbo944Dayd+6a6nFCW94L0TfzUgu6jW2VS2yKwVMPSKdaKlSzAWxeHipyhNo3EVhonx6UUL1BLts1tKEuSjIYuMoihzxfjWvwvhJfPy5w7pjM+NBTvVXFSO+4F5kq8X5R3d/Tde8jLu5aPd1PoO1+8mqGC1lxl6J4Ct4o0DRzBfGPMo/N3BE7P9Yoxax/LQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB7799.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:b6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Tue, 27 May
 2025 16:54:37 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 16:54:37 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Jiri Kosina <jikos@kernel.org>,
	Jiri Kosina <jkosina@suse.com>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Kerem Karabay <kekrby@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Input Mailing List <linux-input@vger.kernel.org>
Subject: [PATCH v3 1/5] HID: multitouch: Get the contact ID from HID_DG_TRANSDUCER_INDEX fields in case of Apple Touch Bar
Date: Tue, 27 May 2025 22:13:13 +0530
Message-ID:
 <PN3PR01MB9597605FAEAC3750F6D18FB3B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB959768813D548FD4A91CDD11B864A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:f7::14)
X-Microsoft-Original-Message-ID:
 <20250527165417.24165-2-gargaditya08@live.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PR01MB9597:EE_|PN0PR01MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 9434f006-f380-4ebd-53c3-08dd9d3f2a06
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|8060799009|19110799006|15080799009|7092599006|5072599009|461199028|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T5GxAVJoijmNCO8/Dkr8nLV/mUrxRIElPxe5WLgKv4OhD6ZZp0050Wg5/bCi?=
 =?us-ascii?Q?dXAyPmDu1mJFzKNQiBT+aoSYxb1B/cOnYsI5AO7ARUqyS+7M+hFWSYsjGSPx?=
 =?us-ascii?Q?4LJ9bDUfz9rh++Uhgi1CenfCAx2GaOg0W6RvWuquoIdtLsFLei50vvWtx4O0?=
 =?us-ascii?Q?UB/uOc8BKHoyX/SkXfB4+Dj1nYhlnsyi0+0ObRWy6kJo3LBMf3gQDpYe0un3?=
 =?us-ascii?Q?x8KLSSbjLPm1G7XJu+4kmA4+OCuChRKf2O6xd3k/IAKHgU/x89+4uixdOv4d?=
 =?us-ascii?Q?zzMh5gDTx6PGor/LP8UBHH11BJAF5Y71JWTgD2KJoaHh24wi4ygWtdQejM56?=
 =?us-ascii?Q?aF4MmReTSlWzKxKur9J8WRbRhlWdgMfahiZ9tdWpLcpj7XY7SLRPylwNPvv6?=
 =?us-ascii?Q?KPBQUsMnlNf86ln7VmK3rlnckRHFPc5xfampMJIdMoZoGxqVnIP/HbabdGt9?=
 =?us-ascii?Q?o5rgRtS6g7MSkKgAQRz7YPALcO3x7g4sZ8k8qDjxopY5YQTnHVRCz89Eg2QP?=
 =?us-ascii?Q?ywiyhWwb8nVEeI/t7e5Fimq2QEAh/D8XDlPyMR+R7MIX6IZlApRKFa6XJnEf?=
 =?us-ascii?Q?9Ji5VNYzDLa/ytm6MEzDKcHeNT3e63VYrzDFnBtpo3FfNtfYxtCqgmDpAHAP?=
 =?us-ascii?Q?d/CCiF08kT3vtpV64sXEe5ZODGrY5GJQByQlRKNDktZgMuyLteiIaDED7OVa?=
 =?us-ascii?Q?k8l8Lg30IcQ8xIeCUXpAFSzs+SDOZ3uDCWbXzEjb/NKPpsUQQX43PUcorcZa?=
 =?us-ascii?Q?rhGua/ipyUh6T7UypxRwCx1NSlaQLfhWa8ebT1LydA9NzVUSPDhQiXsGoBr1?=
 =?us-ascii?Q?siu13WvOI/dTA/0x8877brvV4FryprCXT+xi5rT0opbLdwBJIjz/sAPUf6hq?=
 =?us-ascii?Q?ew9Q05Vs5Z0Pm9v/OQ13oi2Y7GbR7DT8uQgYYmwQem3oP8f85FdcWxq/KDDo?=
 =?us-ascii?Q?fGUe2/KhJL1nL7SOMrNoKQzgU/1QEGKQmF+SPJUFVvSdMGdwLW8MleBEcAnU?=
 =?us-ascii?Q?D3iUSIZHhiAPJW47/kxiUlOsRKMBRfeIQdVH200+G0FM6oubuFnlJuKLwoek?=
 =?us-ascii?Q?Mv/s/kJUFimFhfKgBzQxux7MZr7JTCzsujIfLmxy5sei8dfh/HuUli027Iaz?=
 =?us-ascii?Q?1HsMPxuTajqbHgc4z4AHltocxuqM0PF5iQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xyymz3WrX847ud4rIivhVdrNUG39Lf+0ScuLdOVJkZII7tzFEhImbMo1BTqt?=
 =?us-ascii?Q?o33QcquSWKa2r1lIkN8Fa/T/E5r5HTaFV5U2RofoAEFgBtVsHTDmTFSyoWMD?=
 =?us-ascii?Q?BiIsNtnZIJrirWRaAfrs5CKnM6GhCteHraY9pMTIJHdE3nbF+rblX+Sk6OnB?=
 =?us-ascii?Q?iC4Q0KRp0hToBAJuDtGsiHbG3IU+cZNB+WBLeED+9ZxYPlDb0NO85Mw7hDbD?=
 =?us-ascii?Q?lXClYIJb7kzAoa0uoldhKKR7FM4ir+8XTw9nxQU0zwYPx8t4wa5n0LpHtBPN?=
 =?us-ascii?Q?71U0HmDpKk6ioOW47/55if6iQZ4Ppv/fOlg8KyEpVLYVzmi/OhHy5A4aQCpE?=
 =?us-ascii?Q?L7WhJ53dP8aAMuhRHWNLmM35DfowvQOAPjOa1WjnwEJ6WydLjsuAgXgK5Cxm?=
 =?us-ascii?Q?HTUlRzZRR+h+MFzfmPPyZw+UFp/Qt9TStfUq+peTAZQ/q1gcn/e36gT601ri?=
 =?us-ascii?Q?/J7wYE2HQaPk4bChZQ5LtjvRdeIurJN2i7tyXt2XtBvs5KcuGkzAkPuOe32H?=
 =?us-ascii?Q?6Xw6xz45z/Tu7QparAGexwTKPYJOIqcOtcFsSoVupH2IFRUorgviQ1VuGJev?=
 =?us-ascii?Q?b4CkXC0uHG4BeqMRMWDwyalz/ZYRZokHn1XwKpq7mhZva3CTPwYD5xKxNK+6?=
 =?us-ascii?Q?dO2FvCsB3aoVWzXqAdfYAETwiRJwqzmiPXaCuVM71CrjIsOaniimL1OGz97l?=
 =?us-ascii?Q?RBHfMfrt8lfWsgyQRElElpX3jZj+exsVUCFGVyZGsqsSjyIphIH6SKsw+K4R?=
 =?us-ascii?Q?xT4VDrwgblLCJPQVmWKz63qbRCIB5BuagFLirEa/PplyxUfj5V20/T71LqoF?=
 =?us-ascii?Q?m+FRikG2LxzVK1vNcg9IVz/lcNwXOJsGnqKSWFa4gRhHIcdMFPfavSM1TsAq?=
 =?us-ascii?Q?B4XqinYxflaAciy3u7dVNF6eF2P8YqPxVh0Fg5pYe8hBkReRWPyK8Nn/e9LF?=
 =?us-ascii?Q?sd7z4LY4yDtsLwsNjBp9BK2k2AtJK5FpjhLpolwuCdRxAgkBC3NKT4tEEpb5?=
 =?us-ascii?Q?rPSnax0IHTlJ7Hnp4eAs9fUpkWqvYVJjlE8vYB7ifCQh+dz8cR3a+OpthoVA?=
 =?us-ascii?Q?ShehJyoQOEZYpr2vkNxGD/5rkMLq/Z+OjoQQszxkmDlpVz7m7KcScCgCtXSE?=
 =?us-ascii?Q?e9HJgDa6GE/itgYOcdS76EZIiRw25/Ov6mVpWS0kLS8Q62c3j+xKZvKQ+Buf?=
 =?us-ascii?Q?/YOm5YYsj865UmfiLZkKq8ISLQm8KLyt5wHbQ4MG8DWr06UZdBA84WAPu1/6?=
 =?us-ascii?Q?IvDVfV5Mb0JriMbmJQwUwbZ2QVztozQTpMznFHgpomCseawtGWVw8BwrIsot?=
 =?us-ascii?Q?O4o=3D?=
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-18ccf.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9434f006-f380-4ebd-53c3-08dd9d3f2a06
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 16:54:37.4026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB7799

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
index 7ac8e16e6..2788a081f 100644
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
2.43.0


