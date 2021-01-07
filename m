Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3A62ED542
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 18:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728273AbhAGRPd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 12:15:33 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:33168 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728088AbhAGRPc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 12:15:32 -0500
Date:   Thu, 07 Jan 2021 17:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610039688;
        bh=eTrrTHRl9B8dP2bsSYKzk+XvkkoB8/VsE2/HgNfsNN4=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=tqx2inyT9SIsoHkcfWAz7SgEm4xJreIeqs0zyf2uJLKRDr0linP0q9kP6KEXMMhf2
         0tlAw1TJ82qErRRmsNHBZEXD5xCXuRoyZ8XwR0MNfeytlMljAYF4tsc0i3+SKNVmIo
         2j3c8dW9UKQGJbVRRu6JLgnNMjGx4pumxfzTvPNU=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 01/13] HID: playstation: initial DualSense USB support.
Message-ID: <WPROyPA6bw7Qd6BoSwn5qrj7_PMada9lEMUE8Q4kNYXbohSn9fXrFhZIrTKmjmDEn3FDNwyfDPkY-7xYdUnLz6dIvPZvr-up0NsMdJweZ0A=@protonmail.com>
In-Reply-To: <20210102223109.996781-2-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-2-roderick@gaikai.com>
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


I have just a couple minor comments.


2021. janu=C3=A1r 2., szombat 23:30 keltez=C3=A9ssel, Roderick Colenbrander=
 =C3=ADrta:

> From: Roderick Colenbrander roderick.colenbrander@sony.com
>
> Implement support for PlayStation DualSense gamepad in USB mode.
> Support features include buttons and sticks, which adhere to the
> Linux gamepad spec.
>
> Signed-off-by: Roderick Colenbrander roderick.colenbrander@sony.com
> [...]
> +/* Common gamepad buttons across DualShock 3 / 4 and DualSense.
> + * Note: for device with a touchpad, touchpad button is not included
> + *        as it will be part of the touchpad device.
> + */
> +static const int ps_gamepad_buttons[] =3D {
> +=09BTN_WEST, /* Square */
> +=09BTN_NORTH, /* Triangle */
> +=09BTN_EAST, /* Circle */
> +=09BTN_SOUTH, /* Cross */
> +=09BTN_TL, /* L1 */
> +=09BTN_TR, /* R1 */
> +=09BTN_TL2, /* L2 */
> +=09BTN_TR2, /* R2 */
> +=09BTN_SELECT, /* Create (PS5) / Share (PS4) */
> +=09BTN_START, /* Option */
> +=09BTN_THUMBL, /* L3 */
> +=09BTN_THUMBR, /* R3 */
> +=09BTN_MODE, /* PS Home */
> +};
> +
> +static const struct {int x; int y; } ps_gamepad_hat_mapping[] =3D {
> +=09{0, -1}, {1, -1}, {1, 0}, {1, 1}, {0, 1}, {-1, 1}, {-1, 0}, {-1, -1},
> +=09{0, 0}
> +};

I believe the preferred way is to have a comma after each array/enum/etc. e=
lement
unless it is a terminating entry.


