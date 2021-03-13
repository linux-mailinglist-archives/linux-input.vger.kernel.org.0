Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CA033A043
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhCMTOI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:14:08 -0500
Received: from mail-bn7nam10hn2225.outbound.protection.outlook.com ([52.100.155.225]:20447
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234350AbhCMTNp (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FhiUq4QiW/kgzChk6Oul4nvtUfn8o+adOcioMz4JB9e0pP/UDEJVX0rzckH7mCk7H5n11TZTJDi4pARYu1wiONrxmKtgl2eS32AYcZXKYQVl5wuWgOlWPCdW0e/8VLMNwvqfK26wPG5BbWXPDVcaGuJDHiejWfJjOYe+/RKIYwXkSq3Xi3cpZ1p4evtIhb6dqe1ZW3QFFLYo4tCAfB6YFDb8jOdWyedtttFAJI3jkIWoKWAxh/hSXc/KOMESlYA6xzD2IN1asar8QmmW/KiafbOG+SqV+Kq9kvA7T60RmJA9SJViFM/AgD3NjXL3U3fkoEEPqV5qWqU9TkGBCrM7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gocg3/x/DJ74NRsA1yn/cgqw0WvcTILg6a14pOJk3aA=;
 b=Nse8qi55uK79V9v3iXlmb18n3w9Vl1iB0aGdPh0tTzRdILPlAMTQdAyWWUIJOvnVX+eBhtnAyRVTPW20Aqly/7WSfj//XGE4U+iFkVzNdeGspBPQVdDNhlrV1Aw9yA/80EyQiF4kvDDTD4bhrXLu7zZ+wg4pU8Z2gSQVNW4fpiBU/Fuw0/OT9Cbz+gZMMiSPOJoVMyE0zdaM+5X64R0Vd/phq0BsW4h8mD8KtQ1NhKD0F97Bx1EuRj7BvlzPkhqTqJZ0VAXZA1cbKkF9PWCi4PTIjptKmNjgb94BNL8hOI673hw5NLtbuszvTDAqwRONvh8Xm58Hi6h9kQosDmXe3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gocg3/x/DJ74NRsA1yn/cgqw0WvcTILg6a14pOJk3aA=;
 b=rC7CiJdrmyuPb3cd+6ifZDwLht1DafxwsfHoRdYsUlFW0bvjn8dCsFD5YuUl7JWQ+O+IMlC5JywQDtiq9KMSl8DbX4KelEZbsiRB5OLGXOW6uKVcGfBkTR7VcIgtVooRbQb+HGBFjw3hJ4us1PY4mxHY/9MVq6ObuasJnJsVACI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:43 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:43 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 8/9] Input: iqs5xx - make reset GPIO optional
Date:   Sat, 13 Mar 2021 13:12:35 -0600
Message-Id: <20210313191236.4366-9-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210313191236.4366-1-jeff@labundy.com>
References: <20210313191236.4366-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SN7PR04CA0231.namprd04.prod.outlook.com
 (2603:10b6:806:127::26) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15d208bc-9cee-486f-47fe-08d8e6541e7b
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB569489BA9A7976BC6EF8D8ABD36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gNxtcz9/l18kyeP9D5VYAtj0dnsYqtNolnzKEASETKlws0+SYV69keiMYJzs?=
 =?us-ascii?Q?vtwp6Eax3HcTVRu38WaPLfpDcKnTelZmFrAO89LuWYDJDBGOlxoFpc/m7ZMs?=
 =?us-ascii?Q?zlZoI20IZk3CrJiiC1Nly86wc2cas8k/XXi498gbZwp7SOVp/4sIGbn4fvnU?=
 =?us-ascii?Q?HjLe67xIg2Z7HCxwuCucwxZ5z9ZBcQDGizR1aE2wdv3khOcTdSONhrZ07Yj/?=
 =?us-ascii?Q?VuC75t8arEiY4KsUFqXFtNMBug40pXb9MXM7VlDAo5a4VmOPk18MDHb7CpPZ?=
 =?us-ascii?Q?9rgig/g5dyRMi3uCe4FheZhmw2UHJrTUzno3uBqGjpY//TjJKTPBA4lxyYOQ?=
 =?us-ascii?Q?UpbR+CDwkPQNx6jE+oZSPB+auuDZ66h33/8rqG8T4Z2O1Pw3C6Gdbcr+89Vn?=
 =?us-ascii?Q?2ka7vUggfZmSfjwYC2brd3uthajPB0ldzAreCJriJvhUTVxqtcvvc4NIL9UO?=
 =?us-ascii?Q?vguVyXN/sMWEHN/xO8R+lExeyjozq3U0w0SHI42bSm3z3VkPXHJ3tZ35ErqC?=
 =?us-ascii?Q?ei6htTXlNEPk60MKMn4mYC6uLTp7JXoJ4yqJWt88UW7+C8wuBzSLdgpWb7pC?=
 =?us-ascii?Q?cRerlry5rCV/S2PM/EyRRIaFdFvbtfqOJDWigvYO1K3SdgQHuhT6gmZ8S2l9?=
 =?us-ascii?Q?9+GNTHX04ccokP0Kq/hJtLQPq3G3XJjQ5H2QOfGM1s6SOYbEKy/FJxM+0ECh?=
 =?us-ascii?Q?tlCEAdivUTuF1osXF7itWxg1jyknMXh99xp/tAsnzTIrGyW1rlfe4oMqf36r?=
 =?us-ascii?Q?gqncYOyqp9H1ulhhzdAhh0b6TZl4sQhXUwu+QDy4WIuZGqSF96PqxZrFXYak?=
 =?us-ascii?Q?EkFbc8o9T0vae/6DaQZaE5mivH8/M/333eyKvnaZUnyrduZCLl1N20xIVq2h?=
 =?us-ascii?Q?iqTmISv8FtHGnfydKvBrdgoEDb4lPSCQRtkEbTbarIk2qITKoAF+1/oTD2bP?=
 =?us-ascii?Q?jMhi5bmfErp3QT0aBoj4Ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(6666004)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8PQY1iR7VHGj5g3bH4q83V3j0Fxq1+h/1GM27qeANuy2GsKU/iDXSmxo/cYW?=
 =?us-ascii?Q?endh9dSievO75v3BrEue82Nwq1stfayV4bS6LJZs0iKNKQmJ8bXPoGLPKXpZ?=
 =?us-ascii?Q?SACJ4i/Ty/2eLc8eV48MBZpj9nAjqk2FCl5+YUMCSFGRAu1sqqvDLciQp2Gd?=
 =?us-ascii?Q?72qlK9shG4Y2kCHacCLkgsTuqnLNgks89DBERosjp/AjviQJGlIlUyh4xEJl?=
 =?us-ascii?Q?XHXCKR4bcEoWEA834xWym6xnRpa1zcksZJoGQeDLweCr28RKgnYtHEQ+wr2s?=
 =?us-ascii?Q?Qf6t11/qPw/1U1xQjF5zdV/2hYWKthNRzEu6k4Mmc/vgTcIpLKOscXgT7xuZ?=
 =?us-ascii?Q?XZCIIeF4lYlLewi4ZV0W5q7for+u/wSpxvqh7rN73eEGlqHzXwalhJOp7VzA?=
 =?us-ascii?Q?857xqXmAMmgwk1t1AWjKAhOJuUqig1A1dAhbvqmUjhCs8lwoocgbDGYDZTX1?=
 =?us-ascii?Q?6Z620UNSbtur9N+nexfBVmmKC936q+iuvYX+aT3sEp/moVSd6ZKwCIWpZh0R?=
 =?us-ascii?Q?1kM9zqPtV03Dw9fNMLlRL+3TQjCFjvt1r/WGlbKjk4BSprBMqXJguIXjyTEo?=
 =?us-ascii?Q?DaW1cluOVZ3BEF40T+UmTIHnq8I0FU8DoQWJw8/3cGl0/XCW1NRANFRBBMcC?=
 =?us-ascii?Q?Lap0ZHun2CSZowvrHFV1uKxxMfNZj1bUYFX9+2TUo6VCL9BclErGkzzspqxo?=
 =?us-ascii?Q?pu8XkxE8e+D5imQ9VWqdk895KKEatqHhE9e/qMhPMuVqV0jwvOpd3HhQP0Qp?=
 =?us-ascii?Q?U+R8/94+At+kvFg9u5nEs6jHGmVOrXoNw8sTm0K6W4dAKEdlwF20qRaMCAbH?=
 =?us-ascii?Q?A2vzrOfMgfaaRkhqJ+UJbIoFxeyB59Zg/pr2GuVYsLyH/Jp50y7yg7NUP5jH?=
 =?us-ascii?Q?kDBeddkRBenE6roBt9yAvRuZCoOSsYkvz6ejQqhhKGNFI+KeiKkWFPvuqr9k?=
 =?us-ascii?Q?W8f4zDBO+8SNxD0Hp/iYnjlGhQUiGIS5vwc7KqhHe2VuWiBTyQFRMNEH00f3?=
 =?us-ascii?Q?yuhgVT5iZ5UWCe5/WCcovpLyZ1p1FTUeZ+d5kHb/TQLIEd1fzMVzO46llS6r?=
 =?us-ascii?Q?RqdpMSiNGJtGL6VELNth6T0zBRYdGaNmrj0sABeAXcGfqHggSqTMLg3nq/Lv?=
 =?us-ascii?Q?IPnILVpkGCypRUu9/iPavT1QP6bnUHKRF8l4snixWxohCShp0x8KdW3afPU0?=
 =?us-ascii?Q?GnPtU0Cq4QQJlJCwPDZRnOnZHsuMnEthOtPnjDZqmFeMD3FDwP1Hl4AMIfZe?=
 =?us-ascii?Q?qNRyYiHAI7JByUOdjUUs8AQM18UUMN9mjU7HsX6mS5ABEreCvMq3okZUiwsD?=
 =?us-ascii?Q?BZ19MH/admb7k89Ctu/73HrU?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d208bc-9cee-486f-47fe-08d8e6541e7b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:43.7291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2Pt/SUhohzN657hJb53oXDZFPOXuPho44ThNBjnKoUYckZGq1UWWx83w6JmnO0gZ/RC+560fKg9RghUMY2meg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
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
Changes in v2:
 - None

 drivers/input/touchscreen/iqs5xx.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 180d2618d8c6..6e53b455bfb9 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -807,9 +807,6 @@ static int iqs5xx_fw_file_write(struct i2c_client *client, const char *fw_file)
 	int error, error_init = 0;
 	u8 *pmap;

-	if (iqs5xx->dev_id_info.bl_status == IQS5XX_BL_STATUS_NONE)
-		return -EPERM;
-
 	pmap = kzalloc(IQS5XX_PMAP_LEN, GFP_KERNEL);
 	if (!pmap)
 		return -ENOMEM;
@@ -929,12 +926,21 @@ static ssize_t fw_info_show(struct device *dev,
 static DEVICE_ATTR_WO(fw_file);
 static DEVICE_ATTR_RO(fw_info);

-static struct attribute *iqs5xx_attrs[] = {
+static struct attribute *iqs5xx_attrs_bl[] = {
 	&dev_attr_fw_file.attr,
 	&dev_attr_fw_info.attr,
 	NULL,
 };

+static struct attribute *iqs5xx_attrs[] = {
+	&dev_attr_fw_info.attr,
+	NULL,
+};
+
+static const struct attribute_group iqs5xx_attr_group_bl = {
+	.attrs = iqs5xx_attrs_bl,
+};
+
 static const struct attribute_group iqs5xx_attr_group = {
 	.attrs = iqs5xx_attrs,
 };
@@ -954,6 +960,7 @@ static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
 static int iqs5xx_probe(struct i2c_client *client,
 			const struct i2c_device_id *id)
 {
+	const struct attribute_group *attr_group = &iqs5xx_attr_group;
 	struct iqs5xx_private *iqs5xx;
 	int error;

@@ -964,8 +971,8 @@ static int iqs5xx_probe(struct i2c_client *client,
 	i2c_set_clientdata(client, iqs5xx);
 	iqs5xx->client = client;

-	iqs5xx->reset_gpio = devm_gpiod_get(&client->dev,
-					    "reset", GPIOD_OUT_LOW);
+	iqs5xx->reset_gpio = devm_gpiod_get_optional(&client->dev,
+						     "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(iqs5xx->reset_gpio)) {
 		error = PTR_ERR(iqs5xx->reset_gpio);
 		dev_err(&client->dev, "Failed to request GPIO: %d\n", error);
@@ -974,9 +981,6 @@ static int iqs5xx_probe(struct i2c_client *client,

 	mutex_init(&iqs5xx->lock);

-	iqs5xx_reset(client);
-	usleep_range(10000, 10100);
-
 	error = iqs5xx_dev_init(client);
 	if (error)
 		return error;
@@ -989,7 +993,11 @@ static int iqs5xx_probe(struct i2c_client *client,
 		return error;
 	}

-	error = devm_device_add_group(&client->dev, &iqs5xx_attr_group);
+	if (iqs5xx->reset_gpio &&
+	    iqs5xx->dev_id_info.bl_status != IQS5XX_BL_STATUS_NONE)
+		attr_group = &iqs5xx_attr_group_bl;
+
+	error = devm_device_add_group(&client->dev, attr_group);
 	if (error) {
 		dev_err(&client->dev, "Failed to add attributes: %d\n", error);
 		return error;
--
2.17.1

