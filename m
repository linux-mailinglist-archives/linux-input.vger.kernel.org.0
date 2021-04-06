Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CE3355551
	for <lists+linux-input@lfdr.de>; Tue,  6 Apr 2021 15:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243976AbhDFNh1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 6 Apr 2021 09:37:27 -0400
Received: from mout.gmx.net ([212.227.17.20]:41181 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233252AbhDFNh1 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 6 Apr 2021 09:37:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1617716231;
        bh=W+UtVtp8aM/GVU9D1YF/wcU0c2NsWAGAV4/H08vIA+o=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
        b=XNb813X1/hhfJXpSMO7YaLu0OTDnVf3MnbAMLI769t3J4DreI+741Sum3BIeqxqeR
         YeHom9xa1gUcC+7jSSkcCGy7iZg8j/d7Lsx0f/o5M5IC5AcnBdQRGyvyKnfWDZxxqf
         8gzPlwidvGwzxKC/dbwN1r5jlobXDg7s6Sods7jo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.134]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1wpt-1lagu62wfZ-012EiF; Tue, 06
 Apr 2021 15:37:11 +0200
Date:   Tue, 6 Apr 2021 15:37:11 +0200
From:   Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] dt-bindings: touchscreen: Add HY46XX bindings
Message-ID: <YGxkB6icZSJfx/VB@latitude>
References: <YGbc7Qbu6s659Mx4@latitude>
 <20210402161627.2546145-1-giulio.benetti@benettiengineering.com>
 <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="9WUZB2G+sPhVyB7j"
Content-Disposition: inline
In-Reply-To: <20210402161627.2546145-3-giulio.benetti@benettiengineering.com>
X-Provags-ID: V03:K1:ZwLG6T1+PLZ8a4BRXNhawlEcNxwpZ5xzDSjFTT/38p33fMLvmuU
 1qrLhvNhxa3kpkyvF8YcUaQ3ZDB/O7cdZH3oO7+Gs6Epnoky8oo4isNCs0N7HryVOTjqeNe
 aD/JKFTSK75l982EELoloRS5+s17HGLIxh3LzHG7A4wzTHXGptqTXoiJ2Y2xE2YI0ECiTBy
 qAUF6VpqaEq8Vff7IsRIg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUFskwDCf28=:bxAP6ALs5g9byp5dd1+nsm
 zMRMYZRrtfe2/BZTdiKNt3DOQiNlFe75qc8AO+IR/VXihGJuYL0Tc3eNiQ+EgnXn6WS9Uu2Hk
 Koo3xi0hP6FBLMLlwpHJm+jA3t5gMna9UAoM7mD3X7W9Jrw/r9GKiXVydrEFwIl6int2+vHID
 BEKst3eEYlnKXEJZ8SDuuLPptaDMhHRK9Q08S0+lothZ3w02dMU4ENSIvb7bygw8SljwAqrXY
 KalMRwzuNn/twZLnTai4AhGQoDBn72pkVSGxNFlvEz+tjJ2i6bB9880tmSwCvUkntc2B1Y9ZG
 9biQ1FsHip2O71hvOvPcxyFT+tT5K+c7r73lHdd7u3oSDSmz6BZA3VSP8L3QmFLWJJeYQ3JYw
 ACrKuAEN9hErC4ttiNU9dnSh1dzmprizDzBvN640DYImGHxLw72bZVdavEsVTx0+7v8IGMS15
 9AnYgVFQ4zLX9WBAqjYNpy0DRg5YSpbHVtjr3lsir0wmDvmcc07SouTYY6EBJsHwF/W7bGuEU
 F2EA9PGjiHoCL+jxwz0cW639jfSthKHf19UcV5XGbZ0Lce630F3m97oewVRvX0ENarXPNPF/h
 9KDK6UW1kME3R+vCGH9pNRJ0dvQ4Kb+5rZU1q1EDpIoFD9L6CySjehMC4Quli3M4mSPSrU1B0
 EE34M0EDXdaJMcdQp7OBnWanZCaAtZZ5pw1OfPI6GA4QhM975xxa0lhlakOZIY0aAlDvZhaMX
 263piW+lOnS6AJ7/vfaeJNQzqjAv2MwekPbiICoWQBRPMy2Ufz/EhrxcmqSSWakZtaw6IrifR
 BjhjZeawRRy/J77wb7yxBftsf0UgO1PQMZt2l+3qit/zIvQwZqdWyessvMNUY3eaW9kz3G9Ze
 c2psD6MKBMZDYR0dSR1UU5vtO3pViYhpV3p3+72IYeiPJ0Jd5muSsDq3H3ZrHE9U4UmHmhAWT
 EZofinXlNHLpJY8MKXG8gAScyG4fciqdfNx5Wzv4DoqBTek0Vmvp695AxQ2b0o+Dqs4vutpE4
 ti5CzVQJ5gY+czp3e9fmiFaCwji1CL6YwAItbiRDDuBo9OJvmFF6iPaCi7IDEvvR5z2dnxSd2
 UNkIUHxn5p10rFRVYKZe5yjaLgWlYdb2q2cQuUat58ydYKu7bzq2e/KsoBTsgZwf+ZqIqXsvR
 LpLq4tWGHsRr3Bvo1W/G3Kn8GENjphhvwXe7637QrhOsEm17QyWaO1X1UCsqgsjun9eBcqtpR
 eSqu/mcDM1Z3Mrmfi
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--9WUZB2G+sPhVyB7j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In the binding:
> +properties:
> +  compatible:
> +    enum:
> +      - hycon,hycon-hy4613
> +      - hycon,hycon-hy4614
> +      - hycon,hycon-hy4621
> +      - hycon,hycon-hy4623
> +      - hycon,hycon-hy4633
> +      - hycon,hycon-hy4635

