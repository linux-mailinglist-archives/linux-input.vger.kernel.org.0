Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63E1C4F3F93
	for <lists+linux-input@lfdr.de>; Tue,  5 Apr 2022 23:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237945AbiDEOJu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Apr 2022 10:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350839AbiDEOBc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Apr 2022 10:01:32 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB8E5151D3E
        for <linux-input@vger.kernel.org>; Tue,  5 Apr 2022 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649163441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R/dZv88mif40xvfYFzAW5ay2UFGS5gGYbkhNxSHCKNo=;
        b=c/x8epXo3xAq05QF8iV3OmSkhPqlOJIDe60ZJBHtqBb7YVikhFrDSntmkj+anhDmQqzvGE
        ZLovWPpvawpE5ycWn1aLcQDAuoWYTHqLxs0G3fJei/y+5C3iIvX4GdvX0aLcOCB+WsNMh+
        iYGrbq4Y/08M8AsUD418899wd4pO0Gg=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-_sUyyWG_O967WpEuECzkSw-1; Tue, 05 Apr 2022 08:57:20 -0400
X-MC-Unique: _sUyyWG_O967WpEuECzkSw-1
Received: by mail-pl1-f199.google.com with SMTP id r16-20020a170903021000b00155f7af17b6so4919021plh.16
        for <linux-input@vger.kernel.org>; Tue, 05 Apr 2022 05:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R/dZv88mif40xvfYFzAW5ay2UFGS5gGYbkhNxSHCKNo=;
        b=ozktJM149DKq/gxKU3ra44odCRNaq5XMSp2pBp83rvGGNAX88+Prux2PfmSCsqtr86
         2Z3UY9btkSgI4YhDw4oCLZmG56OAV/rQvIj03TAc7IYSOtuBRN1pzosv21Vx8FwmSZyQ
         N/f9eRlU589kLx/EfYdtiItovNf1xnLcmhUhXllTCkQZS1I7edSVD/rN/MVRHwYxX1xH
         l9M3E6R2dVWv+Q2+wmNnVHTAwa6CuWeGnRJUnJ4jLUw13HzWUOB+Bb+22NFVj8L/10py
         RzGBa1Zc2vLjDrOURWvN3YMSuxUTwTdR/SgjkibWD8xWqfVTWpXEok2bKWd4rCRCD9lP
         SUNw==
X-Gm-Message-State: AOAM532JuKSurTmJAUiluClPt/l+/Ke9FA2cvRa7SELNMcnbOTjgSEOW
        gXvAoCjgyLNOjf6Qncfba6A9Hqn2gnc22JSjTspsr0nW7KiiQKHR7Co9s5Ax4VDNO40J1AsEG7v
        Uy3eRmuZYuwaiAlcySE0iYlNMmqSsrogABm15WPY=
X-Received: by 2002:a63:6c0a:0:b0:398:6bd2:a16a with SMTP id h10-20020a636c0a000000b003986bd2a16amr2806283pgc.191.1649163438947;
        Tue, 05 Apr 2022 05:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzkkTan9ki8fwbVhdOXygGbONh1iQnsu6VKqe9P00beaMAYW0ki5p2p6SHrOc1Pss2wVlkG1G6vJo0jZiIFrI=
X-Received: by 2002:a63:6c0a:0:b0:398:6bd2:a16a with SMTP id
 h10-20020a636c0a000000b003986bd2a16amr2806256pgc.191.1649163438480; Tue, 05
 Apr 2022 05:57:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220331144500.2340714-1-acz@semihalf.com> <CAB4aORW_1ScMDBcvn8WU+2m6_xmv-nkjQuPHfwTD9vnWMNQhiA@mail.gmail.com>
In-Reply-To: <CAB4aORW_1ScMDBcvn8WU+2m6_xmv-nkjQuPHfwTD9vnWMNQhiA@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 5 Apr 2022 14:57:07 +0200
Message-ID: <CAO-hwJLDADovq-pu9ovcqYBi8DRLJE1xsNOzwtnypethcGYOtw@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Implement MT_QUIRK_DROP_REPEATED_SLOT
To:     Angela Czubak <acz@semihalf.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Angela,

