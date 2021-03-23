Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A454834555D
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 03:11:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhCWCLF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 22:11:05 -0400
Received: from mail-bgr052100131047.outbound.protection.outlook.com ([52.100.131.47]:49282
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230001AbhCWCKg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 22:10:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aHFuPIhUAlCRW7gY5DDpr/VjU8zg5Q8NGx4JzL5ewmhEy1ORSH+0HY1PWhbTUJBkqaRtYCyJPtU+4KVQGgxNMwg3RAViIY/uL1fqtXcB4+askMldAKHK3EZS+oJGpwJbBzWmTp5Joz04VACvh2LyuyiFIQMme2P186Og70f98gyW2zJofY8cIsjLANa3C/yQMLvIids8A0kFQtyoOtE2tTcr+eRfD8Og7W7JheC5MaVReRrUrx+Yeo3r2J4RPN8lCJe53x+EVUsmbqT9Sbbs6thN4IbMsM/wldOSwG+KDFMM/F+jv3DvmEU/cMY7VBUus+12cMD0hWW39c7SuBSDgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/oJltLfsLgrFaqK36SaYKcOpvYOjHrEdkY0++qn5aU=;
 b=gKeevjVJnQfIM/gxsC1m04ju1ZXcdYc9FZkgI5jtuxbESpZh1sApz0M0yUhOOe92iuG9W1K0bu5tUC5t0C4+4FVm7A1c9cXhXxMRSHXnisBvinhcXonlOJOK5U0ba9fo5Gfr5nOBzaDoDgDwro3MOWPIJeCWLoW4ZBnxSR/5fOpx4uastI6/4WlYEJOBdOygA6buqxi4zEMwLWdo2CgVSPxJzkh3hAJmbIKPtwFVTg7mpBnR8FwyVTYqBnj8xx2FkL9xGAEMCC2GbAH+wsFRFwzrGc/r4NXA8WYXbA/nxnuelKT8ubIRCQEVmVOv+t3w75CSVfO900qs1w8hWxTfWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/oJltLfsLgrFaqK36SaYKcOpvYOjHrEdkY0++qn5aU=;
 b=ZGXjd0a2neZmQZEUeVf93GV9nfovuBaEBuPtxwOWiNjXOgTdsmisOJinSfk3JkECJ1LZ2hTUlHkSwX8ZI31hcpIlBcsFKePVvGFaf88Phu+ToTl37iWshHgobqV0FSPdJz50CponQ8hQmY45BoPQh8Dkfc1B4+VIFIeNVmE4szU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SA2PR08MB6555.namprd08.prod.outlook.com (2603:10b6:806:111::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 02:10:29 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d443:cdc3:d44e:d1c8]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::d443:cdc3:d44e:d1c8%5]) with mapi id 15.20.3955.025; Tue, 23 Mar 2021
 02:10:29 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v3 1/2] Input: iqs5xx - make reset GPIO optional
