Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5168E4B9A85
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 09:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233807AbiBQIGC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 03:06:02 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbiBQIGA (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 03:06:00 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3A527AFDC;
        Thu, 17 Feb 2022 00:05:46 -0800 (PST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21H4b6Dd005175;
        Thu, 17 Feb 2022 08:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=JE2GJt+vAKindPatvcVxN0A1Pf6CfVHUwseM4N+rCsA=;
 b=bEpaeBA+SG2i2sddd5jd4RePoH6ly0AdzgWBGlWT/oDBjdAJQPrm76SvaP8g+cdwOuQK
 W6tktEJ0CNKFM+fDau3VPHMC5iubQLNDNFXtmjI/R6ESyc+p70WNN2f/LSUG2irhV09a
 2DYRwg4v7v6hfKCFCoJDA6eiq5yntN3a/DsUEcz4sbQqHbvRFxO0AxlJL5NRFc3XpDFn
 7bbhjgE5mFEZn3+ouDgyEQ6XoOIQXjbWtyld1U5pmu4V+7p6nazScXKdJ+qGAMd5GYtS
 Xqjba4kVObxYnXczP56nDY/d7IiFqgTg21R+B0CKpbblhAPs+6l7KUMoCcBPt2047E3r xA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e8ncavs95-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Feb 2022 08:05:20 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21H7qVdj160990;
        Thu, 17 Feb 2022 08:05:19 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2046.outbound.protection.outlook.com [104.47.51.46])
        by userp3020.oracle.com with ESMTP id 3e8n4vju91-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 17 Feb 2022 08:05:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7x9M86BTCS0JgUck0LPWOREMmhTol0H6wHFjiIcEj8g0HOxVi4Fp075YvymRfeLp0yPWuhf7ah8DqHtAejZvK9JRqlkCN3WttXFo6/foTfl3dX1Pdw2ffIhHXmWhXs2dOTJspV57Mva6xbhLUubGI0K/BvcZJlutCqcHqFWK8NHmi6Q7nFP1Zza5H3L92Dp4UHUE2ppgYY+03Nz32X4289Ry/Rof/8cs/OrW7U1pUnRBvSUwPpVrssWWkMfA162pi8kRzowFFEQibpUO+V58tjbOtgdx/MYpRFZaMByNkj08lRH2ZhFRG6Cvv+SmYMR3Y6QiVe4/WEla2YUcU619w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JE2GJt+vAKindPatvcVxN0A1Pf6CfVHUwseM4N+rCsA=;
 b=Dgz+/nem3mg1xXU8GSG0nJ4omXp7w57zZ9Xb6z9SYHY88BIfZ+H2oeZ68UK0qS0mUpKpF53AESh2RRDWmGPzrn3hRj2dnh5j7LmA/AAwNImJWeflYcDeAz4/uqJIMuOmNteMa0HXNKPS3APPXgXCgNtvT/d8Mo9XJCfa4TYdAcuOuSdRqcA2AtIBGS8ueXHpB54U5AFWZGWiLGonU41pwtv4RLbxeuxtVFPPvaU/BB2PS6v23xU6MLKu4YFVHLQeSY4TPkcIsOlP4qXgBee4w2XbnC9AGVLsHSL6/9Lk0ONNAoO/W/pSoIw5GankLga5erFfzZb15l/pfHcsxsib6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JE2GJt+vAKindPatvcVxN0A1Pf6CfVHUwseM4N+rCsA=;
 b=t9kB9rYWqSGZeee8aV/dtw+O5iG0gmyW8Xi/X6p2LPo3bp7+XKIuxRZKaM3BT+cx8q1LWkF+up5XXG6tmyO4jVxk6VU87Drp1lxqKNXNZvj9RGXwe4WSJ+ukVTvUKfY2AKiTqauO1g+ic7NbADZi7/NptQOJKP6s2j5C8KhFuB0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB4068.namprd10.prod.outlook.com
 (2603:10b6:a03:1b2::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Thu, 17 Feb
 2022 08:05:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%3]) with mapi id 15.20.4975.019; Thu, 17 Feb 2022
 08:05:16 +0000
Date:   Thu, 17 Feb 2022 11:04:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Salah Triki <salah.triki@gmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
        noralf@tronnes.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        tzimmermann@suse.de
