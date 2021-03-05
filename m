Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BFC032E075
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCEENz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:55 -0500
Received: from mail-bgr052100133026.outbound.protection.outlook.com ([52.100.133.26]:22692
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEENz (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKyxH83mcF3lobwuqAT54eR7fxz9zmi3ZrUui6g+n1Am0ARqBUdag0s1MdbvCy7Bg7MT1GgtfuVPbE/nO2yXJ9oLCSF+kkbPY3tvU2CDLnZTvrplPMltD7CpzK4MtzETxmNbD4uLkxmrZwaQgY2tTIxvXBhW3vZQwCS+1otxN0GcolCD6MeD9jpcMkLC5MmWkqtI15d2FlxI80wrEfFlZQYMrpN+ekGvkrD0IDOnuawsh7Gz/bzdeCx5yllzwgxjgcFp/kVQkdHa1OqPRXRlXMNHdpVybljE6o5eof4X8GvdJYQxbKn9iXwT/knFNiSSzGd6HV1izRruK+xN2k6rkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJDYv6N3rpaTwIGh1gLhK4v+CKjLpoJhNRXzEpTgNP8=;
 b=EozDB4XzDZXVJyB2QzaZGnDz65/yEEiUEWhZKcYaCkR0ejrTtCC89vrtATGcxF3CQw6zGjgzZqUPzznL14L0/Ra2dUdf+3UhO8u+DF5NbFQ+n6SbIESo61iFSQgenHDGMED0en1YTdQcEDhrRs8bwSD1LOxNgRKlrT4KbkExOEfFT7vJlgmdMP2pmOYXfHOmZwIJFR7QQ8oyvBw1Q8Zg6PVGnB2Evot8IvKr/e6qLcvztegerp1CHWJmb0roRH3eNXK0aCtoVOVEMqE6GRlxwsVJEoN29wKfctpkEN+ElQ5TR+4ajXe1IMTKjNWKwEu+Itk7LMH2hrFrAoZIjhbEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iJDYv6N3rpaTwIGh1gLhK4v+CKjLpoJhNRXzEpTgNP8=;
 b=HrFxw0dYoPxLU5SQawxGDLXiVregKw2nTX6ZPbM6Wo5szrhZgAUXeD9j8fdz8MaZsi3ZUrM9uOjFyyCm1S8IB2J4hetJ4VrCRojzJY7o0GEs3GRTxqWhE7GAGdEMNVnQcblduKYLotjaTH9hr09SgmPXHmTyJCcE8fdjMc32kms=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5693.namprd08.prod.outlook.com (2603:10b6:805:f8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Fri, 5 Mar
 2021 04:13:54 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:54 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 8/9] Input: iqs5xx - make reset GPIO optional
Date:   Thu,  4 Mar 2021 22:12:35 -0600
Message-Id: <20210305041236.3489-9-jeff@labundy.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305041236.3489-1-jeff@labundy.com>
References: <20210305041236.3489-1-jeff@labundy.com>
Content-Type: text/plain
X-Originating-IP: [136.49.90.243]
X-ClientProxiedBy: SA9PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:806:23::31) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 66524b08-154b-4746-eb1b-08d8df8d16bf
X-MS-TrafficTypeDiagnostic: SN6PR08MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56937384F86AEB1CEAE33943D3969@SN6PR08MB5693.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N1TyW8hsl5c6IlibuMH8Ghqz+sKurgIyBBY9MtM7+29OdyKDi4EzIUdI1YIW0YsYzixhKxMXu9I8QzbtSGG4XCp+Wl+IgADoBcRLGtH6AstOdQS9kENYRFJ8Yh9eSGCOEefQNSxT+0PDMx1hrzuxS+NKx6QP/WeDlTGSFFP0V36eVzGTXvS54OBj+YrRaQIpu80ZrKW2SmohxvAjqJKxYIeQthWJ4btwdacqCI4zjBsc2TUZ2zqgHje5Vo8VF/J7Sm8H0+H4/Ox/R49Ac0Udp3e99mX5tsVd/sIUWeCsuGFnTef2WE8KddOve2eVS9diLqpfzALW5jQ86AGkdUEf6DEOeT92LH0D6ut25yAXBhExiPXC5nCd82XwCW31BuQuxq/mQKdkYNPW1KywCGI/muFV00/OdGoUBTAMCwPblnc3DoJhhuqcD+xPeEk/UF74krcskGjXw1lsRP9reotwCGfc4S3RV7Z7IQ5sz6riB1eCZMQzi7s6Y5GI72obQZszKeMy8QVkA946/a5vyKgbHqwXx3u4digZ85ViI9zQIIZNZmnsmFqjJOfNWE0UccKB4F9ixiFiEpqBqlyGqgVRxWROM4xDBtr+aTTy8g7a5IvVd5FvJNLmsFeaN4GM0LztFg52ZiO1Ziww/KlLmyIq+FxIpyIMuPiqK/r48sLIm7uczOk36tIw1l7GmlFqaJ0g6SbIW7QwFaf31hn/qtPP5baCKcBFqij4s/YMIcRJiN+k4SIeozT68dFj3CjtdNxgRIEJsLuvGv4CdhYI6GWUN6764dvvDdkaQX7hmEn0Cx6BLQRJuLQebiNxtYDVIO5eG6bcL2GSjxJgrkZKpRsdy+KMIT3PLZO+IARyOjUshHGemYdBdHlHp5nM0coRBzKdmdY7oElNFRlI++2PsgshIQG5C2DF4sVXQP3V2B25w3Ydg/qxhKmUpc9YnH9vGlA/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(366004)(136003)(376002)(346002)(39830400003)(16526019)(66476007)(8936002)(956004)(5660300002)(36756003)(2616005)(107886003)(6486002)(8676002)(66946007)(69590400012)(52116002)(508600001)(186003)(26005)(66556008)(6666004)(6512007)(83380400001)(86362001)(4326008)(2906002)(6506007)(1076003)(316002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?I/a3mgGzOTNZjOo80WEpuhQzjYQnTEe8B2MCRiN2us482C/AWhz570CmsCbz?=
 =?us-ascii?Q?t48uARG0+7ejHuow7fq/gQjicTMjU4fbXp0FrMcDuTcdMuM3O9NKSehDly3p?=
 =?us-ascii?Q?PlpOV1ibyQmWgy90OA9r2qbFFtJp6qDnSyPLIUkMNp97DsmQj+WCdXFqNrhr?=
 =?us-ascii?Q?eGfP/lI9Zl/3VhkJzZ/4w9QiFCfeV0qo99iGXXqmMISmx16IOBgfzkZOFFyf?=
 =?us-ascii?Q?WB5NaB702vII7xHY1zFu+iKfX0zg2BtJB1o/gm9+/yegQ8vgOY7ASlC8rEfX?=
 =?us-ascii?Q?PrlJHB2dwCPoOYTyJQaOOjG/J1GDhzwfn4GEecWlTnnor1axlDA2QLEAqOPi?=
 =?us-ascii?Q?rdXY2uKH9N8yOZR3kXGM/sG7WNlqPdO6oEQkxDGm3ETEfoiHdGB3ittXUcjn?=
 =?us-ascii?Q?rqOl8z4FLVqQMEpIvZXPkq8mvf5FH6vXpXbeqr5bO1tMhfxXocbsoDiKmn3u?=
 =?us-ascii?Q?0fVILWKfrcaUGQBTLVwg5Y8/yPyOWGbT0vohXB0uH9AqY1QJ0LAFUrVM+Ssa?=
 =?us-ascii?Q?VwDuJ6W9Dra8XYQqYEISYOUesxw3XAvwrfQi6qnss5aeSQsFApf9gp/mVl+x?=
 =?us-ascii?Q?cDs19ywet92NYvnSl/+2AkszpLOmpayUTjBWssypiLpTbUOJJgFBeiKzIDNH?=
 =?us-ascii?Q?/UQAUnacLSRxyVvGGXjZe7QF04K9T1vP2a5FpO5qlp/Pnsu6T2djyQ3mWFd7?=
 =?us-ascii?Q?VkcAEieuO6qbdFhemxoVB70Hdf0u+ARARYr+PUAeF2BGnCRRvgjYfeWXCv6V?=
 =?us-ascii?Q?S8sKrOb2N6X/WIkLWnxcC93+8AzelcEH+4mCmqte4Z/iDnxQXZb0+ZRgTQzT?=
 =?us-ascii?Q?3YGTTY3BGdEaxJ7LZ4/OrSu3HCXGUv8RYe+dCwHyNQkvPzMAeiMqXMizQ6G1?=
 =?us-ascii?Q?22bDNUUF/lkE0Y9kgAGyOyRD6hAUqSYuau/2/ZfvvSnkfH2WlZyUfkR57WQG?=
 =?us-ascii?Q?ddSsQeCZaxtTNC7BI9KZg9coThwx8RPNhOLUJBb77UB9kBBVObGsevD2cFuu?=
 =?us-ascii?Q?6au/b+66NHJUZ6VCPLonP+aUcBEnexJqXvOv63P6eve9lWUsZ5vc8poWP+oD?=
 =?us-ascii?Q?wiYDrdGq+xsMhbNzOJwGoatNkjd5YuRZnSECU33SS+vIHMx7S9jhcN1xT4Ij?=
 =?us-ascii?Q?nVPatYZMaJb3EuYrJVaUCWw67mirKjnytR+7nX2dqYSWahceZrYBxDROpA4c?=
 =?us-ascii?Q?UMzKSg0J324myEkmxV9eT5AzqccSMR/HDgZiqakNwf3L3HXr7yiRWkl2hPCY?=
 =?us-ascii?Q?g5tMH9oG4FC+/vO6P5XLcMNbcxK3xshgRLkJMbdB2CwNpS2niwoTOS94scr7?=
 =?us-ascii?Q?pxv0gDa3N0mFJ1iww2hUlfZp?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66524b08-154b-4746-eb1b-08d8df8d16bf
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:53.9673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6YspTwjCQ/F5J8ZarhKwPaHCum+oqWem7RCV10iOMNpm/E/NvbLva3QDihlRYRIw5ZPj6JQJLHqD+ZJOa0WUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5693
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

