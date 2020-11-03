Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AA962A4D2C
	for <lists+linux-input@lfdr.de>; Tue,  3 Nov 2020 18:37:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728806AbgKCRhU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Nov 2020 12:37:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45152 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728292AbgKCRhU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 3 Nov 2020 12:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604425037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=i9snDXU2ybJXDGo7hnFXq/Cq4lV2fEeQCxKYcIflCyI=;
        b=ejmKyoOK/s4CfteHtMMwA36+qA6IkEtGbwkY2B5Fn73j4AhyswhENkBYMDt91TP2BW3pcL
        yb9LkXeRmXnFPJkm64ZNFCYP9RFxIJTjpqo0aqURpeZJU9ivNJsaD66IlpP/Ot9WnV1ISm
        IfaeSPy9Ln9K4whZQ10CvxhZ9cMCJZQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-NZqvJGJ_MGa4xvIfEJIxxg-1; Tue, 03 Nov 2020 12:37:11 -0500
X-MC-Unique: NZqvJGJ_MGa4xvIfEJIxxg-1
Received: by mail-pg1-f198.google.com with SMTP id 33so11795976pgt.9
        for <linux-input@vger.kernel.org>; Tue, 03 Nov 2020 09:37:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i9snDXU2ybJXDGo7hnFXq/Cq4lV2fEeQCxKYcIflCyI=;
        b=b719+A4nnCrbyUyEeLPDz2oISRLOmn9TM6jmBXEo+4Uy4WWOhP0Ccixv9VnED8ZZBE
         Ap+MzuV/cwa5PeRpvoFaBDIP/IGUO+qRcSbL9O2G9s1/QHDOw7FQNoBpjhZUACMsSNPe
         PvNX0sT1aG3DBMTKFK/k2fRMI3qO46r+AdOWSzVWnq1AkAwKh0wZ89YyHStMgKcqu5XR
         FWKQED74I1Ka3pWrEMD/GiDvXDoIDM1f8OyTnfZYRXSp/exvBUN/gaq1VKxOiPX8oDo1
         QdFUkI01CslpUxru/uarBGfvuNVNEvtotuT9sx05IsJUmbDDsKs8QwKJVK3UYYzXTInm
         ZofQ==
X-Gm-Message-State: AOAM5321KYHbLK9bTY7MK38Txd6syEYOTXtC10/fS2mm0VJvaiY/H3uS
        RfjGv/HPWXRZS4aj0pVkNdCL4DQgzmVpaksHe1tZjJ2DhK0N+DTrDZKXdp6AKAaSgCBjx7S5L3y
        +wPhhh5A9ITQZQYoLbIJsKldKJljrw+e7WA0I6XI=
X-Received: by 2002:a63:d74b:: with SMTP id w11mr17871855pgi.147.1604425028706;
        Tue, 03 Nov 2020 09:37:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwgnRxy+mIMGzy7XC/GOFiP6yZOPAWkEdf6uab1jr5p7QNhGD5kIaPyQx4W6QIz081jstK8hvGO/ej73DhfvxQ=
X-Received: by 2002:a63:d74b:: with SMTP id w11mr17871840pgi.147.1604425028365;
 Tue, 03 Nov 2020 09:37:08 -0800 (PST)
MIME-Version: 1.0
References: <20201101193504.679934-1-lzye@google.com> <CAO-hwJJVKOM7Om8E+kmYXTrA7SiOFgFt46BHfv+0j+ORhepbaQ@mail.gmail.com>
 <7505bbc6-9f76-0875-c1c1-95d611a980bb@gmail.com>
In-Reply-To: <7505bbc6-9f76-0875-c1c1-95d611a980bb@gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 3 Nov 2020 18:36:57 +0100
Message-ID: <CAO-hwJK3EzeQbiPMy=8YAVp91nN6bMcAqqfzff+-6mti9PFMHQ@mail.gmail.com>
Subject: Re: [PATCH v2] Input: Fix the HID usage of DPAD input event generation.
To:     Chris Ye <linzhao.ye@gmail.com>
Cc:     Chris Ye <lzye@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        lkml <linux-kernel@vger.kernel.org>, trivial@kernel.org,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Chris,

