Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 000A25368D3
	for <lists+linux-input@lfdr.de>; Sat, 28 May 2022 00:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351868AbiE0WgY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 27 May 2022 18:36:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbiE0WgV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 27 May 2022 18:36:21 -0400
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A09C6564
        for <linux-input@vger.kernel.org>; Fri, 27 May 2022 15:36:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBXprJhcoEaLP4hnD11ZxRFhRx7UnUsh0bxL8aeWLS/tr7VTTlOiV8WIvppwEFVxxjY1ULCJdcJRprN8GaVwZql5/o8sj/mLQCO514uX/J2imoM003dpVKqEWEI0ClbOAga1AEzG8PMHuVopbI+/0QGxGeOf8v1dNySJeLNkHWQmxUEtlfLoT8XrU0hAGu+8dQZcrgVAiA33IuxAyOn5/YqCMVgGnKiZYOzcvLgQ3iuGR7q6yi75yFqBfksW0veyo/U8r9UgsCTvpzrkkW9sukwoog6IwElx5Cnjol0kmLhyEoNMBvBE5kZYHcWyFLmR5ub9yIYWF2pLzy2A2q1RuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1blHO+d/gUwJtMHcduyaqzTlXmNLh3vQbupYgNuc3g=;
 b=QXMisULV62KVF8hjlXLi1h0b0Yg9yzUmzVIraq4yNR7fBUDAuxxyMvAAJvD/z+wzPIdYXCeNyzP4hM4uTFuqrF7PajowJcHoE9mH8GfLxa6RP6SGXaz12KUg7mT6Myalbh6RHBtSO1MvfcAqZl1TKPTzWEozKR2eBr+ss+3kjYqV4AuwZ2b5dkrEFc8pqwUuU0Bygsz6ElYE3GmpJgJlDvIkllTqKVN6jh2o2e3hsA0uKUkDEv4YTeBm06I+ofNO384SFhbggEjECchQ1g/QbvePW8i6hcezRyh6MhL8u9PLPYRjOkL16c50tDaFTG6qgD3xCA4lkStVg7gI1pTphg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=labundy.com; dmarc=pass action=none header.from=labundy.com;
 dkim=pass header.d=labundy.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORG5796793.onmicrosoft.com; s=selector1-NETORG5796793-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1blHO+d/gUwJtMHcduyaqzTlXmNLh3vQbupYgNuc3g=;
 b=fbpHKJopNaymh0D7NQiiJKYjYc4FCbr5VP5q7w07h+GgthSJquGRUKLSZhoO6sB0y0Yp694FGzLgPFLYdrm6Bt+450ppuJIlumcxJWiV+YaIvn8PkITrwrSqMa7J+jDo9EoleI2RGhLiWOisvN7gZWDDB6Rfnep5d+c3PUbrIYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=labundy.com;
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com (2603:10b6:4:7c::37)
 by MW5PR08MB8267.namprd08.prod.outlook.com (2603:10b6:303:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.16; Fri, 27 May
 2022 22:36:16 +0000
Received: from DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::2cfb:31ad:b481:561]) by DM5PR0801MB3767.namprd08.prod.outlook.com
 ([fe80::2cfb:31ad:b481:561%5]) with mapi id 15.20.5293.013; Fri, 27 May 2022
 22:36:16 +0000
Date:   Fri, 27 May 2022 17:36:08 -0500
From:   Jeff LaBundy <jeff@labundy.com>
To:     Siarhei Vishniakou <svv@google.com>
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] Document the units for resolution of size axes
Message-ID: <20220527223608.GA394017@nixie71>
References: <20220520084514.3451193-1-svv@google.com>
 <20220520160029.GA49889@nixie71>
 <CAKF84v3yjDfo7L+F84CYSYigAzk_eXYOirbW=icKPsDZ02rCbg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKF84v3yjDfo7L+F84CYSYigAzk_eXYOirbW=icKPsDZ02rCbg@mail.gmail.com>
