Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A176532F3C
	for <lists+linux-input@lfdr.de>; Tue, 24 May 2022 18:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234234AbiEXQxj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 May 2022 12:53:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233792AbiEXQxh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 May 2022 12:53:37 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FFD6D3B5
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 09:53:33 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-30026b1124bso31149407b3.1
        for <linux-input@vger.kernel.org>; Tue, 24 May 2022 09:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bBU3h3oEFw4JC2/ff0uHZOE7/s8vbLP0dXgg6Z/FkHw=;
        b=stkhGcjCvvC9TpTXSlfYJSlmahwaosOiVJsIB5LDfeawhw88xq+VdZKilx/qAi6NQl
         cUbXiUhodUn4VYsxjaCw29nEK+tZ8VMGcKGPbx7bqNeVMUOJCor31OCP8GoDHDv0bbTT
         xuKUwnSf83PNGb9hdeEDAfBx/tzcvJ9amrTmlCwbKUrrI48yiILavvWA8NJPAePH63s0
         V87L2phP2uuX9RZjyJKMj38qBNv5JaIZKE+CGy3SHD88lXCtgfl5MDy17O6riRKQu45y
         tFhIiYUvCs+0KEX+5DhQ+3WiZXiKbCe19sRO8V9hCUqIYyCEsVUMQ9OTcwUmqSB21oUr
         EcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBU3h3oEFw4JC2/ff0uHZOE7/s8vbLP0dXgg6Z/FkHw=;
        b=iY97TAFOWn2UV6M7TtX60Awhgh4OQpnoKIew9sSDyzp7NND4oP5L4x6g5tHeYJERnp
         p8J6yYV9BwaDykVbz+g3nHg7ityDhudtN9t4Q3CWwjN4BT9JlKjOAG35GSF8b9GJujjK
         CaTH8/TofSe6w1EQahFd7a/23P/e3iqSU/GClKXCYlhiwFZ0A8BP6R01WpQ3d8ECwH4D
         GUUFlp6/GJEso/T89CKb9FetyRM5ta1xlJlKk3JtyQd+kDgzl/wBg9m30UMhtLeEsRKf
         n/oMBUGfvLQ9Fuc/qt/wvEF1UFIAm+rS0rTWP2RU7W5S1f/2H+q2iSDuZW8IdF6ar7XU
         8PHg==
X-Gm-Message-State: AOAM532hjlylezkk5z9BTSUM3HqH9Vm16A40t34/pBl9noqz3sBVd72h
        ztcuLhLWoYXjRalfEQ2Qp8XYZl1DrscC67kC5wp7WM64dALSXg==
X-Google-Smtp-Source: ABdhPJzr8ft+qGEvs02KzbhOcvkL4mTZkH1JD0ym9FXwnPk8WbxF5YE5YvDx1TpeB4YrnzQDDibbIunmoz77PdY+cCA=
X-Received: by 2002:a0d:eb48:0:b0:300:3817:e4e8 with SMTP id
 u69-20020a0deb48000000b003003817e4e8mr2484055ywe.247.1653411212928; Tue, 24
 May 2022 09:53:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220520084514.3451193-1-svv@google.com> <20220520160029.GA49889@nixie71>
In-Reply-To: <20220520160029.GA49889@nixie71>
From:   Siarhei Vishniakou <svv@google.com>
Date:   Tue, 24 May 2022 09:53:22 -0700
Message-ID: <CAKF84v3yjDfo7L+F84CYSYigAzk_eXYOirbW=icKPsDZ02rCbg@mail.gmail.com>
Subject: Re: [PATCH] Document the units for resolution of size axes
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     dmitry.torokhov@gmail.com, rydberg@bitmath.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jeff,

I assume you are talking about touch IC controllers and not gamepad controllers.
The units for ABS_X and ABS_Y are already documented. The proposal
here is to expand the documentation to include the ABS_MT_TOUCH_MAJOR
and ABS_MT_TOUCH_MINOR axes in the definition.

We can't fix existing devices, but the documentation would specify the
"correct" behaviour going forward. Based on my understanding of
hidinput_calc_abs_res function, the units for the resolution of
major/minor are already "units/mm".
This behaviour is already the default in linux, just not documented.
If you were to develop a HID touchscreen, you would already get this
behaviour today.

