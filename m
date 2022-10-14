Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178515FF086
	for <lists+linux-input@lfdr.de>; Fri, 14 Oct 2022 16:46:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbiJNOqN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Oct 2022 10:46:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiJNOqM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Oct 2022 10:46:12 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E8DDF5CE1
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 07:46:11 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id i21so3460589ljh.12
        for <linux-input@vger.kernel.org>; Fri, 14 Oct 2022 07:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SGo+4kRRTlzwCKx24qt83WDE3yT0UWI2PCAzs83oGes=;
        b=dMQgsLU+QieqHEimQA9THMh5SHMPaex3sk3d0l24fiQc6jWUDNtS6d5md+C3S3QCWg
         dlTI4GKnF4mRkTH33mSkIOGC1OwH9lpVqWQJYjbWSmRDj7H4D0k7i2mDTMhTOWn2i5uc
         QC9Jj96zivJ3tTsj/Gnkv8Yuo2b445rxES3qmUGwdNwqYN2YPZMSOXFLDjzmYQZ575Md
         t32OZphBLnW3mOjw/I5RRFMk4mYkVJr6x9R/Bj23RhvTuq0buq7+maWN+wI1BJhKX+1v
         pbiC4NeP5MWuv8d+1zYMULuAjXoDgOXi2v5ohadPrRMrgNXAq7FPO8i56/Hnn34JbBSo
         jejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SGo+4kRRTlzwCKx24qt83WDE3yT0UWI2PCAzs83oGes=;
        b=I1Bg2KQxU93ckDVrA17oI9AGp27nTpBS8nn93Xw0QNoVapCkpsWvUQFM8AvqiITnZ7
         yV3l27+lg0ScIlotxhuVmB58RXKNJx8QlXqZUYce+7odyNqGYHTl9BmqI8tnynzsEUiG
         C5hrpmYvXpQjC36NqwkQy21wXHUrxVD8DbN0U5RPPqNCEcU5Sf8xZb/VcXm9NgNxkBQV
         Rq7EQvHhIGsWHfeLo/RIZPKOL+wR7vKToA+zgSAm7MHZr3rz5m0HiDtGr9E0vhFBuXUy
         j5Mt2d5Lup+k36rjpfbIf/8isMr/WRlsvVxfrriszVstvcjwFTdm1RA7jcsRgWmqyjB5
         ltRQ==
X-Gm-Message-State: ACrzQf1x/i6+6N+M8lx4yh+Hut9TRajem3nLNQI0MNDvCEBenoMJk8jR
        V/6//qzOvwZFggJpiW3XFZInVSBQ9tmbWTLgP4o=
X-Google-Smtp-Source: AMsMyM7NurE/DGzcGpMGDgtNJv6uDkSTsidbO+pjXa+fIZyI5vaCYLgvbNVAmdyZIYc6tAEukIoXISPK9SGFyKAtlGw=
X-Received: by 2002:a05:651c:88a:b0:26c:81e1:57dc with SMTP id
 d10-20020a05651c088a00b0026c81e157dcmr2125239ljq.236.1665758769391; Fri, 14
 Oct 2022 07:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20221010212313.78275-1-roderick.colenbrander@sony.com>
 <20221010212313.78275-4-roderick.colenbrander@sony.com> <CAO-hwJKp2gzgPaCivT1Ak4=NZOcb0wyWbOyWnhsyDQgx1UC9AA@mail.gmail.com>
In-Reply-To: <CAO-hwJKp2gzgPaCivT1Ak4=NZOcb0wyWbOyWnhsyDQgx1UC9AA@mail.gmail.com>
From:   Roderick Colenbrander <thunderbird2k@gmail.com>
Date:   Fri, 14 Oct 2022 07:45:56 -0700
Message-ID: <CAEc3jaBe7d7K3zQpmSvWpzEpZJvvMW-es0+JfQEBKR3pJ7=-JQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] HID: playstation: support updated DualSense rumble mode.
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

On Fri, Oct 14, 2022 at 4:48 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> On Mon, Oct 10, 2022 at 11:23 PM Roderick Colenbrander
> <roderick@gaikai.com> wrote:
> >
> > Newer DualSense firmware supports a revised classic rumble mode,
> > which feels more similar to rumble as supported on previous PlayStation
> > controllers. It has been made the default on PlayStation and non-PlayStation
> > devices now (e.g. iOS and Windows). Default to this new mode when
> > supported.
> >
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > ---
> >  drivers/hid/hid-playstation.c | 37 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> > index 396356b6760a..2a9870a62301 100644
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
> > +       uint16_t update_version;
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
> > @@ -812,6 +820,15 @@ static int dualsense_get_firmware_info(struct dualsense *ds)
> >         ds->base.hw_version = get_unaligned_le32(&buf[24]);
> >         ds->base.fw_version = get_unaligned_le32(&buf[28]);
> >
> > +       /* Update version is some kind of feature version. It is distinct from
> > +        * the firmware version as there can be many different variations of a
> > +        * controller over time with the same physical shell, but with different
> > +        * PCBs and other internal changes. The update version (internal name) is
> > +        * used as a means to detect what features are available and change behavior.
> > +        * Note: the version is different between DualSense and DualSense Edge.
> > +        */
> > +       ds->update_version = get_unaligned_le16(&buf[44]);
> > +
> >  err_free:
> >         kfree(buf);
> >         return ret;
> > @@ -974,7 +991,10 @@ static void dualsense_output_worker(struct work_struct *work)
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
> > @@ -1348,6 +1368,21 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
> >                 return ERR_PTR(ret);
> >         }
> >
> > +       /* Original DualSense firmware simulated classic controller rumble through
> > +        * its new haptics hardware. It felt different from classic rumble users
> > +        * were used to. Since then new firmwares were introduced to change behavior
> > +        * and make this new 'v2' behavior default on PlayStation and other platforms.
> > +        * The original DualSense requires a new enough firmware as bundled with PS5
> > +        * software released in 2021. DualSense edge supports it out of the box.
> > +        * Both devices also support the old mode, but it is not really used.
> > +        */
> > +       if (hdev->product == USB_DEVICE_ID_SONY_PS5_CONTROLLER) {
> > +               /* Feature version 2.21 introduced new vibration method. */
> > +               ds->use_vibration_v2 = ds->update_version >= DS_FEATURE_VERSION(2, 21) ? true : false;
>
> I have removed the extra "? true : false" and applied the full series
> to for-6.1/upstream-fixes.
>
> I'll let things in for-next for a few days and hopefully send it to
> Linus next week.
>
> Cheers,
> Benjamin
>

Thanks! I will pull in the changes locally and rebase all the new DS4
driver work, which I will send out soon. That will be quite a large
update.

Thanks,
Roderick
