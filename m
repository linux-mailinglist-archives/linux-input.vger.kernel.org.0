Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9695FA2B8
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 19:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229450AbiJJRZt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 13:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbiJJRZs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 13:25:48 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4B274DDB
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 10:25:47 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1326637be6eso13156330fac.13
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 10:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHKH56qi/NEcES60jrMpZ6XVearG4anGPUIif/XGTzo=;
        b=cFCeZkErx0pUpHOC6ZGa2oANu3VlZabdbIU4xxzoJKGWXhsXQlJUCLQM4dIHa6GeB5
         nhBzCx9OEQwEObqPBRCvd6gT/BLEcsgGx7ZVtQD7lu6Bi6Gu29d+qEuequbnZXMUrsgm
         brCJV102iiEwAU4KONbxTKeWvles2xgKk0r6qqUmiPWDGG5X2jtnMxB/6cExRGnXrFqB
         f/+fk/kkO5hqvO4htZrnX/TjtTSlSAE3QeX6v56hL+9uSRjLrBukoy7iPyLWBKnur/DC
         uY66SyNVCL0igrlEdc6VeFbcFWGLWpihXMg9RO76nmKPEM1iYq90Mg+XMJD+gyHNQ4tm
         iQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHKH56qi/NEcES60jrMpZ6XVearG4anGPUIif/XGTzo=;
        b=Z/MNoQkSs8vCJtPuXNI3HKprX0JQig62hMAdHEp/koWOrEhtjDDCHQKnUuN2qj5H2x
         +kERK7k+VP47DLaqBAqAW0ffoblM9NHrGuMww43u12fUQG6lyB0a4cNyh+ASSUPTD/3d
         Go3P4NfxGq8muSF2FCyYPov1DkNNvRdxDv4mgntFg/kfapgKz1WDXIplNK4pLA3c7pyV
         BnKXSW3RtEc7o0l+5fSqOJK9PsCs7wmETfJY4Ke0U3UCamU+CQJYvtFZTp7Rndj5/bWY
         faSyzTrZUihQWJBUkt03mUvinBuwlYlAwiH0vjSDYyk7vJ/zmPl2m42dQ2xBdIaIhOvr
         LQbA==
X-Gm-Message-State: ACrzQf0NBhdPWYOi6IqQPJQCOdEZYfZBzeWFaJh8ioVEgTTZ+tKUufIU
        rFRuNz+v0okwigGYsgxI1jEKe4xrAUUsiSGhh0Q=
X-Google-Smtp-Source: AMsMyM7fjIkD4m7tetlgUCinkwWUHywpugm2tPbNrjS13ys3Kfp6xSyttZqcincp2LVoW5wi/4iW9NM/6VlxeI4PDxA=
X-Received: by 2002:a05:6870:a913:b0:12c:55d6:968 with SMTP id
 eq19-20020a056870a91300b0012c55d60968mr16165533oab.244.1665422746868; Mon, 10
 Oct 2022 10:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221006020151.132434-1-roderick.colenbrander@sony.com>
 <20221006020151.132434-4-roderick.colenbrander@sony.com> <CAO-hwJJF4ej8J9GLb+pCaH0Ke+xLqxa6Fz5BFQ895DX5fmjPmA@mail.gmail.com>
In-Reply-To: <CAO-hwJJF4ej8J9GLb+pCaH0Ke+xLqxa6Fz5BFQ895DX5fmjPmA@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Mon, 10 Oct 2022 10:25:35 -0700
Message-ID: <CAEc3jaDDq4OY-WHEZUjzG32p354LXVgvLYZ1-bR+jLwnoGbdxQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] HID: playstation: support updated DualSense rumble mode.
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Roderick Colenbrander <roderick@gaikai.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Benjamin,

On Mon, Oct 10, 2022 at 2:23 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Roderick,
>
> On Thu, Oct 6, 2022 at 4:02 AM Roderick Colenbrander
> <roderick@gaikai.com> wrote:
> >
> > Newer DualSense firmware supports a revised classic rumble mode,
> > which feels more similar to rumble as supported on previous PlayStation
> > controllers. It has been made the default on PlayStation and non-PlayStation
> > devices now (e.g. iOS and Windows). Default to this new mode when
> > supported.
>
> I am trying to see if this patch is 6.1 or 6.2 material. So I have a
> couple of questions for you:
> - on the current dualsense controller, with an updated firmware, is
> there any drawback in keeping the current code, or do we need to
> upgrade to the new one to keep functionalities?

Newer firmware supports both old and new methods. On actual PS5 the
old paths don't really get used anymore as the system defaults to the
new mode, some games may opt in to use the old method. Across
platforms we have standardized on this new method over the last year.
Windows, iOS and even SDL2 have supported it for a while now. This
would bring Linux and Android in sync.

> - on the new dualsense edge, does it support the old rumble, and so do
> I need to tie the addition of the DualSense Edge to this one patch?

There is no drawback into using the old code on DualSense Edge. The
new code is obviously desired and on iOS / PS5 would likely only ever
use the new code.

If this is too large of a change for 6.1, it is fine to delay just
this patch to 6.2. Though I can easily make an updated patch today
with the tweaks suggested below.



