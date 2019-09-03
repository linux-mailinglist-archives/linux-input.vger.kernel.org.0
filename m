Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9CD1A6CAC
	for <lists+linux-input@lfdr.de>; Tue,  3 Sep 2019 17:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729600AbfICPOx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Sep 2019 11:14:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49534 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728854AbfICPOx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Sep 2019 11:14:53 -0400
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 07D1D80F7C
        for <linux-input@vger.kernel.org>; Tue,  3 Sep 2019 15:14:53 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id e22so19320299qtp.9
        for <linux-input@vger.kernel.org>; Tue, 03 Sep 2019 08:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ejcHLZCIGB0+l1juCzkjIEZbgLC/qCu2LLXQois6BYM=;
        b=OTRAsQk9e4qALqK3XAWS3quFE8vyXACMYyJlA6jTRvtc7EpsQPpUtg0yqM9kTrbycN
         yzpY+0drFqiWJUr+aYFA6iP79VDVC1U9eMvbPwngs3hDT2mUu/8htPhwXU6H4N8S/bW7
         Y2TWKbMAkbwAsuyMSKS5tNvyzdAgcS19n2xnDgfGV3yAPj6/lLAsuIrx85i87+cjZMCl
         iD0fpZuwuGHHvWczESzilvqKrNBOl7cKsMChAyoAfCuWlTK//rsZDyuOu9Gj1ue3opuF
         xxJHsUpVX4+fkmLxEPZnjlB/R404SgcDRHmGv7nWx6g9kkbEQee2L6T2TN4DpfjzB6jy
         Yacw==
X-Gm-Message-State: APjAAAXv4ersoEMFgKnh6BIxK9EgC2QepLs2G+iwUrqdD992FDQEW7rG
        bqN9mVzZUiX8LBYpAI9p0aQOJaHm2Xko+91uULRatYMfN//eoKMtVPfgpVU5ilIigLL0cwZUjFs
        8358ejgdWHujFziowpkR7FMHnfZihPhQCouwEaYo=
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr7349816qka.459.1567523692387;
        Tue, 03 Sep 2019 08:14:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxq5H3cSLUEi5b0CYc80xXax0JKsTI+nmRD1EDsw8jIbyR9AKN6MQpwKv/SCElmJ7UkRZF9y68w2zHDAei3TtY=
X-Received: by 2002:a37:4c4d:: with SMTP id z74mr7349804qka.459.1567523692253;
 Tue, 03 Sep 2019 08:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190902103930.9004-1-s.parschauer@gmx.de>
In-Reply-To: <20190902103930.9004-1-s.parschauer@gmx.de>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 3 Sep 2019 17:14:41 +0200
Message-ID: <CAO-hwJ+PG6jxV7MbBcsAuP0cF_ROLcSbov4+k7wKkJPcu+KLZw@mail.gmail.com>
Subject: Re: [PATCH] HID: Add quirk for HP X500 PIXART OEM mouse
To:     Sebastian Parschauer <s.parschauer@gmx.de>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Sep 2, 2019 at 12:41 PM Sebastian Parschauer
<s.parschauer@gmx.de> wrote:
>
> The PixArt OEM mice are known for disconnecting every minute in
> runlevel 1 or 3 if they are not always polled. So add quirk
> ALWAYS_POLL for this one as well.
>
> Ville Viinikka (viinikv) reported and tested the quirk.
> Reference: https://github.com/sriemer/fix-linux-mouse issue 15
>
> Signed-off-by: Sebastian Parschauer <s.parschauer@gmx.de>
> CC: stable@vger.kernel.org # v4.16+
> ---

thanks!

Applied to for-5.4/core

Cheers,
Benjamin

>  drivers/hid/hid-ids.h    | 1 +
>  drivers/hid/hid-quirks.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 0a00be19f7a0..e4d51ce20a6a 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -568,6 +568,7 @@
>  #define USB_PRODUCT_ID_HP_LOGITECH_OEM_USB_OPTICAL_MOUSE_0B4A  0x0b4a
>  #define USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE         0x134a
>  #define USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_094A    0x094a
> +#define USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_0941    0x0941
>  #define USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_0641    0x0641
>
>  #define USB_VENDOR_ID_HUION            0x256c
> diff --git a/drivers/hid/hid-quirks.c b/drivers/hid/hid-quirks.c
> index 166f41f3173b..c50bcd967d99 100644
> --- a/drivers/hid/hid-quirks.c
> +++ b/drivers/hid/hid-quirks.c
> @@ -92,6 +92,7 @@ static const struct hid_device_id hid_quirks[] = {
>         { HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_LOGITECH_OEM_USB_OPTICAL_MOUSE_0B4A), HID_QUIRK_ALWAYS_POLL },
>         { HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE), HID_QUIRK_ALWAYS_POLL },
>         { HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_094A), HID_QUIRK_ALWAYS_POLL },
> +       { HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_0941), HID_QUIRK_ALWAYS_POLL },
>         { HID_USB_DEVICE(USB_VENDOR_ID_HP, USB_PRODUCT_ID_HP_PIXART_OEM_USB_OPTICAL_MOUSE_0641), HID_QUIRK_ALWAYS_POLL },
>         { HID_USB_DEVICE(USB_VENDOR_ID_IDEACOM, USB_DEVICE_ID_IDEACOM_IDC6680), HID_QUIRK_MULTI_INPUT },
>         { HID_USB_DEVICE(USB_VENDOR_ID_INNOMEDIA, USB_DEVICE_ID_INNEX_GENESIS_ATARI), HID_QUIRK_MULTI_INPUT },
> --
> 2.16.4
>
