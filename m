Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74F682EE89A
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 23:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728001AbhAGW1g (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 17:27:36 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:56871 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728152AbhAGW1g (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 17:27:36 -0500
Date:   Thu, 07 Jan 2021 22:26:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610058413;
        bh=H/rS01y3sUzETZyLR3N/6VGgN+VrCaFAob5/yCbnkSc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Jk7lKipmBXdvFEseAUZTnkpmLFXOB8DloBri4DF4JDJSXP+rFHsObMS5lNNDXPAax
         nCg7BuTRpw/3cPdXkyn+L/2FtKUTFOesYar/mWPnJ3MkK+X2syPgneteNsP0J7MXct
         VfTyfpInKGA8N1ajRCnXuCcFneVJdOSg+XTxA2Fs=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 13/13] HID: playstation: report DualSense hardware and firmware version.
Message-ID: <dFczDbiHgeToh7k4T1Mj0RbQswy7l-e1u4-XRIYhM0BAo41tGrjjt_OsbMnFb81IJncn9oaCqKfFsgNoiJ8W3_CMW-WkSG9fx4kR6Cbw-d0=@protonmail.com>
In-Reply-To: <20210102223109.996781-14-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-14-roderick@gaikai.com>
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

> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index 1a95c81da8a3..8440af6d6cd7 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> [...]
> +static int dualsense_get_firmware_info(struct dualsense *ds)
> +{
> +=09uint8_t *buf;
> +=09int ret;
> +
> +=09buf =3D kzalloc(DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, GFP_KERNEL);
> +=09if (!buf)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_FIRMWARE_=
INFO, buf,
> +=09=09=09DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE, HID_FEATURE_REPORT,
> +=09=09=09HID_REQ_GET_REPORT);
> +=09if (ret < 0)
> +=09=09goto err_free;
> +=09else if (ret !=3D DS_FEATURE_REPORT_FIRMWARE_INFO_SIZE) {

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

> +=09=09hid_err(ds->base.hdev, "failed to retrieve DualSense firmware info=
\n");
> +=09=09ret =3D -EINVAL;
> +=09=09goto err_free;
> +=09}

Shouldn't the CRC be validated here when using Bluetooth? Or there is none?


> +
> +=09ds->base.hw_version =3D get_unaligned_le32(&buf[24]);
> +=09ds->base.fw_version =3D get_unaligned_le32(&buf[28]);
> +
> +err_free:
> +=09kfree(buf);
> +=09return ret;
> +}
> +
>  static int dualsense_get_mac_address(struct dualsense *ds)
>  {
>  =09uint8_t *buf;
> @@ -1195,6 +1261,12 @@  static struct ps_device *dualsense_create(struct =
hid_device *hdev)
>  =09}
>  =09snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address=
);
>
> +=09ret =3D dualsense_get_firmware_info(ds);
> +=09if (ret < 0) {
> +=09=09hid_err(hdev, "Failed to get firmware info from DualSense\n");
> +=09=09return ERR_PTR(ret);
> +=09}
> +
>  =09ret =3D ps_devices_list_add(ps_dev);
>  =09if (ret < 0)
>  =09=09return ERR_PTR(ret);
> @@ -1261,6 +1333,12 @@  static struct ps_device *dualsense_create(struct =
hid_device *hdev)
>  =09/* Set player LEDs to our player id. */
>  =09dualsense_set_player_leds(ds);
>
> +=09/* Reporting hardware and firmware is important as there are frequent=
 updates, which
> +=09 * can change behavior.
> +=09 */
> +=09hid_info(hdev, "Registered DualSense controller hw_version=3D%x fw_ve=
rsion=3D%x\n",

Maybe the format could be same as in the device attributes (0x%08x)?


> +=09=09=09ds->base.hw_version, ds->base.fw_version);
> +
>  =09return &ds->base;
>
>  err:
> @@ -1311,6 +1389,12 @@  static int ps_probe(struct hid_device *hdev, cons=
t struct hid_device_id *id)
>  =09=09}
>  =09}
>
> +=09ret =3D devm_device_add_group(&hdev->dev, &ps_device_attribute_group)=
;
> +=09if (ret < 0) {
> +=09=09hid_err(hdev, "Failed to register sysfs nodes.\n");
> +=09=09goto err_close;
> +=09}
> +
>  =09return ret;
>
>  err_close:
>


[1]: https://www.kernel.org/doc/html/latest/process/coding-style.html#placi=
ng-braces-and-spaces


Regards,
Barnab=C3=A1s P=C5=91cze