X-ClientProxiedBy: SA0PR11CA0163.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::18) To DM5PR0801MB3767.namprd08.prod.outlook.com
 (2603:10b6:4:7c::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfdd09db-a2fb-4448-d1cf-08da40314f18
X-MS-TrafficTypeDiagnostic: MW5PR08MB8267:EE_
X-Microsoft-Antispam-PRVS: <MW5PR08MB826760C1ACEEB4859C2E379AD3D89@MW5PR08MB8267.namprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pSh6zM5vDc5VfpHbgW7RfB+ZyaBxLlF77/UAtljqEZLgfguieN/Cieholdn2BVnmSOP35VTZzpPtJYVGtXsXHiW04PX3BmjSYdga1iCCHhHRV52vQ1inD1Cuse/aVpWZ54LyXEYz4/ZoF6oxtRwRiJegoNxFqeMAa4X9zggFgEhGgurAJaE85oJDNPWs5zBKjUjBujPtAO/pNkc6ei3+G+BQNqVNlEQfLhKCEgxp5+xbmReefNKhoyPidlIL+pqnZBYXebCWsVYuqcUoXPp8Yr+ceCEKCJxKLofhu9SQEFeycELxHJYDtw4curhpMjTCjAQ67vnVuu2MYubLhEQh+dSCVLqVJYlZ20E6oIy22dCyAiqwdjUdulKnl3blsI9O8bMaTb1qVrC/veaOT0s0JQonYBK6XzoRN1lY4Ra7Lq6J4MIxPXPYkjijXUz7iGqfzX8wnznLTK3wmR7zubVhFoWgsPfCFm+FTzHOB0Oby2fF+3CPSJelSVJIivs5foVfij6GdAZVy7HP/2s64bRVDWdbgZXzbJOLVLy5F5CV8K/+lnze2u7brZkbSK0+OBNIc9vSwjPPGKOAgJ2x2a73Qv4dUJH4pNH4Vx+/8QGwxgSYNUyAI6pPN7xxs86UDOrdx9Ww+JtvuCTKEBHvmbeIslDHQF/6nSXWwrAjJM4C7tzzB5VYbMwvuHG9Eeophu5N/tja/Li/LMr4auIsesSzNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR0801MB3767.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(376002)(396003)(136003)(366004)(346002)(39830400003)(6486002)(86362001)(41300700001)(52116002)(508600001)(9686003)(26005)(33656002)(6512007)(2906002)(53546011)(6506007)(8936002)(33716001)(316002)(6666004)(5660300002)(83380400001)(1076003)(186003)(6916009)(4326008)(8676002)(38350700002)(66476007)(66946007)(66556008)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?df7VALiP8Yn8PJbmgm33q9PsF9Ls+3XYqiNUYPWvocH8+VAaSclV5YKUlGko?=
 =?us-ascii?Q?+woXBk3b0XvcnDpAM5C7FydDRHMghckeSCHFMihH6oF//gCCZM0JZNrBEhMk?=
 =?us-ascii?Q?ZJtFjJTtP7aJfjOXQo0qio9yQPEztI0bX3OY5KF6MQnVAx9YRPvkJ5YK/o9I?=
 =?us-ascii?Q?SDdQYjqkq/6Njl9zpIt17YbIqK+uAauJk2iuAuFln/3PLL5Hf4H7SVYaNXM+?=
 =?us-ascii?Q?I/YBaMFNz5HvmmHzlpPfrVla9S4jR8PBKZocnq3rPUAKBWFt29DdhBtYOc+H?=
 =?us-ascii?Q?TgOEuj47H5fubF85sp/RtYnfDE/cVS5XCOLYubf8tSvUV2livKlHWf/UcLyL?=
 =?us-ascii?Q?FycEdv6EJBF903QuKKHvTmfeKGv2h4CEc76drzv/I/EOVoF45bAytHtHtFs1?=
 =?us-ascii?Q?Xp92wu9wD5b3LSKDeMwyKEh/IFB2KnBkkRZ+MIpAbZa+dehOAobkRyVQyUQC?=
 =?us-ascii?Q?trfBsGii63/JkwnnYMSo9tR2IvBegE3u60Ri6Q3AraRSLK30KGRpajMXIPCn?=
 =?us-ascii?Q?zfS/62F1Rl9XS8kpLf9ZjkA7Pqhve/LFY2aCxTDvR3cOtRFehBZ8VO+Vm+td?=
 =?us-ascii?Q?zs3o6oKQxiQ/jYKDv4KSuE7tlFnxt+2w6bFfGk3qZVoBmhzDd/cKNnfV0XsC?=
 =?us-ascii?Q?BAjK6NeU5eOijY+UQ2ldBtr13NfTAeFSffTe8R4yajwl7lW0RA1arXuPQmtR?=
 =?us-ascii?Q?4yYw7xM3a3m9gEzyxDaI5LKUUSTPxhkK3s4bldGa1qpLAyu9yjMOdu538eXM?=
 =?us-ascii?Q?7fSZSiqwJjimjeqg4ua/llF8EexLc2UTNPjINyZMnMOlLUYLb+cCiQvLs0nS?=
 =?us-ascii?Q?7iRX/6todx37AH32WPUw4vERtOLY5B7/tbpumZyirObVwBC8LlBA+55WR42R?=
 =?us-ascii?Q?Bd6iZTS8dzcZvBL8YloCdqcd85l0FZLM4zfzA1+3gXfNJxvrz3zviWb0OF3L?=
 =?us-ascii?Q?UkUzxr7hDxtoXL48Vgmb7K+9VMezUoGuHVnNf+hcbJ++KnMIAfZm9RwyTiKV?=
 =?us-ascii?Q?Z6qcnWWuCrijZXEjYTg93ghbn4ajJBWcQ/oZ3sprPqzDy/GmkyhaB+qOMNEM?=
 =?us-ascii?Q?dbmbU4rDwH5JoHylzU/aTTfNihBgT7K+ZZ9584IrjYXLx/4lGUVJcn13jWpz?=
 =?us-ascii?Q?uHYIaiRhWwTD1Bpg3eznFLgxdt65ylpfivkvoevnncNyTvt8qTOpeOST5Bjq?=
 =?us-ascii?Q?WH3AuGasXf8yyrf6s2fEofEiX+ym050mkB6QHmjcYoXKEA9RHn+wJASGVTbT?=
 =?us-ascii?Q?sf4QUny4Tyf2fH2RBS3+0wueIsOAulWwzaX7e19OrSgw4pUlNlB08Fp7Kr31?=
 =?us-ascii?Q?6Y+TIIUqCcTeRyWhI3c/Q37JPntAyfiV5kFFl61Mad1HJlAiX8NhzPLmOVFv?=
 =?us-ascii?Q?jqo1/o6zagSK/piB+cd3f5zd+LEsjeuHdK/KszHZbla31WxGmaIwod+/fzSq?=
 =?us-ascii?Q?/lV2gDEB/LG4y6/QlRVCDsTjIGZJjDLqlxvK1J0sdbPYGkJzfYYB2V3dF8zn?=
 =?us-ascii?Q?gn2X4UidEvr6BQb5SplosUj2gnolssV68NxPg0CuuKpumuZR8ki4weRsBjSB?=
 =?us-ascii?Q?1kVzrZ6Mc/k339cdZaWY9UUPILO1LJSqzSuhT4nOhpt4sHuK5Xk2joNfw4bl?=
 =?us-ascii?Q?i1vaBkNorLvqseWoxKlGbiQe0aWgTIF4uXZdDGVaSrHzdwxkeql6YIk+tYCp?=
 =?us-ascii?Q?AK+ROyy3TPnHvgjE3KZ/0Qra11BZVgbB0kL+DgH1wluFLQdsT3nXigTt2OIT?=
 =?us-ascii?Q?UY8wDENlIg=3D=3D?=
X-OriginatorOrg: labundy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdd09db-a2fb-4448-d1cf-08da40314f18
X-MS-Exchange-CrossTenant-AuthSource: DM5PR0801MB3767.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 22:36:16.1885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 00b69d09-acab-4585-aca7-8fb7c6323e6f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dwPRNnDFvWntGSSCKRFN3D+Fs5CekMrsM0HWfyovRsu/iCrpufbIKg5k2+dzlXqhtYsst5NHRoV9pyI3WypAHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR08MB8267
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Siarhei,

Apologies for the delayed response.

On Tue, May 24, 2022 at 09:53:22AM -0700, Siarhei Vishniakou wrote:
> Hi Jeff,
> 
> I assume you are talking about touch IC controllers and not gamepad controllers.
> The units for ABS_X and ABS_Y are already documented. The proposal
> here is to expand the documentation to include the ABS_MT_TOUCH_MAJOR
> and ABS_MT_TOUCH_MINOR axes in the definition.

I meant any multitouch controller really. Good point about existing
single-contact axes though.

> 
> We can't fix existing devices, but the documentation would specify the
> "correct" behaviour going forward. Based on my understanding of
> hidinput_calc_abs_res function, the units for the resolution of
> major/minor are already "units/mm".
> This behaviour is already the default in linux, just not documented.
> If you were to develop a HID touchscreen, you would already get this
> behaviour today.

ACK.

> 
> I don't think the problem is the same as for ABS_MT_PRESSURE. In the
> case of pressure, the value comes from arbitrary algorithms using
> capacitive data to guess "pressure" rather than using physical
> pressure sensors.
> So most touch ICs simply can't report pressure. I think
> ABS_MT_PRESSURE in general shouldn't even be reported, partially
> because of the lack of appropriate sensors, and partially because of
> the lack of explanation of what these values means (no resolution).
> For pressure, the userspace doesn't know what to do with it, and has
> to guess about what it means. As a result, on Android for example, we
> use pressure in an "on-off" fashion - zero pressure means hover and
> non-zero pressure means contact. Arguably, that's misusing the APIs.

What I was trying to argue was whether or not it makes sense to define
any axes at all, if some axes can't possibly be defined (i.e., all or
nothing).

