Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F2B463B855
	for <lists+linux-input@lfdr.de>; Tue, 29 Nov 2022 04:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbiK2DBP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Nov 2022 22:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235205AbiK2DBO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Nov 2022 22:01:14 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E761A303F3
        for <linux-input@vger.kernel.org>; Mon, 28 Nov 2022 19:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hrId+cF6DLy7UxRONDyAp8DHi6LRGyaeCUtP7tY3JfQDrhAQ3MP0HYDKK8w33AdciBwIB1EfDyjOe3c2GTGUhRbQ5rSPE52Xg6LH9kTyL6cNfr1A0L3DpV+uiyKYqzdd3zQEmTh/lT8r22871JtqRIIo1/3w5jrs3fnc4Ftx2xSGA/0UYOQ9Y95FXjY2YeXJ85TrpDbUnCyvEjEyoyDs2X1I4wtmCmY9e2ZVAlvh2aEx2Vp9ItWdQ7E7nT7+oSB6fFUyRReI9RP1oJ9Xp5iwtS568NzAGHb9TAYg8bhs+IUMrJSVdTvGkGqFKvongSlj2eRpwEFxcgttENAqLJTkjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8Et6Hx0aGntAe6GrwXGEshu8Ukh/wvzFndcYhFHBPE=;
 b=Z6Xl1xC6MkkvDE0nxg8/JF+3lnnybLlgIyr5Vh1zzh/X9C41f9JyPtCPmgLYSLRIPHahVuTfEBoVDfnHBK8W4MbAw4F/2mjP/zKWEcba7AWMuNahTkHpdCZBmhifGPt8m1Eswiff+GcinIVA+lMUcOue24W6lxTECgE1lhUErGOhfuYNUiT2q2MsbzyrGNstmyHWIdOus31lbJKTZBm9P9BYf8HhMplfGDvIs1jPYRnRwT0q23T7HSP6fwAbK9IcHd3IwaED6PVNKCSIz3Sd33u4YCFNwwp6q6SFaUNCUnBl326TGdm+4kfJZixsqvUOSrGoVBQvMDDiM55EiL11BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8Et6Hx0aGntAe6GrwXGEshu8Ukh/wvzFndcYhFHBPE=;
 b=RHr0pDxGuCEKktRns010MBWQKRx/Zd5hrmhv8ZRFns/nWlh9Iq4kxC8mBMCuqv3i5Ucwk00JZnuhzUY4pgyK4YZIKYrAVg7f9kAC1RnHvmuChagirH7QSl5IdOAEgVZtDIWkYdhkn3CLDFIB9vLoxd2KnwoxZT1LDV0p8ZU6yIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by BL0PR08MB4546.namprd08.prod.outlook.com
 (2603:10b6:208:5b::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 03:01:02 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::ea42:ebaf:dd18:6a4c%4]) with mapi id 15.20.5813.019; Tue, 29 Nov 2022
 03:01:02 +0000
