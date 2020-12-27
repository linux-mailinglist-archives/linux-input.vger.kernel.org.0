Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8932E320C
	for <lists+linux-input@lfdr.de>; Sun, 27 Dec 2020 18:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbgL0RHF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 27 Dec 2020 12:07:05 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:10970 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgL0RHE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 27 Dec 2020 12:07:04 -0500
Date:   Sun, 27 Dec 2020 17:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609088781;
        bh=bJC5KiqF4pPK6nTgocT3TaS6fh4LvldH2VtU/X9mxy8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qGeD9ttG46H/1hztMgC+t+gh1kVkAJhGw32rJVckhrL+bSmAEwoRzh+x2hgBa9TOP
         gleblL7EZ4NoJHT1kLeinH8+cp2hKsw9gbqOWH8nSf1+VODtQX/R4L2L+wnsc3pcg0
         szdhFsw/dSpkZPt+szuk9ocJgyxP0mAUdmZV43no=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 13/13] HID: playstation: report DualSense hardware and firmware version.
Message-ID: <Wrry37udGNtUwRvYnSoet8ychKwk8YeD9NTEIjkfIMtrSmCXOc9h4oLcm5Uq77JV1AIgvP13uwxvXYuNAQF0jO_ZVp2M932WAPKQB5VdYGc=@protonmail.com>
In-Reply-To: <20201219062336.72568-14-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-14-roderick@gaikai.com>
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

> diff --git a/drivers/hid/hid-playstation.c b/drivers/hid/hid-playstation.=
c
> index a55375ac79a9..2f989da906f3 100644
> --- a/drivers/hid/hid-playstation.c
> +++ b/drivers/hid/hid-playstation.c
> [...]
> +static ssize_t ps_show_firmware_version(struct device *dev,
> +=09=09=09=09struct device_attribute
> +=09=09=09=09*attr, char *buf)
> +{
> +=09struct hid_device *hdev =3D to_hid_device(dev);
> +=09struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> +
> +=09return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->fw_version);

`sysfs_emit()` is preferred over *printf().


> +}
> +
> +static DEVICE_ATTR(firmware_version, 0444, ps_show_firmware_version, NUL=
L);
> +
> +static ssize_t ps_show_hardware_version(struct device *dev,
> +=09=09=09=09struct device_attribute
> +=09=09=09=09*attr, char *buf)
> +{
> +=09struct hid_device *hdev =3D to_hid_device(dev);
> +=09struct ps_device *ps_dev =3D hid_get_drvdata(hdev);
> +
> +=09return snprintf(buf, PAGE_SIZE, "0x%08x\n", ps_dev->hw_version);

Same here.


> +}
> [...]
> +static int dualsense_get_firmware_info(struct dualsense *ds)
> +{
> +=09uint8_t *buf;
> +=09int ret =3D 0;

Is there any reason it needs to be initialized?


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
> +
> +=09ds->base.hw_version =3D get_unaligned_le32(&buf[24]);
> +=09ds->base.fw_version =3D get_unaligned_le32(&buf[28]);

Shouldn't the size of the reply be checked?


> +
> +err_free:
> +=09kfree(buf);
> +=09return ret;
> +}
> +
>  static int dualsense_get_mac_address(struct dualsense *ds)
>  {
>  =09uint8_t *buf;
> @@ -1172,6 +1233,12 @@ static struct ps_device *dualsense_create(struct h=
id_device *hdev)
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
>  =09ret =3D ps_devices_list_add((struct ps_device *)ds);
>  =09if (ret < 0)
>  =09=09return ERR_PTR(ret);
> @@ -1241,6 +1308,12 @@ static struct ps_device *dualsense_create(struct h=
id_device *hdev)
>  =09/* Set player LEDs to our player id. */
>  =09dualsense_set_player_leds(ds);
>
> +=09/* Reporting hardware and firmware is important as there are frequent=
 updates, which
> +=09 * can change behavior.
> +=09 */
> +=09hid_info(hdev, "Registered DualSense controller hw_version=3D%x fw_ve=
rsion=3D%x\n",
> +=09=09=09ds->base.hw_version, ds->base.fw_version);
> +
>  =09return (struct ps_device *)ds;
>
>  err:
> @@ -1295,6 +1368,12 @@ static int ps_probe(struct hid_device *hdev, const=
 struct hid_device_id *id)
>  =09=09goto err_close;
>  =09}
>
> +=09ret =3D sysfs_create_group(&hdev->dev.kobj, &ps_device_attribute_grou=
p);

It's a minor thing, but I think `device_{add,remove}_group()` would be bett=
er
here in the sense that it expresses the fact that the group is added to a d=
evice,
not just any object better.


> +=09if (ret < 0) {
> +=09=09hid_err(hdev, "Failed to register sysfs nodes.\n");
> +=09=09goto err_close;
> +=09}
> +
>  =09return ret;
>
>  err_close:
> @@ -1313,6 +1392,8 @@ static void ps_remove(struct hid_device *hdev)
>
>  =09hid_hw_close(hdev);
>  =09hid_hw_stop(hdev);
> +
> +=09sysfs_remove_group(&hdev->dev.kobj, &ps_device_attribute_group);
>  }
>
>  static const struct hid_device_id ps_devices[] =3D {
> --
> 2.26.2


Regards,
Barnab=C3=A1s P=C5=91cze
