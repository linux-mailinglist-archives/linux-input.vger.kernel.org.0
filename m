Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05D536B3425
	for <lists+linux-input@lfdr.de>; Fri, 10 Mar 2023 03:16:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjCJCQY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Mar 2023 21:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjCJCQX (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Mar 2023 21:16:23 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB91A101114
        for <linux-input@vger.kernel.org>; Thu,  9 Mar 2023 18:16:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A7+Tw52O9plB9BSufQvY5TBXM5PP+CRbHZYGc6LD/lwqZ5nGVuuzFlt6lyGNCUlO05Nsc0EHjGpZkoR1qSQKvGUSRuKyQRULjZ9VS/2cQL3gpCssrvksNQ6ba2biEZAGvd9CWNtjIU89qZvbTnTx5DCHPZ5GO9VoLz5YFx8oa897vOUFgwOwMIRfdnEdlAqyOWtGSiMSqotFGQmw3Jm9RMmmuRtqzntCeV4awpuJV4S8+xobhXFNrI7OPKz58fQQiA1jZ5LTheq1FkPhlga/RqTJGKT3rnfz629RvlFp4BWfHlu031zBFC5pNR7mi9bpVmqcuTzIBAhlFFr7URw+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCji++v71Vz89972Ut0E/yoi8xmfdml4m2q5dOflIAY=;
 b=CRwNGONnBN34vJr0G6WZNYMUzk20fZNQESQaekXP0hnBGhEDe0utAlbCjgJZkG2IHX59y8ay3YdvuxaeTGxrx8zKfp4LRxHdXlG0OJ8Jx5HTO0W47RkbVyY0KmBUx6BvFUTMYtMygq3W7NqZX4s9zkU/fXcTcff50lZkZYXccpz4S4Ow4hMLQlHAppN4dOPcmrncE7kEvbu4W+38+YhbO0tpu50t8/0d1J/MmJrzkt4ClsFTIPF12xtSMa/Mp6Gei2eaQ3QskKnWciv5fYZycilpMt87/hKy0l9Regg9sqkBb0SayTyypD6E8e15pjzrYgUPIUSucBQcgYQUTdskEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCji++v71Vz89972Ut0E/yoi8xmfdml4m2q5dOflIAY=;
 b=etS+GBfaqG67NGnl5zNri5S9VurqJ5KImuxprlTLWmv7PeYCTuO/pIHWCP0rbwZGLCPhI2si9J2YEFTCHf8oFqaS9GR7dINSWQNS+JEW94jHTolvBlwU7+hOXryr//OsVM2Lt1VRiu+eOHO50TIp++eyUcoGANFqZicylI+wr2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21) by CO1PR08MB6625.namprd08.prod.outlook.com
 (2603:10b6:303:9e::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 02:16:14 +0000
Received: from SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4]) by SN4PR0801MB3774.namprd08.prod.outlook.com
 ([fe80::4e0c:f94b:5d28:66e4%6]) with mapi id 15.20.6178.019; Fri, 10 Mar 2023
 02:16:13 +0000
Date:   Thu, 9 Mar 2023 20:16:07 -0600
From:   Jeff LaBundy <jeff@labundy.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: touchscreen - Add new Novatek NVT-ts driver
Message-ID: <ZAqS50p82kvvreLF@nixie71>
References: <20230217150749.32670-1-hdegoede@redhat.com>
 <Y/Q84gI1AnE6oqRU@nixie71>
 <b5142af9-fa24-ccce-5c06-c21dadd1f394@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5142af9-fa24-ccce-5c06-c21dadd1f394@redhat.com>
