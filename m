Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCDE4F6456
	for <lists+linux-input@lfdr.de>; Wed,  6 Apr 2022 18:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236600AbiDFQES (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Apr 2022 12:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236933AbiDFQEJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Apr 2022 12:04:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7E31D2597F2
        for <linux-input@vger.kernel.org>; Wed,  6 Apr 2022 06:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649252145;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=785XnnjiJeVHldGtTwHmMQWg42w4d0TgSe43JszIJYA=;
        b=jI4r3R+zM8tbhpRc6Yk3jMrFZDImjgdn+FBMq9xTt65OxNzj9czHwah5QzuyVmt+T/zA6B
        8XmgOY8AD40sIgSf2aKs2o9x5XlcSUs7WsKjnEtIO0QTGJMwSLu2xkMR5Khqepg13Psa5U
        lhnI1mry+jrtinH0GykX/4W7B5DJmDU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-3w8GOa8FOAOEsBnvfXwYrQ-1; Wed, 06 Apr 2022 09:35:42 -0400
X-MC-Unique: 3w8GOa8FOAOEsBnvfXwYrQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D58D3C163E5;
        Wed,  6 Apr 2022 13:35:42 +0000 (UTC)
Received: from [10.39.195.121] (unknown [10.39.195.121])
        by smtp.corp.redhat.com (Postfix) with ESMTP id F117C515A44;
        Wed,  6 Apr 2022 13:35:40 +0000 (UTC)
Message-ID: <21703d7a-2b28-3708-7462-96190d0130c8@redhat.com>
Date:   Wed, 6 Apr 2022 15:35:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [PATCH] HID: multitouch: Implement MT_QUIRK_DROP_REPEATED_SLOT
To:     Angela Czubak <acz@semihalf.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Jiri Kosina <jikos@kernel.org>, upstream@semihalf.com
References: <20220331144500.2340714-1-acz@semihalf.com>
 <CAB4aORW_1ScMDBcvn8WU+2m6_xmv-nkjQuPHfwTD9vnWMNQhiA@mail.gmail.com>
 <CAO-hwJLDADovq-pu9ovcqYBi8DRLJE1xsNOzwtnypethcGYOtw@mail.gmail.com>
 <CAB4aORWCL3+ZDibdpR5svSoWev48c30ZUAaHmQRKuKoGemt65g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAB4aORWCL3+ZDibdpR5svSoWev48c30ZUAaHmQRKuKoGemt65g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



On Wed, Apr 6, 2022 at 2:19 PM Angela Czubak <acz@semihalf.com> wrote:
>
> .
>
> On Tue, Apr 5, 2022 at 2:57 PM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Hi Angela,
> >
> > On Tue, Apr 5, 2022 at 1:25 PM Angela Czubak <acz@semihalf.com> wrote:
> > >
> > > Hi Benjamin, Hi Jiri,
> > >
> > > any thoughts on this patch?
> >
> > Sorry for taking too long to answer. I saw the patch coming in while
> > coming back last week, and could not process it, and completely forgot
> > about it.
> >
> > > If you believe that the userspace input stack should be a better place
> > > to solve this kind of issue, please let me know.
> >
> > This is definitely not userspace to process those specificities, as
> > far as I understand. However... I don't understand the bug very well
> > :/
> >
> > more inlined below:
> >
> > >
> > > Regards,
> > > Angela
> > >
> > > On Thu, Mar 31, 2022 at 4:45 PM Angela Czubak <acz@semihalf.com> wrote:
> > > >
> > > > Ilitek touchscreens 016E and 016F repeat last finger position after it has
> > > > left the surface of the device.
> > > > We send BTN_TOUCH=0 and ABS_MT_TRACKING_ID=-1 with the first repeated
> > > > slot as this may mean that the finger has been lifted.
> > > > The touchscreen is not actually too sensitive and this would
> > > > modify the behaviour of the on-screen keyboard, for instance holding the
> > > > backspace key might be sometimes interpreted as removing a single character
> > > > only. Add counter of repeated frames and if it is significantly big then
> > > > assume the finger actually remains stationary.
> >
> > This commit is really confusing to me. This description is mixing
> > symptoms from before the patch, behaviour from after and userspace
> > which doesn't mean a lot here not knowing what is the problem.
> >
> > What is the exact problem?
>
> The device delays reporting finger lift off, instead it repeats its
> last report with only the scantime updated.
> I would interpret such events as meaning that the finger is present
> but has stopped moving, which
> is not the case, actually.
>
> When it comes to ChromeOS userspace input stack it seems that those
> events are actually ignored, but the
> problem is that the final event, i.e. the finger lit off is reported
> significantly late, so if the user is moving
> their finger to scroll the contents of the screen it immediately stops
> once the finger leaves the surface.
> However, the desired behaviour is for the scroll to continue, i.e.
> they should observe something called fling.
> The problem is that since this last event is delayed the scrolling stops.
> Because the last event is so late, our window, over which we calculate
> scroll speed, consists of just one
> single event, i.e. we cannot calculate any movement velocity so we
> assume it is zero.
> I tried to increase the window, but it appears that the delay is large
> enough for a human eye to notice that
> the scrolling stops (as there are no new events for a while) and then
> it restarts again (once the actual
> lift off event is noticed, BTN_TOUCH=0 and ABS_MT_TRACKING_ID=-1).
>
> I find it more difficult to solve at userspace level and we would like
> the fling (i.e. scrolling that continues
> after the finger has left the surface) to be fluent.

OK, thanks for the explanation. There are still a few bits that are
confusing to me:

>
> > What events the device is sending?
>
> "Raw" events:
>
> https://gist.github.com/semihalf-czubak-angela/026072c013b4f883cb6adb7460b4d6ca
>
> So as you can see it repeats the last position etc. and the only thing
> changing is the scantime.
>
> This translates to input events (not that the data below is from
> another run, but you get the idea):
>
> https://gist.github.com/semihalf-czubak-angela/b957f7e464772bbdd95ddd814e84e5d9

But in both of these records, the last finger is reported 5 times, which
corresponds to the value of MT_MAX_REPEATED_DROPPED.
Given that the device sends one report every 20 millisecs, you end up at
the exact same 0.1 seconds of delay, which makes me wonder about the
usefulness of the patch.

>
> > What should be the expected kernel ouput?
> >
>
> Well, ideally:
> https://gist.github.com/semihalf-czubak-angela/4dd52c177372f8f0c2b4e5ada841ea95
>
> So what helps is if
>
> Event: time 1643827301.463888, type 3 (EV_ABS), code 53
> (ABS_MT_POSITION_X), value 4817
> Event: time 1643827301.463888, type 3 (EV_ABS), code 54
> (ABS_MT_POSITION_Y), value 777
> Event: time 1643827301.463888, type 3 (EV_ABS), code 0 (ABS_X), value 4817
> Event: time 1643827301.463888, type 3 (EV_ABS), code 1 (ABS_Y), value 777
> Event: time 1643827301.463888, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 408000
> Event: time 1643827301.463888, -------------- SYN_REPORT ------------
> Event: time 1643827301.479920, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 416000
> Event: time 1643827301.479920, -------------- SYN_REPORT ------------
> Event: time 1643827301.496921, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 424000
> Event: time 1643827301.496921, -------------- SYN_REPORT ------------
> Event: time 1643827301.517923, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 432000
> Event: time 1643827301.517923, -------------- SYN_REPORT ------------
> Event: time 1643827301.535920, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 440000
> Event: time 1643827301.535920, -------------- SYN_REPORT ------------
> Event: time 1643827301.554943, type 3 (EV_ABS), code 57
> (ABS_MT_TRACKING_ID), value -1
> Event: time 1643827301.554943, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
> Event: time 1643827301.554943, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 448000
> Event: time 1643827301.554943, -------------- SYN_REPORT ------------
>
> becomes
>
> Event: time 1643827301.463888, type 3 (EV_ABS), code 53
> (ABS_MT_POSITION_X), value 4817
> Event: time 1643827301.463888, type 3 (EV_ABS), code 54
> (ABS_MT_POSITION_Y), value 777
> Event: time 1643827301.463888, type 3 (EV_ABS), code 0 (ABS_X), value 4817
> Event: time 1643827301.463888, type 3 (EV_ABS), code 1 (ABS_Y), value 777
> Event: time 1643827301.463888, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 408000
> Event: time 1643827301.463888, -------------- SYN_REPORT ------------
> Event: time 1643827301.479920, type 3 (EV_ABS), code 57
> (ABS_MT_TRACKING_ID), value -1
> Event: time 1643827301.479920, type 1 (EV_KEY), code 330 (BTN_TOUCH), value 0
> Event: time 1643827301.479920, type 4 (EV_MSC), code 5
> (MSC_TIMESTAMP), value 416000
> Event: time 1643827301.479920, -------------- SYN_REPORT ------------

Well, here, the timestamp says that you want the touch to come as soon
as there are 2 identical values, because it comes right after the last
modified event. This is doable, but that also means you might create
false releases while processing the events.

>
>
> > (bonus point for actually giving the events in the hid-recorder output
> > format [0] ;-P )
> >
>
> Here you are: https://gist.github.com/semihalf-czubak-angela/eaaf73459c5c50f716016839fc368ab0

Heh, thanks :)

