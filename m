Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04E835277B
	for <lists+linux-input@lfdr.de>; Fri,  2 Apr 2021 10:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhDBIgx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Apr 2021 04:36:53 -0400
Received: from mout.gmx.net ([212.227.15.15]:46167 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhDBIgw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 2 Apr 2021 04:36:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617352605;
        bh=SRNBv6ECwC2XNn0o2y8KXFzY0VnSxS+CVAT/uom7TMQ=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=jdp/remb4LxCZcmf/soiE7BRoDys4SnpNwlNWWsVIhmXiAJXUgHdt/MoZjOqmD1Z3
         zP0nQQk8KNyjtNIEhtBIvyJYSni2/xm+11EGDo28kBOWP0U/sDB63RK286quF0BE1x
         XHZzFNaWsQ2ikdgk9DNgAwAMpFhhEchOjQOjv6fI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacOW-1m2xgl0cWo-00c6VL; Fri, 02
 Apr 2021 10:36:45 +0200
Date:   Fri, 2 Apr 2021 10:36:44 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>
Subject: Re: [PATCH v2 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <YGbXnGTpx1WTPpz0@latitude>
References: <20210306194120.GA1075725@robh.at.kernel.org>
 <20210401230358.2468618-1-giulio.benetti@benettiengineering.com>
 <20210401230358.2468618-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="taR3GFVu4MBwJP54"
Content-Disposition: inline
In-Reply-To: <20210401230358.2468618-3-giulio.benetti@benettiengineering.com>
X-Provags-ID: V03:K1:5Y7YXM+92QAzKPSYIeauS9Gfifsdg94W9maa3a3GabmtiP+XMeM
 Jisyw2zy1IE/IvaVrk5NMvsWkKaxi8zwfC/hNvdC5Dh5T0mHN82CWxmqlMy5jof9qCjZIou
 bRUDdqGDDFxSBS6EVthTycVPs2I0dzHYI4IlZSi/BiDM92xFKI6NV6FiY/fpDJKaVkoIEOp
 Lepw4Ypn1TqiIDhx3//4g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dqY8fRfASF4=:tXYatZ2h/7cYJi6aeShes8
 9cY65vNokX3/Hx90DWqYV8Dq8igXN6qiKk+wF9p1jmgUnXkoKwTiLICKqOYe5kTPP9pG7N2ZJ
 pHtkmIJvFd8RKdX2JjaGQwfe5GGWGvaz8Wuc1c56qol8KttDsJRlk3jugKL25j67sRaRrh5td
 lp20lsWn5i/Xv1NEdLjnNLf0TV7QL5XJEYYCfEenNV9KuKqOAT3jZRLhEeG6UWi8tAhC7rBzA
 7XEQfADhh8rPDtza9tyolQF+kxGS31ML+ZgAgwgR0MTgtOzQpIYoRQKBWfZ09zwuiF+btEAjv
 xzsUrFy+qAkLYyGkUNECT7kGjXKd5QHFq5e8IEPIpNp/cFsSR0Vtwk1nA3ryA7yqog16YEjHd
 RDNykWQHwrwxG4Bh4gULDUpb1LoWmqSS7awierGtLEy4eaOn4vEW+NwBvRaDG2YBDxSoCL3wt
 gIIRtackx9chugvQotKjDlBd8fpj5uZwAmJvYtb5CC8FVxgNrr5J3tP2MSMB4pGV15QqpuWAE
 l6j36DK1Abz9x8IeE9KLj/MPh03mzuTcQY5gMGMAJQSTn0SINfJySZA8EilYXwfTDunYI6JYO
 Xc9eMTaPjVYN/hZzNacLTDPL1c07MEHH3KTnLE41WaSNz4rsL/y69N5unzKVaK7jQRRQXARg/
 w2sX+XMqAAFlFw/BhJ/hHX9uq1ZjA8ZaWQWcG0Zf1jQNstHKLjK+sMs2OcsdDfOmKATKXYIq/
 5Mb/4UM66Fp5C9XoUDtwDvcW6IwLYB8HRrcJUkW17bXVVj0Fq/aGAJ1C59KjuPUyDlW/h0cKl
 fYZZ5fQrTGHd1G7bO1Df0OjFnBQ/qnun2TEsyBXlNtOBMsl61mKQe/ulGpdWBbVsbV/5tzmvR
 EnzdBeb5VjTDJ8lbnUeYfGZcoUdjg8U4rAo93A+bLl7Z+UQ12VbmbxYqHqDve7BtIUccoS/yx
 SF8FyKuFRJ6eciBkvW4nk2JfS4ilWgwwLGmd6bLLc8d4XL56HtJhB7v/XhTEa691cy9mNshWu
 /ON2otJjLvc5H/26mOuN9ONgVZsxE3s0BBCzZBqChDKSB+Tm9781PvWJ+vAdZ9qOmtQ3E1vdM
 2FquDx9at0P8QAEN+sUgchkWK03ee3myexJAh13iNMc2AxPNtalMDZ4YazZk3VQjQqp0BkPlI
 vBG6ik8H2gp3xIzVVnOIMH7HQzB+4KboMjzyhHMfF6l3b9NCDunPgdPbJ570kbuAlDQiQ/mq0
 okhynJoy6YmHzjg/n
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--taR3GFVu4MBwJP54
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 02, 2021 at 01:03:57AM +0200, Giulio Benetti wrote:
> This adds device tree bindings for the Hycon HY46XX touchscreen series.
>=20
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> As suggested by Rob Herring:
> * fixed $id: address
> * added "hycon," in front of every custom property
> * changed all possible property to boolean type
> * removed proximity-sensor-switch property since it's not handled in driv=
er
> ---
>  .../input/touchscreen/hycon,hy46xx.yaml       | 120 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/h=
ycon,hy46xx.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/hycon,hy=
46xx.yaml b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46x=
x.yaml
> new file mode 100644
> index 000000000000..71a1dbabcd4f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/touchscreen/hycon,hy46xx.ya=
ml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/touchscreen/hycon,hy46xx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: hycon HY46XX series touchscreen controller Bindings

hycon -> Hycon        (because it's a name)
Bindings -> bindings  (because it's just a regular word)

> +
> +description: |
> +             There are 6 variants of the chip for various touch panel si=
zes and coverl len material

"coverl len material" looks like a typo. What does it mean?

> +              Glass: 0.3mm--4.0mm
> +              PET/PMMA: 0.2mm--2.0mm
> +               HY4613(B)-N048  < 6"
> +               HY4614(B)-N068  7" .. 10.1"

According to the datasheet I was able to find[1], HY4613-N048 supports
touch panel sizes smaller than 5.3". Did this change in newer
datasheets?

What does the (B) part of the part number mean?


[1]: https://datasheetspdf.com/pdf/1297773/HYCON/HY4613-N048/1

> +               HY4621-NS32  < 5"
> +               HY4623-NS48  5.1" .. 7"
> +              Glass: 0.3mm--8.0mm
> +              PET/PMMA: 0.2mm--4.0mm
> +               HY4633(B)-N048  < 6"
> +               HY4635(B)-N048  < 7" .. 10.1"

The description block seems unusually far indented. I'm not a YAML
expert, but according to the yamllint tool, it would work with much less
indentation:

description: |
  There are 6 variants of the chip for various touch panel sizes and coverl=
 len material
   Glass: 0.3mm--4.0mm
[...]


> +  hycon,glove-enable:
> +    type: boolean
> +    description: Allows enabling or disabling glove setting.

Small nit: Due to the way boolean properties work in DT, you can't
really use the property to disable the glove setting (in order to
disable the setting, you would explicitly not use the property).
Perhaps:

+    description: Allows enabling the glove setting.

I don't really know :)


> +
> +  hycon,report-speed:
> +    description: Allows setting the report speed(i.e 0x64 =3D> 100Hz).
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255

Please add a space before the opening parenthesis:

+    description: Allows setting the report speed (i.e 0x64 =3D> 100Hz).

Or perhaps like this:

+    description: Allows setting the report speed in Hertz.



Thanks,
Jonathan Neusch=C3=A4fer

--taR3GFVu4MBwJP54
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBm14sACgkQCDBEmo7z
X9uLlQ/9GV+3KAqRp5/lDFRCT2Chuaw1xKxClHon1fMiSSzMz3V9H+0zUgobDM3i
aOe/fkprdekhBhoJ3JK3iQFjFgh+xED9mVkcq5FMZOTWcwB7rtrZrWm2Gfw2VoWV
WipwZ4VZWoAISplWlsfrSyfBnXU731ttYvlGe9ddzrxmMwhm9CSYDKhOm1YCpsPP
+VSPcn0nQIaY83vkZ2yj6xznF7yiG+YoF+hpSxef8b08py+TR576E7n8t1udth5p
qvIxyKfyovVhCQetGnUnscGvX3qZEUrFOdajXBnWewqnUB0YsZsq0KaD1FhZhtb9
x2dUJes7rlVDTGpDhb5MddfiEd47UzPy1Fa2bpXg5/OExvtSubF4rUSBcCV7Nc+5
cLoW1DVQE4RfwVFnxTg6VCCl12CzS1q5vbF0mvhEb73+y/V7sNlg9gk3l7T+ZKK6
4mDbNZM8vD70h2u/Qop7h3fUAsR7o1Tl/fSfndjECsIUxWU5XCCoK0p5qUBnRwdZ
9l5NxOeWFlaM5oQ2K5SR4EOWcVxdSoiqmCzHYFANFvYf8DbQyII8qWRiQvw6ualq
jQRDZhUHNKn/ms+4yHD91rWfjWyfJZqt98qaBljWvUrahAkIw6j1tAmyZeHsRwiM
ud6+SttlUQx3H+xzqglDb3QdK8vvQKNS1tnc+2Tpgf4fVPrC/co=
=rsUz
-----END PGP SIGNATURE-----

--taR3GFVu4MBwJP54--
