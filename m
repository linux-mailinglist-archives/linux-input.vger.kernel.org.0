Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD8F43B29C8
	for <lists+linux-input@lfdr.de>; Thu, 24 Jun 2021 09:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231655AbhFXH6r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Jun 2021 03:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbhFXH6q (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Jun 2021 03:58:46 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21970C061574
        for <linux-input@vger.kernel.org>; Thu, 24 Jun 2021 00:56:27 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id g21so2781038pfc.11
        for <linux-input@vger.kernel.org>; Thu, 24 Jun 2021 00:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VoRezXPz8L2FUOUrchPEsBFegnF7Dk8AJD6Y63+BfK0=;
        b=GhMn9U3HdGo7Z0h38IDjVjflcT8V/wECPfVVPOY3uvEl4dTkLlRIcwDqCdCMY/PDLf
         VZZST0AeWGlRpk97zyMoVacedB5h1NAdvvJQgmY0kNJk89GcHfi85yqc9k+2tV2rho90
         u6qW8RtGvrU98PX8h+c3TCIHqZoMBpFYvWNQV2sv9WccC5Ptgvk6nR04/oXZ3jELRQAa
         EGX365+e9UJ1dYN/hAC7YHdf3Cyg9N5wnx8fe8Qq8mv84YLHa14oT1TWrHD160thsqf/
         IM5ja7nZ5HEmGtd/GifGGECPpbG8WAjJvKDJ7yO1/xTT5rCH8i55Z+YyCQ0FzHiUE2i2
         veoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VoRezXPz8L2FUOUrchPEsBFegnF7Dk8AJD6Y63+BfK0=;
        b=suO9ljiXRXsQIbJDw2w/PAoCr485jaOkk2omeyHHYjDsZ38ZjAaHkGQTcLHN4NNUFS
         y/2Xo1PxLaei5UoQnTHXJNfpmT4+lXmFvadTaKXodJWOc0CljpjGhRAzGX9jeVU5sjFl
         3dWJ85e5SaJroXo6udD4v8Xn7/LJvtWYMsC//IfBXHfA59qyztoYaY4p2yQQa7GWhm77
         RW6v39T5wDF2hr7SbViTtdRJZGdcfCqzCuciItA1wjNvAR0QsdAQYawe4UVE90AiXi9/
         sksR6qVNT6mE35HfeRKv3k5fQAN0s/V59RDBz2Z9i7CcR5ul8NkIvzFEow1sgftbbIUf
         Wx8g==
X-Gm-Message-State: AOAM530Lo4TCiTyOGxRqB8Vq/uNczcYAdtSaZa5fiEbEJKr2KPsvnB1I
        P+0ie4fzBh8AWTmsqa+Vb/jC/lt4J7MPBvZtj5Pmbg==
X-Google-Smtp-Source: ABdhPJzmjzYFerElURC8FUhqsmZnHbVYflgcwFE5SLGGjV2VHNpuV5P7zG9i9BRsvSQX5NfHkR/hTRFO9HYQ9aE/ztY=
X-Received: by 2002:a63:1215:: with SMTP id h21mr3588690pgl.173.1624521386510;
 Thu, 24 Jun 2021 00:56:26 -0700 (PDT)
MIME-Version: 1.0
References: <1624456597-9486-1-git-send-email-loic.poulain@linaro.org>
 <1624456597-9486-2-git-send-email-loic.poulain@linaro.org>
 <YNPWcXkG4gCBmmeT@google.com> <YNQe4uEDyNDcPAkY@koala>
In-Reply-To: <YNQe4uEDyNDcPAkY@koala>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 24 Jun 2021 10:05:56 +0200
Message-ID: <CAMZdPi9fVpuJVNXcm2bmPeCr+29T=rbsQ-m+Q_FWCXx2tBW5qQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] Input: atmel_mxt_ts: atmel_mxt_ts: Fix event loss
To:     Peter Hutterer <peter.hutterer@who-t.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>, nick@shmanahar.org,
        linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Peter, Dmitry,

On Thu, 24 Jun 2021 at 07:58, Peter Hutterer <peter.hutterer@who-t.net> wrote:
>
> On Wed, Jun 23, 2021 at 05:48:49PM -0700, Dmitry Torokhov wrote:
> > On Wed, Jun 23, 2021 at 03:56:37PM +0200, Loic Poulain wrote:
> > > If both touch events and release are part of the same report,
> > > userspace will not consider it as a touch-down & touch-up but as
> > > a non-action. That can happen on resume when 'buffered' events are
> > > dequeued in a row.
> > >
> > > Make sure that release always causes previous events to be synced
> > > before being reported.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> > > ---
> > >  drivers/input/touchscreen/atmel_mxt_ts.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> > > index 807f449..e05ec30 100644
> > > --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> > > +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> > > @@ -990,6 +990,13 @@ static void mxt_proc_t100_message(struct mxt_data *data, u8 *message)
> > >             input_report_abs(input_dev, ABS_MT_DISTANCE, distance);
> > >             input_report_abs(input_dev, ABS_MT_ORIENTATION, orientation);
> > >     } else {
> > > +           /*
> > > +            * Always sync input before reporting release, to be sure
> > > +            * previous event(s) are taking into account by user side.
> > > +            */
> > > +           if (data->update_input)
> > > +                   mxt_input_sync(data);
> >
> > That means we sync for every contact release, whereas I think ideal
> > would be to only sync when we observe touch-down and touch-up in the
> > same slot.
> >
> > Let's also add Peter to the conversation...
>
> Thanks for the CC.
>
> FTR, this is expected userspace behaviour, the device state is only looked
> at during SYN_REPORT. Where you send event E=1 and E=0 in the same frame,
> the state at SYN_REPORT time is 0, the 1 never happened.
>
> The only device we (as in: libinput) make an exception for here are
> keyboards because too many drivers get it wrong and it's too hard to fix all
> of them. But especially for touch devices (and tablets!) we don't really
> have any choice but to look at the state of the device at the end of the
> frame.
>
> So, yes, this patch is needed but I agree with Dmitry that you should only
> send this for the special case that requires it.

I'm not really familiar with the input framework, so thanks for the
clarification. In that patch _sync() is 'forced' if there is any
previous event in the report, but from what you say, I should only
sync if one of the previous events is a touch-down, so a transition
E=1? right?

Regards,
Loic
