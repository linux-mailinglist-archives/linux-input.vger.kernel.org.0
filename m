Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4E22EE698
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 21:14:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbhAGUOZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 15:14:25 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:59072 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbhAGUOY (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 15:14:24 -0500
Date:   Thu, 07 Jan 2021 20:13:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610050422;
        bh=f503+m/VBrvDwDWMD/dEfxSiecD7MP2mKsZbVhlbXN0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=EqraZA3xNg2yoXDJYKjCrUZAx1SMdhIi0egyqXIxC9ns4PT+6ESzSLsBbVfMWgskX
         E6R2m/URo2vkINXQ3JlkTBIIVPM66pjZ/jA0uXR0rlqRm0TBvg3g/THnJODGV3BUqv
         n5ybeuhGMrgxMPOtNo7FN97FyDN/jPDrydHOO2F0=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 06/13] HID: playstation: track devices in list.
Message-ID: <WadJh9J7gmMTty7hDHz6YBWUAdpP5rwz5WGzQvxkhfIImQL4JJ1F2coT3zgP0i0bbtdi2oUtMwWG6qF-4m2TrdhEu2iWJMGHDP2WbB2PTEU=@protonmail.com>
In-Reply-To: <20210102223109.996781-7-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-7-roderick@gaikai.com>
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
> Track devices in a list, so we can detect when a device is connected
> twice when using Bluetooth and USB.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> [...]
> @@ -635,6 +671,10 @@  static struct ps_device *dualsense_create(struct hi=
d_device *hdev)
>  =09}
>  =09snprintf(hdev->uniq, sizeof(hdev->uniq), "%pMR", ds->base.mac_address=
);
>
> +=09ret =3D ps_devices_list_add(ps_dev);
> +=09if (ret < 0)

It's a minor thing, and I have already mentioned it in regards to other fun=
ctions,
but I believe if `ps_devices_list_add()` can only return 0 on success, or a=
n errno,
then `if (ret)` would be better.


> +=09=09return ERR_PTR(ret);
> +
>  =09ret =3D dualsense_get_calibration_data(ds);
>  =09if (ret < 0) {
>  =09=09hid_err(hdev, "Failed to get calibration data from DualSense\n");
> @@ -667,6 +707,7 @@  static struct ps_device *dualsense_create(struct hid=
_device *hdev)
>  =09return &ds->base;
>
>  err:
> +=09ps_devices_list_remove(ps_dev);
>  =09return ERR_PTR(ret);
>  }
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
