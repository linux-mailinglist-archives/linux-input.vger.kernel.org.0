Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D7D361DD5
	for <lists+linux-input@lfdr.de>; Fri, 16 Apr 2021 12:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239216AbhDPKOh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Apr 2021 06:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235124AbhDPKOg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Apr 2021 06:14:36 -0400
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [IPv6:2001:67c:2050::465:201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB19C061574
        for <linux-input@vger.kernel.org>; Fri, 16 Apr 2021 03:14:11 -0700 (PDT)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4FMBrd1Cz6zQjxF
        for <linux-input@vger.kernel.org>; Fri, 16 Apr 2021 12:14:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
        by spamfilter01.heinlein-hosting.de (spamfilter01.heinlein-hosting.de [80.241.56.115]) (amavisd-new, port 10030)
        with ESMTP id ViEZpyB_-xoy for <linux-input@vger.kernel.org>;
        Fri, 16 Apr 2021 12:14:06 +0200 (CEST)
From:   =?ISO-8859-1?Q?Andr=E9?= Najda <andre@najda.de>
To:     linux-input@vger.kernel.org
Subject: psmouse serio2 psmouse.synaptics_intertouch=1
Date:   Fri, 16 Apr 2021 12:14:04 +0200
Message-ID: <4438747.vXUDI8C0e8@xc1507v2>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2014958.9o76ZdvQCi"; micalg="pgp-sha256"; protocol="application/pgp-signature"
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -3.32 / 15.00 / 15.00
X-Rspamd-Queue-Id: 004E216FF
X-Rspamd-UID: 919bf4
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--nextPart2014958.9o76ZdvQCi
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: =?ISO-8859-1?Q?Andr=E9?= Najda <andre@najda.de>
To: linux-input@vger.kernel.org
Subject: psmouse serio2 psmouse.synaptics_intertouch=1
Date: Fri, 16 Apr 2021 12:14:04 +0200
Message-ID: <4438747.vXUDI8C0e8@xc1507v2>

[    4.315902] psmouse serio2: synaptics: Your touchpad (PNP: SYN1219 PNP0f=
13)=20
says it can support a different bus. If i2c-hid and hid-rmi are not used, y=
ou=20
might want to try setting psmouse.synaptics_intertouch to 1 and report this=
 to=20
linux-input@vger.kernel.org.

I'd like to report this as being told. If you need any further information=
=20
please ask me. I'm happy to answer any questions.

psmouse.synaptics_intertouch=3D1 works fine.

=2D-=20
Mit freundlichem Gru=DF, Andr=E9 Najda

--nextPart2014958.9o76ZdvQCi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEy4gtanl2vns0f3w0DB9QvgihGZYFAmB5Y2wACgkQDB9Qvgih
GZaqNQf9EukGAsBe1Q8GxUTNYBbmS0ugmo+Rau03nfrtr2gQG9mfQubVw0xVEB3v
Y1WUJPCi3KcPvSBTMLTdWO750toSD9KIIbp64a5Aw4Ko/oEoes62MVO1JZU8jjpJ
C/HirKgDDZdOaObWia/ptYXzRRZZaCmnULqItTBFYJD9LyZJOX1JrMSkx1hrloLJ
NliZojjMIxdS5ZjgnWrg2Gm/PnQXZ/Po0IBCkH/Iz6GA4H0YoAW9EMpUrs+kwxr6
Shz7fL1H6kUXHdHGDNIXZXrtEA9gyrXg06iKpydZG548w3sRYK88u3VziFPYRUGc
1B9shk34mcCm5LJ+bfNrCD+Lrpj/OA==
=iYjc
-----END PGP SIGNATURE-----

--nextPart2014958.9o76ZdvQCi--



