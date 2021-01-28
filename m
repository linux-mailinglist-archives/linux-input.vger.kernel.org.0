Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03611307BD1
	for <lists+linux-input@lfdr.de>; Thu, 28 Jan 2021 18:11:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhA1RJN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Jan 2021 12:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232450AbhA1RIQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Jan 2021 12:08:16 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E19FCC061786
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:07:35 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id j4so3112245qvk.6
        for <linux-input@vger.kernel.org>; Thu, 28 Jan 2021 09:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+0K+MfnIWRPOq0TRt9VvD4SQ8THcWTJll6eXqg6DOkg=;
        b=KZVI6PKvQ6RNPbei+0JbQ/pnSIvzwvu5+FVSGR+2sNm3t1DNI79t//t7reSd+p1bwC
         25gIqs9bjPHrKKGlq/vH9tJ+ceUwzd+qdOT1SBcnXgH2z3go0Nimstksh1CPnLhPUHdi
         SF1q32V41K0Elj945N9Q+bUNECCnjNEN6zr9FD1oj5qnj/JtvAAyooJpouRtxXpqDlYu
         fYZa9EkQXFP78TexZc1MAZ5GKvmqmLJCCFs1sdEpHWxEsIh9jxkvqq3Squ4y2bqpp/wL
         UM1e3UIVykuzupslpY4WXtxsQ296+6eg+IxKPlhWzZvaIdw6UDTXUeq5hza5o9dYUkjy
         yd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0K+MfnIWRPOq0TRt9VvD4SQ8THcWTJll6eXqg6DOkg=;
        b=tXk/ibV/k58tyI2UJxuFh2usWDLmAEIa1ZxCY27pOVpOsnZLfrDDIhPKJGnlfl/sU6
         g50X+OZ0YH79Cg7dnnQ5gncAMZ+qDqCWNZX/1BwQzHJ4PnOkkdIxEtM3LwuH5Vh1TNtm
         fm7XLUOaMFcGsYXATUP/GF526EUaurm0p1jKHZCzm9okAx98IBOJ93SLY0uFPcu3En1h
         GbXph50Tzc9t+XGsT/N732ntEANML8oPoIv6JdDcm59Wi34Av3+Fj3ewqVXGZ1uMoi8k
         FbYFsu5rGiKaBzPSpgj68aKmqSk/vHaJtEXB0dAXD1aLswdU/t32qPa6Zw39MwBBzeYe
         /hIw==
X-Gm-Message-State: AOAM532sPFEwp+FRHGYWK6Ogxa8W5FgzhNxCKhYleBtvPfj2dlPWJ4yw
        lTSouwoxohY56mno+sZA6zbXNcropVh/D3MYFfZkUMCLUtE=
X-Google-Smtp-Source: ABdhPJwaaT4DZEy2V6h58KbcGmmoxSEtOWidZAwpzZGG7WZXnF9DIib92ytTnnJIoKL39vVoCXhbk38z/1BTNesnpOI=
X-Received: by 2002:a05:6214:c27:: with SMTP id a7mr183447qvd.54.1611853655069;
 Thu, 28 Jan 2021 09:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20210117234435.180294-1-roderick@gaikai.com> <20210117234435.180294-6-roderick@gaikai.com>
 <c379c789-fb94-a2f3-ee9a-10aba6df6315@redhat.com>
