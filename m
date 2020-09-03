Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A920F25C527
	for <lists+linux-input@lfdr.de>; Thu,  3 Sep 2020 17:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728382AbgICPXg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Sep 2020 11:23:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728830AbgICPWd (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 3 Sep 2020 11:22:33 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524EDC061246
        for <linux-input@vger.kernel.org>; Thu,  3 Sep 2020 08:22:33 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id x203so1925238vsc.11
        for <linux-input@vger.kernel.org>; Thu, 03 Sep 2020 08:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VL9yT/iQU/7WYSyaJd+H27DFdWliWvUjL54Y+NsxJ+I=;
        b=FjlHG+KAVM2HrA8dEJu+O7Fkw4M+FfssWQuHmE6z4ZrrUMP9sA+t5IctdZ2OkMUI6D
         WsFfqHLiJNO/AOLF0E3cImHv/LaKx8pb1XiftmKfE/+2tByodNa6zbBzDL0AG/Rxc311
         71Yv/0SFAwnh8tV1CPA72wjy114HMo1VfEwjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VL9yT/iQU/7WYSyaJd+H27DFdWliWvUjL54Y+NsxJ+I=;
        b=CHldrnvhCc4al//UYLNGT4VNKoEpWEtTUvKfem4UCG0Peyf/PNxdgsu0YrQ0JaKZiQ
         2sRVi9+ARgQX0UWEOOHe3+Y1iDqX4W8A2rZV5dItyFjdEhlmYilVZHHrrE8FWCljWPJx
         fAJ4UWxlHOiFLjoDxRhutXECt1W01wO7qXAHNZ3hKCSn/c6ubU1DbUwCPf2jH/LVDdv+
         EzzgjnFoPRJ/Y41cfI1RPskB/g1ez7FFPgyUTyd2rSFeTm/xf6HmzeXPAbm/2pdRdLG+
         0P0nahOs8EzuzhAK3yeGnB1uT0k4ykJ8LdahcEamjOLyT6VdzxT9XRjpYXNB3nVK1eW4
         HvRA==
X-Gm-Message-State: AOAM533qMSA6rFCRnqLYqrGqri/fIwCZyxYmOjoZrg8KSIPY8C97+clA
        QW+Muu3zUViL0RKiHN18CWHhORb48zRqxQ==
X-Google-Smtp-Source: ABdhPJwh62J/in9idzqY9gbmNOsZTbwpfLYUQCbFn6FUdPnZ5qTSrV98r2iwhqTWXb7MVt7MNrqP/g==
X-Received: by 2002:a67:8713:: with SMTP id j19mr2329036vsd.161.1599146551952;
        Thu, 03 Sep 2020 08:22:31 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id m139sm536389vke.28.2020.09.03.08.22.30
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 08:22:30 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id y194so1956759vsc.4
        for <linux-input@vger.kernel.org>; Thu, 03 Sep 2020 08:22:30 -0700 (PDT)
X-Received: by 2002:a05:6102:3031:: with SMTP id v17mr883797vsa.10.1599146550147;
 Thu, 03 Sep 2020 08:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200902214250.1.I63d3f1c93f88cb0cda5161c42e97decb4a63a571@changeid>
In-Reply-To: <20200902214250.1.I63d3f1c93f88cb0cda5161c42e97decb4a63a571@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 3 Sep 2020 08:22:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W9H4-VD04AA7xEM-YuvXVjuOxtczkLhvQfDC5M9KR4Lw@mail.gmail.com>
Message-ID: <CAD=FV=W9H4-VD04AA7xEM-YuvXVjuOxtczkLhvQfDC5M9KR4Lw@mail.gmail.com>
Subject: Re: [PATCH] HID: i2c-hid: Prefer asynchronous probe
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Aaron Ma <aaron.ma@canonical.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Daniel Playfair Cal <daniel.playfair.cal@gmail.com>,
        Pavel Balan <admin@kryma.net>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Wed, Sep 2, 2020 at 9:43 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> Adding printouts to the i2c_hid_probe() function shows that it takes
> quite some time.  It used to take about 70 ms, but after commit
> eef4016243e9 ("HID: i2c-hid: Always sleep 60ms after I2C_HID_PWR_ON
> commands") it takes about 190 ms.  This is not tons of time but it's
> not trivial.  Because we haven't yet specified that we'd prefer
> asynchronous probe for this driver then, if the driver is builtin to
> the kernel, we'll wait for this driver to finish before we start
> probes for more drivers.  Let's set the flag to enable asynchronous
> for this driver so that other drivers aren't blocked from probing
> until we finish.
>
> Since this driver can be configured as a module and modules are
> always asynchronously probed this is quite a safe change and will
> benefit anyone who has a reason to build this driver into the kernel
> instead of using it as a module.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  drivers/hid/i2c-hid/i2c-hid-core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> index 87ff93bf76ba..c898bd8617f9 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1280,8 +1280,10 @@ static struct i2c_driver i2c_hid_driver = {
>         .driver = {
>                 .name   = "i2c_hid",
>                 .pm     = &i2c_hid_pm,
> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>                 .acpi_match_table = ACPI_PTR(i2c_hid_acpi_match),
>                 .of_match_table = of_match_ptr(i2c_hid_of_match),
> +

Boy, I'm not sure how I managed to introduce this extra whitespace
without noticing.  Sorry!  :(  If the patch looks good I'm happy to
re-post or I'm happy if a maintainer wants to fix my mistake when
applying.

-Doug
