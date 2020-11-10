Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F562AE31B
	for <lists+linux-input@lfdr.de>; Tue, 10 Nov 2020 23:17:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732373AbgKJWRm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 10 Nov 2020 17:17:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732277AbgKJWRm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 10 Nov 2020 17:17:42 -0500
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F0DC0613D1
        for <linux-input@vger.kernel.org>; Tue, 10 Nov 2020 14:17:42 -0800 (PST)
Received: by mail-vs1-xe41.google.com with SMTP id 128so26876vso.7
        for <linux-input@vger.kernel.org>; Tue, 10 Nov 2020 14:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nY2XXyY7Xq21Hxfj1LDgWWgmNedp6//ojAi+4msIvrM=;
        b=OSDQJmdFw/h0nsn3AcX7ryeNokKHr7gV5+/GoRP1SzO1iG3Ye9eX35+TL6TsRj8I3U
         ffb1nKO5oUiYNKsZphwZuNp5Y6x8C1z4hCabwRK2jYDPMvwWIBHGkG/CUIc69HJraUGS
         eWRFGaOcIMwjwNtlIivuQlQOmUbHZbtlvRGws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nY2XXyY7Xq21Hxfj1LDgWWgmNedp6//ojAi+4msIvrM=;
        b=SZwyE8yO12k0NL8Fy9ZXYeoXSXWWq2BcUp/H/LuxTMi08yVGYrCv1AHLem/uDLzjKy
         MG+52Mjad9kJpxigsvM7ZPHZYn/LC1dSToPpnR3YLwSRPlc0QEQ6o1cqJsPoIkGTUPG+
         uW2m7K0b4IAf5vqDyWsRV4Dn2YvDvAVMamu+BtecpJReAvKMZAxNfTx/TyWP6iUclqM9
         ruEWUhahaqRW4C28WG51lOcn28OWK0BWxZJLSwNJhcOaUtt/fvBIOZsCaPr8rDXXsUz3
         QZAEhCfpk4fxCFra3wjS7pIle23HAqVkhWZwPAAlQYI+XI7u5b29ymhNnmVbTuQkd8k2
         My+Q==
X-Gm-Message-State: AOAM533Q6+AsxrbxTxBsOcD8gWTTKZu3RV2pKGcn0dwdXNMxjVl73XCF
        1hock4+HIuhzndTFcN83SqHEJqnXQavFpA==
X-Google-Smtp-Source: ABdhPJzpGl+pSEojtK3SIQ9XUOGjPuCIRJfK7YAV/gYnSDr5lI0autOLMY12u7+MUvu6L3mfULjIGg==
X-Received: by 2002:a67:fb52:: with SMTP id e18mr13108032vsr.30.1605046661430;
        Tue, 10 Nov 2020 14:17:41 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id p5sm9851vkd.56.2020.11.10.14.17.40
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 14:17:40 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id f7so17891vsh.10
        for <linux-input@vger.kernel.org>; Tue, 10 Nov 2020 14:17:40 -0800 (PST)
X-Received: by 2002:a67:ec9a:: with SMTP id h26mr13533069vsp.34.1605046659591;
 Tue, 10 Nov 2020 14:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20201109213636.1267536-1-dianders@chromium.org>
 <20201109133526.v5.1.Ied4ce10d229cd7c69abf13a0361ba0b8d82eb9c4@changeid> <d51318d1-5d26-f840-2651-42a1134d407b@redhat.com>
In-Reply-To: <d51318d1-5d26-f840-2651-42a1134d407b@redhat.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 10 Nov 2020 14:17:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WL7C_OPOQqJY_9nDP4Riz6c4XMHXBBj7FkzMJPBVo9Nw@mail.gmail.com>
Message-ID: <CAD=FV=WL7C_OPOQqJY_9nDP4Riz6c4XMHXBBj7FkzMJPBVo9Nw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] HID: i2c-hid: Reorganize so ACPI and OF are
 separate modules
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jkosina@suse.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andrea Borgia <andrea@borgia.bo.it>,
        Jiri Kosina <jikos@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Pavel Balan <admin@kryma.net>,
        Xiaofei Tan <tanxiaofei@huawei.com>,
        You-Sheng Yang <vicamo.yang@canonical.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On Tue, Nov 10, 2020 at 1:01 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 11/9/20 10:36 PM, Douglas Anderson wrote:
