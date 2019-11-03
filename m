Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26D66ED132
	for <lists+linux-input@lfdr.de>; Sun,  3 Nov 2019 01:08:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfKCAIQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Nov 2019 20:08:16 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:43102 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfKCAIQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Nov 2019 20:08:16 -0400
Received: by mail-qt1-f194.google.com with SMTP id l24so22307qtp.10;
        Sat, 02 Nov 2019 17:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ENs6i/0Ekm4YgubOks9MIfw6KzO9IBeI4tnjjFdS0V0=;
        b=l+2tg7UwbaIqIoayNNsFMQBE3ag2lc35vvjvy+6gDE3Wezq4yPhnyW0RAtByE+oFVY
         +lcXFTyjbKT+vHLWdTEQs2G9jmHqoWtWD5oAgosXeQLAhfjeB/1U8RktWifqRw0lwORX
         Qcq9XAVi6aMyaAmwIUHH5Ed2kMR0jCbURCxGXtDN811MmvEjqkGg8vHiwnX2GRp3d1Oc
         Kb25mB27sbeW9XSWWJrNRVGKoODE/NDmh9dDcHsal7TPIgdlUG2kf6mXzIDhtMUjMyvj
         Om8lG5AUfI1liEqUxMk8bBCC6zOtH3qdwfHmu/M5vCwEwlJH23q91iInbc+uqDP86oLN
         5ikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ENs6i/0Ekm4YgubOks9MIfw6KzO9IBeI4tnjjFdS0V0=;
        b=kt601pLWEmu4SjWfFhDXwKLHWG7FzRymnKPKquLx2g4tWDFjgOUdwu7TXwhumGiXhV
         D2eegnTdeokHyeV9nfg4/Yf8hhjRGOYswoZYIU7u8eA8lpH5yEa4oSVuzJbxOczVCt/2
         d+Ci6HgkKQPUvZjiT530babsiW/AbYY8UNfJcUgGKJ1KvFunC1ppsMzkDlWAJYulVBaU
         Oa4cSWMxFUlBiI8eYq4oCVNVfpQOCgBYgNiOzOaPm2FEVvthh1bXbsCqaofwoeyG/lzR
         mbadQsN+PhT4kwpOYQ7Rc04lHBYwdHIgg1SXrNUglLspa+LAvX8A+kKlPkaekF4JCBZT
         Z0+Q==
X-Gm-Message-State: APjAAAXk0ZP35uAEkH4A3d+pWORT0+ZT7dJlwRKUxQk75ZH8sJv7hshT
        mMnK6zfUiGohQI2jY0GFBabR1gwHYnwziVZccKI=
X-Google-Smtp-Source: APXvYqxycb2165plHZ7ekwUWL99R8defuAMaFEriMyJlNzPIdw3U7sweRkERm7SGMwLi9vKD4nnJyfYzCdsowuXaZy0=
X-Received: by 2002:a0c:a602:: with SMTP id s2mr7586138qva.12.1572739694357;
 Sat, 02 Nov 2019 17:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191030092956.17934-1-sanjay.govind9@gmail.com>
In-Reply-To: <20191030092956.17934-1-sanjay.govind9@gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Sat, 2 Nov 2019 17:08:03 -0700
Message-ID: <CAEc3jaA3Quz+hbvL3oWa92T4d0c_-J6ZVkshMGVVi3OA_Pjt6Q@mail.gmail.com>
Subject: Re: [PATCH] HID: sony: Add support for Guitar Hero Guitars
To:     sanjay.govind9@gmail.com
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Sanjay,

Thanks for sharing your patch. The code itself looks fine at first
glance, but I have been thinking about where this code belongs. I'm a
bit reluctant of adding code to hid-sony for essentially non-sony
devices. As Sony we are now supporting this driver unmodified in an
official capacity on various devices (all Android devices starting
Android 10) mostly for DualShock devices. I would rather convolute the
driver more with devices, which we don't have ourselves to test (and
nor for our partners as Google to test and QA).

Since these devices are non-Sony (though one of them use a Sony
partner vendor ID), I would prefer to have them in a "hid-activision"
driver.

Thanks,
Roderick

