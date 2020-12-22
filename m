Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DFC2E0D7C
	for <lists+linux-input@lfdr.de>; Tue, 22 Dec 2020 17:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727418AbgLVQmh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Dec 2020 11:42:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbgLVQmh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Dec 2020 11:42:37 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 298C4C0613D3
        for <linux-input@vger.kernel.org>; Tue, 22 Dec 2020 08:41:57 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id w5so8727588pgj.3
        for <linux-input@vger.kernel.org>; Tue, 22 Dec 2020 08:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessos.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4xcAHW0XBCyUGubD++/OVWBJA5lPhprCBQF9D05n+MI=;
        b=BX0G3WyK1dfrzWtYs4Z6SUG9+r6N8uOuIxQpfrWqGbpeqaMOpG5/04cJQGiT3d9vAD
         QpkY14Q/R0crgbtoaadRnFGof6sczgtA3/mQigkWIUQfvwbpKG6oxlNlzfGc/neVodly
         Nk7Amu3ZyeMz3Qeslo/cTk482BsB2dXH/Pwk9N4c2uXZlwBcZfV1Rm8Nv4QB2fUS/sa2
         7Sp6loUGG5qGV3J+Bp30hPjInuwl0ZLxC0eN2oc2Icdk42ZmnhVUxVHPsaMaWFqh/eDJ
         +6vtekmV/QD/P2qC1Tw8GN0dQtIZ65hzlJp5YsfLTtEZJo9OLd4wpIPVjtKEN/KBHjvq
         6C1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4xcAHW0XBCyUGubD++/OVWBJA5lPhprCBQF9D05n+MI=;
        b=sgC8OisECCCpvjem/VOJv+6/eSmlnHcia9XY4Qj6g1L6citratTiUirMa7a3hAY+7F
         nxU+5Ln73SI3gYyU1YzpPlOJ1Kt5GZ5JGCdqV+MosqxjGn6RxcwW9mpvxLTbNvKYDjjz
         vIt54CM2leVzCnXhYac2pyKh6tGTP+6O4BlsXu9KaFCIhPshR7tDP7oKYsQ/XOgwdjv0
         NTa5X46FJeKcmCLNs8+RgJPlkzIDfLd9162oAMShGJCnfrt+GUx2Ms95TZqPkhFu7U9X
         shsktY4eGkpAa9aAjDrkKoDYy0NheGhCMLuFHjVutgnjxuSNBxrqRaz3Wi/Pp43Q6+Hu
         iLCg==
X-Gm-Message-State: AOAM532MJFgy9DlAf3ovGdLrxIq0+vTb86lD6Yz7qkhdoOiT+GR41fyv
        1S4sNfDjR6AJr1fl2gFcv92mb6w7l0HQKZYVgHdrpQ==
X-Google-Smtp-Source: ABdhPJw/oiTxxOPfcDoKXuyGtxsBCVwI1p6WYXr+n7mhIIfjr0tV8CwKPD2wC2UV4ncGjs1M/kJvEi7d7C5OsSTQqO4=
X-Received: by 2002:a63:220b:: with SMTP id i11mr20732958pgi.2.1608655316551;
 Tue, 22 Dec 2020 08:41:56 -0800 (PST)
