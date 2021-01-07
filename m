Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E0922ED622
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 18:56:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbhAGR4C (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 12:56:02 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:63296 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727058AbhAGR4C (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 7 Jan 2021 12:56:02 -0500
Date:   Thu, 07 Jan 2021 17:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610042119;
        bh=mwXdoxJJLMFi9/FznGQx5flWs07lXINV7WgK0geB2ac=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=f49o2XVYcmKqs4HSMwe6Pe2rOsqqjKeOCquqKUlbF/kXvHWnFpnQvQTTn0L5Nyymo
         thdwu6SfGBCUHkcSm8Rz4XuOan47VRvHnFlCftcZZBjrzeseaGGnegCPZqm8j5vu8c
         XDWEbuasJVOmFHgIPVVHSRlDMMLLdgu8XYv27QwQ=
To:     Roderick Colenbrander <roderick@gaikai.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        Chris Ye <lzye@google.com>,
        Roderick Colenbrander <roderick.colenbrander@sony.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 04/13] HID: playstation: add DualSense touchpad support.
Message-ID: <hlyNznSUfcW_czYSEujBvakJ92vtQV_ekz00HR1yQqxoHdTA-NJsWNdUpf4BzJTP4KNrRZsofn-7x16N10MGuJxxeeYxzljTeXkyGTz3uIU=@protonmail.com>
In-Reply-To: <20210102223109.996781-5-roderick@gaikai.com>
References: <20210102223109.996781-1-roderick@gaikai.com> <20210102223109.996781-5-roderick@gaikai.com>
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
> Implement support for DualSense touchpad as a separate input device.
>
> Signed-off-by: Roderick Colenbrander <roderick.colenbrander@sony.com>
> [...]
> +static struct input_dev *ps_touchpad_create(struct hid_device *hdev, int=
 width, int height,
> +=09=09unsigned int num_contacts)
> +{
> +=09struct input_dev *touchpad;
> +=09int ret;
> +
> +=09touchpad =3D ps_allocate_input_dev(hdev, "Touchpad");
> +=09if (IS_ERR(touchpad))
> +=09=09return ERR_PTR(-ENOMEM);

I know that at the moment ENOMEM is the only possible error, but I believe
`return ERR_CAST(touchpad);` would be better. (Or even just `return touchpa=
d;`.)


> +
> +=09/* Map button underneath touchpad to BTN_LEFT. */
> +=09input_set_capability(touchpad, EV_KEY, BTN_LEFT);
> +=09__set_bit(INPUT_PROP_BUTTONPAD, touchpad->propbit);
> +
> +=09input_set_abs_params(touchpad, ABS_MT_POSITION_X, 0, width - 1, 0, 0)=
;
> +=09input_set_abs_params(touchpad, ABS_MT_POSITION_Y, 0, height - 1, 0, 0=
);
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
> [...]
