Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32E16D3BB0
	for <lists+linux-input@lfdr.de>; Fri, 11 Oct 2019 10:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfJKIyb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 11 Oct 2019 04:54:31 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21261 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726397AbfJKIya (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 11 Oct 2019 04:54:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570784069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eqByrLt5Vdti/Qv9DsLf8UE4W1FmXeVxkyclk9rGeTo=;
        b=FqfFZvkz0SysptVUBPaDErXK9ZDsvnqYvpv062RJ3uh1JTfMIujIrjnf151PTPSEnE2mWq
        BgxnatwtGi6xSchuyCzqFtUKYJXQcIYtdOtTfTDi286Pholqfld+s+DOBJsvuApDbMo/8d
        pzdvd55I97IRgvucBl/b/F4fzZAECNE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-fbC-mXryMLWskmgO-ORL2Q-1; Fri, 11 Oct 2019 04:54:28 -0400
Received: by mail-qt1-f197.google.com with SMTP id z21so8647629qtq.21
        for <linux-input@vger.kernel.org>; Fri, 11 Oct 2019 01:54:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eqByrLt5Vdti/Qv9DsLf8UE4W1FmXeVxkyclk9rGeTo=;
        b=P56B/uLrj5TFjIwUF5uzKjoSnlF9pmkYbcqlTqZz3iXloYpcXJuTIXlZXmeCBqa7QD
         jpYGuIrSAGwbZJxdPZnWqbgBgK9jWLxrCWd85soBNhwWaMTFHfQdSek+zrGO7E+LlLCy
         lJJ96L8I3R9qCnHF089hS/uDr80pmaERjkqZOfgq5b7HZPhNdAFw7TZdAmlVwO/1lyFx
         R7f7ivuo9KxAGcNpe4UdQUCUkUUuyud9krSCuJ7DuIu4Ve1dp7xd/PDT7oCtn6GlWQkW
         Jjp3uRbFDOU8ZtS+z70m1QFX/ERL/dOwQTeR8CIKaBgpe+SB9z7+P2hemdAZTbuKAj38
         IK8w==
X-Gm-Message-State: APjAAAV6hUrQb2DhgRc0vJHnv3zu9l01q5z4ho6BHJmKKhc710e8Q2YS
        w2KS6li07GWUoGoEfYoMCFyBsuSL9lLicwOidDofud8rZb8ao1XJvyQuRNYsSyF8TKO1LTvdhpr
        g4nG/vnEVXFbpNOW2AIvum5zFmp+/W9WMx6sB/U0=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr15568223qtm.294.1570784067989;
        Fri, 11 Oct 2019 01:54:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz/V9+A0WSqZaDO7OFXISc9+GZq/Vzaj7Pjxou3mKbEZVfAG4wXOTvSoN+Hl6CCsx6TQjBqFMcXfero/+VIBpA=
X-Received: by 2002:ac8:1e83:: with SMTP id c3mr15568215qtm.294.1570784067809;
 Fri, 11 Oct 2019 01:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <uBbIS3nFJ1jdYNLHcqjW5wxQAwmZv0kmYEoeoPrxNhfzi6cHwmCOY-ewdqe7S1hNEj-p4Hd9D0_Y3PymUTdh_6WFXuMmIYUkV2xaKCPMYz0=@protonmail.com>
 <403b3e7f6d276e47c447e6ea56a3370b03c3298c.camel@archlinux.org>
In-Reply-To: <403b3e7f6d276e47c447e6ea56a3370b03c3298c.camel@archlinux.org>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 11 Oct 2019 10:54:16 +0200
Message-ID: <CAO-hwJK+V=CE8_NjqRszPA6dbGq1yNJAtOAm2qmqVjgK_XzEHw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] HID: logitech: Add MX Mice over Bluetooth
To:     =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@archlinux.org>
Cc:     Mazin Rezk <mnrzk@protonmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "jikos@kernel.org" <jikos@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-MC-Unique: fbC-mXryMLWskmgO-ORL2Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 11, 2019 at 10:49 AM Filipe La=C3=ADns <lains@archlinux.org> wr=
ote:
>
> On Fri, 2019-10-11 at 00:57 +0000, Mazin Rezk wrote:
> > On Saturday, October 5, 2019 9:04 PM, Mazin Rezk <
> > mnrzk@protonmail.com> wrote:
> >
> > > This patch adds support for several MX mice over Bluetooth. The
> > > device IDs
> > > have been copied from the libratbag device database and their
> > > features
> > > have been based on their DJ device counterparts.
> >
> > No changes have been made to this patch in v4. However, it should be
> > noted
> > that the only device that has been thoroughly tested in this patch is
> > the
> > MX Master (b01e). Further testing for the other devices may be
> > required.
> >
> > Signed-off-by: Mazin Rezk <mnrzk@protonmail.com>
> > ---
> >  drivers/hid/hid-logitech-hidpp.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-
> > logitech-hidpp.c
> > index 0179f7ed77e5..85fd0c17cc2f 100644
> > --- a/drivers/hid/hid-logitech-hidpp.c
> > +++ b/drivers/hid/hid-logitech-hidpp.c
> > @@ -3773,6 +3773,24 @@ static const struct hid_device_id
> > hidpp_devices[] =3D {
> >       { /* MX5500 keyboard over Bluetooth */
> >         HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb30b),
> >         .driver_data =3D HIDPP_QUIRK_HIDPP_CONSUMER_VENDOR_KEYS },
> > +     { /* MX Anywhere 2 mouse over Bluetooth */
> > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb013),
> > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > +     { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb018),
> > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > +     { /* MX Anywhere 2S mouse over Bluetooth */
> > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01a),
> > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > +     { /* MX Master mouse over Bluetooth */
> > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb012),
> > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > +     { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb017),
> > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > +     { HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb01e),
> > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> > +     { /* MX Master 2S mouse over Bluetooth */
> > +       HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_LOGITECH, 0xb019),
> > +       .driver_data =3D HIDPP_QUIRK_HI_RES_SCROLL_X2121 },
> >       {}
> >  };
> >
> > --
> > 2.23.0
> >
>
> The series now looks great, thanks!
>
> Benjamin, I can confirm that up to now all BLE devices don't have short
> reports. I am not sure if you still want to only enable tested devices
> but from an architectural standpoint everything here should be fine.

Unfortunately yes, we need actual device tests:
- this series enable 0x2121 on all of those devices (is it correct?)
- we are not shielded from a FW error and something that goes wrong
when enabling one of those mice with hid-logitech-hidpp.c. All of
those mice works fine with hid-generic, and if we oversee one tiny
bit, we'll regress for no good reasons.

Cheers,
Benjamin

>
> Mazin, you can have my
>
> Reviewed-by: Filipe La=C3=ADns <lains@archlinux.org>
>
> for the series.
>
> Thank you,
> Filipe La=C3=ADns

