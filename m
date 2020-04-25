Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3230B1B8543
	for <lists+linux-input@lfdr.de>; Sat, 25 Apr 2020 11:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgDYJbJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 25 Apr 2020 05:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726022AbgDYJbJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 25 Apr 2020 05:31:09 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC71EC09B04A
        for <linux-input@vger.kernel.org>; Sat, 25 Apr 2020 02:31:08 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id x25so13843309wmc.0
        for <linux-input@vger.kernel.org>; Sat, 25 Apr 2020 02:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joaomoreno-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EEKxffebZLltivk+kSM2JFvjD15XgOYg5dUHaU0hna4=;
        b=AnE7r9o4FqbVetU6B4bgSFA4LmrfbpJmTKBpUMcK7Suqb96iv0XOlc202E/bClDPB4
         Rcczh1i3obODzVHbyfwjqN0/bn6jcFhQp5sI99u5weZESjZCgr/3YRKkAWrZTYWIM3ip
         Rt0emQEz7vG+HQeH2uoJ+RThsCnkUoQrrunSXo+iC6UINcRpmrU2nCpYmTZcPartUi/2
         SxKzxTfNODpJXqHDOE4Azz7KxgEJNM3vC0aQQB8cEJVAwy5dfXZ3vaf5YRHyEawYFskB
         eI8jFHKcv/XRZdkUjV4BALSBU30Nou3sXdHHH0Zhr1GJcp1hoIxiskaUGYWuS/NypdYz
         uzgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EEKxffebZLltivk+kSM2JFvjD15XgOYg5dUHaU0hna4=;
        b=bVEzusbYwWsFIOUnbgx/myja0+q4yKXnTtPigg61cDFGPB/JTX4vZZQ1fHbPGDxhyH
         TYltpBGEzOg73bpKR+ZfRgOG5nKm4GkDquvEL/gCt0P334rdzqZrAzBRGJ2xyvZGsblQ
         Uv3UAsGrNTK5qNKZsk3R9XDDmRYB/k3lGKaGg+NYJK7pRxSdE1y9A2cEAnwOSIfuQNe6
         B7wmiK3mEnjlzdMhGHXVDaRkCGuBKVg674UUp9RRlj+f61nIZ/7fn1L5ufD2zoGvREtD
         lWpgMc7fQn5QaqqBU2ULQ5y/mt7cajJJGuXEGMf43izg8u6G57d7DyNLX4pWVWVfenms
         e3NA==
X-Gm-Message-State: AGi0PuZxEdGwaYFGcUMn76j4NhsvMcnC6r+0PLbqvm1insO0jDkXAAxP
        SdMOEuBJuupMhxMEMre+DAsxPp7r2E2WTcd5PmDHdQ==
X-Google-Smtp-Source: APiQypJcXex8xihyZVIrrMwRtg72JnNV4lcGldZVFR6JGuYL56am+G1VqluyEUqOoU1uNsZupPZEEqCIrH2aZjZD1dk=
X-Received: by 2002:a05:600c:1109:: with SMTP id b9mr14907697wma.116.1587807067312;
 Sat, 25 Apr 2020 02:31:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200424112222.118376-1-hdegoede@redhat.com>
In-Reply-To: <20200424112222.118376-1-hdegoede@redhat.com>
From:   =?UTF-8?B?Sm/Do28gTW9yZW5v?= <mail@joaomoreno.com>
Date:   Sat, 25 Apr 2020 11:30:57 +0200
Message-ID: <CAHxFc3T8JpdtMkkQfmArWuaA2VfKwQ52_g2uNFRkbsHtgqs6cQ@mail.gmail.com>
Subject: Re: [PATCH] HID: apple: Disable Fn-key key-re-mapping on clone keyboards
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Hans,

