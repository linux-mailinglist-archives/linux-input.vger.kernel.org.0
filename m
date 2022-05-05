Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E677051BB02
	for <lists+linux-input@lfdr.de>; Thu,  5 May 2022 10:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350491AbiEEIzo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 5 May 2022 04:55:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiEEIzm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 5 May 2022 04:55:42 -0400
X-Greylist: delayed 81 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 05 May 2022 01:52:03 PDT
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.129.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 23BD32899B
        for <linux-input@vger.kernel.org>; Thu,  5 May 2022 01:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651740721;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=K6+SOiD0bIpWYUdMoulUiMSgZuC85tzHLpVgtiIneH0=;
        b=A30rqR9dvWkhLYTzhnD8d52RnD5PZwsb3DttKqsd9s2AVDVBUbYs/JpaiozgRjXK7Elp+R
        LteyecgS4OUDDkByJDeIktQvdLIC8nxFbah5jWkBdtUobD5xNwYKJI97+bcim7r/3bszva
        A5Es/Q1ifCV/8b9cVzkQe9qGMlmz9O8=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-Qv9DynbRO1KH7FC261N1_w-1; Thu, 05 May 2022 04:50:37 -0400
X-MC-Unique: Qv9DynbRO1KH7FC261N1_w-1
Received: by mail-pg1-f199.google.com with SMTP id q13-20020a638c4d000000b003821725ad66so1878640pgn.23
        for <linux-input@vger.kernel.org>; Thu, 05 May 2022 01:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K6+SOiD0bIpWYUdMoulUiMSgZuC85tzHLpVgtiIneH0=;
        b=qMhVSc1tir5XBsc/SRg5iSgGsZU/ADKRy/jZjJkDVMyjlHsLp6Zq9JA/SHcMOp7NbO
         weLjHqbl39vXi9lFYGhPTtarp5MBO8J2Peyi9yLuEir9GND/K9Z2Vx/EHjcG0mk6Bwc6
         rWSzM/iPvQNyzr0rZF98NT/2TdnbsIKYmDDVkdp6MtBN0bNRD94wN2Tkt9bXEK8zhJjF
         /GOlQOIxOdyfUpQLOU7QEHVGZ/bOykWYPzGupeNd43EtDz1b53BZ9rSUz81+CDaitdku
         4mAfq8HcUgxTRpmRwf5hy41T5gduamijH44nJVzDKHU/ap0mqhypmy9jUvRJ836ejFl3
         fxPg==
X-Gm-Message-State: AOAM531Ikwe9ORwIAYdEytstE1r6mH7XGuer951mVSAlhEn3kqGdwaHN
        loBaA24xWPu3uPLqafnbr4wcAIic+yiQWQiTorw8krq5fLtAs/h/5v51X8pmrAHnaYtLcuWGdv4
        IKHV5JCjvOjFGe03pgtuW0mymFwY1y4iWmaa6iOg=
X-Received: by 2002:a17:902:e012:b0:15d:53:61ff with SMTP id o18-20020a170902e01200b0015d005361ffmr25873908plo.73.1651740635527;
        Thu, 05 May 2022 01:50:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgzFHSUTcaUyOYYoJPVae7t+kMyZZNH2sjQ0IEZAL+6/Jzq6zjD4GG+rsiDYiER41GUCAjZCiHjyRvzan/2Tg=
X-Received: by 2002:a17:902:e012:b0:15d:53:61ff with SMTP id
 o18-20020a170902e01200b0015d005361ffmr25873896plo.73.1651740635251; Thu, 05
 May 2022 01:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220427224526.35657-1-vi@endrift.com>
In-Reply-To: <20220427224526.35657-1-vi@endrift.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Thu, 5 May 2022 10:50:24 +0200
Message-ID: <CAO-hwJKLr0z98bpt7QnvVWp2QzqDq6jCW+Lj0CgWW0vhYZuNLg@mail.gmail.com>
Subject: Re: [PATCH 1/6] HID: hid-playstation: Allow removal of touchpad
To:     Vicki Pfau <vi@endrift.com>
Cc:     "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>,
        Jiri Kosina <jikos@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Vicki,

On Thu, Apr 28, 2022 at 12:52 AM Vicki Pfau <vi@endrift.com> wrote:
>
> This allows the touchpad input_dev to be removed and have the driver remain
> functional without its presence. This will be used to allow the touchpad to
> be disabled, e.g. by a module parameter.

Thanks for the contribution.
I'd like to hear from Roderick, but I have a general comment here:
We had Wii and Steam controllers following this logic. Now we are
adding Sony PS ones... That seems like a lot of duplication, and I
wonder if we should not have something more generic.

We are working on an ioctl to revoke hidraw nodes and I wonder if we
should not take this opportunity to have a more generic mechanism in
HID to also disable input events when the hidraw node is opened...

One comment on the code itself below.