However, you're absolutely correct that the problem statement doesn't
apply to ABS_MT_PRESSURE because we do not generally use touch surfaces
to report granular pressure. In fact, most controllers I'm aware of that
do report a pressure value are actually just reporting area anyway.

> 
> In the case of major and minor axes, it's very clear how they should
> be used. There's a well-defined way to calibrate these values to
> physical units. You can put an oval object on the screen, calculate
> its dimensions using a caliper, and then look at the size of the oval
> in the capacitive data.. So the devices *can* provide an accurate
> value here if they wanted.

Agreed.

> 
> Do you mind explaning a bit more about how your proposal would work?
> Would the user space have to scrape the linux folders in order to find
> this new property that we would define to report the resolution,
> rather than using ioctls to read the existing value from the fd of
> /dev/input/eventX?

Yes, that's what I had in mind, but it's admittedly overkill here.

> 
> With the current approach, my expectation is that the touch driver
> could certainly use the dts to read out some values like screen size,
> scale factor, etc., but it would then be responsible to set the
> resolutions accordingly and to scale these values as needed when
> reporting to user space.

Yup, looks like your idea is the best of both worlds. In fact I see we
already have touchscreen-x-mm and touchscreen-y-mm defined in common
touchscreen bindings, albeit not many drivers are using them yet.

