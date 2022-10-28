Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3E7561129C
	for <lists+linux-input@lfdr.de>; Fri, 28 Oct 2022 15:25:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiJ1NZU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Oct 2022 09:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbiJ1NZS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Oct 2022 09:25:18 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAC85F81;
        Fri, 28 Oct 2022 06:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f5Q+tMO6qwbCyKBb7UyoG35xK2VPLouD2iAnOXOcQ+lCJwNLTqWogsSTgl9d5pRWi8O34TMEivqPjicvOZdqY/5jgQR70715sM2zeOjQfyx68TfCf6i6dG7dqGZOG8TkOX5DDQ/t5MIlzNrX1m/epRt0uXD4n7Ha6GlYmGgVzimHd6rwabFN8FXx7H6rh84n56bGwMBJUMtz/qwakgRx1DroUGU1SpDBsh0ubJJgNHo34ZEIQFyalL6Bz2SEGs20+RRL+oiUVdq+1HmteSicp/cW6VmVs5SGrZBFCSeqbwjhXxXVBcJh60CcuS5y1K7LNmEplREEcfOzlgMMCGPFGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4AEBgAlqC9wjLQNxKcJ0sFq+7CccHYY4pv4OVcCm6GI=;
 b=G9XX2/W4vVQLD9sF1GeKYGG3MkEA/fnTSdYQPZs4T+p+9EIuHGT8Snm0bbIVXi7Exxaz6bPfJjjxmqSIF068EyWuW4eEnExPXdq0GpuChUj4mC/+bpjJD0d7hNTgnTJdSfWzefjUgAvFoRiAVlSGKCHDb6FnpVYz3JqcBULUYBcFhcpmY4bdkirnG1+HjOSxs5a5xT+fzmUcscuqZ7NDgXYCu+shDR48rA/EcV3VzqsGuLRD4RbGLwwgNNdmc5KQRv+ryphKRQk4XtnkcKt2iJJuFLQFuD3cKKblWwvr3UavebTenzQDXFOd2oQYOEuVoRcOmeRw8535VxAYurxWbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4AEBgAlqC9wjLQNxKcJ0sFq+7CccHYY4pv4OVcCm6GI=;
 b=Xp9XXMqeHmx8WMhw0zQQIpbHFjRsvBFPiqp5Bow/Xm/EuxRu1ReJQLBUyMzq/aPaoVbpYPwELA6qR8K//d0mDtU+EeWG/t6asbFpRdHGQF6AQGJu9C2/592/9dy+xfDTibqRDldaDchoz74HCJJptRJIPHhlrRX4BFT4dJOwaxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by DM6PR08MB6364.namprd08.prod.outlook.com
 (2603:10b6:5:1eb::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 13:25:13 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::afa7:70e3:c2c9:b680%7]) with mapi id 15.20.5746.023; Fri, 28 Oct 2022
 13:25:13 +0000
Date:   Fri, 28 Oct 2022 08:25:07 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/7] Additional fixes for Azoteq IQS7222A/B/C
Message-ID: <Y1vYM0Fe323qZupM@nixie71>
References: <Y1SQ2t6yUvdaIQPG@nixie71>
 <87pmectm8a.fsf@baylibre.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pmectm8a.fsf@baylibre.com>
