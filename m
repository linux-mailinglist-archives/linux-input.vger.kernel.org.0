Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBE842ED6F7
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 19:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbhAGSwq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 13:52:46 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:45597 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726064AbhAGSwq (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 13:52:46 -0500
Date:   Thu, 07 Jan 2021 18:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610045522;
        bh=rg7oeMw3idmp6FzTMkBlRBNieusXXyXDRxFVCZ1Ck/E=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=NIY3+3K3cPG9+OZDEwN6fXhakHT+Bck22RLW89BK5pE74loI/3FAiAMVZ3J0S2v9J
         3X83YI+H2qES0o4EkscR1eHiZ2wPWdzYF1fJyoU2o6F/oSj1L81V3iD+0BGNv8fSxJ
         JLSC/czf05rDPX742iVULSG398hoUe+7seoiaOR0=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 05/13] HID: playstation: add DualSense accelerometer and gyroscope support.
Message-ID: <JtD5x8UNWvllStSHpZaryZUUarp8NZiy5G3HjT9xEIiUCxzfNmsaS7CSX52XSEObQ1TwkXlMPkNE0KG7JTl_WOgzOXDocF9jFecpqUkrBwg=@protonmail.com>
In-Reply-To: <20210102223109.996781-6-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-6-roderick@gaikai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi


2021. janu=C3=A1r 2., szombat 23:31 keltez=C3=A9ssel, Roderick Colenbrander=
 =C3=ADrta:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> The DualSense features an accelerometer and gyroscope. The data is
