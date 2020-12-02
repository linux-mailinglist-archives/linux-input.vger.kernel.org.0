Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6E92CB4BB
	for <lists+linux-input@lfdr.de>; Wed,  2 Dec 2020 06:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728324AbgLBFyt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 2 Dec 2020 00:54:49 -0500
Received: from mail-mw2nam12on2053.outbound.protection.outlook.com ([40.107.244.53]:6784
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725984AbgLBFyt (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 2 Dec 2020 00:54:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iQc2LLHowKleEHsxKKaDVhK+V5IpgxuMJu4aKq1KVqTZmGwfek5fBiGtS/YlafBIz5xh/EwTLWPtjWpbweDlPbFqhtrVjELcg4T7FEzWDh1DrepXxB/6es48wT59g6pdf/62DuhB60x2R3dXhBmBSwmpgvD10Sr0uamAaSVJHkTN6+1oT4ume2ReINmg7MClqQx2/tl2qtWtUjx1bkL7A48vjQPUmdLOpJax78zgbOJ/4PMPibSq0lFvqvkRLcAagh42DKRgnaXMfDyVP7LUeAvVqNHGjtsXQILS6fAt5ynkP5PahFwCMWPmo/R2pBcsMIkwpEzc4NXzscF0Nvd0MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FbnGcpvtMFQmrTnjY7ihLjO8s2uPrPuXmXpLul5gQQ=;
 b=K+f3Bsi1bE+AR//gTh5+0VAqgc1M/xqLjYQq/0H/G6Cpnmdf/jm/2ItiDOEKXZbGh7XWjDiJtNtEIHzmnJoNRY/+05y6gU1WRECHvyddJuUg3AmYkqP+A4TxXkXJiI1yuA3u7nI62NsKPMRdnEP+OQR9XH9so5ZKwUD0wvGHsRRzr5255TgGJ3fXEdKb83ZiKg1fzy7o566ss/0pyNPx3idORYwQfp+90GbGp+74hB9DLFqJHPNt1N+3XBrmA0Hfz9MAm1hV7bGqAe3JlElmQ4n9vzUPpBj+anUonWmq4zKA18+68oqG6BFF0NyTK06/mIz40UNwe2PaX9eAzduJJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FbnGcpvtMFQmrTnjY7ihLjO8s2uPrPuXmXpLul5gQQ=;
 b=d0uGB6UWTVgoUISretDSQg9PEnpDVQUjOJ0QUiZs1MAhMiLL5FglrLOfclncMmSaWFuQt4J7w0vej/j49HHV4IYFCON9OtAsa4YkNQlIoK9D4Lkq+WvZMr0rY/iU7RNyqxuKaKXKtgCYXp3b/uJ/kbbg50WBszaGUzcSulDE+aE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=labundy.com;
Received: from SN6PR08MB5517.namprd08.prod.outlook.com (2603:10b6:805:fb::32)
 by SN4PR0801MB3712.namprd08.prod.outlook.com (2603:10b6:803:4f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 05:53:56 +0000
Received: from SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::1c46:3d4c:10eb:1219]) by SN6PR08MB5517.namprd08.prod.outlook.com
 ([fe80::1c46:3d4c:10eb:1219%4]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 05:53:55 +0000
Date:   Tue, 1 Dec 2020 23:53:50 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] input: Add support for Azoteq IQS626A
Message-ID: <20201202055350.GA2709@labundy.com>
References: <1606084748-4097-1-git-send-email-jeff@labundy.com>
 <1606084748-4097-3-git-send-email-jeff@labundy.com>
 <20201123070307.GE2034289@dtor-ws>
 <20201124001516.GA6249@labundy.com>
 <20201201070106.GS2034289@dtor-ws>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201070106.GS2034289@dtor-ws>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [136.49.227.119]
X-ClientProxiedBy: SA0PR11CA0061.namprd11.prod.outlook.com
 (2603:10b6:806:d2::6) To SN6PR08MB5517.namprd08.prod.outlook.com
 (2603:10b6:805:fb::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from labundy.com (136.49.227.119) by SA0PR11CA0061.namprd11.prod.outlook.com (2603:10b6:806:d2::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 05:53:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3f053e9-7556-478f-f8b9-08d89686a768
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3712:
X-Microsoft-Antispam-PRVS: <SN4PR0801MB3712F0CC364DF1659DDAD409D3F30@SN4PR0801MB3712.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DAC9jaPpXhAgI+cytynkk4ZI5AiUJmLTwv1r7yfDQbtG+ZPtUu1Xm6pXj7of+dA6jEvEfQohwskveNqg1eZw2M3hqdhFslJDF8JbHOTMNlWwswhvTcrmJl2RWCLMHQ8kiQBs72VWWML4PwMJAG5VxuTJjUE350POxbsognqkkqMybURfbb0mDvaqoa+4AFBK0D9zPjJgUAFnphUw7VPMEP7ijLtYvB4O+qrvgvygfw/JKF1mI82xpTuLnYO/V7A4RuwWnZhjkCT+P1xZWgwVLS1q4+IO5UW9AUZ78BxYT6vvVe+Ff0fyXzF86u4k2y40QA0vjWbpPytWJK86/vOC4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR08MB5517.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(136003)(39830400003)(376002)(346002)(36756003)(7696005)(33656002)(8676002)(8886007)(6916009)(52116002)(2616005)(956004)(26005)(16526019)(6666004)(186003)(316002)(55016002)(4326008)(478600001)(2906002)(86362001)(1076003)(83380400001)(66556008)(5660300002)(66946007)(8936002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SPIcpw93sGjvl7GQXlkfcm4cPMQqIkEArq+YcV6RckbSzYHEgau4y1arobwc?=
 =?us-ascii?Q?VYt/sjfWQqYrJ/4hGD7ersqdPu9UiS5U8zIP4kl/F3DcDK9dpc3+byX2BQ0H?=
 =?us-ascii?Q?DX5V5fsx1ZNzAiqrZMZH5FG+w+5LSKzh4Dz4eNO+nEZQqfNIPHvm5OFFzfjJ?=
 =?us-ascii?Q?CbtuE8543Qt/VN2YrxQphKQacDh8y0fS/cgUqEcsXE2arviXkmgvLt2ua7kv?=
 =?us-ascii?Q?8WorGLB+zhepZvxuiE2j65pAwdIZZ7R8PdUgNlji8bEDpV0d3hBC4DKdR3fh?=
 =?us-ascii?Q?gdF7hnAD9sMQBp091zPdB9cBS3uMW7aZV2V9JihRDtZ3kuocRy9+8ZxXdJev?=
 =?us-ascii?Q?aBNs+1J8bGkF/ST/tPmXlce/SneYFwvd3EoSLlKPH6L7p/boRATH656ILUcr?=
 =?us-ascii?Q?5iREQzF3xFSzqiDKOMoeYgHqyGOasJ6ev9lXIXrtxDaO2OxMwx6bYhnlFx2e?=
 =?us-ascii?Q?OiYu30QJHa45lAhhQlBbAA5pVy/dogNVsywKbnaUnpygxhWGrr1wQpOJbzVE?=
 =?us-ascii?Q?8ca3rA9NHaHagRJxMnt4dWUxGT3EqK8fKzROD/Bd2GMj2AMRtYbhOCn5HF0f?=
 =?us-ascii?Q?HVmYb74PD0YVro7GbB1SZAMwOWAwTYrDSMlsj48F03046kFdIVaDoStbGVos?=
 =?us-ascii?Q?Ej+ixpclnOezra228ZO9aqrkaJhsDOO+vcqlC5YxoIVJHdAIxEx98nZbK6DR?=
 =?us-ascii?Q?9885XENi++ikhjgoMt1zoG0PorBDLZSmNkwlwUlMwBuKLbfe+ZxqqyGV1AO2?=
 =?us-ascii?Q?O3nbELhms/np8nMxwz/3Y3T5wqGC0NhIAKRMSZCcemIMRBimeCTlVbgR2qdI?=
 =?us-ascii?Q?CcznlAeC7ZlaG4laOv2sORZSRJXQHr6Q5eyinLwZSln8tjgl7TEw1d2nG8a0?=
 =?us-ascii?Q?AwpF1dIPK4WBYyincVwVVmUapkgqeXx9aBkkoNwrUupyLtEjMEZinPQKGm7A?=
 =?us-ascii?Q?h+TTeldb74L3URr27hYx7gBnsSnF/zi8Q+LP+X9/A4doy/dUEzy4Hw5bTtI5?=
 =?us-ascii?Q?jCqt?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f053e9-7556-478f-f8b9-08d89686a768
X-MS-Exchange-CrossTenant-AuthSource: SN6PR08MB5517.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 05:53:55.5331
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApCIGs7ri+KtrfsPVQ11RGvsy3D/3b5DIYcYOJpnOL+gmwdoWxdsIDO10o23xbFAPIViHe0k7KwZ788yDVT0JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB3712
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

On Mon, Nov 30, 2020 at 11:01:06PM -0800, Dmitry Torokhov wrote:
> On Mon, Nov 23, 2020 at 06:15:16PM -0600, Jeff LaBundy wrote:
> > Hi Dmitry,
> > 
> > Thank you for taking a look.
> > 
> > On Sun, Nov 22, 2020 at 11:03:07PM -0800, Dmitry Torokhov wrote:
> > > Hi Jeff,
> > > 
> > > On Sun, Nov 22, 2020 at 04:39:08PM -0600, Jeff LaBundy wrote:
> > > > +
> > > > +		if ((sys_reg->active & tp_mask) == tp_mask)
> > > > +			input_set_abs_params(iqs626->trackpad,
> > > > +					     ABS_X, 0, 255, 0, 0);
> > > > +		else
> > > > +			input_set_abs_params(iqs626->trackpad,
> > > > +					     ABS_X, 0, 128, 0, 0);
> > > > +#ifdef CONFIG_TOUCHSCREEN_PROPERTIES
> > > > +		touchscreen_parse_properties(iqs626->trackpad, false,
> > > > +					     &iqs626->prop);
> > > > +#endif /* CONFIG_TOUCHSCREEN_PROPERTIES */
> > > 
> > > This should not be separately selectable from CONFIG_INPUT, so there is
> > > not need to have this guard.
> > > 
> > > The reason it is a separate symbol is historical - it used to depend on
> > > OF in addition to INPUT. I suppose I can drop it now.
> > 
> > Without these guards, the build fails if CONFIG_INPUT_TOUCHSCREEN=n and
> > I felt it too heavy-handed to add a 'depends on' for what is ultimately
> > a corner-case of sorts for this device.
> 
> Ah, I missed the fat that we got outside of the
> drivers/input/toucscreen.
> 
> > 
> > The touchscreen helpers are useful for more than just touchscreens, and
> > we can extend them to all of input with something like the patch below.
> > If it looks OK to you, I can insert it into v2 after I collect feedback
> > from Rob for the binding.
> 
> Yes, I guess we should move into core. Can you move the file into
> drivers/input and maybe we should rename it into touch-properties.c? And
> start renaming the API form touchscreen_*() to touch_()?

Sure thing, I can move it. I guess we want to do the same for the binding
too? There are only a handful of other bindings that will need references
to touchscreen.yaml updated with a new relative path.

I'm hesitant to rename the API because we still need to support bindings
that start with touchscreen-* and having an API with different namespace
seems inconsistent. How about I volunteer the following for this series:

1. Move of_touchscreen.c to drivers/input, and rename it to touchscreen.c
   since it is not actually related to OF at this point. This would match
   the header file too.
2. Update its introductory comments from:
   "Generic DT helper functions for touchscreen devices"
   to:
   "Generic helper functions for touchscreens and other two-dimensional
    pointing devices"
3. Move touchscreen.* from bindings/input/touchscreen to bindings/input,
   and update the handful of touchscreen bindings that assume a relative
   path to touchscreen.yaml.

Let me know if this seems like a reasonable compromise.

> 
> Thanks.
> 
> -- 
> Dmitry

Kind regards,
Jeff LaBundy
