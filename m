Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28AE3316EAA
	for <lists+linux-input@lfdr.de>; Wed, 10 Feb 2021 19:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234072AbhBJSaC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Feb 2021 13:30:02 -0500
Received: from ip-15.mailobj.net ([213.182.54.15]:37392 "EHLO msg-4.mailo.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234060AbhBJS1o (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Feb 2021 13:27:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612979336; bh=FiwrkizrBSPTsvKMxQnwJcv6n7jqODJU8WnEpBli1GY=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:MIME-Version:Content-Transfer-Encoding;
        b=aVejjDj+LtOND0rHwfM/BdxyKlPIzF5FVjD5TmwNWFdXOBr9qMrGiduah5cMONWdF
         crLyraOuDUeRMx+6SDny5iqYZbs73rd3Uqst8HNr9w2EWmnOi+/HoEmleAytVMbVp/
         xXjGIJcJFSHYZcSFNmRRPofaiR/Uf9tAlje2L5PQ=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Wed, 10 Feb 2021 18:48:56 +0100 (CET)
X-EA-Auth: 4xS/QoYM2v4q6SHusZVcWgnrZ5wIyvdcZxzttcMlxFecgXiC1vChK1nXQpXsw9yNRr9zDGCf/YWUyTd4ricXeiAGrcCnhkeza7yHCrNqkDA=
Message-ID: <97ef97e996c2089cedb450f9aaac123208ca18e9.camel@mailoo.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: input/touchscreen: add bindings for
 msg26xx
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Wed, 10 Feb 2021 18:48:55 +0100
In-Reply-To: <20210210031000.GA10151@labundy.com>
References: <20210121174359.1455393-1-vincent.knecht@mailoo.org>
         <20210209161319.GA3849081@robh.at.kernel.org>
         <07cac63721a9ca63733617e461d640e8927a78f3.camel@mailoo.org>
         <20210210031000.GA10151@labundy.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le mardi 09 f=C3=A9vrier 2021 =C3=A0 21:10 -0600, Jeff LaBundy a =C3=A9crit=
=C2=A0:
> Hi Vincent,
>=20
> On Tue, Feb 09, 2021 at 07:58:33PM +0100, Vincent Knecht wrote:
> > Le mardi 09 f=C3=A9vrier 2021 =C3=A0 10:13 -0600, Rob Herring a =C3=A9c=
rit=C2=A0:
> > > On Thu, Jan 21, 2021 at 06:43:47PM +0100, Vincent Knecht wrote:
> > > > This adds dts bindings for the mstar msg26xx touchscreen.
> > > >=20
> > > > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > > > ---
> > > > Changed in v3:
> > > > - added `touchscreen-size-x: true` and `touchscreen-size-y: true` p=
roperties
> > > > Changed in v2:
> > > > - changed M-Star to MStar in title line
> > > > - changed reset gpio to active-low in example section
> > > > ---
> > > > =C2=A0.../input/touchscreen/mstar,msg26xx.yaml=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 69 +++++++++++++++++++
> > > > =C2=A01 file changed, 69 insertions(+)
> > > > =C2=A0create mode 100644 Documentation/devicetree/bindings/input/to=
uchscreen/mstar,msg26xx.yaml
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/input/touchscreen/ms=
tar,msg26xx.yaml
> > > > b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx=
.yaml
> > > > new file mode 100644
> > > > index 000000000000..5d26a1008bf1
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg=
26xx.yaml
> > > > @@ -0,0 +1,69 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/input/touchscreen/mstar,msg26xx=
.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: MStar msg26xx touchscreen controller Bindings
> > > > +
> > > > +maintainers:
> > > > +=C2=A0 - Vincent Knecht <vincent.knecht@mailoo.org>
> > > > +
> > > > +allOf:
> > > > +=C2=A0 - $ref: touchscreen.yaml#
> > > > +
> > > > +properties:
> > > > +=C2=A0 compatible:
> > > > +=C2=A0=C2=A0=C2=A0 const: mstar,msg26xx
> > >=20
> > > Don't use wildcards in compatible strings.
> >=20
> > Thank you for the input...
> >=20
> > Let's say I set it to "mstar,msg2638", is it better to rename the drive=
r file and functions too ?
> > According to downstream source file naming, msg2638 is the model I have=
 and test this driver with.
>=20
> This is ultimately Dmitry's call, but it's fairly common to use wildcards
> for driver names and function calls if the driver is known to work across
> all devices that fit in the wildcard (see iqs5xx and many others).
>=20
> The risk with wildcards, however, is that vendors can introduce different
> devices later with similar part numbers. Therefore, some subsystems (e.g.
> iio) tend to frown upon wildcards for that reason.
>=20
> You should try and make the driver cover as many devices as possible. But
> if the driver is only known to work for one device then I don't think you
> can use a wildcard in the name unless you support all other devices (just
> my opinion).
>=20
> In either case, however, compatible strings must be unique just as with a
> part number in a schematic or bill of materials. As such, it is perfectly
> fine to have multiple compatible strings in a single driver.
>=20
> >=20
> >=20
> > There's a possibility this driver works as-is or with minor mods for ms=
g2633 too,
> > and a more remote one for msg21xx and msg22xx...
> >=20
>=20
> Kind regards,
> Jeff LaBundy

Thank you Jeff for the insight.

Since I can't test it with any other model, I've renamed it to msg2638 in v=
4:
https://lore.kernel.org/linux-input/20210210173403.667482-1-vincent.knecht@=
mailoo.org/T/#t





