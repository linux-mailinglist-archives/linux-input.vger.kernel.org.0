Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02EF23159B8
	for <lists+linux-input@lfdr.de>; Tue,  9 Feb 2021 23:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234498AbhBIWu6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 9 Feb 2021 17:50:58 -0500
Received: from msg-2.mailo.com ([213.182.54.12]:41014 "EHLO msg-2.mailo.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234415AbhBIW00 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 9 Feb 2021 17:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1612897114; bh=V3ccey8WzD2XM7AIsQttYEM9eTcmjZ4r0L//q+ngfDY=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:MIME-Version:Content-Transfer-Encoding;
        b=EuwOSoBSYeNTUosXXdJcfv6d/N0BqOdiTnMD29Ho55Q6IP51jmzYzDrgbX+sLfdhX
         nhCp3nsZlcxop2yWVl6UYSTnvA5bHXWnqGFeg/ruG9BLkSidOYhviXz5ubrzgubHZQ
         ZyeOCOCKi4yeAgVXj9qPxJS39khz9axAY5H7jvzc=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via proxy.mailoo.org [213.182.55.207]
        Tue,  9 Feb 2021 19:58:34 +0100 (CET)
X-EA-Auth: miDhEH5cip3PJigdiPHecsZKJftJVBmcIk/mjlO+sZYfQ82rAqPsLR+iXZKaGjd+Fg+sq5g9isTz3qrMVpIRrbEk72TO8fzfsr7vDETcAvM=
Message-ID: <07cac63721a9ca63733617e461d640e8927a78f3.camel@mailoo.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: input/touchscreen: add bindings for
 msg26xx
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Michael Srba <Michael.Srba@seznam.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Date:   Tue, 09 Feb 2021 19:58:33 +0100
In-Reply-To: <20210209161319.GA3849081@robh.at.kernel.org>
References: <20210121174359.1455393-1-vincent.knecht@mailoo.org>
         <20210209161319.GA3849081@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Le mardi 09 f=C3=A9vrier 2021 =C3=A0 10:13 -0600, Rob Herring a =C3=A9crit=
=C2=A0:
> On Thu, Jan 21, 2021 at 06:43:47PM +0100, Vincent Knecht wrote:
> > This adds dts bindings for the mstar msg26xx touchscreen.
> >=20
> > Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> > ---
> > Changed in v3:
> > - added `touchscreen-size-x: true` and `touchscreen-size-y: true` prope=
rties
> > Changed in v2:
> > - changed M-Star to MStar in title line
> > - changed reset gpio to active-low in example section
> > ---
> > =C2=A0.../input/touchscreen/mstar,msg26xx.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 69 +++++++++++++++++++
> > =C2=A01 file changed, 69 insertions(+)
> > =C2=A0create mode 100644 Documentation/devicetree/bindings/input/touchs=
creen/mstar,msg26xx.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/mstar,=
msg26xx.yaml
> > b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx.yam=
l
> > new file mode 100644
> > index 000000000000..5d26a1008bf1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/mstar,msg26xx=
.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/touchscreen/mstar,msg26xx.yam=
l#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: MStar msg26xx touchscreen controller Bindings
> > +
> > +maintainers:
> > +=C2=A0 - Vincent Knecht <vincent.knecht@mailoo.org>
> > +
> > +allOf:
> > +=C2=A0 - $ref: touchscreen.yaml#
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 const: mstar,msg26xx
>=20
> Don't use wildcards in compatible strings.

Thank you for the input...

Let's say I set it to "mstar,msg2638", is it better to rename the driver fi=
le and functions too ?
According to downstream source file naming, msg2638 is the model I have and=
 test this driver with.


There's a possibility this driver works as-is or with minor mods for msg263=
3 too,
and a more remote one for msg21xx and msg22xx...






