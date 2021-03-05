Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDC332E072
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhCEENs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:48 -0500
Received: from mail-bgr052100133034.outbound.protection.outlook.com ([52.100.133.34]:26041
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEENs (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fW6b1OU59EmvJ9WuipPjg+2boct15Rb4YGuBBiMeXgDVW+JRgOSDFGWr0LXYG5YI1K382gaqNgHupjGJkBhrWSCH2EkCGbLf6GqOzoWA8xLfZlcJ29TpM7cM+veaoRaBH/EBkJIPNmDVCMsByIoXN7SwtCEkL+Tu9ao1m5VvQwKq07S1f4oEfQd4u53B0CqZwiHEvwBnMnfJyX9HFTAE7y4uFPnk98frAB/EmZZQivbWAoXQoYabNMgMRnjEwUSQB1IhCRR4g5PHFfanLkXwd2pItXw7vh/Pgs5zNYTlfR5anXe+0N3Pax0OPToGqMxdWHjSAuwEIytz+PLornpVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyS+3efpQ29EBojVtckYVH8803f3RS0bmp0dmVuQ+xU=;
 b=RsToDmEqTFvBlzyxBwC1AbEuahEaNgZ/JnD4XwE6mEkRHsYXCOYP715WYLTHrMee45Z6nFER2NCmXkqk/LS1kLJRCFYRW0bY9I2M30gCeJyKivM65DYwuKq4snjc1jprQqGrnv7WiEcT1NeBlJAyHv/fyh2DiifjZG6yMis9O5kdFj95Cro+jluHWKAP26WSQbyyeycMJFluZ21Ldy5ujo2SB4e1KVC/7wJXyEEUEEHBJ1EQ2tD4pklSvrzXNyYL4H9uwe9AUWONTDc8zJ4XimLWGLEM2s+mN/ntdGPnYTv9Nw+QufnhBUS/BTsRaNCRBKbXMoc1Ima+a/Cr54WIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nyS+3efpQ29EBojVtckYVH8803f3RS0bmp0dmVuQ+xU=;
 b=Z1PXDvBf/xIpH4Lu+KWGHdfxtha+MOmLAg90h1/uYVzLW8gaMnUtFfjIxhnDqrukSeeozRjZbi9zMAd8p+Qz7ZN1JwOwIrTJ8v82BHoUTV2r2B6ao+MYxsf3/1gIHMISdjn7g34h0OP3HmB0wkiuyTOEReZ8gIqU3eLtaPkkMHw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5693.namprd08.prod.outlook.com (2603:10b6:805:f8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Fri, 5 Mar
 2021 04:13:47 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:47 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 7/9] Input: iqs5xx - suspend or resume regardless of users
Date:   Thu,  4 Mar 2021 22:12:34 -0600
Message-Id: <20210305041236.3489-8-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2154918a-3ad6-470b-4425-08d8df8d12b6
X-MS-TrafficTypeDiagnostic: SN6PR08MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB56932CCE920EA006B8ED273FD3969@SN6PR08MB5693.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMQWh/nP08fVvAWW9SjSQFmHthUTKFKoJzqzv7f4yiVqBH5VU8lsfgy7iLQFo2mrsRXSpC+ZZFdiNFWDFVtQv2rE4Av4+FUz8TQAK0DDKMsgH6Bs4PNOETamjxQ2oUWZvO1FV26Oso2pJNPdpKUIom6bYxP/cS1ej29AiYQvCUrR/ukzI8ddXViwzmZzKFpvyLgcxFvsvs4UXWUSNiIBSKjCc1IHTojAdy9RABXDh/TFMpriPrhHHSpFvTBqeQUYtu0mQ4/e0mOe0rbY+NB1p1C0000ywBZ4JTMDNBKlwhtjM05zHNaSqesQM6aazd8qnfjp+QsZBOu7T0baoRc1oxa6w+bwsXrTGxGW77XMrKBtTBfkFiwHNMflh6+GgYWJacjFWLbEdMd+f8lBUYCmis8J3NFevflKgGAjeukLPVml92routmzaYRg/hpN6RGPAgAAxc9sNfy5jqDcMjeuCgXNEZ/IrEC63c4txd6MymRJW7Z0zddGQ9/zSPeH7jllFbz95kWzR0XBZ/MQk+FO/a0OGvW6BhQpNi2q1cjAustYQPwHP0htShwOKHKfFOnAPbF5/32IIqXrpjDIi5TCZmKMMBPfiBYpewyHxleE6EKpN09RRpuqqSkJOiXWhTa4aQvjyjvER5iRZklZyQn7u62k+JW0FMZs04sbNFdfFxZCfyLQiVXmzRAuuOpspPEaoXOF+8NygE2oDLQAjXrjL83d4RCKifHBJfOGCy46e8iaxqkUKD5GVJAi38AaC9cGo9JbObKLawDlddB1C6lJtLjVr+t+5qP3EnSwUdECr7HU6rqep35QbmhXJZQ+Z7dwrNOV78AT1+pZUVXh9PtZRHhr6wcSwSRx21GR+T9Ghmbec8GxowXQ/BVbOH1Xn3W1Xgz5guJCQ3aNxUOtmonaZxN3yKn4hInh/bzdf3sKmY0gqqM1IzzdRCoKzP5HPbXa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(366004)(136003)(376002)(346002)(39830400003)(16526019)(66476007)(8936002)(956004)(5660300002)(36756003)(2616005)(107886003)(6486002)(8676002)(66946007)(69590400012)(52116002)(508600001)(186003)(26005)(66556008)(6666004)(6512007)(83380400001)(86362001)(4326008)(2906002)(6506007)(15650500001)(1076003)(316002)(42413003)(26730200005);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HtIMoiKHGrXpmdsopG88ybTa7IixZ8QS0lGJ9BYf8HVWa5xfbsuzi8k0dMiH?=
 =?us-ascii?Q?V6hn73KZtv3ARBzX5AIhcm81f1f2NrUjSJEDOxPsObcpC3AucBKJs8pnen8F?=
 =?us-ascii?Q?/btYrN6cjGPGh4F02FnSY/RUhLaaX6VulU5jUbDGlEMpgj9WsJBQMesMbdlK?=
 =?us-ascii?Q?zHpvOPvd6/u8tP9xuiR7kcTDkwmwWEf2Y+cDpJyIEZ++IF/PREvZi1946Evm?=
 =?us-ascii?Q?k0Q9z6nUeCGIcf9BPiZK3nZlqckK2Q2JpsIcNzvv0q9CNravh1vfACZHd9lC?=
 =?us-ascii?Q?MbZnom4JOjegQp7g6u+Y6fcIP2HXMhB/AwRuRyAqhHOOdsNHZlapOmZklBT0?=
 =?us-ascii?Q?laagcbzBSsUL9YArgvvnQ3KatsPk8NF7l78oj2GgvepP0W3Go6LfHGLDNsWg?=
 =?us-ascii?Q?Ft7EbuqQcDa5KigC++Kfm25qWh4rjINfAZryr1L44eRpqaCRyx8GgMz6FQmS?=
 =?us-ascii?Q?PLqkn2xNTb5A0RUlJPOQlzcUlxx1B8JQ7PjfesFnr+Kqn2TH3loamhjvW81/?=
 =?us-ascii?Q?8y25BOqGXjv75yCIAvdcEMN3nS7hkvdWVkmD1QT6hCnxLmj4xLlJFN3LFkow?=
 =?us-ascii?Q?EmFnQKAO1dbNMHmg/NaEBNWhEHLIMvUmUuD5iNVzZUz2E7j9u7JPza9gPgXz?=
 =?us-ascii?Q?2dL+zrxE5SHQsE1Ae8Cu32FUtnslHUKbMNRj3DFdKarJdimwY+pNfSckOsA2?=
 =?us-ascii?Q?zQCkJmz6EMAnQxXkTVS9Wp1bMk4wjEKKz6jIn0ySI4VSecG01m6sWAbE5+sU?=
 =?us-ascii?Q?EeuYiPZ26LIr+vH1vt6Tsxk804ZPr2d/fIi8tcJmW/ehDxTGAfZRR/qJYAw9?=
 =?us-ascii?Q?4zWuBhlV8dqvRigrpc1YFz91JeDlOhBh0nWv81lAjAkE2jfJaJFZ/4J/vGvd?=
 =?us-ascii?Q?bxyaVaQwPM90VZcVvYuBH0I0Q3uNjPbxuaccgnyt1welGw2LjplL+smqgV2V?=
 =?us-ascii?Q?ROd+IyXML54EdYPUGPYxPcJTD6ZeJz9hcgw9Hx1Zcihi7twBSu+1ft8eZjKL?=
 =?us-ascii?Q?trqFs6bewIQjK1+s2LmZgbH9tl3xs2yZ6SyVNg/8Pk/1PUrV7UjMAuHdSzHO?=
 =?us-ascii?Q?To8rDJatN91g3vmOiZd4b93EmHPrv5sdcuTJ66oJAFt2tDI7NtbAOIyrGqzn?=
 =?us-ascii?Q?gkkz7VO8mPLcuD1TUeHcejxSBylgSrRjfWYii3ua3IvpGX9hTuBV4f5uuMk9?=
 =?us-ascii?Q?EQYCUBI6bxa+uA3Z42yUARbX6V1WXFsy618Ea6K94NtPbKCctTMNVpC/YjjJ?=
 =?us-ascii?Q?1cc/tWQ9n1CeJQEe0Nb2AuTWyo8I+ocyI5+JYvwVhnEpsvoSNkSNuqkXIwuA?=
 =?us-ascii?Q?ljoTx4mBor1cY6pvSfJ+movt?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2154918a-3ad6-470b-4425-08d8df8d12b6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:47.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DyvuGgBKrjrfZcmfPORgqulkiEFASZco1AYG0nE3aKhO1f3z0YeGO7kGLU1tqKXunLgePN2dKKRMjV5OomEv6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5693
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The device should be allowed to enter its lowest-power state during
suspend, even if there are no users. Therefore, drop the check from
iqs5xx_suspend().

It follows that the same check must be removed from iqs5xx_resume()
since users are not guaranteed to be present upon resume, and there
would be no way to power the device back up.

This change makes iqs5xx_suspend() and iqs5xx_resume() both smaller
and easier to follow. And because these are the only functions that
call iqs5xx_set_state() now, call device_may_wakeup() from there to
avoid duplicate logic.

While here, collapse the return path for iqs5xx_set_state() to save
a few lines of code.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 41 +++---------------------------
 1 file changed, 4 insertions(+), 37 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index 350466ff6bbd..180d2618d8c6 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -39,9 +39,7 @@
 
 #define IQS5XX_SHOW_RESET	BIT(7)
 #define IQS5XX_ACK_RESET	BIT(7)
-
 #define IQS5XX_SUSPEND		BIT(0)
-#define IQS5XX_RESUME		0
 
 #define IQS5XX_SETUP_COMPLETE	BIT(6)
 #define IQS5XX_WDT		BIT(5)
@@ -442,7 +440,7 @@ static int iqs5xx_set_state(struct i2c_client *client, u8 state)
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
 	int error1, error2;
 
-	if (!iqs5xx->dev_id_info.bl_status)
+	if (!iqs5xx->dev_id_info.bl_status || device_may_wakeup(&client->dev))
 		return 0;
 
 	mutex_lock(&iqs5xx->lock);
@@ -462,10 +460,7 @@ static int iqs5xx_set_state(struct i2c_client *client, u8 state)
 
 	mutex_unlock(&iqs5xx->lock);
 
-	if (error1)
-		return error1;
-
-	return error2;
+	return error1 ? : error2;
 }
 
 static int iqs5xx_axis_init(struct i2c_client *client)
@@ -946,40 +941,12 @@ static const struct attribute_group iqs5xx_attr_group = {
 
 static int __maybe_unused iqs5xx_suspend(struct device *dev)
 {
-	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
-	struct input_dev *input = iqs5xx->input;
-	int error = 0;
-
-	if (!input || device_may_wakeup(dev))
-		return error;
-
-	mutex_lock(&input->mutex);
-
-	if (input_device_enabled(input))
-		error = iqs5xx_set_state(iqs5xx->client, IQS5XX_SUSPEND);
-
-	mutex_unlock(&input->mutex);
-
-	return error;
+	return iqs5xx_set_state(to_i2c_client(dev), IQS5XX_SUSPEND);
 }
 
 static int __maybe_unused iqs5xx_resume(struct device *dev)
 {
-	struct iqs5xx_private *iqs5xx = dev_get_drvdata(dev);
-	struct input_dev *input = iqs5xx->input;
-	int error = 0;
-
-	if (!input || device_may_wakeup(dev))
-		return error;
-
-	mutex_lock(&input->mutex);
-
-	if (input_device_enabled(input))
-		error = iqs5xx_set_state(iqs5xx->client, IQS5XX_RESUME);
-
-	mutex_unlock(&input->mutex);
-
-	return error;
+	return iqs5xx_set_state(to_i2c_client(dev), 0);
 }
 
 static SIMPLE_DEV_PM_OPS(iqs5xx_pm, iqs5xx_suspend, iqs5xx_resume);
-- 
2.17.1

