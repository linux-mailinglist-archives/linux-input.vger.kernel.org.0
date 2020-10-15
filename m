Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E01F28F0C0
	for <lists+linux-input@lfdr.de>; Thu, 15 Oct 2020 13:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731213AbgJOLK7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Oct 2020 07:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387911AbgJOLKl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Oct 2020 07:10:41 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3F1C061755
        for <linux-input@vger.kernel.org>; Thu, 15 Oct 2020 04:10:41 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id hk7so1822950pjb.2
        for <linux-input@vger.kernel.org>; Thu, 15 Oct 2020 04:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4ylEEHGqwXKNyCvEIUDZbZFpnRokP5Qrc4w3m3m00Qk=;
        b=pToYVkEFhdRghFPzibNYHi0v7Pr4olnsrjGqIfoD95Ymhyfl9tN3U+vxY8RBsk3Uv0
         HCvg23AwBCR+9B9U3oozn5MfJjLqZSfqBt7OgKpWdC96H3BX33AUTTDuG5BF0+JU+blj
         Dvc7B0x446J4dBBVHeXXiiGH4fPmiCZrLRHZT4BLECfZqsVEztetr7WMrmWFQGwR51jX
         tIVxwCKW6VhggVfQJr7RZseBToguFKYO3icVZo6sdDXECztDnwAFuyuE9yUfpnFTlaO8
         NzmhwI2PcZucSMJMYXoNGwsevY6nScLK7VvmDMcUPyEmEmRTkjrVuxCXY55keZHfmXaL
         TcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4ylEEHGqwXKNyCvEIUDZbZFpnRokP5Qrc4w3m3m00Qk=;
        b=fduBOvvdec2sjVSLij8PALyvZ0OegYDHl6rJ1cNAWSGpR6RPwvpuAcOxHH9hHM6pOT
         VDwtn9H0/tidWFOZ6HYrSA80VVAPmHJBDP5eaG9cKAFgZWmu3qV1B1XIMDFqI+DWMiCG
         4SBbdKyGONgJDo/y3rQR4ListHROXaDXqk61oSFfQDMCnMCLzAaHgRmDyyTy1fDnT+m0
         JmW9OtXYaCZYJSxMUINFNP6U1WtYXquIx2wSGq/y0qx6pHeQr+tjthxG+7YQ30nJEWkn
         K7uSH9z9H+6QNIn6S8K3jOKiOQeOiA9GGZBXr29vepJ3fO2+GzVPqWIzSJtoD/wd+CgT
         mvlg==
X-Gm-Message-State: AOAM533b6TnWpNmKDAfMBH6LfPBtkdntZdFhL6hNphqy3XJYDf9qhtcL
        t54nX9MhfF5lzELsKW7+6Vn8sy6//zF4INxkvvg=
X-Google-Smtp-Source: ABdhPJzm+qfQHVchQKI0ylm5B+A6l4yI3vKvRSvMXKGZ7wwCn7zpkhjTOms0BVRdEKTq/9w09GEPhkJw70VZUyPgIqg=
X-Received: by 2002:a17:902:ea8c:b029:d2:8abd:c8de with SMTP id
 x12-20020a170902ea8cb02900d28abdc8demr3814267plb.21.1602760240509; Thu, 15
 Oct 2020 04:10:40 -0700 (PDT)
MIME-Version: 1.0
References: <20201013073508.10476-1-luke@ljones.dev>
In-Reply-To: <20201013073508.10476-1-luke@ljones.dev>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 15 Oct 2020 14:11:29 +0300
Message-ID: <CAHp75VfOV2DvngsO87PLXwNKQtR-RaC4XzbBk_7wDVSEaBMrzw@mail.gmail.com>
Subject: Re: [PATCH V8] HID: ASUS: Add support for ASUS N-Key keyboard
To:     Luke D Jones <luke@ljones.dev>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Oct 13, 2020 at 10:35 AM Luke D Jones <luke@ljones.dev> wrote:
>
> The ASUS N-Key keyboard uses the productId of 0x1866 and is used in
> almost all modern ASUS gaming laptops with slight changes to the
> firmware. This patch enables: Fn+key hotkeys, keyboard backlight
> brightness control, and notify asus-wmi to toggle "fan-mode".
>
> The keyboard has many of the same key outputs as the existing ASUS
> keyboard including a few extras, and varies a little between laptop
> models.
>
> Additionally this keyboard requires the LED interface to be
> intitialised before such things as keyboard backlight control work.

initialised

> Misc changes in scope: update some hardcoded comparisons to use an
> available define.
...

> @@ -26,6 +26,8 @@
>  #include <linux/dmi.h>
>  #include <linux/hid.h>
>  #include <linux/module.h>
> +
> +#include <linux/acpi.h>

Blank line is not needed and perhaps put new inclusion somehow ordered
(yes, I see the order is broken, by maybe try your best).

