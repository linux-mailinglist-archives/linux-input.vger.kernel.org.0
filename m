Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 240CF4B87E6
	for <lists+linux-input@lfdr.de>; Wed, 16 Feb 2022 13:43:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbiBPMnQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 16 Feb 2022 07:43:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiBPMnP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 16 Feb 2022 07:43:15 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D8C7D1728A8
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 04:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645015380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=xdePfA3YK4ImR+v8qP/X2F5c6VHJSv/ebAO/bUBf1js=;
        b=XceZRKGlIIA7TSRnE+J3R08ly5qRSxwx2sFAe4/XmQr8xrzrQbS77asg4leSSn6OoYQIpG
        9ttJNsrhiAzLzGNHDrlUkVJb8E7Z80VXDVxnA3b1ZI07UhDPLj+Fl19k6AbzAFF/xyRiDS
        iMb5iBpyVKSCoxyRPeBXWHiSb2htJoo=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-dq-6PPfiOPK7DICr6wnwfA-1; Wed, 16 Feb 2022 07:42:59 -0500
X-MC-Unique: dq-6PPfiOPK7DICr6wnwfA-1
Received: by mail-pj1-f70.google.com with SMTP id c6-20020a17090a020600b001b9b44c18aaso4500330pjc.4
        for <linux-input@vger.kernel.org>; Wed, 16 Feb 2022 04:42:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xdePfA3YK4ImR+v8qP/X2F5c6VHJSv/ebAO/bUBf1js=;
        b=0xRKmwou4Fi71oIEUtMA/KYDGBfOqwuRyT0jWap+Qrw7rgHmYjHsI1xteCC8JmLs+Y
         ZLtWYUpYUBLrReRMk5BM/u6i+hVMfCgvSSfooRPBm1dqfI7+q5Jg/gfxmC/EGG/qSiEq
         PbGzZOGrMdj6x1To16LSiMHdUzIyZ/Ev4zK3l+P56JFWO0+NDy/3NznIAE4rmQmqio8G
         MQ37Bo7TB9d2O6o7ndD0Gx14lY+km4itbBX1b2A2w8nJB6uswZTXOnG3mNhd1d2fsuWP
         JjPk9rJCvwrAYj2p1YXfCoNkPyPkNy2EkASUY+qv3/e3/kusjehhMWK5QxnD1zKOZ0am
         ugIw==
X-Gm-Message-State: AOAM530xSLDOAfg7EqwiRqJt1mh91Q103r3VkXmXAEy1+2kA3jPM+Gle
        scLWhKZkZpGeOLZaZGvPqGOC3W46gyNBMU9df2u1TGTQ9n4GWkUkpHw8IljgBBLQPXLhDbAcXEb
        1RoH08s3/v4A3Cfu3PFd7fQ0BdgmqkeGkIqsKITM=
X-Received: by 2002:a17:90a:2f24:b0:1bb:7cc8:825d with SMTP id s33-20020a17090a2f2400b001bb7cc8825dmr1501100pjd.246.1645015377940;
        Wed, 16 Feb 2022 04:42:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz1Qhg91R8vraeAWegJE+/DcGrH/Ns0jiLju42Hxo36DnAV88znHxm/QOrone/Lv9HUDR7AaY6Dv5YXZBzmpw=
X-Received: by 2002:a17:90a:2f24:b0:1bb:7cc8:825d with SMTP id
 s33-20020a17090a2f2400b001bb7cc8825dmr1501054pjd.246.1645015377455; Wed, 16
 Feb 2022 04:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20220203143226.4023622-1-benjamin.tissoires@redhat.com>
 <20220203143226.4023622-11-benjamin.tissoires@redhat.com> <CAF8JNhKbEWj1b4o2Uv7snXa_JGt0bk5wyUGP4_77aHTLhPRT3w@mail.gmail.com>
 <CAF8JNhLeOn==FhaujjYY7o+f3J7xQcitdUUUJOOeZL1QEGKhRA@mail.gmail.com>
 <CAO-hwJ+NVb=Z0=1jeLuCFjGPAXnjn6hgHDjWx0+ETcE3uQhhzQ@mail.gmail.com>
 <CAF8JNhLUWJXbWG2rsYZvemm+3LbHA0QwAND05h9oM74LKDAfLA@mail.gmail.com> <CAO-hwJJcfA4keCgSyszrs9RF__AbqS8YNJ+MW2+bPgTiwzoiwg@mail.gmail.com>
