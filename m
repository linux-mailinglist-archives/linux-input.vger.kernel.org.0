Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64C384F3E83
	for <lists+linux-input@lfdr.de>; Tue,  5 Apr 2022 22:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238530AbiDEOJ4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 5 Apr 2022 10:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380354AbiDEMND (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 5 Apr 2022 08:13:03 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4215B986F0
        for <linux-input@vger.kernel.org>; Tue,  5 Apr 2022 04:25:03 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2eb43ad7909so80571597b3.2
        for <linux-input@vger.kernel.org>; Tue, 05 Apr 2022 04:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VCq8D9of71PWohYjBmt0U86V3bYGawWhsz/hr69DrXo=;
        b=wUIb4rXnkb2V1K16yWZpaNF8rdFNFh5c/Idjl+RbYwCEwuV9jTCP022mz7RgKyJ9gs
         GR5EWl5+2q5DkN2oE1gsSfkLDZYBLVYGl1a6quJfG0E54TgddLIkzh81QpbyWHOFpgEt
         m45NUavwR/fa5mIrOjltvsb1XfwqfXYq/OtVEape4VwVM5V9P8bh5nv//eoL+d3nbrA0
         g7Kj/Z78sM1Y+QBLgNRRnqqSGB7mv8l0TncKWJbQYM8OdnLckq7DamT2zh3j6ap12mZJ
         YPGrXA+ssrXZ1RlzuHLnU9cHB14ZNZ1yf+YWBgMRhtJ08nTQPpOJ9cTTu119zVpYdv5t
         jLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VCq8D9of71PWohYjBmt0U86V3bYGawWhsz/hr69DrXo=;
        b=7RIx1js6vHcqd9key8rRDUOh0Aq6Jwq01CXYr1WceILugx6xpme2gqGYqKfWoH/Jsz
         LOMyGYc/daqMzX2BP4Kd7qwesu4raa8+yBTEkoxsxHv1uSNEoMY7eXzJ85qjBkpgXzS8
         XD9jaSLhqYMnsPskbWHD7QHNw9Z4Si2kFS5X+2FOt3vpt/phJG6oDyRh1QIOmWminAai
         48B9++ewsymdjCHtb2Akx9xXesPss1sp75fUvPrN+oiqSFvSZkjBSqMWPhY6N+aTUYPD
         /GoAGJ8Hx5yvS0u/EJGtlX16DR5GpgNrv1Zi33FKk4fg6hPKvLmxof4I7l7mWY7qZ7Lo
         WqXA==
X-Gm-Message-State: AOAM53345N08k9Y9Byl2HDXfGUH4mECsh1VoJpQQL/4t7hJ5/qrsT6zs
        kdBUMBDtCW1zFBdmT0mujbnoKJ7tOx70f/+hbZY0lSCNIzo=
X-Google-Smtp-Source: ABdhPJwthXpO2xXA59oMYTGwYKhafWOb4WZodqUqg5mJTPYGYTe1SRvATSTPENzSvAZQEz0ArmXBIHaMUKwtQaXBTcQ=
X-Received: by 2002:a81:4506:0:b0:2eb:96f4:fa7e with SMTP id
 s6-20020a814506000000b002eb96f4fa7emr2171489ywa.375.1649157902419; Tue, 05
 Apr 2022 04:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220331144500.2340714-1-acz@semihalf.com>
In-Reply-To: <20220331144500.2340714-1-acz@semihalf.com>
From:   Angela Czubak <acz@semihalf.com>
Date:   Tue, 5 Apr 2022 13:24:50 +0200
Message-ID: <CAB4aORW_1ScMDBcvn8WU+2m6_xmv-nkjQuPHfwTD9vnWMNQhiA@mail.gmail.com>
Subject: Re: [PATCH] HID: multitouch: Implement MT_QUIRK_DROP_REPEATED_SLOT
To:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin, Hi Jiri,

any thoughts on this patch?
If you believe that the userspace input stack should be a better place
to solve this kind of issue, please let me know.

Regards,
Angela

On Thu, Mar 31, 2022 at 4:45 PM Angela Czubak <acz@semihalf.com> wrote:
>
> Ilitek touchscreens 016E and 016F repeat last finger position after it has
> left the surface of the device.
> We send BTN_TOUCH=0 and ABS_MT_TRACKING_ID=-1 with the first repeated
> slot as this may mean that the finger has been lifted.
> The touchscreen is not actually too sensitive and this would
> modify the behaviour of the on-screen keyboard, for instance holding the
> backspace key might be sometimes interpreted as removing a single character
> only. Add counter of repeated frames and if it is significantly big then
> assume the finger actually remains stationary.
>
> Signed-off-by: Angela Czubak <acz@semihalf.com>
> ---
>
> Hi guys,
>
> Please let me know if you think there is some better solution.
> It felt to me that it would be more correct to solve it on kernel
> driver level since this issue is device specific, but perhaps
> there are some userspace input stacks that figured this problem out.
> With Chromium OS Input Stack the final BTN_TOUCH=0 event comes
> significantly late which causes hiccups or simply a scrolling fling
> not to happen, since the input stack thinks the finger is still
> in the same position and on the screen.
>
>  drivers/hid/hid-ids.h        |   2 +
>  drivers/hid/hid-multitouch.c | 150 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 149 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
> index 053853a891c5..cc85f547603c 100644
> --- a/drivers/hid/hid-ids.h
> +++ b/drivers/hid/hid-ids.h
> @@ -630,6 +630,8 @@
>
>  #define USB_VENDOR_ID_ILITEK           0x222a
>  #define USB_DEVICE_ID_ILITEK_MULTITOUCH        0x0001
> +#define USB_DEVICE_ID_ILITEK_016E      0x016e
> +#define USB_DEVICE_ID_ILITEK_016F      0x016f
>
>  #define USB_VENDOR_ID_INTEL_0          0x8086
>  #define USB_VENDOR_ID_INTEL_1          0x8087
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 99eabfb4145b..33cb5e5179c2 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -71,6 +71,7 @@ MODULE_LICENSE("GPL");
>  #define MT_QUIRK_SEPARATE_APP_REPORT   BIT(19)
>  #define MT_QUIRK_FORCE_MULTI_INPUT     BIT(20)
>  #define MT_QUIRK_DISABLE_WAKEUP                BIT(21)
> +#define MT_QUIRK_DROP_REPEATED_SLOT    BIT(22)
>
>  #define MT_INPUTMODE_TOUCHSCREEN       0x02
>  #define MT_INPUTMODE_TOUCHPAD          0x03
> @@ -103,12 +104,22 @@ struct mt_usages {
>         bool *confidence_state; /* is the touch made by a finger? */
>  };
>
> +struct mt_slot_state {
> +       __s32 x, y, cx, cy, p, w, h, a;
> +       __s32 contactid;        /* the device ContactID assigned to this slot */
> +       bool tip_state; /* is the touch valid? */
> +       bool inrange_state;     /* is the finger in proximity of the sensor? */
> +       bool confidence_state;  /* is the touch made by a finger? */
> +};
> +
>  struct mt_application {
>         struct list_head list;
>         unsigned int application;
>         unsigned int report_id;
>         struct list_head mt_usages;     /* mt usages list */
>
> +       struct mt_slot_state *mt_slot_state;
> +
>         __s32 quirks;
>
>         __s32 *scantime;                /* scantime reported */
> @@ -116,6 +127,11 @@ struct mt_application {
>
>         __s32 *raw_cc;                  /* contact count in the report */
>         int left_button_state;          /* left button state */
> +       bool touch_change;              /* if touch change detected */
> +       bool touched;                   /* if touch was present in the last
> +                                        * message
> +                                        */
> +       int repeated_counter;           /* how many times last frame repeated */
>         unsigned int mt_flags;          /* flags to pass to input-mt */
>
>         unsigned long *pending_palm_slots;      /* slots where we reported palm
> @@ -211,6 +227,7 @@ static void mt_post_parse(struct mt_device *td, struct mt_application *app);
>  #define MT_CLS_GOOGLE                          0x0111
>  #define MT_CLS_RAZER_BLADE_STEALTH             0x0112
>  #define MT_CLS_SMART_TECH                      0x0113
> +#define MT_CLS_ILITEK_016x                     0x0114
>
>  #define MT_DEFAULT_MAXCONTACT  10
>  #define MT_MAX_MAXCONTACT      250
> @@ -386,6 +403,15 @@ static const struct mt_class mt_classes[] = {
>                         MT_QUIRK_CONTACT_CNT_ACCURATE |
>                         MT_QUIRK_SEPARATE_APP_REPORT,
>         },
> +       { .name = MT_CLS_ILITEK_016x,
> +               .quirks = MT_QUIRK_ALWAYS_VALID |
> +                       MT_QUIRK_IGNORE_DUPLICATES |
> +                       MT_QUIRK_HOVERING |
> +                       MT_QUIRK_CONTACT_CNT_ACCURATE |
> +                       MT_QUIRK_STICKY_FINGERS |
> +                       MT_QUIRK_WIN8_PTP_BUTTONS |
> +                       MT_QUIRK_DROP_REPEATED_SLOT,
> +               .export_all_inputs = true },
>         { }
>  };
>
> @@ -783,7 +809,8 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>                 case HID_DG_CONFIDENCE:
>                         if ((cls->name == MT_CLS_WIN_8 ||
>                              cls->name == MT_CLS_WIN_8_FORCE_MULTI_INPUT ||
> -                            cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP) &&
> +                            cls->name == MT_CLS_WIN_8_DISABLE_WAKEUP ||
> +                            cls->name == MT_CLS_ILITEK_016x) &&
>                                 (field->application == HID_DG_TOUCHPAD ||
>                                  field->application == HID_DG_TOUCHSCREEN))
>                                 app->quirks |= MT_QUIRK_CONFIDENCE;
> @@ -948,7 +975,13 @@ static void mt_sync_frame(struct mt_device *td, struct mt_application *app,
>                 input_event(input, EV_KEY, BTN_LEFT, app->left_button_state);
>
>         input_mt_sync_frame(input);
> -       input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> +               if (app->touch_change)
> +                       input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> +               app->touch_change = false;
> +       } else {
> +               input_event(input, EV_MSC, MSC_TIMESTAMP, app->timestamp);
> +       }
>         input_sync(input);
>
>         mt_release_pending_palms(td, app, input);
> @@ -993,6 +1026,60 @@ static int mt_touch_event(struct hid_device *hid, struct hid_field *field,
>         return 1;
>  }
>
> +static void mt_clear_slot_states(struct mt_slot_state *mt_slot_state,
> +                                int size)
> +{
> +       int i;
> +
> +       for (i = 0; i < size; i++)
> +               mt_slot_state[i].tip_state = 0;
> +}
> +
> +static void mt_fill_slot_state(struct mt_slot_state *mt_slot_state,
> +               struct mt_usages *slot)
> +{
> +       mt_slot_state->x = *slot->x;
> +       mt_slot_state->y = *slot->y;
> +       mt_slot_state->cx = *slot->cx;
> +       mt_slot_state->cy = *slot->cy;
> +       mt_slot_state->p = *slot->p;
> +       mt_slot_state->w = *slot->w;
> +       mt_slot_state->h = *slot->h;
> +       mt_slot_state->a = *slot->a;
> +       mt_slot_state->contactid = *slot->contactid;
> +       mt_slot_state->tip_state = *slot->tip_state;
> +       mt_slot_state->inrange_state = *slot->inrange_state;
> +       mt_slot_state->confidence_state = *slot->confidence_state;
> +}
> +
> +static bool mt_is_slot_state_equal(struct mt_slot_state *state1,
> +               struct mt_slot_state *state2)
> +{
> +       if (state1->x != state2->x)
> +               return false;
> +       if (state1->y != state2->y)
> +               return false;
> +       if (state1->cx != state2->cx)
> +               return false;
> +       if (state1->cy != state2->cy)
> +               return false;
> +       if (state1->p != state2->p)
> +               return false;
> +       if (state1->w != state2->w)
> +               return false;
> +       if (state1->a != state2->a)
> +               return false;
> +       if (state1->contactid != state2->contactid)
> +               return false;
> +       if (state1->tip_state != state2->tip_state)
> +               return false;
> +       if (state1->inrange_state != state2->inrange_state)
> +               return false;
> +       if (state1->confidence_state != state2->confidence_state)
> +               return false;
> +       return true;
> +}
> +
>  static int mt_process_slot(struct mt_device *td, struct input_dev *input,
>                             struct mt_application *app,
>                             struct mt_usages *slot)
> @@ -1005,6 +1092,7 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
>         int active;
>         int slotnum;
>         int tool = MT_TOOL_FINGER;
> +       struct mt_slot_state state = {0};
>
>         if (!slot)
>                 return -EINVAL;
> @@ -1058,13 +1146,42 @@ static int mt_process_slot(struct mt_device *td, struct input_dev *input,
>                          * lift-off as userspace will not be aware
>                          * of non-confidence, so we need to split
>                          * it into 2 events: active MT_TOOL_PALM
> -                        * and a separate liftoff.
> +                        * and a separate lift off.
>                          */
>                         active = true;
>                         set_bit(slotnum, app->pending_palm_slots);
>                 }
>         }
>
> +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> +               mt_fill_slot_state(&state, slot);
> +               /* Check if every field in the slot is the same as before.
> +                * Some touchscreens report the same position for several
> +                * frames even though the finger is no longer on the surface.
> +                * This is actually being recognised as the finger remaining in
> +                * one position, which causes scrolling to be stopped.
> +                * Ignore such packets so that the scrolling continues
> +                * and the touchscreen reports the finger liftoff.
> +                */
> +               if (!mt_is_slot_state_equal(&state,
> +                                           &app->mt_slot_state[slotnum])) {
> +                       app->touch_change |= (active ||
> +                                             app->mt_slot_state[slotnum].tip_state);
> +                       app->repeated_counter = 0;
> +               } else {
> +#define MT_MAX_REPEATED_DROPPED 5
> +                       if (app->repeated_counter < MT_MAX_REPEATED_DROPPED) {
> +                               active = false;
> +                               if (app->touched)
> +                                       app->touch_change = true;
> +                       } else {
> +                               app->touch_change = true;
> +                       }
> +                       app->repeated_counter++;
> +               }
> +               app->touched = active;
> +               app->mt_slot_state[slotnum] = state;
> +       }
>         input_mt_slot(input, slotnum);
>         input_mt_report_slot_state(input, tool, active);
>         if (active) {
> @@ -1296,6 +1413,18 @@ static int mt_touch_input_configured(struct hid_device *hdev,
>         if (!app->pending_palm_slots)
>                 return -ENOMEM;
>
> +       if (app->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> +               app->mt_slot_state = devm_kcalloc(&hi->input->dev,
> +                                                 td->maxcontacts,
> +                                                 sizeof(*app->mt_slot_state),
> +                                                 GFP_KERNEL);
> +               if (!app->mt_slot_state)
> +                       return -ENOMEM;
> +               mt_clear_slot_states(app->mt_slot_state, td->maxcontacts);
> +               app->repeated_counter = 0;
> +       }
> +
> +
>         ret = input_mt_init_slots(input, td->maxcontacts, app->mt_flags);
>         if (ret)
>                 return ret;
> @@ -1676,6 +1805,12 @@ static void mt_release_contacts(struct hid_device *hid)
>
>         list_for_each_entry(application, &td->applications, list) {
>                 application->num_received = 0;
> +               if (application->quirks & MT_QUIRK_DROP_REPEATED_SLOT) {
> +                       application->touch_change = false;
> +                       mt_clear_slot_states(application->mt_slot_state,
> +                                            td->maxcontacts);
> +                       application->repeated_counter = 0;
> +               }
>         }
>  }
>
> @@ -2014,6 +2149,15 @@ static const struct hid_device_id mt_devices[] = {
>                 MT_USB_DEVICE(USB_VENDOR_ID_ILITEK,
>                         USB_DEVICE_ID_ILITEK_MULTITOUCH) },
>
> +       /* Ilitek 106E/F touchscreen */
> +       {  .driver_data = MT_CLS_ILITEK_016x,
> +               HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> +                       USB_VENDOR_ID_ILITEK, USB_DEVICE_ID_ILITEK_016E) },
> +
> +       {  .driver_data = MT_CLS_ILITEK_016x,
> +               HID_DEVICE(HID_BUS_ANY, HID_GROUP_MULTITOUCH_WIN_8,
> +                       USB_VENDOR_ID_ILITEK, USB_DEVICE_ID_ILITEK_016F) },
> +
>         /* LG Melfas panel */
>         { .driver_data = MT_CLS_LG,
>                 HID_USB_DEVICE(USB_VENDOR_ID_LG,
> --
> 2.35.1.1021.g381101b075-goog
>
