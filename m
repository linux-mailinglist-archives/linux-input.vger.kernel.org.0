Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37D932B4A7
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbhCCFYK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:24:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:48219 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1575741AbhCBPn7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 2 Mar 2021 10:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614699751;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=b4Pl7+jnYnhT43fFicRcsT3+kIZL6+ZBuxvrAe9/Bu4=;
        b=Ndeb+ZG08tEGnIFFVXwmk4aZFLL297FvLxxPgF7Az957y3fXPFmS+NB4shgjMXRTcW9XtD
        HdROjV5N1VbBbOxDe4lMK5hLGwXzXQ/LPaJiCE4KBS6U7D93/9uQOaGRacxFxL8JyAS94S
        E8lsGcZoD4pAmwSZSYm5uD5vn1Y2u3o=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-X32IDWJDP1q8USGrEzz0Xg-1; Tue, 02 Mar 2021 10:38:44 -0500
X-MC-Unique: X32IDWJDP1q8USGrEzz0Xg-1
Received: by mail-pf1-f199.google.com with SMTP id y17so13621194pfp.18
        for <linux-input@vger.kernel.org>; Tue, 02 Mar 2021 07:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b4Pl7+jnYnhT43fFicRcsT3+kIZL6+ZBuxvrAe9/Bu4=;
        b=sfm0qRoR548HqpZJqRCzOpTKZY57a93EtZnRZRZ3vRFXjI6wQh3YR7TWs/asefWxMC
         Y9czNaZrpn6M61UOIAjIHqRs1YIZZAfRcoSzeGZGZ6oEwMT9Eo/6UXsZVhJvAoeZWBm3
         MPnDWdyShfeuKDz3Eo6fF9PUXArU24N7v8mPXzdjXDqcMnSCidST3HatZXo5Txj/yO+k
         CMeweic0DARChN0hWU+AxFKd1R9VAAKEvBg1BVtIRdTCLZgRi3RpAP8dfNk+c7qkYDZ+
         7MxAwRWJPEMGQuCRlhWon6+0gHi/JlyJOHMbD0CrZNzgAae2lvzerOHKxAfDabEzMZGe
         UfFQ==
X-Gm-Message-State: AOAM532EBOPKdI3DZ+F12K1jQ/oOicU71DGWsKIBFdqpyunYZBQN/3iB
        PI+oxLKjRMmdbVCnivBpH5aXtodR47Iq/4/8GJ3237hCEyB7x4iO19lW6xuX0doPHIMIncMBIRO
        C6AlwvJ/ybI5T/IRTTM+w4PGr55gIQHdXUIZvTTg=
X-Received: by 2002:a17:902:eccb:b029:e3:b2e3:a226 with SMTP id a11-20020a170902eccbb02900e3b2e3a226mr20514999plh.66.1614699523446;
        Tue, 02 Mar 2021 07:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHMDVIJ5D7Co+T241i0S27q2ziB9Se3J/c5PCDxqCT7+PmtZx4fGyL6MsM3UgD/cCT5nrFOVcqaXDwftgNd/Q=
X-Received: by 2002:a17:902:eccb:b029:e3:b2e3:a226 with SMTP id
 a11-20020a170902eccbb02900e3b2e3a226mr20514965plh.66.1614699523078; Tue, 02
 Mar 2021 07:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20210302145057.112437-1-hdegoede@redhat.com>
