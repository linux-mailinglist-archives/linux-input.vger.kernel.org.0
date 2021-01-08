Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A14362EED59
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 07:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbhAHGHm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 01:07:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbhAHGHm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 01:07:42 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EBE3C0612F4
        for <linux-input@vger.kernel.org>; Thu,  7 Jan 2021 22:07:01 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id 7so5962241qtp.1
        for <linux-input@vger.kernel.org>; Thu, 07 Jan 2021 22:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gaikai-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ukyOHRMIzEJGgqZ5pPrjQeaIvsdAIlI/rd0GDT9c2jk=;
        b=i4O24AxwDJGKOQcd0ObC+AJcsqEAmci0j+5SuHJhXPi7QWnW+ir7lk349nUQWriCd8
         CT6aoR7lbN7T7RD8ZMoxhKRMXPHjjEgfQ2YpO5o6QUi8bxpLkOLWVYdXbHdr+/w3l51Y
         Z4dn7nKdpsoWgfMonE9F/gfZvMTNDOl8hfON0zXOEh1jVgWcck7AIwzKIf1nOBL9iJ54
         1YDcmKIPvGKwfqmdIopwXQdVgV2Uh6qMXBi0ipG7aL45xCpGD6FnQnA0DosqYxtWVheu
         KbI+cetjEy5q5h2viIdtyAcjkx+OsQMHOhip6xV1DZCoF+3ySuPDSFs8VaEk/w6Wjja+
         wL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ukyOHRMIzEJGgqZ5pPrjQeaIvsdAIlI/rd0GDT9c2jk=;
        b=n9hzSAILwY+LFX7K0ha9J6jrWeI3pc6JD0pnEPvTknrTFpeli3ukvulk9ZT66Cnhox
         5ur5au82nxYfwY6oeOsEvsoFw8tnoUI7yS8xcYKNBAbcdiVGwZbkPbieL/P8b1E9S0C+
         RALE8gS0mAHLmZ969w/qDWfx7qIeEIUbFJf5XzE42XtMvylIb0Ig0hZadcizltyhNGqs
         PAlIH0rWkVhblXQ0g2QKYDoYOcC3aEWnPJ7fX3dIWUKYXabF4jpzl8KUovZw/55yYdPV
         abqkqSVkJ1qZEW9dQqYC84MluLMopGBxhiHe2+xKA1H4eYIXwqow8sz1EV5pVOK3XVQy
         YLvg==
X-Gm-Message-State: AOAM531qmKVNbTqaAA4Jed+Gu7qGnZhmnvyF3Le/rg1qQIhW6BSkqqpc
        W/MeBianTsVcKib1Qwvis2LjXjukzbJFqG8JEfwpjQ==
X-Google-Smtp-Source: ABdhPJx46RW+2iPBZA7dmvpnCrQQuo+Dzq1vYF5TY7vqbPksjup8UH8EFEQPSlzZXXsRlduzkjXQhXnvLIsnsslUafI=
X-Received: by 2002:aed:2d65:: with SMTP id h92mr2117235qtd.263.1610086020234;
 Thu, 07 Jan 2021 22:07:00 -0800 (PST)
MIME-Version: 1.0
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-6-roderick@gaikai.com>
 <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com>
In-Reply-To: <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com>
From:   Roderick Colenbrander <roderick@gaikai.com>
Date:   Thu, 7 Jan 2021 22:06:49 -0800
Message-ID: <CANndSKk9Z=ivs_TiuLd77Kv9DMdhqTcdQnobNfnfVPTd2Bpzqg@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer
 and gyroscope support.
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Barnab=C3=A1s,

Thanks for all your feedback (including other patches).