> +
> +static struct input_dev *ps_allocate_input_dev(struct hid_device *hdev, =
const char *name_suffix)
> +{
> +=09struct input_dev *input_dev;
> +
> +=09input_dev =3D devm_input_allocate_device(&hdev->dev);
> +=09if (!input_dev)
> +=09=09return ERR_PTR(-ENOMEM);
> +
> +=09input_dev->id.bustype =3D hdev->bus;
> +=09input_dev->id.vendor =3D hdev->vendor;
> +=09input_dev->id.product =3D hdev->product;
> +=09input_dev->id.version =3D hdev->version;
> +=09input_dev->uniq =3D hdev->uniq;
> +
> +=09if (name_suffix) {
> +=09=09input_dev->name =3D devm_kasprintf(&hdev->dev, GFP_KERNEL, "%s %s"=
, hdev->name,
> +=09=09=09=09name_suffix);
> +=09=09if (!input_dev->name)
> +=09=09=09return ERR_PTR(-ENOMEM);
> +=09} else {
> +=09=09input_dev->name =3D hdev->name;
> +=09}
> +
> +=09input_set_drvdata(input_dev, hdev);
> +
> +=09return input_dev;
> +}
> +
> +static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
> +{
> +=09struct input_dev *gamepad;
> +=09unsigned int i;
> +=09int ret;
> +
> +=09gamepad =3D ps_allocate_input_dev(hdev, NULL);
> +=09if (IS_ERR(gamepad))
> +=09=09return ERR_PTR(-ENOMEM);

I know that at the moment ENOMEM is the only possible error, but I believe
`return ERR_CAST(gamepad);` would be better. (Or even just `return gamepad;=
`.)


> +
> +=09input_set_abs_params(gamepad, ABS_X, 0, 255, 0, 0);
> +=09input_set_abs_params(gamepad, ABS_Y, 0, 255, 0, 0);
> +=09input_set_abs_params(gamepad, ABS_Z, 0, 255, 0, 0);
> +=09input_set_abs_params(gamepad, ABS_RX, 0, 255, 0, 0);
> +=09input_set_abs_params(gamepad, ABS_RY, 0, 255, 0, 0);
> +=09input_set_abs_params(gamepad, ABS_RZ, 0, 255, 0, 0);
> +
> +=09input_set_abs_params(gamepad, ABS_HAT0X, -1, 1, 0, 0);
> +=09input_set_abs_params(gamepad, ABS_HAT0Y, -1, 1, 0, 0);
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(ps_gamepad_buttons); i++)
> +=09=09input_set_capability(gamepad, EV_KEY, ps_gamepad_buttons[i]);
> +
> +=09ret =3D input_register_device(gamepad);
> +=09if (ret)
> +=09=09return ERR_PTR(ret);
> +
> +=09return gamepad;
> +}
> +
> +static int dualsense_parse_report(struct ps_device *ps_dev, struct hid_r=
eport *report,
> +=09=09u8 *data, int size)
> +{
> +=09struct hid_device *hdev =3D ps_dev->hdev;
> +=09struct dualsense *ds =3D container_of(ps_dev, struct dualsense, base)=
;
> +=09struct dualsense_input_report *ds_report;
> +=09uint8_t value;
> +

I think `size` should be checked somewhere around here.


> +=09/* DualSense in USB uses the full HID report for reportID 1, but
> +=09 * Bluetooth uses a minimal HID report for reportID 1 and reports
> +=09 * the full report using reportID 49.
> +=09 */
> +=09if (report->id =3D=3D DS_INPUT_REPORT_USB && hdev->bus =3D=3D BUS_USB=
) {
> +=09=09ds_report =3D (struct dualsense_input_report *)&data[1];
> +=09} else {
> +=09=09hid_err(hdev, "Unhandled reportID=3D%d\n", report->id);
> +=09=09return -1;
> +=09}
> +
> +=09input_report_abs(ds->gamepad, ABS_X,  ds_report->x);
> +=09input_report_abs(ds->gamepad, ABS_Y,  ds_report->y);
> +=09input_report_abs(ds->gamepad, ABS_RX, ds_report->rx);
> +=09input_report_abs(ds->gamepad, ABS_RY, ds_report->ry);
> +=09input_report_abs(ds->gamepad, ABS_Z,  ds_report->z);
> +=09input_report_abs(ds->gamepad, ABS_RZ, ds_report->rz);
> +
> +=09value =3D ds_report->buttons[0] & DS_BUTTONS0_HAT_SWITCH;
> +=09if (value > 7)
> +=09=09value =3D 8; /* center */

This seems a bit flimsy to me, it relies on a different part of the code
being in a certain way that is not enforced by anything. I'd probably do so=
mething
like this:

enum {
  HAT_DIR_W =3D 0,
  HAT_DIR_NW,
  ...
  HAT_DIR_SW,
  HAT_DIR_NONE,
};

static const struct {int x; int y; } ps_gamepad_hat_mapping[] =3D {
  [HAT_DIR_W] =3D {0, -1},
  ...
  [HAT_DIR_NONE] =3D {0, 0},
};

and then

if (value >=3D ARRAY_SIZE(ps_gamepad_hat_mapping))
  value =3D HAT_DIR_NONE;

Please consider it. By the way, are values 9..15 actually sent by the contr=
oller?


> +=09input_report_abs(ds->gamepad, ABS_HAT0X, ps_gamepad_hat_mapping[value=
].x);
> +=09input_report_abs(ds->gamepad, ABS_HAT0Y, ps_gamepad_hat_mapping[value=
].y);
> +
> +=09input_report_key(ds->gamepad, BTN_WEST,   ds_report->buttons[0] & DS_=
BUTTONS0_SQUARE);
> +=09input_report_key(ds->gamepad, BTN_SOUTH,  ds_report->buttons[0] & DS_=
BUTTONS0_CROSS);
> +=09input_report_key(ds->gamepad, BTN_EAST,   ds_report->buttons[0] & DS_=
BUTTONS0_CIRCLE);
> +=09input_report_key(ds->gamepad, BTN_NORTH,  ds_report->buttons[0] & DS_=
BUTTONS0_TRIANGLE);
> +=09input_report_key(ds->gamepad, BTN_TL,     ds_report->buttons[1] & DS_=
BUTTONS1_L1);
> +=09input_report_key(ds->gamepad, BTN_TR,     ds_report->buttons[1] & DS_=
BUTTONS1_R1);
> +=09input_report_key(ds->gamepad, BTN_TL2,    ds_report->buttons[1] & DS_=
BUTTONS1_L2);
> +=09input_report_key(ds->gamepad, BTN_TR2,    ds_report->buttons[1] & DS_=
BUTTONS1_R2);
> +=09input_report_key(ds->gamepad, BTN_SELECT, ds_report->buttons[1] & DS_=
BUTTONS1_CREATE);
> +=09input_report_key(ds->gamepad, BTN_START,  ds_report->buttons[1] & DS_=
BUTTONS1_OPTIONS);
> +=09input_report_key(ds->gamepad, BTN_THUMBL, ds_report->buttons[1] & DS_=
BUTTONS1_L3);
> +=09input_report_key(ds->gamepad, BTN_THUMBR, ds_report->buttons[1] & DS_=
BUTTONS1_R3);
> +=09input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_=
BUTTONS2_PS_HOME);
> +=09input_sync(ds->gamepad);
> +
> +=09return 0;
> +}
> +
> +static struct ps_device *dualsense_create(struct hid_device *hdev)
> +{
> +=09struct dualsense *ds;
> +=09int ret;
> +
> +=09ds =3D devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
> +=09if (!ds)
> +=09=09return ERR_PTR(-ENOMEM);
> +
> +=09/* Patch version to allow userspace to distinguish between
> +=09 * hid-generic vs hid-playstation axis and button mapping.
> +=09 */
> +=09hdev->version |=3D HID_PLAYSTATION_VERSION_PATCH;
> +
> +=09ds->base.hdev =3D hdev;
> +=09ds->base.parse_report =3D dualsense_parse_report;
> +=09hid_set_drvdata(hdev, ds);
> +
> +=09ds->gamepad =3D ps_gamepad_create(hdev);
> +=09if (IS_ERR(ds->gamepad)) {
> +=09=09ret =3D PTR_ERR(ds->gamepad);
> +=09=09goto err;
> +=09}
> +
> +=09return &ds->base;
> +
> +err:
> +=09return ERR_PTR(ret);
> +}
> [...]
> +static int ps_probe(struct hid_device *hdev, const struct hid_device_id =
*id)
> +{
> +=09struct ps_device *dev;
> +=09int ret;
> +
> +=09ret =3D hid_parse(hdev);
> +=09if (ret) {
> +=09=09hid_err(hdev, "parse failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D hid_hw_start(hdev, HID_CONNECT_HIDRAW);
> +=09if (ret) {
> +=09=09hid_err(hdev, "hw start failed\n");
> +=09=09return ret;
> +=09}
> +
> +=09ret =3D hid_hw_open(hdev);
> +=09if (ret) {
> +=09=09hid_err(hdev, "hw open failed\n");
> +=09=09goto err_stop;
> +=09}
> +
> +=09if (hdev->product =3D=3D USB_DEVICE_ID_SONY_PS5_CONTROLLER) {

I'm still not fully seeing the purpose of this `if`. The probe should not b=
e
called for devices not in the id_table, so this seems to me to be a long wa=
y
of writing `if (true)`. Or am I missing something?


> +=09=09dev =3D dualsense_create(hdev);
> +=09=09if (IS_ERR(dev)) {
> +=09=09=09hid_err(hdev, "Failed to create dualsense.\n");

I think it'd be preferable if all log messages would either be lowercase or
uppercase, not a mix of both. Same for punctuation. This applies to all pat=
ches.


> +=09=09=09ret =3D PTR_ERR(dev);
> +=09=09=09goto err_close;
> +=09=09}
> +=09}
> +
> +=09return ret;
> +
> +err_close:
> +=09hid_hw_close(hdev);
> +err_stop:
> +=09hid_hw_stop(hdev);
> +=09return ret;
> +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
