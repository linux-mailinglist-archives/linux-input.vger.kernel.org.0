Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63DC52EF45D
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 16:02:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbhAHPCh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 10:02:37 -0500
Received: from mail.archlinux.org ([95.216.189.61]:56192 "EHLO
        mail.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726735AbhAHPCh (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 10:02:37 -0500
Received: from [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c] (unknown [IPv6:2001:8a0:f268:e600:5751:e3e4:7880:ec9c])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by mail.archlinux.org (Postfix) with ESMTPSA id 8852A35A5FE;
        Fri,  8 Jan 2021 15:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-ed25519; t=1610118115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0Qyo0DqFJU4pFkilRKpbJLnHwDiCf/oOCCHPwULy3qs=;
        b=Hlml9yZvw18k/GRrhv4CYBiQvxLFnZ30FuW/767FtL28fhJm80v79oqoUxIcPq5x20eL9U
        l03SkpuTF1sLb7Bw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
        s=dkim-rsa; t=1610118115;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=0Qyo0DqFJU4pFkilRKpbJLnHwDiCf/oOCCHPwULy3qs=;
        b=Fm3prCvOQrvvCACEIJQMI3VSM4hldVal21uUT+ZLYYxtEMEzo8D4BHhHsZGNZiMtYiKpDx
        bEYokVg0b9AUKyhF50gav1t+2a2B1J2PveBxvnXl5Rt0nlLN1/RqLTMyAD9GbBhqsZpwRU
        m8TzWtUG7dCgZ6P/94VmjU6KyQ6dfkMCoRjHjiCsSRejWgvAC53JdcS5TpIoAxhSxU0Ul/
        Wouw0c8rlC1YBk6u/1anQJJsajoxS1AczLEbyWx7e2pjqoVxciD+MlmukmH1g5K+WGS/m8
        QycOkuS6plsxLG/3pxONF0Afx9q+v3pEGzwXTVpLiwGTStydNhhRkRRVJ1sip5q4735LMt
        UFyFv41Plt+kB6nbdyZRWplN562odKt8qpPZSs/zYVZvkyihLM0Q6Kjz9WV4IYx+d48HFK
        gPYlaGvg2y7k2EB0wWcaFb7uKbIXS81a2s86WLyw7w6gsXhgWbY3FUlXO62STIOWshWE0n
        M9Qoa/Nk8fNVu+KaKNZfGj2VYcHPlUUmVEAfJzheup3teoj3uCAzexkOYl0sNi9wgCyXQQ
        /yPeuTXhD8Tj1+6qvuSPZ++HircRqmD95fXjoGeYudjLBhnu0WhYbyPVypvTHfIiXEobjR
        5LT1JXIVyfybG+PT4lTf//S/4mtCxXLxPtc1dNsgGderKW901lGoc=
Message-ID: <d65b0829d31ed6eb15f69b8771718d38a56a2502.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for Unified Battery
 (1004) feature
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <nycvar.YFH.7.76.2101081554190.13752@cbobk.fhfr.pm>
References: <20210104182937.1472673-1-lains@archlinux.org>
          <nycvar.YFH.7.76.2101081438530.13752@cbobk.fhfr.pm>
         <e832278f9021c0f71afc5f90261bd17aea45a336.camel@archlinux.org>
         <nycvar.YFH.7.76.2101081554190.13752@cbobk.fhfr.pm>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-nUFrcBmRjwz1bi32mfxn"
Date:   Fri, 08 Jan 2021 15:01:53 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.38.2 
Authentication-Results: mail.archlinux.org;
        auth=pass smtp.auth=ffy00 smtp.mailfrom=lains@archlinux.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-nUFrcBmRjwz1bi32mfxn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-08 at 15:55 +0100, Jiri Kosina wrote:
> On Fri, 8 Jan 2021, Filipe La=C3=ADns wrote:
> > The problem here is that hidpp20_query_battery_info_1004() does not set=
=20
> > battery voltage, it is also the battery level. The best alternative Ica=
n
> > think
> > of is replacing the 1000/1004 with slightly mangled HID++ feature names=
,
> > like we
> > do on the other feature function. The drawback here is that I think tha=
t
> > could
> > get confusing quickly.
> >=20
> > hidpp20_batterylevel_query_battery_info()
> > hidpp20_unifiedbattery_query_battery_info()
> >=20
> > Note that this does not provide *that* much more information than the
> > feature
> > number, though it is probably the best option. What do you think?
>=20
> Alright, what a mess :) Would it perhaps help if there is at least a shor=
t=20
> comment preceding the function definition, noting what the constants=20
> actually are?

Yeah :head_scratch:
There is a header comment at the start of each feature section, which I thi=
nk
does a good job pointing this out. IMO the problem with the naming is more =
for
people who see its usage in other parts of the code, but I guess that is C =
for
you right? Names don't scale well with code quantity :P

/* ------------------------------------------------------------------------=
-- */
/* 0x1000: Battery level status                                            =
   */
/* ------------------------------------------------------------------------=
-- */

/* ------------------------------------------------------------------------=
-- */
/* 0x1004: Unified battery                                                 =
   */
/* ------------------------------------------------------------------------=
-- */

> > > Could you please use standard kernel commenting style here?
> >=20
> > Oops, sorry. Will do :)
>=20
> Thanks,
>=20

Cheers,
Filipe La=C3=ADns

--=-nUFrcBmRjwz1bi32mfxn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl/4c+AACgkQ+JPGdIFq
qV3xFg/+OI7Wrp9cLE9aXS7NbuQybltIktsp3S2oO9YD/GMYyVC9MXRPNtYfkqHQ
7JTUL8k/inqjsBBLMJhLqyehueWGmxYH0la1QgYpiO0Zlx/HocPG81pCG17F3QmQ
JrkNwH3w+0V2n8wWrVauwts+QTLDa4eIDJkuGtSn22XIEJlda0A95JLTtaKDYtRe
A2ElqrpfDRJoadnMQdeBzZ8M8kAeEifkamTCWshPpIthICceWvj9p/3SKbuwuAHy
mIH0DrzTdeUVlX4Z7+kOKXP3LEyTkhCnNcZ7PdFtUkWTXLaev6CfXKpNbW5Zt0iM
JMoI0+02XJVAgPe0tsIOsCl3JQ+jIb8fxvJ1Cum1PS6EWrFpgAQbxu4DQio/aiBb
5H0YBcp/UAVr5yrzVJQUUIv3cEFH/6PcE5YvOF7qNZs+i2xuwqFcAsXtasfQnTsT
txa4uBC9+osIrBYKhJNYO2KfJt/ifqR7XnpYYI5f0EktUjMgPQZnMbnTpxMKuFp9
+kaQ/5pQPWu6raDtUm+GFeNJoqQ78XVAxdz1Fb4oVw9aXYiUbYi6jKvAlVFO2qxk
EPbmyivjt5QswopB23LgFcIODusJGvubnSAOB8TbEGaanPdY+6RGcJKd2Ewank1B
9SuWGyePvG8JkWMnC3XioXpkpkfsc2MO6vhULxQh6CtFoz6qZ/c=
=i9Y+
-----END PGP SIGNATURE-----

--=-nUFrcBmRjwz1bi32mfxn--

