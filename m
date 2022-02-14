Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8A14B4D51
	for <lists+linux-input@lfdr.de>; Mon, 14 Feb 2022 12:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349741AbiBNLAZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Feb 2022 06:00:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349859AbiBNLAS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Feb 2022 06:00:18 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AA2574DF73
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 02:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644834420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6TPEPp8lcFzXctKk7ZApmA9jC/I/QucVeVU53xLxi+g=;
        b=XcCqUrour6fqxQRTwq+bUg4J02UiCKu8Re51SchL6t66w3fZeLJryn2kf/j+VVO28PvzsZ
        aZvrBPYqI71VsKYSY94Bru6KbxzV1E/P+Y8EZIPjpZ4PMa+byMxEwzuhSM04OSrVpF8eYu
        BQ4heqN4vWAEaHXrR/GodiyFb8/R4gY=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-436-iSePH8ZjMJeh9NPOMZ4GEQ-1; Mon, 14 Feb 2022 05:23:17 -0500
X-MC-Unique: iSePH8ZjMJeh9NPOMZ4GEQ-1
Received: by mail-pj1-f70.google.com with SMTP id f6-20020a17090a654600b001b9e4758439so924271pjs.1
        for <linux-input@vger.kernel.org>; Mon, 14 Feb 2022 02:23:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6TPEPp8lcFzXctKk7ZApmA9jC/I/QucVeVU53xLxi+g=;
        b=cF3zroXbrQ770LVO5SZxg8rt9FVrjVPymgFmz5A5mogWlWEbDXDnGsrGgMjM1lUzxq
         Cp5WVduEXfdiVR00OFa1TFxKSwauQvu6/w8pDs6H+ACvl72pXO0Hq8BAvQFqdzjNRmzJ
         vJXKJtfsO6CRBk3b37JwpIDV/NzMGfqDSOqBv+7Lo1WrpUbAPxylo9HL1wFndltSu7WC
         dzIOZyuFTrvanadZTRhhhdy3WJ7ytBV40Bz7rRgxzGf2wA3oryo+0MZcThKGMgS/h6Sz
         VNsP2av6opBC7fcL0vHr4GG4CfxK7wcK7NEeNxiy1gaW6JkclPqsvENHzm7M1XAfqtIg
         DRwA==
X-Gm-Message-State: AOAM530ZU3VsYmV+xSD6hoJB5IitYq9hxRvZVkk44G+WUKgkyQGwUY8G
        xa/t5ZdsZ3K7aAm/jXOTnlPXuEX4+vwfE5ChTRRZRh7WDh+BIS3VVzv4/mspekWrmy2I4E1qJ+5
        uGdPawpIGYG0Wnqyj+Z7KzO10L5r+zqliw9a3+D0=
X-Received: by 2002:a05:6a00:1345:: with SMTP id k5mr13731951pfu.29.1644834195758;
        Mon, 14 Feb 2022 02:23:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzV7L7txf/apdAnsNFwR76mzcRePnDHhZfG9BbMc/xvB5UXamYC+GfFVEbCqHJNuuWRHYeWDMQhIKsxedx9K2s=
X-Received: by 2002:a05:6a00:1345:: with SMTP id k5mr13731930pfu.29.1644834195408;
 Mon, 14 Feb 2022 02:23:15 -0800 (PST)
MIME-Version: 1.0
References: <20220203143226.4023622-1-benjamin.tissoires@redhat.com>
 <20220203143226.4023622-11-benjamin.tissoires@redhat.com> <CAF8JNhKbEWj1b4o2Uv7snXa_JGt0bk5wyUGP4_77aHTLhPRT3w@mail.gmail.com>
 <CAF8JNhLeOn==FhaujjYY7o+f3J7xQcitdUUUJOOeZL1QEGKhRA@mail.gmail.com>