> >
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > ---
> >  drivers/hid/hid-playstation.c | 39 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 38 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> > index 396356b6760a..e05c61942971 100644
> > --- a/drivers/hid/hid-playstation.c
> > +++ b/drivers/hid/hid-playstation.c
> > @@ -108,6 +108,9 @@ struct ps_led_info {
> >  #define DS_STATUS_CHARGING             GENMASK(7, 4)
> >  #define DS_STATUS_CHARGING_SHIFT       4
> >
> > +/* Feature version from DualSense Firmware Info report. */
> > +#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))
> > +
> >  /*
> >   * Status of a DualSense touch point contact.
> >   * Contact IDs, with highest bit set are 'inactive'
> > @@ -126,6 +129,7 @@ struct ps_led_info {
> >  #define DS_OUTPUT_VALID_FLAG1_RELEASE_LEDS BIT(3)
> >  #define DS_OUTPUT_VALID_FLAG1_PLAYER_INDICATOR_CONTROL_ENABLE BIT(4)
> >  #define DS_OUTPUT_VALID_FLAG2_LIGHTBAR_SETUP_CONTROL_ENABLE BIT(1)
> > +#define DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2 BIT(2)
> >  #define DS_OUTPUT_POWER_SAVE_CONTROL_MIC_MUTE BIT(4)
> >  #define DS_OUTPUT_LIGHTBAR_SETUP_LIGHT_OUT BIT(1)
> >
> > @@ -143,6 +147,9 @@ struct dualsense {
> >         struct input_dev *sensors;
> >         struct input_dev *touchpad;
> >
> > +       /* Update version is used as a feature/capability version. */
> > +       __le16 update_version;
>
> Technically, if I am not wrong, the value stored here was already
> processed through get_unaligned_le16(), so you have a u16, and more
> likely to be consistent you should use uint16_t.

Yep, should change that one.

> > +
> >         /* Calibration data for accelerometer and gyroscope. */
> >         struct ps_calibration_data accel_calib_data[3];
> >         struct ps_calibration_data gyro_calib_data[3];
> > @@ -153,6 +160,7 @@ struct dualsense {
> >         uint32_t sensor_timestamp_us;
> >
> >         /* Compatible rumble state */
> > +       bool use_vibration_v2;
> >         bool update_rumble;
> >         uint8_t motor_left;
> >         uint8_t motor_right;
> > @@ -812,6 +820,14 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
> >         ds->base.hw_version = get_unaligned_le32(&buf[24]);
> >         ds->base.fw_version = get_unaligned_le32(&buf[28]);
> >
> > +       /* Update version is some kind of feature version. It is distinct from
> > +        * the firmware version as there can be many different variations of a
> > +        * controller over time with the same physical shell, but with different
> > +        * PCBs and other internal changes. The update version (internal name) is
> > +        * used as a means to detect what features are available and change behavior.
> > +        */
> > +       ds->update_version = get_unaligned_le16(&buf[44]);
> > +
> >  err_free:
> >         kfree(buf);
> >         return ret;
> > @@ -974,7 +990,10 @@ static void dualsense_output_worker(struct work_struct *work)
> >         if (ds->update_rumble) {
> >                 /* Select classic rumble style haptics and enable it. */
> >                 common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_HAPTICS_SELECT;
> > -               common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
> > +               if (ds->use_vibration_v2)
> > +                       common->valid_flag2 |= DS_OUTPUT_VALID_FLAG2_COMPATIBLE_VIBRATION2;
> > +               else
> > +                       common->valid_flag0 |= DS_OUTPUT_VALID_FLAG0_COMPATIBLE_VIBRATION;
> >                 common->motor_left = ds->motor_left;
> >                 common->motor_right = ds->motor_right;
> >                 ds->update_rumble = false;
> > @@ -1348,6 +1367,24 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
> >                 return ERR_PTR(ret);
> >         }
> >
> > +#define DS_FEATURE_VERSION(major, minor) ((major & 0xff) << 8 | (minor & 0xff))
>
> Was already defined above AFAICT

Weird,... I thought I had left that out. Quick to fix.

> > +       /* Original DualSense firmware simulated classic controller rumble through
> > +        * its new haptics hardware. It felt different from classic rumble users
> > +        * were used to. Since then new firmwares were introduced to change behavior
> > +        * and make this new 'v2' behavior default on PlayStation and other platforms.
> > +        * The original DualSense requires a new enough firmware as bundled with PS5
> > +        * software released in 2021. DualSense edge supports it out of the box.
> > +        */
> > +       if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> > +               /* Feature version 2.21 introduced new vibration method. */
> > +               if (ds->update_version < DS_FEATURE_VERSION(2, 21))
> > +                       ds->use_vibration_v2 = false;
> > +               else
> > +                       ds->use_vibration_v2 = true;
>
> if (conditional) then false else true; can easily be transformed into
> ds->use_vibration_v2 = ds->update_version >= DS_FEATURE_VERSION(2, 21)
> :)

Yep, will change.

> > +       } else if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER_2) {
> > +               ds->use_vibration_v2 = true;
> > +       }
> > +
> >         ret = ps_devices_list_add(ps_dev);
> >         if (ret)
> >                 return ERR_PTR(ret);
> > --
> > 2.37.3
> >
>
> Cheers,
> Benjamin
>

Thanks,
Roderick