>
> > FWIW, this driver is one of the few drivers in the HID stack to have
> > extended tests in hid-tools[0].
> > I plan to merge that repo into the selftests subtree, but for now we
> > need to use this external repo.
> >
> > So I'd be pleased to see new tests added for that quirk because it
> > seems far from evident what is happening.
> >
>
> Ack, I will prepare something.
>
> > > >
> > > > Signed-off-by: Angela Czubak <acz@semihalf.com>
> > > > ---
> > > >
> > > > Hi guys,
> > > >
> > > > Please let me know if you think there is some better solution.
> > > > It felt to me that it would be more correct to solve it on kernel
> > > > driver level since this issue is device specific, but perhaps
> > > > there are some userspace input stacks that figured this problem out.
> > > > With Chromium OS Input Stack the final BTN_TOUCH=0 event comes
> > > > significantly late which causes hiccups or simply a scrolling fling
> > > > not to happen, since the input stack thinks the finger is still
> > > > in the same position and on the screen.
> >
> > If the device reports a wrong state, the kernel is the place to fix
> > it. However, as mentioned above I do not understand what is wrong
> > there by reading the description and the code.
> >
> > > >
> > > >  drivers/hid/hid-ids.h        |   2 +
> > > >  drivers/hid/hid-multitouch.c | 150 ++++++++++++++++++++++++++++++++++-
> > > >  2 files changed, 149 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> > > > index 053853a891c5..cc85f547603c 100644
> > > > --- a/drivers/hid/hid-ids.h
> > > > +++ b/drivers/hid/hid-ids.h
> > > > @@ -630,6 +630,8 @@
> > > >
> > > >  #define USB_VENDOR_ID_ILITEK           0x222a
> > > >  #define USB_DEVICE_ID_ILITEK_MULTITOUCH        0x0001
> > > > +#define USB_DEVICE_ID_ILITEK_016E      0x016e
> > > > +#define USB_DEVICE_ID_ILITEK_016F      0x016f
> > > >
> > > >  #define USB_VENDOR_ID_INTEL_0          0x8086
> > > >  #define USB_VENDOR_ID_INTEL_1          0x8087
> > > > diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> > > > index 99eabfb4145b..33cb5e5179c2 100644
> > > > --- a/drivers/hid/hid-multitouch.c
> > > > +++ b/drivers/hid/hid-multitouch.c
> > > > @@ -71,6 +71,7 @@ MODULE_LICENSE("GPL");
> > > >  #define MT_QUIRK_SEPARATE_APP_REPORT   BIT(19)
> > > >  #define MT_QUIRK_FORCE_MULTI_INPUT     BIT(20)
> > > >  #define MT_QUIRK_DISABLE_WAKEUP                BIT(21)
> > > > +#define MT_QUIRK_DROP_REPEATED_SLOT    BIT(22)
> > > >
> > > >  #define MT_INPUTMODE_TOUCHSCREEN       0x02
> > > >  #define MT_INPUTMODE_TOUCHPAD          0x03
> > > > @@ -103,12 +104,22 @@ struct mt_usages {
> > > >         bool *confidence_state; /* is the touch made by a finger? */
> > > >  };
> > > >
> > > > +struct mt_slot_state {
> > > > +       __s32 x, y, cx, cy, p, w, h, a;
> > > > +       __s32 contactid;        /* the device ContactID assigned to this slot */
> > > > +       bool tip_state; /* is the touch valid? */
> > > > +       bool inrange_state;     /* is the finger in proximity of the sensor? */
> > > > +       bool confidence_state;  /* is the touch made by a finger? */
> > > > +};
> >
> > This raises a red flag here. I spent quite some time removing internal
> > slot states, and re-adding them means that something is wrong IMO.
> > (though if we can not do something else, we might just re-add them).
> >
>
> I wanted to compare against the report contents excluding the scantime.
> Perhaps I could do that on the hid report level, this way just seemed
> easier to implement.