>
> Signed-off-by: Vicki Pfau <vi@endrift.com>
> ---
>  drivers/hid/hid-playstation.c | 60 +++++++++++++++++++++++++----------
>  1 file changed, 43 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> index ab7c82c2e886..f859a8dd8a2e 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> @@ -29,6 +29,7 @@ static DEFINE_IDA(ps_player_id_allocator);
>  struct ps_device {
>         struct list_head list;
>         struct hid_device *hdev;
> +       struct mutex mutex;
>         spinlock_t lock;
>
>         uint32_t player_id;
> @@ -130,7 +131,7 @@ struct dualsense {
>         struct ps_device base;
>         struct input_dev *gamepad;
>         struct input_dev *sensors;
> -       struct input_dev *touchpad;
> +       struct input_dev __rcu *touchpad;
>
>         /* Calibration data for accelerometer and gyroscope. */
>         struct ps_calibration_data accel_calib_data[3];
> @@ -590,6 +591,22 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
>         return touchpad;
>  }
>
> +static void dualsense_unregister_touchpad(struct dualsense *ds)
> +{
> +       struct input_dev *touchpad;
> +
> +       rcu_read_lock();
> +       touchpad = rcu_dereference(ds->touchpad);
> +       rcu_read_unlock();
> +
> +       if (!touchpad)
> +               return;
> +
> +       RCU_INIT_POINTER(ds->touchpad, NULL);
> +       synchronize_rcu();
> +       input_unregister_device(touchpad);
> +}
> +
>  static ssize_t firmware_version_show(struct device *dev,
>                                 struct device_attribute
>                                 *attr, char *buf)
> @@ -888,6 +905,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>         struct hid_device *hdev = ps_dev->hdev;
>         struct dualsense *ds = container_of(ps_dev, struct dualsense, base);
>         struct dualsense_input_report *ds_report;
> +       struct input_dev *touchpad = NULL;
>         uint8_t battery_data, battery_capacity, charging_status, value;
>         int battery_status;
>         uint32_t sensor_timestamp;
> @@ -1002,24 +1020,29 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
>         input_event(ds->sensors, EV_MSC, MSC_TIMESTAMP, ds->sensor_timestamp_us);
>         input_sync(ds->sensors);
>
> -       for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
> -               struct dualsense_touch_point *point = &ds_report->points[i];
> -               bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
> +       rcu_read_lock();
> +       touchpad = rcu_dereference(ds->touchpad);
> +       rcu_read_unlock();
> +       if (touchpad) {

Access to touchpad should probably be guarded under RCU (that's what I
understand when I read
https://www.kernel.org/doc/html/latest/RCU/whatisRCU.html#rcu-dereference)

> +               for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
> +                       struct dualsense_touch_point *point = &ds_report->points[i];
> +                       bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
>
> -               input_mt_slot(ds->touchpad, i);
> -               input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
> +                       input_mt_slot(ds->touchpad, i);
> +                       input_mt_report_slot_state(ds->touchpad, MT_TOOL_FINGER, active);
>
> -               if (active) {
> -                       int x = (point->x_hi << 8) | point->x_lo;
> -                       int y = (point->y_hi << 4) | point->y_lo;
> +                       if (active) {
> +                               int x = (point->x_hi << 8) | point->x_lo;
> +                               int y = (point->y_hi << 4) | point->y_lo;
>
> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
> -                       input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
> +                               input_report_abs(ds->touchpad, ABS_MT_POSITION_X, x);
> +                               input_report_abs(ds->touchpad, ABS_MT_POSITION_Y, y);
> +                       }
>                 }
> +               input_mt_sync_frame(ds->touchpad);
> +               input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
> +               input_sync(ds->touchpad);
>         }
> -       input_mt_sync_frame(ds->touchpad);
> -       input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_BUTTONS2_TOUCHPAD);
> -       input_sync(ds->touchpad);
>
>         battery_data = ds_report->status & DS_STATUS_BATTERY_CAPACITY;
>         charging_status = (ds_report->status & DS_STATUS_CHARGING) >> DS_STATUS_CHARGING_SHIFT;
> @@ -1141,6 +1164,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>  {
>         struct dualsense *ds;
>         struct ps_device *ps_dev;
> +       struct input_dev *touchpad;
>         uint8_t max_output_report_size;
>         int ret;
>
> @@ -1157,6 +1181,7 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>         ps_dev = &ds->base;
>         ps_dev->hdev = hdev;
>         spin_lock_init(&ps_dev->lock);
> +       mutex_init(&ps_dev->mutex);

This mutex is never used.

Cheers,
Benjamin

>         ps_dev->battery_capacity = 100; /* initial value until parse_report. */
>         ps_dev->battery_status = POWER_SUPPLY_STATUS_UNKNOWN;
>         ps_dev->parse_report = dualsense_parse_report;
> @@ -1204,11 +1229,12 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
>                 goto err;
>         }
>
> -       ds->touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
> -       if (IS_ERR(ds->touchpad)) {
> -               ret = PTR_ERR(ds->touchpad);
> +       touchpad = ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCHPAD_HEIGHT, 2);
> +       if (IS_ERR(touchpad)) {
> +               ret = PTR_ERR(touchpad);
>                 goto err;
>         }
> +       rcu_assign_pointer(ds->touchpad, touchpad);
>
>         ret = ps_device_register_battery(ps_dev);
>         if (ret)
> --
> 2.36.0
>

