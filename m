Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7565AB440
	for <lists+linux-input@lfdr.de>; Fri,  2 Sep 2022 16:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236883AbiIBOwH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 10:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236891AbiIBOvj (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 10:51:39 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A5ADEC5;
        Fri,  2 Sep 2022 07:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2LvnY8OjjY62J5Riar8xVxVN9esDaHeZqyqIWP8kVgtlnGY+1MuuHkOAhzHLGMqvHMFDDWLNAXO0ls6/6kIpuQE0lb8XY6B9OO4l87BzxDtjTIxbyum0RhvTFQEqYvR1csbt/3xjdh3y1zKkvTJJ03axGD3bNhpUSRmfIX4/FtgP6EP8HOHihVSlUtWOYqAJ3YolazdWa6t3ePEWDvj8mOJQdrf4PpiaxxFhAYQV8i1UFqkpI/i4bYNsxh2Uy48wnHS8zBuMovyynFKt9DMF/sC1UGqHN2YESlDR9eMPxHmu1N1m+cpLxfZIHiRaWjetpxlAfiwBzk6PGcKPHgpMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L97dZ+KjAnbx6QKyNy+Ty0UBrz553Ym44jXbdyJ4aHg=;
 b=P2dIYSLSvDR/llL6XrnzWBh+dkWN4a0GWVPzuYU4aE6GyJIQG9Wiwd7DDhzX2vOH8IV/fFG5xw61EJuifHzqG5cEupQt4MCEGxLkYVMTbdNcQhnk5+pfaevZHU3rwjcP6/aG/kBRbFmwNHBPp8xKZKPc+upprQt/CNWXhBmB8zG13gynvczhLdhHjTxQDE8mY74ims/CPRIBU8t4uXcS/TOcWXZ7f8BTXabgofneOHGXxexoQajbwg5nZgFncMOYWGV67pG0MBs36RGpCnHIpLFOqIWhdLwBMuW2VRUu2GOV3Qxx3dXpAMSAyRB/3NXYhqPYnqz7nVOQh/rjUjNb8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L97dZ+KjAnbx6QKyNy+Ty0UBrz553Ym44jXbdyJ4aHg=;
 b=NGyRvRgY83lQSk18DCyT8gHdkZ/YIlsw/al5WN9uU54KRmCJbD7OH/g8Fg6BiKFLschgeDuSTPWAjuIZLeKm+QybjKUan6JU4SZIEUINL6FSuEkMCmcjkjxixYwgVKPzHaWi1QBT6zykGWu4OtmNqeNEVVISrOPQlDT0zk8A7Ns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BY5PR08MB6342.namprd08.prod.outlook.com
 (2603:10b6:a03:1ec::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 2 Sep
 2022 14:14:45 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e42f:30e7:7a94:efb5]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::e42f:30e7:7a94:efb5%7]) with mapi id 15.20.5588.016; Fri, 2 Sep 2022
 14:14:45 +0000
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com, robh+dt@kernel.org
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Jeff LaBundy <jeff@labundy.com>
Subject: [PATCH 0/2] Add support for Azoteq IQS7210A/7211A/E
Date:   Fri,  2 Sep 2022 09:14:22 -0500
Message-Id: <20220902141424.90063-1-jeff@labundy.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0081.namprd11.prod.outlook.com
 (2603:10b6:806:d2::26) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43a1b050-171c-495f-002d-08da8ced7cdb
