Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D030114EDFE
	for <lists+linux-input@lfdr.de>; Fri, 31 Jan 2020 14:54:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728738AbgAaNyn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 Jan 2020 08:54:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20121 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728500AbgAaNyn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 Jan 2020 08:54:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1580478882;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9tbXHWDPce4VqObwIEVgevm5C6eS8RxIN6u6naGBfsM=;
        b=R0iJOxIh9PNPlfaqIOcm2Kkx/rIRNCPVvNere6reYKzrNtlgABioVPDAqdXT//mlm2ODgG
        eH5GfvpWyd01lqxsUlwKee3IpO2uPSEM80VTyFwqdnO3RI/wsGS03noOSpE+HZ4BQZ3GRS
        zqT3AECNHFpTrr0Seg+Egzj+OIKfZTc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-os_9_dswOi6DAt4WHv78lA-1; Fri, 31 Jan 2020 08:54:36 -0500
X-MC-Unique: os_9_dswOi6DAt4WHv78lA-1
Received: by mail-qk1-f197.google.com with SMTP id w29so4101449qkw.1
        for <linux-input@vger.kernel.org>; Fri, 31 Jan 2020 05:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9tbXHWDPce4VqObwIEVgevm5C6eS8RxIN6u6naGBfsM=;
        b=rc0FnHV8/hmuq5BTUgP8jm2r6tBAWqM9Q3fF9fKtkPL4O5116dv61M0xkzTmFJ2iJc
         Ru+YNNWI8knLjAgWk/x+OQRdBlanPDJ0xqvAFj6shzpX6e3ofBK5p37JpxV0e0HUwlJG
         gXX0Qs1txUKt7ASOJFVtQSFXlf8iQ12OsOYuv/lkORt5IJiiDnEQ0/FEdNK/J0jDZWu3
         9SyR6YN8n4I6LZP8yGYIrMkDdZJw/+K4TLHccgY/oueWTZGIorNkOeQzsbhnLKpeRaE7
         0FMIF3O5M2Tq5Su7f4ZcM/7z75WMBJQZQ/DAR28wU3axwqSr8xXIzRxo8VX+EBZbgBaf
         KFzg==
X-Gm-Message-State: APjAAAWCgP2wC9sJLVo97k529NkezwY12tdOwZxJUHMqCOSEd+TdRTcd
        zzSe74OlbkUtpBj9k7B3SKAbPHVNlyBP1mV2sqwSrRjUyR88ynQhOfvttwqQ6Fj2fUAd5uNFvJu
        uIR7j4Kk3T7rkmGxBHGS5oE1+nmD+3JeyYmvt0Ag=
X-Received: by 2002:ac8:390a:: with SMTP id s10mr10549213qtb.31.1580478875997;
        Fri, 31 Jan 2020 05:54:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQEKjSed0M9zrmc/UkCh8joFyKzOGkYuNkduwN5k47j5IWVALvanPvxxSEiSSNGpWJNJY/CyN6h8tHwSkRJNA=
X-Received: by 2002:ac8:390a:: with SMTP id s10mr10549182qtb.31.1580478875592;
 Fri, 31 Jan 2020 05:54:35 -0800 (PST)
MIME-Version: 1.0
References: <20200131124553.27796-1-hdegoede@redhat.com> <CAO-hwJK-wwZ8UJRaBgjVc0ZXakU9C3eDbh+i6Q5vm8xh1P76LQ@mail.gmail.com>
 <ea896405-6784-7cfd-b27c-28e8ebc3cd7e@redhat.com>
In-Reply-To: <ea896405-6784-7cfd-b27c-28e8ebc3cd7e@redhat.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Fri, 31 Jan 2020 14:54:24 +0100
Message-ID: <CAO-hwJJ1v30NT5quobYawV9yv87buyrQXOG9u-nY3zXXSrCGvg@mail.gmail.com>
Subject: Re: [PATCH] HID: ite: Only bind to keyboard USB interface on Acer
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