On Mon, Nov 2, 2020 at 6:24 PM Chris Ye <linzhao.ye@gmail.com> wrote:
>
> Hi Benjamin,
>
>      I've tried the hid-tool for testing on my linux machine and it
> works.  However the issue comes from a game controller I don't posses in
> hand right now so I can't physically connect it and provide the log from
> hid-tool recording.  I do have the raw HID descriptor and in Linux
> kernel the debug info is like below:
>
> # cat /d/hid/0005\:27F8\:0BBE.0001/rdesc
> 05 01 09 05 a1 01 a1 02 15 81 25 7f 05 01 09 01 a1 00 75 08 95 04 35 00
> 46 ff 00 09 30 09 31 09 32 09 35 81 02 75 08 95 02 15 01 26 ff 00 09 39
> 09 39 81 02 c0 05 07 19 4f 29 52 15 00 25 01 75 01 95 04 81 02 05 01 09
> 90 09 91 09 92 09 93 75 01 95 04 81 02 75 01 95 10 05 09 19 01 29 10 81
> 02 06 02 ff 09 01 a1 01 15 00 25 01 09 04 75 01 95 01 81 02 c0 05 0c 09
> 01 a1 01 15 00 25 01 0a 24 02 75 01 95 01 81 06 c0 75 01 95 06 81 03 15
> 00 25 ff 05 02 09 01 a1 00 75 08 95 02 35 00 45 ff 09 c4 09 c5 81 02 c0
> 06 00 ff 09 80 75 08 95 08 15 00 26 ff 00 b1 02 c0 c0

Thanks for the report descriptor. That allowed me to add the device to
the tests at https://gitlab.freedesktop.org/bentiss/hid-tools/-/commits/wip/gamevice

And also to realize that... "how is that thing supposed to be working????"

>
>    INPUT[INPUT]
>      Field(0)
>        Physical(GenericDesktop.Pointer)
>        Application(GenericDesktop.GamePad)
>        Usage(4)
>          GenericDesktop.X
>          GenericDesktop.Y
>          GenericDesktop.Z
>          GenericDesktop.Rz
>        Logical Minimum(-127)
>        Logical Maximum(127)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(8)
>        Report Count(4)
>        Report Offset(0)
>        Flags( Variable Absolute )
>      Field(1)
>        Physical(GenericDesktop.Pointer)
>        Application(GenericDesktop.GamePad)
>        Usage(2)
>          GenericDesktop.HatSwitch
>          GenericDesktop.HatSwitch
>        Logical Minimum(1)
>        Logical Maximum(255)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(8)
>        Report Count(2)
>        Report Offset(32)
>        Flags( Variable Absolute )
>      Field(2)
>        Application(GenericDesktop.GamePad)
>        Usage(4)
>          Keyboard.004f
>          Keyboard.0050
>          Keyboard.0051
>          Keyboard.0052
>        Logical Minimum(0)
>        Logical Maximum(1)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(1)
>        Report Count(4)
>        Report Offset(48)
>        Flags( Variable Absolute )
>      Field(3)
>        Application(GenericDesktop.GamePad)
>        Usage(4)
>          GenericDesktop.D-PadUp
>          GenericDesktop.D-PadDown
>          GenericDesktop.D-PadRight
>          GenericDesktop.D-PadLeft
>        Logical Minimum(0)
>        Logical Maximum(1)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(1)
>        Report Count(4)
>        Report Offset(52)
>        Flags( Variable Absolute )
>      Field(4)
>        Application(GenericDesktop.GamePad)
>        Usage(16)
>          Button.0001
>          Button.0002
>          Button.0003
>          Button.0004
>          Button.0005
>          Button.0006
>          Button.0007
>          Button.0008
>          Button.0009
>          Button.000a
>          Button.000b
>          Button.000c
>          Button.000d
>          Button.000e
>          Button.000f
>          Button.0010
>        Logical Minimum(0)
>        Logical Maximum(1)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(1)
>        Report Count(16)
>        Report Offset(56)
>        Flags( Variable Absolute )
>      Field(5)
>        Application(ff02.0001)
>        Usage(1)
>          ff02.0004
>        Logical Minimum(0)
>        Logical Maximum(1)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(1)
>        Report Count(1)
>        Report Offset(72)
>        Flags( Variable Absolute )
>      Field(6)
>        Application(Consumer.0001)
>        Usage(1)
>          Consumer.0224
>        Logical Minimum(0)
>        Logical Maximum(1)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(1)
>        Report Count(1)
>        Report Offset(73)
>        Flags( Variable Relative )
>      Field(7)
>        Physical(Simulation.0001)
>        Application(GenericDesktop.GamePad)
>        Usage(2)
>          Simulation.00c4
>          Simulation.00c5
>        Logical Minimum(0)
>        Logical Maximum(255)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(8)
>        Report Count(2)
>        Report Offset(80)
>        Flags( Variable Absolute )
>    FEATURE[FEATURE]
>      Field(0)
>        Application(GenericDesktop.GamePad)
>        Usage(8)
>          ff00.0080
>          ff00.0080
>          ff00.0080
>          ff00.0080
>          ff00.0080
>          ff00.0080
>          ff00.0080
>          ff00.0080
>        Logical Minimum(0)
>        Logical Maximum(255)
>        Physical Minimum(0)
>        Physical Maximum(255)
>        Report Size(8)
>        Report Count(8)
>        Report Offset(0)
>        Flags( Variable Absolute )
>
> GenericDesktop.X ---> Absolute.X
> GenericDesktop.Y ---> Absolute.Y
> GenericDesktop.Z ---> Absolute.Z
> GenericDesktop.Rz ---> Absolute.Rz
> GenericDesktop.HatSwitch ---> Absolute.Hat0X
> GenericDesktop.HatSwitch ---> Absolute.Hat0Y

