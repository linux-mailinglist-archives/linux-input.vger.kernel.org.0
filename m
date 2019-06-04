Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2C7433F6F
	for <lists+linux-input@lfdr.de>; Tue,  4 Jun 2019 09:02:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfFDHCZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jun 2019 03:02:25 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39701 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726704AbfFDHCZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jun 2019 03:02:25 -0400
Received: by mail-qt1-f193.google.com with SMTP id i34so12526417qta.6
        for <linux-input@vger.kernel.org>; Tue, 04 Jun 2019 00:02:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZhC1lENrEFgimv6sdeFIBKs72SRqFRtCu7WdaF7Vsso=;
        b=PUWIF+TV8H8HGDmtD6bw3fYgCl+MLHyaDFvfP+7U7csjoeagedoXeRYTU88Jaa+E/X
         UZrdOxRN09dIBTIkY0WcZBowUlZVx8uWZ0fhO65TiOupL7Ey+ylHeU0+h4E7S47wJuiE
         GxCP+lX8FDmzVzbMyoAAhQ6g1utaCZTXm9FdsBT9+pefUqOOB93WFpzDqpCXAOOZs2NU
         EzsLX/l8Kv+ZucERasjSTq1BhtCLdfWPGxWzVLeobzUsDtZQ84d0VvD+Mb8otdFXuPge
         HcOQe9wuNW5qaU1VsjUrNY4iKATERoAeBMrMYXNwz75w1YpyFS/lx63di5ZbGy5i69eW
         RfVA==
X-Gm-Message-State: APjAAAUXmAV9wW85cx/6Dnk1vgj+d7VFGnFFi6Obg8+73Xc1uZTwysBJ
        007yE5Tm+THcXfflIo3He+bM1ZQPC3yfDMZYWHstyw==
X-Google-Smtp-Source: APXvYqznnJVZGIgYwAw/MnqEYckWgjrGh9RH5HIIi/H7SDijmQix/Wxv4jKZIjn/IMTmenEHoFJG0qYhI8EldZqozHo=
X-Received: by 2002:ac8:2cba:: with SMTP id 55mr10239342qtw.260.1559631744088;
 Tue, 04 Jun 2019 00:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190528162924.32754-1-pedro@pedrovanzella.com>
 <CAO-hwJ+zAvDizJRpykky+D3pf1M1NhFGWztwyA4mJEv8C+nO-w@mail.gmail.com> <20190603214438.2cnmrx7g2sakjdr4@Fenrir>
In-Reply-To: <20190603214438.2cnmrx7g2sakjdr4@Fenrir>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 4 Jun 2019 09:02:11 +0200
Message-ID: <CAO-hwJ+0WEgAvkRsr1oEnR5wCJcGKzhim+=5em1Y-GzC4GowMg@mail.gmail.com>
Subject: Re: [PATCH] HID: hid-logitech-hidpp: detect wireless lightspeed devices
To:     Pedro Vanzella <pedro@pedrovanzella.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jun 3, 2019 at 11:44 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
>
> On 05/28, Benjamin Tissoires wrote:
> > On Tue, May 28, 2019 at 6:30 PM Pedro Vanzella <pedro@pedrovanzella.com> wrote:
> > >
> > > Send a low device index when the device is connected via the lightspeed
> > > receiver so that the receiver will pass the message along to the device
> > > instead of responding. If we don't do that, we end up thinking it's a
> > > hidpp10 device and miss out on all new features available to newer devices.
> > >
> > > This will enable correct detection of the following models:
> > > G603, GPro, G305, G613, G900 and G903, and possibly others.
> >
> > Thanks for the patch.
> Thanks for reviewing it :)
>
> > However, there is already support for this receiver in Linus' tree:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/hid/hid-logitech-dj.c?id=f5fb57a74e88bd1788f57bf77d587c91d4dc9d57
> >
> > With kernel 5.2-rc1, the connected device should already be handled by
> > hid-logitech-hidpp :)
> Why are the wireless receivers handled by hid-logitech-dj and the wired
> mice handled by hid-logitech-hidpp? They are, in the end, all hidpp
> devices, and having them all handled by the -hidpp driver with a quirk
> class would allow us to check for support for the battery voltage
> feature, as it seems to be an either-or scenario here.

Yep, and this is exactly what is happening:
- the receiver is handled through hid-logitech-dj -> it creates a
virtual HID device for the wireless physical device
- the actual wireless device is handled through hid-logitech-hidpp
(with the virtual HID device created above)

This has the advantage of presenting the wireless device in the same
way the wired device is. From hid-logitech-hidpp point of view, both
are regular HID++ devices.
Also, this makes sure each physical device gets its own product ID (we
are relying on the wireless product ID), meaning that userspace can
differentiate a G900 from a G613 when both are connected to a receiver
with the same product ID.

Hope that helps.

Cheers,
Benjamin


>
> - Pedro
> >
> > Cheers,
> > Benjamin
> >
> > >
> > > Signed-off-by: Pedro Vanzella <pedro@pedrovanzella.com>
> > > ---
> > >  drivers/hid/hid-logitech-hidpp.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
> > > index 72fc9c0566db..621fce141d9f 100644
> > > --- a/drivers/hid/hid-logitech-hidpp.c
> > > +++ b/drivers/hid/hid-logitech-hidpp.c
> > > @@ -62,6 +62,7 @@ MODULE_PARM_DESC(disable_tap_to_click,
> > >  #define HIDPP_QUIRK_CLASS_K400                 BIT(2)
> > >  #define HIDPP_QUIRK_CLASS_G920                 BIT(3)
> > >  #define HIDPP_QUIRK_CLASS_K750                 BIT(4)
> > > +#define HIDPP_QUIRK_CLASS_LIGHTSPEED           BIT(5)
> > >
> > >  /* bits 2..20 are reserved for classes */
> > >  /* #define HIDPP_QUIRK_CONNECT_EVENTS          BIT(21) disabled */
> > > @@ -236,7 +237,11 @@ static int __hidpp_send_report(struct hid_device *hdev,
> > >          * set the device_index as the receiver, it will be overwritten by
> > >          * hid_hw_request if needed
> > >          */
> > > -       hidpp_report->device_index = 0xff;
> > > +       if (hidpp->quirks & HIDPP_QUIRK_CLASS_LIGHTSPEED) {
> > > +               hidpp_report->device_index = 0x01;
> > > +       } else {
> > > +               hidpp_report->device_index = 0xff;
> > > +       }
> > >
> > >         if (hidpp->quirks & HIDPP_QUIRK_FORCE_OUTPUT_REPORTS) {
> > >                 ret = hid_hw_output_report(hdev, (u8 *)hidpp_report, fields_count);
> > > @@ -3753,6 +3758,9 @@ static const struct hid_device_id hidpp_devices[] = {
> > >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC06B) },
> > >         { /* Logitech G900 Gaming Mouse over USB */
> > >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC081) },
> > > +       { /* Logitech Gaming Mice over Lightspeed Receiver */
> > > +         HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, 0xC539),
> > > +         .driver_data = HIDPP_QUIRK_CLASS_LIGHTSPEED },
> > >         { /* Logitech G920 Wheel over USB */
> > >           HID_USB_DEVICE(USB_VENDOR_ID_LOGITECH, USB_DEVICE_ID_LOGITECH_G920_WHEEL),
> > >                 .driver_data = HIDPP_QUIRK_CLASS_G920 | HIDPP_QUIRK_FORCE_OUTPUT_REPORTS},
> > > --
> > > 2.21.0
> > >
>
> --
> Pedro Vanzella
> pedrovanzella.com
> #include <paranoia.h>
> Don't Panic
