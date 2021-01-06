Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E129B2EC3B2
	for <lists+linux-input@lfdr.de>; Wed,  6 Jan 2021 20:09:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbhAFTIH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 6 Jan 2021 14:08:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbhAFTIG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 6 Jan 2021 14:08:06 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78676C06134C;
        Wed,  6 Jan 2021 11:07:26 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c133so3259226wme.4;
        Wed, 06 Jan 2021 11:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:organization:date:mime-version
         :user-agent;
        bh=XBal+Xukp7KCTv+7UxmSLerYgxNS5P3PSaBNU0JG2MA=;
        b=RQx5e48vrZKOsL8cVa8y1CEB8cjo0OyuIFNVQGmLpyPZIIAgsq3Vr67vzIKI9SXHZt
         vCvN7ioWT4DFsX+BzMdt8REpZVj5Uk/Edc/3ioxSr+SjHPEI6Dh8/f/z1XvSUHwT2NOu
         v5o75kxRl0IeSsreJ+blHIYxfbIaW6VPAz9NvwSH7ImsSzqTH7j8D+O2SxzCkCwwSm26
         kYDkBZAbOPZPcTurDK4T213RFoqpBPFJToWnJhcekz7/qb4Nc+6Of3jmDvGi+bkhPQTb
         GPNIsmz0LTwhgHfGtpGZNmVy/01n6nZQ4FlZULUGb+2w+X3I/UsJ2jaDeZOCfjkx0iQc
         E2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:organization:date
         :mime-version:user-agent;
        bh=XBal+Xukp7KCTv+7UxmSLerYgxNS5P3PSaBNU0JG2MA=;
        b=LOUE68qH0/d0Qn3GlLhtFJksPU8m5UpFRHRoElGO2uzURML5AW8/h7bdg8RQPwguVZ
         uwX5wYHFA77F45zGRA/WpkzzHvrQ+okR2GG7dnuvdf2OIQ9fJqbwdvIsz5c656P9VDhk
         vK9VzPHlmCGEezi9MUyogleayiko7cHS5bnEOlFPZv0OkcQ0UkjBb9IIFzdN161MZdkr
         WcI08vS8RocVrutZ+nKPy/IMejb2SbsYi2PinGex/TT8FQnL4DZnlvlqdLUBHBlBHGiA
         PnVwXtDN4XttViTJ+wHyBrVkaNxm3QIspM6gqx7GFa4V1iiXTxbq7piRRwxwi7rCuupF
         hcrw==
X-Gm-Message-State: AOAM532RpBLUVLpYU7LjUF0ClC9ITyYBlj7vDnIxtUyx5izauJ6CiHQ3
        w1xtUonUXy5ln5Mky7yZ6YA=
X-Google-Smtp-Source: ABdhPJzFXbYRuak26hsGc39RZTtXP9bzN6fjB8dZZo1HoFNObGEou9HCo3NRd6UHpYv8KM+jIdtQbw==
X-Received: by 2002:a1c:a583:: with SMTP id o125mr4860966wme.91.1609960045236;
        Wed, 06 Jan 2021 11:07:25 -0800 (PST)
Received: from ?IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c? ([2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        by smtp.gmail.com with ESMTPSA id c6sm4459009wrh.7.2021.01.06.11.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 11:07:24 -0800 (PST)
Message-ID: <4990836470c5fb01babcf416ca6ccf9e5e21d152.camel@gmail.com>
Subject: (hid-logitech) Support for non-DJ receivers
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <filipe.lains@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Sb2VxpNhcE4yprkW9xz9"
Date:   Wed, 06 Jan 2021 19:07:22 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-Sb2VxpNhcE4yprkW9xz9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey,

Some of the new Logitech receivers do not have the DJ interface, this creat=
es an
issue userspace applications like libratbag, as seen in [1], because we can=
't
identify the device based on the hidraw PID.

There are two solutions for this:

1) Implement device discovery via the internal Logitech ID in libratbag and=
 all
other userspace apps.

2) Make hid-logitech-dj export a duplicated hidraw node with internal Logit=
ech
ID as PID, just like it does for the DJ interface.

In case you aren't aware of what the DJ interface is, it is essentially a
multiplexing protocol that receivers support. 6 devices could be connected =
to
the same receiver, hid-logitech-dj enables the DJ mode and the receiver wil=
l
essentially perpend the device ID to each HID report. hid-logitech-dj then
creates a HID device for each connected device and routes the HID reports t=
o the
correspondent HID device.

Option 2) would be the easier on userspace, as it keeps the same interface =
we
use for DJ receivers for other Logitech HID++ receivers and avoids all user=
space
apps to have to reimplement the same discovery logic.

Any thoughts?

[1] https://github.com/libratbag/libratbag/pull/1071

Cheers,
Filipe La=C3=ADns

--=-Sb2VxpNhcE4yprkW9xz9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/2CmMACgkQ+JPGdIFq
qV0R/xAAsXGO3xETXDPavns+/fb/pxG50F/rnbxmAEmJpnaW/Qje/KXzpClOMCfT
LjnG52B3jEHnCfYeydM21k6togGyScVi9SXJqYLw9S+MeUUyLQ4aiseDBpmfN6qs
kr3ibrbUc+YQ4i/oCQ3k7KtPSJVN99WdTa733UDHK22F2foJAEPl9FtUiFE4LrK2
stP0Qt9nijAgz9BS+F5qd4it+sov5HvcKt3TEX3B19XlLoB+v5vskkT+jDQH/z42
e/CdOQ1cCdboS7tEg5hcDtRvCJJdxmL9EWLgBN2Svg2UKSic5q6fnUSL7oHDDFaK
AuMyZ77Ht186KudQC2OOP+ZZoe1DLN2Sl5LTK5oyevppAnCOuylU2rWejUTKMlCH
zwd2sy2WU51oAESKHuUp+5JD6GW87vijeXt3Ks5dp7duhHK5NFktl1zpsJ0RCRiE
Uriy6sPuS+F8RGWdBRFoiJps37QL+0czzlZDpZj4kUvL2cKcuXtCUA7fkkwWm/Tw
K6ZTUinZ+tsPk8t9aOBZpUIPAj/CYhlNcFeQvd3Mku9s41ZwrGyg2K/ezlPnygb1
YiQzNrPLZV3PwGLAsQmaIJ62oMJkWMW9ASUZi6GrSZcQc9eWQH5Ao2hX9hJqKwmR
q8idYajivDmJuwNZtorg6N6T2qHEmTikd1FdwmohfbsK24CfnAA=
=Lk20
-----END PGP SIGNATURE-----

--=-Sb2VxpNhcE4yprkW9xz9--

