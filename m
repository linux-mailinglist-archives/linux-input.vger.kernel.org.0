Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19BB614E9F7
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 10:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgAaJSi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 04:18:38 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54466 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728159AbgAaJSi (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 04:18:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580462317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Jmme96QlUa+IDqsjrFZAnCl0yr/9BugGtCDrextrlNc=;
        b=XJbnGQjNZx//NdVaSuWmUHxBVEzV4KO+N0XDTd7v8cjfyw3KGC2x2oekhCZurKl6W7PtCS
        r/cN64ks9PBqbTKENxV57NnYwJ7MgHtDBpVOgSO1NwaLQVfvibf7uAb1PbGwr+Zg/nHC1c
        OVM8a4zGtQghFsbVT25Pr5cPdEPpPvA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-m_oKliw2M3uk4WaUNVzuLw-1; Fri, 31 Jan 2020 04:18:34 -0500
X-MC-Unique: m_oKliw2M3uk4WaUNVzuLw-1
Received: by mail-qv1-f71.google.com with SMTP id z9so4021990qvo.10
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 01:18:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jmme96QlUa+IDqsjrFZAnCl0yr/9BugGtCDrextrlNc=;
        b=HnDs4w+Tyw+IyzYwFjD1vJrHIJIBxrTjeDFEDR++68kcUapwhZH3FW6MhkiEgoPZvc
         QjyAlEMAXANMDNq554Hn6RxurZQk9xehgwiGT5U7pBpJDwOuSdvOTCjunx7k9WtkcGKf
         yMm+p/A0OrgziuIJcQefBK2Ipvh7KHNCaHFL+ussNx2yaHVmaTV4ObE1n9f+6FPj6wrz
         mrolx5199hFu19QTdrVKWf6QMAtVycfTKS4AZfUNBeZZJdWngNDJsc5abrcGPpycK3kh
         3n/bW1aQFQ9uyGKKByeCSpbmVKBS+LNaslHHhqATNK8AQ1PHffen6F1AP5QyDktVE0Fo
         rUtA==
X-Gm-Message-State: APjAAAVXjM72bICps5EGZiWUZ3uB2HQ32x5/ubXhqAQzGMw/vYVmaNpA
        sVvNqn61H4n/KQL92ixwFWgqNX/h5qR4O02A/O8ZJMjGr5KIDuJx8m6hZPm7cvOWbfEBOYwgJo2
        4ufbGftiScY/1j4Tp1WXllMfYhkvwJS3reELmUbw=
X-Received: by 2002:a05:620a:782:: with SMTP id 2mr9726744qka.169.1580462313421;
        Fri, 31 Jan 2020 01:18:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqxSJN/gnvHSnFVwAfiBsVQyZn0u3acWA821ZspGgOXnAv3U+LlXcqYOnln2cs/dSXzTSi0GtdQHMO/4X/uA61E=
X-Received: by 2002:a05:620a:782:: with SMTP id 2mr9726721qka.169.1580462313162;
 Fri, 31 Jan 2020 01:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20200130192126.GA101099@ariel>
In-Reply-To: <20200130192126.GA101099@ariel>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 31 Jan 2020 10:18:22 +0100
Message-ID: <CAO-hwJLba+CPcWNcB2CK+JU7npM9sMjHYkOWAS=VCuvdtzRDcg@mail.gmail.com>
Subject: Re: [PATCH] HID: Add quirk for Apple Magic Keyboard over Bluetooth
To:     Daniel Lockyer <hi@daniellockyer.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Daniel,

On Thu, Jan 30, 2020 at 8:31 PM Daniel Lockyer <hi@daniellockyer.com> wrote:
>
> The Apple Magic Keyboard works flawlessly over USB but has weird bugs
> over Bluetooth. This patch adds the missing quirk.
>
> Signed-off-by: Daniel Lockyer <hi@daniellockyer.com>
> ---
>  drivers/hid/hid-quirks.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 0e7b2d998395..6d68a9201e1d 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -280,6 +280,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ANSI) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_ISO) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2011_JIS) },
> +       { HID_BLUETOOTH_DEVICE(BT_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI) },

That is weird. The whole purpose of this list (which I'd like to
remove in the future) is to prevent hid-generic to ever bind to those
devices. This can be problematic in situations where you do not have
the corresponding driver, in the initrd for instance.

Can you share your dmesg before and after applying this patch so I get
a grasp on why you need that change?

Cheers,
Benjamin

>         { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_MAGIC_KEYBOARD_ANSI) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
> --
> 2.25.0
>

