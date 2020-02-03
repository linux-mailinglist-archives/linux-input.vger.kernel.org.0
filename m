Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5AEE4150983
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 16:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgBCPO6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 10:14:58 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23100 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728993AbgBCPO6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Feb 2020 10:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580742897;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vvAOIdqyqx/SfTUYH6RESTQuqbob7Z1UEonfiEAsQcc=;
        b=c9Dchd5zUTuKQCgs8KCZqCszxxVWFFAjdz+3JBy2ErcFkcxJNejLwgxXdxi96A5uS/2ntf
        Yt987g2/8ZmrRVI5b1m3F2ImtaxI/nM+DsKeEQMGMpx+4C0nNOUk0Hsdxk1XitRaVNS4fm
        TthNDAj/byxsjgrB3V0ITWAnfUINDTE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-5xBaKy8mOrWTSe49VCht3g-1; Mon, 03 Feb 2020 10:14:49 -0500
X-MC-Unique: 5xBaKy8mOrWTSe49VCht3g-1
Received: by mail-qv1-f71.google.com with SMTP id l1so9625607qvu.13
        for <linux-input@vger.kernel.org>; Mon, 03 Feb 2020 07:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vvAOIdqyqx/SfTUYH6RESTQuqbob7Z1UEonfiEAsQcc=;
        b=U7K2AmSFeg4ezfBaLO7ZcmDPk+AFVSV7P9xMmfurSJvlaxsiXf8Y1DybVJqoYSRyQs
         lgnNzTfH5bpn8Avsr20aOPI8+8JM8YcD6smDzjMoeu9BeZ1sSQ66C2vzmAD/jTg9PgTL
         Zif4n6VjFaSIzroY7o42Nq/5avhSXhi9PWrRNxzuzB2yjS+JTyrwceoi10tgb/6I5ezl
         MZk24Fzh7Y6+zZ0wkgYKLYfhsH+2KDdUXNoz4B7GrtSuz8XLnj3GY85rYVZvJsAWferf
         9kByGcrGJEMNgGpWMBm3ScTLatTw/63sDk1ytqfUU+cQclsRqGLNREWZkLPrWOfD4FfX
         0cNQ==
X-Gm-Message-State: APjAAAVEGQojI3G5zDRCUIPg2J0nUrRK5xp1GhmoNDOdBt5RUGt7Q4lB
        xLxhV9qhR1ZTWmRMuLIn/b7il5fXppuoEX5qEsRBzuocDWfypzxTWXk3Isy/1JaEbM8ssK3R72Q
        JnVStCJs8ubgJqenvZGEtb85lR3zXoj2UsBVW/lo=
X-Received: by 2002:ac8:365c:: with SMTP id n28mr23784700qtb.260.1580742889450;
        Mon, 03 Feb 2020 07:14:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqyFOn/ctSE/lHLxNoXgBZwk1V8z2vglXr15EI8xoDgCeHfh09Hldee8sBgneJREA21yRxhWmIca+dHatL2VFYQ=
X-Received: by 2002:ac8:365c:: with SMTP id n28mr23784668qtb.260.1580742889152;
 Mon, 03 Feb 2020 07:14:49 -0800 (PST)
MIME-Version: 1.0
References: <20200201115648.3934-1-hdegoede@redhat.com>
In-Reply-To: <20200201115648.3934-1-hdegoede@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 3 Feb 2020 16:14:37 +0100
Message-ID: <CAO-hwJK0BjKQMeUT11MxR4TaDN4sdMvN-4YtVBk+V_-JBOrEuw@mail.gmail.com>
Subject: Re: [PATCH v2] HID: ite: Only bind to keyboard USB interface on Acer
 SW5-012 keyboard dock
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        "3.8+" <stable@vger.kernel.org>,
        =?UTF-8?Q?Zden=C4=9Bk_Rampas?= <zdenda.rampas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Feb 1, 2020 at 12:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Commit 8f18eca9ebc5 ("HID: ite: Add USB id match for Acer SW5-012 keyboar=
d
> dock") added the USB id for the Acer SW5-012's keyboard dock to the
> hid-ite driver to fix the rfkill driver not working.
>
> Most keyboard docks with an ITE 8595 keyboard/touchpad controller have th=
e
> "Wireless Radio Control" bits which need the special hid-ite driver on th=
e
> second USB interface (the mouse interface) and their touchpad only suppor=
ts
> mouse emulation, so using generic hid-input handling for anything but
> the "Wireless Radio Control" bits is fine. On these devices we simply bin=
d
> to all USB interfaces.
>
> But unlike other ITE8595 using keyboard docks, the Acer Aspire Switch 10
> (SW5-012)'s touchpad not only does mouse emulation it also supports
> HID-multitouch and all the keys including the "Wireless Radio Control"
> bits have been moved to the first USB interface (the keyboard intf).
>
> So we need hid-ite to handle the first (keyboard) USB interface and have
> it NOT bind to the second (mouse) USB interface so that that can be
> handled by hid-multitouch.c and we get proper multi-touch support.
>
> This commit changes the hid_device_id for the SW5-012 keyboard dock to
> only match on hid devices from the HID_GROUP_GENERIC group, this way
> hid-ite will not bind the the mouse/multi-touch interface which has
> HID_GROUP_MULTITOUCH_WIN_8 as group.
> This fixes the regression to mouse-emulation mode introduced by adding
> the keyboard dock USB id.
>
> Cc: stable@vger.kernel.org
> Fixes: 8f18eca9ebc5 ("HID: ite: Add USB id match for Acer SW5-012 keyboar=
d dock")
> Reported-by: Zden=C4=9Bk Rampas <zdenda.rampas@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Extend hid_device_id to also match on the HID_GROUP_GENERIC group,
>   instead of adding a match callback which peeks at the USB descriptors

Thanks for the quick revision.

Applied to for-5.6/upstream-fixes

And for the record, 2 MR have been added to hid-tools for regression testin=
g:
- https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/70
(keyboard and wifi key)
- https://gitlab.freedesktop.org/libevdev/hid-tools/merge_requests/69
(touchpad, which currently fails on Linux master unless this patch
gets in)

Cheers,
Benjamin

> ---
>  drivers/hid/hid-ite.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
> index c436e12feb23..6c55682c5974 100644
> --- a/drivers/hid/hid-ite.c
> +++ b/drivers/hid/hid-ite.c
> @@ -41,8 +41,9 @@ static const struct hid_device_id ite_devices[] =3D {
>         { HID_USB_DEVICE(USB_VENDOR_ID_ITE, USB_DEVICE_ID_ITE8595) },
>         { HID_USB_DEVICE(USB_VENDOR_ID_258A, USB_DEVICE_ID_258A_6A88) },
>         /* ITE8595 USB kbd ctlr, with Synaptics touchpad connected to it.=
 */
> -       { HID_USB_DEVICE(USB_VENDOR_ID_SYNAPTICS,
> -                        USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
> +       { HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
> +                    USB_VENDOR_ID_SYNAPTICS,
> +                    USB_DEVICE_ID_SYNAPTICS_ACER_SWITCH5_012) },
>         { }
>  };
>  MODULE_DEVICE_TABLE(hid, ite_devices);
> --
> 2.23.0
>