In-Reply-To: <CAO-hwJJcfA4keCgSyszrs9RF__AbqS8YNJ+MW2+bPgTiwzoiwg@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Wed, 16 Feb 2022 13:42:45 +0100
Message-ID: <CAO-hwJJN8Pxgfqzeq4ZVkjTJ45GcQxFzSeFKS7zyfJjJfckhLw@mail.gmail.com>
Subject: Re: [PATCH v2 10/12] HID: input: remove the need for HID_QUIRK_INVERT
To:     Ping Cheng <pinglinux@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Ahelenia_Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Jason Gerecke <killertofu@gmail.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Ping,

[bringing back the public ML]

On Tue, Feb 15, 2022 at 9:51 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Tue, Feb 15, 2022 at 3:04 AM Ping Cheng <pinglinux@gmail.com> wrote:
> >
> > On Mon, Feb 14, 2022 at 2:23 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > Hi Ping,
> > >
> > > On Thu, Feb 10, 2022 at 6:44 AM Ping Cheng <pinglinux@gmail.com> wrote:
> > > >
> > > > Sorry for the noise. Hit the wrong buttons...
> > > >
> > > > On Wed, Feb 9, 2022 at 9:21 PM Ping Cheng <pinglinux@gmail.com> wrote:
> > > > >
> > > > > On Thu, Feb 3, 2022 at 6:33 AM Benjamin Tissoires
> > > > > <benjamin.tissoires@redhat.com> wrote:
> > > > > >
> > > > > > HID_QUIRK_INVERT is kind of complex to deal with and was bogus.
> > > > > >
> > > > > > Furthermore, it didn't make sense to use a global per struct hid_device
> > > > > > quirk for something dynamic as the current state.
> > > > > >
> > > > > > Store the current tool information in the report itself, and re-order
> > > > > > the processing of the fields to enforce having all the tablet "state"
> > > > > > fields before getting to In Range and other input fields.
> > > > > >
> > > > > > This way, we now have all the information whether a tool is present
> > > > > > or not while processing In Range.
> > > > > >
> > > > > > This new behavior enforces that only one tool gets forwarded to userspace
> > > > > > at the same time, and that if either eraser or invert is set, we enforce
> > > > > > BTN_TOOL_RUBBER.
> > > > > >
> > > > > > Note that the release of the previous tool now happens in its own EV_SYN
> > > > > > report so userspace doesn't get confused by having 2 tools.
> > > > > >
> > > > > > These changes are tested in the following hid-tools regression tests:
> > > > > > https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/127
> > > > > >
> > > > > > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > > > > >
> > > > > > ---
> > > > > >
> > > > > > Changes in v2:
> > > > > > - rework the entire tool switching, this makes the processing
> > > > > >   slightly more complex but is better for existing userspace.
> > > > > > ---
> > > > > >  drivers/hid/hid-input.c | 98 +++++++++++++++++++++++++++++++++++++----
> > > > > >  include/linux/hid.h     |  6 ++-
> > > > > >  2 files changed, 95 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > > > > > index 61d91117f4ae..9f8853640648 100644
> > > > > > --- a/drivers/hid/hid-input.c
> > > > > > +++ b/drivers/hid/hid-input.c
> > > > > > @@ -63,8 +63,11 @@ static const struct {
> > > > > >   * This still leaves us 65535 individual priority values.
> > > > > >   */
> > > > > >  static const __u32 hidinput_usages_priorities[] = {
> > > > > > +       HID_DG_ERASER,          /* Eraser (eraser touching) must always come before tipswitch */
> > > > > >         HID_DG_INVERT,          /* Invert must always come before In Range */
> > > > > > -       HID_DG_INRANGE,
> > > > > > +       HID_DG_TIPSWITCH,       /* Is the tip of the tool touching? */
> > > > > > +       HID_DG_TIPPRESSURE,     /* Tip Pressure might emulate tip switch */
> > > > > > +       HID_DG_INRANGE,         /* In Range needs to come after the other tool states */
> > > > > >  };
> > > > > >
> > > > > >  #define map_abs(c)     hid_map_usage(hidinput, usage, &bit, &max, EV_ABS, (c))
> > > > > > @@ -1365,9 +1368,38 @@ static void hidinput_handle_scroll(struct hid_usage *usage,
> > > > > >         input_event(input, EV_REL, usage->code, hi_res);
> > > > > >  }
> > > > > >
> > > > > > +static void hid_report_release_tool(struct hid_report *report, struct input_dev *input,
> > > > > > +                                   unsigned int tool)
> > > > > > +{
> > > > > > +       /* if the given tool is not currently reported, ignore */
> > > > > > +       if (!test_bit(tool, input->key))
> > > > > > +               return;
> > > > > > +
> > > > > > +       /*
> > > > > > +        * if the given tool was previously set, release it,
> > > > > > +        * release any TOUCH and send an EV_SYN
> > > > > > +        */
> > > > > > +       input_event(input, EV_KEY, BTN_TOUCH, 0);
> > > > > > +       input_event(input, EV_KEY, tool, 0);
> > > >
> > > > Took a while for me to find the right device and setup the proper
> > > > system for the testing. This block missing the serial number:
> > > >
> > > >         input_event(input, EV_MSC, MSC_SERIAL, 0);
> > > >
> > > > Without this line, the next tool will not get its serial number.
> > >
> > > I am tempted to simply disregard this request. It has been known for
> > > ages that the evdev values are cached, so if you do not have the value
> > > you need that means that the value has been sent previously (or you
> > > can request it upon start with an ioctl). So in this particular case,
> > > I don't really see the logic in forcing the SERIAL into the TOOL type
> > > when the tool is clearly unrelated to the serial.
> > >
> > > My fear here is that by linking together too many axes, we may enter
> > > in a state where we can not untangle them when needed.
> >
> > I see your point. We indeed added those ioctl's in the X driver to
> > avoid missing the initial states of some of the key events.
> >
> > > >
> > > > > > +       input_event(input, EV_SYN, SYN_REPORT, 0);
> > > > > > +
> > > > > > +       report->tool = 0;
> > > > > > +}
> > > > > > +
> > > > > > +static void hid_report_set_tool(struct hid_report *report, struct input_dev *input,
> > > > > > +                               unsigned int new_tool)
> > > > > > +{
> > > > > > +       if (report->tool != new_tool)
> > > > > > +               hid_report_release_tool(report, input, report->tool);
> > > > > > +
> > > > > > +       input_event(input, EV_KEY, new_tool, 1);
> > > > > > +       report->tool = new_tool;
> > > > > > +}
> > > > > > +
> > > > > >  void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, __s32 value)
> > > > > >  {
> > > > > >         struct input_dev *input;
> > > > > > +       struct hid_report *report = field->report;
> > > > > >         unsigned *quirks = &hid->quirks;
> > > > > >
> > > > > >         if (!usage->type)
> > > > > > @@ -1418,25 +1450,75 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
> > > > > >         }
> > > > > >
> > > > > >         switch (usage->hid) {
> > > > > > +       case HID_DG_ERASER:
> > > > > > +               report->tool_active |= !!value;
> > > > > > +
> > > > > > +               /*
> > > > > > +                * if eraser is set, we must enforce BTN_TOOL_RUBBER
> > > > > > +                * to accommodate for devices not following the spec.
> > > > > > +                */
> > > > > > +               if (value)
> > > > > > +                       hid_report_set_tool(report, input, BTN_TOOL_RUBBER);
> > > > > > +               else if (report->tool != BTN_TOOL_RUBBER)
> > > > > > +                       /* value is off, tool is not rubber, ignore */
> > > > > > +                       return;
> > > > > > +
> > > > > > +               /* let hid-input set BTN_TOUCH */
> > > > > > +               break;
> > > > > > +
> > > > > >         case HID_DG_INVERT:
> > > > > > -               *quirks = value ? (*quirks | HID_QUIRK_INVERT) : (*quirks & ~HID_QUIRK_INVERT);
> > > > > > +               report->tool_active |= !!value;
> > > > > > +
> > > > > > +               /*
> > > > > > +                * If invert is set, we store BTN_TOOL_RUBBER.
> > > > > > +                */
> > > > > > +               if (value)
> > > > > > +                       hid_report_set_tool(report, input, BTN_TOOL_RUBBER);
> > > > > > +               else if (!report->tool_active)
> > > > > > +                       /* tool_active not set means Invert and Eraser are not set */
> > > > > > +                       hid_report_release_tool(report, input, BTN_TOOL_RUBBER);
> > > > > > +
> > > > > > +               /* no further processing */
> > > > > >                 return;
> > > > > >
> > > > > >         case HID_DG_INRANGE:
> > > > > > -               if (value) {
> > > > > > -                       input_event(input, usage->type, (*quirks & HID_QUIRK_INVERT) ? BTN_TOOL_RUBBER : usage->code, 1);
> > > > > > -                       return;
> > > > > > +               report->tool_active |= !!value;
> > > > > > +
> > > > > > +               if (report->tool_active) {
> > > > > > +                       /*
> > > > > > +                        * if tool is not set but is marked as active,
> > > > > > +                        * assume ours
> > > > > > +                        */
> > > > > > +                       if (!report->tool)
> > > > > > +                               hid_report_set_tool(report, input, usage->code);
> > > > > > +               } else {
> > > > > > +                       hid_report_release_tool(report, input, usage->code);
> > > > > >                 }
> > > > > > -               input_event(input, usage->type, usage->code, 0);
> > > > > > -               input_event(input, usage->type, BTN_TOOL_RUBBER, 0);
> > > > > > +
> > > > > > +               /* reset tool_active for the next event */
> > > > > > +               report->tool_active = false;
> > > > > > +
> > > > > > +               /* no further processing */
> > > > > >                 return;
> > > > > >
> > > > > > +       case HID_DG_TIPSWITCH:
> > > > > > +               report->tool_active |= !!value;
> > > > > > +
> > > > > > +               /* if tool is set to RUBBER we should ignore the current value */
> > > > > > +               if (report->tool == BTN_TOOL_RUBBER)
> > > > > > +                       return;
> > > >
> > > > This case should return before HID_DG_INVERT is checked since we may
> > > > get TIPSWITCH bit before INVERT. In fact, the device that I tested
> > > > sends the tipswatch bit before the invert bit. So, I alway get a PEN
> > > > in and out before I get ERASER events, when I bring the pen in with
> > > > the side-switch/invert bit pressed.
> > > >
> > > > However, we know not all devices support INVERT. We probably have to
> > > > keep the invert quirk to decide if BTN_TOOL_PEN should be set here or
> > > > wait until HID_DG_INVERT is reached.
> > >
> > > I am under the impression that you completely missed the point of the
> > > patch series. This series re-orders the processing of the events, and
> > > if you look at the very first hunk in this patch, you'll see that the
> > > new processing ensures we treat INVERT and ERASER before TIPSWITCH, no
> > > matter the order of the device.
> >
> > Yeah, I read that part of the code, more than once. But, my evtest
> > gave me an extra set of TOOL_PEN events before TOOL_ERASER. I was
> > confused too. Then I thought maybe the code still relies on the actual
> > order of the usages. Anyway, we've done enough discussion and testing,
> > let's move on. The patchset is:
> >
> > Reviewed-by: Ping Cheng <ping.cheng@wacom.com>
> > Tested-by: Ping Cheng <ping.cheng@wacom.com>
>
> Thanks for the review.
>
>  However, if the device is not working as expected, can you send me
> the hid-recorder[0] output off list so I can diagnose what is
> happening?

Thanks for sending me the records (privately).

And a quick look at it and it explained that spurious BTN_TOOL change.
If you look at the recordings where you take the stylus in proximity
with the eraser button pressed, you'll see:

# ReportID: 20 / Tip Switch: 0 | Barrel Switch: 0 | Eraser: 0 |
Invert: 0 | Secondary Barrel Switch: 0 | In Range: 1 | # | X:  18699 |
Y:  11537 | Tip Pressure:      0 | 0xff00005b: -32661 | Transducer
Serial Number:   509392226 | Undefined:    1 | Battery Strength:  255
| X Tilt:   23 | Y Tilt:    0
E: 000000.000000 18 14 20 0b 49 11 2d 00 00 6b 80 62 b5 5c 1e 01 ff 17 00
# ReportID: 20 / Tip Switch: 0 | Barrel Switch: 0 | Eraser: 0 |
Invert: 0 | Secondary Barrel Switch: 0 | In Range: 0 | # | X:  18699 |
Y:  11537 | Tip Pressure:      0 | 0xff00005b: -32661 | Transducer
Serial Number:   509392226 | Undefined:    1 | Battery Strength:    0
| X Tilt:   23 | Y Tilt:    0
E: 000000.001988 18 14 00 0b 49 11 2d 00 00 6b 80 62 b5 5c 1e 01 00 17 00
# ReportID: 20 / Tip Switch: 0 | Barrel Switch: 0 | Eraser: 0 |
Invert: 1 | Secondary Barrel Switch: 0 | In Range: 1 | # | X:  18696 |
Y:  11543 | Tip Pressure:      0 | 0xff00005b: -32661 | Transducer
Serial Number:   509392226 | Undefined:    1 | Battery Strength:    0
| X Tilt:   23 | Y Tilt:    0
E: 000000.003002 18 14 28 08 49 17 2d 00 00 6b 80 62 b5 5c 1e 01 00 17 00

So the firmware first emits a tip event (Eraser: 0 | Invert: 0 | In
Range: 1), then realizes there is an invert incoming so it sends an
out of prox (Eraser: 0 | Invert: 0 | In Range: 0) and then the eraser
in (Eraser: 0 | Invert: 1 | In Range: 1).

So:
- your pen is actually following the spec from Microsoft, i.e., it
doesn't switch from in-range without erasing to in-range with erasing
without going through out-of-prox, which means it is probably well
supported in the Windows world
- your firmware is not fast enough to detect the invert bit and papers
over it (but honestly, who cares that this quick event comes in).

There is not much we can do, so I consider this "failure" to be
expected and the code is behaving properly.

Cheers,
Benjamin

>
> Cheers,
> Benjamin
>
> [0] clone https://gitlab.freedesktop.org/libevdev/hid-tools, then pip
> install ., then `sudo hid-recorder`
>
> >
> > Thank you for your effort, Benjamin!
> > Ping
> >
> > > So when we process TIPSWITCH here, we are sure that if BTN_TOOL_RUBBER
> > > is set, either INVERT or ERASER is set to 1, whether or not they come
> > > before or after in the report.
> > >
> > > >
> > > > If you are interested in the evtest output, please let me know. I'll
> > > > share it with you offline so we don't abuse this list...
> > >
> > > evtest is the output of the kernel, and it doesn't give me much more
> > > than "it's broken". However, if you can give me the hid-recorder
> > > outputs, I'll be able to reproduce locally and compare the output as I
> > > fix the code. Of course the best would be to add test cases in the
> > > hid-tools repo, but I'll need the hid-recorder anyway to understand
> > > what is failing and to be able to write the tests.
> > >
> > > Cheers,
> > > Benjamin
> > >
> > > >
> > > > Cheers,
> > > > Ping
> > > >
> > > > > > +               break;
> > > > > > +
> > > > > >         case HID_DG_TIPPRESSURE:
> > > > > >                 if (*quirks & HID_QUIRK_NOTOUCH) {
> > > > > >                         int a = field->logical_minimum;
> > > > > >                         int b = field->logical_maximum;
> > > > > >
> > > > > > -                       input_event(input, EV_KEY, BTN_TOUCH, value > a + ((b - a) >> 3));
> > > > > > +                       if (value > a + ((b - a) >> 3)) {
> > > > > > +                               input_event(input, EV_KEY, BTN_TOUCH, 1);
> > > > > > +                               report->tool_active = true;
> > > > > > +                       }
> > > > > >                 }
> > > > > >                 break;
> > > > > >
> > > > > > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > > > > > index eaad0655b05c..feb8df61168f 100644
> > > > > > --- a/include/linux/hid.h
> > > > > > +++ b/include/linux/hid.h
> > > > > > @@ -347,7 +347,7 @@ struct hid_item {
> > > > > >   */
> > > > > >  #define MAX_USBHID_BOOT_QUIRKS 4
> > > > > >
> > > > > > -#define HID_QUIRK_INVERT                       BIT(0)
> > > > > > +/* BIT(0) reserved for backward compatibility, was HID_QUIRK_INVERT */
> > > > > >  #define HID_QUIRK_NOTOUCH                      BIT(1)
> > > > > >  #define HID_QUIRK_IGNORE                       BIT(2)
> > > > > >  #define HID_QUIRK_NOGET                                BIT(3)
> > > > > > @@ -515,6 +515,10 @@ struct hid_report {
> > > > > >         unsigned maxfield;                              /* maximum valid field index */
> > > > > >         unsigned size;                                  /* size of the report (bits) */
> > > > > >         struct hid_device *device;                      /* associated device */
> > > > > > +
> > > > > > +       /* tool related state */
> > > > > > +       bool tool_active;                               /* whether the current tool is active */
> > > > > > +       unsigned int tool;                              /* BTN_TOOL_* */
> > > > > >  };
> > > > > >
> > > > > >  #define HID_MAX_IDS 256
> > > > > > --
> > > > > > 2.33.1
> > > > > >
> > > >
> > >
> >

