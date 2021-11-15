Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCACF450009
	for <lists+linux-input@lfdr.de>; Mon, 15 Nov 2021 09:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhKOIkk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Nov 2021 03:40:40 -0500
Received: from hosting.gsystem.sk ([212.5.213.30]:41350 "EHLO
        hosting.gsystem.sk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbhKOIke (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Nov 2021 03:40:34 -0500
Received: from [192.168.1.3] (ns.gsystem.sk [62.176.172.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hosting.gsystem.sk (Postfix) with ESMTPSA id 2877C7A0226;
        Mon, 15 Nov 2021 09:37:34 +0100 (CET)
From:   Ondrej Zary <linux@zary.sk>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] hid-multitouch: Fix Iiyama ProLite T1931SAW (0eef:0001 again!)
Date:   Mon, 15 Nov 2021 09:37:31 +0100
User-Agent: KMail/1.9.10
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <20211112135511.29573-1-linux@zary.sk> <CAO-hwJLZ8roXUxnB5Umyjd_22KFGbFMouxdVM0GLSSLrktteAg@mail.gmail.com>
In-Reply-To: <CAO-hwJLZ8roXUxnB5Umyjd_22KFGbFMouxdVM0GLSSLrktteAg@mail.gmail.com>
X-KMail-QuotePrefix: > 
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <202111150937.31306.linux@zary.sk>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Friday 12 November 2021, Benjamin Tissoires wrote:
> Hi Ondrej,
> 
> On Fri, Nov 12, 2021 at 3:00 PM Ondrej Zary <linux@zary.sk> wrote:
> >
> > Iiyama ProLite T1931SAW does not work with Linux - input devices are
> > created but cursor does not move.
> >
> > It has the infamous 0eef:0001 ID which has been reused for various
> > devices before.
> >
> > It seems to require export_all_inputs = true.
> > Add it to mt_devices[] as MT_CLS_WIN_8 to fix the problem.
> > Hopefully there are no HID devices using this ID that will break.
> > It should not break non-HID devices (handled by usbtouchscreen).
> 
> Hmm, this is worrisome. I am pretty sure there were some eGalax 0001
> devices that were Win 7 compatible and I am not sure if they are
> compatible with Win8...
> 
> I guess that if you have to set MT_CLS_WIN_8, the device is not
> detected as such. so how about you use:
> MT_CLS_EXPORT_ALL_INPUTS instead, (to keep MT_CLS_DEFAULT for those
> devices), and restrict the VID/PID matching to the non Win8 devices:

It works with MT_CLS_EXPORT_ALL_INPUTS.
 
> HID_DEVICE(BUS_USB, HID_GROUP_GENERIC, USB_VENDOR_ID_DWAV,
> USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER)

But does not match HID_GROUP_GENERIC.

> 
> ?
> 
> Cheers,
> Benjamin
> 
> >
> > Signed-off-by: Ondrej Zary <linux@zary.sk>
> > ---
> >  drivers/hid/hid-multitouch.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > index e1afddb7b33d..099daf590392 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -1888,6 +1888,11 @@ static const struct hid_device_id mt_devices[] = {
> >                 MT_USB_DEVICE(USB_VENDOR_ID_CVTOUCH,
> >                         USB_DEVICE_ID_CVTOUCH_SCREEN) },
> >
> > +       /* eGalax devices (SAW) */
> > +       { .driver_data = MT_CLS_WIN_8,
> > +               MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> > +                       USB_DEVICE_ID_EGALAX_TOUCHCONTROLLER) },
> > +
> >         /* eGalax devices (resistive) */
> >         { .driver_data = MT_CLS_EGALAX,
> >                 MT_USB_DEVICE(USB_VENDOR_ID_DWAV,
> > --
> > Ondrej Zary
> >
> 
> 



-- 
Ondrej Zary
