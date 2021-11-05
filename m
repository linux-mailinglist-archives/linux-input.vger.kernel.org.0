Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8802A446541
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 15:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233152AbhKEOzd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 10:55:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231140AbhKEOza (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 10:55:30 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4EB9C061714;
        Fri,  5 Nov 2021 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0BDivR2e7gK5AhopOLLPM2YDzPI9BZ1+6HTjQttj6iQ=; b=hr7IohAlHYnm5gT2uyeQAjecwX
        8w1orpHEUkBNXb9CrKaHZncTnB2nQoQZ/KBTZa2VhcGdTR5rr8uUIt9/wnCsSC++BiyT0OdpIkOz8
        YifP1N0Ane4F347M/XG39qp13y0sDRk3x/B3t9/3wq9ADcdi2Y5ap3Oma9eT1hqklVNQ=;
Received: from p200300ccff0899001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff08:9900:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mj0aC-0004rc-F7; Fri, 05 Nov 2021 15:52:44 +0100
Date:   Fri, 5 Nov 2021 15:52:43 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mylene.josserand@free-electrons.com, linus.walleij@linaro.org,
        rydberg@bitmath.org, dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v2 0/4] Add support for the Cypress cyttsp5
Message-ID: <20211105155243.7b635651@aktux>
In-Reply-To: <20211103114830.62711-1-alistair@alistair23.me>
References: <20211103114830.62711-1-alistair@alistair23.me>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hallo Alistair,

my Xorg (debian buster installation) does not like that:
[  3112.462] (**) cyttsp5: Applying InputClass "evdev touchscreen catchall"
[  3112.462] (**) cyttsp5: Applying InputClass "libinput touchscreen catcha=
ll"
[  3112.462] (II) Using input driver 'libinput' for 'cyttsp5'
[  3112.463] (**) cyttsp5: always reports core events
[  3112.463] (**) Option "Device" "/dev/input/event1"
[  3112.463] (**) Option "_source" "server/udev"
[  3112.496] (II) event1  - cyttsp5: is tagged by udev as: Touchscreen
[  3112.498] (EE) event1  - cyttsp5: kernel bug: device has min =3D=3D max =
on ABS_X
[  3112.498] (II) event1  - cyttsp5: was rejected
[  3112.498] (II) event1  - not using input device '/dev/input/event1'.
[  3112.499] (EE) libinput: cyttsp5: Failed to create a device for /dev/inp=
ut/event1

# evtest /dev/input/event1=20
Input driver version is 1.0.1
Input device ID: bus 0x0 vendor 0x0 product 0x0 version 0x0
Input device name: "cyttsp5"
Supported events:
  Event type 0 (EV_SYN)
  Event type 1 (EV_KEY)
    Event code 330 (BTN_TOUCH)
  Event type 2 (EV_REL)
  Event type 3 (EV_ABS)
    Event code 0 (ABS_X)
      Value      0
      Min        0
      Max        0 <-- upsets xorg
    Event code 1 (ABS_Y)
      Value      0
      Min        0
      Max        0
    Event code 47 (ABS_MT_SLOT)
      Value      0
      Min        0
      Max       31
    Event code 48 (ABS_MT_TOUCH_MAJOR)
      Value      0
      Min        0
      Max      255
    Event code 49 (ABS_MT_TOUCH_MINOR)
      Value      0
      Min        0
      Max      255
    Event code 53 (ABS_MT_POSITION_X)
      Value      0
      Min        0
      Max     1447
    Event code 54 (ABS_MT_POSITION_Y)
      Value      0
      Min        0
      Max     1071
    Event code 57 (ABS_MT_TRACKING_ID)
      Value      0
      Min        0
      Max    65535
    Event code 58 (ABS_MT_PRESSURE)
      Value      0
      Min        0
      Max      255

I specified touchscreen-size-x and touchscreen-size-y in my devicetree.
No idea why it is like this yet.

Regards,
Andreas

On Wed,  3 Nov 2021 21:48:26 +1000
Alistair Francis <alistair@alistair23.me> wrote:

> This patch series builds on top of [1] and adds support for the cyttsp5
> touchscreen controller for the reMarkable 2.
>=20
> I first tried to add an I2C HID device. Although the cyttsp5 has some HID
> looking aspects it is not HID compatible. Just in trying to probe the dev=
ice
> I found:
>  - The HID descriptor has extra padding
>  - The HID descriptor sets the high bytes of the descriptor length
>  - The HID descriptor has extra unrecognised tags
>  - The HID reset command doesn't appear to work
>=20
> I don't think there is a way to use the I2C HID framework with the cyttsp=
5.
> For anyone interested you can see the work here [2]. In that branch thoug=
h I
> can only obtain a HID descriptor, nothing else works without more core
> changes.
>=20
> So instead I rebased the series from [1]. Converted to the new yaml DTS
> documentation, added regulator support and fixed a x/y miscalculation bug.
>=20
> 1: https://lwn.net/ml/linux-kernel/20180703094309.18514-1-mylene.josseran=
d@bootlin.com/
> 2: https://github.com/alistair23/linux/commits/rM2-mainline-cyttsp5-hid
>=20
> Alistair Francis (2):
>   ARM: imx_v6_v7_defconfig: Enable the cyttsp5 touchscreen
>   ARM: dts: imx7d: remarkable2: Enable the cyttsp5
>=20
> Myl=C3=A8ne Josserand (2):
>   Input: Add driver for Cypress Generation 5 touchscreen
>   Documentation: DT: bindings: input: Add documentation for cyttsp5
>=20
>  .../input/touchscreen/cypress,tt21000.yaml    |   92 ++
>  arch/arm/boot/dts/imx7d-remarkable2.dts       |   89 ++
>  arch/arm/configs/imx_v6_v7_defconfig          |    1 +
>  drivers/input/touchscreen/Kconfig             |   14 +
>  drivers/input/touchscreen/Makefile            |    1 +
>  drivers/input/touchscreen/cyttsp5.c           | 1135 +++++++++++++++++
>  6 files changed, 1332 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/c=
ypress,tt21000.yaml
>  create mode 100644 drivers/input/touchscreen/cyttsp5.c
>=20

