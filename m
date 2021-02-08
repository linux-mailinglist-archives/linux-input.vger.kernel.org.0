Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B099312B77
	for <lists+linux-input@lfdr.de>; Mon,  8 Feb 2021 09:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhBHIIm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Feb 2021 03:08:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20899 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229503AbhBHIIh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Feb 2021 03:08:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612771622;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Lpxpa2kYKZq2T7KOylkeH5GurcJpKBZ4r2O2D2ivH5w=;
        b=hYs4dQlaFIlQMOkTHz5e80qAOFZcpIJUdws49X084jY+aRJUu1RQX/5Cgpw3t1a+tY/Zoi
        dZ+KHHoIMTWRlxwfGzFDgzSFVWcAh8qSOdq4kuo7Nt3O4NuS09Vfp0Wn+cvOp2MNZwsdtn
        Gd/SwTefaileItBLoGPoocZftB8mwaU=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-e8vnnVoYM0yGpEW77MHr8g-1; Mon, 08 Feb 2021 03:07:00 -0500
X-MC-Unique: e8vnnVoYM0yGpEW77MHr8g-1
Received: by mail-pj1-f69.google.com with SMTP id e11so7473658pjj.8
        for <linux-input@vger.kernel.org>; Mon, 08 Feb 2021 00:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Lpxpa2kYKZq2T7KOylkeH5GurcJpKBZ4r2O2D2ivH5w=;
        b=XzHpzPrWPXIRZdHnxr/U2VgXQRejlL87sSWUfjb08H2aRawht1k/VimtF01qz5oOpl
         r7NRr45WqWbwlkLUjdiERz6lLy3UaNPWkTIffevveBB7cq72rOF0VBrI3iEZQa9UjCo2
         zKTXavWMSZ2dSNw90iTi3wNjt1BGXD1qVzoYXOhCeur/9fTIGItMTNZrszSIzA7vXmpb
         52egHs9PaVvIt2EE+2ErFditDgInNmQE80ALWii0p/tSciSRWRGnhSPMM3EEJyDLotD7
         06foHt0f6oYMqTdH04Vdge9ZbdeZIQC9hQsILUpwPYcqc0oM8/Cznol3slru2M4+v827
         4gVQ==
X-Gm-Message-State: AOAM533u/kcWVLMIghxDZaPgXap5wKU1vWC6rL/rlxdr/7buNgdcdTpj
        E3EIYbCpgT/C3sPlsiBIABilzvCW90K88A/EABvGZJVD8fATObLNPvzUgFRP6a7VFsm0GOrkRFY
        LaSkc4gG8eEBsGDlFfbEUkf5MbIdbbYytJ73paJ4=
X-Received: by 2002:a62:e205:0:b029:1dd:b063:8872 with SMTP id a5-20020a62e2050000b02901ddb0638872mr3382151pfi.44.1612771619443;
        Mon, 08 Feb 2021 00:06:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzAQDqeIL3uKwvgCr3sK0XFgd6KHtFGxwetDAWekwnkU31fTiEIkvaVcBGNAf2zljmwF8QuxcO0flw8wFkbWFg=
X-Received: by 2002:a62:e205:0:b029:1dd:b063:8872 with SMTP id
 a5-20020a62e2050000b02901ddb0638872mr3382143pfi.44.1612771619207; Mon, 08 Feb
 2021 00:06:59 -0800 (PST)
MIME-Version: 1.0
References: <20210208075205.3784059-1-nickel@altlinux.org>
In-Reply-To: <20210208075205.3784059-1-nickel@altlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 8 Feb 2021 09:06:48 +0100
Message-ID: <CAO-hwJJpUj=+mpqQ7eMtbtwX6CPAkt2ZpDnpmX9GUDo1EuEOiw@mail.gmail.com>
Subject: Re: [PATCH] Input: elantech - add LEN2146 to SMBus blacklist for
 ThinkPad L13 Gen2
To:     Nikolai Kostrigin <nickel@altlinux.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nikolai,

On Mon, Feb 8, 2021 at 9:01 AM Nikolai Kostrigin <nickel@altlinux.org> wrote:
>
> ThinkPad L13 Gen2 has both touchpad and trackpoint.
> PNP: LEN2146 PNP0f13
> With the default protocol (elantech-smbus) trackpoint is not operating,
> while touchpad does. Changing to elantech renders both operational.
>
> Signed-off-by: Nikolai Kostrigin <nickel@altlinux.org>

Instead of downgrading the capabilities of the touchpad, couldn't we
fix the trackpoint issues?

I am surprised elantech doesn't work with the trackpoint, because I am
pretty sure I wrote patches in that regard. Which kernel version have
you been testing?

Cheers,
Benjamin

> ---
>  drivers/input/mouse/elantech.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/input/mouse/elantech.c b/drivers/input/mouse/elantech.c
> index 90f8765f9efc..c4c3fa5828d8 100644
> --- a/drivers/input/mouse/elantech.c
> +++ b/drivers/input/mouse/elantech.c
> @@ -1776,6 +1776,7 @@ static const char * const i2c_blacklist_pnp_ids[] = {
>          * These are known to not be working properly as bits are missing
>          * in elan_i2c.
>          */
> +       "LEN2146", /* ThinkPad L13 Gen2 */
>         NULL
>  };
>
> --
> 2.29.2
>