On Thu, Jan 7, 2021 at 10:52 AM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hi
>
>
> 2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrand=
er =C3=ADrta:
>
> > From: Roderick Colenbrander <roderick.colenbrander@sony.com>
> >
> > The DualSense features an accelerometer and gyroscope. The data is
> > embedded into the main HID input reports. Expose both sensors through
> > through a separate evdev node.
> >
> > Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> > [...]
> > +static struct input_dev *ps_sensors_create(struct hid_device *hdev, in=
t accel_range, int accel_res,
> > +             int gyro_range, int gyro_res)
> > +{
> > +     struct input_dev *sensors;
> > +     int ret;
> > +
> > +     sensors =3D ps_allocate_input_dev(hdev, "Motion Sensors");
> > +     if (IS_ERR(sensors))
> > +             return ERR_PTR(-ENOMEM);
>
> I know that at the moment ENOMEM is the only possible error, but I believ=
e
> `return ERR_CAST(sensors);` would be better. (Or even just `return sensor=
s;`.)
>
>
> > +
> > +     __set_bit(INPUT_PROP_ACCELEROMETER, sensors->propbit);
> > +
> > +     /* Accelerometer */
> > +     input_set_abs_params(sensors, ABS_X, -accel_range, accel_range, 1=
6, 0);
> > +     input_set_abs_params(sensors, ABS_Y, -accel_range, accel_range, 1=
6, 0);
> > +     input_set_abs_params(sensors, ABS_Z, -accel_range, accel_range, 1=
6, 0);
> > +     input_abs_set_res(sensors, ABS_X, accel_res);
> > +     input_abs_set_res(sensors, ABS_Y, accel_res);
> > +     input_abs_set_res(sensors, ABS_Z, accel_res);
> > +
> > +     /* Gyroscope */
> > +     input_set_abs_params(sensors, ABS_RX, -gyro_range, gyro_range, 16=
, 0);
> > +     input_set_abs_params(sensors, ABS_RY, -gyro_range, gyro_range, 16=
, 0);
> > +     input_set_abs_params(sensors, ABS_RZ, -gyro_range, gyro_range, 16=
, 0);
> > +     input_abs_set_res(sensors, ABS_RX, gyro_res);
> > +     input_abs_set_res(sensors, ABS_RY, gyro_res);
> > +     input_abs_set_res(sensors, ABS_RZ, gyro_res);
> > +
> > +     ret =3D input_register_device(sensors);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return sensors;
> > +}
> > [...]
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
> > +     int ret =3D 0;
> > +     uint8_t *buf;
> > +
> > +     buf =3D kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
> > +     if (!buf)
> > +             return -ENOMEM;
> > +
> > +     ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_CALIB=
RATION, buf,
> > +                     DS_FEATURE_REPORT_CALIBRATION_SIZE, HID_FEATURE_R=
EPORT, HID_REQ_GET_REPORT);
>
> I think it would be better if lines were aligned. I have missed this in o=
ther patches,
> so if you decide to make this change, please do it everywhere.

What do you mean with "if lines were aligned"? You mean aligning the
DS_FEATURE.. part with ds->base.hdev?

I'm almost tempted in the future (as part of a future patch series) to
perhaps have a ps_device_get_feature_report or something like that as
there is the same code in multiple places. It can do some nicer
checking as well (including to see if the first byte is the report ID
number, which is guaranteed for DualSense). I think it is a bit much
to add now, but probably in the future also when I add DualShock 4 in
here.

