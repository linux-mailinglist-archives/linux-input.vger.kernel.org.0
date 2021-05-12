Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BF5937BDC3
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 15:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhELNNz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 09:13:55 -0400
Received: from mail-bn7nam10on2062.outbound.protection.outlook.com ([40.107.92.62]:10368
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231695AbhELNNy (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 09:13:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT9WGaxG3CtGY6gV0NF4CGrgMQr/9BnNvxn4NaRdVUe+mKpwc8U+YC433Y5K373uCrpetqe1m0TZ8eToaY705R9kKf8gbCCsquH1qugCA/emxt3vuAQdrzQ7wjk4No72KmL52YD6L4FF/K8OtD7sbH5/aANh4eproGmIoYEfrAnJWImNqjN3a1jPHT1aNVclbevGAHMX5uU1Eo9rDoTx/3YeRjRfFUaL7T0nFPnezwhVNza4QRCpwlWxZLSJumJal2CPll0ejJFY7fk5DYqq+rX1ThF5lGP78VtSAFlDSGqPvEnKpe2euh3Y5NH1RivbiEbUI22ir8c1JAGujzmPxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5ZEQH40bV4yhJNbWkvuRHBEA9MkWHTzkzFVFZAu6Lk=;
 b=lTemDJbHeie7UCRAQPnoI6kF+R5WCEAPwWCsGRmpKcOaAOKDDxBypbdO2yeOGN7qKZChGKThWH1pncRSOUh4K90Uxkl76sJgalf/IGzq0ufxZ4tgZueWyaIzugX1RPQ7m8nHuYRaumFUZVKNN9cuxBynOJnxOEzWE8dD4kp6NzLopdVWd8rwooIGwhMQMfHvubmhDabZbGr2+nf9q0cwl/n5ADggsCu2plIKyMYNNrPmOKzzLL1q/TH+Ksptl75Sfcl19pIK7qoN4UezQYuYsZ49+m0TaD8K2m8stG5zMOEU3Frn6UYClU0OiHxNcsN/NS0G1XhtLsAPl7FyqzNbhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5ZEQH40bV4yhJNbWkvuRHBEA9MkWHTzkzFVFZAu6Lk=;
 b=eWxsbZ2O+nSxM4etc0V++bM8mDsu4D1R7wUh1TBsgG7Wvu7xd9lQn/1dnQfqzU9pp0Jj+IOxEX0Z8z2aUP3bPUuOco4PQYeYPhTQTyJTZfXpJew3JWH1M6Rk7F4NeAt0FJ8lVO1TefIc9bn61gFMnO6OWf+VwlQmvqQoQhJ5ADY=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4812.namprd12.prod.outlook.com (2603:10b6:5:1ff::24)
 by DM5PR12MB1259.namprd12.prod.outlook.com (2603:10b6:3:75::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 13:12:45 +0000
Received: from DM6PR12MB4812.namprd12.prod.outlook.com
 ([fe80::52f:e464:d09e:67fa]) by DM6PR12MB4812.namprd12.prod.outlook.com
 ([fe80::52f:e464:d09e:67fa%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 13:12:45 +0000
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     Nehal-Bakulchandra.shah@amd.com, Sandeep.Singh@amd.com,
        shyam-sundar.s-k@amd.com,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH 2/2] amd_sfh: Fix memory leak in amd_sfh_work
Date:   Wed, 12 May 2021 18:41:56 +0530
Message-Id: <20210512131156.740493-3-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512131156.740493-1-Basavaraj.Natikar@amd.com>
References: <20210512131156.740493-1-Basavaraj.Natikar@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::36) To DM6PR12MB4812.namprd12.prod.outlook.com
 (2603:10b6:5:1ff::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from amd-DAYTONA-X.amd.com (165.204.156.251) by MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 13:12:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f73a81a1-02a4-4d40-1c29-08d91547a1bf
X-MS-TrafficTypeDiagnostic: DM5PR12MB1259:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1259D53DD6607D2906D3F4E8E6529@DM5PR12MB1259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4mU+v+jF6W5CV3RXbnGorlLZHDecA3xppbICVLcdV3RZJhtTshLIwm9Vu21WbKE7lHGkLjQTKgCX7w24V4DqrQl2fYboYx7dIy+LM4NlLe0hornKBbTw38EH7kuoyI++Biu5Qpc+jzo9Xw0FDZELKfoxjx8+VBMVo34+22udSPSffERwy/0uIA8Hja8MLLm/IEScETwwHdQretjstzViqpB2TQeSuihAO3L6mb33MFTXshalLI3yTwo6QeofDuBVqGzpGPWkSBIkMnN7CNI+masi83r9cJFGY2Z918ayseRytquxFNV0Vs0cqQp2I798RZL6FPBAfwucWwdVLP2ODEqYdWwNGxhuSCV1O9oNyJqJjuVz+1HckpBzS4roJltZ6U+gest47JW7yD5ewzTyvinQkx6DYxcOYAlpsdUu1RYa5QErFEkBbuy2LLclb4XA7SFGeIQr2oeZQZ8eaGNehINO0GTuAmNVjlhItZ7/v2JvR4CzluOc91cPUXHGfC4473edLs3D4rxjoMJcJflTJ4kX5poX6PBne1bHo8Xnh1yNMZXdeqlZS7zYh9jM1wFeWPbxY5jinSLyc0G9BDjHFgWmJyrctFO6vaTACsbHpI0xhKvt0c0nMn2Si7AwfaUOIJYnhNewcbLiI1sqhfhN6PsmElXxamcNU8h9+kEfKA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4812.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(38350700002)(86362001)(52116002)(8676002)(38100700002)(2616005)(316002)(26005)(6666004)(66946007)(6486002)(1076003)(7696005)(54906003)(2906002)(186003)(66556008)(16526019)(478600001)(66476007)(5660300002)(8936002)(83380400001)(36756003)(4326008)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ceEcctGfAHRVStaOT3Iv9rgDsZM6Ip+nG1pwwsd9mJuUFcUTkxhtgYyqbEH3?=
 =?us-ascii?Q?KT8X6ogIKQxuILdiWGlkjAGtnqiRSYIb1L9sc6Hkn9TmETLxot6OdH38KzA3?=
 =?us-ascii?Q?HMAfATFFEOtq6T5K/usOy7HYhBGFN35N/enq12PjcZ6wT9QEfH9CkjqkMdoP?=
 =?us-ascii?Q?azukKIHnoC3KFIkhI3P7KnMwADM/fxXTyll1NIm4BR/C+yMSSSdo88BjXlDz?=
 =?us-ascii?Q?L+TFdmZVteR1LFTz1W6ZB7X/SLuyV5kmR9432hxFBjK/CRY41YOfvLo1Ctgd?=
 =?us-ascii?Q?vgM54Q9V1nHsKIySXeNZs7Xft6HBNThFD/hAGC3/boN8xMpMeWDXmqkqrNyV?=
 =?us-ascii?Q?FCQsxuk07WPXonwqCOHUWnmfLMbDGgq2gz+PBlE99i8XTOo9UCfPZn6QlplT?=
 =?us-ascii?Q?qCevmbx0lfHi6F6+jfFakiLyyW9qm1O6DCsE2mYVKn6wDqBqUmksknwie0pU?=
 =?us-ascii?Q?6wyMgSajWjBa7Y1f+UPu7J1aHMG0NvnSK9iciX9e5GZgthvT9cEd0XxzziQ3?=
 =?us-ascii?Q?bAEuTVtkwAFibeuN+arjIt+y+xwXwDyndGDfiHZ5ewRHZNzs1ubEaZQP2yfS?=
 =?us-ascii?Q?h19m8E4PJTQQShdOTauZNkQcxBN16dn1ENK0D+c9WoAxRBkzWJnhmOmEarK6?=
 =?us-ascii?Q?BOwfPEB2c3eEToQKYwgme5T5OUoYabNvC023g+GLny6L5gsBxFpV72YoxtqA?=
 =?us-ascii?Q?GwXhEw62dezW6LuzogrenEjwDIoBXZpgaJXDh/bUPECceE5uNxcxn38sX0Pd?=
 =?us-ascii?Q?29vUIbZRFY3xiwBQtV2QnaVloktRb+uRQwi9jC6z2Y40zwRQHz7pzGqMOBhe?=
 =?us-ascii?Q?fByIBRPG9FTUUQzf5TeZp4UNh+wcr+w3mT+IzXqdjs8Mx6VCLAaIpGm/mJmm?=
 =?us-ascii?Q?1SSC2gTbkV3WThW+CCfWZ2t31Q9Pmd8nllyl7MjSW9ynZKJ0byuXTyR5+oM0?=
 =?us-ascii?Q?23QXPfnnXzWl/hBZNWEf3yqQ74e8CXi2tbDJtRfNp7VAojfSlBZ56WouyB6l?=
 =?us-ascii?Q?PoR9RxNmIE6Wf54wPnpiTlitjw8hsaf6yytlJ1KukLHJ01PhQ4LyNQmu/iW5?=
 =?us-ascii?Q?yaInMR3aHYHI3l5pndEJz8TLa9fo7okfTwPORtH4xVxnXhM+L2rGKt2eDTeb?=
 =?us-ascii?Q?eOFFhZUe4MUN3X2d/a6qVnukFVT5z+Bcf0ari1zmbmt12hWrLjIqS1+16TG6?=
 =?us-ascii?Q?E4N6GJxJnXC5MW/lIdh+jndzM3mx+UXGLRDOpiPI9r2RZoTcvHbgWag0MMJ9?=
 =?us-ascii?Q?esRa7A7A4BdvCZ0dbiIb+sSKOWJB9C7THWfftjbGynwme7d539vFp7Q6rR/R?=
 =?us-ascii?Q?ty110tlIWvdmdNY5hbmtVq7C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73a81a1-02a4-4d40-1c29-08d91547a1bf
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4812.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 13:12:45.1472
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h8OYAuF1AAtEiSk538MpYzk1iwfkYsz2+VvFtj0htH03rXR9ChNB2HVyhPIt+AmJoYXd7po6MmTrTKuckF+veg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1259
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Kmemleak tool detected a memory leak in the amd_sfh driver.

====================
unreferenced object 0xffff88810228ada0 (size 32):
  comm "insmod", pid 3968, jiffies 4295056001 (age 775.792s)
  hex dump (first 32 bytes):
    00 20 73 1f 81 88 ff ff 00 01 00 00 00 00 ad de  . s.............
    22 01 00 00 00 00 ad de 01 00 02 00 00 00 00 00  "...............
  backtrace:
    [<000000007b4c8799>] kmem_cache_alloc_trace+0x163/0x4f0
    [<0000000005326893>] amd_sfh_get_report+0xa4/0x1d0 [amd_sfh]
    [<000000002a9e5ec4>] amdtp_hid_request+0x62/0x80 [amd_sfh]
    [<00000000b8a95807>] sensor_hub_get_feature+0x145/0x270 [hid_sensor_hub]
    [<00000000fda054ee>] hid_sensor_parse_common_attributes+0x215/0x460 [hid_sensor_iio_common]
    [<0000000021279ecf>] hid_accel_3d_probe+0xff/0x4a0 [hid_sensor_accel_3d]
    [<00000000915760ce>] platform_probe+0x6a/0xd0
    [<0000000060258a1f>] really_probe+0x192/0x620
    [<00000000fa812f2d>] driver_probe_device+0x14a/0x1d0
    [<000000005e79f7fd>] __device_attach_driver+0xbd/0x110
    [<0000000070d15018>] bus_for_each_drv+0xfd/0x160
    [<0000000013a3c312>] __device_attach+0x18b/0x220
    [<000000008c7b4afc>] device_initial_probe+0x13/0x20
    [<00000000e6e99665>] bus_probe_device+0xfe/0x120
    [<00000000833fa90b>] device_add+0x6a6/0xe00
    [<00000000fa901078>] platform_device_add+0x180/0x380
====================

The fix is to freeing request_list entry once the processed entry is
removed from the request_list.

Fixes: 4b2c53d93a4b ("SFH:Transport Driver to add support of AMD Sensor Fusion Hub (SFH)")
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hid/amd-sfh-hid/amd_sfh_client.c b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
index d04d6bd4623d..3589d9945da1 100644
--- a/drivers/hid/amd-sfh-hid/amd_sfh_client.c
+++ b/drivers/hid/amd-sfh-hid/amd_sfh_client.c
@@ -88,6 +88,7 @@ static void amd_sfh_work(struct work_struct *work)
 	sensor_index = req_node->sensor_idx;
 	report_id = req_node->report_id;
 	node_type = req_node->report_type;
+	kfree(req_node);
 
 	if (node_type == HID_FEATURE_REPORT) {
 		report_size = get_feature_report(sensor_index, report_id,
-- 
2.25.1

