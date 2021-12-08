Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9317E46D659
	for <lists+linux-input@lfdr.de>; Wed,  8 Dec 2021 16:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhLHPGs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Dec 2021 10:06:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45881 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229479AbhLHPGr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Dec 2021 10:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638975795;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G0rnmLYR2bGbskKPMuNtMTb9vCsJDvOb8DdKbW9eR5k=;
        b=Yx1XLn10x2oGrsXLT7x9PqjX0eHwr49/std0VRVljzcpyngSA/QhJES+aw7FS2KxHYHxfV
        zqjiuN1iB5hutbXOPU79D1hBfiO/rvP/b4JK+DAS88KqJsH7YDSZzEnkWCDJD63o3DdPua
        L3jIIlGI4EUOdLzYbjI//9Q0U78ycOQ=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-358-GtCY94fgPtyGXuEFO6tVOg-1; Wed, 08 Dec 2021 10:03:14 -0500
X-MC-Unique: GtCY94fgPtyGXuEFO6tVOg-1
Received: by mail-pf1-f199.google.com with SMTP id e7-20020aa798c7000000b004a254db7946so1698798pfm.17
        for <linux-input@vger.kernel.org>; Wed, 08 Dec 2021 07:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0rnmLYR2bGbskKPMuNtMTb9vCsJDvOb8DdKbW9eR5k=;
        b=AwQbeCk3ntZvLfZpd/AQ6yw6YRHFLCAMvTK64AB7dw0HLVztw4u9MmhkSbkt4cYqQJ
         lagHkVh6o25RGs1D6zpRtq7TR3tCoeTdVF2jDhS3tg95Udyoo/yZ2HsKh0fkkJu26Oqi
         zkdmLZOjI3RNktH8mitnvYiEmRhngFFmd6ViU+Mlexqk/YIYQedieOd+pdSrW+4/966D
         Ta+iyK22tByfUKDZwjQ6DldEDCxCI/mK9nDe5zUtncYF+D7Q05ZC3XWxvZ3ODaPCKsYG
         5JVWly2N1MaO5tYCDsaynBNbvtArbworjcHRkWU7PXmpf5YxwWym455BnJWSEX0LegpT
         CuLA==
X-Gm-Message-State: AOAM530TRjvvx2JZ/yCwEaNu0CkeirvAFRNJei1sQbDAfsuS3tUPUqU4
        MmwaGIAuO+YcKUCiiociUE4oUaZQGIJmOHi2Kl/PkeyQ5sWlBDXbEotf/XE6vHY3NUHT75zhW4K
        pIwawMoRQ21LyJhw/IhxTwOFFA3saO50cbWGyJoc=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr8092426pjb.173.1638975793404;
        Wed, 08 Dec 2021 07:03:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywtfz1ltbCX4prsJ8HbqB9JwqPfaHTvYGKf+nVFZN2jXpJAsM7q+H1iNlV/lsatBP8IZ65BiteYAl2G/zyQQo=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr8092399pjb.173.1638975793135;
 Wed, 08 Dec 2021 07:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20211201164301.44653-1-tero.kristo@linux.intel.com> <20211201164301.44653-2-tero.kristo@linux.intel.com>
In-Reply-To: <20211201164301.44653-2-tero.kristo@linux.intel.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 8 Dec 2021 16:03:02 +0100
Message-ID: <CAO-hwJLUA8ErS-s3mA351WH48ebXCYJ-s5xj-oVarqAz43DUkg@mail.gmail.com>
Subject: Re: [RFCv3 1/7] HID: Add map_msc() to avoid boilerplate code
To:     Tero Kristo <tero.kristo@linux.intel.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        lkml <linux-kernel@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Dec 1, 2021 at 5:43 PM Tero Kristo <tero.kristo@linux.intel.com> wrote:
>
> From: Mika Westerberg <mika.westerberg@linux.intel.com>
>
> Since we are going to have more MSC events too, add map_msc() that can
> be used to fill in necessary fields and avoid boilerplate code.
>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

This one looks good to me and I should be able to take it in v5.17.

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Cheers,
Benjamin

> ---
>  drivers/hid/hid-input.c | 6 ++----
>  include/linux/hid.h     | 4 ++++
>  2 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> index 2c72ce4147b1..39ebedb2323b 100644
> --- a/drivers/hid/hid-input.c
> +++ b/drivers/hid/hid-input.c
> @@ -52,6 +52,7 @@ static const struct {
>  #define map_rel(c)     hid_map_usage(hidinput, usage, &bit, &max, EV_REL, (c))
>  #define map_key(c)     hid_map_usage(hidinput, usage, &bit, &max, EV_KEY, (c))
>  #define map_led(c)     hid_map_usage(hidinput, usage, &bit, &max, EV_LED, (c))
> +#define map_msc(c)     hid_map_usage(hidinput, usage, &bit, &max, EV_MSC, (c))
>
>  #define map_abs_clear(c)       hid_map_usage_clear(hidinput, usage, &bit, \
>                 &max, EV_ABS, (c))
> @@ -872,10 +873,7 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
>
>                 case 0x5b: /* TransducerSerialNumber */
>                 case 0x6e: /* TransducerSerialNumber2 */
> -                       usage->type = EV_MSC;
> -                       usage->code = MSC_SERIAL;
> -                       bit = input->mscbit;
> -                       max = MSC_MAX;
> +                       map_msc(MSC_SERIAL);
>                         break;
>
>                 default:  goto unknown;
> diff --git a/include/linux/hid.h b/include/linux/hid.h
> index e95800bab56a..96eaca0d5322 100644
> --- a/include/linux/hid.h
> +++ b/include/linux/hid.h
> @@ -766,6 +766,10 @@ static inline void hid_map_usage(struct hid_input *hidinput,
>                 bmap = input->ledbit;
>                 limit = LED_MAX;
>                 break;
> +       case EV_MSC:
> +               bmap = input->mscbit;
> +               limit = MSC_MAX;
> +               break;
>         }
>
>         if (unlikely(c > limit || !bmap)) {
> --
> 2.25.1
>