It took me a while to realize that you were needing
https://patchwork.kernel.org/project/linux-input/patch/20201101193452.678628-1-lzye@google.com/
for that.

But the weird part is that Hat switch are usually used as a single
variable, with values being mapped to Hat0X and Hat0Y. So I still
haven't manage to understand how the hid-input driver would map the
axis to a regular one between 1 and 255...

> Keyboard.004f ---> Key.Right
> Keyboard.0050 ---> Key.Left
> Keyboard.0051 ---> Key.Down
> Keyboard.0052 ---> Key.Up
> GenericDesktop.D-PadUp ---> Absolute.Hat1X
> GenericDesktop.D-PadDown ---> Sync.Report
> GenericDesktop.D-PadRight ---> Sync.Report
> GenericDesktop.D-PadLeft ---> Sync.Report
> Button.0001 ---> Key.BtnA
> Button.0002 ---> Key.BtnB
> Button.0003 ---> Key.BtnC
> Button.0004 ---> Key.BtnX
> Button.0005 ---> Key.BtnY
> Button.0006 ---> Key.BtnZ
> Button.0007 ---> Key.BtnTL
> Button.0008 ---> Key.BtnTR
> Button.0009 ---> Key.BtnTL2
> Button.000a ---> Key.BtnTR2
> Button.000b ---> Key.BtnSelect
> Button.000c ---> Key.BtnStart
> Button.000d ---> Key.BtnMode
> Button.000e ---> Key.BtnThumbL
> Button.000f ---> Key.BtnThumbR
> Button.0010 ---> Key.?
> ff02.0004 ---> Key.Btn0
> Consumer.0224 ---> Key.Back
> Simulation.00c4 ---> Absolute.Gas
> Simulation.00c5 ---> Absolute.Brake
>
> So you can see the device has D-Up, D-Down,D-Right,D-Left usages, and
> D-up is mapped to Hat1X.

OK, now I am starting to understand the problem better.

