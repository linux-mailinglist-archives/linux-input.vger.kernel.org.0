Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E38446779
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 18:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhKERDZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 13:03:25 -0400
Received: from mail-mw2nam12on2059.outbound.protection.outlook.com ([40.107.244.59]:40545
        "EHLO NAM12-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234158AbhKERDZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Nov 2021 13:03:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A//p2qLrsJnRxx80bxwJNT5t5BWsDF3JzwoPWozPjTGXskzsuqz3KFC2BXICykigop0wyLXLpoV48t/Gqv2vjdpt+kqw/j2/XYLPPJBXPIsz70dVVCY4qLlX1eb1WPVM/SIvGdEzmBn2IxEVOGCI7BBV5n6H4jXLGGAkbwVyPbtrBOhX2hNfV7PUuXmPbGfQiMCv3+/w5kPKKKqww+zh5IwGFbR2bdnSpC9qo1EOTBDgrP6i3COV1Iip+43+LyJEng4i3YX4HebWW78lh5fegAj8g12nXKxbTXNJ2E8BU2BK9tKFqwLQUonankxmW3mYkxmD3Wpy7BsGIJsX2qPQxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QMfyI864YTv473p3qCQnM5TyNxLQDBEbsgIyxJSiLg=;
 b=MfrPUqQcOQgSFrJP73fm0jqTXDIbWb2MlAl3CFqp7OiRfpkpLtY/6HsPlx+KMtp2nS63kXQ/C8mMBKXfEd50bYe544DcqsjkPOdYKLha2jAZp1MN6agWYZhd0PqsKxg/3nviJQ9EBBOVXRCK1xavIp0lQoPiOIYIqQdTXc3B+/9fBH/AKwl5HLsNtM3YwguUBnWALfVvSxA0dSmeeF9e5lH8sUvM0lIuXr7loARuSWh/nB7RD8v0h6e6kEtxiW3vtY5HDeJ0H+IjGu+Pkx4/+T6WIMdRkLn9HYtEMYO1PqbDo4OY3pnsYqbhRhQzdhyPr0n8LiF/+LEfXXC+GKU1Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QMfyI864YTv473p3qCQnM5TyNxLQDBEbsgIyxJSiLg=;
 b=krni59BPgIuDU7Cs7y2rB6M5WWk+Y8RQgHd9VZxBbPxeofPZ8KJBpPpAKnvfwO7lKV02PYGKZS8mVMd7T2FimRp5nVZ42Vltb/vpPjPFpC0gNNdXE2TDOndUhcYl2RMzV0SPzFfdH9dgm48DV5A5oUFaVd+Fr9OOseio4wT4CKQ=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB6053.namprd08.prod.outlook.com (2603:10b6:a03:c4::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.18; Fri, 5 Nov
 2021 17:00:43 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::9807:1a65:a60d:b29b]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::9807:1a65:a60d:b29b%5]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 17:00:43 +0000
Date:   Fri, 5 Nov 2021 12:00:37 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-input@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Wu Hao <hao.wu@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Dave Ertman <david.m.ertman@intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Xu Yilun <yilun.xu@intel.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Input: add 'safe' user switch codes
Message-ID: <20211105170037.GA65511@nixie71>
References: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com>
X-ClientProxiedBy: SN1PR12CA0067.namprd12.prod.outlook.com
 (2603:10b6:802:20::38) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
