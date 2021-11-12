Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C56244E9D6
	for <lists+linux-input@lfdr.de>; Fri, 12 Nov 2021 16:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhKLPVC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Nov 2021 10:21:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33782 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229952AbhKLPVC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Nov 2021 10:21:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636730291;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tUBGxL2ntgz3Bi9YL3FvigZ4RqsfcGLSBgbmNESveQI=;
        b=XmIz9j+BykThL6fpID3sRiAC9zMUMXaqfodxW6Riho3B2dqDJ0C7LLE367lzvLHRnideFm
        lKDIaw+HNJ8IM+RpbKdC+QsvhiWV1arwhu5rYM3/GVyvqbwwRJAKmUHoo4YXQYydBxWEzm
        MkDUXlb6BqmzRdpMODN8gWkqlMjTC0A=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-daeV4USlNDiRSjW-XDbWpQ-1; Fri, 12 Nov 2021 10:18:10 -0500
X-MC-Unique: daeV4USlNDiRSjW-XDbWpQ-1
Received: by mail-pj1-f71.google.com with SMTP id bf17-20020a17090b0b1100b001a634dbd737so4862582pjb.9
        for <linux-input@vger.kernel.org>; Fri, 12 Nov 2021 07:18:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tUBGxL2ntgz3Bi9YL3FvigZ4RqsfcGLSBgbmNESveQI=;
        b=qRY3F5cEHuN79J/4/NHHHJ0iBlwiy31hlQ7vi9B9hb20k2B4U+aytwJaethDWqtVwn
         kqhW/f8zWiLm1gSjywZhNqPjxoWtdfgxrQIlEt9dr9NiXuqgg+k8EID74cGUtA6/cxpQ
         3ZxlMaR4My+kVLXmHi1hUiZdIFWysVlokGwYVBJ42aMDNjvxrM6J6OlpmX1+wepd67Zy
         4dQlmVPpAHpG4Wo+0OkxeogLlvtcvx8H50ax6Q4hXfqZHLDXQ3rjSDC1J/0OyjOYy+KE
         LzDN88Erx2Zr/Z6edrCMVMejiNcuT32Tk4Du3gg0dkxMYU9QuMVkLEz+Xe0yZWjaT6AT
         +XDQ==
X-Gm-Message-State: AOAM5320pWhulGuQjgvbdok/P22YDSOW3LRvLvkEWbZo89EFdKnSd4gE
        dko0W++EuJRpC0Uy/jM/3gUqKoZT6fECGBW8TG8vUCymbi7fJmyrIByCb47iDagjhVuWIlIbBPo
        oFqmT+e5v29aUuM7vKXkKXquaxUyLsqKImo4PEU8=
X-Received: by 2002:a62:31c5:0:b0:447:cd37:61f8 with SMTP id x188-20020a6231c5000000b00447cd3761f8mr14681843pfx.29.1636730288940;
        Fri, 12 Nov 2021 07:18:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyCAiNzO2woi/eM6j4IIQta5+aHwTXJbQqSbT6LVrv558XyG6U2O7/4ufetx0K95N4OCSRhu2GQsyCM/JYnxOA=
X-Received: by 2002:a62:31c5:0:b0:447:cd37:61f8 with SMTP id
 x188-20020a6231c5000000b00447cd3761f8mr14681806pfx.29.1636730288624; Fri, 12
 Nov 2021 07:18:08 -0800 (PST)
MIME-Version: 1.0
References: <20211112135511.29573-1-linux@zary.sk>
In-Reply-To: <20211112135511.29573-1-linux@zary.sk>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 12 Nov 2021 16:17:57 +0100
Message-ID: <CAO-hwJLZ8roXUxnB5Umyjd_22KFGbFMouxdVM0GLSSLrktteAg@mail.gmail.com>
Subject: Re: [PATCH] hid-multitouch: Fix Iiyama ProLite T1931SAW (0eef:0001 again!)
To:     Ondrej Zary <linux@zary.sk>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ondrej,

On Fri, Nov 12, 2021 at 3:00 PM Ondrej Zary <linux@zary.sk> wrote:
>
> Iiyama ProLite T1931SAW does not work with Linux - input devices are
> created but cursor does not move.
>
> It has the infamous 0eef:0001 ID which has been reused for various
> devices before.
>
> It seems to require export_all_inputs = true.
> Add it to mt_devices[] as MT_CLS_WIN_8 to fix the problem.
> Hopefully there are no HID devices using this ID that will break.
> It should not break non-HID devices (handled by usbtouchscreen).

Hmm, this is worrisome. I am pretty sure there were some eGalax 0001
devices that were Win 7 compatible and I am not sure if they are
compatible with Win8...

I guess that if you have to set MT_CLS_WIN_8, the device is not
detected as such. so how about you use:
MT_CLS_EXPORT_ALL_INPUTS instead, (to keep MT_CLS_DEFAULT for those
devices), and restrict the VID/PID matching to the non Win8 devices:

HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_DWAV,
USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER)

?

Cheers,
Benjamin

>
> Signed-off-by: Ondrej Zary <linux@zary.sk>
> ---
>  drivers/hid/hid-multitouch.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index e1afddb7b33d..099daf590392 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1888,6 +1888,11 @@ static const struct hid_device_id mt_devices[] = {
>                 MT_USB_DEVICE(USB_VENDOR_ID_CVTOUCH,
>                         USB_DEVICE_ID_CVTOUCH_SCREEN) },
>
> +       /* eGalax devices (SAW) */
> +       { .driver_data = MT_CLS_WIN_8,
> +               MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> +                       USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER) },
> +
>         /* eGalax devices (resistive) */
>         { .driver_data = MT_CLS_EGALAX,
>                 MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> --
> Ondrej Zary
>

