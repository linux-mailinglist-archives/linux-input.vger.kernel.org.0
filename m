Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8498E1C7051
	for <lists+linux-input@lfdr.de>; Wed,  6 May 2020 14:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728158AbgEFMco (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 May 2020 08:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727932AbgEFMcn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 6 May 2020 08:32:43 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBD7C061A0F
        for <linux-input@vger.kernel.org>; Wed,  6 May 2020 05:32:42 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id z22so1201504lfd.0
        for <linux-input@vger.kernel.org>; Wed, 06 May 2020 05:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dm7fRDF5jbi9vyQdNtdfOwfzcLHzPEsBwrOWd7mKBI8=;
        b=Sve84gOFqgRMh7GJ3Y9tWJqylfEx0f+vDW/fPjaMjb56O+HkbbpFS8JhQaT20h93dk
         rKN80Lw2+yu3JiQgel0FIpX6INwdCLJ8FIpb4zL4lfHCgaELGecqH+ly7fd+ix+IGYYG
         lKaI1+2ehs/t/p68SJ9UF3OVLo1u7gE0uQYP7HkV+J/ZFYppFDv3Cs+utx1lTRQA4rlw
         REVbT4lmYtDnUZfYKaGeMuZrSS3sR3Y+i4t2hh6kbkXVb997KsW+7rB98bIlbhv6ZL93
         4EmQi1fpXtyeHM674YkyXpDCS/JRc2fTttUDCYgBcwdMpgCFIOdrxTE0hghAVUYpYFb6
         2/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dm7fRDF5jbi9vyQdNtdfOwfzcLHzPEsBwrOWd7mKBI8=;
        b=IUsEaFyCyJAIu3+h+yxakY5uS7mlq21DtEL92KPidtJVRVJiPgUdVmty9yMjEdycS/
         PHsOCy4e0/v6s6TaHXEgeCtfxxfRMzP+duW7/zVC8mTEl5p47JTkJ11RV49hN+WjuT+U
         pz65qNwEVWW5phvIZzIMdt3WQfWmyRDAru/2ctCQ6/YGVDBUuwKCBSCWTjF0EEpKp1ni
         ccYN6PxXirUx16l0LYSAfp0+LhuyEHQv0S6FE80sHYlmTBNb/ioVnzbB6RfRupaFqnYd
         dC/ZVkO2AcAgMXF04BxJL/mbXcSB1ffSvquOGNLnYil2r/wtT7MAloCnVHebq5n1/4kQ
         7X5A==
X-Gm-Message-State: AGi0PuY2umO007q/4C+Sq/P490YMp1ruJEmI33wf1MvwYPMxSxPmYQeJ
        bBvV8vUuBToQoQJWflYNV6DAYUJmfEjSTEnHwyJPww==
X-Google-Smtp-Source: APiQypLhNesT3emRuer26INIPh9RGIvJoNg1X3QmtWYdN+PbSn9Nw0ytFIuQFjFFpyeCdPjsgoVmKAQsW3H6cy86Wg8=
X-Received: by 2002:ac2:5588:: with SMTP id v8mr4889942lfg.217.1588768361074;
 Wed, 06 May 2020 05:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200421080650.25514-1-linus.walleij@linaro.org>
 <20200421080650.25514-2-linus.walleij@linaro.org> <20200423020530.GH125362@dtor-ws>
In-Reply-To: <20200423020530.GH125362@dtor-ws>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 May 2020 14:32:29 +0200
Message-ID: <CACRpkdZVsTeNQWcsu3S4qL8YrGwrefozeTsc2W4eiPM11wgD9w@mail.gmail.com>
Subject: Re: [PATCH 2/2 v5] Input: cy8ctma140 - add driver
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry!

First: THANKS for fixing my driver.
Second: sorry for slow answer :(

On Thu, Apr 23, 2020 at 4:05 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> > +config TOUCHSCREEN_CY8CTMA140
> > +     tristate "cy8ctma140 touchscreen"
> > +     depends on I2C
> > +     depends on GPIOLIB || COMPILE_TEST
>
> Why do we need gpiolib here?

Not really. Dropped it.

> > +     ret = __i2c_transfer(ts->client->adapter, msg, ARRAY_SIZE(msg));
>
> Why do we use "unlocked" __i2c_transfer()? Can't we use normal
> i2c_transfer()? For __i2c_transfer() someone has to lock the segment...

Good point. Your patch works fine here.

> Hmm, I think if we do use loop the code is actually _much_ simpler,
> please see the patch below.

Indeed. Works like a charm after some fixes.

> > +     addr[0] = CY8CTMA140_GET_FW_INFO;
> > +     ret = i2c_master_send(ts->client, addr, 1);
> > +     if (ret < 0) {
> > +             dev_err(ts->dev, "error sending FW info message\n");
> > +             return ret;
> > +     }
> > +     ret = i2c_master_recv(ts->client, buf, 5);
> > +     if (ret < 0) {
> > +             dev_err(ts->dev, "error recieveing FW info message\n");
> > +             return ret;
> > +     }
>
> Does it have to be 2 separate transactions? Can we use write/read
> i2c_transfer() here?

I think it is necessary for the FW info test, this is not a standard
I2C transaction, notice that addr[0] does not contain the I2C
address of the device.

I tried to do it some other way but this was the
only way I could get it to work and detect the device properly.

> Can you please try the patch below on top of yours?

Folded it in and will resend with my changes as v6.

> @@ -187,26 +144,28 @@ static int cy8ctma140_init(struct cy8ctma140 *ts)
>  {
>         u8 addr[1];
>         u8 buf[5];
> +       int error;
>         int ret;
>
>         addr[0] = CY8CTMA140_GET_FW_INFO;
> -       ret = i2c_master_send(ts->client, addr, 1);
> -       if (ret < 0) {
> +       error = i2c_master_send(ts->client, addr, 1);
> +       if (error) {

This didn't work as i2c_master_send() returns the number of
bytes sent. I reverted this function back to using ret.

After that everything started to work!

Yours,
Linus Walleij
