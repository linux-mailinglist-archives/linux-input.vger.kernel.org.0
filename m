Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F5E04A03E9
	for <lists+linux-input@lfdr.de>; Fri, 28 Jan 2022 23:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243833AbiA1Wss (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Jan 2022 17:48:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236704AbiA1Wss (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Jan 2022 17:48:48 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20144C061714
        for <linux-input@vger.kernel.org>; Fri, 28 Jan 2022 14:48:48 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id h7so9612793iof.3
        for <linux-input@vger.kernel.org>; Fri, 28 Jan 2022 14:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yvLd1RoPgxdjs/CS1R/zUtrJGEBOzBTdt2+fSzjXWoA=;
        b=hEyqVJl2jGpTFgcQRsaYFO9EpYdj6EhqInBVBrGk+cKuX5AF2bk65TFsaWKrVoivom
         qQY8OXSllrQ6oU/HsnCIkhWMQJ1zUFigIEMiKRdyaG1bkuLPzCxDi04meuyTJSD1bKLj
         olIEgHJk9Y+pivpPPa0dEKVOqI9KTdj/EKU1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yvLd1RoPgxdjs/CS1R/zUtrJGEBOzBTdt2+fSzjXWoA=;
        b=Ban09slCi5GV2lfTf1I2pDoruduH6G33va59dbYhEnHyyMPQDpW9bq9zErWVn358x4
         J66cZ8lHVdHKYGsVfTMHYc75t3NjXtMWCJA9RpqVWDhj5IFaouRy9YNgvhGDr65Pr8K6
         Fi90uQFHWb+zfJUPXtRfkWKReklQAJhr/LrxLRFWMUyPjtL5/+iYUkqErJ0CTxs8dMvp
         k6OHiDwEBYM6FfZLLZGUcsCqs2s+1odi/JbQ10TzF9QqOWsyDkN4Dy/khYVhhKZBq8LS
         0G5+uBX+Ng4kiMLL64/kRvFYMmzXWL6vQoL+C2n3RgdLISGAGiqVwAIIpssK0IWxYBIv
         ngkg==
X-Gm-Message-State: AOAM532RbhIGn1y5dpXZfAt7EV1qCNG7eyU4vW1f/5vnneTrVu/xK7Qj
        ogrYfeltqdXLkFGO5I1RKvFcfJcDMZIRTQ==
X-Google-Smtp-Source: ABdhPJwFP7Dx/CQWYUinl15T1y8u9MxDCbOqZZQHxY9USusIt221S91aMSzuUEN1+8i1fx/FvCv7aQ==
X-Received: by 2002:a5e:a806:: with SMTP id c6mr6482527ioa.112.1643410127237;
        Fri, 28 Jan 2022 14:48:47 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id r189sm10647885ior.2.2022.01.28.14.48.46
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jan 2022 14:48:46 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id z199so9595031iof.10
        for <linux-input@vger.kernel.org>; Fri, 28 Jan 2022 14:48:46 -0800 (PST)
X-Received: by 2002:a02:b70f:: with SMTP id g15mr5801773jam.263.1643410126258;
 Fri, 28 Jan 2022 14:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20220128174625.321750-1-daniel.thompson@linaro.org>
In-Reply-To: <20220128174625.321750-1-daniel.thompson@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 28 Jan 2022 14:48:34 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VpQoYkTiKVmC7hMX=bWVYW0rkHWMKU7CqyW_2tanPEpQ@mail.gmail.com>
Message-ID: <CAD=FV=VpQoYkTiKVmC7hMX=bWVYW0rkHWMKU7CqyW_2tanPEpQ@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: goodix: Fix a lockdep splat
To:     Daniel Thompson <daniel.thompson@linaro.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Fri, Jan 28, 2022 at 9:48 AM Daniel Thompson
<daniel.thompson@linaro.org> wrote:
>
> I'm was on the receiving end of a lockdep splat from this driver and after
> scratching my head I couldn't be entirely sure it was a false positive
> given we would also have to think about whether the regulator locking is
> safe (since the notifier is called whilst holding regulator locks which
> are also needed for regulator_is_enabled() ).
>
> Regardless of whether it is a real bug or not, the mutex isn't needed.
> We can use reference counting tricks instead to avoid races with the
> notifier calls.
>
> The observed splat follows:
>
> ------------------------------------------------------
> kworker/u16:3/127 is trying to acquire lock:
> ffff00008021fb20 (&ihid_goodix->regulator_mutex){+.+.}-{4:4}, at: ihid_goodix_vdd_notify+0x30/0x94
>
> but task is already holding lock:
> ffff0000835c60c0 (&(&rdev->notifier)->rwsem){++++}-{4:4}, at: blocking_notifier_call_chain+0x30/0x70
>
> which lock already depends on the new lock.
>
>
> the existing dependency chain (in reverse order) is:
>
> -> #1 (&(&rdev->notifier)->rwsem){++++}-{4:4}:
>        down_write+0x68/0x8c
>        blocking_notifier_chain_register+0x54/0x70
>        regulator_register_notifier+0x1c/0x24
>        devm_regulator_register_notifier+0x58/0x98
>        i2c_hid_of_goodix_probe+0xdc/0x158
>        i2c_device_probe+0x25d/0x270
>        really_probe+0x174/0x2cc
>        __driver_probe_device+0xc0/0xd8
>        driver_probe_device+0x50/0xe4
>        __device_attach_driver+0xa8/0xc0
>        bus_for_each_drv+0x9c/0xc0
>        __device_attach_async_helper+0x6c/0xbc
>        async_run_entry_fn+0x38/0x100
>        process_one_work+0x294/0x438
>        worker_thread+0x180/0x258
>        kthread+0x120/0x130
>        ret_from_fork+0x10/0x20
>
> -> #0 (&ihid_goodix->regulator_mutex){+.+.}-{4:4}:
>        __lock_acquire+0xd24/0xfe8
>        lock_acquire+0x288/0x2f4
>        __mutex_lock+0xa0/0x338
>        mutex_lock_nested+0x3c/0x5c
>        ihid_goodix_vdd_notify+0x30/0x94
>        notifier_call_chain+0x6c/0x8c
>        blocking_notifier_call_chain+0x48/0x70
>        _notifier_call_chain.isra.0+0x18/0x20
>        _regulator_enable+0xc0/0x178
>        regulator_enable+0x40/0x7c
>        goodix_i2c_hid_power_up+0x18/0x20
>        i2c_hid_core_power_up.isra.0+0x1c/0x2c
>        i2c_hid_core_probe+0xd8/0x3d4
>        i2c_hid_of_goodix_probe+0x14c/0x158
>        i2c_device_probe+0x25c/0x270
>        really_probe+0x174/0x2cc
>        __driver_probe_device+0xc0/0xd8
>        driver_probe_device+0x50/0xe4
>        __device_attach_driver+0xa8/0xc0
>        bus_for_each_drv+0x9c/0xc0
>        __device_attach_async_helper+0x6c/0xbc
>        async_run_entry_fn+0x38/0x100
>        process_one_work+0x294/0x438
>        worker_thread+0x180/0x258
>        kthread+0x120/0x130
>        ret_from_fork+0x10/0x20
>
> other info that might help us debug this:
>
>  Possible unsafe locking scenario:
>
>        CPU0                    CPU1
>        ----                    ----
>   lock(&(&rdev->notifier)->rwsem);
>                                lock(&ihid_goodix->regulator_mutex);
>                                lock(&(&rdev->notifier)->rwsem);
>   lock(&ihid_goodix->regulator_mutex);
>
>  *** DEADLOCK ***
>
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
> ---
>  drivers/hid/i2c-hid/i2c-hid-of-goodix.c | 28 +++++++++++--------------
>  1 file changed, 12 insertions(+), 16 deletions(-)

Yes, this seems like a reasonable solution, thanks! Probably want:

Fixes: 18eeef46d359 ("HID: i2c-hid: goodix: Tie the reset line to true
state of the regulator")

Reviewed-by: Douglas Anderson <dianders@chromium.org>