>  #include <linux/platform_data/x86/asus-wmi.h>
>  #include <linux/input/mt.h>
>  #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */

...

> +/*
> + * This enables triggering events in asus-wmi
> + */
> +static int asus_wmi_send_event(struct asus_drvdata *drvdat, u8 code)
> +{
> +       int err;
> +       u32 retval;
> +
> +       err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS,
> +               ASUS_WMI_DEVID_NOTIF, code, &retval);
> +       if (err) {

> +               pr_warn("Failed to notify asus-wmi: %d\n", err);

dev_warn() ?

> +               return err;
> +       }

> +       if (retval != 0) {

if (retval)

> +               pr_warn("Failed to notify asus-wmi (retval): 0x%x\n", retval);

dev_warn()?

Now a question is why warn and not err level for both messages?
And maybe even hid_err() / hid_warn().

> +               return -EIO;
> +       }
> +
> +       return 0;
> +}

...

>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>                       struct hid_usage *usage, __s32 value)
>  {
> -       if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> +       if ((usage->hid & HID_USAGE_PAGE) == HID_UP_ASUSVENDOR &&

Seems like a separate change.

...

> +       int ret;

Inconsistent with the first part of the patch there you used err. So,
be consistent.

> +       if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD) {
> +               /*
> +                * Skip these report ID, the device emits a continuous stream associated
> +                * with the AURA mode it is in which looks like an 'echo'

+ period at the end.

> +               */
> +               if (report->id == FEATURE_KBD_LED_REPORT_ID1 ||
> +                               report->id == FEATURE_KBD_LED_REPORT_ID2) {

> +                       return -1;

is -1 a good return code? (this Q for all cases)

> +               /* Additional report filtering */
> +               } else if (report->id == FEATURE_KBD_REPORT_ID) {
> +                       /* Fn+F5 "fan" symbol, trigger WMI event to toggle next mode */
> +                       if (data[1] == 0xae) {
> +                               ret = asus_wmi_send_event(drvdata, 0xae);
> +                               if (ret < 0) {
> +                                       hid_warn(hdev, "Asus failed to trigger fan control event");
> +                               }

> +                               return -1;
> +                       /*
> +                        * G14 and G15 send these codes on some keypresses with no
> +                        * discernable reason for doing so. We'll filter them out to avoid
> +                        * unmapped warning messages later

Period at the end.
This is for all multi-line comments.

> +                       */
> +                       } else if (data[1] == 0xea || data[1] == 0xec || data[1] == 0x02 ||
> +                                       data[1] == 0x8a || data[1] == 0x9e) {
> +                               return -1;
> +                       }
> +               }
> +       }

...

> +static int rog_nkey_led_init(struct hid_device *hdev)
> +{
> +       u8 buf_init_start[] = { FEATURE_KBD_LED_REPORT_ID1, 0xB9 };
> +       u8 buf_init2[] = { FEATURE_KBD_LED_REPORT_ID1, 0x41, 0x53, 0x55, 0x53, 0x20,
> +                               0x54, 0x65, 0x63, 0x68, 0x2e, 0x49, 0x6e, 0x63, 0x2e, 0x00 };
> +       u8 buf_init3[] = { FEATURE_KBD_LED_REPORT_ID1,
> +                                               0x05, 0x20, 0x31, 0x00, 0x08 };
> +       int ret;
> +
> +       hid_info(hdev, "Asus initialise N-KEY Device");
> +       /* The first message is an init start */
> +       ret = asus_kbd_set_report(hdev, buf_init_start, sizeof(buf_init_start));
> +       if (ret < 0)
> +               hid_err(hdev, "Asus failed to send init start command: %d\n", ret);
> +       /* Followed by a string */
> +       ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +       if (ret < 0)
> +               hid_err(hdev, "Asus failed to send init command 1.0: %d\n", ret);
> +       /* Followed by a string */
> +       ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> +       if (ret < 0)
> +               hid_err(hdev, "Asus failed to send init command 1.1: %d\n", ret);

If you do hid_err() why are you not bailing out?
Mis-leveling of messages otherwise.

> +
> +       /* begin second report ID with same data */
> +       buf_init2[0] = FEATURE_KBD_LED_REPORT_ID2;
> +       buf_init3[0] = FEATURE_KBD_LED_REPORT_ID2;
> +
> +       ret = asus_kbd_set_report(hdev, buf_init2, sizeof(buf_init2));
> +       if (ret < 0)
> +               hid_err(hdev, "Asus failed to send init command 2.0: %d\n", ret);
> +
> +       ret = asus_kbd_set_report(hdev, buf_init3, sizeof(buf_init3));
> +       if (ret < 0)
> +               hid_err(hdev, "Asus failed to send init command 2.1: %d\n", ret);
> +
> +       return ret;
> +}

--
With Best Regards,
Andy Shevchenko