On Wed, Oct 30, 2019 at 2:40 AM <sanjay.govind9@gmail.com> wrote:
>
> From: Sanjay Govind <sanjay.govind9@gmail.com>
>
> Guitar Hero Guitars use the accelerometer x axis for tilt. Currently,
> they are treated as a regular HID device, and this does not allow the
> usage of the accelerometer. Add in support for both the PS3 and the
> PC guitars (they are the same guitars, with different vids and pids).
>
> Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
> ---
>  drivers/hid/hid-ids.h  |  5 +++++
>  drivers/hid/hid-sony.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 447e8db21174..1d640f94c5bc 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -40,6 +40,9 @@
>  #define USB_VENDOR_ID_ACTIONSTAR       0x2101
>  #define USB_DEVICE_ID_ACTIONSTAR_1011  0x1011
>
> +#define USB_VENDOR_ID_ACTIVISION 0x1430
> +#define USB_DEVICE_ID_ACTIVISION_GUITAR 0x474c
> +
>  #define USB_VENDOR_ID_ADS_TECH         0x06e1
>  #define USB_DEVICE_ID_ADS_TECH_RADIO_SI470X    0xa155
>
> @@ -1031,6 +1034,7 @@
>
>
>  #define USB_VENDOR_ID_SONY                     0x054c
> +#define USB_VENDOR_ID_SONY2                    0x12BA
>  #define USB_DEVICE_ID_SONY_VAIO_VGX_MOUSE      0x024b
>  #define USB_DEVICE_ID_SONY_VAIO_VGP_MOUSE      0x0374
>  #define USB_DEVICE_ID_SONY_PS3_BDREMOTE                0x0306
> @@ -1042,6 +1046,7 @@
>  #define USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER       0x042f
>  #define USB_DEVICE_ID_SONY_BUZZ_CONTROLLER             0x0002
>  #define USB_DEVICE_ID_SONY_WIRELESS_BUZZ_CONTROLLER    0x1000
> +#define USB_DEVICE_ID_SONY_GUITAR_CONTROLLER 0x0100
>
>  #define USB_VENDOR_ID_SINO_LITE                        0x1345
>  #define USB_DEVICE_ID_SINO_LITE_CONTROLLER     0x3008
> diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
> index 4c6ed6ef31f1..410c855fb830 100644
> --- a/drivers/hid/hid-sony.c
> +++ b/drivers/hid/hid-sony.c
> @@ -56,6 +56,7 @@
>  #define NSG_MR5U_REMOTE_BT        BIT(14)
>  #define NSG_MR7U_REMOTE_BT        BIT(15)
>  #define SHANWAN_GAMEPAD           BIT(16)
> +#define GH_GUITAR_CONTROLLER      BIT(17)
>
>  #define SIXAXIS_CONTROLLER (SIXAXIS_CONTROLLER_USB | SIXAXIS_CONTROLLER_BT)
>  #define MOTION_CONTROLLER (MOTION_CONTROLLER_USB | MOTION_CONTROLLER_BT)
> @@ -507,6 +508,8 @@ struct motion_output_report_02 {
>  #define SIXAXIS_INPUT_REPORT_ACC_X_OFFSET 41
>  #define SIXAXIS_ACC_RES_PER_G 113
>
> +#define GUITAR_TILT_USAGE 44
> +
>  static DEFINE_SPINLOCK(sony_dev_list_lock);
>  static LIST_HEAD(sony_device_list);
>  static DEFINE_IDA(sony_device_id_allocator);
> @@ -757,6 +760,20 @@ static int navigation_mapping(struct hid_device *hdev, struct hid_input *hi,
>         return -1;
>  }
>
> +static int guitar_mapping(struct hid_device *hdev, struct hid_input *hi,
> +                         struct hid_field *field, struct hid_usage *usage,
> +                         unsigned long **bit, int *max)
> +{
> +       if ((usage->hid & HID_USAGE_PAGE) == HID_UP_MSVENDOR) {
> +               unsigned int abs = usage->hid & HID_USAGE;
> +
> +               if (abs == GUITAR_TILT_USAGE) {
> +                       hid_map_usage_clear(hi, usage, bit, max, EV_ABS, ABS_RY);
> +                       return 1;
> +               }
> +       }
> +       return 0;
> +}
>
>  static int sixaxis_mapping(struct hid_device *hdev, struct hid_input *hi,
>                           struct hid_field *field, struct hid_usage *usage,
> @@ -1340,6 +1357,9 @@ static int sony_mapping(struct hid_device *hdev, struct hid_input *hi,
>         if (sc->quirks & SIXAXIS_CONTROLLER)
>                 return sixaxis_mapping(hdev, hi, field, usage, bit, max);
>
> +       if (sc->quirks & GH_GUITAR_CONTROLLER)
> +               return guitar_mapping(hdev, hi, field, usage, bit, max);
> +
>         if (sc->quirks & DUALSHOCK4_CONTROLLER)
>                 return ds4_mapping(hdev, hi, field, usage, bit, max);
>
> @@ -2950,6 +2970,12 @@ static int sony_resume(struct hid_device *hdev)
>  #endif
>
>  static const struct hid_device_id sony_devices[] = {
> +       { HID_USB_DEVICE(USB_VENDOR_ID_ACTIVISION, USB_DEVICE_ID_ACTIVISION_GUITAR),
> +               .driver_data = GH_GUITAR_CONTROLLER },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_SONY2, USB_DEVICE_ID_SONY_GUITAR_CONTROLLER),
> +               .driver_data = GH_GUITAR_CONTROLLER },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTROLLER),
> +               .driver_data = SIXAXIS_CONTROLLER_USB },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS3_CONTROLLER),
>                 .driver_data = SIXAXIS_CONTROLLER_USB },
>         { HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_NAVIGATION_CONTROLLER),
> --
> 2.23.0
>
