Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB0C53220F7
	for <lists+linux-input@lfdr.de>; Mon, 22 Feb 2021 21:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbhBVUwd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Feb 2021 15:52:33 -0500
Received: from msg-2.mailo.com ([213.182.54.12]:52402 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230006AbhBVUwd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Feb 2021 15:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1614027101; bh=yT9yvRTMH3hDKjbPZh495ozLuLQga9KRyWtS41qgQCU=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:MIME-Version:Content-Transfer-Encoding;
        b=BYeUEKdZE9FXyhfvc4fAaF5jKPeAEWA1ZbxZSV+4nPOaCIg6I7JHwPaXI3UBkEqOy
         RQqEZ40po1lIclGjYCGsV/MPkZBjVaeaxIkTDiyCVCVJmmqALZ3tE04UQKs/BJZQDA
         KJUUd6WRB7tj5KV7lD68J8QkoYvsIaPpU0bflziQ=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Mon, 22 Feb 2021 21:51:41 +0100 (CET)
X-EA-Auth: f5tjIfSV86z/9LHQH2uDIBjEZ8HeKzTj2PLSAxSAmowAtHZFNnsFbP6GwYOUdr6lJYANbpibI12fpPDkqck81zFAduM28S7yZ6VZJy+/mTo=
Message-ID: <a22fda89b5f97418e936655817f45bd55f6248ee.camel@mailoo.org>
Subject: Re: [PATCH v4 2/2] Input: add MStar MSG2638 touchscreen driver
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Mon, 22 Feb 2021 21:51:39 +0100
In-Reply-To: <YDGaB6L5+Aa2snUM@google.com>
References: <20210210173403.667482-1-vincent.knecht@mailoo.org>
         <20210210173403.667482-2-vincent.knecht@mailoo.org>
         <YDGaB6L5+Aa2snUM@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le samedi 20 f=C3=A9vrier 2021 =C3=A0 15:23 -0800, Dmitry Torokhov a =C3=A9=
crit=C2=A0:
> Hi Vincent,

Hi Dmitry, thank you for the review !

> On Wed, Feb 10, 2021 at 06:33:52PM +0100, Vincent Knecht wrote:
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (i =3D 0; i < MAX_SUPPOR=
TED_FINGER_NUM; i++) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0p =3D &touch_event.pkt[i];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0/* Ignore non-pressed finger data */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0if (p->xy_hi =3D=3D 0xFF && p->x_low =3D=3D 0xFF && p-=
>y_low =3D=3D 0xFF)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0contin=
ue;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0coord.x =3D (((p->xy_hi & 0xF0) << 4) | p->x_low) * ms=
g2638->prop.max_x / TPD_WIDTH;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0coord.y =3D (((p->xy_hi & 0x0F) << 8) | p->y_low) * ms=
g2638->prop.max_y / TPD_HEIGHT;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0msg2638_report_finger(msg2638, i, &coord);
>=20
> We do not scale the coordinates in the kernel. Rather we provide
> resolution, if known, and min/max coordinates reported by the hardware,
> and let userspace handle the rest.

Ok, will remove scaling... I was able to test it's ok by setting=20
touchscreen-size-{x,y} =3D <2048>;

> > +static int __maybe_unused msg2638_suspend(struct device *dev)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct i2c_client *client =
=3D to_i2c_client(dev);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct msg2638_ts_data *msg2=
638 =3D i2c_get_clientdata(client);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mutex_lock(&msg2638->input_d=
ev->mutex);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (input_device_enabled(msg=
2638->input_dev))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0msg2638_stop(msg2638);
>=20
> I believe that you should power down the device only if it is not
> configures as wakeup source. In fact (and I think most drivers are
> wrong in this), you may want to power up the device if it is a wakeup
> source and it does not have any users.

I don't know much on this subject ; from downstream code, it seems
the touchscreen supports "wakeup gestures" (like "double click",
up/down/left/right directions and some characters/letters) and apparently
an irq-gpio which would be used to wakeup.
I don't handle that currently, is it required ?