You can also use input_mt_get_value() and compare with the current value
before sending the value to the input stack. This way you do not need to
store the values once again.

>
> > > > +
> > > >  struct mt_application {
> > > >         struct list_head list;
> > > >         unsigned int application;
> > > >         unsigned int report_id;
> > > >         struct list_head mt_usages;     /* mt usages list */
> > > >
> > > > +       struct mt_slot_state *mt_slot_state;
> > > > +
> > > >         __s32 quirks;
> > > >
> > > >         __s32 *scantime;                /* scantime reported */
> > > > @@ -116,6 +127,11 @@ struct mt_application {
> > > >
> > > >         __s32 *raw_cc;                  /* contact count in the report */
> > > >         int left_button_state;          /* left button state */
> > > > +       bool touch_change;              /* if touch change detected */
> > > > +       bool touched;                   /* if touch was present in the last
> > > > +                                        * message
> > > > +                                        */
> >
> > So this is not per-touch, but per report?
> >
>
> I suppose it is actually per report, it is just that implementation
> per slot seemed easier.
> I could not reproduce the issue when using two fingers.

Which makes a lot of sense: when you still have one finger on the
screen, the sensitive sensors are way much capable of detecting ghosts
because they have a baseline to compare too.
So I would suggest you enable that code only when you have 1 finger left
and that this finger is still.

>
> > > > +       int repeated_counter;           /* how many times last frame repeated */
> > > >         unsigned int mt_flags;          /* flags to pass to input-mt */
> > > >
> > > >         unsigned long *pending_palm_slots;      /* slots where we reported palm
> > > > @@ -211,6 +227,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
> > > >  #define MT_CLS_GOOGLE                          0x0111
> > > >  #define MT_CLS_RAZER_BLADE_STEALTH             0x0112
> > > >  #define MT_CLS_SMART_TECH                      0x0113
> > > > +#define MT_CLS_ILITEK_016x                     0x0114
> > > >
> > > >  #define MT_DEFAULT_MAXCONTACT  10
> > > >  #define MT_MAX_MAXCONTACT      250
> > > > @@ -386,6 +403,15 @@ static const struct mt_class mt_classes[] = {
> > > >                         MT_QUIRK_CONTACT_CNT_ACCURATE |
> > > >                         MT_QUIRK_SEPARATE_APP_REPORT,
> > > >         },
> > > > +       { .name = MT_CLS_ILITEK_016x,
> > > > +               .quirks = MT_QUIRK_ALWAYS_VALID |
> > > > +                       MT_QUIRK_IGNORE_DUPLICATES |
> > > > +                       MT_QUIRK_HOVERING |
> > > > +                       MT_QUIRK_CONTACT_CNT_ACCURATE |
> > > > +                       MT_QUIRK_STICKY_FINGERS |
> > > > +                       MT_QUIRK_WIN8_PTP_BUTTONS |
> > > > +                       MT_QUIRK_DROP_REPEATED_SLOT,
> > > > +               .export_all_inputs = true },
> > > >         { }
> > > >  };
> > > >
> > > > @@ -783,7 +809,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
> > > >                 case HID_DG_CONFIDENCE:
> > > >                         if ((cls->name == MT_CLS_WIN_8 ||
> > > >                              cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT ||
> > > > -                            cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP) &&
> > > > +                            cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP ||
> > > > +                            cls->name == MT_CLS_ILITEK_016x) &&
> >
> > Not something you should care about, but this long test of spaghetti
> > should likely be fixed into something way better at some point...
> >
> > > >                                 (field->application == HID_DG_TOUCHPAD ||
> > > >                                  field->application == HID_DG_TOUCHSCREEN))
> > > >                                 app->quirks |= MT_QUIRK_CONFIDENCE;
> > > > @@ -948,7 +975,13 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
> > > >                 input_event(input, EV_KEY, BTN_LEFT, app->left_button_state);
> > > >
> > > >         input_mt_sync_frame(input);
> > > > -       input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> > > > +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > > > +               if (app->touch_change)
> > > > +                       input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> > > > +               app->touch_change = false;
> >
> > Why filter out the timestamp?
> >
>
> I suppose lonely timestamps should not do any harm, I just wanted to
> avoid evtest etc. output
> where there is no change but the timestamp, it is kind of also
> remainder of my first approach where
> I just tried filtering this events out and see waiting for BTN_TOUCH=0
> and ABS_MT_TRACKING_ID=-1
> would be enough (it wasn't).

So I wouldn't filter out the timestamps. Not sure how ChromeOS stack
behaves when we forward timestamps without a touch, but it should be
capable of ignoring them.

>
> > > > +       } else {
> > > > +               input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> > > > +       }
> > > >         input_sync(input);
> > > >
> > > >         mt_release_pending_palms(td, app, input);
> > > > @@ -993,6 +1026,60 @@ static int mt_touch_event(struct hid_device *hid, struct hid_field *field,
> > > >         return 1;
> > > >  }
> > > >
> > > > +static void mt_clear_slot_states(struct mt_slot_state *mt_slot_state,
> > > > +                                int size)
> > > > +{
> > > > +       int i;
> > > > +
> > > > +       for (i = 0; i < size; i++)
> > > > +               mt_slot_state[i].tip_state = 0;
> > > > +}
> > > > +
> > > > +static void mt_fill_slot_state(struct mt_slot_state *mt_slot_state,
> > > > +               struct mt_usages *slot)
> > > > +{
> > > > +       mt_slot_state->x = *slot->x;
> > > > +       mt_slot_state->y = *slot->y;
> > > > +       mt_slot_state->cx = *slot->cx;
> > > > +       mt_slot_state->cy = *slot->cy;
> > > > +       mt_slot_state->p = *slot->p;
> > > > +       mt_slot_state->w = *slot->w;
> > > > +       mt_slot_state->h = *slot->h;
> > > > +       mt_slot_state->a = *slot->a;
> > > > +       mt_slot_state->contactid = *slot->contactid;
> > > > +       mt_slot_state->tip_state = *slot->tip_state;
> > > > +       mt_slot_state->inrange_state = *slot->inrange_state;
> > > > +       mt_slot_state->confidence_state = *slot->confidence_state;
> > > > +}
> > > > +
> > > > +static bool mt_is_slot_state_equal(struct mt_slot_state *state1,
> > > > +               struct mt_slot_state *state2)
> > > > +{
> > > > +       if (state1->x != state2->x)
> > > > +               return false;
> > > > +       if (state1->y != state2->y)
> > > > +               return false;
> > > > +       if (state1->cx != state2->cx)
> > > > +               return false;
> > > > +       if (state1->cy != state2->cy)
> > > > +               return false;
> > > > +       if (state1->p != state2->p)
> > > > +               return false;
> > > > +       if (state1->w != state2->w)
> > > > +               return false;
> > > > +       if (state1->a != state2->a)
> > > > +               return false;
> > > > +       if (state1->contactid != state2->contactid)
> > > > +               return false;
> > > > +       if (state1->tip_state != state2->tip_state)
> > > > +               return false;
> > > > +       if (state1->inrange_state != state2->inrange_state)
> > > > +               return false;
> > > > +       if (state1->confidence_state != state2->confidence_state)
> > > > +               return false;
> > > > +       return true;
> > > > +}
> >
> > The input stack already filters out duplicated events. So I am not
> > sure we need to store the information here once again and test for it
> > here.
> >
>
> What I want to do is to "prematurely" report that the finger has been lifted.
> It is not that much about solely filtering out the duplicated events,
> I rather want to interpret
> such an event as a finger lift off.

Yes, but see my remark above. Given that the input stack already caches
the values and that it is validated by the evdev recording you shared,
you should be able to apply the quirk just before calling the various
input_event() and comparing the current value of this last finger with
the ones in the input stack. This way, you do not need to keep tabs on
the various fingers.

>
> > > > +
> > > >  static int mt_process_slot(struct mt_device *td, struct input_dev *input,
> > > >                             struct mt_application *app,
> > > >                             struct mt_usages *slot)
> > > > @@ -1005,6 +1092,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
> > > >         int active;
> > > >         int slotnum;
> > > >         int tool = MT_TOOL_FINGER;
> > > > +       struct mt_slot_state state = {0};
> > > >
> > > >         if (!slot)
> > > >                 return -EINVAL;
> > > > @@ -1058,13 +1146,42 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
> > > >                          * lift-off as userspace will not be aware
> > > >                          * of non-confidence, so we need to split
> > > >                          * it into 2 events: active MT_TOOL_PALM
> > > > -                        * and a separate liftoff.
> > > > +                        * and a separate lift off.
> > > >                          */
> > > >                         active = true;
> > > >                         set_bit(slotnum, app->pending_palm_slots);
> > > >                 }
> > > >         }
> > > >
> > > > +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > > > +               mt_fill_slot_state(&state, slot);
> > > > +               /* Check if every field in the slot is the same as before.
> > > > +                * Some touchscreens report the same position for several
> > > > +                * frames even though the finger is no longer on the surface.
> > > > +                * This is actually being recognised as the finger remaining in
> > > > +                * one position, which causes scrolling to be stopped.
> > > > +                * Ignore such packets so that the scrolling continues
> > > > +                * and the touchscreen reports the finger liftoff.
> >
> > That part I understand better, but how is the device reporting such events?
> > If the touch is no longer there, we should have a bit that says it is
> > lifted, so we should simply just ignore the touch, no?
> >
>
> Well, I would actually like the touch panel manufacturers to answer that :-)
> Based on some comments in our source code it seems that some devices
> might delay synthesis of lift-off to reduce risks of noisy release, but I am not
> sure if it explains why they produce events in between.

They produce events in between because they have to, or they are not
following the spec :)
I also think the main reason is that if they forget about sending an
event *and* that the touch continues to move after a few events, they
will see a release happening on the touch because that's what
STICKY_FINGER does (it's a copy of the behaviour from Windows FWIW).

>
> >
> > > > +                */
> > > > +               if (!mt_is_slot_state_equal(&state,
> > > > +                                           &app->mt_slot_state[slotnum])) {
> > > > +                       app->touch_change |= (active ||
> > > > +                                             app->mt_slot_state[slotnum].tip_state);
> > > > +                       app->repeated_counter = 0;
> > > > +               } else {
> > > > +#define MT_MAX_REPEATED_DROPPED 5
> > > > +                       if (app->repeated_counter < MT_MAX_REPEATED_DROPPED) {
> > > > +                               active = false;
> > > > +                               if (app->touched)
> > > > +                                       app->touch_change = true;
> > > > +                       } else {
> > > > +                               app->touch_change = true;
> > > > +                       }
> > > > +                       app->repeated_counter++;
> >
> > This is specific to one device, but I have seen device filtering in
> > hardware that reports the same steady data as long as the touch is
> > present. So 5 reports with the same data seem quite short.
> >
>
> It can be a larger number, I just believe that in this case it was enough.

All 3 (or 4 maybe) recordings you shared showed that we received only 5
duplications of events. So there is a case to be made around whether we
need this patch.

What would be interesting is whether you can "emulate" that situation
without releasing the finger. If the raw data is noisy (to some extent
of course) and it's hard to have exactly twice the same sample for a
touch, then maybe we can assume that as soon as we get identical values
we can release. Maybe the false positive in that situation would be
better handled by the user that missing the fling.

>
> > Also, we do have devices which tend to forget to release slots, and
> > that's why we have MT_QUIRK_STICKY_FINGERS which release touches after
> > a while.
>
> Yeah, but the thing is that this specific device actually reports that
> the finger is still there,
> even though the finger has been lifted :-)
> I believe that MT_QUIRK_STICKY_FINGERS works when the device somehow
> fails to send a new report
> within some time after the previous one, so it does not solve the issue for us.

