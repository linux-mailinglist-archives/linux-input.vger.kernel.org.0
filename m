Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 877693047F2
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 20:14:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388891AbhAZFyH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 00:54:07 -0500
Received: from mail-co1nam11on2058.outbound.protection.outlook.com ([40.107.220.58]:34817
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728986AbhAZCz6 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jan 2021 21:55:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MrkOybC2J8HvLzZjXMo/Ct2Q/OjJI1gaC+/OkxIqLYtRHYpRqsbdQEBZI6s2tIRoY6hnKKDTKyJdbPFaR2TfBf2B9/3pJqDyECS8nKMXhvqA10GTyWdouycxpwqzXSSwqIMRzmCAi1lZwrmRgJm7Kjrnl1CMDlqb6vtcxRrY2W9n/OTSnyRdZh8m6jIox30ZAu2sHK8mVn63n0iU+bXUi39YD9RRcBtTtx6Eet1Gp3g4YQqOoqf7MgREJg5DSlYmkNSfyDNjbtwqp1Az83Z4lAkUZ3Nr+v+NZPQXHv3jHuzzjaAD7IRKxgGdExYG3q1pEylojbfVyzoS2sa9y3T7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jzce4+lOB3UlsibE6Rsn0PJmbx+T3ZOAO/4FBDpMCAA=;
 b=n6lBg8201Eciek6JK3GuA8v4MYPUndj+VOI6XtdhuLxnl+bZJKL5HjDPcu+tjaKRSE46EKhWSix2pPPyPrlmX46JVaKlf3KFZ3VAXeoR4TNWWkzVKPOfNYBx4qDSjNxjkod1hgKACocRwzG4E1FDdVVxwAzZzX7yYf85qhGQ4Dt9wMahR/cJSdIfNtN4dx1AzfYVSlRD8MuVpC45dO5D8h8kb+6T8GYc0tS6PRHWrPY3AMaJ9iotqbStaBaCrEvt4Peac///Tqv1siDG8ll/SYrTtaibCva+WPPDort1SiokDQNjaSfXk1k38gjTrBkB0DRGvKI4LZUqFVcfj1LSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jzce4+lOB3UlsibE6Rsn0PJmbx+T3ZOAO/4FBDpMCAA=;
 b=rC2g8R49r5Jtu54vQSW7Dwngxz0ckxHXsTPIurdY1IQs0X3Bw83BYJDaHyWxxvdb0n6zRPQv8vEkwmS+gV1uLbRWAMVxvWeztKFQY/qfxpCznMnIKIHIZIeo2mh5NYtc7VDyD6e54AbHdEc9bKlvniCKyexj8x7WE/BhDOepaUc=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN6PR08MB4349.namprd08.prod.outlook.com (2603:10b6:805:2e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 02:55:00 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::972:c257:aa68:9be0%4]) with mapi id 15.20.3763.019; Tue, 26 Jan 2021
 02:54:59 +0000
Date:   Mon, 25 Jan 2021 20:54:55 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH 04/10] input: iqs5xx: Expose firmware revision to user
 space
Message-ID: <20210126025455.GA6155@labundy.com>
References: <1611002626-5889-1-git-send-email-jeff@labundy.com>
 <1611002626-5889-5-git-send-email-jeff@labundy.com>
 <YA5HaeHha1fTXARp@google.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YA5HaeHha1fTXARp@google.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.173.128]