MIME-Version: 1.0
References: <20201222073855.98490-1-jhp@endlessos.org>
In-Reply-To: <20201222073855.98490-1-jhp@endlessos.org>
From:   Chris Chiu <chiu@endlessos.org>
Date:   Wed, 23 Dec 2020 00:41:45 +0800
Message-ID: <CAB4CAwfFQrMDYuzjL2nuUnHgXO031ty-mA7GGxW+-nHFkZTGTg@mail.gmail.com>
Subject: Re: [PATCH] HID: Add Wireless Radio Control feature for Chicony devices
To:     Jian-Hong Pan <jhp@endlessos.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input <linux-input@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        linux@endlessos.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 22, 2020 at 3:41 PM Jian-Hong Pan <jhp@endlessos.org> wrote:
>
> Some Chicony's keyboards support airplane mode hotkey (Fn+F2) with
> "Wireless Radio Control" feature. For example, the wireless keyboard
> [04f2:1236] shipped with ASUS all-in-one desktop.
>
> After consulting Chicony for this hotkey, learned the device will send
> with 0x11 as the report ID and 0x1 as the value when the key is pressed
> down.
>
> This patch maps the event as KEY_RFKILL.
>
> Signed-off-by: Jian-Hong Pan <jhp@endlessos.org>
> ---
>  drivers/hid/hid-chicony.c | 58 +++++++++++++++++++++++++++++++++++++++
>  drivers/hid/hid-ids.h     |  1 +
>  2 files changed, 59 insertions(+)
>
> diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
> index 3f0ed6a95223..aca963aa0f1e 100644
> --- a/drivers/hid/hid-chicony.c
> +++ b/drivers/hid/hid-chicony.c
> @@ -21,6 +21,42 @@
>
>  #include "hid-ids.h"
>
> +#define KEY_PRESSED                    0x01
> +#define CH_WIRELESS_CTL_REPORT_ID      0x11
> +
> +static int ch_report_wireless(struct hid_report *report, u8 *data, int size)
> +{
> +       struct hid_device *hdev = report->device;
> +       struct input_dev *input;
> +
> +       if (report->id != CH_WIRELESS_CTL_REPORT_ID ||
> +           report->maxfield != 1 ||
> +           *report->field[0]->value != KEY_PRESSED)

Maybe replace this line with hid_check_keys_pressed() and the KEY_PRESSED
is not required.

> +               return 0;
> +
> +       input = report->field[0]->hidinput->input;
> +       if (!input) {
> +               hid_warn(hdev, "can't find wireless radio control's input");
> +               return 0;
> +       }
> +
> +       input_report_key(input, KEY_RFKILL, 1);
> +       input_sync(input);
> +       input_report_key(input, KEY_RFKILL, 0);
> +       input_sync(input);
> +
> +       return 1;
> +}
> +
> +static int ch_raw_event(struct hid_device *hdev,
> +               struct hid_report *report, u8 *data, int size)
> +{
> +       if (report->application == HID_GD_WIRELESS_RADIO_CTLS)
> +               return ch_report_wireless(report, data, size);
> +
> +       return 0;
> +}
> +
>  #define ch_map_key_clear(c)    hid_map_usage_clear(hi, usage, bit, max, \
>                                         EV_KEY, (c))
>  static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
> @@ -77,10 +113,30 @@ static __u8 *ch_switch12_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>         return rdesc;
>  }
>
> +static int ch_probe(struct hid_device *hdev, const struct hid_device_id *id)
> +{
> +       int ret;
> +
> +       hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> +       ret = hid_parse(hdev);
> +       if (ret) {
> +               hid_err(hdev, "Chicony hid parse failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
> +       if (ret) {
> +               hid_err(hdev, "Chicony hw start failed: %d\n", ret);
> +               return ret;
> +       }
> +
> +       return 0;
> +}
>
>  static const struct hid_device_id ch_devices[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_TACTICAL_PAD) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS2) },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS3) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_ACER_SWITCH12) },
>         { }
>  };
> @@ -91,6 +147,8 @@ static struct hid_driver ch_driver = {
>         .id_table = ch_devices,
>         .report_fixup = ch_switch12_report_fixup,
>         .input_mapping = ch_input_mapping,
> +       .probe = ch_probe,
> +       .raw_event = ch_raw_event,
>  };
>  module_hid_driver(ch_driver);
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 4c5f23640f9c..06d90301a3dc 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -270,6 +270,7 @@
>  #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE 0x1053
>  #define USB_DEVICE_ID_CHICONY_PIXART_USB_OPTICAL_MOUSE2        0x0939
>  #define USB_DEVICE_ID_CHICONY_WIRELESS2        0x1123
> +#define USB_DEVICE_ID_CHICONY_WIRELESS3        0x1236
>  #define USB_DEVICE_ID_ASUS_AK1D                0x1125
>  #define USB_DEVICE_ID_CHICONY_TOSHIBA_WT10A    0x1408
>  #define USB_DEVICE_ID_CHICONY_ACER_SWITCH12    0x1421
> --
> 2.29.2
>
