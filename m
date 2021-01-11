Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178602F1089
	for <lists+linux-input@lfdr.de>; Mon, 11 Jan 2021 11:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729075AbhAKKwN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 Jan 2021 05:52:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27422 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729303AbhAKKwM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 Jan 2021 05:52:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610362246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J7KvwErG/ipBlvgk4YlLV7/e1q6ESz3tReSXVFIrqbM=;
        b=YW0eYs/G7TDB4pKBwl+XGXg2xAjUQl7Kqsxw3k3Q/DRWMMs35CIW3VEcvZHnaXyh1/tgKm
        O1+E3uFDIxCj3v+UX120dgFM00g59OBcXZ82IGfciptIozPpFVI3auf6Eut7ZSOvWGuNZp
        f9vUhvh8fvBfznm/ZqsGFFnB2qANwJg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-_9NLCFyRPNujjAuxc5RKRg-1; Mon, 11 Jan 2021 05:50:45 -0500
X-MC-Unique: _9NLCFyRPNujjAuxc5RKRg-1
Received: by mail-ed1-f72.google.com with SMTP id l33so8119402ede.1
        for <linux-input@vger.kernel.org>; Mon, 11 Jan 2021 02:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=J7KvwErG/ipBlvgk4YlLV7/e1q6ESz3tReSXVFIrqbM=;
        b=KP3ifvP8qZw41Hc6+i6tIcItkOHAwrGYL38nzQSzBPaL3TKR7C2SZgsK3wGqZ0fTRJ
         rKKqM8TyGOOvFT1x72QWz24idkuU8WW7yGDDYBMFnbMh+ffDMi/qAruMgOAFvm2aNnGN
         9bd8WEbRQVZJtHxCsinW7MjZkR88WRKXLPE8fxmzJATXL69guQIC6BJZvP3MF8LoobgA
         TrBnYwUIyplUJpcs6+qlKA2nNftIaji1LGQxkyRuHBp4WRND7jmqj/74e2SEontNMAo0
         90JuncWMYiZqJl0m9Y1EtdF4g6sZVAy+Qxo0RGZ6VgExYUJ2QEmQFZBK5fDJI3EY9dj5
         S0YQ==
X-Gm-Message-State: AOAM530zCp3RPqVe9DBYlK4n2qVppwStMleilouqb4dtc3c7wnThhfTR
        A0Xtb8lgSHBdfEkEx1bVblzEdSgCeFq5ww6h2uIT9VnPQp/qVmpQ5fHvhAgiOoWyiGV9oKVopnB
        NS5FpMV4Sg0fOTWieAAJu1EI/PUnQAg2wm2rnJEcSp3JZU9GrLffKi5LvBwlmKe8nvn6TGqJbvJ
        c=
X-Received: by 2002:a17:906:3c04:: with SMTP id h4mr10115237ejg.220.1610362243595;
        Mon, 11 Jan 2021 02:50:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzcgaEYAo6hNrP82ZnLubDwxq2Ut2taZAeHypvbwepdvWEodpi4DdDgCL/E/1mVA8FoxE9XRA==
X-Received: by 2002:a17:906:3c04:: with SMTP id h4mr10115221ejg.220.1610362243447;
        Mon, 11 Jan 2021 02:50:43 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id p16sm4426272edw.44.2021.01.11.02.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jan 2021 02:50:42 -0800 (PST)
Subject: Re: [PATCH] HID: logitech-hidpp: Add product ID for MX Ergo in
 Bluetooth mode
To:     Nicholas Miell <nmiell@gmail.com>, jikos@kernel.org
Cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
References: <6b58bc1e-7ab8-0d5b-be9e-a8c29df2c252@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7492819a-3216-b554-4544-deb14c236c8c@redhat.com>
Date:   Mon, 11 Jan 2021 11:50:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6b58bc1e-7ab8-0d5b-be9e-a8c29df2c252@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

On 1/11/21 7:09 AM, Nicholas Miell wrote:
> The Logitech MX Ergo trackball supports HID++ 4.5 over Bluetooth. Add its
> product ID to the table so we can get battery monitoring support.
> (The hid-logitech-hidpp driver already recognizes it when connected via
> a Unifying Receiver.)
> 
> Signed-off-by: Nicholas Miell <nmiell@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/hid/hid-logitech-hidpp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> index f85781464807d..7eb9a6ddb46a6 100644
> --- a/drivers/hid/hid-logitech-hidpp.c
> +++ b/drivers/hid/hid-logitech-hidpp.c
> @@ -4053,6 +4053,8 @@ static const struct hid_device_id hidpp_devices[] = {
>         { /* MX Master mouse over Bluetooth */
>           HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
>           .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> +       { /* MX Ergo trackball over Bluetooth */
> +         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01d) },
>         { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
>           .driver_data = HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
>         { /* MX Master 3 mouse over Bluetooth */
> 

