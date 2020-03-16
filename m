Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C49211865EF
	for <lists+linux-input@lfdr.de>; Mon, 16 Mar 2020 08:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbgCPHvF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Mar 2020 03:51:05 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:39706 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729745AbgCPHvF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Mar 2020 03:51:05 -0400
Received: by mail-ua1-f67.google.com with SMTP id o16so6136705uap.6
        for <linux-input@vger.kernel.org>; Mon, 16 Mar 2020 00:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i0zDChC/wEd931QcHPYFdsZbptmXL5czRy9fIJzF9Os=;
        b=lfpCtz3okbIvkiKIsprySyGNw0WWfVbJqWnQpSrysHhl3opcygESioQgUUw5y8OIw8
         0YlyBmrVGZqeMxbhvBDhb2oqbnjGugyu/qg/HxDJBB7pTei/FIlPMr6VV+MoJiA/sFXN
         hwicZwzDF9qOY145bYD4UU0vh/NPw3LckjGNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i0zDChC/wEd931QcHPYFdsZbptmXL5czRy9fIJzF9Os=;
        b=CMoJIWSSdFXIKNc+ZF9nPg9J1scT0PL9klqdUCOwqiF9H0rNbNANwd2FsHmAJQiyCN
         7eZL+6JQCLgIa2C/elpdmJ0O9D7hjj25BVMJgPO8JyVMlyzwBitkIMZpgfc05h9f7z29
         47gGxK0T6DeXVub4iMwxwd8NAW+FNezdUpiibqVvmc2g6//2IVtsYvQSPCkhCXvQAgVh
         UCJAzv5+/30oDzScCCFXPDD7bFkG+9e0GkSWgVLbvsM/Nlj+BvYx9VPYpUpC+Ni9jXD9
         dEUf1RqO8xf5iGr5mMEkKRUtME7kwh1eHmjLXjeWIcXqWPAaDV1Ttbc6CQYs2cU7/uA6
         wrQw==
X-Gm-Message-State: ANhLgQ2n74EQJIwydUPrNHMRBLo6I6vuN8iwcT4NwPbppqLaTOpbJupo
        kAe8lmBdzi7Ik5g79DsnzwoiHa/zXtmOum4eJLI2lyMp
X-Google-Smtp-Source: ADFU+vsjo1dRLv/zfDMpdVrD9x5y9Nya6mOAFCScpBDgpmsQ2ypeVyujD90X50SbOKlS3aMqDRYItp3vkhNbHVPWdUE=
X-Received: by 2002:ab0:28c9:: with SMTP id g9mr14197112uaq.117.1584345064363;
 Mon, 16 Mar 2020 00:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200316072419.65274-1-chentsung@chromium.org>
In-Reply-To: <20200316072419.65274-1-chentsung@chromium.org>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Mon, 16 Mar 2020 15:50:53 +0800
Message-ID: <CANMq1KD1dLzd3cYmdsg5wF5z-prtdq41P8fuzDQomX=6UbZpeg@mail.gmail.com>
Subject: Re: [PATCH] HID: google: add moonball USB id
To:     Chen-Tsung Hsieh <chentsung@chromium.org>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Looks better with the mailing lists cc-ed, thanks!

On Mon, Mar 16, 2020 at 3:24 PM Chen-Tsung Hsieh <chentsung@chromium.org> wrote:
>
> Add 1 additional hammer-like device.
>
> Signed-off-by: Chen-Tsung Hsieh <chentsung@chromium.org>

Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/hid/hid-google-hammer.c | 2 ++
>  drivers/hid/hid-ids.h           | 1 +
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/hid/hid-google-hammer.c b/drivers/hid/hid-google-hammer.c
> index 2aa4ed157aec..85a054f1ce38 100644
> --- a/drivers/hid/hid-google-hammer.c
> +++ b/drivers/hid/hid-google-hammer.c
> @@ -532,6 +532,8 @@ static const struct hid_device_id hammer_devices[] = {
>                      USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_MAGNEMITE) },
>         { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>                      USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_MASTERBALL) },
> +       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +                    USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_MOONBALL) },
>         { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>                      USB_VENDOR_ID_GOOGLE, USB_DEVICE_ID_GOOGLE_STAFF) },
>         { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 3a400ce603c4..33fddab41722 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -478,6 +478,7 @@
>  #define USB_DEVICE_ID_GOOGLE_WHISKERS  0x5030
>  #define USB_DEVICE_ID_GOOGLE_MASTERBALL        0x503c
>  #define USB_DEVICE_ID_GOOGLE_MAGNEMITE 0x503d
> +#define USB_DEVICE_ID_GOOGLE_MOONBALL  0x5044
>
>  #define USB_VENDOR_ID_GOTOP            0x08f2
>  #define USB_DEVICE_ID_SUPER_Q2         0x007f
> --
> 2.25.1.481.gfbce0eb801-goog
>
