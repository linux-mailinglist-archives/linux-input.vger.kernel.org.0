Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 330794FAB6F
	for <lists+linux-input@lfdr.de>; Sun, 10 Apr 2022 03:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234458AbiDJBld (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 9 Apr 2022 21:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiDJBlc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 9 Apr 2022 21:41:32 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11olkn2042.outbound.protection.outlook.com [40.92.18.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA825A081
        for <linux-input@vger.kernel.org>; Sat,  9 Apr 2022 18:39:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjwD+3XVDCXP3AlOzGPfjAWk+5plkKjiedwvrb6dPOiHjWP+vnOcsn2VQfe6nr9+hZxd0RF3THWlpa08xo1SaejrCWlkcB55meeHAWrVgVrIVRbUjCGb9HGABQIHOVEJDcZGt1Ll30xDSk9vCEflJCTuhTiY6bFONDjrgZ1FmU17L20WaqKSi4DCUAGaxOr4qmJBdP0p8CvRSxynxU1YLq3S/031ZJpBi8//Arid0+y5wnyz2QX7kQqJuPDJUEcQqgUfn0aByhxyO60ZrvUhZ8//yOY+UdV/Xz8UGGKSjUn5CEXCzBVf1en5ZUCHQYms1GryZc5ky28vwR5f39RkPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27b1EQyFgjfS9kzWg5g4yHWAouze6woH3+EfECB2O1Q=;
 b=Axb2ySw3FzopBqfVoMPHBP32z6AZE7pY5FRes+HJkvnf7KBKMTg3cKfWdn5Q4hODcp10enWWVVjiSSJTie7SIevdk2wl5eluP/v+sou5gGOCWJoMpuxnkvMyEmpK4Pi7QcRi1OAMxSaotMcMnjf5WMntYi4hsTLLI3UzTRrRJ9KaNlGpel1ejp68HycLC0atAwFxGVl58cVojE/WtQzDqs1msibvnhQkGRS2H9qSmf1N6VgMrDTF8+S96sWfF/TYZEdFtkb+IT/MOBtvc3Rsv3LbsFvOI5bbe9Kmv99vLtQljyoAk83mApGrw0c/e98wWHF/916wiBaKr925Yhraqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27b1EQyFgjfS9kzWg5g4yHWAouze6woH3+EfECB2O1Q=;
 b=h8/fSTqyObw7LmwF1rTqO8R49rEwCaIbuzBFUt7b9g8/ptTP/H5dFa00CuADgosYLFcCdTb9Z2jHLqCzPYxND5cEbq5xBi+QyUJ/quBQdL2NnyRP+jQS/ExGaHj3lMmOrANJLxObVY2jguck6RGN6iQL3mjnWE2DMUugu06kIEZUVA9eBB4KRzdRVaiCcjpGSP1KtCGGddpBo0dlO6vxzk8nBICpx/6FurNZLGaqtO8hs5pYUPZygH//FWWaLPsTys++znABxyP7LgJttp3SicSSMFasDqm4PdlQoabBtfzMzwzr6tjyS/5CgjGGLgK0hNrBwqFI6hNoQjVbyvubJQ==
Received: from SN6PR06MB5342.namprd06.prod.outlook.com (2603:10b6:805:f9::31)
 by DM6PR06MB6219.namprd06.prod.outlook.com (2603:10b6:5:128::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.28; Sun, 10 Apr
 2022 01:39:22 +0000
Received: from SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::f8ff:e4be:c1d6:35f8]) by SN6PR06MB5342.namprd06.prod.outlook.com
 ([fe80::f8ff:e4be:c1d6:35f8%4]) with mapi id 15.20.5144.028; Sun, 10 Apr 2022
 01:39:22 +0000
Date:   Sat, 9 Apr 2022 20:39:18 -0500
From:   Chris Morgan <macromorgan@hotmail.com>
To:     Artur Rojek <contact@artur-rojek.eu>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chris Morgan <macroalpha82@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] input: adc-joystick: Stop using scan_index for reading
 data
Message-ID: <SN6PR06MB5342727A065E9FA2223B6A45A5EB9@SN6PR06MB5342.namprd06.prod.outlook.com>
References: <20220408212857.9583-1-macroalpha82@gmail.com>
 <YlDqTKuo5rbkIL8V@google.com>
 <2941de6570a6f808d6ea6e71d137ef87@artur-rojek.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2941de6570a6f808d6ea6e71d137ef87@artur-rojek.eu>
X-TMN:  [3iiWj4u1tDmuF1a9COJxVn905cOoGAzs]
X-ClientProxiedBy: SN7PR04CA0021.namprd04.prod.outlook.com
 (2603:10b6:806:f2::26) To SN6PR06MB5342.namprd06.prod.outlook.com
 (2603:10b6:805:f9::31)
