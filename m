Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920AF30984C
	for <lists+linux-input@lfdr.de>; Sat, 30 Jan 2021 21:42:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230036AbhA3Ull (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 30 Jan 2021 15:41:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229990AbhA3Uli (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 30 Jan 2021 15:41:38 -0500
Received: from mail.archlinux.org (mail.archlinux.org [IPv6:2a01:4f9:c010:3052::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76293C061573;
        Sat, 30 Jan 2021 12:40:58 -0800 (PST)
Received: from [192.168.1.78] (unknown [188.251.63.183])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 5589B3AF3D4;
        Sat, 30 Jan 2021 20:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1612039256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9Qw7daadslk55i2mN8fjtpIkKg98qlHCf0dW9/tThnE=;
        b=sMBC8x9AmfLA9G8MojINA3LB73WkrKjNwIQwxsC2kLVLsMzlRH5rgCcO/powxRor1Xtb7Q
        uKWkrbn+xy2MFpBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1612039256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=9Qw7daadslk55i2mN8fjtpIkKg98qlHCf0dW9/tThnE=;
        b=jN0h52Q21JmsMJBhTcPqY7iZHmjM3m+Fo1e0KKT9QN0HC/aXja52AwIHZyCmg6NcwX4Idh
        R4okiioBZ07Qn4LGN7NXVQs1VyAEOWrBPWbIg8QPcE0OStVRq8y2YYxcDUu+6iDNEINY+K
        N5lYq1Tq6UBoAUTGBZwsgMuJNskLWkHXi4IISnlmzxqgVs6qhMx0S2VdkRm2gkSFj49Zi4
        PacDmIDYj6W1gi7Ach8UHGQxtHkg60NEguay+MOa8xNdJSmipx4ffMTFbJdtuE2ib20Kd3
        Tbzfc68F8xOaURQhjcWgZ3vFWdWiKRObTXctSAMmMk+CUVwxLVBX85cP0qxtOWb3fozT1F
        RCZkSOXpPhRxL+U4jk2rFURAQKyZPhtMtZrUgTivQDayd+rgMAcFBMuycbmpojauaBVbBu
        g9Qi0PeEUuKAjqFTqqyJ6pMygT3ggtssKBzlWCPiRJblp1qgfTKN4Ji34jW3kwUKghzD8u
        4jR4XWQscT101UMST//K/zjx9rIuCY86dxq8OthdEauZbInDJEYQBuVXV0ynuPiL1jcAfd
        B3E/3YsFUC6gxvTKLXqcuhcy2q1xz9w31USxjZQwkbncBenkA2l7f2LQHccEvydh23jucI
        S6M1HvHhDvLUgK81ayiDU9EAXws50jigJdonMekgGjyzHhV8s0FwI=
Message-ID: <25a6c40cd26158b74c9a58dc53a2f0905a2ea1d8.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-dj: add support for keyboard events in
 eQUAD step 4 Gaming
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        linux-kernel@vger.kernel.org
In-Reply-To: <0a3aa6fb-3f22-d6f5-1748-42430f6e7ccc@redhat.com>
References: <20210130191027.1225465-1-lains@archlinux.org>
         <265604c19e2e875ca17e4cf713000492b9ffd8d8.camel@riseup.net>
         <0a3aa6fb-3f22-d6f5-1748-42430f6e7ccc@redhat.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-VziGShXEcAn3/QByDcN+"
Date:   Sat, 30 Jan 2021 20:40:52 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.3 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-VziGShXEcAn3/QByDcN+
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2021-01-30 at 21:27 +0100, Hans de Goede wrote:
> Hi,
>=20
> On 1/30/21 8:14 PM, Filipe La=C3=ADns wrote:
> > Hans,
> >=20
> > You added support for non unifying receivers in
> > 74808f9115cee2bb53e7161432959f3e87b631e4, could you please test and mak=
e
> > sure
> > this cause any breakage with your devices?
> >=20
> > AFAIK, they could only break if they have a 0x01 report which is differ=
ent
> > from
> > kbd_descriptor.
>=20
> I don't have any receivers hitting the "case 7" which you are modifying,
> so I don't expect to see any effects of this change on my hw.
>=20
> Regards,
>=20
> Hans
>=20

Alright, then we should not have any other receivers that use this protocol=
.

Cheers,
Filipe La=C3=ADns

--=-VziGShXEcAn3/QByDcN+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAmAVxE0ACgkQ+JPGdIFq
qV0vMw/+MGym95j68jfbztaS4iV/uZYL78DwpwvPywRXfT8XuH/hub5ZHWWQnfDt
8m3aq4Bz2aT9A+832vL9okuLHqVJ75kzw+cCaKw01VlhPifngRpiieseC8VqTiFI
BVgpCZ3iqL4/DkTaBnzzggLH6vZ0FO6X+Nok/VZ2FBK3ykaYZ9YeKNs7RYMY/Or5
rORoOudfXC8OKd5sYvTmHH8/VaQQwum0TY/YMdYfKAN04A6s3hKW3QJmpibbR8sm
WeAROHEtwuatYKh9Eu5K/nhpxG8hK0I0prEU/sR997kbRJH5nxALN6SjgYI0ojyI
RgAciTngRFpVX7LEiKyAHOUA4eklJV0iiVPlYsDnH2kISN8uQRDyU0fTIvmM7iGz
RiSVlR5AUK+Xi7wPP5fjOgyYZ6APcf4j6kgR5JC2F8lXM40qhhdCgpqD3YWVg6bE
f9qJn+sBu6VmfV5Ih7QRYKMg6Gs5MyJZPaws3zikpLqZxP1v8Lfi8hUQoCCnvQgM
m6GNe6KCqs8Et57O3kpPWAUA0MW+WppSOjTSvyhyn2BxV718/qhYUEA1ocYO0tpI
F5nkRPTwhqoDm3N17x8k3HSLV/WYFop6w0mOWZQpjTE3eM5c6hn1OviG2ZdqSBqe
pKEG8HYIbWNJqqBIFlJ/s830kB2wRRjrd5YW5tJwRT3zG8lkwLs=
=x1uj
-----END PGP SIGNATURE-----

--=-VziGShXEcAn3/QByDcN+--