On Tue, Apr 5, 2022 at 1:25 PM Angela Czubak <acz@semihalf.com> wrote:
>
> Hi Benjamin, Hi Jiri,
>
> any thoughts on this patch?

Sorry for taking too long to answer. I saw the patch coming in while
coming back last week, and could not process it, and completely forgot
about it.

> If you believe that the userspace input stack should be a better place
> to solve this kind of issue, please let me know.

This is definitely not userspace to process those specificities, as
far as I understand. However... I don't understand the bug very well
:/

more inlined below:

>
> Regards,
> Angela
>
> On Thu, Mar 31, 2022 at 4:45 PM Angela Czubak <acz@semihalf.com> wrote:
> >
> > Ilitek touchscreens 016E and 016F repeat last finger position after it has
> > left the surface of the device.
> > We send BTN_TOUCH=0 and ABS_MT_TRACKING_ID=-1 with the first repeated
> > slot as this may mean that the finger has been lifted.
> > The touchscreen is not actually too sensitive and this would
> > modify the behaviour of the on-screen keyboard, for instance holding the
> > backspace key might be sometimes interpreted as removing a single character
> > only. Add counter of repeated frames and if it is significantly big then
> > assume the finger actually remains stationary.

This commit is really confusing to me. This description is mixing
symptoms from before the patch, behaviour from after and userspace
which doesn't mean a lot here not knowing what is the problem.

What is the exact problem?
What events the device is sending?
What should be the expected kernel ouput?

(bonus point for actually giving the events in the hid-recorder output
format [0] ;-P )

FWIW, this driver is one of the few drivers in the HID stack to have
extended tests in hid-tools[0].
I plan to merge that repo into the selftests subtree, but for now we
need to use this external repo.

So I'd be pleased to see new tests added for that quirk because it
seems far from evident what is happening.

> >
> > Signed-off-by: Angela Czubak <acz@semihalf.com>
> > ---
> >
> > Hi guys,
> >
> > Please let me know if you think there is some better solution.
> > It felt to me that it would be more correct to solve it on kernel
> > driver level since this issue is device specific, but perhaps
> > there are some userspace input stacks that figured this problem out.
> > With Chromium OS Input Stack the final BTN_TOUCH=0 event comes
> > significantly late which causes hiccups or simply a scrolling fling
> > not to happen, since the input stack thinks the finger is still
> > in the same position and on the screen.

If the device reports a wrong state, the kernel is the place to fix
it. However, as mentioned above I do not understand what is wrong
there by reading the description and the code.

> >
> >  drivers/hid/hid-ids.h        |   2 +
> >  drivers/hid/hid-multitouch.c | 150 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 149 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > index 053853a891c5..cc85f547603c 100644
> > --- a/drivers/hid/hid-ids.h
> > +++ b/drivers/hid/hid-ids.h
> > @@ -630,6 +630,8 @@
> >
> >  #define USB_VENDOR_ID_ILITEK           0x222a
> >  #define USB_DEVICE_ID_ILITEK_MULTITOUCH        0x0001
> > +#define USB_DEVICE_ID_ILITEK_016E      0x016e
> > +#define USB_DEVICE_ID_ILITEK_016F      0x016f
> >
> >  #define USB_VENDOR_ID_INTEL_0          0x8086
> >  #define USB_VENDOR_ID_INTEL_1          0x8087
> > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > index 99eabfb4145b..33cb5e5179c2 100644
> > --- a/drivers/hid/hid-multitouch.c
> > +++ b/drivers/hid/hid-multitouch.c
> > @@ -71,6 +71,7 @@ MODULE_LICENSE("GPL");
> >  #define MT_QUIRK_SEPARATE_APP_REPORT   BIT(19)
> >  #define MT_QUIRK_FORCE_MULTI_INPUT     BIT(20)
> >  #define MT_QUIRK_DISABLE_WAKEUP                BIT(21)
> > +#define MT_QUIRK_DROP_REPEATED_SLOT    BIT(22)
> >
> >  #define MT_INPUTMODE_TOUCHSCREEN       0x02
> >  #define MT_INPUTMODE_TOUCHPAD          0x03
> > @@ -103,12 +104,22 @@ struct mt_usages {
> >         bool *confidence_state; /* is the touch made by a finger? */
> >  };
> >
> > +struct mt_slot_state {
> > +       __s32 x, y, cx, cy, p, w, h, a;
> > +       __s32 contactid;        /* the device ContactID assigned to this slot */
> > +       bool tip_state; /* is the touch valid? */
> > +       bool inrange_state;     /* is the finger in proximity of the sensor? */
> > +       bool confidence_state;  /* is the touch made by a finger? */
> > +};

