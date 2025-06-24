Return-Path: <linux-input+bounces-13008-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD51AE65F9
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 15:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5AA175FFD
	for <lists+linux-input@lfdr.de>; Tue, 24 Jun 2025 13:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA03291C0E;
	Tue, 24 Jun 2025 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b="SnXgRGsw"
X-Original-To: linux-input@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012049.outbound.protection.outlook.com [40.107.75.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F48230996;
	Tue, 24 Jun 2025 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770562; cv=fail; b=qDIvM9xm7+tqi1ybmbRRe/NUpzwI9jbIjpxpVHk/7l/GbD8VvpXOlANBCmBKEi4Evro4H0cMr9F/7RsSG8N3ZILRIrpqKTGjMZ94YX53igSjdHCiBlFErYuJoSnwJG5348PJ0iUlAR7X5c79fRnjlVHObgCcRB74tc9TaNRkk7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770562; c=relaxed/simple;
	bh=XOZVBCXgom74CVigcYXQ0RxNFnA3bCjaBGjkDLreKtE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=N8O/SrGfyl7QJl11WMRARbVbzuZxW2i473ZFGHES6MWEttaKUjgDsq1QjoWrkWVkqZa2YfyB+wO4ksV5ozFifg7/mwScmqciCMHwYbLlv4RGT+ZL+DiuDsGFZpTSiyi32Fv1oZl/PToV1GSWNzXcQ5Fz7omaM80ilPxsZD1aqlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com; spf=pass smtp.mailfrom=oppo.com; dkim=pass (1024-bit key) header.d=oppo.com header.i=@oppo.com header.b=SnXgRGsw; arc=fail smtp.client-ip=40.107.75.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oppo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oppo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlkV76dXBEWMgzXrJw7b5Y2CmDXF5lnJEdIaBbqKEwBA2mC4fMHbTB0AKfguQqcaa/stmh6shNXQemJLBGOgLB0L6HHvymorlmzNsKnTh56PXqzP3/Ql/SSkEjC5Y7hUy7djbjJ3Abfqf9KX7fAiOrFQC1LPg84jYiAo9rR8cxvijg6nL4o7OWRn4fLvN0pzkICcq29Ow27v7+GMeJOk3x6IbYBZ4eYf1heI1phKXHyn//l3ZUExr4Ff3G3mtfpoHbaMVNLxxvUcKYQkHPMlF/ghOOz9jRBs/TRfTQOMn9iyzp4IQBouNCCxEbhX2lSDFVrf0osQEq0UCzLlqiS6ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOsDDQxRrffZ6cmniYFbDQd13mftWgjlhIqhjvcM350=;
 b=uSP/d2cPcyXsadbkiSP6rclAdfKSOIriYjmU98tAw0Lry4vPMAHs0x+PlkLLo1aOb/RDDOZq4xSsJ60OA9JPH8rUihtI8miKGNoUNF3/5l2bhc8LUBE0R4gsSRIeqWjDgGo9EZB/HwtiiQ9/aBqFfXjybfVvnyBMsw5eO1lOy1QxwqQSlk2ns5EQxQvc2UHjUunCXCjr6UaGAv/6LLtpNWOb57M5rGqmGYWYGU0O186mtf0U5/ieq+57bSXf3KVQtz6bmRDTaXThzhEBSD14Mybt4u2l98A238/r4xV9nEX5pOOyaHH1OrnPEBoCOTr35Zxu3SbjP6oW2c9s8vMZDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOsDDQxRrffZ6cmniYFbDQd13mftWgjlhIqhjvcM350=;
 b=SnXgRGswQgGm/S+qO26z+dY0Xizx4AnILbxgQ2tQTui6tYyg8qtCsIz8DlPEaoztr7Jjz42BfFFj9VaWb4+FEoBDKRz92bQ432hfrsTtg22ktRLabRwtwEYZjNaj5Ysb80t8kv0k5ZncQ9BiPkuIMN6xbCG+pWa4/F7pRjCxYyY=
Received: from PS2PR01CA0063.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::27) by SG2PR02MB5651.apcprd02.prod.outlook.com
 (2603:1096:4:1cb::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 13:09:11 +0000
Received: from OSA0EPF000000CB.apcprd02.prod.outlook.com
 (2603:1096:300:57:cafe::c2) by PS2PR01CA0063.outlook.office365.com
 (2603:1096:300:57::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Tue,
 24 Jun 2025 13:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 OSA0EPF000000CB.mail.protection.outlook.com (10.167.240.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Tue, 24 Jun 2025 13:09:10 +0000
Received: from PA80318969.adc.com (172.16.40.118) by mailappw30.adc.com
 (172.16.56.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 21:09:09 +0800
From: huangzaiyang <huangzaiyang@oppo.com>
To: <jikos@kernel.org>
CC: <bentiss@kernel.org>, <linux-input@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, huangzaiyang <huangzaiyang@oppo.com>
Subject: [PATCH] drivers/hid: Implement a battery status polling mechanism for selected input devices.
Date: Tue, 24 Jun 2025 21:08:36 +0800
Message-ID: <20250624130836.5743-1-huangzaiyang@oppo.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: mailappw31.adc.com (172.16.56.198) To mailappw30.adc.com
 (172.16.56.197)
Content-Transfer-Encoding: quoted-printable
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000CB:EE_|SG2PR02MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 07e04303-eeae-4426-6666-08ddb3204f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g3u+GWt6my3stBzFYWFcz/Yho/sXHthL+ms0l5R4525PvEnpKixH3/tihoa4?=
 =?us-ascii?Q?aprsj9UGRTizD7No/i77/U6nwQxWtBPbBDEWSc2Wqzxs+b8XNEUpoEG+yr70?=
 =?us-ascii?Q?LRghJ9rOElP2vxAK/YKXwEVMe3yg92zWTWMNqNTmR1YbwzO7PXOwoA/gVMiy?=
 =?us-ascii?Q?89B9yDQS8K3bQpTDCAZDOsoJL/TTNMK0dC7SWc+W5blun4PTPRiz2IXIRIcj?=
 =?us-ascii?Q?+++mmL8X2JSCoV8pzU/YzqOsKA+BhuUGVoWPcwCb0AnFD9YXEF1m3FySbscV?=
 =?us-ascii?Q?w4PRLDwxkVcs7jzi0g2LYLekIU4B25aYOkPtPUGoQJMZsVin0JhICGYb41pF?=
 =?us-ascii?Q?lNZTaXmIKLXdUxGJvoNgpsGBsAf4dgS56+elS42Ta+smXV+e/mGsfgmdv0cJ?=
 =?us-ascii?Q?Y1luQjU0Hs+maGZp6xmaE4A8pin/SWyqjBbySJa2viWBP6CwiwIvz4oTJZJE?=
 =?us-ascii?Q?pNAzjN3X9KjuyYvBG0s/o0ZZulEen7fOpcpU0NdwIiqJYT7qZvOnqqJQAQ2D?=
 =?us-ascii?Q?WBub43zHO5kUitgAeIzTmG+LI1hddVD3nRGt78O2QM382ox/+QS0sfvyMr4o?=
 =?us-ascii?Q?/sSzd7MUQZ0WBibcm5JV1JBxBebT32YgqWIFllHN/qH7n2vWFhKd5l2SJqxB?=
 =?us-ascii?Q?JTy/YfEkpaqqop7ByjklbPgi0YQiTtu1k8qoiSomQe5DzUNYqtXJebZYxeI8?=
 =?us-ascii?Q?CLm0QzlqQ/kTsoTOc+Hs97w6HpGJgxQXT/ddoTEZLN0xoXxH6DokjdEYGdC+?=
 =?us-ascii?Q?Ku3GfJLp93PLklbeh/wnk9wutv+2bo9Rxr4l+UVnNjzp50icxoY7RtF1CaIc?=
 =?us-ascii?Q?b3S/SE6XO2mVOxzELjBmdZ5C+rlDTj7PlNj/JyS+YV1LwoP7Ezq3PxeOC5wC?=
 =?us-ascii?Q?HCXd+MDMysWurkcHFMYMRoReIcX/Vt5soWP8c0OaJ3bP/fQc/12q0FwHoTKM?=
 =?us-ascii?Q?Ebwo1h2rBk/A80mni7f6kPGOHIMeMhVdmO/SwlKwnPlnhX/JdnjwVvpyjta3?=
 =?us-ascii?Q?+lLr2VKL4fdV/pyX8BOvi4+q5CcccKG8geyruCd+aWb1NR0LLBS9PfIdN5/Y?=
 =?us-ascii?Q?6Q2X5fCP5fFRMH0rTYaZF8q8QOEEUbKT0DkNPpHtqCUnzlE++9MFjRAojVwV?=
 =?us-ascii?Q?ESEGHOYYMrCYzQt2hilDkWcDnkzG/I/WKV3ok5R3yhWvAWck3GLInTGAeLJJ?=
 =?us-ascii?Q?0LTjTSeWkeymV9K+9MqWHP0wpOA97mqyAPDBdM8XckaFhmsI12UO00B7ywDw?=
 =?us-ascii?Q?Dzh7+8qJpj2soqSi4DUWdeBUNKnZM+gmaI2SmqwDNsCPsyI6MsRRoknFf2SR?=
 =?us-ascii?Q?40lCo3oKWUZk4Er3qBnFBm6Gy0pa7PcGInS8qWSOWJ3Ecgywzw+/4Ingj9ae?=
 =?us-ascii?Q?XNRa74JdmES7dFx/zdVJ0ckCMSN5Ga5vAMjly5Lzf+8TsSAkZ2vQ/E74glCq?=
 =?us-ascii?Q?+kVDicwfAzRL1rk7hkBkOCRqP3vMpRPvVQALTLKn236owsncN30UyMdUUXQG?=
 =?us-ascii?Q?pSZzDI+qdVS2zSI3yo3ML27mXmShq+eagekQ?=
X-Forefront-Antispam-Report:
	CIP:58.252.5.68;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.oppo.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 13:09:10.4132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07e04303-eeae-4426-6666-08ddb3204f3d
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6;Ip=[58.252.5.68];Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000CB.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5651

Reading battery capacity and status could fail and end up with timeout
after 5s for some input devices, for example:8BitDo SN30 Pro+ gamepad.
Implement a battery status polling mechanism for selected input devices,
set HID_BATTERY_QUIRK_AVOID_QUERY and HID_BATTERY_QUIRK_POLLING_QUERY
for 8BitDo SN30 Pro+ gamepad.
to Avoid UI freezing when reading battery capacity/status.

Signed-off-by: huangzaiyang <huangzaiyang@oppo.com>
---
 drivers/hid/hid-input.c | 63 +++++++++++++++++++++++++++++++++++++++++
 include/linux/hid.h     |  2 ++
 2 files changed, 65 insertions(+)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91eb..b113f5c49d03 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -341,6 +341,7 @@ static enum power_supply_property hidinput_battery_prop=
s[] =3D {
 #define HID_BATTERY_QUIRK_FEATURE      (1 << 1) /* ask for feature report =
*/
 #define HID_BATTERY_QUIRK_IGNORE       (1 << 2) /* completely ignore the b=
attery */
 #define HID_BATTERY_QUIRK_AVOID_QUERY  (1 << 3) /* do not query the batter=
y */
+#define HID_BATTERY_QUIRK_POLLING_QUERY        (1 << 4) /* polling query t=
he battery */

 static const struct hid_device_id hid_battery_quirks[] =3D {
        { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE,
@@ -390,6 +391,16 @@ static const struct hid_device_id hid_battery_quirks[]=
 =3D {
         * set HID_BATTERY_QUIRK_IGNORE for all Elan I2C-HID devices.
         */
        { HID_I2C_DEVICE(USB_VENDOR_ID_ELAN, HID_ANY_ID), HID_BATTERY_QUIRK=
_IGNORE },
+       /*
+        * Reading battery capacity and status could fail and end up
+        * with timeout after 5s for some input devices, for example:
+        * 8BitDo SN30 Pro+ gamepad.
+        * set HID_BATTERY_QUIRK_AVOID_QUERY and HID_BATTERY_QUIRK_POLLING_=
QUERY
+        * for 8BitDo SN30 Pro+ gamepad.
+        * to Avoid UI freezing when reading battery capacity/status
+        */
+       { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_MICROSOFT, USB_DEVICE_ID_8BITD=
O_SN30_PRO_PLUS),
+         HID_BATTERY_QUIRK_AVOID_QUERY | HID_BATTERY_QUIRK_POLLING_QUERY }=
,
        {}
 };

@@ -497,6 +508,33 @@ static int hidinput_get_battery_property(struct power_=
supply *psy,
        return ret;
 }

+/*
+ * hid input device battery polling handler
+ */
+static void hidinput_battery_polling_handler(struct work_struct *work)
+{
+       int value;
+       struct hid_device *dev =3D container_of(work, struct hid_device, ba=
ttery_delayed_work.work);
+
+       dev->battery_status =3D HID_BATTERY_QUERIED;
+       dev->battery_avoid_query =3D true;
+       value =3D hidinput_query_battery_capacity(dev);
+       if (value < 0) {
+               dev->battery_status =3D HID_BATTERY_UNKNOWN;
+               hid_err(dev, "cannot get battery capacity from device!\n");
+       } else {
+               dev->battery_capacity =3D value;
+               dev->battery_avoid_query =3D false;
+               dev->battery_status =3D HID_BATTERY_REPORTED;
+               hid_err(dev, "get battery capacity from device:%d!\n", valu=
e);
+       }
+
+       /*keep polling period same to battery_ratelimit_time*/
+       queue_delayed_work(dev->battery_wq,
+                               &dev->battery_delayed_work,
+                               msecs_to_jiffies(30 * 1000));
+}
+
 static int hidinput_setup_battery(struct hid_device *dev, unsigned report_=
type,
                                  struct hid_field *field, bool is_percenta=
ge)
 {
@@ -571,6 +609,21 @@ static int hidinput_setup_battery(struct hid_device *d=
ev, unsigned report_type,
        }

        power_supply_powers(dev->battery, &dev->dev);
+
+       if (quirks & HID_BATTERY_QUIRK_POLLING_QUERY) {
+               INIT_DELAYED_WORK(&dev->battery_delayed_work, hidinput_batt=
ery_polling_handler);
+               dev->battery_wq =3D create_singlethread_workqueue(dev_name(=
&dev->dev));
+               if (dev->battery_wq) {
+                       queue_delayed_work(dev->battery_wq,
+                                       &dev->battery_delayed_work,
+                                       msecs_to_jiffies(0));
+                       hid_warn(dev, "create battery poll work: %s\n", dev=
_name(&dev->dev));
+               } else {
+                       hid_err(dev, "can't create battery poll work: %ld\n=
",
+                                       PTR_ERR(dev->battery_wq));
+               }
+       }
+
        return 0;

 err_free_name:
@@ -583,11 +636,21 @@ static int hidinput_setup_battery(struct hid_device *=
dev, unsigned report_type,

 static void hidinput_cleanup_battery(struct hid_device *dev)
 {
+       unsigned quirks;
        const struct power_supply_desc *psy_desc;

        if (!dev->battery)
                return;

+       quirks =3D find_battery_quirk(dev);
+       if (quirks & HID_BATTERY_QUIRK_POLLING_QUERY) {
+               cancel_delayed_work_sync(&dev->battery_delayed_work);
+               if (dev->battery_wq) {
+                       destroy_workqueue(dev->battery_wq);
+                       hid_err(dev, "destroy battery poll work\n");
+               }
+       }
+
        psy_desc =3D dev->battery->desc;
        power_supply_unregister(dev->battery);
        kfree(psy_desc->name);
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 568a9d8c749b..ff69aee70153 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -652,6 +652,8 @@ struct hid_device {
        enum hid_battery_status battery_status;
        bool battery_avoid_query;
        ktime_t battery_ratelimit_time;
+       struct delayed_work battery_delayed_work;
+       struct workqueue_struct *battery_wq;
 #endif

        unsigned long status;                                           /* =
see STAT flags above */
--
2.17.1

________________________________
OPPO

=C2=B1=C2=BE=C2=B5=C3=A7=C3=97=C3=93=C3=93=C3=8A=C2=BC=C3=BE=C2=BC=C2=B0=C3=
=86=C3=A4=C2=B8=C2=BD=C2=BC=C3=BE=C2=BA=C2=AC=C3=93=C3=90OPPO=C2=B9=C2=AB=
=C3=8B=C2=BE=C2=B5=C3=84=C2=B1=C2=A3=C3=83=C3=9C=C3=90=C3=85=C3=8F=C2=A2=C2=
=A3=C2=AC=C2=BD=C3=B6=C3=8F=C3=9E=C3=93=C3=9A=C3=93=C3=8A=C2=BC=C3=BE=C3=96=
=C2=B8=C3=83=C3=B7=C2=B5=C3=84=C3=8A=C3=95=C2=BC=C3=BE=C3=88=C3=8B=C2=A3=C2=
=A8=C2=B0=C3=BC=C2=BA=C2=AC=C2=B8=C3=B6=C3=88=C3=8B=C2=BC=C2=B0=C3=88=C2=BA=
=C3=97=C3=A9=C2=A3=C2=A9=C3=8A=C2=B9=C3=93=C3=83=C2=A1=C2=A3=C2=BD=C3=BB=C3=
=96=C2=B9=C3=88=C3=8E=C2=BA=C3=8E=C3=88=C3=8B=C3=94=C3=9A=C3=8E=C2=B4=C2=BE=
=C2=AD=C3=8A=C3=9A=C3=88=C2=A8=C2=B5=C3=84=C3=87=C3=A9=C2=BF=C3=B6=C3=8F=C3=
=82=C3=92=C3=94=C3=88=C3=8E=C2=BA=C3=8E=C3=90=C3=8E=C3=8A=C2=BD=C3=8A=C2=B9=
=C3=93=C3=83=C2=A1=C2=A3=C3=88=C3=A7=C2=B9=C3=BB=C3=84=C3=BA=C2=B4=C3=AD=C3=
=8A=C3=95=C3=81=C3=8B=C2=B1=C2=BE=C3=93=C3=8A=C2=BC=C3=BE=C2=A3=C2=AC=C3=87=
=C3=90=C3=8E=C3=B0=C2=B4=C2=AB=C2=B2=C2=A5=C2=A1=C2=A2=C2=B7=C3=96=C2=B7=C2=
=A2=C2=A1=C2=A2=C2=B8=C2=B4=C3=96=C3=86=C2=A1=C2=A2=C3=93=C2=A1=C3=8B=C2=A2=
=C2=BB=C3=B2=C3=8A=C2=B9=C3=93=C3=83=C2=B1=C2=BE=C3=93=C3=8A=C2=BC=C3=BE=C3=
=96=C2=AE=C3=88=C3=8E=C2=BA=C3=8E=C2=B2=C2=BF=C2=B7=C3=96=C2=BB=C3=B2=C3=86=
=C3=A4=C3=8B=C3=B9=C3=94=C3=98=C3=96=C2=AE=C3=88=C3=8E=C2=BA=C3=8E=C3=84=C3=
=9A=C3=88=C3=9D=C2=A3=C2=AC=C2=B2=C2=A2=C3=87=C3=AB=C3=81=C2=A2=C2=BC=C2=B4=
=C3=92=C3=94=C2=B5=C3=A7=C3=97=C3=93=C3=93=C3=8A=C2=BC=C3=BE=C3=8D=C2=A8=C3=
=96=C2=AA=C2=B7=C2=A2=C2=BC=C3=BE=C3=88=C3=8B=C2=B2=C2=A2=C3=89=C2=BE=C2=B3=
=C3=BD=C2=B1=C2=BE=C3=93=C3=8A=C2=BC=C3=BE=C2=BC=C2=B0=C3=86=C3=A4=C2=B8=C2=
=BD=C2=BC=C3=BE=C2=A1=C2=A3
=C3=8D=C3=B8=C3=82=C3=A7=C3=8D=C2=A8=C3=91=C2=B6=C2=B9=C3=8C=C3=93=C3=90=C3=
=88=C2=B1=C3=8F=C3=9D=C2=BF=C3=89=C3=84=C3=9C=C2=B5=C2=BC=C3=96=C3=82=C3=93=
=C3=8A=C2=BC=C3=BE=C2=B1=C2=BB=C2=BD=C3=98=C3=81=C3=B4=C2=A1=C2=A2=C3=90=C3=
=9E=C2=B8=C3=84=C2=A1=C2=A2=C2=B6=C2=AA=C3=8A=C2=A7=C2=A1=C2=A2=C3=86=C3=86=
=C2=BB=C2=B5=C2=BB=C3=B2=C2=B0=C3=BC=C2=BA=C2=AC=C2=BC=C3=86=C3=8B=C3=A3=C2=
=BB=C3=BA=C2=B2=C2=A1=C2=B6=C2=BE=C2=B5=C3=88=C2=B2=C2=BB=C2=B0=C2=B2=C3=88=
=C2=AB=C3=87=C3=A9=C2=BF=C3=B6=C2=A3=C2=ACOPPO=C2=B6=C3=94=C2=B4=C3=8B=C3=
=80=C3=A0=C2=B4=C3=AD=C3=8E=C3=B3=C2=BB=C3=B2=C3=92=C3=85=C3=82=C2=A9=C2=B6=
=C3=B8=C3=92=C3=BD=C3=96=C3=82=C3=96=C2=AE=C3=88=C3=8E=C2=BA=C3=8E=C3=8B=C3=
=B0=C3=8A=C2=A7=C2=B8=C3=85=C2=B2=C2=BB=C2=B3=C3=90=C2=B5=C2=A3=C3=94=C3=B0=
=C3=88=C3=8E=C2=B2=C2=A2=C2=B1=C2=A3=C3=81=C3=B4=C3=93=C3=AB=C2=B1=C2=BE=C3=
=93=C3=8A=C2=BC=C3=BE=C3=8F=C3=A0=C2=B9=C3=98=C3=96=C2=AE=C3=92=C2=BB=C3=87=
=C3=90=C3=88=C2=A8=C3=80=C3=BB=C2=A1=C2=A3
=C2=B3=C3=BD=C2=B7=C3=87=C3=83=C3=B7=C3=88=C2=B7=C3=8B=C2=B5=C3=83=C3=B7=C2=
=A3=C2=AC=C2=B1=C2=BE=C3=93=C3=8A=C2=BC=C3=BE=C2=BC=C2=B0=C3=86=C3=A4=C2=B8=
=C2=BD=C2=BC=C3=BE=C3=8E=C3=9E=C3=92=C3=A2=C3=97=C3=B7=C3=8E=C2=AA=C3=94=C3=
=9A=C3=88=C3=8E=C2=BA=C3=8E=C2=B9=C3=BA=C2=BC=C3=92=C2=BB=C3=B2=C2=B5=C3=98=
=C3=87=C3=B8=C3=96=C2=AE=C3=92=C2=AA=C3=94=C2=BC=C2=A1=C2=A2=C3=95=C3=90=C3=
=80=C2=BF=C2=BB=C3=B2=C2=B3=C3=90=C3=85=C2=B5=C2=A3=C2=AC=C3=92=C3=A0=C3=8E=
=C3=9E=C3=92=C3=A2=C3=97=C3=B7=C3=8E=C2=AA=C3=88=C3=8E=C2=BA=C3=8E=C2=BD=C2=
=BB=C3=92=C3=97=C2=BB=C3=B2=C2=BA=C3=8F=C3=8D=C2=AC=C3=96=C2=AE=C3=95=C3=BD=
=C3=8A=C2=BD=C3=88=C2=B7=C3=88=C3=8F=C2=A1=C2=A3 =C2=B7=C2=A2=C2=BC=C3=BE=
=C3=88=C3=8B=C2=A1=C2=A2=C3=86=C3=A4=C3=8B=C3=B9=C3=8A=C3=B4=C2=BB=C3=BA=C2=
=B9=C2=B9=C2=BB=C3=B2=C3=8B=C3=B9=C3=8A=C3=B4=C2=BB=C3=BA=C2=B9=C2=B9=C3=96=
=C2=AE=C2=B9=C3=98=C3=81=C2=AA=C2=BB=C3=BA=C2=B9=C2=B9=C2=BB=C3=B2=C3=88=C3=
=8E=C2=BA=C3=8E=C3=89=C3=8F=C3=8A=C3=B6=C2=BB=C3=BA=C2=B9=C2=B9=C3=96=C2=AE=
=C2=B9=C3=89=C2=B6=C2=AB=C2=A1=C2=A2=C2=B6=C2=AD=C3=8A=C3=82=C2=A1=C2=A2=C2=
=B8=C3=9F=C2=BC=C2=B6=C2=B9=C3=9C=C3=80=C3=AD=C3=88=C3=8B=C3=94=C2=B1=C2=A1=
=C2=A2=C3=94=C2=B1=C2=B9=C2=A4=C2=BB=C3=B2=C3=86=C3=A4=C3=8B=C3=BB=C3=88=C3=
=8E=C2=BA=C3=8E=C3=88=C3=8B=C2=A3=C2=A8=C3=92=C3=94=C3=8F=C3=82=C2=B3=C3=86=
=C2=A1=C2=B0=C2=B7=C2=A2=C2=BC=C3=BE=C3=88=C3=8B=C2=A1=C2=B1=C2=BB=C3=B2=C2=
=A1=C2=B0OPPO=C2=A1=C2=B1=C2=A3=C2=A9=C2=B2=C2=BB=C3=92=C3=B2=C2=B1=C2=BE=
=C3=93=C3=8A=C2=BC=C3=BE=C3=96=C2=AE=C3=8E=C3=B3=C3=8B=C3=8D=C2=B6=C3=B8=C2=
=B7=C3=85=C3=86=C3=BA=C3=86=C3=A4=C3=8B=C3=B9=C3=8F=C3=AD=C3=96=C2=AE=C3=88=
=C3=8E=C2=BA=C3=8E=C3=88=C2=A8=C3=80=C3=BB=C2=A3=C2=AC=C3=92=C3=A0=C2=B2=C2=
=BB=C2=B6=C3=94=C3=92=C3=B2=C2=B9=C3=8A=C3=92=C3=A2=C2=BB=C3=B2=C2=B9=C3=BD=
=C3=8A=C2=A7=C3=8A=C2=B9=C3=93=C3=83=C2=B8=C3=83=C2=B5=C3=88=C3=90=C3=85=C3=
=8F=C2=A2=C2=B6=C3=B8=C3=92=C3=BD=C2=B7=C2=A2=C2=BB=C3=B2=C2=BF=C3=89=C3=84=
=C3=9C=C3=92=C3=BD=C2=B7=C2=A2=C2=B5=C3=84=C3=8B=C3=B0=C3=8A=C2=A7=C2=B3=C3=
=90=C2=B5=C2=A3=C3=88=C3=8E=C2=BA=C3=8E=C3=94=C3=B0=C3=88=C3=8E=C2=A1=C2=A3
=C3=8E=C3=84=C2=BB=C2=AF=C2=B2=C3=AE=C3=92=C3=AC=C3=85=C3=BB=C3=82=C2=B6=C2=
=A3=C2=BA=C3=92=C3=B2=C3=88=C2=AB=C3=87=C3=B2=C3=8E=C3=84=C2=BB=C2=AF=C2=B2=
=C3=AE=C3=92=C3=AC=C3=93=C2=B0=C3=8F=C3=AC=C2=A3=C2=AC=C2=B5=C2=A5=C2=B4=C2=
=BF=C3=92=C3=94YES\OK=C2=BB=C3=B2=C3=86=C3=A4=C3=8B=C3=BB=C2=BC=C3=B2=C2=B5=
=C2=A5=C2=B4=C3=8A=C2=BB=C3=A3=C2=B5=C3=84=C2=BB=C3=98=C2=B8=C2=B4=C2=B2=C2=
=A2=C2=B2=C2=BB=C2=B9=C2=B9=C2=B3=C3=89=C2=B7=C2=A2=C2=BC=C3=BE=C3=88=C3=8B=
=C2=B6=C3=94=C3=88=C3=8E=C2=BA=C3=8E=C2=BD=C2=BB=C3=92=C3=97=C2=BB=C3=B2=C2=
=BA=C3=8F=C3=8D=C2=AC=C3=96=C2=AE=C3=95=C3=BD=C3=8A=C2=BD=C3=88=C2=B7=C3=88=
=C3=8F=C2=BB=C3=B2=C2=BD=C3=93=C3=8A=C3=9C=C2=A3=C2=AC=C3=87=C3=AB=C3=93=C3=
=AB=C2=B7=C2=A2=C2=BC=C3=BE=C3=88=C3=8B=C3=94=C3=99=C2=B4=C3=8E=C3=88=C2=B7=
=C3=88=C3=8F=C3=92=C3=94=C2=BB=C3=B1=C2=B5=C3=83=C3=83=C3=B7=C3=88=C2=B7=C3=
=8A=C3=A9=C3=83=C3=A6=C3=92=C3=A2=C2=BC=C3=BB=C2=A1=C2=A3=C2=B7=C2=A2=C2=BC=
=C3=BE=C3=88=C3=8B=C2=B2=C2=BB=C2=B6=C3=94=C3=88=C3=8E=C2=BA=C3=8E=C3=8A=C3=
=9C=C3=8E=C3=84=C2=BB=C2=AF=C2=B2=C3=AE=C3=92=C3=AC=C3=93=C2=B0=C3=8F=C3=AC=
=C2=B6=C3=B8=C2=B5=C2=BC=C3=96=C3=82=C2=B9=C3=8A=C3=92=C3=A2=C2=BB=C3=B2=C2=
=B4=C3=AD=C3=8E=C3=B3=C3=8A=C2=B9=C3=93=C3=83=C2=B8=C3=83=C2=B5=C3=88=C3=90=
=C3=85=C3=8F=C2=A2=C3=8B=C3=B9=C3=94=C3=AC=C2=B3=C3=89=C2=B5=C3=84=C3=88=C3=
=8E=C2=BA=C3=8E=C3=96=C2=B1=C2=BD=C3=93=C2=BB=C3=B2=C2=BC=C3=A4=C2=BD=C3=93=
=C3=8B=C3=B0=C2=BA=C2=A6=C2=B3=C3=90=C2=B5=C2=A3=C3=94=C3=B0=C3=88=C3=8E=C2=
=A1=C2=A3
This e-mail and its attachments contain confidential information from OPPO,=
 which is intended only for the person or entity whose address is listed ab=
ove. Any use of the information contained herein in any way (including, but=
 not limited to, total or partial disclosure, reproduction, or disseminatio=
n) by persons other than the intended recipient(s) is prohibited. If you ar=
e not the intended recipient, please do not read, copy, distribute, or use =
this information. If you have received this transmission in error, please n=
otify the sender immediately by reply e-mail and then delete this message.
Electronic communications may contain computer viruses or other defects inh=
erently, may not be accurately and/or timely transmitted to other systems, =
or may be intercepted, modified ,delayed, deleted or interfered. OPPO shall=
 not be liable for any damages that arise or may arise from such matter and=
 reserves all rights in connection with the email.
Unless expressly stated, this e-mail and its attachments are provided witho=
ut any warranty, acceptance or promise of any kind in any country or region=
, nor constitute a formal confirmation or acceptance of any transaction or =
contract. The sender, together with its affiliates or any shareholder, dire=
ctor, officer, employee or any other person of any such institution (herein=
after referred to as "sender" or "OPPO") does not waive any rights and shal=
l not be liable for any damages that arise or may arise from the intentiona=
l or negligent use of such information.
Cultural Differences Disclosure: Due to global cultural differences, any re=
ply with only YES\OK or other simple words does not constitute any confirma=
tion or acceptance of any transaction or contract, please confirm with the =
sender again to ensure clear opinion in written form. The sender shall not =
be responsible for any direct or indirect damages resulting from the intent=
ional or misuse of such information.
________________________________
OPPO

=E6=9C=AC=E7=94=B5=E5=AD=90=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=
=BB=B6=E5=90=AB=E6=9C=89OPPO=E5=85=AC=E5=8F=B8=E7=9A=84=E4=BF=9D=E5=AF=86=
=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E9=99=90=E4=BA=8E=E9=82=AE=E4=BB=B6=E6=
=8C=87=E6=98=8E=E7=9A=84=E6=94=B6=E4=BB=B6=E4=BA=BA=EF=BC=88=E5=8C=85=E5=90=
=AB=E4=B8=AA=E4=BA=BA=E5=8F=8A=E7=BE=A4=E7=BB=84=EF=BC=89=E4=BD=BF=E7=94=A8=
=E3=80=82=E7=A6=81=E6=AD=A2=E4=BB=BB=E4=BD=95=E4=BA=BA=E5=9C=A8=E6=9C=AA=E7=
=BB=8F=E6=8E=88=E6=9D=83=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=E4=BB=A5=E4=BB=
=BB=E4=BD=95=E5=BD=A2=E5=BC=8F=E4=BD=BF=E7=94=A8=E3=80=82=E5=A6=82=E6=9E=9C=
=E6=82=A8=E9=94=99=E6=94=B6=E4=BA=86=E6=9C=AC=E9=82=AE=E4=BB=B6=EF=BC=8C=E5=
=88=87=E5=8B=BF=E4=BC=A0=E6=92=AD=E3=80=81=E5=88=86=E5=8F=91=E3=80=81=E5=A4=
=8D=E5=88=B6=E3=80=81=E5=8D=B0=E5=88=B7=E6=88=96=E4=BD=BF=E7=94=A8=E6=9C=AC=
=E9=82=AE=E4=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E9=83=A8=E5=88=86=E6=88=96=E5=
=85=B6=E6=89=80=E8=BD=BD=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=EF=BC=
=8C=E5=B9=B6=E8=AF=B7=E7=AB=8B=E5=8D=B3=E4=BB=A5=E7=94=B5=E5=AD=90=E9=82=AE=
=E4=BB=B6=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=BA=E5=B9=B6=E5=88=A0=E9=
=99=A4=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E3=80=
=82
=E7=BD=91=E7=BB=9C=E9=80=9A=E8=AE=AF=E5=9B=BA=E6=9C=89=E7=BC=BA=E9=99=B7=E5=
=8F=AF=E8=83=BD=E5=AF=BC=E8=87=B4=E9=82=AE=E4=BB=B6=E8=A2=AB=E6=88=AA=E7=95=
=99=E3=80=81=E4=BF=AE=E6=94=B9=E3=80=81=E4=B8=A2=E5=A4=B1=E3=80=81=E7=A0=B4=
=E5=9D=8F=E6=88=96=E5=8C=85=E5=90=AB=E8=AE=A1=E7=AE=97=E6=9C=BA=E7=97=85=E6=
=AF=92=E7=AD=89=E4=B8=8D=E5=AE=89=E5=85=A8=E6=83=85=E5=86=B5=EF=BC=8COPPO=
=E5=AF=B9=E6=AD=A4=E7=B1=BB=E9=94=99=E8=AF=AF=E6=88=96=E9=81=97=E6=BC=8F=E8=
=80=8C=E5=BC=95=E8=87=B4=E4=B9=8B=E4=BB=BB=E4=BD=95=E6=8D=9F=E5=A4=B1=E6=A6=
=82=E4=B8=8D=E6=89=BF=E6=8B=85=E8=B4=A3=E4=BB=BB=E5=B9=B6=E4=BF=9D=E7=95=99=
=E4=B8=8E=E6=9C=AC=E9=82=AE=E4=BB=B6=E7=9B=B8=E5=85=B3=E4=B9=8B=E4=B8=80=E5=
=88=87=E6=9D=83=E5=88=A9=E3=80=82
=E9=99=A4=E9=9D=9E=E6=98=8E=E7=A1=AE=E8=AF=B4=E6=98=8E=EF=BC=8C=E6=9C=AC=E9=
=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E6=97=A0=E6=84=8F=E4=BD=
=9C=E4=B8=BA=E5=9C=A8=E4=BB=BB=E4=BD=95=E5=9B=BD=E5=AE=B6=E6=88=96=E5=9C=B0=
=E5=8C=BA=E4=B9=8B=E8=A6=81=E7=BA=A6=E3=80=81=E6=8B=9B=E6=8F=BD=E6=88=96=E6=
=89=BF=E8=AF=BA=EF=BC=8C=E4=BA=A6=E6=97=A0=E6=84=8F=E4=BD=9C=E4=B8=BA=E4=BB=
=BB=E4=BD=95=E4=BA=A4=E6=98=93=E6=88=96=E5=90=88=E5=90=8C=E4=B9=8B=E6=AD=A3=
=E5=BC=8F=E7=A1=AE=E8=AE=A4=E3=80=82 =E5=8F=91=E4=BB=B6=E4=BA=BA=E3=80=81=
=E5=85=B6=E6=89=80=E5=B1=9E=E6=9C=BA=E6=9E=84=E6=88=96=E6=89=80=E5=B1=9E=E6=
=9C=BA=E6=9E=84=E4=B9=8B=E5=85=B3=E8=81=94=E6=9C=BA=E6=9E=84=E6=88=96=E4=BB=
=BB=E4=BD=95=E4=B8=8A=E8=BF=B0=E6=9C=BA=E6=9E=84=E4=B9=8B=E8=82=A1=E4=B8=9C=
=E3=80=81=E8=91=A3=E4=BA=8B=E3=80=81=E9=AB=98=E7=BA=A7=E7=AE=A1=E7=90=86=E4=
=BA=BA=E5=91=98=E3=80=81=E5=91=98=E5=B7=A5=E6=88=96=E5=85=B6=E4=BB=96=E4=BB=
=BB=E4=BD=95=E4=BA=BA=EF=BC=88=E4=BB=A5=E4=B8=8B=E7=A7=B0=E2=80=9C=E5=8F=91=
=E4=BB=B6=E4=BA=BA=E2=80=9D=E6=88=96=E2=80=9COPPO=E2=80=9D=EF=BC=89=E4=B8=
=8D=E5=9B=A0=E6=9C=AC=E9=82=AE=E4=BB=B6=E4=B9=8B=E8=AF=AF=E9=80=81=E8=80=8C=
=E6=94=BE=E5=BC=83=E5=85=B6=E6=89=80=E4=BA=AB=E4=B9=8B=E4=BB=BB=E4=BD=95=E6=
=9D=83=E5=88=A9=EF=BC=8C=E4=BA=A6=E4=B8=8D=E5=AF=B9=E5=9B=A0=E6=95=85=E6=84=
=8F=E6=88=96=E8=BF=87=E5=A4=B1=E4=BD=BF=E7=94=A8=E8=AF=A5=E7=AD=89=E4=BF=A1=
=E6=81=AF=E8=80=8C=E5=BC=95=E5=8F=91=E6=88=96=E5=8F=AF=E8=83=BD=E5=BC=95=E5=
=8F=91=E7=9A=84=E6=8D=9F=E5=A4=B1=E6=89=BF=E6=8B=85=E4=BB=BB=E4=BD=95=E8=B4=
=A3=E4=BB=BB=E3=80=82
=E6=96=87=E5=8C=96=E5=B7=AE=E5=BC=82=E6=8A=AB=E9=9C=B2=EF=BC=9A=E5=9B=A0=E5=
=85=A8=E7=90=83=E6=96=87=E5=8C=96=E5=B7=AE=E5=BC=82=E5=BD=B1=E5=93=8D=EF=BC=
=8C=E5=8D=95=E7=BA=AF=E4=BB=A5YES\OK=E6=88=96=E5=85=B6=E4=BB=96=E7=AE=80=E5=
=8D=95=E8=AF=8D=E6=B1=87=E7=9A=84=E5=9B=9E=E5=A4=8D=E5=B9=B6=E4=B8=8D=E6=9E=
=84=E6=88=90=E5=8F=91=E4=BB=B6=E4=BA=BA=E5=AF=B9=E4=BB=BB=E4=BD=95=E4=BA=A4=
=E6=98=93=E6=88=96=E5=90=88=E5=90=8C=E4=B9=8B=E6=AD=A3=E5=BC=8F=E7=A1=AE=E8=
=AE=A4=E6=88=96=E6=8E=A5=E5=8F=97=EF=BC=8C=E8=AF=B7=E4=B8=8E=E5=8F=91=E4=BB=
=B6=E4=BA=BA=E5=86=8D=E6=AC=A1=E7=A1=AE=E8=AE=A4=E4=BB=A5=E8=8E=B7=E5=BE=97=
=E6=98=8E=E7=A1=AE=E4=B9=A6=E9=9D=A2=E6=84=8F=E8=A7=81=E3=80=82=E5=8F=91=E4=
=BB=B6=E4=BA=BA=E4=B8=8D=E5=AF=B9=E4=BB=BB=E4=BD=95=E5=8F=97=E6=96=87=E5=8C=
=96=E5=B7=AE=E5=BC=82=E5=BD=B1=E5=93=8D=E8=80=8C=E5=AF=BC=E8=87=B4=E6=95=85=
=E6=84=8F=E6=88=96=E9=94=99=E8=AF=AF=E4=BD=BF=E7=94=A8=E8=AF=A5=E7=AD=89=E4=
=BF=A1=E6=81=AF=E6=89=80=E9=80=A0=E6=88=90=E7=9A=84=E4=BB=BB=E4=BD=95=E7=9B=
=B4=E6=8E=A5=E6=88=96=E9=97=B4=E6=8E=A5=E6=8D=9F=E5=AE=B3=E6=89=BF=E6=8B=85=
=E8=B4=A3=E4=BB=BB=E3=80=82
This e-mail and its attachments contain confidential information from OPPO,=
 which is intended only for the person or entity whose address is listed ab=
ove. Any use of the information contained herein in any way (including, but=
 not limited to, total or partial disclosure, reproduction, or disseminatio=
n) by persons other than the intended recipient(s) is prohibited. If you ar=
e not the intended recipient, please do not read, copy, distribute, or use =
this information. If you have received this transmission in error, please n=
otify the sender immediately by reply e-mail and then delete this message.
Electronic communications may contain computer viruses or other defects inh=
erently, may not be accurately and/or timely transmitted to other systems, =
or may be intercepted, modified ,delayed, deleted or interfered. OPPO shall=
 not be liable for any damages that arise or may arise from such matter and=
 reserves all rights in connection with the email.
Unless expressly stated, this e-mail and its attachments are provided witho=
ut any warranty, acceptance or promise of any kind in any country or region=
, nor constitute a formal confirmation or acceptance of any transaction or =
contract. The sender, together with its affiliates or any shareholder, dire=
ctor, officer, employee or any other person of any such institution (herein=
after referred to as "sender" or "OPPO") does not waive any rights and shal=
l not be liable for any damages that arise or may arise from the intentiona=
l or negligent use of such information.
Cultural Differences Disclosure: Due to global cultural differences, any re=
ply with only YES\OK or other simple words does not constitute any confirma=
tion or acceptance of any transaction or contract, please confirm with the =
sender again to ensure clear opinion in written form. The sender shall not =
be responsible for any direct or indirect damages resulting from the intent=
ional or misuse of such information.

