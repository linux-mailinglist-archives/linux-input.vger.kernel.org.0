Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3072A25E8
	for <lists+linux-input@lfdr.de>; Mon,  2 Nov 2020 09:16:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgKBIQl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Nov 2020 03:16:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53808 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728005AbgKBIQ2 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Nov 2020 03:16:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604304986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Q9E5xGx57vMbqA5TKhLA066RNqsSeQsOkkIf9/7DD/8=;
        b=QuOCydCGlzbRUGEl+vy6keZIfPTQxS3aagMqSLvjnlg/B/aM7DvBLg/4kRXcswX259Xn6/
        CNGAro28jaDKEu8o6VJYIBwOxXgfczcC7lvHCWzqAJqkXwieFDXA57IpTG9GmafIBs2DXn
        0M2ktAXDr+YgiFWo+VI0TO2S58YjOP0=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Z-jpfQx1NXOQEyu0t3eOlw-1; Mon, 02 Nov 2020 03:16:23 -0500
X-MC-Unique: Z-jpfQx1NXOQEyu0t3eOlw-1
Received: by mail-pg1-f199.google.com with SMTP id c9so5717672pgk.10
        for <linux-input@vger.kernel.org>; Mon, 02 Nov 2020 00:16:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q9E5xGx57vMbqA5TKhLA066RNqsSeQsOkkIf9/7DD/8=;
        b=Mpp5LepnYTaUuWF76pc4KZPWFZtcn5bGQpfTl9NByoCkBFW4po2Xpx28Sasg5+iYvu
         9AtgcmUcL2BRtDIBeZ5KltvCczJlDb1AhRToOGb6/0Ya19psqpIBsTsdyG63LvzJbtDt
         QrM1YSr5J2RXcm9fciLpLoBMqxB6zUTSJEAoX5Ni/uIsIZNOQ1CV7D99biFuZjWC9Id9
         iYJZD9Q28xJL5jwmqSv0VosjasGYqI3Vraa3lXrAR28cYUQvfdKmaJP5gofvNDkd8MSD
         4vzEXbWiGBRcpv0ZGDc+iKqrbW5lxSQ/Qe+DukmCc6+JYCSj9oTKzRR8iVNWYEQosXqo
         Zl/w==
X-Gm-Message-State: AOAM530T2+upzr8oSB7iPaZijeIOZtKH7UN6zWQkXhuEFNnJ1xnEZ5j+
        b/EAGibsE1xcMmTyFYIVRJvRbuWeePwnmHF8eef2ZWU+lZXh6JfrzjfKq+GefQvgOhc/nHUQjnP
        y7XfMLJRNGYQrlNN0efYl1N2TRrRG5VDbWT6I0WA=
X-Received: by 2002:a63:490e:: with SMTP id w14mr12552248pga.275.1604304982622;
        Mon, 02 Nov 2020 00:16:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztUX3eP7skIbxCCAfi1EqTTwLBQl5m0NBWbi48evSolymGVkpdQ1W2X2JQlawbyE7IApgbR/0pj9gAN9TuRhg=
X-Received: by 2002:a63:490e:: with SMTP id w14mr12552233pga.275.1604304982407;
 Mon, 02 Nov 2020 00:16:22 -0800 (PST)
MIME-Version: 1.0
References: <20201101193504.679934-1-lzye@google.com>
In-Reply-To: <20201101193504.679934-1-lzye@google.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 2 Nov 2020 09:16:11 +0100
Message-ID: <CAO-hwJJVKOM7Om8E+kmYXTrA7SiOFgFt46BHfv+0j+ORhepbaQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Fix the HID usage of DPAD input event generation.
To:     Chris Ye <lzye@google.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        linzhao.ye@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,


On Sun, Nov 1, 2020 at 8:35 PM Chris Ye <lzye@google.com> wrote:
>
> Generic Desktop DPAD usage is mapped by hid-input, that only the first
> DPAD usage maps to usage type EV_ABS and code of an axis. If HID
> descriptor has DPAD UP/DOWN/LEFT/RIGHT HID usages and each of usage size
> is 1 bit, then only the first one will generate input event, the rest of
> the HID usages will be assigned to hat direction only.
> The hid input event should check the HID report value and generate
> HID event for its hat direction.
>
> Test: Connect HID device with Generic Desktop DPAD usage and press the
> DPAD to generate input events.

Thanks for the patch, but I would rather have a proper tests added to
https://gitlab.freedesktop.org/libevdev/hid-tools

We already have gamepads tests, and it would be very nice to have this
patch reflected as a test as well. This would also allow me to better
understand the problem. I am not sure I follow the whole logic of this
patch without seeing the 2 variants of report descriptors.

Cheers,
Benjamin

>
> Signed-off-by: Chris Ye <lzye@google.com>
> ---
>  drivers/hid/hid-input.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 9770db624bfa..6c1007de3409 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -1269,7 +1269,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>         struct input_dev *input;
>         unsigned *quirks = &hid->quirks;
>
> -       if (!usage->type)
> +       if (!usage->type && !field->dpad)
>                 return;
>
>         if (usage->type == EV_PWR) {
> @@ -1286,9 +1286,17 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
>                 int hat_dir = usage->hat_dir;
>                 if (!hat_dir)
>                         hat_dir = (value - usage->hat_min) * 8 / (usage->hat_max - usage->hat_min + 1) + 1;
> -               if (hat_dir < 0 || hat_dir > 8) hat_dir = 0;
> -               input_event(input, usage->type, usage->code    , hid_hat_to_axis[hat_dir].x);
> -               input_event(input, usage->type, usage->code + 1, hid_hat_to_axis[hat_dir].y);
> +               if (hat_dir < 0 || hat_dir > 8 || value == 0)
> +                       hat_dir = 0;
> +               if (field->dpad) {
> +                       input_event(input, EV_ABS, field->dpad, hid_hat_to_axis[hat_dir].x);
> +                       input_event(input, EV_ABS, field->dpad + 1, hid_hat_to_axis[hat_dir].y);
> +               } else {
> +                       input_event(input, usage->type, usage->code,
> +                               hid_hat_to_axis[hat_dir].x);
> +                       input_event(input, usage->type, usage->code + 1,
> +                               hid_hat_to_axis[hat_dir].y);
> +               }
>                 return;
>         }
>
> --
> 2.29.1.341.ge80a0c044ae-goog
>

