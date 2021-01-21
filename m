Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E43A2FE8DE
	for <lists+linux-input@lfdr.de>; Thu, 21 Jan 2021 12:33:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730506AbhAULdK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 21 Jan 2021 06:33:10 -0500
Received: from msg-1.mailo.com ([213.182.54.11]:38464 "EHLO msg-1.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730498AbhAULdC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 21 Jan 2021 06:33:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1611228723; bh=M2QKbhInlCnQOQT7RuMwftmcVbWNxVTLo5dHpoQRqbw=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:MIME-Version:Content-Transfer-Encoding;
        b=SOszrcp/9f/5xRBkhl2IS8Zpoj3YbNntUt/yiXQGNIJiJaU0Hi8fJWhQFjJvPyw8t
         phpUcFWboc6Bzgjv+q6TnMv2saldvQWRQNMCUe1YNGkmSCog7eJZoZ02WlO32+f6Ae
         o+AlZu+QtTZ0NAf1Vz3nY5/etbl+dWpeiPkJbU7g=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Thu, 21 Jan 2021 12:32:03 +0100 (CET)
X-EA-Auth: S72GLYOuz1vlT0elXBFH8QtqmGG6dMgBY/8X8YXDJm4vPuvVnAvMtJroEyXMwFfomcMMSOlGS2WfyLrKgRfaySyHGno4mE6860+wL2/x59s=
Message-ID: <023807d33f122262f235712d7fc7af4ea9e5817b.camel@mailoo.org>
Subject: Re: [PATCH 2/2] Input: add MStar msg26xx touchscreen driver
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Thu, 21 Jan 2021 12:32:02 +0100
In-Reply-To: <YAknNNgx66HDtrgQ@google.com>
References: <20210120180119.849588-1-vincent.knecht@mailoo.org>
         <20210120180119.849588-2-vincent.knecht@mailoo.org>
         <YAknNNgx66HDtrgQ@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry!

Le mercredi 20 janvier 2021 =C3=A0 23:03 -0800, Dmitry Torokhov a =C3=A9cri=
t=C2=A0:
> Hi Vincent,
>=20
> On Wed, Jan 20, 2021 at 07:01:08PM +0100, Vincent Knecht wrote:
> > +struct packet {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0y_high : 4;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0x_high : 4;
>=20
> This will not work on big endian devices as order of bitfields changes.
> I'd recommended treating contact packet as sequence of bytes and parse,
> i.e.
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0x =3D ((buf[0] & 0x0f) <<=
 8) | buf[1];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0x =3D ((buf[0] & 0xf0) <<=
 4) | buf[2];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0...

Ok, will change in v2

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0x_low;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0y_low;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u8=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0pressure;
> > +};
> > +
> > +
> > +static void mstar_power_on(struct msg26xx_ts_data *msg26xx)
> > +{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpiod_set_value(msg26xx->res=
et_gpiod, 0);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mdelay(10);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0gpiod_set_value(msg26xx->res=
et_gpiod, 1);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mdelay(FIRMWARE_ON_DELAY);
>=20
> I am pretty sure this is incorrect. You are saying that you release the
> reset line, wait a bit, and then assert it. gpiod is a logical API, with
> 0 being inactive and 1 being active, and here you want to activate the
> reset line, wait appropriate time, release it, and wait for the device
> to initialize. What does the datasheet say about reset GPIO polarity?
>=20
> Thanks.

I don't have any datasheet, only downstream code and dts for my device...
After changing this function to assert then deassert and also the reset gpi=
o
polarity in my dts, it works as intended.
I'll send a v2 shortly, also changing the example section in bindings to
reflect the dts change I had to make (plus a minor change in title).

Thank you for the review!




