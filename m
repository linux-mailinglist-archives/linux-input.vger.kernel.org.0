Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6BE45384C
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 18:08:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237703AbhKPRKT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 12:10:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53959 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232680AbhKPRKS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 12:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637082441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H3riuHE7sVj3zMfG7eEcQnR+YQaScrJuhgpIheDS+2g=;
        b=iEIz6ecM3W8z53EMOUn+yNWCSfKQyQogiHMqkKFu1c7cpMb+WpbhvT8sSivT7buUJEmT9n
        F1aYlDtMstMrlZxrzort6zPMY5Yg8xFwCIHgNapSF5Ci32IlugGi56XmZ/5iilJ1+Ydca/
        VGuBl+Ay133WgSBuIjH0zaQKfudcKAA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-a_vRi6zLOuupY3aIVRCQhw-1; Tue, 16 Nov 2021 12:07:19 -0500
X-MC-Unique: a_vRi6zLOuupY3aIVRCQhw-1
Received: by mail-pg1-f199.google.com with SMTP id p20-20020a63fe14000000b002cc2a31eaf6so10969046pgh.6
        for <linux-input@vger.kernel.org>; Tue, 16 Nov 2021 09:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H3riuHE7sVj3zMfG7eEcQnR+YQaScrJuhgpIheDS+2g=;
        b=ur2R3g5A+CkQ/364xzHjlc5g3t2mWEuzmpTYw9SUNVnFCQ1pNiiIYJk2XtojmWJ5bD
         fuOGQfeQpzaI4PZKZJrS9Q4LVLgHfLYDvaUgoLfAGmtIf4SajMRhSei9XlWFN5YHT6XU
         6h6aGogpuq57fiioxBobz0+pNv56eqg2R8Y8zK2kJxEkf/GO3+EwFq7CyMLfm4nuZJdm
         wsVKUEfp1EtmgiGoc3TF43+rdeLw+Dphtth2w3oAP5w74OLpFAmQC6mCAETuk1Zw2CHc
         LNummMNukNN7kA8HbBmgnImb+pJTH8ebzFzrNk0t3v8NaGRf/nq4pRE3klGyfP4AgQcR
         wo4g==
X-Gm-Message-State: AOAM533DYqpsiPXpIJGBzdTxUU0sPGROw7+8dl/z3WgtNIpaUeB8l0UE
        MMBaohzfGZy8Euyk1gazFmo3sSv0/OHwExungW1sZYbcGMP4SRPcwf6BWYAxbi4O0dX6fHrIb0a
        6UfgGq9lWPGCFyLxRyklb2FRIB5xhUNIcvh40MX0=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr750393pjb.173.1637082438487;
        Tue, 16 Nov 2021 09:07:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwk89cfC9XFH1oRKbd8sYP0mMZgGUyP5mUE39CW2RS/+u1DuJlvqPYj1cMvfgsA79PmpRBextz60FKxVI/4wPc=
X-Received: by 2002:a17:90b:224f:: with SMTP id hk15mr750331pjb.173.1637082438062;
 Tue, 16 Nov 2021 09:07:18 -0800 (PST)
MIME-Version: 1.0
References: <CAO-hwJ+huX5wFQjwzZ+o9zOonCuifiyQ2rZosTWW7or09_SfiA@mail.gmail.com>
 <20211116131502.24603-1-linux@zary.sk>
In-Reply-To: <20211116131502.24603-1-linux@zary.sk>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 16 Nov 2021 18:07:07 +0100
Message-ID: <CAO-hwJ+n2-WO7O9zM9UABMhzCqANC=BHCyw5hObm7-B0vMqCSg@mail.gmail.com>
Subject: Re: [PATCH v2] hid-multitouch: Fix Iiyama ProLite T1931SAW (0eef:0001 again!)
To:     Ondrej Zary <linux@zary.sk>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Nov 16, 2021 at 2:15 PM Ondrej Zary <linux@zary.sk> wrote:
>
> Iiyama ProLite T1931SAW does not work with Linux - input devices are
> created but cursor does not move.
>
> It has the infamous 0eef:0001 ID which has been reused for various
> devices before.
>
> It seems to require export_all_inputs = true.
>
> Hopefully there are no HID devices using this ID that will break.
> It should not break non-HID devices (handled by usbtouchscreen).
>
> Signed-off-by: Ondrej Zary <linux@zary.sk>

Reviewed-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Thanks!

Cheers,
Benjamin

> ---
>  drivers/hid/hid-multitouch.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 3ea7cb1cda84..ac114b76057b 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -1880,6 +1880,11 @@ static const struct hid_device_id mt_devices[] = {
>                 MT_USB_DEVICE(USB_VENDOR_ID_CVTOUCH,
>                         USB_DEVICE_ID_CVTOUCH_SCREEN) },
>
> +       /* eGalax devices (SAW) */
> +       { .driver_data = MT_CLS_EXPORT_ALL_INPUTS,
> +               MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> +                       USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER) },
> +
>         /* eGalax devices (resistive) */
>         { .driver_data = MT_CLS_EGALAX,
>                 MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> --
> Ondrej Zary
>

