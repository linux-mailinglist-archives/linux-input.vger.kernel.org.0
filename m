Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 283179AC77
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2019 12:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392064AbfHWKHL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 23 Aug 2019 06:07:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50782 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2391995AbfHWKHE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 23 Aug 2019 06:07:04 -0400
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AD0BAC050061
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 10:07:03 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id d203so8571410qke.4
        for <linux-input@vger.kernel.org>; Fri, 23 Aug 2019 03:07:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1qTrupegLo3u3nuR5XIE3rXtDob+SQqNerz4BULqfAk=;
        b=Z4Bre9TY4ff+p6en5EduPA6i8bgLifkF2S7QZbDUUgXgK16N2vyX+2yYqXvrszemg/
         n0jw03TIql3b0rLu6VkAA+YDS/tHqdtTZwTRr7PIU3L8XAX7HH3rSTAm0LfaWrwn+A/g
         x4pdseKY1HbqlOCIhMloZ9Kf3if0XwLOI84hEEozh2xrhy5lP+yio/bEBXIjGxSrQf/3
         xGrLZjS8DzHgYvTD5vrMbJODbre9oMkrb6I45S2GngCFzqbzKWZ1BRyTV77TY7pPUfnV
         9ilGoDNhbL4WKNwxVuTtaiyy9BscOiSXkrNYWYwaqvV9BF6V9N2LG8bVEGn8vrUR2B21
         fzrg==
X-Gm-Message-State: APjAAAWHOkl1KtNuXxpbN8b1ejRuTter7Sl646FGy1SqGqa2oukA64NA
        2grL7HeWWC6fjaM5BPyYHypoeSkPhV5bl8uANeGDo4qmrynJJuoWXaD2vIvtOjMWybgAL4nqQv6
        Rob8An3/nnwLFf7Aga99a7z4FUYBgD6F9wDbXqeI=
X-Received: by 2002:ad4:4974:: with SMTP id p20mr3008447qvy.29.1566554822994;
        Fri, 23 Aug 2019 03:07:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxNwW5Vj+CElg3egvLGrz0tB/3keOZ4CzgCNyFMXCyW2lgOmeoRIPAm0sFQuM0jFiHntpZDy1KFOILCqvhXN5s=
X-Received: by 2002:ad4:4974:: with SMTP id p20mr3008436qvy.29.1566554822772;
 Fri, 23 Aug 2019 03:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190730122458.5275-1-lains@archlinux.org>
In-Reply-To: <20190730122458.5275-1-lains@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 23 Aug 2019 12:06:51 +0200
Message-ID: <CAO-hwJJ2kFoAp8at_a+KRfjivZ2VnbNDXsx=BBQbiEDLZ==3Sg@mail.gmail.com>
Subject: Re: [PATCH v2] hid-logitech-dj: add the new Lightspeed receiver
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 30, 2019 at 2:26 PM Filipe Laíns <lains@archlinux.org> wrote:
>
> This patchs adds the new Lightspeed receiver. Currently it seems to only
> be used in the G305.
>
> Signed-off-by: Filipe Laíns <lains@archlinux.org>

Applied to for-5.4/logitech

Cheers,
Benjamin

> ---
>  drivers/hid/hid-ids.h         |  3 ++-
>  drivers/hid/hid-logitech-dj.c | 13 +++++++++++--
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index fb19eefbc0b3..61b954fcfc2e 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -768,7 +768,8 @@
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER           0xc52f
>  #define USB_DEVICE_ID_LOGITECH_UNIFYING_RECEIVER_2     0xc532
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_2         0xc534
> -#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED        0xc539
> +#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1      0xc539
> +#define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1    0xc53f
>  #define USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_POWERPLAY 0xc53a
>  #define USB_DEVICE_ID_SPACETRAVELLER   0xc623
>  #define USB_DEVICE_ID_SPACENAVIGATOR   0xc626
> diff --git a/drivers/hid/hid-logitech-dj.c b/drivers/hid/hid-logitech-dj.c
> index 4a68960b131f..d718f01f56d3 100644
> --- a/drivers/hid/hid-logitech-dj.c
> +++ b/drivers/hid/hid-logitech-dj.c
> @@ -968,7 +968,12 @@ static void logi_hidpp_recv_queue_notif(struct hid_device *hdev,
>                 logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
>                 break;
>         case 0x0c:
> -               device_type = "eQUAD Lightspeed";
> +               device_type = "eQUAD Lightspeed 1";
> +               logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
> +               workitem.reports_supported |= STD_KEYBOARD;
> +               break;
> +       case 0x0d:
> +               device_type = "eQUAD Lightspeed 1_1";
>                 logi_hidpp_dev_conn_notif_equad(hdev, hidpp_report, &workitem);
>                 workitem.reports_supported |= STD_KEYBOARD;
>                 break;
> @@ -1832,7 +1837,11 @@ static const struct hid_device_id logi_dj_receivers[] = {
>          .driver_data = recvr_type_hidpp},
>         { /* Logitech lightspeed receiver (0xc539) */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> -               USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED),
> +               USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1),
> +        .driver_data = recvr_type_gaming_hidpp},
> +       { /* Logitech lightspeed receiver (0xc53f) */
> +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH,
> +               USB_DEVICE_ID_LOGITECH_NANO_RECEIVER_LIGHTSPEED_1_1),
>          .driver_data = recvr_type_gaming_hidpp},
>         { /* Logitech 27 MHz HID++ 1.0 receiver (0xc513) */
>           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_MX3000_RECEIVER),
> --
> 2.22.0
