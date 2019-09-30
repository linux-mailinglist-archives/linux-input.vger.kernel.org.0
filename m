Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40E52C2450
	for <lists+linux-input@lfdr.de>; Mon, 30 Sep 2019 17:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730809AbfI3P3u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Sep 2019 11:29:50 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36953 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731976AbfI3P3t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Sep 2019 11:29:49 -0400
Received: by mail-lj1-f196.google.com with SMTP id l21so9967017lje.4
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2019 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GcQj6Rd9F3KLevHVxis1OmxH3WVUvsmgXjMTIJqkIFg=;
        b=YRKoZku4KnTPIutFbWgtdiIEXuEq2kFBYAHLjWVBAEIc7HkbxZtYTWPaO8ybwJfh/G
         uFAGnzV940ibk70MdpNMBMwiYmlhz6ySOXR2VA7v7BaWU1ZYGh9ZMzdHPwCBbBWX5O1f
         gWW4L64pcsKVCOfVF2OPnqp5LyGYrfKIUos4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GcQj6Rd9F3KLevHVxis1OmxH3WVUvsmgXjMTIJqkIFg=;
        b=TB/qeCdDfGZDYsLsr3YWUwVevA+kFlVZ6bVcdz0NuTHuSS36ip6HiXacnZ93sVy3yg
         kq4aWfe6zXpaTmtP+bYIf4RxcnWR8uiO28VU8cCrFbgzRhrNU1MgpP0tom99YAfrCStt
         1O4WQtOPH9Z+1+2gyaeMQ4AYFRyeNgejreZDQboXkLGBjxT+nfn429a0vPumhDvpqEN5
         sVkIQ6TBSAcvWasUSeJSw3QuJ50NsqCJWvdNYRKxl2Y+tP7snl+chTTMM8hAef8/fwIV
         hpxL8k9ydgsUlc5O+r+G1FNWzmD3mSkI4xxnulyrxsd5GviLbWiZ/amhrLLb1ecLKaoh
         eIkA==
X-Gm-Message-State: APjAAAWMVFgYcJKM9ChDKPxMnVZvGGq5JIv2dGGmLUvAaS5ptuQPSqm9
        YU2AveaOkkwxIK8nn2D4wInBE0X6HEU=
X-Google-Smtp-Source: APXvYqxLE6CDVGrJO6fB7o7orhdOdyberJANnHCKVSGMtzKMOz3dlPXOtYtQfvlc+e/YUw3+lAAwyg==
X-Received: by 2002:a2e:9b5a:: with SMTP id o26mr12627157ljj.158.1569857385874;
        Mon, 30 Sep 2019 08:29:45 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id v1sm3443292lji.89.2019.09.30.08.29.44
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2019 08:29:44 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id y3so9961675ljj.6
        for <linux-input@vger.kernel.org>; Mon, 30 Sep 2019 08:29:44 -0700 (PDT)
X-Received: by 2002:a2e:9f12:: with SMTP id u18mr12939698ljk.23.1569857383671;
 Mon, 30 Sep 2019 08:29:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190924215238.184750-1-evgreen@chromium.org> <20190928001626.GT237523@dtor-ws>
In-Reply-To: <20190928001626.GT237523@dtor-ws>
From:   Evan Green <evgreen@chromium.org>
Date:   Mon, 30 Sep 2019 08:29:06 -0700
X-Gmail-Original-Message-ID: <CAE=gft46VXLL5z2o5QEnTBMOrzDnK_uuFiK4NMQV21PBpLxmfQ@mail.gmail.com>
Message-ID: <CAE=gft46VXLL5z2o5QEnTBMOrzDnK_uuFiK4NMQV21PBpLxmfQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: atmel_mxt_ts - Disable IRQ across suspend
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Nick Dyer <nick@shmanahar.org>,
        Jongpil Jung <jongpil19.jung@samsung.com>,
        Furquan Shaikh <furquan@chromium.org>,
        Rajat Jain <rajatja@chromium.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Sep 27, 2019 at 5:16 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Evan,
>
> On Tue, Sep 24, 2019 at 02:52:38PM -0700, Evan Green wrote:
> > Across suspend and resume, we are seeing error messages like the following:
> >
> > atmel_mxt_ts i2c-PRP0001:00: __mxt_read_reg: i2c transfer failed (-121)
> > atmel_mxt_ts i2c-PRP0001:00: Failed to read T44 and T5 (-121)
> >
> > This occurs because the driver leaves its IRQ enabled. Upon resume, there
> > is an IRQ pending, but the interrupt is serviced before both the driver and
> > the underlying I2C bus have been resumed. This causes EREMOTEIO errors.
> >
> > Disable the IRQ in suspend, and re-enable it on resume. If there are cases
> > where the driver enters suspend with interrupts disabled, that's a bug we
> > should fix separately.
> >
> > Signed-off-by: Evan Green <evgreen@chromium.org>
> > ---
> >
> > Changes in v2:
> >  - Enable and disable unconditionally (Dmitry)
> >
> >  drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
> > index 24c4b691b1c9..a58092488679 100644
> > --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> > +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> > @@ -3155,6 +3155,7 @@ static int __maybe_unused mxt_suspend(struct device *dev)
> >               mxt_stop(data);
> >
> >       mutex_unlock(&input_dev->mutex);
> > +     disable_irq(data->irq);
> >
> >       return 0;
> >  }
> > @@ -3174,6 +3175,7 @@ static int __maybe_unused mxt_resume(struct device *dev)
> >               mxt_start(data);
> >
> >       mutex_unlock(&input_dev->mutex);
> > +     enable_irq(data->irq);
>
> At least for older devices that do soft reset on resume we need
> interrupts to already work when we call mxt_start().
>
> In general, order of resume steps should mirror suspend.

Ok, I can move the enable_irq up towards the top of resume. I was
worried that a pending IRQ might not get handled correctly if
mxt_start() hadn't been called yet. But if we need IRQs for
mxt_start() to run anyway, then I guess it should be handled.
-Evan