I don't think the problem is the same as for ABS_MT_PRESSURE. In the
case of pressure, the value comes from arbitrary algorithms using
capacitive data to guess "pressure" rather than using physical
pressure sensors.
So most touch ICs simply can't report pressure. I think
ABS_MT_PRESSURE in general shouldn't even be reported, partially
because of the lack of appropriate sensors, and partially because of
the lack of explanation of what these values means (no resolution).
For pressure, the userspace doesn't know what to do with it, and has
to guess about what it means. As a result, on Android for example, we
use pressure in an "on-off" fashion - zero pressure means hover and
non-zero pressure means contact. Arguably, that's misusing the APIs.

In the case of major and minor axes, it's very clear how they should
be used. There's a well-defined way to calibrate these values to
physical units. You can put an oval object on the screen, calculate
its dimensions using a caliper, and then look at the size of the oval
in the capacitive data.. So the devices *can* provide an accurate
value here if they wanted.

Do you mind explaning a bit more about how your proposal would work?
Would the user space have to scrape the linux folders in order to find
this new property that we would define to report the resolution,
rather than using ioctls to read the existing value from the fd of
/dev/input/eventX?

With the current approach, my expectation is that the touch driver
could certainly use the dts to read out some values like screen size,
scale factor, etc., but it would then be responsible to set the
resolutions accordingly and to scale these values as needed when
reporting to user space.


On Fri, May 20, 2022 at 9:00 AM Jeff LaBundy <jeff@labundy.com> wrote:
>
> Hi Siarhei,
>
> On Fri, May 20, 2022 at 01:45:14AM -0700, Siarhei Vishniakou wrote:
> > Today, the resolution of size axes is not documented. As a result, it's
> > not clear what the canonical interpretation of this value should be. On
> > Android, there is a need to calculate the size of the touch ellipse in
> > physical units (millimeters).
> >
> > After reviewing linux source, it turned out that most of the existing
> > usages are already interpreting this value as "units/mm". This
> > documentation will make it explicit. This will help device
> > implementations with correctly following the linux specs, and will
> > ensure that the devices will work on Android without needing further
> > customized parameters for scaling of major/minor values.
> >
> > Signed-off-by: Siarhei Vishniakou <svv@google.com>
> > Change-Id: I4a2de9e6d02e5fd707e5d312f5c3325734266a6e
> > ---
> >  include/uapi/linux/input.h | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/uapi/linux/input.h b/include/uapi/linux/input.h
> > index ee3127461ee0..328cf545c029 100644
> > --- a/include/uapi/linux/input.h
> > +++ b/include/uapi/linux/input.h
> > @@ -78,10 +78,13 @@ struct input_id {
> >   * Note that input core does not clamp reported values to the
> >   * [minimum, maximum] limits, such task is left to userspace.
> >   *
> > - * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z)
> > - * is reported in units per millimeter (units/mm), resolution
> > - * for rotational axes (ABS_RX, ABS_RY, ABS_RZ) is reported
> > - * in units per radian.
> > + * The default resolution for main axes (ABS_X, ABS_Y, ABS_Z,
> > + * ABS_MT_POSITION_X, ABS_MT_POSITION_Y) is reported in units
> > + * per millimeter (units/mm), resolution for rotational axes
> > + * (ABS_RX, ABS_RY, ABS_RZ) is reported in units per radian.
> > + * The resolution for the size axes (ABS_MT_TOUCH_MAJOR,
> > + * ABS_MT_TOUCH_MINOR, ABS_MT_WIDTH_MAJOR, ABS_MT_WIDTH_MINOR)
> > + * is reported in units per millimeter (units/mm).
> >   * When INPUT_PROP_ACCELEROMETER is set the resolution changes.
> >   * The main axes (ABS_X, ABS_Y, ABS_Z) are then reported in
> >   * units per g (units/g) and in units per degree per second
> > --
> > 2.36.1.124.g0e6072fb45-goog
> >
>
> Thanks for raising this point; it's a valid one. However, I'm not
> convinced this is the right approach.
>
> On all the controllers I've worked on, ABS_X and ABS_Y are mapped
> to arbitrary resolution values that don't necessarily map to real-
> world units. I don't think we can make any assumption at the input
> layer as to the physical size of the touch surface.
>
> It is the same problem for ABS_MT_PRESSURE; the values are typically
> controller-specific and we can't reasonably try to map this axis to
> any standard unit (e.g. Pascals).
>
> If user space needs to understand the mapping between axis range and
> physical size, maybe it is better to adopt the approach from the IIO
> subsystem wherein the input_dev offers a property that maps each axis
> (i.e. "raw" value) to some SI unit?
>
> In that case, dts could define the scaling factor between raw values
> and physical dimensions. At any rate, that is just my $.02.
>
> Kind regards,
> Jeff LaBundy