X-ClientProxiedBy: DM6PR21CA0017.namprd21.prod.outlook.com
 (2603:10b6:5:174::27) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|DM6PR08MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: 45c3f149-245b-40a9-8d2d-08dab8e7d80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ku+ixZ3ZfB7kBMCiJKbgYxfFnfTv3He4XewxM1WLgXB4iAfLjyL58JO3CidveTZbKVV+W7Bj9rc51db5echs+d9KHSErunGIgV86gIS4PrIUyAl2vFUwZt/PeMtpQEZlgNTAVOQcREFIpXzVa8qJv1R2or+MB1hoDYu3XvuQ2pXwpksWerBtnZxvYmfNXd+lcOCUZ9PzCv/YN3RNWI6KpqcL6NPf41Eo+08CUu2LvvUs0ZwYqKYuYLsY5lziMWUw4F6cYmR5zz2I4+QT+EmUiKYPrDXBwvL/7GHNNeLJ+i1l362hDf8bdS188afE3ZJVvHZk+PdRwFOvIF1fmjvSmtyUngivF/Euh4VCLRmEi1Xr9YIszr7Zn9F8ekMDgO3Y5S2z2hNEvAUOh3+8LWR2Y2VfAHC8DOSQAWQN9/XRfY/T/zad+dYc+NcVsIwaborCw1kkF4fPCa149678dP4KkPtAyZDJrHwxuAONVKhMu+ElsFCqBAAezdW0K5Au3FMSp0Zxu3nHdrrzmy8hvUUnR5PMEH2ZANBKa9bifFnLz/yvVoJ6610Edl9xY1YfnMMNkLaci625TAyVg8mI/Evw5935B1lCad/MT+6EGNrJ9wg8luA6k2sTii5Thdf+VQZB0kmh/3vkNH+zu1z9CkE8a6JUufj/lsuQtrAW9fMojN6Gtp6knDrIVzPSPgYb3TnISvCc392fHOh91aNyk91MNg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39830400003)(376002)(136003)(366004)(346002)(396003)(451199015)(6666004)(8936002)(2906002)(9686003)(6512007)(86362001)(26005)(41300700001)(186003)(5660300002)(8676002)(6506007)(4326008)(38100700002)(316002)(66476007)(66556008)(66946007)(83380400001)(6486002)(478600001)(33716001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qN8+DnZkQx1V65dK9ZGuaIMVNyx054rGpM7sUZ9k55Yjnlda4lkJgc30swCD?=
 =?us-ascii?Q?g1Pkx1PWldKXGECy76JbQMusHMQDOpaeJ/ai7jPpPV0qk/RVF2+KE9mChBao?=
 =?us-ascii?Q?jHgXSSSAVfa4cmpCp+WN0scl7knX3Bhzrpy9NKpzIu3mw1rCVu+1HoLyEC8i?=
 =?us-ascii?Q?YnB+3Pb0PvhDy2zPJUr9AaERw8LrWdLAC/CNOqjG75P7wgX/HEDKGfA1Hdqo?=
 =?us-ascii?Q?ozKI14ck1xjk60qeoOAOU+TT4jDkPwo3xqANgXMUuUg8/RH3ybHFtf3WFnYx?=
 =?us-ascii?Q?UAIuGVED57nXaiMGozmbLyetbngcd47xh8MlVQhm0lC+l3HmFajS8wcJ6Wfb?=
 =?us-ascii?Q?kIJLPFF6vcz1kX0/oVtGykMMbrjik/dISz472m+ZLbqd3yXoPjyQ5EKtU1lL?=
 =?us-ascii?Q?WUo1u8fWmoZyUzFhNQ5xKCrjJEaHQiPFbl9jBd5afQbuN8YqlKheJGItUkgm?=
 =?us-ascii?Q?zbYFms0VBoXEE/1LbuuE2zKv86jjk91l9U/CPvHgCPuFMznrulYO9eU/O+dy?=
 =?us-ascii?Q?5VLEPsKHpHUdeao6xLBlzEi+46G046urjl1Xb5lenardJzZATjIpyOruVXzC?=
 =?us-ascii?Q?LVcoOYcfyEoUAY4U7qLkbhiDN8OOwTmBVuiyHLImUB8ya/VnNtXIESESgrON?=
 =?us-ascii?Q?PWqaQdx4MmrXg8EbpEGRIVKA+Q+IvZA9yX4jUI33YgTsPPtvJPFLKZkR/sob?=
 =?us-ascii?Q?Caot5D0TDm9aVTCbOvmiQfbkY2DLzmUmWnIsPwMcsfs/1TIo7hSF9Sr94ovf?=
 =?us-ascii?Q?8pLiCs42+Kkp2q2rLGGx0VuRiefpdo1aPvroJFFXY6rJSJRzk34UB7+7Wor6?=
 =?us-ascii?Q?82utlWRnxASNjQSUmWRuZP2Zmm0/9WWGffYWQF2nMdVPZOPBNZG/YAe+h0Hs?=
 =?us-ascii?Q?PZI/ufuFy6JLlsug2Svq5FbABUvdKxLtU39jl9EPt2HgANp2d5a95NMskNIw?=
 =?us-ascii?Q?MEOCc4D2/CglInKf9JMmVaKCxWFrKVPO5y4JuYtJLT/yRmHEDVN9TuLrmabH?=
 =?us-ascii?Q?BPW+1mgl6kIYGmMFg9Kv7mpboZDptBn01bNB49d/mW6JYoNC3mcVmFPln/5A?=
 =?us-ascii?Q?K6g+zOfv+fwioChEBHUZ1qIcaB04tpg4QpSbakHc0w38weHlfctQO7TxqA+M?=
 =?us-ascii?Q?AvUXqYbWQT9D70jklRhLICRTkob8YvkH8cBRiGz/F+xVg5jZa+/LuULR8Eq6?=
 =?us-ascii?Q?BsTDcbClVQa7H44jvAUwzbbM91j7/9E2VTqGEKJjV4VI5RCHGUovOmsJ5hua?=
 =?us-ascii?Q?gS3yzXFYlqr8j9pkp9iAKcs2QzcosHP/5rFR1P4+UfNA4v4EAOlNn3R8oDsA?=
 =?us-ascii?Q?Ya7wQuIQBJQhx3PcEHa3cM7fjk46wbMkkAN0Izf2ZkSQsar27OzMOEDhxGMn?=
 =?us-ascii?Q?cuO7YJHIrisYWXn6ZSQwCv6LW1Mm/6RiHFao+dQgNFlMI/xseyLPG8/ooFeS?=
 =?us-ascii?Q?3vHIK8w0bj4TI+RCLg3RTg4fVGJ0B0i5sDXagxUop+LqHt8YQDF5ncM/xsdZ?=
 =?us-ascii?Q?KzYnBkcUaAX/Dlq8k7RUMXGn5x932mn4ex30shI/8kWgRs8+4fKMyltLJomB?=
 =?us-ascii?Q?gmCdBJGNzpzp3A3KKoqeOmyDadIev0v3JL+i5h3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45c3f149-245b-40a9-8d2d-08dab8e7d80b
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 13:25:13.2156
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSuMEl6m528mZ1bfT7yFls6Ky+fRXarIxSaOeC8wNkmMrav39QXnYLjpSfBU5q1D2owNyJ0yo8PhaCrJxY+htA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB6364
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Mattijs,

Thank you for reaching out and helping to review this series.

On Fri, Oct 28, 2022 at 09:56:37AM +0200, Mattijs Korpershoek wrote:
> On sam., oct. 22, 2022 at 19:54, Jeff LaBundy <jeff@labundy.com> wrote:
> 
> > This series comprises a second round of fixes that result from
> > continued testing and updated guidance from the vendor.
> >
> > Jeff LaBundy (7):
> >   Input: iqs7222 - drop unused device node references
> >   dt-bindings: input: iqs7222: Reduce 'linux,code' to optional
> >   Input: iqs7222 - report malformed properties
> >   dt-bindings: input: iqs7222: Correct minimum slider size
> >   Input: iqs7222 - protect against undefined slider size
> >   dt-bindings: input: iqs7222: Add support for IQS7222A v1.13+
> >   Input: iqs7222 - add support for IQS7222A v1.13+
> >
> >  .../bindings/input/azoteq,iqs7222.yaml        |  25 +-
> >  drivers/input/misc/iqs7222.c                  | 504 +++++++++++-------
> >  2 files changed, 311 insertions(+), 218 deletions(-)
> 
> Not sure this requires a re-send, but the series seems ill-formatted.
> all patches are posted separately to the list instead of replying to the
> cover letter. Is that expected?

Yes, this was a goof on my part. I see that the series is threaded
properly on Patchwork but not on lore.kernel.org.

Much to my dismay, my mail service recently began enforcing OAuth2
but declined to enable app-specific passwords as Gmail and others
do. I can therefore no longer use git send-email directly and I am
instead emulating it with a script that tunnels patches through mutt.

In this last series, my script inadvertenly dropped the '< >' from
the cover letter's message ID, so some mailers may see this series
as seven separate threads. This is fixed now.

That being said, I see this series was already applied earlier this
week; I think a mail simply did not go out. So no further action is
needed.

> 
> >
> > -- 
> > 2.34.1

Kind regards,
Jeff LaBundy
