Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C5352E7D50
	for <lists+linux-input@lfdr.de>; Thu, 31 Dec 2020 01:09:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgLaAJh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 30 Dec 2020 19:09:37 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:52492 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgLaAJh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 30 Dec 2020 19:09:37 -0500
Date:   Thu, 31 Dec 2020 00:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1609373335;
        bh=Z0qWUIjYFPtB/T1kZy/Bw0QDTjHrrjuhAfqUPxKNIjU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=PotkNgBdLaSzi1gtwGCtFB9KA5QAZb3Fcx+19zuM1KL/pdrMGj9TjaiXIEWntxkto
         pSghK0Le+WsQxXpGqNI+gFhd9sjuCvt+kpKWvrp/gFJzPJ4sa22rqFALMJ/OT+JabU
         eNBm8cywzTFpSySKh+vX4LgJlw987VQeU5lM2U8g=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 01/13] HID: playstation: initial DualSense USB support.
Message-ID: <XaYh_eZH3W0b4TFT3b5KfG-OC2czmCiodqHnakwh-rTisgWKDt1X7iveFFHPExiktj5lRhIjqp41OjjB463SPTdXK6-zNrC-LCHD17ZwN1Y=@protonmail.com>
In-Reply-To: <20201219062336.72568-2-roderick@gaikai.com>
References: <20201219062336.72568-1-roderick@gaikai.com> <20201219062336.72568-2-roderick@gaikai.com>
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
> +static const struct hid_device_id ps_devices[] =3D {
> +=09{ HID_USB_DEVICE(USB_VENDOR_ID_SONY, USB_DEVICE_ID_SONY_PS5_CONTROLLE=
R),
> +=09=09.driver_data =3D 0 },
> +};
> [...]

I have come across an AUR package [1], and looking at the modifications app=
lied
there (work-without-modifying-hid-quirks.patch), I think should be a termin=
ating
entry in this array. And maybe `MODULE_DEVICE_TABLE()` is also missing?

[1]: https://aur.archlinux.org/packages/hid-playstation-dkms/


Regards,
Barnab=C3=A1s P=C5=91cze
