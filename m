Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E184471EA
	for <lists+linux-input@lfdr.de>; Sun,  7 Nov 2021 07:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231292AbhKGGUM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 7 Nov 2021 01:20:12 -0500
Received: from mail-co1nam11on2073.outbound.protection.outlook.com ([40.107.220.73]:18017
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234785AbhKGGUK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Nov 2021 01:20:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1ZM71Aq5laL6Pqxu8dFX/p0Ti8lDtUE/TSRR/QVaX1PAoZmvQ7LY7XFgBkmlBoOw6Ql++aUYdVFsMWpFEeSwidAtJVDkfv9L+uPDxV6QUXLBGJ1Sld00VPJg6K1jMwwy+1THzF3ki801DPzehTj7WsZaR+6Q+jupvKMsf+LWO+D1A4FkgwPKnRY1d6R1kkYfBMfJsSlr7M5bHL+uZzInfFAR+vzWE70dRJoORT6KEgjB5hfW+O9goV1eDx62JPPaCjwGzIqY+zBwyTA9iXZlvgDmjLdyZ+j5Ak1Xcs5QNJ4SRK1aU5R3GlOdGR4LvMGlZoNfrhikk239P8lCs81Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gdxx24qlBxrFdx5B9uXdx5K/VWKppG+92MIkbyfOTXM=;
 b=dFllV1nhie2YGbom+/nr4p/LsZIEOIL9+Qc9EZWK7FU+VpzxS6E8bMuBW3+u08KSG8TPokA+SED9HMghl8CmnBsQU85RKIsSKUSr0Ttn8vcm4WrimLERREuofkfALIhnZ7VW4A9JloreyFc0GDsqC4MlJzv+j1SS2NH5Aaj2lUDIHuOlzAmU/9J0224bM0xMH19liCsvrZFtkU2zH/dPlOczjL/gEjSBEjgZpvZYT+6UC7X0dR70nQpF249V5cOKiPw6T3QEmRJAYeyVglGgYEgV3vqg39SLJ8b1gmA9HPpV8FoiJE+BmZHMlCd03lxGEEK3BySjnDsNGY97XG1GoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gdxx24qlBxrFdx5B9uXdx5K/VWKppG+92MIkbyfOTXM=;
 b=rcpUvyCaapGfqDl5TEdB94npN1wxqcQ/cfFbsmOm1c/qhe/vNG+nnl7U47d9zgfb5AEvzAxegvxZPzuV5A4n8dT82LYZgAtYv9xf8a+7X1pUr6S0BjuUUyaBoH5r5IN34M7LSmJempf0oDDuYiN4nPs4adViYR022DWzTFhztJs=
Authentication-Results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=labundy.com;
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com (2603:10b6:a03:2d3::16)
 by BYAPR08MB3911.namprd08.prod.outlook.com (2603:10b6:a02:91::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Sun, 7 Nov
 2021 06:17:26 +0000
Received: from SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::9807:1a65:a60d:b29b]) by SJ0PR08MB6544.namprd08.prod.outlook.com
 ([fe80::9807:1a65:a60d:b29b%5]) with mapi id 15.20.4669.015; Sun, 7 Nov 2021
 06:17:26 +0000
Date:   Sun, 7 Nov 2021 01:17:19 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
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
Message-ID: <20211107061719.GA204396@nixie71>
References: <20211105103508.4153491-1-kieran.bingham+renesas@ideasonboard.com>
 <20211105170037.GA65511@nixie71>
 <YYW4d/YK1MkIfGT/@google.com>
 <163619359511.3601475.3667763097540792609@Monstersaurus>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163619359511.3601475.3667763097540792609@Monstersaurus>
X-ClientProxiedBy: SA9PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:806:a7::24) To SJ0PR08MB6544.namprd08.prod.outlook.com
 (2603:10b6:a03:2d3::16)
