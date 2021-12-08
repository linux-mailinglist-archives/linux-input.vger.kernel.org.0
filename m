Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B909A46CF7D
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 09:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbhLHIzJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 03:55:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhLHIzI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 8 Dec 2021 03:55:08 -0500
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com [IPv6:2607:f8b0:4864:20::92f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1733FC061746
        for <linux-input@vger.kernel.org>; Wed,  8 Dec 2021 00:51:37 -0800 (PST)
Received: by mail-ua1-x92f.google.com with SMTP id a14so3535063uak.0
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 00:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RKyC01fM7WfM6ekDa1qG3Vt/PYTrXwZGIOdPQqP7n2o=;
        b=RxIJ2Een0TIDhcAcy882hQP1EE8HkhpUu+mwYlddmv/Yr6AFVkc8OAHojmYKk9f9Op
         LqJenRNHYedmxJqiGLrjq/TeL2i+erlj68luJiAZG7J5i+AoL9iwzvlSm+ctqIDD1T18
         tmWl0MqEEAJ47kOnF48hW17+9TVI+/q98IPI9ciwqtU2L9bA+8r4JC4sB9krdE/IzXYj
         77Uwr2p9Ps4nvYK6tb31E04NEfRIxGP7cpxWVlM1R/PTxA2B4IsZ6ZWupp+GLePSQjNz
         B3ewsdiwgAXDbt3D3WcGSf4Isa5370tH7DDAZ0ajgAn0rRwXYQptKNaKV5O4wO7MQgKo
         1QnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RKyC01fM7WfM6ekDa1qG3Vt/PYTrXwZGIOdPQqP7n2o=;
        b=GkkrIn23c7EmNPmehFke5NVBkwQ8vQYQatMMW++5eNOYSAgJVysKZ1kPUr7kmd1+Yr
         K+3jyf5Rbye+l7TYNlUlj8O0rlag7+byIFCrIArBjPw+z6dlI3n4uANRInNmFh6g7MmC
         jfsUkhlK0/R1wBCEnDsopMIFIEqWJwxXejjUcfhInAHtPL1SOJMC90UTUK1q1x7giAP5
         wM9Fk5mANtxfMLOqqUYQQNj1frmTxMJm73q2dCEFbAzGMcP2VU1oRLMgk2s6wTrMiq3q
         QOiqQQ6hqTybNsFhIr8sX8yicljXtUDUuxBs0d3/1NUvq/rJ7egV744ElP4rdHOtav6B
         Wtdw==
X-Gm-Message-State: AOAM531gl/+MJBkkLkuPPUH3j5pk6TTqutRt0upL5Vt13Iy1P9aq3457
        vTJm/m0pPa18LHZcAPliJBrJ5A2cHH7y1gFDPbdz0XQc
X-Google-Smtp-Source: ABdhPJzw38/yZfq+L6wMKiNDgPuNRzPtRIGaujyoegQDL1M8yLMtJK6djRu97fvww8u3WCLTPnCNDBE2ZIBeIjQMb6U=
X-Received: by 2002:a05:6130:3a6:: with SMTP id az38mr6757949uab.126.1638953496005;
 Wed, 08 Dec 2021 00:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20211206164747.197309-1-hdegoede@redhat.com> <20211206164747.197309-5-hdegoede@redhat.com>
 <Ya+e5+TLgyLeTnhp@google.com> <aa558a20-37d0-dbf0-740f-2813609fe3b5@redhat.com>
In-Reply-To: <aa558a20-37d0-dbf0-740f-2813609fe3b5@redhat.com>
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date:   Wed, 8 Dec 2021 00:51:24 -0800
Message-ID: <CAKdAkRTHa1oRJ1VpoFxfsKjUW7KStCXkYZ2AdB1jVCHa=pjZAA@mail.gmail.com>
Subject: Re: [PATCH 4/4] Input: goodix - Add pen support
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Bastien Nocera <hadess@hadess.net>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 8, 2021 at 12:37 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Dmitry,
>
> Thank you for the review.
>
> On 12/7/21 18:50, Dmitry Torokhov wrote:
> > On Mon, Dec 06, 2021 at 05:47:47PM +0100, Hans de Goede wrote:
> >> Some Goodix touchscreens have support for a (Goodix) active pen, add
> >> support for this. The info on how to detect when a pen is down and to
> >> detect when the stylus buttons are pressed was lifted from the out
> >> of tree Goodix driver with pen support written by Adya:
> >> https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
> >>
> >> Since there is no way to tell if pen support is present, the registering
> >> of the pen input_dev is delayed till the first pen event is detected.
> >>
> >> This has been tested on a Trekstor Surftab duo W1, a Chuwi Hi13 and
> >> a Cyberbook T116 tablet.
> >>
> >> Link: https://gitlab.com/AdyaAdya/goodix-touchscreen-linux-driver/
> >> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=202161
> >> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=204513
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>  drivers/input/touchscreen/goodix.c | 122 ++++++++++++++++++++++++++++-
> >>  drivers/input/touchscreen/goodix.h |   1 +
> >>  2 files changed, 121 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
> >> index 2d38a941e7e4..691e4505cf4a 100644
> >> --- a/drivers/input/touchscreen/goodix.c
> >> +++ b/drivers/input/touchscreen/goodix.c
> >> @@ -298,6 +298,107 @@ static int goodix_ts_read_input_report(struct goodix_ts_data *ts, u8 *data)
> >>      return -ENOMSG;
> >>  }
> >>
> >> +static struct input_dev *goodix_create_pen_input(struct goodix_ts_data *ts)
> >> +{
> >> +    struct device *dev = &ts->client->dev;
> >> +    struct input_dev *input;
> >> +
> >> +    input = devm_input_allocate_device(dev);
> >> +    if (!input)
> >> +            return NULL;
> >> +
> >> +    input_alloc_absinfo(input);
> >> +    if (!input->absinfo) {
> >> +            input_free_device(input);
> >> +            return NULL;
> >> +    }
> >
> > Please drop this as input_abs_set_max() will do allocation and
> > input_register_device() will reject device with ABS_* events without
> > absinfo allocated.
> >
> >> +
> >> +    input->absinfo[ABS_X] = ts->input_dev->absinfo[ABS_MT_POSITION_X];
> >
> >       input_abs_set_max(input, ABS_X,
> >               input_abs_get_max(input, ABS_MT_POSITION_X);
> >
> > or even maybe
> >
> >       input_set_abs_params(input, ABS_X,
> >               0, input_abs_get_max(input, ABS_MT_POSITION_X), 0, 0);
>
> The reason why I'm just copying the entire absinfo struct
> (and thus need the NULL check above) is because this driver uses
> touchscreen_parse_properties(), so the min and fuzz values
> might (theoretically) also be set through device-properties and
> I wanted to cover that.
>
> Since you don't like the above approach, I will go with the following
> for the next version:
>
>         input_set_abs_params(input, ABS_X,
>                              input_abs_get_min(ts->input_dev, ABS_MT_POSITION_X),
>                              input_abs_get_max(ts->input_dev, ABS_MT_POSITION_X),
>                              input_abs_get_fuzz(ts->input_dev, ABS_MT_POSITION_X),
>                              input_abs_get_flat(ts->input_dev, ABS_MT_POSITION_X));
>
> (and the same for the Y axis).

Ah, sorry, I misread the code. It is fine as is then, or we could even
consider adding input_copy_abs(input, axis, src) that would allocate
absinfo if needed, set capability, and do the copy.

Thanks.

-- 
Dmitry