In-Reply-To: <20210302145057.112437-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 2 Mar 2021 16:38:32 +0100
Message-ID: <CAO-hwJL2sCDBVBtBbEk4B1a9qN_wme9jyz1Lo9zmdKtPWKSKEQ@mail.gmail.com>
Subject: Re: [PATCH] Input: elants_i2c - Do not bind to i2c-hid compatible
 ACPI instantiated devices
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Tue, Mar 2, 2021 at 3:51 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Several users have been reporting that elants_i2c gives several errors
> during probe and that their touchscreen does not work on their Lenovo AMD
> based laptops with a touchscreen with a ELAN0001 ACPI hardware-id:
>
> [    0.550596] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vcc33 not found, using dummy regulator
> [    0.551836] elants_i2c i2c-ELAN0001:00: i2c-ELAN0001:00 supply vccio not found, using dummy regulator
> [    0.560932] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.562427] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.595925] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.597974] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.621893] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (77 77 77 77): -121
> [    0.622504] elants_i2c i2c-ELAN0001:00: software reset failed: -121
> [    0.632650] elants_i2c i2c-ELAN0001:00: elants_i2c_send failed (4d 61 69 6e): -121
> [    0.634256] elants_i2c i2c-ELAN0001:00: boot failed: -121
> [    0.699212] elants_i2c i2c-ELAN0001:00: invalid 'hello' packet: 00 00 ff ff
> [    1.630506] elants_i2c i2c-ELAN0001:00: Failed to read fw id: -121
> [    1.645508] elants_i2c i2c-ELAN0001:00: unknown packet 00 00 ff ff
>
> Despite these errors, the elants_i2c driver stays bound to the device
> (it returns 0 from its probe method despite the errors), blocking the
> i2c-hid driver from binding.
>
> Manually unbinding the elants_i2c driver and binding the i2c-hid driver
> makes the touchscreen work.
>
> Check if the ACPI-fwnode for the touchscreen contains one of the i2c-hid
> compatiblity-id strings and if it has the I2C-HID spec's DSM to get the
> HID descriptor address, If it has both then make elants_i2c not bind,
> so that the i2c-hid driver can bind.
>
> This assumes that non of the (older) elan touchscreens which actually
> need the elants_i2c driver falsely advertise an i2c-hid compatiblity-id
> + DSM in their ACPI-fwnodes. If some of them actually do have this
> false advertising, then this change may lead to regressions.

I like the v2 much better, and I believe the regressions should be
fairly small now.

One nitpick below:

>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207759
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/input/touchscreen/elants_i2c.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/input/touchscreen/elants_i2c.c b/drivers/input/touchscreen/elants_i2c.c
> index 4c2b579f6c8b..510638e5ba5a 100644
> --- a/drivers/input/touchscreen/elants_i2c.c
> +++ b/drivers/input/touchscreen/elants_i2c.c
> @@ -1334,6 +1334,12 @@ static void elants_i2c_power_off(void *_data)
>         }
>  }
>
> +static const struct acpi_device_id i2c_hid_ids[] = {
> +       {"ACPI0C50", 0 },
> +       {"PNP0C50", 0 },
> +       { },
> +};
> +
>  static int elants_i2c_probe(struct i2c_client *client,
>                             const struct i2c_device_id *id)
>  {
> @@ -1342,6 +1348,25 @@ static int elants_i2c_probe(struct i2c_client *client,
>         unsigned long irqflags;
>         int error;
>
> +#ifdef CONFIG_ACPI
> +       /* Don't bind to i2c-hid compatible devices, these are handled by the i2c-hid drv. */
> +       if (acpi_match_device_ids(ACPI_COMPANION(&client->dev), i2c_hid_ids) == 0) {
> +               static const guid_t i2c_hid_guid =
> +                       GUID_INIT(0x3CDFF6F7, 0x4267, 0x4555,
> +                                 0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE);

Andy in https://patchwork.kernel.org/project/linux-input/patch/20210226193225.47129-3-andriy.shevchenko@linux.intel.com/
proposed a few cleanups for i2c-hid.
I believe a similar pacth should be squashed here (the include is the
one I am more worried about).

Besides that:
Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

> +               acpi_handle handle = ACPI_HANDLE(&client->dev);
> +               union acpi_object *obj;
> +
> +               obj = acpi_evaluate_dsm_typed(handle, &i2c_hid_guid, 1, 1, NULL,
> +                                             ACPI_TYPE_INTEGER);
> +               if (obj) {
> +                       dev_warn(&client->dev, "elants_i2c: This device appears to be an I2C-HID device, not binding\n");
> +                       ACPI_FREE(obj);
> +                       return -ENODEV;
> +               }
> +       }
> +#endif
> +
>         if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
>                 dev_err(&client->dev,
>                         "%s: i2c check functionality error\n", DEVICE_NAME);
> --
> 2.30.1
>