Received: from nixie71 (136.49.90.243) by SN1PR12CA0067.namprd12.prod.outlook.com (2603:10b6:802:20::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 17:00:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 017393fd-26f9-4237-8c6c-08d9a07dcde5
X-MS-TrafficTypeDiagnostic: BYAPR08MB6053:
X-Microsoft-Antispam-PRVS: <BYAPR08MB60535A96A808C2B2E66A9B9BD38E9@BYAPR08MB6053.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zs3/2T6BaV3lTSOsWKAhBtbJg2EYVBhDeEr3GFHEmJPD3El4j533Rf8Vzo13J+oheAmbcMUeZ3F1p8gMbvlcU8uZKUMGnKLyQojvvtzd0Yt5O64PzC3dX4d9h8TDNBBLwYCXMOAIf52XMuLelYxwPGSHeN/rFkclt/ZOshlVapg4FyjRHmXLRGdb2t92cIknzVlluS4HcA4fhvkXufv8UMwaRolyXSM3hwszP/HblprS1M8aHivZjhIySSi1KRbYi/LaVp4/qTPn4CUtOG+qAU/bXyLYNJQ9X6/+ndxQgVN4GUvXQK3NsGkl+gVNQT2TX+W1pCrLItej/SnjdgdfYmxWHWXAPln6t/hyzQihOgF5h/dHL5QUU1kevWUUbkee47jpNKPKcyQY/3TmYE2wEv/hWzeTQGp+QalrWX2Wpf1JwJqOKsGEFHEljM1JTIZGI5K9RrJTnlXu54qJ74N+xFBxHMdhd+WfDm6o7nayj22CMr4g2Coj9XS3uFI7uK1hbf6CeV8k/tAHAg+UdrUYiYB69Kxbz9eeFMWwAMmoQB3XZmxnZlLwvvorn9oKSIiKixi3ACDqX8Rg6SzfhWtCSMKp7Vx8GQGkg9PMKvZxmexuPEbR2o08Y3LXyVSzzLeiD77f+zRTUEZcRyqhetcz6w35LRRJMHrdU4qCUpRKr2q8ypwSzaXe/ljCoen8VGi9+zWzMt9uzKreuOEIwbfxQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(39830400003)(396003)(376002)(346002)(366004)(136003)(66946007)(7416002)(186003)(9686003)(33716001)(66476007)(316002)(956004)(2906002)(508600001)(8676002)(66556008)(6496006)(54906003)(52116002)(4326008)(86362001)(33656002)(1076003)(26005)(5660300002)(9576002)(55016002)(8936002)(6666004)(83380400001)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YBmT7HwM6osLhTRSfdG6aZfpdhnBLbKddRyaktG9T57Tevo2G+KdkFDZDoUN?=
 =?us-ascii?Q?5iWryTtfQ9bXbBNxLN3jr91j5R0KPW/ikOdenoX6UeoPBz3/1ruAGCDd4iyX?=
 =?us-ascii?Q?IY+e1KwHXlC4hPNXS/ai61RyETa4ga3hpsbNSf/io2aOzokcBidAoH5878ri?=
 =?us-ascii?Q?3tNE22ZJrJk3CkZJ40Fo/9mT2LvCgYlDteYjpHPZqz5w2pum48ovP0cHbn2+?=
 =?us-ascii?Q?DK9MfmQwLVQQHb+35a3/7tKHAM8mIwMjuHio1ogNfozBPir2uEX4H+gUvtTa?=
 =?us-ascii?Q?w3kYYxbdWmUv4d8rbEDHjlH3BFtaE08KroGFbXClqeSdeY0DIf/B0Yp4nJ1z?=
 =?us-ascii?Q?5xUBv+xtJZikmSRABLjS5tKxJHG/N8oesYOxhWY+y8BACVkulXXvz1VF9sXW?=
 =?us-ascii?Q?3UV1tC0VMfc758+vaiSYlpuUOyW6Ra/JpT2BDpYrsvOFSN9ouWNYiE+GuGsk?=
 =?us-ascii?Q?wrgnKQaR6gs44Wu5Ybwc04otLvKLGLiAuuZucBiVeZONhi5e4RW8IlbIXbTe?=
 =?us-ascii?Q?HmV11T3C4yUqt+aYcUOLn+0B8JmCMtTxPQ6QXBZZqb+7EB4UKxNPoubstCH6?=
 =?us-ascii?Q?jkp1Emq1F3WFAxWCaOoJTCbMGjWoDJkmpQ2oiDNFcMw+EmdGDZMe8/Dou8TF?=
 =?us-ascii?Q?WrTF3b/UQ3FUCEtzzXurKzdMqMdIgYSx5Z1uhCpXkAUGNgYiS1P/a1VcLBxl?=
 =?us-ascii?Q?DjrzFi++4i4VSo4JZWxah3UX9fOfyfkSfwko1Fgzl+xBSI9kKBhVBOQlSqwY?=
 =?us-ascii?Q?Lyvrq6xRq9eRW4NoeDHhReGZEx3o/TTwL23HbolHPxUdzNOXaTCys9ANB5ED?=
 =?us-ascii?Q?BgilvWq3Ldo6EBgvdcU2OkJbB9XWbM2mu+tcxQECkaTRMTOXRgjtwLEL44Ac?=
 =?us-ascii?Q?ttvkJmDIH/vCZhkPmQxquvDlX9bBlkU5iaCar61WKSHrp09akm/EGMhp68j3?=
 =?us-ascii?Q?dcrrDuPGsa9SOucVsYWlSUuhoE2gWfGWqdsLUNtGzo2+6idKvQNOcgCLMmBQ?=
 =?us-ascii?Q?P7u+81yickqM4qXP091TzFxhP+61WHW5czijTIekiAyylLeoPG5aSYSBr9Mq?=
 =?us-ascii?Q?9c9lYZMmBDyHAUm51qnWTQAFTVjQBYpS2AJFeXGyd/Y1/1AX5sJdNq7d9c3Q?=
 =?us-ascii?Q?jtw9KwyteWdfsL9AHAKiJ3gkuI18XOP0yiQj0UoDPKfMMMpGwWxAX5Spe1Y8?=
 =?us-ascii?Q?FOgFnFMPHS4E01HxEJLngYzv4gpcDdGYIOotu91k9xE4Mcz6crLYOZaxPuEU?=
 =?us-ascii?Q?dYSbWU18W/7TIlwdfIrSWBpLc4OmCKSvVDvY3FUN4Q0Kh1sABOKbf4Wcw0IX?=
 =?us-ascii?Q?zjz/OLy9pc8GlQDWbIKFZUZ5IREXG6+aDGo7hBz4hm60GpiOxVe8HAycQnhB?=
 =?us-ascii?Q?XqNvlqopAV6x8+fT5uitXsCA8BBZzdXQQcuR3rpYjnPIF/esLC8g/gqzHlJ/?=
 =?us-ascii?Q?hppcqaUL0dDGHd/JzzWZX0v4e6HiCF9vxUgrcSSeIjo7nrOo4VowM9CM7oXQ?=
 =?us-ascii?Q?rCWIuOp+CNEkQ5ZeYsBNL42HpD85qaTGEQE53hCj5jOBeGeHbYdYOyiFdoTb?=
 =?us-ascii?Q?flEvZtqGagPWt2gL2B5PLTj0omiy4Ly4FDxwKZ0OaR0CCJTwZQG51D18JIod?=
 =?us-ascii?Q?ZS+BnsOaqbWuC42MaeRRWSE=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 017393fd-26f9-4237-8c6c-08d9a07dcde5
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 17:00:43.8182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /z3QLiJ8TgdWsjhq3uTQ+lJzdxNITcm+ZFvsiXkTT7JCkegXufmViwciu3x1KZA8MLRxj1BodaJPLcpkxLaeSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB6053
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kieran,

On Fri, Nov 05, 2021 at 10:35:07AM +0000, Kieran Bingham wrote:
> All existing SW input codes define an action which can be interpreted by
> a user environment to adapt to the condition of the switch.
> 
> For example, switches to define the audio mute, will prevent audio
> playback, and switches to indicate lid and covers being closed may
> disable displays.
> 
> Many evaluation platforms provide switches which can be connected to the
> input system but associating these to an action incorrectly could
> provide inconsistent end user experiences due to unmarked switch
> positions.
> 
> Define two custom user defined switches allowing hardware descriptions
> to be created whereby the position of the switch is not interpreted as
> any standard condition that will affect a user experience.
> 
> This allows wiring up custom generic switches in a way that will allow
> them to be read and processed, without incurring undesired or otherwise
> undocumented (by the hardware) 'default' behaviours.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> 
> Sigh, a compile test might have at least saved the buildbots the trouble
> of notifying me I also need to update the INPUT_DEVICE_ID_SW_MAX. But
> even so - I'm really looking for a discussion on the best ways to
> describe a non-defined switch in device tree.
> 
> Here's a compiling v2 ;-) But the real questions are :
> 
>  - Should an existing feature switch be used for generic switches?
>  - Should we even have a 'user' defined switch?
>  - If we add user switches, how many?
> 

This is merely my opinion, but if a hardware switch does not have a defined
purpose, it does not seem necessary to represent it with an input device.

If the goal is to simply perform validation of a driver and/or hardware, is
it not sufficient to map the switch to an existing code?

Similarly, there is no way to know if two are enough. What if we have a new
board tomorrow and need four?

> 
>  include/linux/mod_devicetable.h        | 2 +-
>  include/uapi/linux/input-event-codes.h | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index ae2e75d15b21..dfa1e4f41cd8 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -326,7 +326,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x10
> +#define INPUT_DEVICE_ID_SW_MAX		0x12
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
>  
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 225ec87d4f22..84a7b3debcb3 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -894,7 +894,9 @@
>  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
>  #define SW_MACHINE_COVER	0x10  /* set = cover closed */
> -#define SW_MAX			0x10
> +#define SW_1			0x11  /* set = user defined */
> +#define SW_2			0x12  /* set = user defined */
> +#define SW_MAX			0x12
>  #define SW_CNT			(SW_MAX+1)
>  
>  /*
> -- 
> 2.30.2
> 

Kind regards,
Jeff LaBundy