In the example:
> +      hycon-hy4633@1c {
> +        compatible =3D "hycon,hy4633";
> +        reg =3D <0x1c>;
> +        interrupt-parent =3D <&gpio2>;
> +        interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
> +        reset-gpios =3D <&gpio2 6 GPIO_ACTIVE_LOW>;
> +      };


Rob's devicetree lint bot detected the mismatch in compatible string
here.

I personally think 'hycon,hy4633' looks better than 'hycon,hycon-hy4633',
because it isn't so redundant.


Best regards,
Jonathan Neusch=C3=A4fer

--9WUZB2G+sPhVyB7j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmBsY/8ACgkQCDBEmo7z
X9sc1A/+JDPo7yRNDI99ucYWvxeTkPEwZTnSP9hUmPOOqOGoz5ZbXHb0IR8uUMK9
+e8kwQu+yBCOc3I7i+908w6gvOmVjrPJoVXSH3YnTBcFvajCn+onOMK7SRkG0THb
ISaw4jxduV+2RJ+EwFUKsdDj99zpLTl1d7SV+wB3JXTSjl+P/neEWWOeVPEFD2hH
ZYDgBASHRO7v8lLmJ6fdI3LMtBx3YZBcIRcpHHbP9HM+XoI29gQQSNA0/FuX30hI
kBbtYh/o0k/6Xi5jGjmzhpkLLJ5NwDdwhoGhjG9R5YkbNUp9uhuNCfhHXGm3wMvX
oBzRHZYarUaJa34NJDiluCmrorhV6mfY1214UDiABUOxcO6f4duMXidBtMiboI2p
WEW3O1iUufgopuiIkLcFQZNRhj3Rc6pdSE0pNPlgeDS9/FNs2hnRmbs6QAlxhr0V
qyQAlRI9Atj9Bd4Eop/dBXKTF7oJlQc4diDzbKHv3QgM1CLSBx35vUIjKV5Imnh6
k5wzntzPJu5h9jHmQ58CR4LlKWBq75LytQ0ea304XOA4QSwjeYY6UJXiAy5WmgAf
kEz/WK+2z7yw+TavxUiUgXuq5J4Pl6m2BIGegsPkE+u+SeqX7OlaXbpwcXOi3NOh
mXIgAK6tH/IkLC7hjP7LF5FszKdVGhFQh3iTv4tpjrJM4WGv17M=
=ciuX
-----END PGP SIGNATURE-----

--9WUZB2G+sPhVyB7j--