On Fri, 24 Apr 2020 at 13:22, Hans de Goede <hdegoede@redhat.com> wrote:
>
> The Maxxter KB-BT-001 Bluetooth keyboard, which looks somewhat like the
> Apple Wireless Keyboard, is using the vendor and product IDs (05AC:0239)
> of the Apple Wireless Keyboard (2009 ANSI version) <sigh>.
>
> But its F1 - F10 keys are marked as sending F1 - F10, not the special
> functions hid-apple.c maps them too; and since its descriptors do not
> contain the HID_UP_CUSTOM | 0x0003 usage apple-hid looks for for the
> Fn-key, apple_setup_input() never gets called, so F1 - F6 are mapped
> to key-codes which have not been set in the keybit array causing them
> to not send any events at all.

Oh no.

>
> The lack of a usage code matching the Fn key in the clone is actually
> useful as this allows solving this problem in a generic way.
>
> This commits adds a fn_found flag and it adds a input_configured
> callback which checks if this flag is set once all usages have been
> mapped. If it is not set, then assume this is a clone and clear the
> quirks bitmap so that the hid-apple code does not add any special
> handling to this keyboard.
>
> This fixes F1 - F6 not sending anything at all and F7 - F12 sending
> the wrong codes on the Maxxter KB-BT-001 Bluetooth keyboard and on
> similar clones.
>
> Cc: Joao Moreno <mail@joaomoreno.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Note hid-apple also enables APPLE_NUMLOCK_EMULATION for
> USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI. At least on the Maxxter clone
> this causes numlock to get stuck in the pressed state after pressing it
> twice (its get stuck when pressed when the numlock led is on). This might
> be specific to the clone, but it would be good to also check if this is
> not an issue on an actual Apple Wireless Keyboard.
>
> Joao, can you check the numlock-emulation stuff on your 05AC:0256
> (APPLE_ALU_WIRELESS_2011_ISO) keyboard?

Unfortunately I don't have that keyboard any more around. Maybe
someone else around could give this a try?

> ---
>  drivers/hid/hid-apple.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index d732d1d10caf..6909c045fece 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -54,6 +54,7 @@ MODULE_PARM_DESC(swap_opt_cmd, "Swap the Option (\"Alt\") and Command (\"Flag\")
>  struct apple_sc {
>         unsigned long quirks;
>         unsigned int fn_on;
> +       unsigned int fn_found;
>         DECLARE_BITMAP(pressed_numlock, KEY_CNT);
>  };
>
> @@ -339,12 +340,15 @@ static int apple_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>                 struct hid_field *field, struct hid_usage *usage,
>                 unsigned long **bit, int *max)
>  {
> +       struct apple_sc *asc = hid_get_drvdata(hdev);
> +
>         if (usage->hid == (HID_UP_CUSTOM | 0x0003) ||
>                         usage->hid == (HID_UP_MSVENDOR | 0x0003) ||
>                         usage->hid == (HID_UP_HPVENDOR2 | 0x0003)) {
>                 /* The fn key on Apple USB keyboards */
>                 set_bit(EV_REP, hi->input->evbit);
>                 hid_map_usage_clear(hi, usage, bit, max, EV_KEY, KEY_FN);
> +               asc->fn_found = true;
>                 apple_setup_input(hi->input);
>                 return 1;
>         }
> @@ -371,6 +375,19 @@ static int apple_input_mapped(struct hid_device *hdev, struct hid_input *hi,
>         return 0;
>  }
>
> +static int apple_input_configured(struct hid_device *hdev,
> +               struct hid_input *hidinput)
> +{
> +       struct apple_sc *asc = hid_get_drvdata(hdev);
> +
> +       if ((asc->quirks & APPLE_HAS_FN) && !asc->fn_found) {
> +               hid_info(hdev, "Fn key not found (Apple Wireless Keyboard clone?), disabling Fn key handling\n");
> +               asc->quirks = 0;
> +       }
> +
> +       return 0;
> +}
> +
>  static int apple_probe(struct hid_device *hdev,
>                 const struct hid_device_id *id)
>  {
> @@ -585,6 +602,7 @@ static struct hid_driver apple_driver = {
>         .event = apple_event,
>         .input_mapping = apple_input_mapping,
>         .input_mapped = apple_input_mapped,
> +       .input_configured = apple_input_configured,
>  };
>  module_hid_driver(apple_driver);
>
> --
> 2.26.0
>