X-ClientProxiedBy: SA9PR13CA0069.namprd13.prod.outlook.com
 (2603:10b6:806:23::14) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.173.128) by SA9PR13CA0069.namprd13.prod.outlook.com (2603:10b6:806:23::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.7 via Frontend Transport; Tue, 26 Jan 2021 02:54:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4735be87-7628-493a-60b1-08d8c1a5c530
X-MS-TrafficTypeDiagnostic: SN6PR08MB4349:
X-Microsoft-Antispam-PRVS: <SN6PR08MB434910D19A5350B7EEFC60C6D3BC9@SN6PR08MB4349.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PQveMIByufQwqwXW8c55AQP/hdF2IJmx4wQQ/fB2MP5BYZDZhhXN1weHOTXpuv+eXS8TcMugY33RqgEpPfC+yyLyVR8hji2llO1pjHgdDgJ00wNhCpTCUVejc1B2fAxeI7TgSOujS+Mf2tgikksyI1WtRHM07I7K6xJ3H2ReTAFvfKajylbl1KpkTcRGbjG1cdUH+NZ7/d6UCgSd/uedmgoxu59NawjUT1iKb1dtw0DoUAnk1Xk/tfn9Mb4a4Zfdj5whsM5BhBxRM7CpXkp7RV7a9sJ2h48Ya0PJYd1tGQVoyMtJPp+dqn5DpoMwi9Gunwz9/xZ/VR6Ifp+1fIHHfcHJqJwKHOmFYq0CwEU1d0nlQphLC9ACzKXZmDenUEWhLyn0CficV7+BF0wtnJOmetmdC/4PZ8wBoS3f76XnKa/dlZnQkUZAQ8Ugs4kdzgkL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(366004)(396003)(376002)(136003)(346002)(26005)(16526019)(186003)(8676002)(33656002)(66946007)(2616005)(36756003)(956004)(4326008)(66476007)(66556008)(316002)(1076003)(8886007)(6666004)(478600001)(6916009)(8936002)(55016002)(52116002)(7696005)(86362001)(5660300002)(2906002)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?gD+mynXhDdT7u33g5joLyaMaPg8U1dH5xCcvCjoSJLZKxnc26+Lg9Eoa1VGb?=
 =?us-ascii?Q?2knlfNW/n/Sz/hNAnuk1BwOnF7cJn8eOX6/lauFV6j9qJHno0hctJ3/xdtc9?=
 =?us-ascii?Q?2516zEJ3IuY66/yziOP29/k7HmstiK58C8losF/ds+kTZfmjdWj+FF069c6F?=
 =?us-ascii?Q?h7zgubN2U79PlgL8ShzQ1rWYpyjd1+KBXDNa7J0wVA1lp+xOhLHuje2T68Vl?=
 =?us-ascii?Q?OaNEft/CsYJTRnP5aB+qjC98MZ0QNcHMliidOtAYVly8FNwBZAnsMYSgmTZs?=
 =?us-ascii?Q?BiEb4KFp3DG+pyIF7FJyL38wGIwVX1FCcj+EwexVU6/VTiwVN9nxiZmdnKoU?=
 =?us-ascii?Q?0+wFN5fo2weItnWVNHAaXiSPN9TcR3mcscN0wFgEpiopEzoFgIwpqEiNmM2c?=
 =?us-ascii?Q?wbPy98mi9V0Szt3tb8heM0cWqHT2tVp18CjK6Dw1oSB1lFCgRvi15Uja7Dod?=
 =?us-ascii?Q?2BR/coQXtfrRxvMVWfJMgxFdlXmm/IZcOimLRxEjH2qY+O5KXVzh5zo/tngi?=
 =?us-ascii?Q?Z0GLRL9aItVzjdGxjXmsShiGDC08RQxRA0b5w78+ERtEBH8I0j//yfF9LOtV?=
 =?us-ascii?Q?ZPBN/Weicg5otDw9e/Ny9oSYdMb02OPuCB8ibfX3DJJBs6TaaLzOjYojH1+8?=
 =?us-ascii?Q?nIgfExuH9m8KaS3vLUHEl1QPayni30m2ObBSyJ6jA/w7JODLQjk7zBSeghMy?=
 =?us-ascii?Q?Q0yGb6qIUPIWGneVukH7bTmx0ja/YIrqlkMq+/SLRy32/mQLBCDDOcHCtySd?=
 =?us-ascii?Q?N+2fCUmZ5ejg9hlAbAFHgInALZ23Wm9gBuEbCD+TCFQxdAXbw1IzfiDK3Mc9?=
 =?us-ascii?Q?jR889BbSGjxnKjzwIMOSWJA5ICdfErUe7qDlpVgNx7qQN+qcLaprgtVaw+bw?=
 =?us-ascii?Q?MjSamal0P3vCW8hSbuN+i95RXuV04yx2dM/mMb0kj5vDtqGbsQf2w29+KMyH?=
 =?us-ascii?Q?nz2WVl1QZ37kb5Ue/YWpEJW1dt5oCq/Tgu2xHMSP79/uf2TpefM6JHXMR+vF?=
 =?us-ascii?Q?jXK+9rRZwFov6IetJXbKHptxwQzCgx0Ve51UUMh7muAqTZ29nlww5ARA75NQ?=
 =?us-ascii?Q?B64yM1EX?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4735be87-7628-493a-60b1-08d8c1a5c530
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 02:54:59.7916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cpwEr0y1T2hcFADyYRQJpAcdxFxGiTVgr5rRQw0I/IBbCJNkyWu0u7o/SlmL9L4E/w3dYzwuWqtKRSpHsBHhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR08MB4349
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Thank you for taking a look at this series and I do apologize for the
complaint from the bot this morning.

On Sun, Jan 24, 2021 at 08:22:01PM -0800, Dmitry Torokhov wrote:
> Hi Jeff,
> 
> On Mon, Jan 18, 2021 at 02:43:40PM -0600, Jeff LaBundy wrote:
> > The device's firmware accommodates a revision field that customers
> > can assign when firmware is exported from the vendor's development
> > tool. Having the ability to read this field from user space can be
> > useful during development.
> > 
> > As such, promote the fw_file attribute from W/O to R/W. Writing to
> > the attribute pushes firmware to the device as normal, but reading
> > from it will now return the customer-assigned revision field as an
> > unsigned integer (e.g. 256 = 1.0, 257 = 1.1 and so on).
> 
> No, let's not overload this attribute and instead create a dedicated
> fw_version or similar read-only attribute to expose active firmware
> version to userspace.

Not a problem; I'll create a new R/O attribute for this purpose.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
