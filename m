Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E8D12ED56E
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 18:23:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbhAGRXd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 12:23:33 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:33192 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727749AbhAGRXc (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 12:23:32 -0500
Date:   Thu, 07 Jan 2021 17:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610040169;
        bh=m0syLyOyeiwZBrFiKEHT+QCYE1fONZ1+2T5NJ417NZk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=ZCpocJIfHZpxj33E9purViLNscyTAcm3yBpYlYL9QxnbAWMKcSmwBK+mKxL80xB4d
         r838cH/pZrddHPICJq3cZNNktDN1RcMOrK29rlTZL7aCaOrDkidSsLvPa6IviAfoYY
         18JsHU1X5tJITtrla4zmD5mjxdwKc9X3dGV6AtmQ=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 02/13] HID: playstation: use DualSense MAC address as unique identifier.
Message-ID: <6Ltv1bAoULs4mgvrOMze4CKONmcJTA35zj6UEV5f-41SeBMD4GwLyN31wpyWJNpoLGKOK91AMx7Rx1MwMhmOzPoO3xST8KZdWHvtpdkpFn0=@protonmail.com>
In-Reply-To: <20210102223109.996781-3-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-3-roderick@gaikai.com>
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

> From: Roderick Colenbrander roderick.colenbrander@sony.com
>
> Use the DualSense MAC address as a unique identifier for the HID device.
>
> Signed-off-by: Roderick Colenbrander roderick.colenbrander@sony.com
>
> [...]
>  /* Button masks for DualSense input report. */
>  #define DS_BUTTONS0_HAT_SWITCH=09GENMASK(3, 0)
>  #define DS_BUTTONS0_SQUARE=09BIT(4)
> @@ -132,6 +136,7 @@  static struct input_dev *ps_allocate_input_dev(struc=
t hid_device *hdev, const ch
>  =09return input_dev;
>  }
>
> +

I think this extra empty line is not necessary here.


>  static struct input_dev *ps_gamepad_create(struct hid_device *hdev)
>  {
>  =09struct input_dev *gamepad;
> @@ -162,6 +167,34 @@  static struct input_dev *ps_gamepad_create(struct h=
id_device *hdev)
>  =09return gamepad;
>  }
>
> +static int dualsense_get_mac_address(struct dualsense *ds)
> +{
> +=09uint8_t *buf;
> +=09int ret =3D 0;
> +
> +=09buf =3D kzalloc(DS_FEATURE_REPORT_PAIRING_INFO_SIZE, GFP_KERNEL);
> +=09if (!buf)
> +=09=09return -ENOMEM;
> +
> +=09ret =3D hid_hw_raw_request(ds->base.hdev, DS_FEATURE_REPORT_PAIRING_I=
NFO, buf,
> +=09=09=09DS_FEATURE_REPORT_PAIRING_INFO_SIZE, HID_FEATURE_REPORT,
> +=09=09=09HID_REQ_GET_REPORT);
> +=09if (ret < 0)
> +=09=09goto err_free;
> +=09else if (ret !=3D DS_FEATURE_REPORT_PAIRING_INFO_SIZE) {

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

> +=09=09hid_err(ds->base.hdev, "failed to retrieve DualSense pairing info\=
n");

I think this message could be improved to better pinpoint the actual proble=
m
that triggers it.


> +=09=09ret =3D -EINVAL;
> +=09=09goto err_free;
> +=09}
> +
> +=09/* Note MAC address is stored in little endian order. */

Maybe this comment would be better placed in `struct ps_device`?


> +=09memcpy(ds->base.mac_address, &buf[1], sizeof(ds->base.mac_address));
> +
> +err_free:
> +=09kfree(buf);
> +=09return ret;
> +}
> [...]


[1]: https://www.kernel.org/doc/html/latest/process/coding-style.html#placi=
ng-braces-and-spaces


Regards,
Barnab=C3=A1s P=C5=91cze
