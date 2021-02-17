Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B83C531DFF2
	for <lists+linux-input@lfdr.de>; Wed, 17 Feb 2021 21:06:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233564AbhBQUGS (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Feb 2021 15:06:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28578 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232844AbhBQUGS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Feb 2021 15:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613592291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=vHoTmntEev68EJcmebE3piRT4pPjx5R2AdcGSR/9YdY=;
        b=MjrfHT/r/hcvQNqzPTlfgo1P9CBUWO/WZDNcueY7/2pNpUD4q+oVvbkBJz/kkKa3R6EDb2
        U8uwzMOwLjDQNEK0JE1qrXREomS490Wx5AAUZk6n6rsD2xxn4l0jRfNYDRR0FRTzqdmADK
        vMNrweLPc3VBO1AwJHT3ZRzxBvWeC08=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-ViRX3ZF3MnOIefP-DVAP-w-1; Wed, 17 Feb 2021 15:04:50 -0500
X-MC-Unique: ViRX3ZF3MnOIefP-DVAP-w-1
Received: by mail-pg1-f198.google.com with SMTP id f6so1188265pgh.3
        for <linux-input@vger.kernel.org>; Wed, 17 Feb 2021 12:04:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vHoTmntEev68EJcmebE3piRT4pPjx5R2AdcGSR/9YdY=;
        b=gSIEKk3gf31AppE2bmxg0EZ00uqpINKiU6c/edBkv1SneYe7DiylmOOt1RgbxTDZW0
         RnvtT4rVCUmDr3ZK07MQJyMMMls7DQlNsws4W4myFShQjJvcqWGRpEDPOGk3rtH7oEqR
         Gn7pyXTIGkbcojZ7aby02IOwzF7L+dB2GHq9fAXwSEfeGUCc+mnAc3j+2Go6ixFf0/jE
         r/6sYMYS/5yobYvFXQxzAJ5jbnHDV4p2Atog/dlyvcADSJXX65cgKHDKkv5nOsKqJ8oS
         fpryz48YSJK1M1Lk6cmPTuhKlPd1U6XvkU4hyUA5XSux9oB8/WnBDm0FPThT0cFRi+Fo
         7geg==
X-Gm-Message-State: AOAM531G+u461N1L8wh351AebACVCQJwVDgwNWYxP+N6/3eW+ErUK/mj
        Khwr2uu6EpCFlhn/aCsQjDw1c6woZdxX2eHqPRbS3q/JG3Jge2Qi3MYOLICrXV0FSBIGp3kq7NW
        5DzfcRC+kG+axw68gaCcTGjpy74k33p8QH8qhiX4=
X-Received: by 2002:a17:902:d4d0:b029:e3:480a:cae3 with SMTP id o16-20020a170902d4d0b02900e3480acae3mr659679plg.41.1613592289315;
        Wed, 17 Feb 2021 12:04:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHK4y3zAv0/eqFBkTaoINYheQA70AODu58g83uoMfRBuIwAAnwdz1Gnbi35DShRThTbkZayF790UdUG4DSrlY=
X-Received: by 2002:a17:902:d4d0:b029:e3:480a:cae3 with SMTP id
 o16-20020a170902d4d0b02900e3480acae3mr659658plg.41.1613592289030; Wed, 17 Feb
 2021 12:04:49 -0800 (PST)
MIME-Version: 1.0
References: <20210215163921.84283-1-colin.king@canonical.com>
In-Reply-To: <20210215163921.84283-1-colin.king@canonical.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 17 Feb 2021 21:04:38 +0100
Message-ID: <CAO-hwJ+P=jH3ByHdab=qmrOWupnq-fiA0UR8mdHF1pQAuEqbAw@mail.gmail.com>
Subject: Re: [PATCH][next] HID: playstation: fix array size comparison (off-by-one)
To:     Colin King <colin.king@canonical.com>
Cc:     Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 15, 2021 at 5:39 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The comparison of value with the array size ps_gamepad_hat_mapping
> appears to be off-by-one. Fix this by using >= rather than > for the
> size comparison.
>
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: bc2e15a9a022 ("HID: playstation: initial DualSense USB support.")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Good catch.

Applied to for-5.12/playstation-v2

Cheers,
Benjamin

>  drivers/hid/hid-playstation.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index 408b651174cf..568a3a067c88 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -1064,7 +1064,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>         input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
>
>         value = ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> -       if (value > ARRAY_SIZE(ps_gamepad_hat_mapping))
> +       if (value >= ARRAY_SIZE(ps_gamepad_hat_mapping))
>                 value = 8; /* center */
>         input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value].x);
>         input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value].y);
> --
> 2.30.0
>