In-Reply-To: <CAF8JNhLeOn==FhaujjYY7o+f3J7xQcitdUUUJOOeZL1QEGKhRA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 14 Feb 2022 11:23:04 +0100
Message-ID: <CAO-hwJ+NVb=Z0=1jeLuCFjGPAXnjn6hgHDjWx0+ETcE3uQhhzQ@mail.gmail.com>
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

On Thu, Feb 10, 2022 at 6:44 AM Ping Cheng <pinglinux@gmail.com> wrote:
>
> Sorry for the noise. Hit the wrong buttons...
>
> On Wed, Feb 9, 2022 at 9:21 PM Ping Cheng <pinglinux@gmail.com> wrote:
> >
> > On Thu, Feb 3, 2022 at 6:33 AM Benjamin Tissoires
> > <benjamin.tissoires@redhat.com> wrote:
> > >
> > > HID_QUIRK_INVERT is kind of complex to deal with and was bogus.
> > >
> > > Furthermore, it didn't make sense to use a global per struct hid_device
> > > quirk for something dynamic as the current state.
> > >
> > > Store the current tool information in the report itself, and re-order
> > > the processing of the fields to enforce having all the tablet "state"
> > > fields before getting to In Range and other input fields.
> > >
> > > This way, we now have all the information whether a tool is present
> > > or not while processing In Range.
> > >
> > > This new behavior enforces that only one tool gets forwarded to userspace
> > > at the same time, and that if either eraser or invert is set, we enforce
> > > BTN_TOOL_RUBBER.
> > >
> > > Note that the release of the previous tool now happens in its own EV_SYN
> > > report so userspace doesn't get confused by having 2 tools.
> > >
> > > These changes are tested in the following hid-tools regression tests:
> > > https://gitlab.freedesktop.org/libevdev/hid-tools/-/merge_requests/127
> > >
> > > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > >
> > > ---
> > >
> > > Changes in v2:
> > > - rework the entire tool switching, this makes the processing
> > >   slightly more complex but is better for existing userspace.
> > > ---
> > >  drivers/hid/hid-input.c | 98 +++++++++++++++++++++++++++++++++++++----
> > >  include/linux/hid.h     |  6 ++-
> > >  2 files changed, 95 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
> > > index 61d91117f4ae..9f8853640648 100644
> > > --- a/drivers/hid/hid-input.c
> > > +++ b/drivers/hid/hid-input.c
> > > @@ -63,8 +63,11 @@ static const struct {
> > >   * This still leaves us 65535 individual priority values.
> > >   */
> > >  static const __u32 hidinput_usages_priorities[] = {
> > > +       HID_DG_ERASER,          /* Eraser (eraser touching) must always come before tipswitch */
> > >         HID_DG_INVERT,          /* Invert must always come before In Range */
> > > -       HID_DG_INRANGE,
> > > +       HID_DG_TIPSWITCH,       /* Is the tip of the tool touching? */
> > > +       HID_DG_TIPPRESSURE,     /* Tip Pressure might emulate tip switch */
> > > +       HID_DG_INRANGE,         /* In Range needs to come after the other tool states */
> > >  };
> > >
> > >  #define map_abs(c)     hid_map_usage(hidinput, usage, &bit, &max, EV_ABS, (c))
> > > @@ -1365,9 +1368,38 @@ static void hidinput_handle_scroll(struct hid_usage *usage,
> > >         input_event(input, EV_REL, usage->code, hi_res);
> > >  }
> > >
> > > +static void hid_report_release_tool(struct hid_report *report, struct input_dev *input,
> > > +                                   unsigned int tool)
> > > +{
> > > +       /* if the given tool is not currently reported, ignore */
> > > +       if (!test_bit(tool, input->key))
> > > +               return;
> > > +
> > > +       /*
> > > +        * if the given tool was previously set, release it,
> > > +        * release any TOUCH and send an EV_SYN
> > > +        */
> > > +       input_event(input, EV_KEY, BTN_TOUCH, 0);
> > > +       input_event(input, EV_KEY, tool, 0);
>
> Took a while for me to find the right device and setup the proper
> system for the testing. This block missing the serial number:
>
>         input_event(input, EV_MSC, MSC_SERIAL, 0);
>
> Without this line, the next tool will not get its serial number.

I am tempted to simply disregard this request. It has been known for
ages that the evdev values are cached, so if you do not have the value
you need that means that the value has been sent previously (or you
can request it upon start with an ioctl). So in this particular case,
I don't really see the logic in forcing the SERIAL into the TOOL type
when the tool is clearly unrelated to the serial.

My fear here is that by linking together too many axes, we may enter
in a state where we can not untangle them when needed.

>
> > > +       input_event(input, EV_SYN, SYN_REPORT, 0);
> > > +
> > > +       report->tool = 0;
> > > +}
> > > +
> > > +static void hid_report_set_tool(struct hid_report *report, struct input_dev *input,
> > > +                               unsigned int new_tool)
> > > +{
> > > +       if (report->tool != new_tool)
> > > +               hid_report_release_tool(report, input, report->tool);
> > > +
> > > +       input_event(input, EV_KEY, new_tool, 1);
> > > +       report->tool = new_tool;
> > > +}
> > > +
> > >  void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct hid_usage *usage, __s32 value)
> > >  {
> > >         struct input_dev *input;
> > > +       struct hid_report *report = field->report;
> > >         unsigned *quirks = &hid->quirks;
> > >
> > >         if (!usage->type)
> > > @@ -1418,25 +1450,75 @@ void hidinput_hid_event(struct hid_device *hid, struct hid_field *field, struct
> > >         }
> > >
> > >         switch (usage->hid) {
> > > +       case HID_DG_ERASER:
> > > +               report->tool_active |= !!value;
> > > +
> > > +               /*
> > > +                * if eraser is set, we must enforce BTN_TOOL_RUBBER
> > > +                * to accommodate for devices not following the spec.
> > > +                */
> > > +               if (value)
> > > +                       hid_report_set_tool(report, input, BTN_TOOL_RUBBER);
> > > +               else if (report->tool != BTN_TOOL_RUBBER)
> > > +                       /* value is off, tool is not rubber, ignore */
> > > +                       return;
> > > +
> > > +               /* let hid-input set BTN_TOUCH */
> > > +               break;
> > > +
> > >         case HID_DG_INVERT:
> > > -               *quirks = value ? (*quirks | HID_QUIRK_INVERT) : (*quirks & ~HID_QUIRK_INVERT);
> > > +               report->tool_active |= !!value;
> > > +
> > > +               /*
> > > +                * If invert is set, we store BTN_TOOL_RUBBER.
> > > +                */
> > > +               if (value)
> > > +                       hid_report_set_tool(report, input, BTN_TOOL_RUBBER);
> > > +               else if (!report->tool_active)
> > > +                       /* tool_active not set means Invert and Eraser are not set */
> > > +                       hid_report_release_tool(report, input, BTN_TOOL_RUBBER);
> > > +
> > > +               /* no further processing */
> > >                 return;
> > >
> > >         case HID_DG_INRANGE:
> > > -               if (value) {
> > > -                       input_event(input, usage->type, (*quirks & HID_QUIRK_INVERT) ? BTN_TOOL_RUBBER : usage->code, 1);
> > > -                       return;
> > > +               report->tool_active |= !!value;
> > > +
> > > +               if (report->tool_active) {
> > > +                       /*
> > > +                        * if tool is not set but is marked as active,
> > > +                        * assume ours
> > > +                        */
> > > +                       if (!report->tool)
> > > +                               hid_report_set_tool(report, input, usage->code);
> > > +               } else {
> > > +                       hid_report_release_tool(report, input, usage->code);
> > >                 }
> > > -               input_event(input, usage->type, usage->code, 0);
> > > -               input_event(input, usage->type, BTN_TOOL_RUBBER, 0);
> > > +
> > > +               /* reset tool_active for the next event */
> > > +               report->tool_active = false;
> > > +
> > > +               /* no further processing */
> > >                 return;
> > >
> > > +       case HID_DG_TIPSWITCH:
> > > +               report->tool_active |= !!value;
> > > +
> > > +               /* if tool is set to RUBBER we should ignore the current value */
> > > +               if (report->tool == BTN_TOOL_RUBBER)
> > > +                       return;
>
> This case should return before HID_DG_INVERT is checked since we may
> get TIPSWITCH bit before INVERT. In fact, the device that I tested
> sends the tipswatch bit before the invert bit. So, I alway get a PEN
> in and out before I get ERASER events, when I bring the pen in with
> the side-switch/invert bit pressed.
>
> However, we know not all devices support INVERT. We probably have to
> keep the invert quirk to decide if BTN_TOOL_PEN should be set here or
> wait until HID_DG_INVERT is reached.

I am under the impression that you completely missed the point of the
patch series. This series re-orders the processing of the events, and
if you look at the very first hunk in this patch, you'll see that the
new processing ensures we treat INVERT and ERASER before TIPSWITCH, no
matter the order of the device.

So when we process TIPSWITCH here, we are sure that if BTN_TOOL_RUBBER
is set, either INVERT or ERASER is set to 1, whether or not they come
before or after in the report.

>
> If you are interested in the evtest output, please let me know. I'll
> share it with you offline so we don't abuse this list...

evtest is the output of the kernel, and it doesn't give me much more
than "it's broken". However, if you can give me the hid-recorder
outputs, I'll be able to reproduce locally and compare the output as I
fix the code. Of course the best would be to add test cases in the
hid-tools repo, but I'll need the hid-recorder anyway to understand
what is failing and to be able to write the tests.

Cheers,
Benjamin

>
> Cheers,
> Ping
>
> > > +               break;
> > > +
> > >         case HID_DG_TIPPRESSURE:
> > >                 if (*quirks & HID_QUIRK_NOTOUCH) {
> > >                         int a = field->logical_minimum;
> > >                         int b = field->logical_maximum;
> > >
> > > -                       input_event(input, EV_KEY, BTN_TOUCH, value > a + ((b - a) >> 3));
> > > +                       if (value > a + ((b - a) >> 3)) {
> > > +                               input_event(input, EV_KEY, BTN_TOUCH, 1);
> > > +                               report->tool_active = true;
> > > +                       }
> > >                 }
> > >                 break;
> > >
> > > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > > index eaad0655b05c..feb8df61168f 100644
> > > --- a/include/linux/hid.h
> > > +++ b/include/linux/hid.h
> > > @@ -347,7 +347,7 @@ struct hid_item {
> > >   */
> > >  #define MAX_USBHID_BOOT_QUIRKS 4
> > >
> > > -#define HID_QUIRK_INVERT                       BIT(0)
> > > +/* BIT(0) reserved for backward compatibility, was HID_QUIRK_INVERT */
> > >  #define HID_QUIRK_NOTOUCH                      BIT(1)
> > >  #define HID_QUIRK_IGNORE                       BIT(2)
> > >  #define HID_QUIRK_NOGET                                BIT(3)
> > > @@ -515,6 +515,10 @@ struct hid_report {
> > >         unsigned maxfield;                              /* maximum valid field index */
> > >         unsigned size;                                  /* size of the report (bits) */
> > >         struct hid_device *device;                      /* associated device */
> > > +
> > > +       /* tool related state */
> > > +       bool tool_active;                               /* whether the current tool is active */
> > > +       unsigned int tool;                              /* BTN_TOOL_* */
> > >  };
> > >
> > >  #define HID_MAX_IDS 256
> > > --
> > > 2.33.1
> > >
>