X-Microsoft-Original-Message-ID: <20220410013918.GA10711@wintermute.localdomain>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8083968-2006-4d81-a5ef-08da1a92ef94
X-MS-TrafficTypeDiagnostic: DM6PR06MB6219:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yKnMnE5atfrKoMr4xoyV9x2adCn7YAz/q9shHcA/cvl3zl3n7eAIT7Tj9FqM/cgFSmyfLNPJgjiU8HGf8dZxJYDn5k3O/Ka8nEDwGq+SWZl0vpETqPrtW3JBTPBojretJr33O9YBlbRv27dThum6BzAe//yGqIh0GwBIdaNsmYBoz4ItHgLSZl0lMlWhHyNfAzPz3rkgdD9DiOzQg8HVejxv1y4URYcQbaJiEcPsypxvdoYWF6I8vKY/xkyhgwvkjf08nbl1/ai8CrXVj2AZ0JGKvpYVL8eygm8KUZsdho8v4jg3Sp286MFhFtnZI+mNP8qShsdH+Ld/8wI3YIo7F6dzrXPmN9A2/WECSa6X83T9mjF+nYTRQeuVRo1gZopKIohodGr0ZL0ikaABfoj0Q/XzmCDX9pUuNswI8SoTfhQoRI1L8A31BuWn0YGY3n3bf9bep7YCoMX3TXu/uhlmrL5X6h07Q8dYy6nm3dC1WZ5x3BFVZkIAgv/A+O5SwlmPpGk83fUUQ/ig078Xdxl3VEN/YjsY20EHoQSblDbzcx7LN3Nxikd9T0dzEzKQQWIT56Oop2rpCa4gaG1c1Idnpg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?te3q53Sqm1nw3L+ZJXqLj9co+EHlhvYDVnwro2v7Cp2ErjFP9n/hEICDsXT8?=
 =?us-ascii?Q?68qK4gxJdkRKW/EacaEeFe/DuUUOzucaFULDbaQcZLKSVNHQIoa0abYqIur/?=
 =?us-ascii?Q?Rdg0xcpxy70gF6dN9TdMw4Iwje+bRhZfRiNhoV/gwj2vEp9p0OqipoobdHn5?=
 =?us-ascii?Q?X+h9XFCppfGIqoLkPpXmOE/DHB4JY1tE9W2a1cijM/xRV8ykeagdYd67NuTo?=
 =?us-ascii?Q?Bu3EGfBIbn/AMuQ9Ys+jJn7ObdsSvyw2HRu2iEI5Gg3P/jLQKfDzFsbAfP9w?=
 =?us-ascii?Q?jbE04ok0y90+w78GUwxR4Wx/entSg6C/bEM2x6InxHJUL7IX8HutHCvQ6wJR?=
 =?us-ascii?Q?gm6qPVPLyTv9cbXEmkOMbPQbOhHQ8Ahkc0a199qNX56a2ptulBMRtoFWZUB0?=
 =?us-ascii?Q?kBkqeR0vcoDU8H8VuUzeNDD06Rz8j65F5Nmfn1g6cWNqsAFCaMzKKbuPB44R?=
 =?us-ascii?Q?MT8FtMQffdkVf5Mbs+ZU7lb5UTsfEb5G7JR+AavSGGVODMI2KlWGnJj2m1ZW?=
 =?us-ascii?Q?BmeLFiaQXsF7SJMHfkk2aP3xcz3yVIpk1kFm/TsDZH/o9NXMjk/6L/uSEddr?=
 =?us-ascii?Q?s+bL/ad0V6+/rg5DAHJN4F7eRhXpqknQpTAC6+tINyjbrottPCgb6WcwdXgD?=
 =?us-ascii?Q?T4IPCELjXZ2aH2Y49oUcFxi3XPj6PCaelraWs6Xxa1HeAKNO+oS/djOKHoFd?=
 =?us-ascii?Q?PUNhLC1WJnJE/fkYEeyvqREBiA1LJiDbBAKfycK8BWzBW0MgDO2iGY1TNDhh?=
 =?us-ascii?Q?sVxvSKcMIFgIOWksEiIkNL1DrdR8I/qSuZ8qZBcnWrQzYHtCCMYMrvmVDeiX?=
 =?us-ascii?Q?9Q8BpLiZTm3hm4YltCoj2DNRUghHJoe/e5wbI8nbzhRI0KwRoQq1EEBvaojS?=
 =?us-ascii?Q?3JhXh9ZH8xfy8NXoCoe63r7oVM2OcqYvDLm4Zj5R0eZ0PgX0OpPsTf8OFnhQ?=
 =?us-ascii?Q?tXcOHlJdMZVCPTOU6S4mX+dpCwl0gDsI0GdDnvfTRmJQsimosiVBfMNNN8v0?=
 =?us-ascii?Q?2+0Gv4n/mJ+ldRm8FhDx+FrPg2C8bToqdVcfDSCp7A2jiY5Lwr4xURpwxTU4?=
 =?us-ascii?Q?PFmzufmUNGkdRFk8S2djLop4Q3Nw5M6CSoPHBbyPrpOAD44jw0sWo4WeH0FV?=
 =?us-ascii?Q?ObNAztjcHkXw92wUT51wHKWyrZb3VoE0wfqiHJOd/L55p7vifeTZ0/SLg339?=
 =?us-ascii?Q?F0SAWdk4Kp+mddSGPzRf6JB4ttohczEZQk4QhhennlySlGdjcWvx4CJqFcmA?=
 =?us-ascii?Q?1jt3Ged0KrsGxapuiYk/O2rdKNiw/nulcmvw75loJAKHNBtstmylsGWv8e4u?=
 =?us-ascii?Q?V5Rf5Q7QQ1JB5v8gRahwsQT9UXgoqDhiiU54u9TAGcd5GYdRSmuJqwozE/VO?=
 =?us-ascii?Q?VgYclbIye69wf9lqu9HPcIprYEV5VFvmZRR06Y4ZxH+1a/8UdbQu1qWvFrCQ?=
 =?us-ascii?Q?u8S1UJpMzZqeLV5o+LlEfKpPZGSz6WCh?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-89723.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: c8083968-2006-4d81-a5ef-08da1a92ef94