Date:   Mon, 22 Mar 2021 21:10:05 -0500
Message-Id: <20210323021006.367-1-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR13CA0005.namprd13.prod.outlook.com
 (2603:10b6:806:21::10) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0005.namprd13.prod.outlook.com (2603:10b6:806:21::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.22 via Frontend Transport; Tue, 23 Mar 2021 02:10:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ec9f9bb-f232-4add-836f-08d8eda0d493
X-MS-TrafficTypeDiagnostic: SA2PR08MB6555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA2PR08MB65554326D3FE434BBB2114AFD3649@SA2PR08MB6555.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?URVD6lNYEssyHL8saTWJMLtM7gJ8GR7fXhBm9NbfCecrpnKFxkOjOhwmRiUU?=
 =?us-ascii?Q?EfTGre5J21xBPQ2vVA3xPsPkejraDTyK+8+qSj61/1iI1dn6epvH7ynuG3tX?=
 =?us-ascii?Q?YW165tXBGQcqwvK/l9yPvJQv2/SUBq0hUR4/Tl3s5Q5f6gJFxAB2bhkp4sRt?=
 =?us-ascii?Q?+3tT4aQXZ8/sWiexjzF4jWM9pb6cN7u+cJGecmUSzMoKqtkiXNi8/Nv+q+du?=
 =?us-ascii?Q?+l7R2TvRyINW72YyBmtCT48RkJ/4BdF6mgppxY6wyttZ7OAEDI+Z/EE/xiOu?=
 =?us-ascii?Q?j43Vq03O9AUIr5q5UcZYT6AVvPwt1Zp3wXjAs2Fb5j2hMK20WIsJuhtwAfWw?=
 =?us-ascii?Q?tRhRjgF5gcxxsvaQsTIf1DTBAIhhHb6yOtDSq5WjoQpaLpD7ALp5oeHAgQZ3?=
 =?us-ascii?Q?GsRkNayPKxaW65L9eC5Tqn3EKUhh8KR0Cg8nJGhTuB8gZrrTFva11Td4SVk9?=
 =?us-ascii?Q?juvdGZTnpSttq+VSupFtJHWsMqY6AZzjSqyc5WA0KLYrmVCDNnZrRCLVGshn?=
 =?us-ascii?Q?cB6Etq+zjN9t7KxLJvOFc/yYhxAXokQC+qT69ZcRRq34XezJRQv+XrDwTxzD?=
 =?us-ascii?Q?vv3sd/SLy3vQe6RTHP1XcUgpz1XWlK7Jke5XKHSR/okOyElujMFZr4cFZe2C?=
 =?us-ascii?Q?LOyTims+h/vrhLezl9GfCcfv+OhIGhLhDQYqR+ilmOz81BvoTu2lEBN3SoAA?=
 =?us-ascii?Q?NnpocZfVw7WCJJfc07VguJI30vxjbqf1puxCwNzzFwpQlNy8BGPVUK7qsugn?=
 =?us-ascii?Q?DhoX7utLyaX+91bP8ulapP7bim5+rsqZehojd7qEQPZ1dxv30fUMPJ6T+qqg?=
 =?us-ascii?Q?wCt8jRama2J42PhsXGmML5Jgv+cNs1Io1ZT7kxVysoegx953I11O8mVsYaiJ?=
 =?us-ascii?Q?GUZZNvrbuvlPSng0k6uuXmRB0xSZIkOu+Yt9K2o52x+ER9M3lU9V+z3ji4yY?=
 =?us-ascii?Q?nBeGkw/KPUXlM5IqtHE0zctc1OKR1vKM0+yG/D/t0isu0/srzPjTXefRACPg?=
 =?us-ascii?Q?DK1b?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(366004)(136003)(346002)(396003)(376002)(39830400003)(16526019)(38100700001)(6486002)(66946007)(86362001)(186003)(8676002)(66556008)(66476007)(8936002)(107886003)(1076003)(956004)(26005)(6506007)(4326008)(52116002)(83380400001)(478600001)(316002)(6666004)(69590400012)(5660300002)(36756003)(6512007)(2906002)(2616005)(42413003);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+rWwMGEyAimmMpUHCDYPD8W7KquvhJEv1l9ewbhzjVWKLuvCiOMYACmL0Qot?=
 =?us-ascii?Q?altyoCkjDjsA3Jy7vhlRGwedeWUz0LF5Czolh8EXWVU+Owdw85ksZ3xIQepf?=
 =?us-ascii?Q?MsoZy/JUV2QUEm6H2lYTH4OpM43eZNTAotILfmnCWWPRXjsczpnfD8nXCfIP?=
 =?us-ascii?Q?CcbRSjxDelkjbz1CCU9srs75QxQKwZbEbbf3SXv4XnalcvUvievLzaGzYzrU?=
 =?us-ascii?Q?8+sw6Ik2kVo+idAQQbu0cGGoVZ/ldVNGfLjHF/3XhVa7THR9hYRP0Iccwfhr?=
 =?us-ascii?Q?6PD12jluBGHGdltzwrS/jAti2Nr6l7zpUtEW5AJS5R7ikQ4B0gd/edJWaGsd?=
 =?us-ascii?Q?gU6Cb1kZD6ZZc6UH1tFDkJZR4mLWX6a4M2xy3xnb8DXjY9EXP+XzVDpqLlu/?=
 =?us-ascii?Q?n01qZjBl4UkCRVFuY4tufVI322ZBKzRh8Ccopw8gBMjTmjX7sBc5xx/PkFF/?=
 =?us-ascii?Q?bEgTL7VprfY/Z4yIAYfNolFGnQzwKwHoIjJRus/OXo8TG3mkVT9TFC5LXQZG?=
 =?us-ascii?Q?FFTeyqKF9jAibrMd0Y3bD0f1nhIM5YjUYq0NEQiuSdhl2uyWLpRCoGMUcHQp?=
 =?us-ascii?Q?YEFOF4vGKXje2Ne1TjnAPhn2ZDuR94E1x3u+7xZKyqn+vhyOUK/MnZpIdZno?=
 =?us-ascii?Q?MM80lVTiVw/1Cd1tHYHU8P7cU9xWKh0ucb4tiS4kzAKbZvq0Y2ZVTlYbD9Qq?=
 =?us-ascii?Q?EsuGzKfQivHL+uk3HQSpXwrRJR8G7hZE0iSMhmR9N09pvNRYj7DvLZoaApyR?=
 =?us-ascii?Q?ODxUOGmCE/JBWLbaNU80HID1isXC4p0+GUYfOhFTwyQXwcakzbGaVu5UI5mO?=
 =?us-ascii?Q?eHv4MYErI5KY/ACe5OuTvt0hWjpX3jdrPEJzG+5g1fYZUbAbain7Cx0eqruI?=
 =?us-ascii?Q?mBtRFQUTFxghkkssxpweHNT1AYi8Waw/kRqRI7vJMD6O9uBTY489578VRzVZ?=
 =?us-ascii?Q?LY5kSjth1YaHDhqQ2LttKXvkkZWpVmoY3wE0MV1KwX3XVZPvgAuXyuIkiEKf?=
 =?us-ascii?Q?tVoRaI0U6PpvGopXGG4+NdTB0b+CDpPsWBsFH9TUlahLDzP5GOLfLhb8jmnj?=
 =?us-ascii?Q?+c0ZIlNIQgFcRgkgn7crjl+fgFTUKBDMss8TCwlDKZ+60/G4elFgC5pXNhZq?=
 =?us-ascii?Q?/J4RmJMDNp1hVwnUQCZoNghjT+RvxZBvJZnz0B+IvEFqQWiCNS4oi1Gzq9m4?=
 =?us-ascii?Q?fRuCf0zyEnFjACijaygm3mu3Pxifwbv9DnDY1hq9X4CnG935JJ4NLXqZRd84?=
 =?us-ascii?Q?0MFQqTbFmOA8rHk6QMaVZCZblFfxqIWFru2VdHAySrON3cmPO6dkHg+5aoFS?=
 =?us-ascii?Q?Y68U6A0U2rPBuH0rTW58hE8N?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec9f9bb-f232-4add-836f-08d8eda0d493
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 02:10:29.1381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /FEk1ZPZjvT/fy95OUR+DJdjqzNKxSJ388epobYl5PqjcLT6xnxv5IkfabADPFgpZ6ZECS8zk16h/ms83UxQ0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR08MB6555
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device's hardware reset pin is only required if the platform
must be able to update the device's firmware.

As such, demote the reset GPIO to optional in support of devices
that ship with pre-programmed firmware and don't route the reset
pin back to the SoC.

In that case, the 'fw_file' attribute is hidden because there is
no way to open the bootloader. The logic is extended to the case
in which the device does not advertise bootloader support in the
first place.

Last but not least, remove the hardware reset performed at probe
because there is no reason to reset the device manually. A power
on reset function already ensures a clean reset at start-up.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
Changes in v3:
 - Added iqs5xx_attr_is_visible() in place of conditionally registering
   one of two attribute groups

Changes in v2:
 - None

 drivers/input/touchscreen/iqs5xx.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index a990c176abf7..b3fa71213d60 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -835,9 +835,6 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 	int error, error_init = 0;
 	u8 *pmap;

-	if (iqs5xx->dev_id_info.bl_status == IQS5XX_BL_STATUS_NONE)
-		return -EPERM;
-
 	pmap = kzalloc(IQS5XX_PMAP_LEN, GFP_KERNEL);
 	if (!pmap)
 		return -ENOMEM;
@@ -963,7 +960,22 @@ static struct attribute *iqs5xx_attrs[] = {
 	NULL,
 };

+static umode_t iqs5xx_attr_is_visible(struct kobject *kobj,
+				      struct attribute *attr, int i)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_fw_file.attr &&
+	    (iqs5xx->dev_id_info.bl_status == IQS5XX_BL_STATUS_NONE ||
+	    !iqs5xx->reset_gpio))
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group iqs5xx_attr_group = {
+	.is_visible = iqs5xx_attr_is_visible,
 	.attrs = iqs5xx_attrs,
 };

@@ -1020,8 +1032,8 @@ static int iqs5xx_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, iqs5xx);
 	iqs5xx->client = client;

-	iqs5xx->reset_gpio = devm_gpiod_get(&client->dev,
-					    "reset", GPIOD_OUT_LOW);
+	iqs5xx->reset_gpio = devm_gpiod_get_optional(&client->dev,
+						     "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(iqs5xx->reset_gpio)) {
 		error = PTR_ERR(iqs5xx->reset_gpio);
 		dev_err(&client->dev, "Failed to request GPIO: %d\n", error);
@@ -1030,9 +1042,6 @@ static int iqs5xx_probe(struct i2c_client *client,

 	mutex_init(&iqs5xx->lock);

-	iqs5xx_reset(client);
-	usleep_range(10000, 10100);
-
 	error = iqs5xx_dev_init(client);
 	if (error)
 		return error;
--
2.17.1