Date:   Mon, 28 Nov 2022 21:00:57 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, jeff@labundy.com
Subject: [PATCH 0/5] Miscellaneous fixes for Azoteq IQS269A
Message-ID: <Y4V16ey6osEaaZJ/@nixie71>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SA1PR02CA0022.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::29) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|BL0PR08MB4546:EE_
X-MS-Office365-Filtering-Correlation-Id: 826574b3-dbd9-41ce-efce-08dad1b5f2e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: peeZQB7wJDkXiAkIsb8b/Z8jFJ3oBBdVKYzDqj9msHf6zDcyrOAMkNK+BluyZXk/mNenV7wYkaFUF0s+B27Cr+lOqbHmSac5OuS6YY7ViY6eqGus2Oqd7LV+A7k4rCe6SpfYHys5lh10uSkCkXZSkGlUalbLVTf+/J/aBdVWACW3jS//AzsQP1fel48Ms5qXLdH7NBVfrBVXyiJY5Vv8+L2FIhR9ZM8CJzidCBB66182+V4TWvsE/orRIlANmO6aA2UwnjQLGzO/ORbsu2AfP7/som+u0M4/bL27QC9qbRmKd1vJZJ9EXSUUedPvudczAHlGlzMdxr9ozf2WQLa7Mney+YnY7swivFpQKYVyURantqYB1NiZ+n5hAsIrItxCLg091HFXCDS4SdN7yw8hS4Zw3zYU/qyeUazL1ZZXFCfXR9vkzhloo7FC9CFgO6D0GnlYk3mCmRK1z0/30Wg/3fGePLePBxddr+nhRwS9yBqDzbJNjN+WQ6pLUzcHQFkTinPT7fVYzxQLFyG6Q979zgdChx6UNeNUqym03RwZjRLmtRwMTPONs7X7ZKRmArTY7w+/2bI7/M9sPjfp84kiSRr9oiWiXU4DtJug8bIw4G8KxJG1sNfW81xbI4lNX0Igj1RKnWw/eJYcHnZ3VHsZXA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(346002)(376002)(396003)(136003)(366004)(451199015)(66556008)(8936002)(8676002)(66476007)(4744005)(66946007)(5660300002)(41300700001)(107886003)(86362001)(33716001)(6506007)(6512007)(6666004)(26005)(9686003)(83380400001)(186003)(38100700002)(6916009)(6486002)(478600001)(4326008)(316002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SiVQmiEQ49CmkPUxX7yiqaw0bpkkDc0W5vwd0QUtYE2X+nOJPFSwCW2jntKD?=
 =?us-ascii?Q?vkwjNja7Hy9mJJYXy+aW/aF6wvJT0UxRrpLgpb+coelyYl+pPwgxfOMk9qtb?=
 =?us-ascii?Q?KmFaI9VWGfds1mNsZbc3ERCAc9GH5Wfch4jf3Zi20LQ4pQpqRTsxFWoX8Ox5?=
 =?us-ascii?Q?AfLvvZoV+Fp1a5WuJ9XJiT5on9v1BnTfY7ms6+foNrj2ZCy7t6NZui6ImI+Q?=
 =?us-ascii?Q?EKNZ+0BlMBBOjL9xQBWGKYLqD5b7j77DzIWi0tNZRqz/oxfLGhMp0RREBT+W?=
 =?us-ascii?Q?oyvT2Hfo9lEi6YM9LDdb05o4VkmBF7hralMjUKJWgReXZJVpMJ0f9HlWiRkI?=
 =?us-ascii?Q?kYGAC9D8IpwVMydG3hXEj5h6dCqJoRtstS9AJ4EgR701Vo4pCriFRGS8flDB?=
 =?us-ascii?Q?IcaO+eeCKLX+YpN+xFi27dntMp9Vh8B9S5yFi4T+5eRjUCo6H2jO+rXjAn9m?=
 =?us-ascii?Q?o6lBgdKa9HONAObvnRJcOk6dMQb6FbjQLUgJvNMmJDmeP1PXBW7cJhmlbhC5?=
 =?us-ascii?Q?aoPluLBkR/ctv/p/6gp/6GVF4lWpdOd21aafNDCBkqPXWd6wjymZMxGUWIND?=
 =?us-ascii?Q?E+KOHB6vNcKBz56nQOoxXV7QPanaSeik8IxBIgagHu0Eq1ece7jfgbvWgPfo?=
 =?us-ascii?Q?YJ7oWhaurYqcXA9JHTM6f/RsmDgVO0GSCF+g2w1dsFBsSH22ogcfQd+joke6?=
 =?us-ascii?Q?DwkdDWrYHeYdigNRvEuA/JXHQYvOU3j+pbUWc41MMh9aBHP5iCky3dAtqW6+?=
 =?us-ascii?Q?CxrYxuJybd/9qicx3cJNpM1ICDtK3FFTEGhrG7O4YsvbJx//zon2jEJ3Z1p9?=
 =?us-ascii?Q?UkLOxnrsgwWU4+G4ih5WCeDFYyTa9MeonF5SszGGlANnqJUqAM355ppvt8hX?=
 =?us-ascii?Q?Wsr2WwaBzWyd3RhY9Ca6C/b6O2TK7glQ+V8RmLIyDs5G5owNoMxrTYqDZpNi?=
 =?us-ascii?Q?4tI7G0c8Z5MGiD8Pk0NAkNQQjmTKC6aYCNrVLVVkWRUuulSmLSEAMKJhFy14?=
 =?us-ascii?Q?7L0v5DdhgRKGjET2/er+4A4wkTvNGZ7MgFdB0HgdZA3uQw0BNi9eHD1ALvDg?=
 =?us-ascii?Q?TLZxyOfWdVc07e8GXbJ99V36DItYImGBd8Jh/LugyqYEwEjfckBmJfEmNUBw?=
 =?us-ascii?Q?2bCh+kG05ITpuFCYqylYmw/1MSk7ev4e5xoZPH0kFZyklzSGg89Ktze1LDCa?=
 =?us-ascii?Q?cuQdkdaiygrJqlkB2AyDW2bKAVF2kYtNX23uI2GzLUlyC/IXTCOyJF1rdSQD?=
 =?us-ascii?Q?qBEeyJEtcIrBgHyiFIuM4WemCy0zVT639s13DbPvQO04b1RsuLC87pp/mjVz?=
 =?us-ascii?Q?V84P9QcqLmxBgtbmjQHBoefol+qBVrPcSa+LqKOLFat3zpLh++4YCKeCSqAM?=
 =?us-ascii?Q?tS8yBPP44EcOVhApa7bMZuh69i4l07JMQ1QnpXHpgS+H5cpX8ObTf0/2DsRV?=
 =?us-ascii?Q?92NcrEj22X+wLpbHI6HlJ2jC7ds+QQSewB2gXkDgU13M2Zlw7NI+Zx6iPBxh?=
 =?us-ascii?Q?yMnRT0SnMDxprQwkomK4I1FTDf6Y96TmNvCpkbuYucEiMC2bJUg5b3ehjpzr?=
 =?us-ascii?Q?ymlh1hBsOVyoFXvmhWEkTdlo2MXmeKLDeVNVV3tB?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 826574b3-dbd9-41ce-efce-08dad1b5f2e9
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 03:01:02.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KVwO6kaurkLdzSyN9IDU7q2Z228R+w0RSY8o3XnXPUBBXVZnL1bvX8B2gBjjibk13yxizzkfA4qcTBsls+0dsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR08MB4546
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This series comprises a handful of minor fixes that result from
continued testing and updated guidance from the vendor.

Jeff LaBundy (5):
  Input: iqs269a - drop unused device node references
  Input: iqs269a - increase interrupt handler return delay
  Input: iqs269a - configure device with a single block write
  Input: iqs269a - do not poll during suspend or resume
  Input: iqs269a - do not poll during ATI

 drivers/input/misc/iqs269a.c | 339 ++++++++++++++---------------------
 1 file changed, 137 insertions(+), 202 deletions(-)

-- 
2.34.1