>
> > +     if (ret < 0)
> > +             goto err_free;
> > +     else if (ret !=3D DS_FEATURE_REPORT_CALIBRATION_SIZE) {
>
> As per coding style[1], please either use {} for all branches, or just dr=
op the
> `else` and maybe add a new line:
>
> ```
> if (ret < 0)
>   goto ...
>
> if (ret !=3D ...) {
>   ...
> }
> ```
>
>
> > +             hid_err(ds->base.hdev, "failed to retrieve DualSense cali=
bration info\n");
>
> I think this message could be improved to better pinpoint the exact probl=
em
> that triggered it.
>
>
> > +             ret =3D -EINVAL;
> > +             goto err_free;
> > +     }
> > +
> > +     gyro_pitch_bias  =3D get_unaligned_le16(&buf[1]);
> > +     gyro_yaw_bias    =3D get_unaligned_le16(&buf[3]);
> > +     gyro_roll_bias   =3D get_unaligned_le16(&buf[5]);
> > +     gyro_pitch_plus  =3D get_unaligned_le16(&buf[7]);
> > +     gyro_pitch_minus =3D get_unaligned_le16(&buf[9]);
> > +     gyro_yaw_plus    =3D get_unaligned_le16(&buf[11]);
> > +     gyro_yaw_minus   =3D get_unaligned_le16(&buf[13]);
> > +     gyro_roll_plus   =3D get_unaligned_le16(&buf[15]);
> > +     gyro_roll_minus  =3D get_unaligned_le16(&buf[17]);
> > +     gyro_speed_plus  =3D get_unaligned_le16(&buf[19]);
> > +     gyro_speed_minus =3D get_unaligned_le16(&buf[21]);
> > +     acc_x_plus       =3D get_unaligned_le16(&buf[23]);
> > +     acc_x_minus      =3D get_unaligned_le16(&buf[25]);
> > +     acc_y_plus       =3D get_unaligned_le16(&buf[27]);
> > +     acc_y_minus      =3D get_unaligned_le16(&buf[29]);
> > +     acc_z_plus       =3D get_unaligned_le16(&buf[31]);
> > +     acc_z_minus      =3D get_unaligned_le16(&buf[33]);
> > +
> > +     /* Set gyroscope calibration and normalization parameters.
> > +      * Data values will be normalized to 1/DS_GYRO_RES_PER_DEG_S degr=
ee/s.
> > +      */
>
> A small note, as written in [2], the preferred style of multi-line commen=
ts is different,
> so you might want to change the comments. If you decide to make this chan=
ge, please
> do it everywhere.
>
>
> > +     speed_2x =3D (gyro_speed_plus + gyro_speed_minus);
> > +     ds->gyro_calib_data[0].abs_code =3D ABS_RX;
> > +     ds->gyro_calib_data[0].bias =3D gyro_pitch_bias;
> > +     ds->gyro_calib_data[0].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DE=
G_S;
> > +     ds->gyro_calib_data[0].sens_denom =3D gyro_pitch_plus - gyro_pitc=
h_minus;
> > +
> > +     ds->gyro_calib_data[1].abs_code =3D ABS_RY;
> > +     ds->gyro_calib_data[1].bias =3D gyro_yaw_bias;
> > +     ds->gyro_calib_data[1].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DE=
G_S;
> > +     ds->gyro_calib_data[1].sens_denom =3D gyro_yaw_plus - gyro_yaw_mi=
nus;
> > +
> > +     ds->gyro_calib_data[2].abs_code =3D ABS_RZ;
> > +     ds->gyro_calib_data[2].bias =3D gyro_roll_bias;
> > +     ds->gyro_calib_data[2].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DE=
G_S;
> > +     ds->gyro_calib_data[2].sens_denom =3D gyro_roll_plus - gyro_roll_=
minus;
> > +
> > +     /* Set accelerometer calibration and normalization parameters.
> > +      * Data values will be normalized to 1/DS_ACC_RES_PER_G G.
>                                                                 ^
> Minor thing, but I believe it should be 'g', not 'G'?
>
>
> > +      */
> > +     range_2g =3D acc_x_plus - acc_x_minus;
> > +     ds->accel_calib_data[0].abs_code =3D ABS_X;
> > +     ds->accel_calib_data[0].bias =3D acc_x_plus - range_2g / 2;
> > +     ds->accel_calib_data[0].sens_numer =3D 2*DS_ACC_RES_PER_G;
> > +     ds->accel_calib_data[0].sens_denom =3D range_2g;
> > +
> > +     range_2g =3D acc_y_plus - acc_y_minus;
> > +     ds->accel_calib_data[1].abs_code =3D ABS_Y;
> > +     ds->accel_calib_data[1].bias =3D acc_y_plus - range_2g / 2;
> > +     ds->accel_calib_data[1].sens_numer =3D 2*DS_ACC_RES_PER_G;
> > +     ds->accel_calib_data[1].sens_denom =3D range_2g;
> > +
> > +     range_2g =3D acc_z_plus - acc_z_minus;
> > +     ds->accel_calib_data[2].abs_code =3D ABS_Z;
> > +     ds->accel_calib_data[2].bias =3D acc_z_plus - range_2g / 2;
> > +     ds->accel_calib_data[2].sens_numer =3D 2*DS_ACC_RES_PER_G;
> > +     ds->accel_calib_data[2].sens_denom =3D range_2g;
> > +
> > +err_free:
> > +     kfree(buf);
> > +     return ret;
> > +}
> > +
> >  static int dualsense_get_mac_address(struct dualsense *ds)
> >  {
> >       uint8_t *buf;
> > @@ -319,6 +469,7 @@  static int dualsense_parse_report(struct ps_device=
 *ps_dev, struct hid_report *r
> >       struct dualsense_input_report *ds_report;
> >       uint8_t battery_data, battery_capacity, charging_status, value;
> >       int battery_status;
> > +     uint16_t sensor_timestamp;
> >       unsigned long flags;
> >       int i;
> >
> > @@ -361,6 +512,44 @@  static int dualsense_parse_report(struct ps_devic=
e *ps_dev, struct hid_report *r
> >       input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] &=
 DS_BUTTONS2_PS_HOME);
> >       input_sync(ds->gamepad);
> >
> > +     /* Parse and calibrate gyroscope data. */
> > +     for (i =3D 0; i < 3; i++) {
>
> I think `i < ARRAY_SIZE(...)` would be better.
> And I would add a `static_assert(ARRAY_SIZE(ds_report->gyro) =3D=3D ARRAY=
_SIZE(ds->gyro_calib_data))`
> somewhere around here just to be safe. Or define a new constant like `DS_=
GYRO_DIMS`
> and use that to define the arrays. Or both. *
>
>
> > +             int raw_data =3D (short)le16_to_cpu(ds_report->gyro[i]);
> > +             int calib_data =3D mult_frac(ds->gyro_calib_data[i].sens_=
numer,
> > +                             raw_data - ds->gyro_calib_data[i].bias,
> > +                             ds->gyro_calib_data[i].sens_denom);
>
> I believe it would be better if the second and third lines was aligned. *=
*
>
>
> > +
> > +             input_report_abs(ds->sensors, ds->gyro_calib_data[i].abs_=
code, calib_data);
> > +     }
> > +
> > +     /* Parse and calibrate accelerometer data. */
> > +     for (i =3D 0; i < 3; i++) {
>
> Same here. *
>
>
> > +             int raw_data =3D (short)le16_to_cpu(ds_report->accel[i]);
> > +             int calib_data =3D mult_frac(ds->accel_calib_data[i].sens=
_numer,
> > +                             raw_data - ds->accel_calib_data[i].bias,
> > +                             ds->accel_calib_data[i].sens_denom);
>
> Same here. **
>
>
> > +
> > +             input_report_abs(ds->sensors, ds->accel_calib_data[i].abs=
_code, calib_data);
> > +     }
> > +
> > +     /* Convert timestamp (in 0.33us unit) to timestamp_us */
> > +     sensor_timestamp =3D le32_to_cpu(ds_report->sensor_timestamp);
> > +     if (!ds->sensor_timestamp_initialized) {
> > +             ds->sensor_timestamp_us =3D sensor_timestamp / 3;
> > +             ds->sensor_timestamp_initialized =3D true;
> > +     } else {
> > +             uint32_t delta;
> > +
> > +             if (ds->prev_sensor_timestamp > sensor_timestamp)
> > +                     delta =3D (U32_MAX - ds->prev_sensor_timestamp + =
sensor_timestamp + 1);
> > +             else
> > +                     delta =3D sensor_timestamp - ds->prev_sensor_time=
stamp;
> > +             ds->sensor_timestamp_us +=3D delta / 3;
> > +     }
> > +     ds->prev_sensor_timestamp =3D sensor_timestamp;
> > +     input_event(ds->sensors, EV_MSC, MSC_TIMESTAMP, ds->sensor_timest=
amp_us);
> > +     input_sync(ds->sensors);
> > +
> >       for (i =3D 0; i < 2; i++) {
> >               bool active =3D (ds_report->points[i].contact & DS_TOUCH_=
POINT_INACTIVE) ? false : true;
> >
> > @@ -446,12 +635,25 @@  static struct ps_device *dualsense_create(struct=
 hid_device *hdev)
> >       }
> >       snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_add=
ress);
> >
> > +     ret =3D dualsense_get_calibration_data(ds);
> > +     if (ret < 0) {
> > +             hid_err(hdev, "Failed to get calibration data from DualSe=
nse\n");
> > +             goto err;
> > +     }
> > +
> >       ds->gamepad =3D ps_gamepad_create(hdev);
> >       if (IS_ERR(ds->gamepad)) {
> >               ret =3D PTR_ERR(ds->gamepad);
> >               goto err;
> >       }
> >
> > +     ds->sensors =3D ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_=
PER_G,
> > +                     DS_GYRO_RANGE, DS_GYRO_RES_PER_DEG_S);
>
> I believe it would be better if the second line was aligned to the `h` in=
 'hdev'.
>
>
> > +     if (IS_ERR(ds->sensors)) {
> > +             ret =3D PTR_ERR(ds->sensors);
> > +             goto err;
> > +     }
> > +
> >       ds->touchpad =3D ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_T=
OUCHPAD_HEIGHT, 2);
> >       if (IS_ERR(ds->touchpad)) {
> >               ret =3D PTR_ERR(ds->touchpad);
> >
>
>
> [1]: https://www.kernel.org/doc/html/latest/process/coding-style.html#pla=
cing-braces-and-spaces
> [2]: https://www.kernel.org/doc/html/latest/process/coding-style.html#com=
menting
>
>
> Regards,
> Barnab=C3=A1s P=C5=91cze


Regards,
Roderick Colenbrander