It's not exactly the same case, but it still feels similar enough to
maybe be reused.

Can you please give a shot at the following patch (and change the value
of MT_MAX_REPEATED_DROPPED between 1 to 5)?
It doesn't use MT_QUIRK_STICKY_FINGERS but should be simnilar to what
you have here in a shorter version.

---
diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
index 0dece608c023..cff4088e564a 100644
--- a/drivers/hid/hid-multitouch.c
+++ b/drivers/hid/hid-multitouch.c
@@ -77,6 +77,8 @@ MODULE_LICENSE("GPL");
  
  #define MT_BUTTONTYPE_CLICKPAD		0
  
+#define MT_MAX_REPEATED_DROPPED		3
+
  enum latency_mode {
  	HID_LATENCY_NORMAL = 0,
  	HID_LATENCY_HIGH = 1,
@@ -128,6 +130,7 @@ struct mt_application {
  				 * 1 means we should use a serial protocol
  				 * > 1 means hybrid (multitouch) protocol
  				 */
+	unsigned int repeated_touches;	/* used when MT_QUIRK_DROP_REPEATED_SLOT */
  
  	__s32 dev_time;		/* the scan time provided by the device */
  	unsigned long jiffies;	/* the frame's jiffies */
@@ -1065,6 +1068,19 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
  		}
  	}
  