For what it's worth, as a fellow customer of input:

Reviewed-by: Jeff LaBundy <jeff@labundy.com>

Thanks for the great discussion!

> 
> 
> On Fri, May 20, 2022 at 9:00 AM Jeff LaBundy <jeff@labundy.com> wrote:
> >
> > Hi Siarhei,
> >
> > On Fri, May 20, 2022 at 01:45:14AM -0700, Siarhei Vishniakou wrote:
> > > Today, the resolution of size axes is not documented. As a result, it's
> > > not clear what the canonical interpretation of this value should be. On
> > > Android, there is a need to calculate the size of the touch ellipse in
> > > physical units (millimeters).
> > >
> > > After reviewing linux source, it turned out that most of the existing
> > > usages are already interpreting this value as "units/mm". This
> > > documentation will make it explicit. This will help device
> > > implementations with correctly following the linux specs, and will
> > > ensure that the devices will work on Android without needing further
> > > customized parameters for scaling of major/minor values.
> > >
> > > Signed-off-by: Siarhei Vishniakou <svv@google.com>
> > > Change-Id: I4a2de9e6d02e5fd707e5d312f5c3325734266a6e
> > > ---
> > >  include/uapi/linux/input.h | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
> > > index ee3127461ee0..328cf545c029 100644
> > > --- a/include/uapi/linux/input.h
> > > +++ b/include/uapi/linux/input.h
> > > @@ -78,10 +78,13 @@ struct input_id {
> > >   * Note that input core does not clamp reported values to the
> > >   * [minimum, maximum] limits, such task is left to userspace.
> > >   *
> > > - * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z)
> > > - * is reported in units per millimeter (units/mm), resolution
> > > - * for rotational axes (ABS_RX, ABS_RY, ABS_RZ) is reported
> > > - * in units per radian.
> > > + * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z,
> > > + * ABS_MT_POSITION_X, ABS_MT_POSITION_Y) is reported in units
> > > + * per millimeter (units/mm), resolution for rotational axes
> > > + * (ABS_RX, ABS_RY, ABS_RZ) is reported in units per radian.
> > > + * The resolution for the size axes (ABS_MT_TOUCH_MAJOR,
> > > + * ABS_MT_TOUCH_MINOR, ABS_MT_WIDTH_MAJOR, ABS_MT_WIDTH_MINOR)
> > > + * is reported in units per millimeter (units/mm).
> > >   * When INPUT_PROP_ACCELEROMETER is set the resolution changes.
> > >   * The main axes (ABS_X, ABS_Y, ABS_Z) are then reported in
> > >   * units per g (units/g) and in units per degree per second
> > > --
> > > 2.36.1.124.g0e6072fb45-goog
> > >
> >
> > Thanks for raising this point; it's a valid one. However, I'm not
> > convinced this is the right approach.
> >
> > On all the controllers I've worked on, ABS_X and ABS_Y are mapped
> > to arbitrary resolution values that don't necessarily map to real-
> > world units. I don't think we can make any assumption at the input
> > layer as to the physical size of the touch surface.
> >
> > It is the same problem for ABS_MT_PRESSURE; the values are typically
> > controller-specific and we can't reasonably try to map this axis to
> > any standard unit (e.g. Pascals).
> >
> > If user space needs to understand the mapping between axis range and
> > physical size, maybe it is better to adopt the approach from the IIO
> > subsystem wherein the input_dev offers a property that maps each axis
> > (i.e. "raw" value) to some SI unit?
> >
> > In that case, dts could define the scaling factor between raw values
> > and physical dimensions. At any rate, that is just my $.02.
> >
> > Kind regards,
> > Jeff LaBundy

Kind regards,
Jeff LaBundy