X-ClientProxiedBy: SN7PR04CA0228.namprd04.prod.outlook.com
 (2603:10b6:806:127::23) To SN4PR0801MB3774.namprd08.prod.outlook.com
 (2603:10b6:803:43::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4PR0801MB3774:EE_|CO1PR08MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 74b1167a-8c2b-4f2a-441f-08db210d6c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6PVbnZgbMMgVfKQSOKL73oDcMny2iBEU8uRTmxhslwXvkCEXoBuTR5zkARG6XYEeupcBB64JovcwxWwOmM9buJL24Y9h6RRIOib04y3XSrwGGq18M7iLw+hB/VRKhSRz0ukLCgvNLZudCh6w5rts6k837Roms7lSe7L/1yMAJjOmI9xmm3gVc7OsFTvHq0bjNq8zCykftpOmMm9WV4dnKFiLyFuLUxVOA27B3A949vuE9z0uaejAipSiCXAIHOFzf9LqbR1O+ZZzHx70WVxa/A5XynQSSzEtt9M1UW6unSrpUj8ypyFowaplIR8jZbcSayf4q/PhZTOjevC8lJtT2E8SzwCI2w/NIbH2pXSwQnrM/zBkiUaxUjkmGbrow6d6Miz1/AxIFHidvDM5ju4fXPHG1bW0q2LVZMAla5amDIalCWLKacBiskRSRJlrGZTltNrdUDq4Ufmyo93I3JfkGv2Jr3gkO+59gdxhr9U8qT3KD2mNjRfTIFtVHMOhNrLIi29OP1CF6PnQU4Xthy/iw/ArArNUtKWqvgeTk/9EEcpHaePsPZvF6Dm/FQazRfMHB8rDwxgkkfaQ2FQfooarHpFepp/pIApBXxeVITmEh7feNGD4WuZgEVn0GmTQ4+MvLRxfiqZ0a/+KNZ8cusnrIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR0801MB3774.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(7916004)(376002)(396003)(136003)(366004)(39830400003)(346002)(451199018)(186003)(5660300002)(26005)(9686003)(38100700002)(8676002)(66556008)(66476007)(66946007)(6486002)(4326008)(316002)(86362001)(478600001)(8936002)(41300700001)(6512007)(6506007)(6666004)(6916009)(2906002)(83380400001)(66899018)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RMDekhU8VJGT7bekzc5SOeZKazQjWkBP0Yp7NmU8aQQgFkV8Ru1iEgGuAkhH?=
 =?us-ascii?Q?SWzlbZSqQ+A7ygLoiwEhTrXLu1kVvyAFk4cN2jDXZYKHFvPkcVPwrJ0xxXYA?=
 =?us-ascii?Q?sVlzzndtFkx/N6XFC17laXLidUUlnjwqYMyMP9DbpHk/VJcIQ79fpCAOx7z3?=
 =?us-ascii?Q?wD7UEhOuvLz4KpCRFLz8XX6mCg4bzcNGUtsDMuNGOTiKDADA29t9Opa5mPqn?=
 =?us-ascii?Q?2Mj1kSy9ViQwjcl+1Gd+vyGXm6YMWPvAVVINgO5q72Vrpcastw3dfk6JybZC?=
 =?us-ascii?Q?l3556wXhmJlDIXGB7+5E25WG33LE67sdZASogtMuWu+W7kgvhSSoivvYgUe0?=
 =?us-ascii?Q?OLBLSP2ynohMHB7QfUjVoNFFJh0Y0gIx0VkgqEcAyrFGWBvQvW3MHPiXQN1B?=
 =?us-ascii?Q?A3EgdKkNVHDjb7UGXsOAkmsdm6lfd4hqXlJa01X8wL6cA5b3EHiBmUK3m/iL?=
 =?us-ascii?Q?UB8nzBt8XTbP3txtbFkOOx305kR8/1SPtAcdH+6vnY5T6LzPY+ZNMynN3FN8?=
 =?us-ascii?Q?of9Rd/6G+TzYvE2ew3S5vlynAvq9Qrbdoe/oC+iiNo1tzT3b6nSrMxR5Ch17?=
 =?us-ascii?Q?wh4O11WvIzxJNTEGA/rIKbFsFf10EdgBOltCfrRGQSmLlzfUEob8HdxEnfYj?=
 =?us-ascii?Q?AhH4+/oep9rZDo1APKMA3cRA/a7b5ffw9w7VBCLYkKzpS7/FqeVtjoPxgiyG?=
 =?us-ascii?Q?cHV0u3xaf1tWbxBr0EiJiD+Cw+nROpF243V7LmpPY0BajHf5ltIYvJhN8rKl?=
 =?us-ascii?Q?t53/9+E4Z0F09f5q7P1nk5UlMnA33Kt6broGXMzuJ03mytn8aNLm/28Vp8uH?=
 =?us-ascii?Q?2URJ5AK1RYoFzFUn1ZUeldEsnsXewYDSgCHKij48mZxMevDIHrkOWIq9h2ro?=
 =?us-ascii?Q?Y1gXl91ocpFbO8NMGiTHSyOw5LUK4JfUjenr38lHGY1+3wPn1L34gnZLapMi?=
 =?us-ascii?Q?9nqT8+fKRfkhMDaK5I3wRvvs5YpPPx+/7jplfZIsNQzKsvByMahCaTyjiUYC?=
 =?us-ascii?Q?Ojj9xRyO7Yte2uoQTLoHejp+PBvWAh67OIgkw/8g7UMDhN7pDU+U9YeWhVQm?=
 =?us-ascii?Q?9CmTxRtUUx2OkyqFbTcxdu9eviKYh5N7UM5Cxfn+jTRw814VqzI8ApgvMmSh?=
 =?us-ascii?Q?DLTvb1J9xi2NhmmpsL5udsPpcxnx2Iy9NPRK+Bxpi8YU3FZdqemDyDTc8azH?=
 =?us-ascii?Q?6tUamAAU9gyKe3yRzCe4OrsWVKXWWVlwY4JNzdjwvwkEiOku19qURnehPdT8?=
 =?us-ascii?Q?sO2pPBmtLdNhG23vJl8IptEmRYeYdUwrr/DXU/+WdNE0sLBMvZUCl44JaD/h?=
 =?us-ascii?Q?HCpLtwKYP2gC76ZdTWlHh5Kw9P9/VIywpWeanqfUgF+q700m3EJp0bpJD8AJ?=
 =?us-ascii?Q?wh32woI0VKZayF5EKQeTTk51A04LQeF+YQuUbVujufvQFtdm4l/3oWEo4DXv?=
 =?us-ascii?Q?7ywvqWuqrF6nu+vZE3yWCM+2WvRll47YKdFO3aYTBdH6OodnwO0Wf6hUMwJc?=
 =?us-ascii?Q?+APFEYtub0SP5Bo51PqiOGA2fhetecihvn2z0N1AGRkvVL0xx4zeNTxJJxjN?=
 =?us-ascii?Q?WCBedqg1bvqLzZU5/6oNrpnwLEMmrhp4nX9XRKyu?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b1167a-8c2b-4f2a-441f-08db210d6c0c
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0801MB3774.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 02:16:13.7372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pOlj7PgM3wZzz/m6GSzt4icWUR39U/aCoWR6QU4P2VuUaVYIQPxw3riJb0QdyfZrNfPaiwJUvir7NLCkQSkDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR08MB6625
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

[...]

> >> +	if (width > NVT_TS_MAX_SIZE || height >= NVT_TS_MAX_SIZE ||
> >> +	    data->max_touches > NVT_TS_MAX_TOUCHES ||
> >> +	    irq_type >= ARRAY_SIZE(nvt_ts_irq_type) ||
> >> +	    data->buf[NVT_TS_PARAMS_WAKE_TYPE] != NVT_TS_SUPPORTED_WAKE_TYPE ||
> >> +	    data->buf[NVT_TS_PARAMS_CHIP_ID] != NVT_TS_SUPPORTED_CHIP_ID) {
> >> +		dev_err(dev, "Unsupported touchscreen parameters: %*ph\n",
> >> +			NVT_TS_PARAMS_SIZE, data->buf);
> >> +		return -EIO;
> > 
> > Nit: because there was no I/O error here necessarily, but rather invalid or
> > unacceptable values, I think -EINVAL is better here.
> 
> AFAIK -EINVAL is reserved for invalid function parameters, typically
> on a syscall / ioctl. Where as here we are receiving invalid data,
> which is more like a a checksum/crc error which is an IO error.
> 
> With that said I have no strong preference either way, so let me know
> if you want me to switch to EINVAL for v2 or not.

Based on this additional information, I agree that -EIO is a better choice. In
theory, only an I/O error could make the device return nonsensical values. The
controller FW is unlikely to store values it cannot support.

[...]

> >> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, nvt_ts_irq,
> >> +					IRQF_ONESHOT | IRQF_NO_AUTOEN | nvt_ts_irq_type[irq_type],
> >> +					client->name, data);
> > 
> > Interesting, it seems interrupt polarity is configurable?
> 
> On the controller-side, yes. The goodix touchscreens have much the same
> thing.
> 
> > For my own
> > understanding, what if there is an inverter on the board?
> 
> Then things break I guess since we program the GPIO input IRQs polarity
> to match the controller polarity when then will be wrong.
> 
> Luckily this has never happened so far AFAIK (mostly talking goodix
> here, since I know only 1 device with this new touchscreen).

ACK.

> >> +	if (ret)
> >> +		return dev_err_probe(dev, ret, "requesting irq\n");
> > 
> > dev_err_probe() tends not to be accepted in input, the argument being
> > that the callers who can return EPROBE_DEFER be responsible for setting
> > the reason as opposed to every driver calling a separate function that
> > does so.
> 
> To me dev_err_probe() is not so much about setting the probe-defer
> reason, it is is very useful because:
> 
> 1) It deals with not logging afalse-postivive error msg on -EPROBE_DEFER and
> you can return its return value, leading to much more compact code and
> thus IMOH more readable code
> 
> 2) It leads to a consistent format for the printed errors
> 
> To illustrate 1. without dev_err_probe() the reset_gpio request error
> handling turns from this:
> 
> if (IS_ERR(data->reset_gpio))
> 	return dev_err_probe(dev, PTR_ERR(data->reset_gpio), "requesting reset GPIO\n");
> 
> into:
> 
> if (IS_ERR(data->reset_gpio)) {
> 	error = PTR_ERR(data->reset_gpio);
> 	if (error == -EPROBE_DEFER)
> 		return error;
> 	dev_err(dev, "Error %d requesting reset GPIO\n", error);
> 	return error;
> }
> 
> Which is 7 lines vs 2 lines when using dev_err_probe() and more
> importantly IMHO the error handling code using using dev_err_probe()
> is just much more readable and thus more maintainable IMHO.
> 
> Which is why IMHO using dev_err_probe() for errors getting resources
> is just much better.
> 
> So unless you feel really strongly about not using this I would
> prefer to keep using dev_err_probe().

I do not personally feel strongly about this and I think your reasoning is
sound. A quick grep through drivers/ shows it is immensely popular. However
the same grep through drivers/input shows it has yet to be accepted there.

That is the only reason I mention it; I however have no issue with it being
left as-is for v2.

> Once more thank you for the review. If you can clarify what
> you want for the EINVAL vs EIO and for the dev_err_probe()
> review remarks then I'll prepare a v2.

Thank you for the productive discussion as always :)

> 
> Regards,
> 
> Hans
> 

Kind regards,
Jeff LaBundy
