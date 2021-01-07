Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57C9C2ED611
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 18:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbhAGRvp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 12:51:45 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:51708 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbhAGRvp (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 12:51:45 -0500
Date:   Thu, 07 Jan 2021 17:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610041861;
        bh=9D22wOm3b2HNfTVoXW4OlpgvC8/veXFed3cTIxPHv+U=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=xHab4YkoMHyFWVLBpnBrcT4eVnRLQUs5kR8b7FlL+sj2AtGB8khFt4RD9grVyWUy/
         K/NMVslZw7PWTIBRB5vOU3LApEwYwQDA8bzsxzWxiAdJ6syPkGz0MMkV7GGP4cDsfA
         V2nTYpoI0XkEWnaN2WOcSUnLmJRLnt4WyHoMqwKw=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 03/13] HID: playstation: add DualSense battery support.
Message-ID: <0GfoA1O6YLM6fbSthjBgou-1KitOVn9gI7Y-wDy4ca5qlnQzO2LFknPu25GCB5RlbQcpzt7YUdU_Sf8o_4kHlWkrHmPvF3uFSwImvSe-AA8=@protonmail.com>
In-Reply-To: <20210102223109.996781-4-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-4-roderick@gaikai.com>
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


2021. janu=C3=A1r 2., szombat 23:30 keltez=C3=A9ssel, Roderick Colenbrander=
 =C3=ADrta:

> From: Roderick Colenbrander <roderick.colenbrander@sony.com>
>
> Report DualSense battery status information through power_supply class.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> [...]
> @@ -21,6 +21,13 @@
>  /* Base class for playstation devices. */
>  struct ps_device {
>  =09struct hid_device *hdev;
> +=09spinlock_t lock;

I'm not sure, but isn't a spin_lock_init() missing from the code?


> +
> +=09struct power_supply_desc battery_desc;
> +=09struct power_supply *battery;
> +=09uint8_t battery_capacity;
> +=09int battery_status;
> +
>  =09uint8_t mac_address[6];
>
>  =09int (*parse_report)(struct ps_device *dev, struct hid_report *report,=
 u8 *data, int size);
> [...]
> @@ -136,6 +148,71 @@  static struct input_dev *ps_allocate_input_dev(stru=
ct hid_device *hdev, const ch
>  =09return input_dev;
>  }
>
> +static enum power_supply_property ps_power_supply_props[] =3D {
> +=09POWER_SUPPLY_PROP_STATUS,
> +=09POWER_SUPPLY_PROP_PRESENT,
> +=09POWER_SUPPLY_PROP_CAPACITY,
> +=09POWER_SUPPLY_PROP_SCOPE

I believe the preferred way is to have a comma after each array/enum/etc. e=
lement
unless it is a terminating entry.


> +};
> [...]
> @@ -201,7 +278,9 @@  static int dualsense_parse_report(struct ps_device *=
ps_dev, struct hid_report *r
>  =09struct hid_device *hdev =3D ps_dev->hdev;
>  =09struct dualsense *ds =3D container_of(ps_dev, struct dualsense, base)=
;
>  =09struct dualsense_input_report *ds_report;
> -=09uint8_t value;
> +=09uint8_t battery_data, battery_capacity, charging_status, value;
> +=09int battery_status;
> +=09unsigned long flags;
>
>  =09/* DualSense in USB uses the full HID report for reportID 1, but
>  =09 * Bluetooth uses a minimal HID report for reportID 1 and reports
> @@ -242,12 +321,48 @@  static int dualsense_parse_report(struct ps_device=
 *ps_dev, struct hid_report *r
>  =09input_report_key(ds->gamepad, BTN_MODE,   ds_report->buttons[2] & DS_=
BUTTONS2_PS_HOME);
>  =09input_sync(ds->gamepad);
>
> +=09battery_data =3D ds_report->status & DS_STATUS_BATTERY_CAPACITY;
> +=09charging_status =3D (ds_report->status & DS_STATUS_CHARGING) >> DS_ST=
ATUS_CHARGING_SHIFT;
> +
> +=09switch (charging_status) {
> +=09case 0x0:
> +=09=09/* Each unit of battery data corresponds to 10%
> +=09=09 * 0 =3D 0-9%, 1 =3D 10-19%, .. and 10 =3D 100%
> +=09=09 */
> +=09=09battery_capacity =3D battery_data =3D=3D 10 ? 100 : battery_data *=
 10 + 5;

In my opinion `min(battery_data * 10 + 5, 100)` seems cleaner, what do you =
think?


> +=09=09battery_status =3D POWER_SUPPLY_STATUS_DISCHARGING;
> +=09=09break;
> +=09case 0x1:
> +=09=09battery_capacity =3D battery_data =3D=3D 10 ? 100 : battery_data *=
 10 + 5;
> +=09=09battery_status =3D POWER_SUPPLY_STATUS_CHARGING;
> +=09=09break;
> +=09case 0x2:
> +=09=09battery_capacity =3D 100;
> +=09=09battery_status =3D POWER_SUPPLY_STATUS_FULL;
> +=09=09break;
> +=09case 0xa: /* voltage or temperature out of range */
> +=09case 0xb: /* temperature error */
> +=09=09battery_capacity =3D 0;
> +=09=09battery_status =3D POWER_SUPPLY_STATUS_NOT_CHARGING;
> +=09=09break;
> +=09case 0xf: /* charging error */
> +=09default:
> +=09=09battery_capacity =3D 0;
> +=09=09battery_status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> +=09}
> +
> +=09spin_lock_irqsave(&ps_dev->lock, flags);
> +=09ps_dev->battery_capacity =3D battery_capacity;
> +=09ps_dev->battery_status =3D battery_status;
> +=09spin_unlock_irqrestore(&ps_dev->lock, flags);
> +
>  =09return 0;
>  }
>
>  static struct ps_device *dualsense_create(struct hid_device *hdev)
>  {
>  =09struct dualsense *ds;
> +=09struct ps_device *ps_dev;
>  =09int ret;
>
>  =09ds =3D devm_kzalloc(&hdev->dev, sizeof(*ds), GFP_KERNEL);
> @@ -259,8 +374,11 @@  static struct ps_device *dualsense_create(struct hi=
d_device *hdev)
>  =09 */
>  =09hdev->version |=3D HID_PLAYSTATION_VERSION_PATCH;
>
> -=09ds->base.hdev =3D hdev;
> -=09ds->base.parse_report =3D dualsense_parse_report;
> +=09ps_dev =3D &ds->base;
> +=09ps_dev->hdev =3D hdev;
> +=09ps_dev->battery_capacity =3D 100; /* initial value until parse_report=
. */
> +=09ps_dev->battery_status =3D POWER_SUPPLY_STATUS_UNKNOWN;
> +=09ps_dev->parse_report =3D dualsense_parse_report;
>  =09hid_set_drvdata(hdev, ds);
>
>  =09ret =3D dualsense_get_mac_address(ds);
> @@ -276,6 +394,10 @@  static struct ps_device *dualsense_create(struct hi=
d_device *hdev)
>  =09=09goto err;
>  =09}
>
> +=09ret =3D ps_device_register_battery(ps_dev);
> +=09if (ret < 0)

I believe if `ps_device_register_battery()` can only return 0 on success or
an errno, then `if (ret)` would be better.


> +=09=09goto err;
> +
>  =09return &ds->base;
>
>  err:


Regards,
Barnab=C3=A1s P=C5=91cze
