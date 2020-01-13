Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892691394D1
	for <lists+linux-input@lfdr.de>; Mon, 13 Jan 2020 16:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgAMPbx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jan 2020 10:31:53 -0500
Received: from orion.archlinux.org ([88.198.91.70]:48790 "EHLO
        orion.archlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgAMPbx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jan 2020 10:31:53 -0500
Received: from orion.archlinux.org (localhost [127.0.0.1])
        by orion.archlinux.org (Postfix) with ESMTP id D530818170BB4C;
        Mon, 13 Jan 2020 15:31:50 +0000 (UTC)
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
        Mon, 13 Jan 2020 15:31:50 +0000 (UTC)
Message-ID: <7d49a8444ea1740444d1e9133104530731bfb30a.camel@archlinux.org>
Subject: Re: [PATCH] HID: logitech-hidpp: add support for the Powerplay
 mat/receiver
From:   Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20200112205021.3004703-1-lains@archlinux.org>
References: <20200112205021.3004703-1-lains@archlinux.org>
Organization: Archlinux
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-SqfsoRYx0FWj0PIgDlOr"
Date:   Mon, 13 Jan 2020 15:31:49 +0000
MIME-Version: 1.0
User-Agent: Evolution 3.34.3 
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--=-SqfsoRYx0FWj0PIgDlOr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-01-12 at 20:50 +0000, Filipe La=C3=ADns wrote:
> I also marked all lightspeed devices as HID++ compatible. As the
> internal powerplay device does not have REPORT_TYPE_KEYBOARD or
> REPORT_TYPE_KEYBOARD it was not being marked as HID++ compatible in
> logi_hidpp_dev_conn_notif_equad.

Actually I had another look at the code and I don't understand why we
are manually setting |=3D HIDPP in
logi_hidpp_dev_conn_notif_equad/logi_hidpp_dev_conn_notif_27mhz. We
should set it in logi_dj_hidpp_event as it is triggered by receiving a
HID++ packet.

What do you think Benjamin?

--
Filipe La=C3=ADns

--=-SqfsoRYx0FWj0PIgDlOr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0jW0leqs33gyftiw+JPGdIFqqV0FAl4cjVoACgkQ+JPGdIFq
qV19XBAAh7RH19Z4xTovja5qdXkfK4GPahfaPvuXcFgD/B3HPUbugTHUVqqUkkDY
yJloDjloPk4Ug4jEO2p3fG+iZlWrM/sSoz8YDhpabMHuabV0ON2EDM0cxUY4o6iT
Hx/kQdxGm9OuU4ZwPgQUTUcWQqCzFY3QPFE7vBnlpF0vVgjYhlzFvlv+gqdvzVlf
1TlWyT+HYmz70w7Sk0Fo4ao2aDKbQbd+hMpwPXNVzsXE8sD2Kp3LjzycDwWp27vN
4TGod0hZQN8VDBS2VUd4X8jsdYERkXuVrQph8Hb7Xn5k1GuGhszkJXOz1ZY27aNX
PevlfCzs7aJfIKj5kBysdVJef0r/CwEASI+xzRS8+zLKoxvXKSIOWkke6n1FBxQm
py2x3j3PPiYL+3HGHDWMQP2MpYk9hTGb2GLo+VsiWZuqTffcH+xMCCXCgU2E05Jr
Y6w9HY9e5Alib5scgpJ52Lkt1GTx5xxnl7FP3LMjr9qf1lQNlFrUTimcgZ6vAJhL
OE3ND+iZQnz32/fAPQ1Jt8mSJEMzDyGS5gMwm0bXYfxRLE3A3c/FgtXo5IOG0dsG
19GDejciXw0f3nSL9O1yurcyYNKYp46l1JzdGUiX6yilI9uJZOpqcVDtzCmtPbEp
XCfqHGvPbE86eSkmbtnyQrmlCsyzc39KxKoFD1CzPdd9RJ5aZhM=
=vhH9
-----END PGP SIGNATURE-----

--=-SqfsoRYx0FWj0PIgDlOr--
