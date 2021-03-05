Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D4832E070
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 05:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhCEENl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Mar 2021 23:13:41 -0500
Received: from mail-bgr052100132104.outbound.protection.outlook.com ([52.100.132.104]:13457
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229458AbhCEENl (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Mar 2021 23:13:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtiRTyr/yNYrqXEwtwXYAUyTim279UMAqkrSPuf/b87CRJXY1TthNS762DHbPKfG2Q8ep+rgBZnVlsWWbaQpOmn4nXWO0E9A/g+PNr4SrvrQhM8NBcH5wAvWZWMQ61wEgr3S0yvQ8HEaycGrOWPLtPmYzW5fw8QrzpiW+lUGX0aEX0t2/NLDCkT1qBWuv2VoktT7jD4ZX7yf0had/Lj8x1wjeiVY8pkxcdt+0DlFSL85Fzfv3tA1qlihTA5OiE2D9BvovzPZQdd3+MdN1DCN0q2kaA/H/LdMRnL8/UgpnU8nX5pIucvPCK6LN8OQfaq2zru5RABKDdfxdRx80nWfSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEue8z/MZFPnMP7mM2eVbTVWx/pEhRGNYr1fU0aF22c=;
 b=gfgr09PT6o51wnYpJidWkPEfFbpekRWkBzuekvULs5qxE/xSKg8GXTIl5QcmyY4uP6w/ucPNmNuJKa9Lh0c+4NibXwDZmUrv9YH98kOZyNSen59X3UjWZDp+lyg3PIKbanqF1/I49MEYoJ7lcTB6ucJoQgK1Y8D18nUqMoPxXiiacTnI2+Zi7Mkm3YNyyydXVvugJ69huZd4P9M/oVQSqhySR4lRr7eSbpSPN7qR0Y4XjPmG5AK9fCDdp9MLccNHb0KkokcyX8/sPyFJEtHy3C60b2ScDltp6wWzPDCVdgK1HPPodDlC9eEup3sMpQtTqx29gOuzZqc1KOqp6NXtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MEue8z/MZFPnMP7mM2eVbTVWx/pEhRGNYr1fU0aF22c=;
 b=a7AcSfhpknVVt0SLy6JHb8fg/oy9CBkTsDHBxSplhV9T4cDZYc3QzFaxmXigYeI9sOrm5iQMrSu88PMeP5QOZcxMfr5kAwfEsgleEDrDlyDGtThaiE4OiJgePduSLd8yhNjsNuyF7h9obuc5FDFgRqd58b6hWB9pQkbqESRiY8k=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5693.namprd08.prod.outlook.com (2603:10b6:805:f8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.25; Fri, 5 Mar
 2021 04:13:40 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3890.028; Fri, 5 Mar 2021
 04:13:40 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 6/9] Input: iqs5xx - prevent interrupt storm during removal
Date:   Thu,  4 Mar 2021 22:12:33 -0600
Message-Id: <20210305041236.3489-7-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.90.243) by SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.9 via Frontend Transport; Fri, 5 Mar 2021 04:13:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 429625b5-256f-4e7c-617c-08d8df8d0e5e
X-MS-TrafficTypeDiagnostic: SN6PR08MB5693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5693F5C8CE42804A4311409AD3969@SN6PR08MB5693.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vHixWAtKlxy8fKgYJHgLiZVzCLPret+deEZs0jzRa81KfiD91pjzNpTQA2C/8MY5V2NEENMseXSOJ6IRV1nIWBxtq5d8DJE6TGNWivDCL1L7n+SeRHGhlWCqa/KgThQ2day6701l2Kbz3xdXWWI/fGycyf9i4pdqs93AgKW1CKaTzNyzXjysbbQrSiGwwLJ4SX6S1fFu7eOjjltF10dZ7SKooHxnWvKvuGzcAUXptV/deTJSgYq93dy28OBFotd/c9z3lWppfjA9LcHdDFlCAQypBe+0UXz+OekaBnCqiIyn3UAGRedfDikpTgE2JvRYiXDRz8VT4EwiSN/f/h9R3phDb/XGF97xKmjjHhyXdYU9PhR7wwWJSL66Tx9Xds62w1hSCJqLKToIe9gaNRlg9yGg1SIaSQWztJcqMBa1ITAoasM3p8OFd1YG/gJHXQzCxda6zSg9C0E/1NuVbf9f2sZcLyuURfINNX7yhqSsxuoZxruv5Ccy3qKZbQQmzQbaWgGy50GhQgMWTT3zysy9oHkh9HuvcNHSar8AFnd6Py7gOSeQntO6klyQw9UnGsvWqOjDPpmVV004dxthKtUUNjaveMzx9ybi0fIsfY9g7TLGHpEpE2zfk+LT9o4fTd+fwQoIc6cNOVshPL4JfxlDfxSIZ3JqbfIJBL0gU5bWNsA57mr67AIyOYfD4Ulb5tfctTspaLoNHDHjfuBSfJwtte2nF7aKwvdxLsfeClFg+ouY8FXUkDbffyLbKVxcksSMytRuza65XeHOk3VrTVSSp/DgJuUjVvjkcQ3T9/aa8KpmlosE3pAZMymj9lSBqx7tmbm6DVWkdcx+bNN1H0eJxfO5y8u/CuW3jkJZl58KO3ccaUBLx3O9ZLXqT6aSDfEXSfzjz1CuYF0nIJ17NXykMY3S72X46PpwXDL59BiqDyy57BxkDvxJ3NAGQZYjt6Y6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(396003)(366004)(136003)(376002)(346002)(39830400003)(16526019)(66476007)(8936002)(956004)(5660300002)(36756003)(2616005)(107886003)(6486002)(8676002)(66946007)(69590400012)(52116002)(508600001)(186003)(26005)(66556008)(6666004)(6512007)(83380400001)(86362001)(4326008)(2906002)(6506007)(1076003)(316002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RQlXIhn4MvJakEjWZK5sWs3d1KYChZXKhS13MgOCCp95WllZ/FDj8p7dA5uh?=
 =?us-ascii?Q?9ZLZwljUatpMBzE0YF2aG1zTvMyMhdxgeKzgniXTuE2yiL0ou+DRd0+xurok?=
 =?us-ascii?Q?qDsugtppBqA8d13QckHh2WBZyLSWbxngEVHSsW4u5CfEN+whbheXsuNZ0DaE?=
 =?us-ascii?Q?1fuIGUSeqUox1h+KSawbcL3+y2kfjJUWUDArOGpPoUc8ZMCETdX0LW4ARtGl?=
 =?us-ascii?Q?T84Nom2O89t0g8Qqjf9SjRcQMNXcTXmBQZduibNPBOXBLkMH+IfjxvMBZhEY?=
 =?us-ascii?Q?ELeTIsx66hMIxy538aVGZVynm2atW3hb1AWU8o0ffB2cGJVFbUIeaRI9XX9u?=
 =?us-ascii?Q?1iddyNtVg+/SY9FORn5Ff9kzH400tnTmwSEs6XSUNT9Azg7geww5gVDFAePc?=
 =?us-ascii?Q?zfknNR2K6hjysgLNghiG5KuYAo8jJOEwD+OpPNKisK/hSp6h93/W0Zb81sLz?=
 =?us-ascii?Q?Sm6WHfEHBfLooIcSCTRY2DoPcoNXtgNkj3jpiB6mW1YJqiq9IDqbxOzWDZIX?=
 =?us-ascii?Q?wS1EAO0+Jea3Y0PnuE0l/0egtOQvwAhDCcZmMfJJx3CMBcR7V/xuVKB56Knx?=
 =?us-ascii?Q?y0zap+EgLa/W2GXGq28F60PaHErARWR3cuFZbwl4eYU1uEvcihlHDeXBnrlc?=
 =?us-ascii?Q?RFPzSD4zT0X91ix0E7ZCGo4PB5+MSyGl4RTuM70U97IEUoL3zwg1sGAronGM?=
 =?us-ascii?Q?jj9Yjh0CKgxx9yvHzLoOuQ9i/96L0NXQocpgBLkSk5RZsSIXEKFzMFTbzc63?=
 =?us-ascii?Q?1Fo8ZlRFGEvrmzsYdxsLuzUF+HMjUCQSuC2n6yiHQs1OnbGsN7KbQJgen0rs?=
 =?us-ascii?Q?Xn7InvUDYX8/ozQmFX2YmvHIbrZ8iOxFMJD8VmsIBVuVjKOy8vz4ez5b7UIX?=
 =?us-ascii?Q?AYr2E0kG9MyTMsyAF44NXt0Uz5cPHgtUvSSZc47lGxLOYA3+xd8vD90LvX+I?=
 =?us-ascii?Q?1YRDCl/U5FL0vT6Z0pD7OPunkC2LIsRFL81qD74B5/+ec91BAokNKi1MeWBx?=
 =?us-ascii?Q?swn8a/fuMRybS+NOhpBxF4ncGTPOJGRZTvdPd9eQw/DG4yd2GBMX9bDj+0sL?=
 =?us-ascii?Q?Kq89krfaAuCA+a33O9BeFspY+EBXlxGLwNqiXh3QCfu+d/viVqXgYDBuQAKG?=
 =?us-ascii?Q?/gf3jLkBKNf9EPAzHC4gTLCg6kywoTQrUwT4QYZwNoK7QLPPSu6DxwhMVZLk?=
 =?us-ascii?Q?M5fzozC4C0YBJMLLI8KRjb8z4vWzhDxJ2/Y4ZBQSRQSKIeoHk16ZKmHOS7gk?=
 =?us-ascii?Q?bZByOuNHAkp61kdhDngPN4abq/4AlXurdBCnz5Ar81j0XH48ElvnAyNuhWPY?=
 =?us-ascii?Q?ZSrFD1Gj6hhJR8Tzoyt2GCaD?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 429625b5-256f-4e7c-617c-08d8df8d0e5e
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 04:13:39.8923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIaRkArvnVFS05acIR9H9ys0VkvMQD2+JgjTsfpJTKilh2+gk463dZznetRu3YG5WUQsTS+EfqHfFZ/3QdcTrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5693
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Unsolicited I2C communication causes the device to assert an interrupt; as
such the IRQ is disabled before any registers are written in iqs5xx_open()
and iqs5xx_close().

After the driver is unloaded, however, i2c_device_remove() sets the IRQ to
zero before any handlers may call input_close_device() while the device is
unregistered. This keeps iqs5xx_close() from disabling the IRQ, leading to
an interrupt storm during removal.

Placing input_register_device() in front of devm_request_threaded_irq() to
free the IRQ before iqs5xx_close() is called does not cover the case where
firmware is updated at the factory and the input device is registered well
after the driver has already probed.

The solution, therefore, is to remove the open and close callbacks as they
do not buy much in the first place. The device already starts in an active
state, then drops into a low-power mode based on activity.

As an added benefit, this change allows the 250-ms delay in initialization
to be removed as iqs5xx_open() no longer follows immediately. Instead, the
delay is replaced with a mere 50-us delay which allows the interrupt to be
deasserted before the handler is registered.

Signed-off-by: Jeff LaBundy <jeff@labundy.com>
---
 drivers/input/touchscreen/iqs5xx.c | 25 +------------------------
 1 file changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/input/touchscreen/iqs5xx.c b/drivers/input/touchscreen/iqs5xx.c
index a990c176abf7..350466ff6bbd 100644
--- a/drivers/input/touchscreen/iqs5xx.c
+++ b/drivers/input/touchscreen/iqs5xx.c
@@ -468,20 +468,6 @@ static int iqs5xx_set_state(struct i2c_client *client, u8 state)
 	return error2;
 }
 
-static int iqs5xx_open(struct input_dev *input)
-{
-	struct iqs5xx_private *iqs5xx = input_get_drvdata(input);
-
-	return iqs5xx_set_state(iqs5xx->client, IQS5XX_RESUME);
-}
-
-static void iqs5xx_close(struct input_dev *input)
-{
-	struct iqs5xx_private *iqs5xx = input_get_drvdata(input);
-
-	iqs5xx_set_state(iqs5xx->client, IQS5XX_SUSPEND);
-}
-
 static int iqs5xx_axis_init(struct i2c_client *client)
 {
 	struct iqs5xx_private *iqs5xx = i2c_get_clientdata(client);
@@ -497,10 +483,7 @@ static int iqs5xx_axis_init(struct i2c_client *client)
 
 		input->name = client->name;
 		input->id.bustype = BUS_I2C;
-		input->open = iqs5xx_open;
-		input->close = iqs5xx_close;
 
-		input_set_drvdata(input, iqs5xx);
 		iqs5xx->input = input;
 	}
 
@@ -622,13 +605,7 @@ static int iqs5xx_dev_init(struct i2c_client *client)
 
 	iqs5xx->dev_id_info = *dev_id_info;
 
-	/*
-	 * The following delay allows ATI to complete before the open and close
-	 * callbacks are free to elicit I2C communication. Any attempts to read
-	 * from or write to the device during this time may face extended clock
-	 * stretching and prompt the I2C controller to report an error.
-	 */
-	msleep(250);
+	usleep_range(50, 100);
 
 	return 0;
 }
-- 
2.17.1