In-Reply-To: <c379c789-fb94-a2f3-ee9a-10aba6df6315@redhat.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Thu, 28 Jan 2021 09:07:24 -0800
Message-ID: <CANndSKmgkKdQN3jdfO48TktkU8hXpaBdNUMVa=9pPTXi3Mnmdw@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] HID: playstation: add DualSense accelerometer
 and gyroscope support.
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jan 28, 2021 at 6:48 AM Benjamin Tissoires
<benjamin.tissoires@redhat.com> wrote:
>
> Hi Roderick,
>
> On 1/18/21 12:44 AM, Roderick Colenbrander wrote:
> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > The DualSense features an accelerometer and gyroscope. The data is
> > embedded into the main HID input reports. Expose both sensors through
> > through a separate evdev node.
> >
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > ---
> >   drivers/hid/hid-playstation.c | 166 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 166 insertions(+)
> >
> > diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.c
> > index 64d6d736c435..ef8da272cf59 100644
> > --- a/drivers/hid/hid-playstation.c
> > +++ b/drivers/hid/hid-playstation.c
> > @@ -32,9 +32,19 @@ struct ps_device {
> >       int (*parse_report)(struct ps_device *dev, struct hid_report *report, u8 *data, int size);
> >   };
> >
> > +/* Calibration data for playstation motion sensors. */
> > +struct ps_calibration_data {
> > +     int abs_code;
> > +     short bias;
> > +     int sens_numer;
> > +     int sens_denom;
> > +};
> > +
> >   #define DS_INPUT_REPORT_USB                 0x01
> >   #define DS_INPUT_REPORT_USB_SIZE            64
> >
> > +#define DS_FEATURE_REPORT_CALIBRATION                0x05
> > +#define DS_FEATURE_REPORT_CALIBRATION_SIZE   41
> >   #define DS_FEATURE_REPORT_PAIRING_INFO              0x09
> >   #define DS_FEATURE_REPORT_PAIRING_INFO_SIZE 20
> >
> > @@ -68,13 +78,27 @@ struct ps_device {
> >   #define DS_TOUCH_POINT_INACTIVE BIT(7)
> >
> >   /* DualSense hardware limits */
> > +#define DS_ACC_RES_PER_G     8192
> > +#define DS_ACC_RANGE         (4*DS_ACC_RES_PER_G)
> > +#define DS_GYRO_RES_PER_DEG_S        1024
> > +#define DS_GYRO_RANGE                (2048*DS_GYRO_RES_PER_DEG_S)
> >   #define DS_TOUCHPAD_WIDTH   1920
> >   #define DS_TOUCHPAD_HEIGHT  1080
> >
> >   struct dualsense {
> >       struct ps_device base;
> >       struct input_dev *gamepad;
> > +     struct input_dev *sensors;
> >       struct input_dev *touchpad;
> > +
> > +     /* Calibration data for accelerometer and gyroscope. */
> > +     struct ps_calibration_data accel_calib_data[3];
> > +     struct ps_calibration_data gyro_calib_data[3];
> > +
> > +     /* Timestamp for sensor data */
> > +     bool sensor_timestamp_initialized;
> > +     uint32_t prev_sensor_timestamp;
> > +     uint32_t sensor_timestamp_us;
> >   };
> >
> >   struct dualsense_touch_point {
> > @@ -312,6 +336,96 @@ static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int width,
> >       return touchpad;
> >   }
> >
> > +static int dualsense_get_calibration_data(struct dualsense *ds)
> > +{
> > +     short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> > +     short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
> > +     short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
> > +     short gyro_speed_plus, gyro_speed_minus;
> > +     short acc_x_plus, acc_x_minus;
> > +     short acc_y_plus, acc_y_minus;
> > +     short acc_z_plus, acc_z_minus;
> > +     int speed_2x;
> > +     int range_2g;
> > +     int ret = 0;
> > +     uint8_t *buf;
> > +
> > +     buf = kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
> > +     if (!buf)
> > +             return -ENOMEM;
> > +
> > +     ret = ps_get_report(ds->base.hdev, DS_FEATURE_REPORT_CALIBRATION, buf,
> > +                     DS_FEATURE_REPORT_CALIBRATION_SIZE);
> > +     if (ret) {
> > +             hid_err(ds->base.hdev, "Failed to retrieve DualSense calibration info: %d\n", ret);
> > +             goto err_free;
> > +     }
> > +
> > +     gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
> > +     gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
> > +     gyro_roll_bias   = get_unaligned_le16(&buf[5]);
> > +     gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
> > +     gyro_pitch_minus = get_unaligned_le16(&buf[9]);
> > +     gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
> > +     gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
> > +     gyro_roll_plus   = get_unaligned_le16(&buf[15]);
> > +     gyro_roll_minus  = get_unaligned_le16(&buf[17]);
> > +     gyro_speed_plus  = get_unaligned_le16(&buf[19]);
> > +     gyro_speed_minus = get_unaligned_le16(&buf[21]);
> > +     acc_x_plus       = get_unaligned_le16(&buf[23]);
> > +     acc_x_minus      = get_unaligned_le16(&buf[25]);
> > +     acc_y_plus       = get_unaligned_le16(&buf[27]);
> > +     acc_y_minus      = get_unaligned_le16(&buf[29]);
> > +     acc_z_plus       = get_unaligned_le16(&buf[31]);
> > +     acc_z_minus      = get_unaligned_le16(&buf[33]);
> > +
> > +     /*
> > +      * Set gyroscope calibration and normalization parameters.
> > +      * Data values will be normalized to 1/DS_GYRO_RES_PER_DEG_S degree/s.
> > +      */
> > +     speed_2x = (gyro_speed_plus + gyro_speed_minus);
> > +     ds->gyro_calib_data[0].abs_code = ABS_RX;
> > +     ds->gyro_calib_data[0].bias = gyro_pitch_bias;
> > +     ds->gyro_calib_data[0].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
> > +     ds->gyro_calib_data[0].sens_denom = gyro_pitch_plus - gyro_pitch_minus;
> > +
> > +     ds->gyro_calib_data[1].abs_code = ABS_RY;
> > +     ds->gyro_calib_data[1].bias = gyro_yaw_bias;
> > +     ds->gyro_calib_data[1].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
> > +     ds->gyro_calib_data[1].sens_denom = gyro_yaw_plus - gyro_yaw_minus;
> > +
> > +     ds->gyro_calib_data[2].abs_code = ABS_RZ;
> > +     ds->gyro_calib_data[2].bias = gyro_roll_bias;
> > +     ds->gyro_calib_data[2].sens_numer = speed_2x*DS_GYRO_RES_PER_DEG_S;
> > +     ds->gyro_calib_data[2].sens_denom = gyro_roll_plus - gyro_roll_minus;
> > +
> > +     /*
> > +      * Set accelerometer calibration and normalization parameters.
> > +      * Data values will be normalized to 1/DS_ACC_RES_PER_G g.
> > +      */
> > +     range_2g = acc_x_plus - acc_x_minus;
> > +     ds->accel_calib_data[0].abs_code = ABS_X;
> > +     ds->accel_calib_data[0].bias = acc_x_plus - range_2g / 2;
> > +     ds->accel_calib_data[0].sens_numer = 2*DS_ACC_RES_PER_G;
> > +     ds->accel_calib_data[0].sens_denom = range_2g;
> > +
> > +     range_2g = acc_y_plus - acc_y_minus;
> > +     ds->accel_calib_data[1].abs_code = ABS_Y;
> > +     ds->accel_calib_data[1].bias = acc_y_plus - range_2g / 2;
> > +     ds->accel_calib_data[1].sens_numer = 2*DS_ACC_RES_PER_G;
> > +     ds->accel_calib_data[1].sens_denom = range_2g;
> > +
> > +     range_2g = acc_z_plus - acc_z_minus;
> > +     ds->accel_calib_data[2].abs_code = ABS_Z;
> > +     ds->accel_calib_data[2].bias = acc_z_plus - range_2g / 2;
> > +     ds->accel_calib_data[2].sens_numer = 2*DS_ACC_RES_PER_G;
> > +     ds->accel_calib_data[2].sens_denom = range_2g;
> > +
> > +err_free:
> > +     kfree(buf);
> > +     return ret;
> > +}
> > +
> >   static int dualsense_get_mac_address(struct dualsense *ds)
> >   {
> >       uint8_t *buf;
> > @@ -343,6 +457,7 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
> >       struct dualsense_input_report *ds_report;
> >       uint8_t battery_data, battery_capacity, charging_status, value;
> >       int battery_status;
> > +     uint32_t sensor_timestamp;
> >       unsigned long flags;
> >       int i;
> >
> > @@ -387,6 +502,44 @@ static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_report *r
> >       input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_BUTTONS2_PS_HOME);
> >       input_sync(ds->gamepad);
> >
> > +     /* Parse and calibrate gyroscope data. */
> > +     for (i = 0; i < ARRAY_SIZE(ds_report->gyro); i++) {
> > +             int raw_data = (short)le16_to_cpu(ds_report->gyro[i]);
> > +             int calib_data = mult_frac(ds->gyro_calib_data[i].sens_numer,
> > +                                        raw_data - ds->gyro_calib_data[i].bias,
> > +                                        ds->gyro_calib_data[i].sens_denom);
> > +
> > +             input_report_abs(ds->sensors, ds->gyro_calib_data[i].abs_code, calib_data);
> > +     }
> > +
> > +     /* Parse and calibrate accelerometer data. */
> > +     for (i = 0; i < ARRAY_SIZE(ds_report->accel); i++) {
> > +             int raw_data = (short)le16_to_cpu(ds_report->accel[i]);
> > +             int calib_data = mult_frac(ds->accel_calib_data[i].sens_numer,
> > +                                        raw_data - ds->accel_calib_data[i].bias,
> > +                                        ds->accel_calib_data[i].sens_denom);
> > +
> > +             input_report_abs(ds->sensors, ds->accel_calib_data[i].abs_code, calib_data);
> > +     }
> > +
> > +     /* Convert timestamp (in 0.33us unit) to timestamp_us */
> > +     sensor_timestamp = le32_to_cpu(ds_report->sensor_timestamp);
> > +     if (!ds->sensor_timestamp_initialized) {
> > +             ds->sensor_timestamp_us = DIV_ROUND_CLOSEST(sensor_timestamp, 3);
> > +             ds->sensor_timestamp_initialized = true;
> > +     } else {
> > +             uint32_t delta;
> > +
> > +             if (ds->prev_sensor_timestamp > sensor_timestamp)
> > +                     delta = (U32_MAX - ds->prev_sensor_timestamp + sensor_timestamp + 1);
> > +             else
> > +                     delta = sensor_timestamp - ds->prev_sensor_timestamp;
> > +             ds->sensor_timestamp_us += DIV_ROUND_CLOSEST(delta, 3);
> > +     }
> > +     ds->prev_sensor_timestamp = sensor_timestamp;
> > +     input_event(ds->sensors, EV_MSC, MSC_TIMESTAMP, ds->sensor_timestamp_us);
> > +     input_sync(ds->sensors);
> > +
> >       for (i = 0; i < ARRAY_SIZE(ds_report->points); i++) {
> >               struct dualsense_touch_point *point = &ds_report->points[i];
> >               bool active = (point->contact & DS_TOUCH_POINT_INACTIVE) ? false : true;
> > @@ -476,12 +629,25 @@ static struct ps_device *dualsense_create(struct hid_device *hdev)
> >       }
> >       snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address);
> >
> > +     ret = dualsense_get_calibration_data(ds);
> > +     if (ret) {
> > +             hid_err(hdev, "Failed to get calibration data from DualSense\n");
> > +             goto err;
> > +     }
> > +
> >       ds->gamepad = ps_gamepad_create(hdev);
> >       if (IS_ERR(ds->gamepad)) {
> >               ret = PTR_ERR(ds->gamepad);
> >               goto err;
> >       }
> >
> > +     ds->sensors = ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_PER_G,
>
> Looks like you got a bad rebase here. I have the following complain when
> compiling this series up to this patch:
>
> drivers/hid/hid-playstation.c: In function 'dualsense_create':
> drivers/hid/hid-playstation.c:644:16: error: implicit declaration of function 'ps_sensors_create' [-Werror=implicit-function-declaration]
>    644 |  ds->sensors = ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_PER_G,
>        |                ^~~~~~~~~~~~~~~~~
> drivers/hid/hid-playstation.c:644:14: warning: assignment to 'struct input_dev *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>    644 |  ds->sensors = ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_PER_G,
>        |              ^
>
>
> The function ps_sensors_create() gets added in "HID: playstation: add
> DualSense lightbar support", which seems like a mistake.
>

Arggh. Yep something bad during rebase. I fixed and double, double
checked and wrote a proper 'rebase -x' script to double check. I will
send it out again, hopefully 5th time is a charm.

Thanks,
Roderick
