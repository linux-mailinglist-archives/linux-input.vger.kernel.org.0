Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950F933A03D
	for <lists+linux-input@lfdr.de>; Sat, 13 Mar 2021 20:14:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234336AbhCMTOH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 13 Mar 2021 14:14:07 -0500
Received: from mail-mw2nam10hn2240.outbound.protection.outlook.com ([52.100.157.240]:64481
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234347AbhCMTNe (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 13 Mar 2021 14:13:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYNS/tpvkaTwP+cH5x5deNj3uiRhj65VLfnJ1JYJw188WDe/p023XpupZzU6zijRmnUnK1wsHzDMsFBin9VSH4njfAid/80zYP16Gdb/ZAPc5xPN81nhtUnp3J8tqVF89Pkz5kIiKcCfRfVX1got43Q+2UG4KgEN6MXw789sD0E7DYc+3biCtIZqWRRfYN6ev77bCjIEv/kx5I0i3R4DOekO6FdyBM5FQFwZqp1V/dzbv4QP5/P4RFB6gfhxxkOTTKOGt1GGUEWvQF2P1iXWbcHQTDlkVzt9yIP+egH9ZVFWrpGveM3ol7dKG979HXmGTJjZjpl3itK2CPf+jzbNkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ2LiFms72e28yYHgrmNy80Gy/ygxtdSk/9SjF7A4Bc=;
 b=oB/X2fhk7FXryjrs6uLhw60nqeOo06iPwceK9Odu43w9smbV85JA9OKvEmdcvxgTox+VwqA8xNZeMUB8Qm1bQdj89udepT8ZjP98GjLR12wwklNhIjltJotrHIvPG1CsGLrmJwCPyOQL9ES+aWjam4sv1Tsp7qDQMsU93Ypkuw6YVTSBmC26sXlmuzJlp4NVarvLq/8zA4mNxe0106/F9Svfw1Jl7B6GQxPiYX8QMekL+/bGHoNZ2Wl/pTyeIM4kr1Ynp5oUFRs3Dlf+7z1OAVpXjjR+nGzPiFO6RWrEX4BCzHcVP2yDgBikKss+8EZZPX1rSwkUEZ4VoTkKIK8OCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQ2LiFms72e28yYHgrmNy80Gy/ygxtdSk/9SjF7A4Bc=;
 b=A8DucpB2zqHBbRgm7SkGtmfFUyyFm/0KJhVpdt0MpzPRRkBXm716M5zHujBTNNFA0xOyM12SzbcVoE0SqyElOsmqE34YKdY2IOsbDmqgbsuChq/YK1lWmBBoUbl1/7O+czc7P2nOqGRGBy0ybVdBqH81GW/Uv+HS1XWFbDuVb0o=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB5694.namprd08.prod.outlook.com (2603:10b6:805:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 19:13:33 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::79a3:8aa5:feb8:7f04%7]) with mapi id 15.20.3912.030; Sat, 13 Mar 2021
 19:13:33 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH v2 6/9] Input: iqs5xx - prevent interrupt storm during removal
