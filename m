Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57E337BDBF
	for <lists+linux-input@lfdr.de>; Wed, 12 May 2021 15:12:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbhELNNg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 12 May 2021 09:13:36 -0400
Received: from mail-co1nam11on2059.outbound.protection.outlook.com ([40.107.220.59]:43680
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231867AbhELNNg (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 12 May 2021 09:13:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a2yM7IYZyB2wwEbgWr8g/OOTxSVm4CgMp5JdxX3/fwVZnmVrDP5D3fgFAOUZEo5fTv4AW5XuSOM7sXx5wi0bCnt9QK9NQMaNS0r7P1OzRd1f+5flm6gTUdiHceb+eKgT7LWRvcYykzDkBC0dg0W1IhUdnlhduGfX+iRTvuaiVhcoh3ShEyxcDor8rbWsoyf5MvLNrXMt3dTRUAz5yE0os/42M7Hp38hJ0xLrYvs7h4O4uhZk9kAYXOjOSXpTGalBRqKcj5CysHFWQVTv31/MHnBWMvLWPw7kjEGGTFbOtyhiVCJrna5VF+xSM7wcd5niElVO0RJ/Bm15rQVkPI46bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8NQzCuPlrVijmCwYl3QmgYaXVlAO0wcCqzUUOUcUdo=;
 b=kUVkp9yBltmOvyjeH3gJtxRMUE8VWYJM4plse3nfluDAWIO5HxDOWU1t/3kQx3TBVu63e6jpZUDsdngNTFqtnnsQ86PUp8NwYFsOgBTMU3AT7Alt+Y/mE2RHzTdpET4wdd9yyCUWrZejvoHV5VAu51slRK07NlHKrXlx/kfv2zoVKa8iG3u+t0E6oMfBtXKv2gTvB0Fwg6YxLn2Q/5uaPXGBXPqIcum4bS4x56FDyFjngfgTSPq3bdtgofYFTdR1z5xi+YZjivLIamKLPL4wsFsXalFrLn73wkYYSS8D4n7moae5iyDVAUGn8vFqYOA1jTtbDk1s0fPjmzN8yPeeGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8NQzCuPlrVijmCwYl3QmgYaXVlAO0wcCqzUUOUcUdo=;
 b=nRPmkjpfEVDw6/7Rdb1JSJ2OSq1LcG0gc37mvNKOVlt1hUpNWlvO+4Tzk1L7jUSa9G4iqT2zISObKoMBQCanAjkWSPpNrrLdPLrCnbS3kHhkxDKFIVFeFnopWrjvHLH0oHUTF2VN3q3HpFUdOdzisUYoxWF9ab8efjDK/sRjmE8=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4812.namprd12.prod.outlook.com (2603:10b6:5:1ff::24)
 by DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Wed, 12 May
 2021 13:12:27 +0000
Received: from DM6PR12MB4812.namprd12.prod.outlook.com
 ([fe80::52f:e464:d09e:67fa]) by DM6PR12MB4812.namprd12.prod.outlook.com
 ([fe80::52f:e464:d09e:67fa%7]) with mapi id 15.20.4108.031; Wed, 12 May 2021
 13:12:27 +0000
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com,
        linux-input@vger.kernel.org
Cc:     Nehal-Bakulchandra.shah@amd.com, Sandeep.Singh@amd.com,
        shyam-sundar.s-k@amd.com,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 0/2] General bug fixes to amd_sfh driver
Date:   Wed, 12 May 2021 18:41:54 +0530
Message-Id: <20210512131156.740493-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::36) To DM6PR12MB4812.namprd12.prod.outlook.com
 (2603:10b6:5:1ff::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from amd-DAYTONA-X.amd.com (165.204.156.251) by MAXPR01CA0118.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:5d::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Wed, 12 May 2021 13:12:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e4e22b01-ef1a-4660-06ab-08d9154796aa
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB42180CA3813E0114D3C78D97E6529@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: inNhWQBJjg2yZSDEjj+leM0yWCgsPDIoDOPF7sCvIa2qF4X0dMm+vVJlUBeEed6F0K3mTXu6zPcSNRqQptbOal0LjBk11YNVoYGahSMegyrCIJ+rVY6Bs4BOQWTEL+OSuEBHRIlJRUcxNgIw0mtonnSZ94Daw/xpFJ84ePJk+2m+0R+8brn6o7qj/2dxtL4QEUKn1FtfgVv4Ox576DSm0Vn6X6mtLBEwl5lnE0aZtMAUIei/9TOBffunP4DGVNQg7f4yriGSm/EaLIx9wgnvbv09KeKjayvQTcLRrf7mqx2MCLWYIHAxfxSwJYiVJIOShUlTGGAY90HwVK+ibhGqFOc2xTy9TfzNZpM4hwoh1dGOQWIp2v2S+qj0sONXTzRbN+OhmzS7AZy1SAtWLwEptETQByMM3Nbcm9/Dqpp6MK9oEnb++FfXr1xNyQCCrUri8QYNx2cuG8AkTt6BDnzD84vSdms4KIGP2b5P7wkKc2L8BFJ33G7A2PeBl6rVSB2XhNJFlZT3lqrJbvEJL/r564VEw3l7pGVejJ3rRphL+9MGa4zbDiRc7rOpvXAu5bOmCJTEn7SPIn2T7leXwLAFnLiGhwEA6T5U1NwvGBtNPcE+vgSg8/f/bDwcwqUTpSyD6h6EglxsL40uCejaLEokGKx/aS70O7ieB1jtsFp5Wgo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4812.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39860400002)(66556008)(4326008)(8676002)(66476007)(36756003)(316002)(66946007)(186003)(8936002)(7696005)(956004)(2616005)(86362001)(6486002)(26005)(52116002)(16526019)(83380400001)(478600001)(4744005)(5660300002)(38100700002)(1076003)(6666004)(38350700002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?otiVbVXgaUcxo536ktRjNpPzSFGH5yWeSInn6+hHnpPM29ExUDp152LLfiK/?=
 =?us-ascii?Q?U/Mi3HBMd+K1PHbAfBJnYfcAUDWlnD9f2tPP2EDui9mdqMmI9e/wmTK0h/gu?=
 =?us-ascii?Q?cBpmZGMYRIvDjj2mIM5ZWjeFvLmWZIhMXh3kpwo52JE8cHW3j4fHAA7fJrPL?=
 =?us-ascii?Q?7sS3hUldfN1A82Ylz+adCO2qn2gwjOqYz9As4SNvzuiWNvq6gW5fGJER6DMF?=
 =?us-ascii?Q?L2zJV7QRgWo5IKUa6U71U4a7EcSBRc/yFBd/zEzQSFp7LqR+K/BVYgon84XW?=
 =?us-ascii?Q?aL+gASsBNIzU91RPm5pCRsTsZUF1foALWugv5wp+XS+MR8je5CTVTdWE65Tp?=
 =?us-ascii?Q?yyWlwLqgPZX+D1dDtzQE6rAoIP5WZvosKe1a30y/IgUvSiKZNBK8h23+KFsO?=
 =?us-ascii?Q?mfD90XSUzQOSf1CTR2Ax5Vd0ntwtQZYHftfG/qSh3UcRtACBqRNsfFpQO6PJ?=
 =?us-ascii?Q?15lsj10A6MT1BItdFlGX2dbZ4JCn7E7n3CLmsL5rKEnyWrfXzQrhLny3eidJ?=
 =?us-ascii?Q?B7aLauKfkP3PgmNk+WyWnXQqcI0v9SoHffLz3ugGU6iCw38DJOvZnGEBFwel?=
 =?us-ascii?Q?2gxz8nmNO5PD+z++Iz7TBMbzu15lpbHY5mTpHqtK3uWTXHRztcHH/+MpPQqb?=
 =?us-ascii?Q?ovHZYkweEGBxNDNWxrw+klmcsC5j1xVdqJr5+C59xFTgxcxv1OhAuKnSGf5j?=
 =?us-ascii?Q?m3CpUiUB051mUQCVjT9vRaeFuPqQCg1hQwC/531W6mH+YPvPJJMSPtRCQ7WL?=
 =?us-ascii?Q?OhSsr/D7vBcrnK1VDJkvL2UzqRk76kJuCF2/OZQW/iwg27IAoP55/Eq6M2r8?=
 =?us-ascii?Q?WePYGCb8FqcoRjOSDGrNmFGTM22u0WvGQes8qz2GSJj3hLzHb2u4jQk9rvcv?=
 =?us-ascii?Q?TH6wNoj62czrOEtUeD4SHc7nqKkyGHUYwCxmMhfZGWpgo7RLdv8UpWb79jFF?=
 =?us-ascii?Q?V3t38gh575kYhDSrSjePxtRpFrYvlbl5lE9YTxxcXk+8+lhZrdtIoRCzRCYz?=
 =?us-ascii?Q?lPd/22g0lB6xxdEudBkFl+I7qyQ4BR6W61kbeY+ZVphwTJxYr1iLLqd/AzzY?=
 =?us-ascii?Q?ltD1ejy2Iw5iJUgj8STMzHBKd67mfZldvSJy4MBjHl4iOWAukTZ8bFCOSmiF?=
 =?us-ascii?Q?YI+rpHWTMfoCf59I2yP0LtPkoz5gtII8kglcgznTykNcgx5nDu+4zDK39OB9?=
 =?us-ascii?Q?cv560MovNE9HyDIzRaLCuwgwC6lVHuXuoyp7lUVUv420mNzArPSTvUUXizCv?=
 =?us-ascii?Q?z/afkLpu2UXsCRVKfQMGyxdFArrlkt9SoSaShmEbTojdyGS9Gor7Z5VQpyoo?=
 =?us-ascii?Q?LUip45dHt6IdiH9bbbeoK1mvf4yPzhSRpotUFkh9JAMrFA=3D=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4e22b01-ef1a-4660-06ab-08d9154796aa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4812.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 13:12:27.0438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4G1VplbYj14Q7pXEP+77dfH25q8N0PMConyMvfib7RfZv2mmqlAzzPecoMGvtARpLMy9MXpIXQOr2IhuSyoocA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

The allocations which are required lifetime of amd_sfh driver is
changed from kzalloc with devm_kzalloc. This cleans up an exit & error
paths, since the objects does not need to be explicitly freed anymore.

amd_sfh driver with kernel memory detector config enabled. kmemleak
(/sys/kernel/debug/kmemleak): suspected memory leaks in amd_sfh driver.
So added a kfree which frees request_list entry once the processed entry
is removed from the request_list.

Basavaraj Natikar (2):
  amd_sfh: Use devm_kzalloc() instead of kzalloc()
  amd_sfh: Fix memory leak in amd_sfh_work

 drivers/hid/amd-sfh-hid/amd_sfh_client.c | 19 ++++++++++---------
 drivers/hid/amd-sfh-hid/amd_sfh_hid.c    |  3 ---
 2 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.25.1

