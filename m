Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39808139E9F
	for <lists+linux-input@lfdr.de>; Tue, 14 Jan 2020 01:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgANAzU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 19:55:20 -0500
Received: from orion.archlinux.org ([88.198.91.70]:37184 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728778AbgANAzU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 19:55:20 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id 11E52181900802;
        Tue, 14 Jan 2020 00:55:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.3 (2019-12-06) on orion.archlinux.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.3
X-Spam-BL-Results: 
Received: from genesis (unknown [IPv6:2001:8a0:f254:2300:dad6:8c60:8394:88da])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Tue, 14 Jan 2020 00:55:16 +0000 (UTC)
Message-ID: <1e4143394f773df60a2ba329c940b339e4563bee.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for the Powerplay
 mat/receiver
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
In-Reply-To: <CAO-hwJ+56qUTr8HQOLyx9tgbJMuTTPbb6K40cwWnO=PzMcO+tQ@mail.gmail.com>
References: <20200112205021.3004703-1-lains@archlinux.org>
         <7d49a8444ea1740444d1e9133104530731bfb30a.camel@archlinux.org>
         <CAO-hwJ+56qUTr8HQOLyx9tgbJMuTTPbb6K40cwWnO=PzMcO+tQ@mail.gmail.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Coe2qyRW8zt8HxLcXjje"
Date:   Tue, 14 Jan 2020 00:55:14 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-Coe2qyRW8zt8HxLcXjje
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-01-14 at 20:48 +1000, Benjamin Tissoires wrote:
> On Tue, Jan 14, 2020 at 1:31 AM Filipe La=C3=ADns <lains@archlinux.org>
> wrote:
> > On Sun, 2020-01-12 at 20:50 +0000, Filipe La=C3=ADns wrote:
> > > I also marked all lightspeed devices as HID++ compatible. As the
> > > internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> > > REPORT_TYPE_KEYBOARD it was not being marked as HID++ compatible
> > > in
> > > logi_hidpp_dev_conn_notif_equad.
> >=20
> > Actually I had another look at the code and I don't understand why
> > we
> > are manually setting |=3D HIDPP in
> > logi_hidpp_dev_conn_notif_equad/logi_hidpp_dev_conn_notif_27mhz. We
> > should set it in logi_dj_hidpp_event as it is triggered by
> > receiving a
> > HID++ packet.
>=20
> long story short: nope :)
>=20
> The whole purpose of setting the workitem->reports_supported is to be
> able to create the matching report descriptor in the new virtual
> device. So having this set in a callback will add an operation for
> nothing every time we get an event, and will also not ensure a proper
> separation of concerns.
>=20
> Cheers,
> Benjamin
>=20
> > What do you think Benjamin?
> >=20
> > --
> > Filipe La=C3=ADns

Okay, then is maybe better if I add HIDPP to reports_supported based on
the device ID (7). This is the only product to my knowledge that
exports a device with ID 7. It's a better solution than setting HIDPP
on all lightspeed devices.

I will send a new patch if you agree with this approach.

--=20
Filipe La=C3=ADns

--=-Coe2qyRW8zt8HxLcXjje
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl4dEW0ACgkQ+JPGdIFq
qV274w//cxr08FDCJRNfbEH4C6UferfSC8Ad6N4njm6kIJIku9RjgcVYtTI/3GJP
5twvmW13yT1DkacXesO6XEiWt8i7KftAkvqeoZDnCXJ5RavxXoXPZHCMz0O7lwdE
XwHkQ1GARxciOs01DyRdiOAxjZjLhtzTt36W/CLvVM96n8t5+NH4lWYyy5p7EE92
d5DnQF/B+g1Z2vSXpbH+2nw+HNXKvB+3Pm/Be8r7oeGJ7Fis9dRFJFl1EImcYaAY
281d5paUPRMLf7EOqtoN7IGS1gKEu2L3YJiBabk+E4FgnbOvBCcDnAgL1pjYj+Ni
+We03Ta3QlTSMlspwpx3ygM54HeLE1sFI5a9XCeJcf659SNNEzGH3PM3nMEVw0Mg
Dost4byun61M0xYi/RUXhqbVWk6QOiaUbnHIPZlwL6cPk40rvYh56yuO12SXVLAO
jKG7hqZCiu9wQOjPE4V1GhHXNhDut1RHU1mriDmSYX9L5qWuh+t5D7DEOTOM36Bt
MOk7sx+K1wgTG+c/pULpDxwFDwnHCI9TC6IKj59bTS+nyX6vd8Hs0YYtuq1SDNDJ
9mnmn9sjo+kPv7AhCZIIc0a8U1CEPkMuZPrSBCpGX0+BGD4vFog6SnEh34c4cLYH
05y+QQdGI333deNdjxhdP9GI8sBjJbKHORT7DSPhdsAno7BO6Vo=
=Ld/i
-----END PGP SIGNATURE-----

--=-Coe2qyRW8zt8HxLcXjje--