This raises a red flag here. I spent quite some time removing internal
slot states, and re-adding them means that something is wrong IMO.
(though if we can not do something else, we might just re-add them).

> > +
> >  struct mt_application {
> >         struct list_head list;
> >         unsigned int application;
> >         unsigned int report_id;
> >         struct list_head mt_usages;     /* mt usages list */
> >
> > +       struct mt_slot_state *mt_slot_state;
> > +
> >         __s32 quirks;
> >
> >         __s32 *scantime;                /* scantime reported */
> > @@ -116,6 +127,11 @@ struct mt_application {
> >
> >         __s32 *raw_cc;                  /* contact count in the report */
> >         int left_button_state;          /* left button state */
> > +       bool touch_change;              /* if touch change detected */
> > +       bool touched;                   /* if touch was present in the last
> > +                                        * message
> > +                                        */

So this is not per-touch, but per report?

> > +       int repeated_counter;           /* how many times last frame repeated */
> >         unsigned int mt_flags;          /* flags to pass to input-mt */
> >
> >         unsigned long *pending_palm_slots;      /* slots where we reported palm
> > @@ -211,6 +227,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
> >  #define MT_CLS_GOOGLE                          0x0111
> >  #define MT_CLS_RAZER_BLADE_STEALTH             0x0112
> >  #define MT_CLS_SMART_TECH                      0x0113
> > +#define MT_CLS_ILITEK_016x                     0x0114
> >
> >  #define MT_DEFAULT_MAXCONTACT  10
> >  #define MT_MAX_MAXCONTACT      250
> > @@ -386,6 +403,15 @@ static const struct mt_class mt_classes[] = {
> >                         MT_QUIRK_CONTACT_CNT_ACCURATE |
> >                         MT_QUIRK_SEPARATE_APP_REPORT,
> >         },
> > +       { .name = MT_CLS_ILITEK_016x,
> > +               .quirks = MT_QUIRK_ALWAYS_VALID |
> > +                       MT_QUIRK_IGNORE_DUPLICATES |
> > +                       MT_QUIRK_HOVERING |
> > +                       MT_QUIRK_CONTACT_CNT_ACCURATE |
> > +                       MT_QUIRK_STICKY_FINGERS |
> > +                       MT_QUIRK_WIN8_PTP_BUTTONS |
> > +                       MT_QUIRK_DROP_REPEATED_SLOT,
> > +               .export_all_inputs = true },
> >         { }
> >  };
> >
> > @@ -783,7 +809,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
> >                 case HID_DG_CONFIDENCE:
> >                         if ((cls->name == MT_CLS_WIN_8 ||
> >                              cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT ||
> > -                            cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP) &&
> > +                            cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP ||
> > +                            cls->name == MT_CLS_ILITEK_016x) &&

Not something you should care about, but this long test of spaghetti
should likely be fixed into something way better at some point...

> >                                 (field->application == HID_DG_TOUCHPAD ||
> >                                  field->application == HID_DG_TOUCHSCREEN))
> >                                 app->quirks |= MT_QUIRK_CONFIDENCE;
> > @@ -948,7 +975,13 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
> >                 input_event(input, EV_KEY, BTN_LEFT, app->left_button_state);
> >
> >         input_mt_sync_frame(input);
> > -       input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> > +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > +               if (app->touch_change)
> > +                       input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> > +               app->touch_change = false;

Why filter out the timestamp?

> > +       } else {
> > +               input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> > +       }
> >         input_sync(input);
> >
> >         mt_release_pending_palms(td, app, input);
> > @@ -993,6 +1026,60 @@ static int mt_touch_event(struct hid_device *hid, struct hid_field *field,
> >         return 1;
> >  }
> >
> > +static void mt_clear_slot_states(struct mt_slot_state *mt_slot_state,
> > +                                int size)
> > +{
> > +       int i;
> > +
> > +       for (i = 0; i < size; i++)
> > +               mt_slot_state[i].tip_state = 0;
> > +}
> > +
> > +static void mt_fill_slot_state(struct mt_slot_state *mt_slot_state,
> > +               struct mt_usages *slot)
> > +{
> > +       mt_slot_state->x = *slot->x;
> > +       mt_slot_state->y = *slot->y;
> > +       mt_slot_state->cx = *slot->cx;
> > +       mt_slot_state->cy = *slot->cy;
> > +       mt_slot_state->p = *slot->p;
> > +       mt_slot_state->w = *slot->w;
> > +       mt_slot_state->h = *slot->h;
> > +       mt_slot_state->a = *slot->a;
> > +       mt_slot_state->contactid = *slot->contactid;
> > +       mt_slot_state->tip_state = *slot->tip_state;
> > +       mt_slot_state->inrange_state = *slot->inrange_state;
> > +       mt_slot_state->confidence_state = *slot->confidence_state;
> > +}
> > +
> > +static bool mt_is_slot_state_equal(struct mt_slot_state *state1,
> > +               struct mt_slot_state *state2)
> > +{
> > +       if (state1->x != state2->x)
> > +               return false;
> > +       if (state1->y != state2->y)
> > +               return false;
> > +       if (state1->cx != state2->cx)
> > +               return false;
> > +       if (state1->cy != state2->cy)
> > +               return false;
> > +       if (state1->p != state2->p)
> > +               return false;
> > +       if (state1->w != state2->w)
> > +               return false;
> > +       if (state1->a != state2->a)
> > +               return false;
> > +       if (state1->contactid != state2->contactid)
> > +               return false;
> > +       if (state1->tip_state != state2->tip_state)
> > +               return false;
> > +       if (state1->inrange_state != state2->inrange_state)
> > +               return false;
> > +       if (state1->confidence_state != state2->confidence_state)
> > +               return false;
> > +       return true;
> > +}

The input stack already filters out duplicated events. So I am not
sure we need to store the information here once again and test for it
here.

> > +
> >  static int mt_process_slot(struct mt_device *td, struct input_dev *input,
> >                             struct mt_application *app,
> >                             struct mt_usages *slot)
> > @@ -1005,6 +1092,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
> >         int active;
> >         int slotnum;
> >         int tool = MT_TOOL_FINGER;
> > +       struct mt_slot_state state = {0};
> >
> >         if (!slot)
> >                 return -EINVAL;
> > @@ -1058,13 +1146,42 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
> >                          * lift-off as userspace will not be aware
> >                          * of non-confidence, so we need to split
> >                          * it into 2 events: active MT_TOOL_PALM
> > -                        * and a separate liftoff.
> > +                        * and a separate lift off.
> >                          */
> >                         active = true;
> >                         set_bit(slotnum, app->pending_palm_slots);
> >                 }
> >         }
> >
> > +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > +               mt_fill_slot_state(&state, slot);
> > +               /* Check if every field in the slot is the same as before.
> > +                * Some touchscreens report the same position for several
> > +                * frames even though the finger is no longer on the surface.
> > +                * This is actually being recognised as the finger remaining in
> > +                * one position, which causes scrolling to be stopped.
> > +                * Ignore such packets so that the scrolling continues
> > +                * and the touchscreen reports the finger liftoff.

That part I understand better, but how is the device reporting such events?
If the touch is no longer there, we should have a bit that says it is
lifted, so we should simply just ignore the touch, no?


> > +                */
> > +               if (!mt_is_slot_state_equal(&state,
> > +                                           &app->mt_slot_state[slotnum])) {
> > +                       app->touch_change |= (active ||
> > +                                             app->mt_slot_state[slotnum].tip_state);
> > +                       app->repeated_counter = 0;
> > +               } else {
> > +#define MT_MAX_REPEATED_DROPPED 5
> > +                       if (app->repeated_counter < MT_MAX_REPEATED_DROPPED) {
> > +                               active = false;
> > +                               if (app->touched)
> > +                                       app->touch_change = true;
> > +                       } else {
> > +                               app->touch_change = true;
> > +                       }
> > +                       app->repeated_counter++;

This is specific to one device, but I have seen device filtering in
hardware that reports the same steady data as long as the touch is
present. So 5 reports with the same data seem quite short.

Also, we do have devices which tend to forget to release slots, and
that's why we have MT_QUIRK_STICKY_FINGERS which release touches after
a while.

> > +               }
> > +               app->touched = active;
> > +               app->mt_slot_state[slotnum] = state;
> > +       }
> >         input_mt_slot(input, slotnum);
> >         input_mt_report_slot_state(input, tool, active);
> >         if (active) {
> > @@ -1296,6 +1413,18 @@ static int mt_touch_input_configured(struct hid_device *hdev,
> >         if (!app->pending_palm_slots)
> >                 return -ENOMEM;
> >
> > +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > +               app->mt_slot_state = devm_kcalloc(&hi->input->dev,
> > +                                                 td->maxcontacts,
> > +                                                 sizeof(*app->mt_slot_state),
> > +                                                 GFP_KERNEL);
> > +               if (!app->mt_slot_state)
> > +                       return -ENOMEM;
> > +               mt_clear_slot_states(app->mt_slot_state, td->maxcontacts);
> > +               app->repeated_counter = 0;
> > +       }
> > +
> > +
> >         ret = input_mt_init_slots(input, td->maxcontacts, app->mt_flags);
> >         if (ret)
> >                 return ret;
> > @@ -1676,6 +1805,12 @@ static void mt_release_contacts(struct hid_device *hid)
> >
> >         list_for_each_entry(application, &td->applications, list) {
> >                 application->num_received = 0;
> > +               if (application->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > +                       application->touch_change = false;
> > +                       mt_clear_slot_states(application->mt_slot_state,
> > +                                            td->maxcontacts);
> > +                       application->repeated_counter = 0;
> > +               }
> >         }
> >  }
> >
> > @@ -2014,6 +2149,15 @@ static const struct hid_device_id mt_devices[] = {
> >                 MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
> >                         USB_DEVICE_ID_ILITEK_MULTITOUCH) },
> >
> > +       /* Ilitek 106E/F touchscreen */
> > +       {  .driver_data = MT_CLS_ILITEK_016x,
> > +               HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> > +                       USB_VENDOR_ID_ILITEK, USB_DEVICE_ID_ILITEK_016E) },
> > +
> > +       {  .driver_data = MT_CLS_ILITEK_016x,
> > +               HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> > +                       USB_VENDOR_ID_ILITEK, USB_DEVICE_ID_ILITEK_016F) },
> > +
> >         /* LG Melfas panel */
> >         { .driver_data = MT_CLS_LG,
> >                 HID_USB_DEVICE(USB_VENDOR_ID_LG,
> > --
> > 2.35.1.1021.g381101b075-goog
> >
>

Cheers,
Benjamin

[0] https://gitlab.freedesktop.org/libevdev/hid-tools