Date:   Sat, 13 Mar 2021 13:12:33 -0600
Message-Id: <20210313191236.4366-7-jeff@labundy.com>
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
Received: from localhost.localdomain (136.49.90.243) by SN7PR04CA0231.namprd04.prod.outlook.com (2603:10b6:806:127::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend Transport; Sat, 13 Mar 2021 19:13:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cdf3464-6f3a-4664-b137-08d8e6541822
X-MS-TrafficTypeDiagnostic: SN6PR08MB5694:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR08MB5694EB009ACA8D8942F81F95D36E9@SN6PR08MB5694.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2JiJpi3KHCAlpOTFDwW0bi9wd4mL4RhZwyMSquHVCGMkWPr2qGhtpWoAEthR?=
 =?us-ascii?Q?7VnBP6wWmlYJ5RiUHMRDCNvTBqkraAAB/UHNmoKoHuCCfy7RX1yPXHgzytHg?=
 =?us-ascii?Q?cmAlwF95rg/MeZK8ssmybEWctLb8NMcwVJIGT1HZjK2AKGv4GBTNTN3wn7yi?=
 =?us-ascii?Q?rim3OC3TB0wGIOkYqaUL1TSNmTI39AbziuCodG8Tzgx46U6hoa+KDKyvuUxO?=
 =?us-ascii?Q?Mo4q5LKiiOR/ZtC1HQsoEF1iYR9Ef1P9A39dvimWNN6nOW85wwJuS3hp6Jaf?=
 =?us-ascii?Q?xcAZ0RdznT23Rlt86RQBU4hdNyYRLGrTC4Yo+5mIVcx/Fk7XJT5SpK/LQwyp?=
 =?us-ascii?Q?dmznXl0B1TTdBOQNZ75J/LLH2Voixp5/7sBks+1aHy5Bg0o6gFLwwCvq1FMa?=
 =?us-ascii?Q?y6aZervePuJFFczMjxZAZkNJcAw9eCqdgqXP+zltGY9r233g+LxFAvDD9MpB?=
 =?us-ascii?Q?5KFYiAP8F9XVB897r/T1Y8mhFPNhmwDfyXbh3ouPKXbEITa25nTBFYOgw5E+?=
 =?us-ascii?Q?tSyUhF03CmraQgcaM8GBnw3CqgHwn5o+THaAn+vSRMk0hbx+Rsqu6BLM4mo+?=
 =?us-ascii?Q?bydYptrYj9LKyP0spbFIROD0iIUl1Px2GxphC/D6Q135feFimjisUyUs3sJ8?=
 =?us-ascii?Q?SLBHP7BMqVHfpyAhe62F0Cm5YbH6bJwVZs79iY72lN6BF+v0UobU24MtHqGt?=
 =?us-ascii?Q?PN1JVg8qR/6OBMLzWIiQOXqYZrY4if1ctNTsezhfV9/EY4fwaU5uUFmQcCnG?=
 =?us-ascii?Q?vmOtXjEPI/Dbo3HIJ9+06cjH14HTJyIkGy8r2WZ10JueI9L5lPJATdJM14xX?=
 =?us-ascii?Q?3N99ZHlb/anoFS9Mr1q2cm8HbR8n3twaClCU8KzX4QTG5hikpZVWkoyOXDA/?=
 =?us-ascii?Q?yRuKiM4LqaIlC5Mz9KymWvsY8IX3t7gIEAH57uAlQ+ZQ535p+P6jgLJ6hud+?=
 =?us-ascii?Q?7AYRj07ler13LmiFXi0BSQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:OSPM;SFS:(39830400003)(396003)(136003)(376002)(346002)(366004)(6486002)(52116002)(2906002)(66946007)(6512007)(2616005)(36756003)(186003)(69590400012)(16526019)(26005)(1076003)(66476007)(478600001)(83380400001)(316002)(66556008)(956004)(4326008)(8936002)(6506007)(86362001)(5660300002)(107886003)(8676002)(42413003)(32563001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GJ/VSoeW44D8giU04RXpnLGxuHtlO5XxYaqi7Img1WtT5aKkf/vB/EYJFVBi?=
 =?us-ascii?Q?1vmR8q0DFC1bNTZkkN3U7Hrw6c40QyBlLUxoj7L66Gyz8A2kzmETg9/Hg7Eo?=
 =?us-ascii?Q?a7llwL5qpOSUdTpysNsP8gVHDDAWStkH5LTXq09oMW0OaH518JN81ByPT99Q?=
 =?us-ascii?Q?nco6YBrHCHgQoJtnoaTwE1+juP0LQwatUzVYYvHFZptdFkhzAXMxM6CRDoof?=
 =?us-ascii?Q?Sbp2NCiFCwOGLZ2hYSI6IcCuTAlcy7GsT5A9LnD0W3PUD7PHb+MlJJqSTof8?=
 =?us-ascii?Q?/1MLWky1eVn2Qa9gOR31okUXc6djhe3gZ7DHWq6+KMwBzA0OUww5W41mq3vU?=
 =?us-ascii?Q?olqGKPI+adVtKotMKjHc5WKJLdYbevrmbi1Wt/WnPn9EKZS6KCdOeqjrZ6Op?=
 =?us-ascii?Q?vfOJcp3r61EZFoL3yyTFg6tPgfeSoWz9Ub+TOHE3kg7L3Je/EMsYy6X+WXTJ?=
 =?us-ascii?Q?oD84k3OhHsq412Z6TJajYyPXbM3TZQN3PW4Az5ClmTrYOqnrHkPIVPluE9DQ?=
 =?us-ascii?Q?Muf6hd6pWHViGmnM+GoXvh6tAL33/U6EnbORi7oZN2da7+Z8YRRqcBjfyK35?=
 =?us-ascii?Q?3j1/e+mZISmDDyoA9hsNOJaXtqu3FUC70gmNLkGW196QQbHbykR/x5rJVxBE?=
 =?us-ascii?Q?0XqPoHag4apKqLkJCynOdhJPshi0wyd8whp+cjphc4W/i42F3cCZj3tPvRA9?=
 =?us-ascii?Q?XL70ORwp+ngO5sG99+Fjr9s4/GN2MJoDYLjSRkIKoM/nnVrufbNNmUZxcTfc?=
 =?us-ascii?Q?wRKFITliCWmxjw/2jUZ4E+TqA0mW66yPzlVCmW1YR1qwuxl98ucELqiN3YrP?=
 =?us-ascii?Q?imooumyAn1LfryQmjbWAiWoJzscBuyDceuet20NGKv7YnKN+wR/FqQBCzSWn?=
 =?us-ascii?Q?pZpz/di4P8F6RAvbtu/V3kiPsXjH05xPHema2s1/9zJU4CBpAoH1voeDLXEO?=
 =?us-ascii?Q?uFPNY4xhEfW9snsH4Lgvfqz+YRFOgCwvBPTSeS2VY17rKSHgzgyA3f1RI+Gu?=
 =?us-ascii?Q?Audo0blUhtrFqsd52EA1VKz9OULWOUbEBhuw17VxdtE+1iNBFyqzdtZEwvBe?=
 =?us-ascii?Q?/xrCCLMqSXmJurWTBSvoaSVRNwHonrhS2f2t2FCkjWfmE1dBctdSIEmQ8JXm?=
 =?us-ascii?Q?OYT6FN+GKXGiEEPPsvw3JFmqHKewD/asm+Gz9qpeYeUU4WO8o7HcVWJwJszS?=
 =?us-ascii?Q?75lQoJEGCjaq47KVswPw1m6aC3J6jb9VkdLY190WTb3x5gCsTD+6S42eAHlD?=
 =?us-ascii?Q?UHHVg0p7C36lcMM+K9964diPYvujmUcP7CDvB3nDtyGPClNL5IUhaDJoYRor?=
 =?us-ascii?Q?o76bGB73DfCcytXRvzZtMCxJ?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdf3464-6f3a-4664-b137-08d8e6541822
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 19:13:33.0762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fg+bJR47bYhU7qkF3xDWPAG+MZ/6VvkOmLugaXHRZPUTe2F3r7ezFFJ/X5gkJnZ+YDdZQhS/5/OedrRuqNtC7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB5694
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
Changes in v2:
 - None

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

