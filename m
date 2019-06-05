Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80B1B36787
	for <lists+linux-input@lfdr.de>; Thu,  6 Jun 2019 00:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfFEWdm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 Jun 2019 18:33:42 -0400
Received: from orion.archlinux.org ([88.198.91.70]:59074 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726502AbfFEWdm (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 5 Jun 2019 18:33:42 -0400
X-Greylist: delayed 317 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 18:33:40 EDT
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id EB9D51321F5F3B;
        Wed,  5 Jun 2019 22:28:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on orion
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=ALL_TRUSTED=-1,BAYES_00=-1,
        DMARC_FAIL_NONE=0.25,T_DMARC_POLICY_NONE=0.01,T_DMARC_TESTS_FAIL=0.01
        autolearn=no autolearn_force=no version=3.4.2
X-Spam-BL-Results: 
Received: from genesis (unknown [IPv6:2001:8a0:f24a:5600:a9ad:74ef:9537:685])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: ffy00)
        by orion.archlinux.org (Postfix) with ESMTPSA;
        Wed,  5 Jun 2019 22:28:21 +0000 (UTC)
Message-ID: <0d998fe0ff4473be2a9341c1f5ddf55957d18ad8.camel@archlinux.org>
Subject: Re: [PATCH v2 0/4] Read battery voltage from G403 and G900 mice
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Pedro Vanzella <pedro@pedrovanzella.com>,
        linux-input@vger.kernel.org
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
In-Reply-To: <20190605194533.18717-1-pedro@pedrovanzella.com>
References: <20190605194533.18717-1-pedro@pedrovanzella.com>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-b2wSQK5XfwPnbBz+78jy"
Date:   Wed, 05 Jun 2019 23:24:18 +0100
MIME-Version: 1.0
User-Agent: Evolution 3.32.2 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-b2wSQK5XfwPnbBz+78jy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-06-05 at 15:45 -0400, Pedro Vanzella wrote:
> The gaming line of Logitech devices doesn't use the old hidpp20
> feature
> for battery level reporting. Instead, they report the current voltage
> of the battery, in millivolts.
>=20
> This patch set handles this case by adding a quirk to the devices we
> know
> to have this new feature, in both wired and wireless mode.
>=20
> This version of the patch set is better split, as well as adding the
> quirk to make sure we don't needlessly probe every device connected.
>=20
> Pedro Vanzella (4):
>   HID: hid-logitech-hidpp: add quirk to handle battery voltage
>   HID: hid-logitech-hidpp: add function to query battery voltage
>   HID: hid-logitech-hidpp: report battery voltage to the power supply
>   HID: hid-logitech-hidpp: subscribe to battery voltage events
>=20
>  drivers/hid/hid-logitech-hidpp.c | 150
> ++++++++++++++++++++++++++++++-
>  1 file changed, 147 insertions(+), 3 deletions(-)
>=20

Hello,

Why using quirks? 0x1001 is a feature, it should be discoverable in
IFeatureSet (0x0001). I don't understand the need to hardcode the
supported devices, HID++ exists specifically to prevent that.

Wasn't this what you started in your previous patch? Why move away from
it?

Thank you,
Filipe La=C3=ADns
3DCE 51D6 0930 EBA4 7858 BA41 46F6 33CB B0EB 4BF2

--=-b2wSQK5XfwPnbBz+78jy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAlz4QQkACgkQ+JPGdIFq
qV2ohA//ZGUDKIds/DIp+6rdJeuW7H8UQ2th2gXAir3NclnfH+CaDpjpmxJs5Noi
VHXI0ML8sakz8e0uOMbl6cY+0oxZyn6F754fb0FAY301ZhZz/L09SzzuPZI9eyNC
Wpb+UWuf5K1trq5pmfJbE9Pw49s6K4i0G/rtut1R3lDF+QTxz1f0wohipKApk/Om
IRMbWBli2hEI+FbXFtH8vdKrLYT884gbp/EooVBY8T3mJDIhxzQdFG7OpIAFYMJk
QB5Aprw9nraCLHDnYOIxbmLvFU+yMKJFJxi43mHLR7FocVD3+uroxlIiRVYANHVs
+Q43YdZfLgO6hXkAYVsCWtSXS1XgeZDaXiCFA+CZIqq+XkTBtXE3X2rE6Dg3nCgI
TJdnQFZvCWLTtNaBHQSAE2iS38o24W+x7Go5Uj9UMIfDIoxoZigoCUQbk+VbaVxe
WuprtmdZVhPPo2JzlhwWjMWOgzNeeMgceQnc8DHQyQGDAIPlJ4iX+23MFFAcRG1I
48rX3ssO20e4H9+MDgxCFV6f27/yCAf/qSOXP5cgWFRt9LyeKzvr0aAEC4urx1Iq
Kqrf6WLcypVJNpEBeP70J7ZEsJUkT75b4tYWzyRGnwA/1LhtMIunAFK7IexASkZk
qzN9etW89nWgZb/XKLcJQ9Y3l8/4cCONbj6l7tVyIpzzKi94i04=
=M0oI
-----END PGP SIGNATURE-----

--=-b2wSQK5XfwPnbBz+78jy--
