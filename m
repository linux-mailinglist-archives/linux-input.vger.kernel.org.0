Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE1047C9CE
	for <lists+linux-input@lfdr.de>; Wed, 22 Dec 2021 00:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238064AbhLUXka (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Dec 2021 18:40:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhLUXk3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Dec 2021 18:40:29 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD9CC061574
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 15:40:29 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id r5so421810pgi.6
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 15:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DSPR9pWAr3YhNMZgod8HUQOfMEPkKfEHfnuMqXG2h1c=;
        b=jkt4O395IccIsXChLBDjgCY/WZm2HWKft/6E6FWhp+BAbqXmtXg6ZyLAehZYSq7uot
         wStmzUN6eSR4HYAdWFCVp+OH0O2dOY8GyxZu6g8Tt++C3YQAHQvyYQ+6GUeFibxI2qDK
         yvUYIg2nu38m7Qboxe7PuKraBxkXyM7kMOfVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DSPR9pWAr3YhNMZgod8HUQOfMEPkKfEHfnuMqXG2h1c=;
        b=N8hwYy2CDEUemcDruKcREjZE3f/8BcqfboGfeEXRtVFeWZQJnyggOEur+n+lM4fmYJ
         yG6WLgrFKtHp7TEcadAJISqUx+4PR9Lqh+qNhuqTZA65wJ2hZ+UBqBhFOfyUSWUS8WjH
         VCRG9O53qmS31mWJgzHgqTlOkxiDl146poXx+4p4BgDVU5qzmsOD0lmgNzc8ASt0x62L
         CpXVohurb4ur97ConV5VN3t0QGgCRYY0kpdvDWaFjea1z3F8XQ5VRvS+4c9oeHEHvxft
         VVurC+z7U+uEJ5LdIOjKUU8zkiBAtd57/uJIY5t5LKCCgwjTASWf1Ou4YMDCP2DZLJJH
         j41w==
X-Gm-Message-State: AOAM533ALy9v2PPxCovEm46kpWQZkwfb5/ImbSNwqJtjjoqCevA3G2/N
        Wk0X6iEV70m3cL22DWE+ikqS/7G58R1sIA==
X-Google-Smtp-Source: ABdhPJzW+4jHuBbsChMufH2vxKu4zku+0Tf0Z78zVBb7SUX+9S3JMoMK4s4BCAAylgnpiqfLvDeaEQ==
X-Received: by 2002:a63:5c0a:: with SMTP id q10mr543310pgb.213.1640130028297;
        Tue, 21 Dec 2021 15:40:28 -0800 (PST)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id k8sm187979pfu.72.2021.12.21.15.40.27
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 15:40:27 -0800 (PST)
Received: by mail-pg1-f177.google.com with SMTP id l10so415852pgm.7
        for <linux-input@vger.kernel.org>; Tue, 21 Dec 2021 15:40:27 -0800 (PST)
X-Received: by 2002:a05:6a00:198a:b0:4bb:4621:f074 with SMTP id
 d10-20020a056a00198a00b004bb4621f074mr409931pfl.69.1640130026974; Tue, 21 Dec
 2021 15:40:26 -0800 (PST)
MIME-Version: 1.0
References: <20211220234346.2798027-1-rrangel@chromium.org>
 <20211220163823.1.Ie20ca47a26d3ea68124d8197b67bb1344c67f650@changeid> <7d4f20da-f18b-eccf-19c4-ea7c15492634@redhat.com>
In-Reply-To: <7d4f20da-f18b-eccf-19c4-ea7c15492634@redhat.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Tue, 21 Dec 2021 16:40:15 -0700
X-Gmail-Original-Message-ID: <CAHQZ30BSLE9G_fw3n4aSW_YOYc6w08eGiXdwa6eJxpR6eFpc+A@mail.gmail.com>
Message-ID: <CAHQZ30BSLE9G_fw3n4aSW_YOYc6w08eGiXdwa6eJxpR6eFpc+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] HID: i2c-hid-acpi: Remove explicit device_set_wakeup_capable
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     linux-kernel@vger.kernel.org,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        mario.limonciello@amd.com, linux-input@vger.kernel.org,
        dianders@chromium.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 21, 2021 at 11:49 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 12/21/21 00:43, Raul E Rangel wrote:
