Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 192257259C6
	for <lists+linux-input@lfdr.de>; Wed,  7 Jun 2023 11:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238188AbjFGJM6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 7 Jun 2023 05:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238259AbjFGJMb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 7 Jun 2023 05:12:31 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10olkn2101.outbound.protection.outlook.com [40.92.42.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378962689
        for <linux-input@vger.kernel.org>; Wed,  7 Jun 2023 02:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ehk8iL4T8SJrWp8OLa2YJVxeY6Uk65DE/777R2rWj0guD4luH9iGmJ0S2sJGJFYOubG93RLInJuM9lc/wpQIoktpOQ5w+NKOdCGHq/luWI3yBvycgTletB4t2GLXXwVB6MAplKFTWihwcqjYunEPqCxxfwCV0A/slHEwhzGfVDOnDVJ/3rU0RXuqRSMhYMO4glDC+yk/oC2t8RGNbl9kBCizxgJJm3f/EJ2/TSYieeBedscvV1DywXxhUDq60WRAB3HcxSaooi7i/ubDcmL4MkA4xgaYUrXiQvuAIVMo7fydqZdrPi2q8KQniV+VGWYfpIOzXUpGOPAG3f6u734i3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sq2gIv1pZ8ez6e7MERrPIulwBng+HrvKRQvao9dTiN0=;
 b=Hpba2lBFOhy6opvEuDn9KbxwcB5SHRObX6ZhXjMxYUZaP+Dx4hIwkiSc6DGOek5jTArUXEvYsnQVGKAaXKw4oQ9PqaSkXv/0xXvw3lozphBqJPWzG2MrRVt6OGTlQrugBKI0iX/NQDODVrNy9Tjmm8Tiipb3wQ8xqq3SvDlxj5Ev9QX2eJW+oftZcA/IPichUnTquFSC/7Jolt7wdFUpgWMoQcX2mfsFFMPnipjZiU+V77QnerBQeKe8RQwhcdAQPx/DNwp3K2JYmtrCVtq8PL3QWKb/ztvi/CkeeYis4gGeh1hy+653KhKiG1IW/K1usCPArs7ARYWL6Jb2fMb8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sq2gIv1pZ8ez6e7MERrPIulwBng+HrvKRQvao9dTiN0=;
 b=SGDBNsRXJl27V0gS1F85fPb7LWc4t/ap8KZSZNDCgs3R9aXvkUAHzYunUg+dAD4qOJFwFB0r9wsiqI+H28Tql2zQg5mW7sfF32Q32IaEVG5q+3Vr07goAfZg6uVMiBlLeYTAxAzd3qjPuwdYvz7uXJIei2tMujreXKGm5IilXbumC8eaqaTcggttI5+2NRapnefhROdp2th7O0t+JNOy2M+asfznIgTEAM4KkkPYpr2wI7P5FmaeOvWZ2OYkVc3orPESMkQZ4R8Z+Po6BbGAsux1Fg9pO+g6UMu4tjU5QBnahz7kVy5x+1feXPN6FcxG776gWEpRRrgiRyEJDLz5vA==
Received: from PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:e8::5) by
 SN4P220MB0791.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:212::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.32; Wed, 7 Jun 2023 09:11:21 +0000