>
> Also if you can send HID report from hid-tool,  you will see there are
> always intail events on Hat1X/Hat1Y as the HatDir is 0, even no DPAD
> buttons pressed.  When you send HID report with D-DPAD buttons with
> different state, it doesn't generate any axis events because the HatDir
> internally is still 0 regardless the report value of the 4 DPAD usages.

That's the part I am a little bit stuck. I can emulate events for X,Y,
buttons,... but I am not sure how the gamepad sends the events for the
Hat switch and the D-Pad together.

Again, before we merge anything, I'd like to have the proper tests
written for it, on top of
https://gitlab.freedesktop.org/bentiss/hid-tools/-/commits/wip/gamevice
so we can ensure there is no regression for it, and that we will not
regress on it later on.

Cheers,
Benjamin

>
>
> Thanks!
>
> Chris
>
>
> On 11/2/20 12:16 AM, Benjamin Tissoires wrote:
> > Hi Chris,
> >
> >
> > On Sun, Nov 1, 2020 at 8:35 PM Chris Ye <lzye@google.com> wrote:
> >> Generic Desktop DPAD usage is mapped by hid-input, that only the first
> >> DPAD usage maps to usage type EV_ABS and code of an axis. If HID
> >> descriptor has DPAD UP/DOWN/LEFT/RIGHT HID usages and each of usage size
> >> is 1 bit, then only the first one will generate input event, the rest of
> >> the HID usages will be assigned to hat direction only.
> >> The hid input event should check the HID report value and generate
> >> HID event for its hat direction.
> >>
> >> Test: Connect HID device with Generic Desktop DPAD usage and press the
> >> DPAD to generate input events.
> > Thanks for the patch, but I would rather have a proper tests added to
> > https://gitlab.freedesktop.org/libevdev/hid-tools
> >
> > We already have gamepads tests, and it would be very nice to have this
> > patch reflected as a test as well. This would also allow me to better
> > understand the problem. I am not sure I follow the whole logic of this
> > patch without seeing the 2 variants of report descriptors.
> >
> > Cheers,
> > Benjamin
> >
> >> Signed-off-by: Chris Ye <lzye@google.com>
> >> ---
> >>   drivers/hid/hid-input.c | 16 ++++++++++++----
> >>   1 file changed, 12 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> >> index 9770db624bfa..6c1007de3409 100644
> >> --- a/drivers/hid/hid-input.c
> >> +++ b/drivers/hid/hid-input.c
> >> @@ -1269,7 +1269,7 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
> >>          struct input_dev *input;
> >>          unsigned *quirks = &hid->quirks;
> >>
> >> -       if (!usage->type)
> >> +       if (!usage->type && !field->dpad)
> >>                  return;
> >>
> >>          if (usage->type == EV_PWR) {
> >> @@ -1286,9 +1286,17 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
> >>                  int hat_dir = usage->hat_dir;
> >>                  if (!hat_dir)
> >>                          hat_dir = (value - usage->hat_min) * 8 / (usage->hat_max - usage->hat_min + 1) + 1;
> >> -               if (hat_dir < 0 || hat_dir > 8) hat_dir = 0;
> >> -               input_event(input, usage->type, usage->code    , hid_hat_to_axis[hat_dir].x);
> >> -               input_event(input, usage->type, usage->code + 1, hid_hat_to_axis[hat_dir].y);
> >> +               if (hat_dir < 0 || hat_dir > 8 || value == 0)
> >> +                       hat_dir = 0;
> >> +               if (field->dpad) {
> >> +                       input_event(input, EV_ABS, field->dpad, hid_hat_to_axis[hat_dir].x);
> >> +                       input_event(input, EV_ABS, field->dpad + 1, hid_hat_to_axis[hat_dir].y);
> >> +               } else {
> >> +                       input_event(input, usage->type, usage->code,
> >> +                               hid_hat_to_axis[hat_dir].x);
> >> +                       input_event(input, usage->type, usage->code + 1,
> >> +                               hid_hat_to_axis[hat_dir].y);
> >> +               }
> >>                  return;
> >>          }
> >>
> >> --
> >> 2.29.1.341.ge80a0c044ae-goog
> >>
>

