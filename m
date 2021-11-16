Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E1F452FE2
	for <lists+linux-input@lfdr.de>; Tue, 16 Nov 2021 12:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhKPLKD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 16 Nov 2021 06:10:03 -0500
Received: from hosting.gsystem.sk ([212.5.213.30]:60586 "EHLO
        hosting.gsystem.sk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233438AbhKPLKC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 16 Nov 2021 06:10:02 -0500
Received: from [192.168.1.3] (ns.gsystem.sk [62.176.172.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hosting.gsystem.sk (Postfix) with ESMTPSA id 583E47A032B;
        Tue, 16 Nov 2021 12:07:03 +0100 (CET)
From:   Ondrej Zary <linux@zary.sk>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] hid-multitouch: Fix Iiyama ProLite T1931SAW (0eef:0001 again!)
Date:   Tue, 16 Nov 2021 12:07:00 +0100
User-Agent: KMail/1.9.10
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20211112135511.29573-1-linux@zary.sk> <202111150937.31306.linux@zary.sk> <CAO-hwJ+B3er4PdNh1Nq3iGC+1bC1Gd0NZZ+UkRvGDXocTiXrXg@mail.gmail.com>
In-Reply-To: <CAO-hwJ+B3er4PdNh1Nq3iGC+1bC1Gd0NZZ+UkRvGDXocTiXrXg@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202111161207.00633.linux@zary.sk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tuesday 16 November 2021, Benjamin Tissoires wrote:
> On Mon, Nov 15, 2021 at 9:37 AM Ondrej Zary <linux@zary.sk> wrote:
> >
> > On Friday 12 November 2021, Benjamin Tissoires wrote:
> > > Hi Ondrej,
> > >
> > > On Fri, Nov 12, 2021 at 3:00 PM Ondrej Zary <linux@zary.sk> wrote:
> > > >
> > > > Iiyama ProLite T1931SAW does not work with Linux - input devices are
> > > > created but cursor does not move.
> > > >
> > > > It has the infamous 0eef:0001 ID which has been reused for various
> > > > devices before.
> > > >
> > > > It seems to require export_all_inputs = true.
> > > > Add it to mt_devices[] as MT_CLS_WIN_8 to fix the problem.
> > > > Hopefully there are no HID devices using this ID that will break.
> > > > It should not break non-HID devices (handled by usbtouchscreen).
> > >
> > > Hmm, this is worrisome. I am pretty sure there were some eGalax 0001
> > > devices that were Win 7 compatible and I am not sure if they are
> > > compatible with Win8...
> > >
> > > I guess that if you have to set MT_CLS_WIN_8, the device is not
> > > detected as such. so how about you use:
> > > MT_CLS_EXPORT_ALL_INPUTS instead, (to keep MT_CLS_DEFAULT for those
> > > devices), and restrict the VID/PID matching to the non Win8 devices:
> >
> > It works with MT_CLS_EXPORT_ALL_INPUTS.
> >
> > > HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_DWAV,
> > > USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER)
> >
> > But does not match HID_GROUP_GENERIC.
> 
> Sorry, it should have been HID_GROUP_MULTITOUCH

That's exactly how MT_USB_DEVICE is defined:
#define MT_USB_DEVICE(v, p)     HID_DEVICE(BUS_USB, HID_GROUP_MULTITOUCH, v, p)

So it's equal to MT_USB_DEVICE(USB_VENDOR_ID_DWAV, USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER)
Will that match only non-Win8 devices?
 
> Cheers,
> Benjamin
> 
> >
> > >
> > > ?
> > >
> > > Cheers,
> > > Benjamin
> > >
> > > >
> > > > Signed-off-by: Ondrej Zary <linux@zary.sk>
> > > > ---
> > > >  drivers/hid/hid-multitouch.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > > index e1afddb7b33d..099daf590392 100644
> > > > --- a/drivers/hid/hid-multitouch.c
> > > > +++ b/drivers/hid/hid-multitouch.c
> > > > @@ -1888,6 +1888,11 @@ static const struct hid_device_id mt_devices[] = {
> > > >                 MT_USB_DEVICE(USB_VENDOR_ID_CVTOUCH,
> > > >                         USB_DEVICE_ID_CVTOUCH_SCREEN) },
> > > >
> > > > +       /* eGalax devices (SAW) */
> > > > +       { .driver_data = MT_CLS_WIN_8,
> > > > +               MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> > > > +                       USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER) },
> > > > +
> > > >         /* eGalax devices (resistive) */
> > > >         { .driver_data = MT_CLS_EGALAX,
> > > >                 MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> > > > --
> > > > Ondrej Zary
> > > >
> > >
> > >
> >
> >
> >
> > --
> > Ondrej Zary
> >
> 
> 



-- 
Ondrej Zary