MIME-Version: 1.0
Received: from nixie71 (136.49.90.243) by SA9PR10CA0019.namprd10.prod.outlook.com (2603:10b6:806:a7::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend Transport; Sun, 7 Nov 2021 06:17:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c4f48046-bae7-4cd7-ef16-08d9a1b644b7
X-MS-TrafficTypeDiagnostic: BYAPR08MB3911:
X-Microsoft-Antispam-PRVS: <BYAPR08MB39114283E816D791B6562AFDD3909@BYAPR08MB3911.namprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ekm/kNRG5YBfnf/cHayXq2ttgCg8eH4Gd2vYaUVcXqLqORR6BXtr5y6KJUvvFTWgidJPjckeQhYZYXBJD8wRdKhO8NZfd0lVEidJQFlkfDZhXCstqWWpOm42RWW4TJLlBBFP5uqSUACwNJFc9pHcWj+3Esqi3su5LR4sWeDrAiFTxd2OAjXLF23G9ODd7+uMrEbBuyixytVVupbSzJiJ9bNIlVY5NxCsS/b+b6wFxuNCN73ChsPEPa9LwVttvVjZTBzyD9euUNHLfZw5LDBBEj6dJCu1qWig+KHueb0MNB8niE/Q7aJVfV7gy5AwX28ZwE+TZVGhko1F+3wdlkWpjFqXfZdaLrxmpceHyVcK8CCtO99+U8GrJviRhcqp2v4rMDMbkURrASNX6FGfG5ZIQJVWA2kQZ7pbplcZs566Nl2ebEXwKFyrnA0ETr65310aWHKmN1yV9oAhQJAeQJi8OJIZjs7WeyL0FQ5DWgkmVUAMXca0vNT1FavfYPpsTzRIa8Ip6HNxscOmAEF49KAoXzET/8/kkgYANW3ATpBdLgFdTbLY8JFJ7Fl0aOqEmuRu4bJBP7Ds1OYtu4AojnHeegSaQcJyDPnW0H/q+DXRg4Jhd5dRzdaXILSlgGv1ONENcl1lu9PiLji0Iv11pwZFCPVBaZIPVWrMv1NhddIEGdyV+dnW88UzdHoujhPeRdfafMwdzeewYOM19zmdDALhn+TREgPQBdm6HEKkvVXinFFpTAa2Np2ly5eXIzdx9Vqbo7FytW4EQToIjVhP/LhOfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR08MB6544.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(136003)(346002)(39830400003)(396003)(376002)(956004)(1076003)(26005)(9576002)(54906003)(33656002)(9686003)(66476007)(6666004)(55016002)(186003)(33716001)(6496006)(316002)(86362001)(8936002)(2906002)(966005)(4326008)(5660300002)(52116002)(508600001)(83380400001)(66946007)(38100700002)(38350700002)(8676002)(66556008)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uN1w5/EBTagCGQhUsMALfxFhezyLFBJoN//c9JYooL8qOk8vFOiIHVU9OpVn?=
 =?us-ascii?Q?YmCXf0HzI0kZIkMEZhh8r//37tF5LjVyKoAh37dwCw6wYmAftn/9rktQ4dr6?=
 =?us-ascii?Q?8BXygJ6PSmuK5cro8Xd8TYFv4PjAiVLguMDpjfwdpc/3TS8r0Shj98Fu2cI7?=
 =?us-ascii?Q?OWAKp4b+0aUL93Q3NOuYhlKn6jRFLFnsOk29HzLfgT/kNXbjp7qCy71yxadu?=
 =?us-ascii?Q?SybqfO/iLimewKPKAvPBl58ge8PWTW5dkmu/an/isaSY+X/StmkbGJoJ6KRN?=
 =?us-ascii?Q?3FCSWwO2qWTAtAAhgtouvQMxThFgENGCb60ikfJ1zwccDeDzcQlyBe4vzVo+?=
 =?us-ascii?Q?yUeoZ7E9hf8RkfnTTJJPYsbOSEgAjOt7KCmJLzH2MyiL7wV6vLWDGJ8kBsT4?=
 =?us-ascii?Q?L8LLExrtsW7BNJUUo6T86GkXY3fhz6TJhDLD7VmsOZyzcnYuT2bStdi1GtMa?=
 =?us-ascii?Q?D0EbSJ4CSIqfGjK3oCl06yPDJimWmRWSEE2MGkEe2IasZF8nmEZUQrN3o59M?=
 =?us-ascii?Q?Q5ZRH5qHc6RlfzHueM7+lceBKK0WYtElo0q6Fmp7Ro/6YKV9uNGrYpUWkrXG?=
 =?us-ascii?Q?qEe3HRIK5F6SECaoZknZtXTmn2NUvBMNWUquON0q4WDKDAD9PTsuaaDlXBVB?=
 =?us-ascii?Q?J6C+1Ix8shdWr/GGZ/ByW/cmv8FvbsbPbd0iniZ1kSOylxj1af1H/kGB3ZA6?=
 =?us-ascii?Q?5FqnxQB0bHka8dLn0N0IVQ2ujY33KMOJm4U6p9DCgjLWbz5b7HnZB3Ci5GrL?=
 =?us-ascii?Q?b8PzVMMuX6ZM+14yIK7xYq5utXOvvvLsqoIQR9iwtM0ptlV9jgLTuU8DN+6C?=
 =?us-ascii?Q?KsZIPDU5BxBKjgmTlH24j3BUGzsQWZd+AmM+ElINOf2QerCXUbIzQNFBzllG?=
 =?us-ascii?Q?VJo+vrlfZ+j/c5JE8xYYd5C8MYnK9cnv36775WLpJ/hFUJK3ewqQB0VFEkGc?=
 =?us-ascii?Q?ou2wC5qIgVHOTiATzjmBnypZ4M8d4p/I8iYyJ+vShd4nOwElnNWnzK1GGrik?=
 =?us-ascii?Q?2v+GZ25/vzb3rh4nnKqeY4LnBDXBldNJau9GSpjHEb0RerFwbOb5yhWPVL7V?=
 =?us-ascii?Q?DcYJppDwoZPa7ikEEnnkF5FcLrKhvD5tpSm0Qo945zgq2Uct7TyvGGKx8KN3?=
 =?us-ascii?Q?/peTVETHR+Tt5TFZkEsTwlL7Wu5+kuATwPd1MwgUb19yr3C9QV1vEz7uFohS?=
 =?us-ascii?Q?ZUgagcBiYPkqEsvVrxDo9pmZps7y6YxVc/ZPdquc3utyAS8h+qhLUh12K+Db?=
 =?us-ascii?Q?Y8mTNdcmREtxggUupjg14BCLhVBSgOr2a6hw+MBFyROqRRGkgrBcMwhWcNLH?=
 =?us-ascii?Q?6lxVZN6nbRxsB0fqq3G72Tcuod+chFhZIZUBcvPpIui32BVNNO1s8ucONG02?=
 =?us-ascii?Q?4zYaIZNGc1T/pfBZxJca6bqySrPKMrmMHCPgnrvib/aADMtqtFO+32Fvm1jq?=
 =?us-ascii?Q?gUmkOETGmp81QT94oL82McZM68jHkTTCEbYowxn1VstQm4VHf6SQ8N//A/ok?=
 =?us-ascii?Q?mrB6lPGWQ31l5xSrySFjRCFemsVuHSeqz23Mr8mSYEfI8IUJ/ywxtGFNceR5?=
 =?us-ascii?Q?TarrOsZk4AzNo/S1zB4wv+J+wg09z4TQ0SJpSgFOYmf27NLdFGJI0Zg72nlQ?=
 =?us-ascii?Q?MTuMPiWUuoFcE6EvE46Gq+Q=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f48046-bae7-4cd7-ef16-08d9a1b644b7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR08MB6544.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2021 06:17:26.1488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1z9FoTTaWAfF6pdnJAG8AqchumbUrW+znYwbDLDlya3x8JVZhKktIhMQ1dmAmqDnwnGSTdxJFlD8onwWijsmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR08MB3911
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Kieran,

On Sat, Nov 06, 2021 at 10:13:15AM +0000, Kieran Bingham wrote:
> Hi Dmitry, Jeff,
> 
> Thanks for looking into this,
> 
> Quoting Dmitry Torokhov (2021-11-05 23:04:23)
> > Hi Jeff, Kieran,
> > 
> > On Fri, Nov 05, 2021 at 12:00:37PM -0500, Jeff LaBundy wrote:
> > > Hi Kieran,
> > > 
> > > On Fri, Nov 05, 2021 at 10:35:07AM +0000, Kieran Bingham wrote:
> > > > All existing SW input codes define an action which can be interpreted by
> > > > a user environment to adapt to the condition of the switch.
> > > > 
> > > > For example, switches to define the audio mute, will prevent audio
> > > > playback, and switches to indicate lid and covers being closed may
> > > > disable displays.
> > > > 
> > > > Many evaluation platforms provide switches which can be connected to the
> > > > input system but associating these to an action incorrectly could
> > > > provide inconsistent end user experiences due to unmarked switch
> > > > positions.
> > > > 
> > > > Define two custom user defined switches allowing hardware descriptions
> > > > to be created whereby the position of the switch is not interpreted as
> > > > any standard condition that will affect a user experience.
> > > > 
> > > > This allows wiring up custom generic switches in a way that will allow
> > > > them to be read and processed, without incurring undesired or otherwise
> > > > undocumented (by the hardware) 'default' behaviours.
> > > > 
> > > > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> > > > ---
> > > > 
> > > > Sigh, a compile test might have at least saved the buildbots the trouble
> > > > of notifying me I also need to update the INPUT_DEVICE_ID_SW_MAX. But
> > > > even so - I'm really looking for a discussion on the best ways to
> > > > describe a non-defined switch in device tree.
> > > > 
> > > > Here's a compiling v2 ;-) But the real questions are :
> > > > 
> > > >  - Should an existing feature switch be used for generic switches?
> > > >  - Should we even have a 'user' defined switch?
> > > >  - If we add user switches, how many?
> > > > 
> > > 
> > > This is merely my opinion, but if a hardware switch does not have a defined
> > > purpose, it does not seem necessary to represent it with an input device.
> > 
> > Yes, exactly. For input core we are trying to avoid generic events with
> > no defined meaning.
> 
> That's understandable, particularly as I could then ponder - how do we
> even define generic switches, and how many ;-) I wanted to discuss it
> because otherwise these switches will be defined in DT as buttons. And
> they are not buttons...
> 
> 
> > What are these switches? GPIOs? Maybe it would be better to use GPIO
> > layer to test the state for them?
> 
> They are physical slide switches on the board. But they have no defined
> purpose by the hardware designer. The purpose would be defined by the
> end user, as otherwise they are generic test switches.
> 
> These have been previously handled as gpio-key buttons, for instance
> key-1 to key-4 at [0] are actually four slides switches. 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e3414b8c45afa5cdfb1ffd10f5334da3458c4aa5
> 
> What I'm trying to determine/promote is that they are not push buttons,
> and shouldn't be described as such. I have posted [1] to add support for
> these switches, but I am limited to chosing 'functions' which will have
> an impact on the system...
> 
> [1] https://lore.kernel.org/all/20211025130457.935122-1-kieran.bingham+renesas@ideasonboard.com/
> 
> Presently in [1] I have chosen SW_LID and SW_DOCK as very arbitrary
> functions for the switches. But my concern is that in doing so, the
> SW_LID position could for instance suggest to a window environment or
> power management system that the lid is closed, and the system should
> be suspended (of course depending upon configurations). That would mean
> that the board would now be potentially always heading into a suspend
> after power up which would not be at all clear from the switch.
> 
> I believe a 'switch' is the correct way to define this hardware, so that
> both positions can be determined, and read, and events generated on
> state change - but that there shouldn't be any artificially imposed side
> effects from the description.
> 
> If the answer is "no we can't have generic switches" then so be it, but
> it feels wrong to further propogate the definition of these test
> switches as keys.

I agree that a slide switch tied to a GPIO is indeed a switch in terms of
input core. Note, however, that definitions from your first example (such
as KEY_1) are not any less generic; those have specific meanings too.

If the concern is that toggling a switch effects undesired behavior, such
as turning a display on or off, then the switch should not be represented
with a gpio-keys node in the first place.

Stated another way, the fact that the GPIO are connected to something does
not necessarily mean they need to be supported. Only once they map to some
function should they be defined, in my opinion.

> 
> --
> Regards
> 
> Kieran

Kind regards,
Jeff LaBundy