> > The ACPI subsystem is responsible for managing the power and wake
> > sources for an ACPI device. By explicitly calling
> > device_set_wakeup_capable, we are circumvent the ACPI subsystem and
> > setting wake capabilities on the device when it doesn't support it.
> >
> > Take the following example:
> > * We have an ACPI HID device that has `_PR0` and `_PR3`. It doesn't have
> > `_PRW` so that means the device can't wake the system.
> > * The IRQ line is active level low for this device and is pulled up by the
> > power resource defined in `_PR0`/`_PR3`.
> >
> > Since the i2c-hid driver has set the device as wake capable, the wake
> > pin gets enabled on suspend.
>
> The IRQ pin should only have a enable_irq_wake() called on it if
> something has actually requested the i2c-HID device to be a wakeup source,
> the removed code claims the device is wakeup *capable*, but is also
> explicitly calls device_set_wakeup_enable(dev, false), disabling wakeup.
>
> And i2c-hid suspend does:
>
>         if (device_may_wakeup(&client->dev)) {
>                 wake_status = enable_irq_wake(client->irq);
>
> And device_may_wakeup() checks the wakeup *enabled* setting AFAIK.
>
> I've added Rafael to the Cc since he knows all this a lot better then me.
>
> I have the feeling that your userspace is perhaps poking the
> wakeup settings in sysfs, triggering this issue.

You are correct, I added some printks in and it is userspace enabling the wake:

    [    3.280464] i2c_hid_acpi i2c-GDIX0000:00: wakeup_store: start: disabled
    [    3.280502] i2c_hid_acpi i2c-GDIX0000:00: wakeup_store: start: enabled
    [    3.280537] i2c_hid_acpi i2c-GDIX0000:00: device_wakeup_enable: start
    [    3.280541] CPU: 0 PID: 1248 Comm: powerd Not tainted 5.10.83
#151 c334d4c4185a84ded39aafcb495de6870a8e5161
    [    3.280545] Hardware name: Google Guybrush/Guybrush, BIOS
Google_Guybrush.4.15-624-g9d80a9c6aa40 12/21/2021
    [    3.280548] Call Trace:
    [    3.280554]  dump_stack+0x9c/0xe7
    [    3.280560]  device_wakeup_enable+0x136/0x172
    [    3.280564]  wakeup_store+0xbc/0xc4
    [    3.280572]  kernfs_fop_write_iter+0x10b/0x18a
    [    3.280576]  vfs_write+0x383/0x405
    [    3.280579]  ksys_write+0x74/0xd4
    [    3.280583]  do_syscall_64+0x43/0x55
    [    3.280587]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

>
> > As part of suspend, ACPI will power down
> > the device since it's not a wake source. When the device is powered
> > down, the IRQ line will drop, and it will trigger a wake event.
>
> To me that sounds like the device is not wakeup *capable* at all, so
> its ACPI node should not set the ACPI_FADT_LOW_POWER_S0 flag at all.

The ACPI_FADT_LOW_POWER_S0 flag is a system level flag. The
system is wake capable and supports S0ix. The touchscreen device
does not support waking the system because it doesn't provide
a `_PRW`.

>
> Note I'm not certain about this at all, but at a first look this feels
> like it is not the right fix for your problem.

We can't have the `i2c-hid-acpi` driver calling `device_set_wakeup_capable`.
This will make the kernel expose the wakeup sysfs entry to userspace
regardless if the device supports wakeup or not. This would require userspace
to know that enabling this wake source will cause suspend problems and to
avoid it.

>
> Regards,
>
> Hans

Thanks for the review!

Raul

>
>
> >
> > See the following debug log:
> > [   42.335804] PM: Suspending system (s2idle)
> > [   42.340186] amd_gpio AMD0030:00: RX: Setting wake for pin 89 to enable
> > [   42.467736]     power-0416 __acpi_power_off      : Power resource [PR00] turned off
> > [   42.467739] device_pm-0280 device_set_power      : Device [H05D] transitioned to D3cold
> > [   42.475210] PM: pm_system_irq_wakeup: 11 triggered pinctrl_amd
> > [   42.535293] PM: Wakeup unrelated to ACPI SCI
> > [   42.535294] PM: resume from suspend-to-idle
> >
> > Signed-off-by: Raul E Rangel <rrangel@chromium.org>
> > ---
> >
> >  drivers/hid/i2c-hid/i2c-hid-acpi.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/hid/i2c-hid/i2c-hid-acpi.c b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> > index a6f0257a26de..fc311a19a19d 100644
> > --- a/drivers/hid/i2c-hid/i2c-hid-acpi.c
> > +++ b/drivers/hid/i2c-hid/i2c-hid-acpi.c
> > @@ -105,11 +105,6 @@ static int i2c_hid_acpi_probe(struct i2c_client *client)
> >
> >       acpi_device_fix_up_power(adev);
> >
> > -     if (acpi_gbl_FADT.flags & ACPI_FADT_LOW_POWER_S0) {
> > -             device_set_wakeup_capable(dev, true);
> > -             device_set_wakeup_enable(dev, false);
> > -     }
> > -
> >       return i2c_hid_core_probe(client, &ihid_acpi->ops,
> >                                 hid_descriptor_address);
> >  }
> >
>