X-MS-TrafficTypeDiagnostic: BY5PR08MB6342:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kjAFrygVZnCihZWg4KWaq/+393gbGhwQ1oiU0EuGE3JzrwoaZzpJ23hTrobt49D3plhL/Jh7A0YOfjZvkhwbWlTIPMrBiyYD/MYco/1aUF5ASnfww+GKpce8w7CEwWkwBOCxQeLg8WGHx5SYjXRhIs0WeuSZbJ+hwDNq/PfyQ4xoHiuDxr6c2GAy8SXB/vibSy8NkOKgOvDCi9yA/Jatf16hioK9jNom+M4PNrI6nSuYTm18Ng21/X9eAJ6EcztnWfDXF0B2b5fKA2dSGt0JYi8Xq9tdzipsf2yR8s//Qxnx6ZzdPVzfkSVsanUcR+gXYRZ17xRrst45FtDZAMEHxuf47z8OFdSN89OtHEcvq2xxNuwqmdK8TLS1EOCXHCldEVl1VPfKPoRg99eRMv+Fm6IL+9m4F7pyg5A6KK6Z8nRYT9QRlMMMv1wTxaFake1jAD7yg8THXY4UiVBvc7cBN2yRUOmLSWqnCxUoEkRZWlPHWQy6h7/yksQxkDcCkXp++2NGAtYqmJLUpCE+eAm7m98JCfIpwIkktau3mH4GfSkk1ntOXNqNnxykt+2Z+X5atFLqC/5bOI0xyo2chohSl+0zMCZBk8rBKo+6jWcMHBbnADzH27/DSQyJD+p1UFNp01P8ra0y48BxnDHf6dn0h9rGaVuqsrEPIOJ3ZT1CORy2jWz52XKBHIBunDVxpszWGcTYDJq+7UuInbQmVhtNbijXTNKNWXD7lU3R0Phzwmz2mm1NftLrJXJKSy7gjBoDxX6WYHdzYLSxwlDyafUJCb1eL9ATWrGCLrdqhfjgCnQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(376002)(366004)(39830400003)(136003)(346002)(396003)(38100700002)(38350700002)(186003)(4326008)(66946007)(66556008)(66476007)(8676002)(316002)(2906002)(5660300002)(8936002)(26005)(52116002)(6512007)(2616005)(86362001)(1076003)(6486002)(966005)(41300700001)(6666004)(6506007)(107886003)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J8K+tDCgfeVmGyEbsA/YMlJDft7RqcwH1P9Q8XA02v2Gfd9D3ghUs08rKkwp?=
 =?us-ascii?Q?+EVG0rDAFUltej8QxuvtyWfOhGI8oiUbnO2aufIgBHlHetZMZYXyQP8QiXTp?=
 =?us-ascii?Q?5Rq1bSlEKKPL0sSowwXuB4ofb+yijm/tPrZNvuMaGk98gQAVbJK3gmZ18WBM?=
 =?us-ascii?Q?Q87jkBdPoqnpc2xKq9oSyOzIQV4aYxuxU26TqmNX8nkOiotCVd+nvgprbCV1?=
 =?us-ascii?Q?4vcGBu5WJhF7CylZ7BjxJTSRiUWv4q2cykByzsdSu3KbRFlbsNB4sZfHZd9l?=
 =?us-ascii?Q?XkyY0u4OFMXprc1Q7eewbJWXsgnh3D/VLP08c7rUDwoU2qVM8A30nhueJg3K?=
 =?us-ascii?Q?FV8am3jQS9A4GMWkYFRAQ4a4y/EAGLoTstkyNKQRqsVYuy2C5KIZjgaGGbc/?=
 =?us-ascii?Q?HBch41BFD4dN9kcpRYLfhb80tUF5Qzv5lNLXCEmoD10ZzzMl5NZGkYwGkVF4?=
 =?us-ascii?Q?CbjqH8QJRolFp8gkM7L+gTeI/XyFMsPDWR1XnPjKws1VuLErqfT9P4E257/o?=
 =?us-ascii?Q?8Gx2IPzIuiNSa8O9f3ED3mMeQWObFIiuplrFhN8a9MV4ulI75BdsEKIfA70S?=
 =?us-ascii?Q?pwNZR6EO8/sj1sZ3n4ezzf1TUYgrAfyMB0eGSfNJyIwnBMhZqc2LkLgrY9ZK?=
 =?us-ascii?Q?ikE/uwG/zuJYGlaBoGKP80A4wPdlPTTBvjdR/7V/Xum+DNiEJvKdIWB/wBEw?=
 =?us-ascii?Q?2ds8AlqUCABmNZIv2CVcZiFlZD+MYfTOzgvyu3/M4xYFRg4BPnCcxWh4l6vj?=
 =?us-ascii?Q?8yOtvYeqRDz8rkRX/i2gnjddiTlB0tlWr93KVkazpbBqN6oJIEofr7Jv+PVB?=
 =?us-ascii?Q?B8uh90yrBPkZ3XvjmabPFA3MB/qQAZHuchZvIEA8cTIMNALLS/4jbgXyEOhF?=
 =?us-ascii?Q?55mxkm8KIMDt7t3VtdM+msKMAow/8jKPxkogEHEYVnAUZnCPEWGs0IslmXUU?=
 =?us-ascii?Q?YLoRawQ1unJzeznRCLxBxxJWlc+MgPvc0LHbcoR+3/FQFmzLZ5DfQEyLyRj5?=
 =?us-ascii?Q?v8m1OZklGGNFbd8qdYb/dr4bcIYBdq5fdDlAP9s06/B1agNLhetwvYbaW3BH?=
 =?us-ascii?Q?oOcayWZEXpLy8A5DmTCmJBXQqa7vynapvlHHuBAWoQvRPD/8KrijICEYi5c/?=
 =?us-ascii?Q?vDd3PgkQ1325KcazmCBBYkzRieYdnFXYROFi6/zyeSfZSJIAUyB9FVeRITXl?=
 =?us-ascii?Q?05lRHy4D+YjnYchmRjA9x9r0XB0cLLpCWRTFSeJ+0AurFrRTwezfdSpvz/oD?=
 =?us-ascii?Q?CIUs9nVVX2BvIDQBWLp3/Zmv16Wb1IKz4OHYCEuYmTQ5L6rlOQKq/Kpe4etz?=
 =?us-ascii?Q?DFuJCgBRMTIxTBkrnq6OcPRd5qoNgsDGmNLktASWjEWC+SFJInWwiCAUAurd?=
 =?us-ascii?Q?jzrYJsMSsCTOpEWwKQBMKClLaKew7kz46JqIinPWJhKWw438GU6Yn8V4nwAa?=
 =?us-ascii?Q?aGyxvkJb8uv5lvnGrnneLpl9Y6Eixd1kmSEgL+1T2MyDzC9WgiaWmM6IAf5X?=
 =?us-ascii?Q?3M9ZJlWoUObtxYBvWxIBS+PuyMwkj7JJenUpa9Ntsxnnq0Qat2Pjv2OVRsd5?=
 =?us-ascii?Q?AjhOKni9ZEqvV3KYafLp12CYUcm+U+zOo8QXKxXG?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43a1b050-171c-495f-002d-08da8ced7cdb
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 14:14:45.7461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sps4k/7SiE7u8ii9rJHMUYbZ4tNw5l/49w+Tgr1MpDozoQuIQFtf+kTf13QWvUSn9D7jWZvL4iG5hmRMIrwR3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR08MB6342
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series introduces support for the Azoteq IQS7210A, IQS7211A and
IQS7211E trackpad/touchscreen controllers. Optimized for wearable
applications, these devices track up to two contacts and are capable
of reporting an array of gestures.

The IQS7210A includes an additional channel to support an inductive
or capacitive button, while the IQS7211E adds an advanced assortment
of gestures. All three devices are demonstrated in [1].

These devices can be configured during production using OTP memory,
or over I2C using the device tree. For the latter case, the binding
covers all major parameters called out by the vendor in [2].

[1] https://youtu.be/RjB8rNkzQJQ
[2] https://www.azoteq.com/images/stories/pdf/azd123_iqs721xy_trackpad_userguide.pdf

Jeff LaBundy (2):
  dt-bindings: input: Add bindings for Azoteq IQS7210A/7211A/E
  Input: add support for Azoteq IQS7210A/7211A/E

 .../input/touchscreen/azoteq,iqs7211.yaml     |  765 +++++
 drivers/input/touchscreen/Kconfig             |   10 +
 drivers/input/touchscreen/Makefile            |    1 +
 drivers/input/touchscreen/iqs7211.c           | 2566 +++++++++++++++++
 4 files changed, 3342 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/azoteq,iqs7211.yaml
 create mode 100644 drivers/input/touchscreen/iqs7211.c

-- 
2.25.1