+	/* TODO: add test for the new quirk so we don't apply this for all devices */
+	if (active && app->num_expected == 1) {
+		struct input_mt_slot *i_slot = &mt->slots[slotnum];
+
+		if (input_mt_get_value(i_slot, ABS_MT_POSITION_X) == *slot->x &&
+		    input_mt_get_value(i_slot, ABS_MT_POSITION_Y) == *slot->y) {
+			if (++app->repeated_touches >= MT_MAX_REPEATED_DROPPED)
+				active = false;
+		} else {
+			app->repeated_touches = 0;
+		}
+	}
+
  	input_mt_slot(input, slotnum);
  	input_mt_report_slot_state(input, tool, active);
  	if (active) {
---

Cheers,
Benjamin

>
>
>
>
> >
> > > > +               }
> > > > +               app->touched = active;
> > > > +               app->mt_slot_state[slotnum] = state;
> > > > +       }
> > > >         input_mt_slot(input, slotnum);
> > > >         input_mt_report_slot_state(input, tool, active);
> > > >         if (active) {
> > > > @@ -1296,6 +1413,18 @@ static int mt_touch_input_configured(struct hid_device *hdev,
> > > >         if (!app->pending_palm_slots)
> > > >                 return -ENOMEM;
> > > >
> > > > +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > > > +               app->mt_slot_state = devm_kcalloc(&hi->input->dev,
> > > > +                                                 td->maxcontacts,
> > > > +                                                 sizeof(*app->mt_slot_state),
> > > > +                                                 GFP_KERNEL);
> > > > +               if (!app->mt_slot_state)
> > > > +                       return -ENOMEM;
> > > > +               mt_clear_slot_states(app->mt_slot_state, td->maxcontacts);
> > > > +               app->repeated_counter = 0;
> > > > +       }
> > > > +
> > > > +
> > > >         ret = input_mt_init_slots(input, td->maxcontacts, app->mt_flags);
> > > >         if (ret)
> > > >                 return ret;
> > > > @@ -1676,6 +1805,12 @@ static void mt_release_contacts(struct hid_device *hid)
> > > >
> > > >         list_for_each_entry(application, &td->applications, list) {
> > > >                 application->num_received = 0;
> > > > +               if (application->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> > > > +                       application->touch_change = false;
> > > > +                       mt_clear_slot_states(application->mt_slot_state,
> > > > +                                            td->maxcontacts);
> > > > +                       application->repeated_counter = 0;
> > > > +               }
> > > >         }
> > > >  }
> > > >
> > > > @@ -2014,6 +2149,15 @@ static const struct hid_device_id mt_devices[] = {
> > > >                 MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
> > > >                         USB_DEVICE_ID_ILITEK_MULTITOUCH) },
> > > >
> > > > +       /* Ilitek 106E/F touchscreen */
> > > > +       {  .driver_data = MT_CLS_ILITEK_016x,
> > > > +               HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> > > > +                       USB_VENDOR_ID_ILITEK, USB_DEVICE_ID_ILITEK_016E) },
> > > > +
> > > > +       {  .driver_data = MT_CLS_ILITEK_016x,
> > > > +               HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> > > > +                       USB_VENDOR_ID_ILITEK, USB_DEVICE_ID_ILITEK_016F) },
> > > > +
> > > >         /* LG Melfas panel */
> > > >         { .driver_data = MT_CLS_LG,
> > > >                 HID_USB_DEVICE(USB_VENDOR_ID_LG,
> > > > --
> > > > 2.35.1.1021.g381101b075-goog
> > > >
> > >
> >
> > Cheers,
> > Benjamin
> >
> > [0] https://gitlab.freedesktop.org/libevdev/hid-tools
> >
>