Received: from PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM
 ([fe80::1780:aecc:39ef:3be3]) by PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM
 ([fe80::1780:aecc:39ef:3be3%3]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:11:21 +0000
From:   Roi L <roeilev321_@outlook.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, Roi L <roeilev321_@outlook.com>
Subject: [PATCH] Input: rotary_encoder - don't double assign input->dev.parent
Date:   Wed,  7 Jun 2023 12:10:40 +0300
Message-ID: <PH0P220MB0460B69CA018F5515F5FACDDDD53A@PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [tfJfVKz+hESwnJBIWLNj4wz5RRMGNn824nrUCwXkvKk=]
X-ClientProxiedBy: VI1P194CA0028.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::17) To PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:e8::5)
X-Microsoft-Original-Message-ID: <20230607091040.20433-1-roeilev321_@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0P220MB0460:EE_|SN4P220MB0791:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ca76913-0625-4dcb-a08d-08db673728f7
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvscI7lg4JjfqCWKSmeFoySo/lbp0nmsNiPhhjYRMZNACFORudRpuiPsnBoomFoiuirNPHpCBNnq9JrPu3iexPcHJF6j+bawflFPdpOT326OF4W0VH7jnCIFCkgAVk7hLA2xKK4TWG8YUzvoycacXyK2v/Lt4iylHXl2IIS4+8YqIwe6IuGVBI6/9dVkz/p3g1VLw76yZruPG/IF60OF97PpxsQBF+NE/ZTvhiiHlxqIHpveRQhDI81goIeSO9BdPnTZ029fsEW1Du2t12wPopS0irBjjA7FTBqwCJ0pugf4+CWLx6Ba+XqmaS0Bj+ucAVXWy8OoCGJhSnGLo/JT/sThnIsaobMyNwbc0/riAmgmYmn0CwhN31zkORreDkU6/g28KzNoMStmn7TL6FPVwmrrFVTvmC9TmO8bQRXNaEYHdm9ra5QCYdT1qkW5K/Fka99+YHrsrEa4GIrGWFBGrhvmgbs4adQ09SiGns9vDyvIGfjTuEUxHkgSTUYWmF4/lpAIaHPXUcauTnhZqGGlXODd4llkUk3bk2geOQ3ePw8LKDPizcaEAqK/iwwv5R9OlWpfE9IXzzy9+w3wjY1klfNO9mQjKv8zULWxifvB6/ast0AI208HkorH4rtK/pTC6IFisHZIu7jnIANCLmLgpZxP/7VaZTGbhk78Z5YuVbsp4njPpPljdQsXnqN547VOUR3eRy9RKOzo2719vPuPGzSjSIut4/e1p+N1DPnxNQ+fe0xGBGzsxv8r0X/JQ//5E4g=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P4TEwKwOH6sMb19W8ZOrJp0cBCoeG0WtCeWW2A/urUxLYxCj89yomzZJ37HSMV4B0cx0SfQN6006i959dx3oupPinQ1yRMhR7GCHHHTyX1+InhAhhHVNQlzuwV99+/Hj4YlaWlZFgjkrYj+vMi9bxhWhlsH5iXxG1/cVlTWPXrctkCpf+qmvdzgm3UKsZYRumnxcwhy1WUkztx4Vw0ekLirxBFz2/BWk7AF9nHyFdtlBGbfXBmsfLfNDNMMNnbtT/dj8Kpl0ahayQVN28lxXr1HODff7fZa8SrUuMBdHLdkN4yku+A1dRXt+EbKtX1bDJASzr6kJ81MH2GwEw4puORF/cl8RrSVFS9xsdietaWnTlwyzhVKR0JX+IYvjz8/th1/0wq8ySYXJImMuSj8jnPsMrTWVi2GnfSy3fpJ1Cx5IbYCEGX7XdRYxGJ7O6H/ayfWv1O/6eDW5aNbiwzo1Mbx/vzTRGaUTS/aMqTZWnjzb5ZLzGtnI51hQwEUWvuWG1iBfcFhpO/kauCYVXbRdmyx9c2OU8qUw13aWZLQs8xa3jK+u8EXI2Dwt/20fbwAoe/DI37V2ilU84C6mQjGpmTBnTefZIDo0BJCIXH6GUCmydj+4BMbZwK8nmXTQCvB9
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1IZI1yHkfCpv28Dqck4d3PGVkBK0RTZaTSA4GHBLEXKdsLPi3PQl5g7Q1el?=
 =?us-ascii?Q?LXnKTh9a2xsvUwcf33bBBf7GcUuqT5VhWCPwjpLt4js8Hm4aY3em1ZoUdHHA?=
 =?us-ascii?Q?OeA37Fe3s9IO3jBbDN/Npi6KMyUKJL+JF90IbdyvcnGa61KkRj6YbBGof2rW?=
 =?us-ascii?Q?x/s68+/HlvdzdWsIWUletl+OA9zj7Hioid2co9wVPBdBjhJdLn6TOn+vcN9h?=
 =?us-ascii?Q?ure9wiDKlZ0sn8BEhgOP/gtFu18LhhpPjhgVYwWYjbjgP8cHVU3PtPjrOzMp?=
 =?us-ascii?Q?dGbSMIIO4yFnOxtQY9VKyjh6kaLQj+YcqJmHo5pB3NQ/ZSrpyGsFy48Fzsyw?=
 =?us-ascii?Q?q0/bUSZtePLQst2vCyUFO4SLjh6nK14+jBubXlqiHxabFsEJcUkd5dC+0rKv?=
 =?us-ascii?Q?FB2k6xad+hM1Y1v1SnV8OkdvSeDrLRO+mIjroahcBZJvik+/paqrSvadJ2H0?=
 =?us-ascii?Q?GQxTHvpdgIAEMBvGR3e5tfAMd9uYYSVAdu1xDg5USvwq0QZOb74vCxBet47q?=
 =?us-ascii?Q?HEr3csDYL8Sh5AW833tPekApkwXobXyYyI/aHZZmX8EQfTq8NtEz8HfLseT7?=
 =?us-ascii?Q?Xep9WfnhcBXOnXcuqCtHlKeWuAv8xEgHNCxOkOKCCHxw2dj+UblthsGwDHYk?=
 =?us-ascii?Q?NxrjT6EBs/gP2qq9Egt4X1TlhqATlaYRaarT7shGXGuliQXhve2XTrH9rvIB?=
 =?us-ascii?Q?ca1pO6wWpZTND6WeClYBiGHpCubFlr2aghv7eB9g7QK+6JXPPOqIkCc/5GJL?=
 =?us-ascii?Q?kJclOXfWhOM33u7bYe7tCvQ7FGqoP1gxPw07i9OMRbYD+TvtqsBYZWDTsgBh?=
 =?us-ascii?Q?vWD9rFb32asAHoeiqpfp2395dPJeJQ3a21xNJJLYZfkZKuacb/lefxJzG1Aw?=
 =?us-ascii?Q?EZkqvy5SMzdoG+rkfUnfHhZS0XT0QzPoXLK4tOaRS1JrQBz0oSkt5KuqYwYc?=
 =?us-ascii?Q?GpTBarcP9dQ6YkFvAybPCbuPRo/2m489D93amqgfOI2bJ9HUDag8weosdgc4?=
 =?us-ascii?Q?pz1XpV+Gio/YL01adfge0nsJ8q269pu+r0NMJ0ozPcruQ3lcUFsNY3X/cKUp?=
 =?us-ascii?Q?nLRtzGEK1gEe0WZ560k7CNHn33YV5pO+IrB8IFC5qwX/nzsDbcmtonJOYVIs?=
 =?us-ascii?Q?78IlOB2z10QPGijCondmWx25/tU07XcC1mVzmAEMJXanc53SsiODw+/7w4L7?=
 =?us-ascii?Q?uoOBkxavIoO13mP0z01EN+6EL1SWjyiBHmYQEBo9MCevOBxokXyMDddh4ZE?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ca76913-0625-4dcb-a08d-08db673728f7
X-MS-Exchange-CrossTenant-AuthSource: PH0P220MB0460.NAMP220.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:11:21.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4P220MB0791
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_input_allocate_device() already assigns the @dev.parent field of the
input device/structure, so there's no need to reassign input->dev.parent
to dev.

Signed-off-by: Roi L <roeilev321_@outlook.com>
---
 drivers/input/misc/rotary_encoder.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/rotary_encoder.c b/drivers/input/misc/rotary_encoder.c
index 22ec62083065..5c11cbe30167 100644
--- a/drivers/input/misc/rotary_encoder.c
+++ b/drivers/input/misc/rotary_encoder.c
@@ -255,7 +255,6 @@ static int rotary_encoder_probe(struct platform_device *pdev)
 
 	input->name = pdev->name;
 	input->id.bustype = BUS_HOST;
-	input->dev.parent = dev;
 
 	if (encoder->relative_axis)
 		input_set_capability(input, EV_REL, encoder->axis);
-- 
2.39.2

