Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A56C2E7349
	for <lists+linux-input@lfdr.de>; Tue, 29 Dec 2020 20:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgL2TuA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 29 Dec 2020 14:50:00 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:12554 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgL2Tt7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 29 Dec 2020 14:49:59 -0500
Date:   Tue, 29 Dec 2020 19:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609271357;
        bh=g3frlrfByIbu1HzKTq4X+omD+P5uKgJ9sfgv9Inr9nY=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=gt9zH8/OqlIGiFHQmBbvodl5fT89DB97AMNDgGcPRjtaJ+BSMxnHUFiybx/Eozzrj
         irf+x/ZnWa5y96gKntq1R5wREXPu7LOwF3mxGU4cdZY9YUKJsuW+LCFKTRXxiJOv4G
         BhwdxrJbWJq4VfmClpcJ1qj1hWKtsI4IjAjxweWc=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 04/13] HID: playstation: add DualSense touchpad support.
Message-ID: <0bb0xOVgrcExPVWhI6l8FLVpv0mSssrc2XCHGPzzf_dkg0500rAw4SUNaLBGrWUk68HMOiNhFk39v4I3_euvIJrpqzEIS6S_b4raTEsBd4k=@protonmail.com>
In-Reply-To: <20201219062336.72568-5-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-5-roderick@gaikai.com>
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


2020. december 19., szombat 7:23 keltez=C3=A9ssel, Roderick Colenbrander =
=C3=ADrta:

> [...]
> +static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int=
 width, int height,
> +=09=09int num_contacts)

Very minor thing, but `input_mt_init_slots()` takes an `unsigned int`, so
wouldn't it be better if `num_contacts` was an `unsigned int`?


> +{
> +=09struct input_dev *touchpad;
> +=09int ret;
> +
> +=09touchpad =3D ps_allocate_input_dev(hdev, "Touchpad");
> +=09if (IS_ERR(touchpad))
> +=09=09return ERR_PTR(-ENOMEM);
> +
> +=09/* Map button underneath touchpad to BTN_LEFT. */
> +=09input_set_capability(touchpad, EV_KEY, BTN_LEFT);
> +=09__set_bit(INPUT_PROP_BUTTONPAD, touchpad->propbit);
> +
> +=09input_set_abs_params(touchpad, ABS_MT_POSITION_X, 0, width, 0, 0);
> +=09input_set_abs_params(touchpad, ABS_MT_POSITION_Y, 0, height, 0, 0);

Shouldn't it be `width - 1` and `height - 1`? Or what am I missing?


> +
> +=09ret =3D input_mt_init_slots(touchpad, num_contacts, INPUT_MT_POINTER)=
;
> +=09if (ret)
> +=09=09return ERR_PTR(ret);
> +
> +=09ret =3D input_register_device(touchpad);
> +=09if (ret)
> +=09=09return ERR_PTR(ret);
> +
> +=09return touchpad;
> +}
> +
>  static int dualsense_get_mac_address(struct dualsense *ds)
>  {
>  =09uint8_t *buf;
> @@ -271,6 +304,7 @@ static int dualsense_parse_report(struct ps_device *p=
s_dev, struct hid_report *r
>  =09uint8_t battery_data, battery_capacity, charging_status, value;
>  =09int battery_status;
>  =09unsigned long flags;
> +=09int i;
>
>  =09/* DualSense in USB uses the full HID report for reportID 1, but
>  =09 * Bluetooth uses a minimal HID report for reportID 1 and reports
> @@ -311,6 +345,25 @@ static int dualsense_parse_report(struct ps_device *=
ps_dev, struct hid_report *r
>  =09input_report_key(ds->gamepad, BTN_MODE, ds_report->buttons[2] & DS_BU=
TTONS2_PS_HOME);
>  =09input_sync(ds->gamepad);
>
> +=09input_report_key(ds->touchpad, BTN_LEFT, ds_report->buttons[2] & DS_B=
UTTONS2_TOUCHPAD);
> +=09for (i =3D 0; i < 2; i++) {
> +=09=09bool active =3D (ds_report->points[i].contact & 0x80) ? false : tr=
ue;
> [...]

I believe it'd be preferable to give a name to that 0x80.


Regards,
Barnab=C3=A1s P=C5=91cze