X-MS-Exchange-CrossTenant-AuthSource: SN6PR06MB5342.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2022 01:39:22.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR06MB6219
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 09, 2022 at 12:08:57PM +0200, Artur Rojek wrote:
> Hi Chris & Dmitry,
> 
> On 2022-04-09 04:07, Dmitry Torokhov wrote:
> > Hi Chris,
> > 
> > On Fri, Apr 08, 2022 at 04:28:57PM -0500, Chris Morgan wrote:
> > > From: Chris Morgan <macromorgan@hotmail.com>
> > > 
> > > For my Odroid Go Advance I noticed that the adc-joystick driver was
> > > only reporting the y channel and on the x axis. After debugging, I
> > > found that the driver was trying to read values from channels 0 and
> > > 1 even though my device is using channels 1 and 2. By changing the
> > > code
> > > to use the axis index instead of the scan index when unpacking the
> > > data
> > > from the buffer, the joystick begins working as expected.
> > 
> > This sounds like some sort of misconfiguration, as your change
> > effectively removes the ability of using just some ADC channels for
> > joystick functionality...
> 
> I agree, this sounds like either a case of misconfiguration, or an issue in
> the ADC driver that this device is using.
> The axis index corresponds to the iio channel associated with the joystick,
> but NOT to the order at which data is sampled by ADC.
> That's why each channel has a `scan_index` field. It sounds like in Chris'
> case the channels have wrong scan indices.
> I'd start by verifying that in the ADC driver that is being used.
> 
> In any case, this patch is wrong and removes functionality that existing
> devices depend on.

I appreciate the feedback. If this driver is working as expected then
that means the issue I am experiencing is further up the stack. Based
on troubleshooting by getting the raw data that the rockchip-saradc
driver was putting into the triggered buffer and seeing what the
adc-joystick saw coming out of the triggered buffer I wonder if the
issue is with the rockchip-saradc driver? I noticed that the buffer
pushed by the driver's trigger handler would only (appear to) send the
channels that I was requesting data for. So basically the data buffer
would have the correct values in [0] and [1], but the adc-joystick
driver by using the idx would fetch values from [1] for x (which has
the y axis data) and [2] for y (which would have arbitrary data in
it, usually something around 65406 or so).

Do you think I should start looking at the rockchip-saradc driver then?
Should the saradc be putting stuff in the buffer for every channel with
empty data for channels that aren't to be reported?

Thank you.

> 
> Cheers,
> Artur
> 
> > 
> > Let's add Jonathan and Arthur for their take on this.
> > 
> > > 
> > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > ---
> > >  drivers/input/joystick/adc-joystick.c | 7 +++----
> > >  1 file changed, 3 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/input/joystick/adc-joystick.c
> > > b/drivers/input/joystick/adc-joystick.c
> > > index 78ebca7d400a..fe3bbd0d4566 100644
> > > --- a/drivers/input/joystick/adc-joystick.c
> > > +++ b/drivers/input/joystick/adc-joystick.c
> > > @@ -32,24 +32,23 @@ static int adc_joystick_handle(const void *data,
> > > void *private)
> > >  {
> > >  	struct adc_joystick *joy = private;
> > >  	enum iio_endian endianness;
> > > -	int bytes, msb, val, idx, i;
> > > +	int bytes, msb, val, i;
> > >  	const u16 *data_u16;
> > >  	bool sign;
> > > 
> > >  	bytes = joy->chans[0].channel->scan_type.storagebits >> 3;
> > > 
> > >  	for (i = 0; i < joy->num_chans; ++i) {
> > > -		idx = joy->chans[i].channel->scan_index;
> > >  		endianness = joy->chans[i].channel->scan_type.endianness;
> > >  		msb = joy->chans[i].channel->scan_type.realbits - 1;
> > >  		sign = tolower(joy->chans[i].channel->scan_type.sign) == 's';
> > > 
> > >  		switch (bytes) {
> > >  		case 1:
> > > -			val = ((const u8 *)data)[idx];
> > > +			val = ((const u8 *)data)[i];
> > >  			break;
> > >  		case 2:
> > > -			data_u16 = (const u16 *)data + idx;
> > > +			data_u16 = (const u16 *)data + i;
> > > 
> > >  			/*
> > >  			 * Data is aligned to the sample size by IIO core.
> > > --
> > > 2.25.1
> > > 
> > 
> > Thanks.