On Fri, Jan 31, 2020 at 2:41 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 1/31/20 2:10 PM, Benjamin Tissoires wrote:
> > Hi Hans,
> >
> > On Fri, Jan 31, 2020 at 1:46 PM Hans de Goede <hdegoede@redhat.com> wro=
te:
> >>
> >> Commit 8f18eca9ebc5 ("HID: ite: Add USB id match for Acer SW5-012 keyb=
oard
> >> dock") added the USB id for the Acer SW5-012's keyboard dock to the
> >> hid-ite driver to fix the rfkill driver not working.
> >>
> >> Most keyboard docks with an ITE 8595 keyboard/touchpad controller have=
 the
> >> "Wireless Radio Control" bits which need the special hid-ite driver on=
 the
> >> second USB interface (the mouse interface) and their touchpad only sup=
ports
> >> mouse emulation, so using generic hid-input handling for anything but
> >> the "Wireless Radio Control" bits is fine. On these devices we simply =
bind
> >> to all USB interfaces.
> >>
> >> But unlike other ITE8595 using keyboard docks, the Acer Aspire Switch =
10
> >> (SW5-012)'s touchpad not only does mouse emulation it also supports
> >> HID-multitouch and all the keys including the "Wireless Radio Control"
> >> bits have been moved to the first USB interface (the keyboard intf).
> >>
> >> So we need hid-ite to handle the first (keyboard) USB interface and ha=
ve
> >> it NOT bind to the second (mouse) USB interface so that that can be
> >> handled by hid-multitouch.c and we get proper multi-touch support.
> >>
> >> This commit adds a match callback to hid-ite which makes it only
> >> match the first USB interface when running on the Acer SW5-012,
> >> fixing the regression to mouse-emulation mode introduced by adding the
> >> keyboard dock USB id.
> >>
> >> Note the match function only does the special only bind to the first
> >> USB interface on the Acer SW5-012, on other devices the hid-ite driver
> >> actually must bind to the second interface as that is where the
> >> "Wireless Radio Control" bits are.
> >
> > This is not a full review, but a couple of things that popped out
> > while scrolling through the patch.
> >
> >>
> >> Cc: stable@vger.kernel.org
> >> Fixes: 8f18eca9ebc5 ("HID: ite: Add USB id match for Acer SW5-012 keyb=
oard dock")
> >> Reported-by: Zden=C4=9Bk Rampas <zdenda.rampas@gmail.com>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >> ---
> >>   drivers/hid/hid-ite.c | 34 ++++++++++++++++++++++++++++++++++
> >>   1 file changed, 34 insertions(+)
> >>
> >> diff --git a/drivers/hid/hid-ite.c b/drivers/hid/hid-ite.c
> >> index c436e12feb23..69a4ddfd033d 100644
> >> --- a/drivers/hid/hid-ite.c
> >> +++ b/drivers/hid/hid-ite.c
> >> @@ -8,9 +8,12 @@
> >>   #include <linux/input.h>
> >>   #include <linux/hid.h>
> >>   #include <linux/module.h>
> >> +#include <linux/usb.h>
> >>
> >>   #include "hid-ids.h"
> >>
> >> +#define ITE8595_KBD_USB_INTF           0
> >> +
> >>   static int ite_event(struct hid_device *hdev, struct hid_field *fiel=
d,
> >>                       struct hid_usage *usage, __s32 value)
> >>   {
> >> @@ -37,6 +40,36 @@ static int ite_event(struct hid_device *hdev, struc=
t hid_field *field,
> >>          return 0;
> >>   }
> >>
> >> +static bool ite_match(struct hid_device *hdev, bool ignore_special_dr=
iver)
> >> +{
> >> +       struct usb_interface *intf;
> >> +
> >> +       if (ignore_special_driver)
> >> +               return false;
> >> +
> >> +       /*
> >> +        * Most keyboard docks with an ITE 8595 keyboard/touchpad cont=
roller
> >> +        * have the "Wireless Radio Control" bits which need this spec=
ial
> >> +        * driver on the second USB interface (the mouse interface). O=
n
> >> +        * these devices we simply bind to all USB interfaces.
> >> +        *
> >> +        * The Acer Aspire Switch 10 (SW5-012) is special, its touchpa=
d
> >> +        * not only does mouse emulation it also supports HID-multitou=
ch
> >> +        * and all the keys including the "Wireless Radio Control" bit=
s
> >> +        * have been moved to the first USB interface (the keyboard in=
tf).
> >> +        *
> >> +        * We want the hid-multitouch driver to bind to the touchpad, =
so on
> >> +        * the Acer SW5-012 we should only bind to the keyboard USB in=
tf.
> >> +        */
> >> +       if (hdev->bus !=3D BUS_USB || hdev->vendor !=3D USB_VENDOR_ID_=
SYNAPTICS ||
> >> +                    hdev->product !=3D USB_DEVICE_ID_SYNAPTICS_ACER_S=
WITCH5_012)
> >
> > Isn't there an existing matching function we can use here, instead of
> > checking each individual field?
>
> There is hid_match_one_id() but that is not exported (can be fixed) and i=
t
> requires a struct hid_device_id, which either requires declaring an extra
> standalone struct hid_device_id for the SW5-012 kbd-dock, or hardcoding a=
n
> index into the existing hid_device_id array for the driver (with the hard=
coding
> being error prone, so not a good idea).
>
> Given the problems with using hid_match_one_id() I decided to just go wit=
h
> the above.

right. An other solution would be to have a local macro/function that
does that. Because as soon as you start adding a quirk, an other comes
right after.

>
> But see below.
>
> >
> >> +               return true;
> >> +
> >> +       intf =3D to_usb_interface(hdev->dev.parent);
> >
> > And this is oops-prone. You need:
> > - ensure hid_is_using_ll_driver(hdev, &usb_hid_driver) returns true.
> > - add a dependency on USBHID in the KConfig now that you are checking
> > on the USB transport layer.
> >
> > That being said, I would love instead:
> > - to have a non USB version of this match, where you decide which
> > component needs to be handled based on the report descriptor
>
> Actually your idea to use the desciptors is not bad, but since what
> we really want is to not bind to the interface which is marked for the
> hid-multitouch driver I just realized we can just check that.
>
> So how about:
>
> static bool ite_match(struct hid_device *hdev, bool ignore_special_driver=
)
> {
>          if (ignore_special_driver)
>                  return false;
>
>          /*
>           * Some keyboard docks with an ITE 8595 keyboard/touchpad contro=
ller
>           * support the HID multitouch protocol for the touchpad, in that
>           * case the "Wireless Radio Control" bits which we care about ar=
e
>           * on the other interface; and we should not bind to the multito=
uch
>           * capable interface as that breaks multitouch support.
>           */
>          return hdev->group !=3D HID_GROUP_MULTITOUCH_WIN_8;
> }

Yep, I like that very much :)

>
> ? (note untested)
>
> Zden=C4=9Bk  I have attached a new version of the patch which uses this
> improved version of the match function, if you have a chance to test it
> this weekend that would be great, otherwise I will test it on my own
> sw5-012 on Monday.
>
> > - have a regression test in
> > https://gitlab.freedesktop.org/libevdev/hid-tools for this particular
> > device, because I never intended the .match callback to be used by
> > anybody else than hid-generic, and opening this can of worms is prone
> > to introduce regressions in the future.
>
> Ugh, I can understand your desire for a test for this, but writing
> tests is not really my thing. Anyways do you have an example test I
> could use as a start ?

So, if I am not wrong:
- keyboard docks with an ITE 8595 keyboard/touchpad controller are
registered in hid-ite.c, but should be really bound to hid-multitouch.
- there are at least 2 HID interfaces (sharing the same VID/PID), one
for the keyboard (hid-ite.c), and one for the touchpad
(hid-multitouch.c)
- what matters in the end, is that the multitouch interface gets
correctly mapped and handled.

So if that is somehow accurate, I think a test would be a matter of:
- duplicating https://gitlab.freedesktop.org/libevdev/hid-tools/blob/master=
/tests/test_multitouch.py#L1568-1570,
- add the report descriptors of the touchpad interface,
- and check that the unpatched kernel picks up hid-ite.c, which leads
to errors in the multitouch tests
- ideally, we should also add a test for the expected hid-ite.c part,
but I can do that later with the report descriptors.

So initially, it shouldn't be more than a 3 lines patch (hopefully).
Actually 4, because you also need to force the VID/PID with
`info=3D(0x3, 0xVID, 0xPID)` (see TestZytronic_14c8_0005 for an example,
in the same file)

Cheers,
Benjamin

>
> Regards,
>
> Hans