> embedded into the main HID input reports. Expose both sensors through
> through a separate evdev node.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> [...]
> +static struct input_dev *ps_sensors_create(struct hid_device *hdev, int =
accel_range, int accel_res,
> +=09=09int gyro_range, int gyro_res)
> +{
> +=09struct input_dev *sensors;
> +=09int ret;
> +
> +=09sensors =3D ps_allocate_input_dev(hdev, "Motion Sensors");
> +=09if (IS_ERR(sensors))
> +=09=09return ERR_PTR(-ENOMEM);

I know that at the moment ENOMEM is the only possible error, but I believe
`return ERR_CAST(sensors);` would be better. (Or even just `return sensors;=
`.)


> +
> +=09__set_bit(INPUT_PROP_ACCELEROMETER, sensors->propbit);
> +
> +=09/* Accelerometer */
> +=09input_set_abs_params(sensors, ABS_X, -accel_range, accel_range, 16, 0=
);
> +=09input_set_abs_params(sensors, ABS_Y, -accel_range, accel_range, 16, 0=
);
> +=09input_set_abs_params(sensors, ABS_Z, -accel_range, accel_range, 16, 0=
);
> +=09input_abs_set_res(sensors, ABS_X, accel_res);
> +=09input_abs_set_res(sensors, ABS_Y, accel_res);
> +=09input_abs_set_res(sensors, ABS_Z, accel_res);
> +
> +=09/* Gyroscope */
> +=09input_set_abs_params(sensors, ABS_RX, -gyro_range, gyro_range, 16, 0)=
;
> +=09input_set_abs_params(sensors, ABS_RY, -gyro_range, gyro_range, 16, 0)=
;
> +=09input_set_abs_params(sensors, ABS_RZ, -gyro_range, gyro_range, 16, 0)=
;
> +=09input_abs_set_res(sensors, ABS_RX, gyro_res);
> +=09input_abs_set_res(sensors, ABS_RY, gyro_res);
> +=09input_abs_set_res(sensors, ABS_RZ, gyro_res);
> +
> +=09ret =3D input_register_device(sensors);
> +=09if (ret)
> +=09=09return ERR_PTR(ret);
> +
> +=09return sensors;
> +}
> [...]
> +static int dualsense_get_calibration_data(struct dualsense *ds)
> +{
> +=09short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
> +=09short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
> +=09short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
> +=09short gyro_speed_plus, gyro_speed_minus;
> +=09short acc_x_plus, acc_x_minus;
> +=09short acc_y_plus, acc_y_minus;
> +=09short acc_z_plus, acc_z_minus;
> +=09int speed_2x;
> +=09int range_2g;
> +=09int ret =3D 0;
> +=09uint8_t *buf;
> +
> +=09buf =3D kzalloc(DS_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
> +=09if (!buf)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_CALIBRATI=
ON, buf,
> +=09=09=09DS_FEATURE_REPORT_CALIBRATION_SIZE, HID_FEATURE_REPORT, HID_REQ=
_GET_REPORT);

I think it would be better if lines were aligned. I have missed this in oth=
er patches,
so if you decide to make this change, please do it everywhere.


> +=09if (ret < 0)
> +=09=09goto err_free;
> +=09else if (ret !=3D DS_FEATURE_REPORT_CALIBRATION_SIZE) {

As per coding style[1], please either use {} for all branches, or just drop=
 the
`else` and maybe add a new line:

```
if (ret < 0)
  goto ...

if (ret !=3D ...) {
  ...
}
```


> +=09=09hid_err(ds->base.hdev, "failed to retrieve DualSense calibration i=
nfo\n");

I think this message could be improved to better pinpoint the exact problem
that triggered it.


> +=09=09ret =3D -EINVAL;
> +=09=09goto err_free;
> +=09}
> +
> +=09gyro_pitch_bias  =3D get_unaligned_le16(&buf[1]);
> +=09gyro_yaw_bias    =3D get_unaligned_le16(&buf[3]);
> +=09gyro_roll_bias   =3D get_unaligned_le16(&buf[5]);
> +=09gyro_pitch_plus  =3D get_unaligned_le16(&buf[7]);
> +=09gyro_pitch_minus =3D get_unaligned_le16(&buf[9]);
> +=09gyro_yaw_plus    =3D get_unaligned_le16(&buf[11]);
> +=09gyro_yaw_minus   =3D get_unaligned_le16(&buf[13]);
> +=09gyro_roll_plus   =3D get_unaligned_le16(&buf[15]);
> +=09gyro_roll_minus  =3D get_unaligned_le16(&buf[17]);
> +=09gyro_speed_plus  =3D get_unaligned_le16(&buf[19]);
> +=09gyro_speed_minus =3D get_unaligned_le16(&buf[21]);
> +=09acc_x_plus       =3D get_unaligned_le16(&buf[23]);
> +=09acc_x_minus      =3D get_unaligned_le16(&buf[25]);
> +=09acc_y_plus       =3D get_unaligned_le16(&buf[27]);
> +=09acc_y_minus      =3D get_unaligned_le16(&buf[29]);
> +=09acc_z_plus       =3D get_unaligned_le16(&buf[31]);
> +=09acc_z_minus      =3D get_unaligned_le16(&buf[33]);
> +
> +=09/* Set gyroscope calibration and normalization parameters.
> +=09 * Data values will be normalized to 1/DS_GYRO_RES_PER_DEG_S degree/s=
.
> +=09 */

A small note, as written in [2], the preferred style of multi-line comments=
 is different,
so you might want to change the comments. If you decide to make this change=
, please
do it everywhere.


> +=09speed_2x =3D (gyro_speed_plus + gyro_speed_minus);
> +=09ds->gyro_calib_data[0].abs_code =3D ABS_RX;
> +=09ds->gyro_calib_data[0].bias =3D gyro_pitch_bias;
> +=09ds->gyro_calib_data[0].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DEG_S;
> +=09ds->gyro_calib_data[0].sens_denom =3D gyro_pitch_plus - gyro_pitch_mi=
nus;
> +
> +=09ds->gyro_calib_data[1].abs_code =3D ABS_RY;
> +=09ds->gyro_calib_data[1].bias =3D gyro_yaw_bias;
> +=09ds->gyro_calib_data[1].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DEG_S;
> +=09ds->gyro_calib_data[1].sens_denom =3D gyro_yaw_plus - gyro_yaw_minus;
> +
> +=09ds->gyro_calib_data[2].abs_code =3D ABS_RZ;
> +=09ds->gyro_calib_data[2].bias =3D gyro_roll_bias;
> +=09ds->gyro_calib_data[2].sens_numer =3D speed_2x*DS_GYRO_RES_PER_DEG_S;
> +=09ds->gyro_calib_data[2].sens_denom =3D gyro_roll_plus - gyro_roll_minu=
s;
> +
> +=09/* Set accelerometer calibration and normalization parameters.
> +=09 * Data values will be normalized to 1/DS_ACC_RES_PER_G G.
                                                                ^
Minor thing, but I believe it should be 'g', not 'G'?


> +=09 */
> +=09range_2g =3D acc_x_plus - acc_x_minus;
> +=09ds->accel_calib_data[0].abs_code =3D ABS_X;
> +=09ds->accel_calib_data[0].bias =3D acc_x_plus - range_2g / 2;
> +=09ds->accel_calib_data[0].sens_numer =3D 2*DS_ACC_RES_PER_G;
> +=09ds->accel_calib_data[0].sens_denom =3D range_2g;
> +
> +=09range_2g =3D acc_y_plus - acc_y_minus;
> +=09ds->accel_calib_data[1].abs_code =3D ABS_Y;
> +=09ds->accel_calib_data[1].bias =3D acc_y_plus - range_2g / 2;
> +=09ds->accel_calib_data[1].sens_numer =3D 2*DS_ACC_RES_PER_G;
> +=09ds->accel_calib_data[1].sens_denom =3D range_2g;
> +
> +=09range_2g =3D acc_z_plus - acc_z_minus;
> +=09ds->accel_calib_data[2].abs_code =3D ABS_Z;
> +=09ds->accel_calib_data[2].bias =3D acc_z_plus - range_2g / 2;
> +=09ds->accel_calib_data[2].sens_numer =3D 2*DS_ACC_RES_PER_G;
> +=09ds->accel_calib_data[2].sens_denom =3D range_2g;
> +
> +err_free:
> +=09kfree(buf);
> +=09return ret;
> +}
> +
>  static int dualsense_get_mac_address(struct dualsense *ds)
>  {
>  =09uint8_t *buf;
> @@ -319,6 +469,7 @@  static int dualsense_parse_report(struct ps_device *=
ps_dev, struct hid_report *r
>  =09struct dualsense_input_report *ds_report;
>  =09uint8_t battery_data, battery_capacity, charging_status, value;
>  =09int battery_status;
> +=09uint16_t sensor_timestamp;
>  =09unsigned long flags;
>  =09int i;
>
> @@ -361,6 +512,44 @@  static int dualsense_parse_report(struct ps_device =
*ps_dev, struct hid_report *r
>  =09input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_=
BUTTONS2_PS_HOME);
>  =09input_sync(ds->gamepad);
>
> +=09/* Parse and calibrate gyroscope data. */
> +=09for (i =3D 0; i < 3; i++) {

I think `i < ARRAY_SIZE(...)` would be better.
And I would add a `static_assert(ARRAY_SIZE(ds_report->gyro) =3D=3D ARRAY_S=
IZE(ds->gyro_calib_data))`
somewhere around here just to be safe. Or define a new constant like `DS_GY=
RO_DIMS`
and use that to define the arrays. Or both. *


> +=09=09int raw_data =3D (short)le16_to_cpu(ds_report->gyro[i]);
> +=09=09int calib_data =3D mult_frac(ds->gyro_calib_data[i].sens_numer,
> +=09=09=09=09raw_data - ds->gyro_calib_data[i].bias,
> +=09=09=09=09ds->gyro_calib_data[i].sens_denom);

I believe it would be better if the second and third lines was aligned. **


> +
> +=09=09input_report_abs(ds->sensors, ds->gyro_calib_data[i].abs_code, cal=
ib_data);
> +=09}
> +
> +=09/* Parse and calibrate accelerometer data. */
> +=09for (i =3D 0; i < 3; i++) {

Same here. *


> +=09=09int raw_data =3D (short)le16_to_cpu(ds_report->accel[i]);
> +=09=09int calib_data =3D mult_frac(ds->accel_calib_data[i].sens_numer,
> +=09=09=09=09raw_data - ds->accel_calib_data[i].bias,
> +=09=09=09=09ds->accel_calib_data[i].sens_denom);

Same here. **


> +
> +=09=09input_report_abs(ds->sensors, ds->accel_calib_data[i].abs_code, ca=
lib_data);
> +=09}
> +
> +=09/* Convert timestamp (in 0.33us unit) to timestamp_us */
> +=09sensor_timestamp =3D le32_to_cpu(ds_report->sensor_timestamp);
> +=09if (!ds->sensor_timestamp_initialized) {
> +=09=09ds->sensor_timestamp_us =3D sensor_timestamp / 3;
> +=09=09ds->sensor_timestamp_initialized =3D true;
> +=09} else {
> +=09=09uint32_t delta;
> +
> +=09=09if (ds->prev_sensor_timestamp > sensor_timestamp)
> +=09=09=09delta =3D (U32_MAX - ds->prev_sensor_timestamp + sensor_timesta=
mp + 1);
> +=09=09else
> +=09=09=09delta =3D sensor_timestamp - ds->prev_sensor_timestamp;
> +=09=09ds->sensor_timestamp_us +=3D delta / 3;
> +=09}
> +=09ds->prev_sensor_timestamp =3D sensor_timestamp;
> +=09input_event(ds->sensors, EV_MSC, MSC_TIMESTAMP, ds->sensor_timestamp_=
us);
> +=09input_sync(ds->sensors);
> +
>  =09for (i =3D 0; i < 2; i++) {
>  =09=09bool active =3D (ds_report->points[i].contact & DS_TOUCH_POINT_INA=
CTIVE) ? false : true;
>
> @@ -446,12 +635,25 @@  static struct ps_device *dualsense_create(struct h=
id_device *hdev)
>  =09}
>  =09snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address=
);
>
> +=09ret =3D dualsense_get_calibration_data(ds);
> +=09if (ret < 0) {
> +=09=09hid_err(hdev, "Failed to get calibration data from DualSense\n");
> +=09=09goto err;
> +=09}
> +
>  =09ds->gamepad =3D ps_gamepad_create(hdev);
>  =09if (IS_ERR(ds->gamepad)) {
>  =09=09ret =3D PTR_ERR(ds->gamepad);
>  =09=09goto err;
>  =09}
>
> +=09ds->sensors =3D ps_sensors_create(hdev, DS_ACC_RANGE, DS_ACC_RES_PER_=
G,
> +=09=09=09DS_GYRO_RANGE, DS_GYRO_RES_PER_DEG_S);

I believe it would be better if the second line was aligned to the `h` in '=
hdev'.


> +=09if (IS_ERR(ds->sensors)) {
> +=09=09ret =3D PTR_ERR(ds->sensors);
> +=09=09goto err;
> +=09}
> +
>  =09ds->touchpad =3D ps_touchpad_create(hdev, DS_TOUCHPAD_WIDTH, DS_TOUCH=
PAD_HEIGHT, 2);
>  =09if (IS_ERR(ds->touchpad)) {
>  =09=09ret =3D PTR_ERR(ds->touchpad);
>


[1]: https://www.kernel.org/doc/html/latest/process/coding-style.html#placi=
ng-braces-and-spaces
[2]: https://www.kernel.org/doc/html/latest/process/coding-style.html#comme=
nting


Regards,
Barnab=C3=A1s P=C5=91cze