> > This patch rejiggers the i2c-hid code so that the OF (Open Firmware
> > aka Device Tree) and ACPI support is separated out a bit.  The OF and
> > ACPI drivers are now separate modules that wrap the core module.
> >
> > Essentially, what we're doing here:
> > * Make "power up" and "power down" a function that can be (optionally)
> >   implemented by a given user of the i2c-hid core.
> > * The OF and ACPI modules are drivers on their own, so they implement
> >   probe / remove / suspend / resume / shutdown.  The core code
> >   provides implementations that OF and ACPI can call into.
> >
> > We'll organize this so that we now have 3 modules: the old i2c-hid
> > module becomes the "core" module and two new modules will depend on
> > it, handling probing the specific device.
> >
> > As part of this work, we'll remove the i2c-hid "platform data"
> > concept since it's not needed.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> > Changes in v5:
> > - Add shutdown_tail op and use it in ACPI.
> > - i2chid_subclass_data => i2chid_ops.
> > - power_up_device => power_up (same with power_down).
> > - subclass => ops.
> >
>
> Thanks this looks good to now, 2 small remarks below (since you are
> going to do a v6 anyways). Feel free to ignore these remarks if
> you prefer to keep things as is.
>
> And feel free to add my reviewed-by to v6 of this patch:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Thanks!


> > +static const struct i2c_device_id i2c_hid_acpi_id_table[] = {
> > +     { "hid", 0 },
> > +     { "hid-over-i2c", 0 },
> > +     { },
> > +};
> > +MODULE_DEVICE_TABLE(i2c, i2c_hid_acpi_id_table);
>
> Hmm, I do not think these old-style i2c-ids are necessarry at
> all in this driver. I expect all use-cases to use either
> of or acpi matches.
>
> This was already present in the code before though, so
> please ignore this remark. This is just something which
> I noticed and thought was worth while pointing out as
> a future cleanup.

Yeah, I wasn't sure if there was anyone using them.

Hrm.  Thinking about it, though, is it really OK for two drivers to
both have the same table listed?  I'm not sure how that would work.
Do you know?

I don't know a ton about ACPI, but for device tree I know i2c has a
fallback mode.  Specifically having this table means that we'll match
compatible strings such as:

  "zipzapzing,hid"
  "kapowzers,hid-over-i2c"

In other words it'll ignore the vendor part and just match on the
second half.  Just to make sure I wasn't remembering that from a dream
I tried it and it worked.  I don't see any mainline device trees that
look like that, though.  I could delete it, though it doesn't really
take up much space and it seems nice to keep it working in case anyone
was relying on it?

For ACPI is there a similar fallback?  If not then it seems like it'd
be easy to remove it from there...


> <snip>
>
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
> > index aeff1ffb0c8b..9551ba96dc49 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> > @@ -35,12 +35,8 @@
> >  #include <linux/kernel.h>
> >  #include <linux/hid.h>
> >  #include <linux/mutex.h>
> > -#include <linux/acpi.h>
> > -#include <linux/of.h>
> >  #include <linux/regulator/consumer.h>
>
> I think you can drop this regulator include here now too ?

Good point.


> > diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
> > new file mode 100644
> > index 000000000000..15d533be2b24
> > --- /dev/null
> > +++ b/drivers/hid/i2c-hid/i2c-hid-of.c
> <snip>
>
> > +static const struct dev_pm_ops i2c_hid_of_pm = {
> > +     SET_SYSTEM_SLEEP_PM_OPS(i2c_hid_core_suspend, i2c_hid_core_resume)
> > +};
>
> This dev_pm_ops struct is identical to the one in i2c-hid-acpi.c
> and the one which you introduce later in i2c-hid-of-goodix.c
> is also identical, so that is 3 copies.
>
> Maybe just put a shared dev_pm_ops struct in the i2c-core
> (and don't export the suspend/resume handlers) ?

Sounds good.

-Doug