Subject: Re: [PATCH] HID: elo: Fix refcount leak in elo_probe()
Message-ID: <20220217080459.GB2407@kadam>
References: <YgbT4uqSIVY9ku10@rowland.harvard.edu>
 <000000000000d31cac05d7c4da7e@google.com>
 <YgcSbUwiALbmoTvL@rowland.harvard.edu>
 <CAD-N9QX6kTf-Fagz8W00KOM1REhoqQvfTckqZZttMcdSCHmSag@mail.gmail.com>
 <YgpqHEb1CuhIElIP@rowland.harvard.edu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgpqHEb1CuhIElIP@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0021.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4891c38a-edd2-4215-7352-08d9f1ec3ba5
X-MS-TrafficTypeDiagnostic: BY5PR10MB4068:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB4068E7925C848CF4B0B5A5D68E369@BY5PR10MB4068.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rhSUAaAf5/z/aBOZ/I7aamg3YsRyEuoymeeMYXZMVYAx+EAcFIAQSQ5uALthOlP+krkACxSivnA9WAopwYErV0y3B8oBri6mlv9/Gk/VmM4HR5PbMIohQLDAieJMsCPaB1Vgv0hcXDrTU2baxLr3WT2i0mdA99Qx1kCSpAX/bDGI9VQf1S4CWjpKO01xV+XKsYozlpdl3QziUELJj6oWeVGsvefKUhzLpTvzDuVIiiJK2eKw5xS5+hPfS6slnFZ5IftghTsV8I0tS18+CBErWVYlNXjWSW3tkf3eQNY8UND79Z/tO1yQv3hl0Mw3ifxHpwwk0LBLmwt0RyhXV8CrZyvOIN+HVweuDvwhF80CiS5abJpMcUshmyj4Zh3V/UJbsDaARikNAT5Se7G8Sd3Wzjcp9QeUVDYcfT8yyJZhvGU2C/Sljuc4PlUL5Re6NKyX3VzGcmAMpw0gQx5Yx4LJ3zqKbUypJ60jFuzqwiV/gCOj0FYt4IdIeFgTFqaWfoMyTnnYMSH26+riaxOqfcwA4VU4/NefgsCcnKNvnqw/hnhR5e7V9UTXzMb73toXqKx+yej4bhRINnhOPd7xLUIU6v/Wwau7i1BeC1hvX430KQhlSZppGUEeynZLiCAa6HJP80yY3oJGC1CVhTNz3OwZpUE4BLY+C4/W4XAkN6VvsuByyeSVcMFb0wpWxZ2QxUq+NKM/cgBm7+x/4ZWG+gsqqucrv62REdmx8xjdB+pnrEtiwICNktnq/+02QH9lJ2rgDgrCgNiyJllpdh+iL8FaallH85i5BlHHoiM3cxOWxZu6EQqiW2y1CnyzaIJ/W4OaZ7M9Dm5bBBWkFmObEw9nxzuD5YhRZTFPxSQwvJRPcc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38100700002)(8676002)(33716001)(5660300002)(83380400001)(8936002)(66476007)(6486002)(508600001)(7416002)(966005)(1076003)(316002)(38350700002)(6666004)(33656002)(54906003)(66556008)(26005)(2906002)(186003)(66946007)(53546011)(44832011)(52116002)(9686003)(6512007)(6506007)(86362001)(6916009)(4326008)(505234007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/WaSOlp54gZ0wg0bvvLhmipiW/6NlmTM58RSAH16HgNwnNpoofUOqUBNt1ej?=
 =?us-ascii?Q?7MaSZ0q88QSPVNyF39VdSIimB5JUQ3eN58GRN0JMMvZ9twP7GGrTnvZMhkNT?=
 =?us-ascii?Q?oThFHG5/2v8TKgC0NVXfUPTm3d1AO+UkctZFM0wJ+PG8UuFu7BN5WQpSHzcz?=
 =?us-ascii?Q?upLIAa0nJJMcmxe9gQ9RTLhjIcokeYI/vQdzBnhqQLfU6ByCxnAdqEL8fBnd?=
 =?us-ascii?Q?prYZ+oBULRExF6gUwssMYWC9NxrjB0y1wmblFvCka9uk9clwX+9zyFoMohcD?=
 =?us-ascii?Q?6rg0tFjsIFta3YXTu31thCogAm224buFar+316oWtdKzCgo84n9+DmUNKwgr?=
 =?us-ascii?Q?3seu7kQ/5RIO4X4Ffn4mlrIQ86awlROlWkIGLzFdFWpUm02OEGSqEjkSCMsm?=
 =?us-ascii?Q?zF/f+pKgUimAe7BV89qDe1amVuH5OxbglSdsUFNsZmA+nb4aPwNCB+OQ/0NZ?=
 =?us-ascii?Q?ga3xBKvxcIUM4cQCK5Y8/C5Xn8uglxUjoSPkbQRlT+vkJFX8rLq8DO39RxIl?=
 =?us-ascii?Q?CKYV0ITa2pB/hqlUqxbw5BoVemKJBHeL1cxRnlgvNDoNUjvv4/TrXcuAr1uE?=
 =?us-ascii?Q?WmmG35TrJC3na0xL6xBP/d1A2sy8onue2LBrXVX7rN2hZEZJQmJOJR9R8/Sn?=
 =?us-ascii?Q?jZGKw/Eue2Q1WJAcoFH1oxlN4biCauqwBUCmPr5Dc2UgysSbsEHwOv9kuam+?=
 =?us-ascii?Q?tf9GY+SgBdgEyyPVMIj16GXe/aBeDIpb0JCBSVuhvYQdIuE6AQ/Gb77a2J+0?=
 =?us-ascii?Q?gkuBrqWRG9343FisEgD3iqZCdYrGtMDFaF7iLRaFwHwUJ8EC45+E1HY9jYa+?=
 =?us-ascii?Q?vIn1fO3X/+TMnF0ycoe7RklU0oH88rj4NQCLXoTtljiFV2CrCGReeskaWU3E?=
 =?us-ascii?Q?NJB9Vjj3tmbJ3jpkLn2UlebgA0KHk88LuwQKJv/cB3Uvyeim0lxAAp8hXHCb?=
 =?us-ascii?Q?1ztNzE4A7jlhs0o6g+AMQJakaRjS73l+Mpk0i/meMHDbpc2KqWsQNrW968xO?=
 =?us-ascii?Q?4GCrRYKO2n6sVhMx/Id0B+0UpwOnGCH0eqCLbA2XgzaxVRsg6JctDTXjujNG?=
 =?us-ascii?Q?UX3vxJ22ksSB3Ll/B5drYAOHbEQr4io0VpBy+VuUuteZzrijgu7hPBLHvsBA?=
 =?us-ascii?Q?KOyE9onFWQaJkcLNhJWrp3jwpEpRc0azhdQb72efi5/uzUfQS/k3w9MIBju5?=
 =?us-ascii?Q?HjliG26U2JRChLXqAoWQ9ksD5o3mGITTogb/qMf5Q7/hzqh4WSSg7ot+z9Z/?=
 =?us-ascii?Q?6s0Y3Y4bibiv2cNPYE6kVSPA4jEphG9qmzWTUuPs7Pq8l7HmN5Q7bc8523H+?=
 =?us-ascii?Q?pL6WIK/A5cYs3/ML2NoRzL56IdFRi9/HURofO9aie8kHI5EO28UfixRWEYGf?=
 =?us-ascii?Q?ljgD8eqRRUadIuqbDi7rYzQWTQXr2V4F41hCk0FNKHPVMJypsnjNB+1n4HVK?=
 =?us-ascii?Q?0EewaEk2biQS3S2OcgVwbSbit1SzNfStUDN1g/xcYnw924qYS49y5KK7xZ9P?=
 =?us-ascii?Q?CA9ztVshQ+pkafGf/0xM8whe2YAI1Bxj01Uym857PUU1u31ugRc2DiYt+6V6?=
 =?us-ascii?Q?5LEcQ3pyn0rEELjtb+K0MqST2QSsTD8onAwab+uoM456xiMsmUag6QgE6Q+D?=
 =?us-ascii?Q?OAk2iiwwOyZwKlfYPXUrojMBoQN6NwMp/kaIW4LeYrytfpc0WVbmMUl+6FTh?=
 =?us-ascii?Q?Rl5tVQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4891c38a-edd2-4215-7352-08d9f1ec3ba5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2022 08:05:16.6629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wyApNffULVmG9mu2qt6njrLo727jBrSscAC+bJvujnmFypIl6hAts6il+xj2gWowVFnnkxs6svokpBKlhlKsMNU4+hi3LXVstanTCOaEjXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4068
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10260 signatures=675971
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202170035
X-Proofpoint-ORIG-GUID: PvJpCo7xIGQZTFT3mZPrURU3Sj484uze
X-Proofpoint-GUID: PvJpCo7xIGQZTFT3mZPrURU3Sj484uze
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 14, 2022 at 09:41:32AM -0500, Alan Stern wrote:
> On Mon, Feb 14, 2022 at 03:34:42PM +0800, Dongliang Mu wrote:
> > On Sat, Feb 12, 2022 at 9:50 AM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > Syzbot identified a refcount leak in the hid-elo driver:
> > >
> > > BUG: memory leak
> > > unreferenced object 0xffff88810d49e800 (size 2048):
> > >   comm "kworker/1:1", pid 25, jiffies 4294954629 (age 16.460s)
> > >   hex dump (first 32 bytes):
> > >     ff ff ff ff 31 00 00 00 00 00 00 00 00 00 00 00  ....1...........
> > >     00 00 00 00 00 00 00 00 00 00 00 00 03 00 00 00  ................
> > >   backtrace:
> > >     [<ffffffff82c87a62>] kmalloc include/linux/slab.h:581 [inline]
> > >     [<ffffffff82c87a62>] kzalloc include/linux/slab.h:715 [inline]
> > >     [<ffffffff82c87a62>] usb_alloc_dev+0x32/0x450 drivers/usb/core/usb.c:582
> > >     [<ffffffff82c91a47>] hub_port_connect drivers/usb/core/hub.c:5260 [inline]
> > >     [<ffffffff82c91a47>] hub_port_connect_change drivers/usb/core/hub.c:5502 [inline]
> > >     [<ffffffff82c91a47>] port_event drivers/usb/core/hub.c:5660 [inline]
> > >     [<ffffffff82c91a47>] hub_event+0x1097/0x21a0 drivers/usb/core/hub.c:5742
> > >     [<ffffffff8126c3ef>] process_one_work+0x2bf/0x600 kernel/workqueue.c:2307
> > >     [<ffffffff8126ccd9>] worker_thread+0x59/0x5b0 kernel/workqueue.c:2454
> > >     [<ffffffff81276765>] kthread+0x125/0x160 kernel/kthread.c:377
> > >     [<ffffffff810022ff>] ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
> > >
> > > Not shown in the bug report but present in the console log:
> > >
> > > [  182.014764][ T3257] elo 0003:04E7:0030.0006: item fetching failed at offset 0/1
> > > [  182.022255][ T3257] elo 0003:04E7:0030.0006: parse failed
> > > [  182.027904][ T3257] elo: probe of 0003:04E7:0030.0006 failed with error -22
> > > [  182.214767][ T3257] usb 1-1: USB disconnect, device number 7
> > > [  188.090199][ T3604] kmemleak: 3 new suspected memory leaks (see /sys/kernel/debug/kmemleak)
> > > BUG: memory leak
> > >
> > > which points to hid-elo as the buggy driver.
> > >
> > > The leak is caused by elo_probe() failing to release the reference it
> > > holds to the struct usb_device in its failure pathway.  In the end the
> > > driver doesn't need to take this reference at all, because the
> > 
> > Hi Alan,
> > 
> > My patch "[PATCH] hid: elo: fix memory leak in elo_probe" is merged
> > several weeks ago.
> 
> Really?  It still isn't in Linus's tree as of 5.17-rc4.  I would expect 
> a bug fix to go upstream as soon as possible.
> 
> > However, I fix this bug by modifying the error handling code in
> > elo_probe. If you think the refcount is not necessary, maybe a new
> > patch to remove the refcount is better.
> 
> The refcount was added less than a year ago by Salah Triki in commit 
> fbf42729d0e9 ("HID: elo: update the reference count of the usb device 
> structure"), but the commit message doesn't explain why it is 
> necessary.  There certainly isn't any obvious reason for it; the driver 
> doesn't release any references after elo_remove() returns and we know 
> that the usb_device structure won't be deallocated before the driver 
> gets unbound.

Salah sent a bunch of these.  The reasoning was explained in this email.

https://www.spinics.net/lists/kernel/msg4026672.html

When he resent the patch, Greg said that taking the reference wasn't
needed so the patch wasn't applied.  (Also it had the same reference
leak so that's a second reason it wasn't applied).

https://lkml.org/lkml/2021/8/4/324

So someone should go through and revert all of Salah's bogus usb_get_dev()
patches.

regards,
dan carpenter
