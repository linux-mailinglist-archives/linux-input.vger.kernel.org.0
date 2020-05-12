Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D89F1CF21E
	for <lists+linux-input@lfdr.de>; Tue, 12 May 2020 12:08:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgELKI2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 May 2020 06:08:28 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57833 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726187AbgELKI2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 May 2020 06:08:28 -0400
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MQvH5-1jmNob2Ovv-00Nxnk; Tue, 12 May 2020 12:08:26 +0200
Received: by mail-qt1-f182.google.com with SMTP id x8so10423957qtr.2;
        Tue, 12 May 2020 03:08:26 -0700 (PDT)
X-Gm-Message-State: AGi0PuYLXxFWD7OUrkw4ykpWgBj6aAJ9i20ZkwQq2gyC5VYxMWUyJx3H
        l9QQufKr0RUYQL9Vy2mB/vzeifsGg6imjQO4lgM=
X-Google-Smtp-Source: APiQypKjOERNeitQHjjKMWsRs9h27HgkkLgZhMkUvCm4OwIp4GXGPw2HXQ8u76vnj9k/IbyUxRhOBF73Fgim/ubU5lU=
X-Received: by 2002:aed:2441:: with SMTP id s1mr14299903qtc.304.1589278105207;
 Tue, 12 May 2020 03:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200512043149.10719-1-Andrea.Ho@advantech.com.tw>
In-Reply-To: <20200512043149.10719-1-Andrea.Ho@advantech.com.tw>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 12 May 2020 12:08:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1gKHir-hVoX_mFzqcOF=9NfM1NqO96kC-=6ZHf6Lojdg@mail.gmail.com>
Message-ID: <CAK8P3a1gKHir-hVoX_mFzqcOF=9NfM1NqO96kC-=6ZHf6Lojdg@mail.gmail.com>
Subject: Re: [V3,1/1] Input/misc: add support for Advantech software defined button
To:     Andrea.Ho@advantech.com.tw
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        voyandrea@gmail.com, amy.shih@advantech.com.tw,
        oakley.ding@advantech.com.tw, HY.Lee@advantech.com.tw
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mrhH1tAikejL6HEEyi+mzZW4Uo2mSQp8p3Nq4KLJxocyMuRJgzP
 G6iPR4KiBbZbOcK1K7t6MhSax5cgznvmQGbjTXtRbqXyMSN/9i4AkItsUozqoT7mcdPRrdZ
 +4+Di+PyCzqRddxWFEMCym2DRVf48rwu/T0Na28IiDKoyuZkMa5ZE+Fom0c5KevX3WRkQ1E
 vcvPFC4WOC8oB9NxL00RA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZxIOxHO1Ky0=:1wfF82iSY/s7mDpw9NWvjB
 WVlgCDdjZtO9/tX2XjpUOaT8ZCqkKJOhaJG6svzf7vTXB4AuQdZ+cmeOuMf+m2Pc9mf/1sqXZ
 PxuTn6rPLAZmxd9lCCb0q4vEJ5SMjAGR2WtL7jIu7Yk1hm2Yn9aKH8VPNExfT0ls00VA9O+Qr
 xZ+zj7HRhXGSxmpDVEZnZMOk8YR3lD672Hxf1nBce4HQbtw3E/EBE5dG1tpOk0zbcfFc8jk7p
 Wie5jIjO2GhdqeD2ScndcORYdexqOoDs2ZOaC5zEncmW4rZggz3lNupTB/Q36kqjdw4Tdbom2
 n6eZ3ieBS5u+ZnwjkuZPJ4hJqHJpOdV6eNJidnvYiNR7x7uLcdXVQ03YtocBzOREc2OADESth
 aOiCdRwUD9VkWG5+qV3BOuUd4xbA7IkN4EQKebAMnVPsg4CN6H81Glxkl5IxDqb2b/qqGWRQ/
 fJoGQg1KV3/L/RaGCCGyZewj6UJU56ilETb9CGUV8MyyaqaohVORXOjruZGdmBjRTxvq6eoew
 knb4rSs5CHvtEML9Xl6diWdVX8M9QBF/qL/hEuIFugtOhwPVIf0jpIDlkOcTjLwvUCpKk2/kn
 42k90EmO+7lZv1XW7c4A+oQJWE2+vfkh8VTwpH6nff2dPYLoJ8XsMia/ET0GzMht/uSbsSU3a
 XfAcJ8rgGLQfRJSOsZ6JEUlaWyKAxu1GNW1UsdQjC3tdTaNvgUQ4NMOIEKQzTf91/WDFO+WkJ
 6d0sVHC/XM7p43q21qaedduiZZEEuP4BRTNT4U0u8+lniKYqCEUCZQ0AfznJwDoSDuzBhM8J3
 z71imaP2KNW9KzmBMNii6vXas/zR2FGMdc1mT46P3ov4cJNGis=
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, May 12, 2020 at 6:32 AM <Andrea.Ho@advantech.com.tw> wrote:
>
> From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
>
> Advantech sw_button is a ACPI event trigger button.
>
> With this driver, we can report KEY_EVENT on the
> Advantech Tabletop Network Appliances products and it has been
> tested in FWA1112VC.
>
> Add the software define button support to report EV_REP key_event
> (BTN_TRIGGER_HAPPY) by pressing button that cloud be get on user
> interface and trigger the customized actions.
>
> Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>

I don't have any comments on how the driver works, just some things on
coding style:

> +ACPI_MODULE_NAME("swbutton");
> +
> +MODULE_AUTHOR("Andrea Ho");
> +MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
> +MODULE_LICENSE("GPL");

These generally go at the bottom of the file.

The license tag here does not match the one in the SPDX header, after
you changed the other one to v2-only.

> +static const struct acpi_device_id button_device_ids[] = {
> +       {ACPI_BUTTON_HID_SWBTN, 0},
> +       {"", 0},
> +};
> +MODULE_DEVICE_TABLE(acpi, button_device_ids);
> +
> +static int acpi_button_add(struct acpi_device *device);
> +static int acpi_button_remove(struct acpi_device *device);
> +static void acpi_button_notify(struct acpi_device *device, u32 event);

Remove the forward declarations by defining the functions in the
natural order, with the driver registration last.

> +static struct acpi_driver acpi_button_driver = {
> +       .name = ACPI_BUTTON_DEVICE_NAME_SOFTWARE,
> +       .class = ACPI_BUTTON_CLASS,

Better open-code these macros here, to make it easier to grep for

> +static int __init acpi_button_init(void)
> +{
> +       return acpi_bus_register_driver(&acpi_button_driver);
> +}
> +
> +static void __exit acpi_button_exit(void)
> +{
> +       acpi_bus_unregister_driver(&acpi_button_driver);
> +}

Just use

module_acpi_driver(acpi_button_driver);

> +static int acpi_button_add(struct acpi_device *device)
> +{
> +       struct acpi_button *button;
> +       struct input_dev *input;
> +       const char *hid = acpi_device_hid(device);
> +       char *name, *class;
> +       int error;
> +
> +       button = kzalloc(sizeof(struct acpi_button), GFP_KERNEL);
> +       if (!button)
> +               return -ENOMEM;
> +
> +       device->driver_data = button;
> +
> +       button->input = input_allocate_device();
> +       input = button->input;
> +       if (!input) {
> +               error = -ENOMEM;
> +               goto err_free_button;
> +       }

You can simplify the cleanup by using devm_kzalloc() and
devm_input_allocate_device().

      Arnd
