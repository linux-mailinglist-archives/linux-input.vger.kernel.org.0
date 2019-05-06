Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B346E149F5
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2019 14:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFMjx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 May 2019 08:39:53 -0400
Received: from sauhun.de ([88.99.104.3]:34358 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfEFMjx (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 6 May 2019 08:39:53 -0400
Received: from localhost (p54B3305A.dip0.t-ipconnect.de [84.179.48.90])
        by pokefinder.org (Postfix) with ESMTPSA id 1104F2C0963;
        Mon,  6 May 2019 14:39:51 +0200 (CEST)
Date:   Mon, 6 May 2019 14:39:50 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     syzbot <syzbot+6da9575ba2db4da91831@syzkaller.appspotmail.com>,
        airlied@linux.ie, dmitry.torokhov@gmail.com,
        dri-devel@lists.freedesktop.org, hpa@zytor.com,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com, patrik.r.jakobsson@gmail.com,
        rydberg@bitmath.org, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, x86@kernel.org
Subject: Re: KASAN: use-after-free Read in add_uevent_var
Message-ID: <20190506123950.GA18177@kunai>
References: <000000000000559435058813dc8d@google.com>
 <20190506081525.GD17751@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
In-Reply-To: <20190506081525.GD17751@phenom.ffwll.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The bug was bisected to:
> >=20
> > commit 0a1c7959acd9674a0e4e59f911f3e5fbf25fd693
> > Author: Wolfram Sang <wsa@the-dreams.de>
> > Date:   Wed May 17 15:22:18 2017 +0000
> >=20
> >     gpu: drm: tc35876x: move header file out of I2C realm
>=20
> Bisect seems to have gone off the rails. No idea where or why.

Yes, luckily it was obvious here, saving us from chasing ghosts.


--ZPt4rx8FFjLCG7dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzQKxIACgkQFA3kzBSg
KbYGlA/+IRmumqdM8Lj+ELaaAGYdWD5XIpHr2MBZBYifi/kUl3ZIlPtdAUcuE7qH
GAZDCVKFU1bcvI/00L584DRCnWEIkXWGlh5S2yPzPPND3qAJjIy75L0JkdVLxG1k
bjy6/ALj/GHSP6ry9FqdOCtyL6NMkbimjKjd5q/hoSLTcGCp5z4SWs3K4J3FiuQy
JCsZbsm6pl7ZVhnF214HWaTss2fmfFfPSPIN0bkdbUup5NguCKGDVHLQBiALz8uI
NucdPf/ElZrpylRz079UNaQ3HnE3Pu9aVET02qefVwtPVO4sJ+BIZLuw0vNvBAv9
ari8b2DByEXXA8CBk0mjm/xaSGbqiVR90L4FsC0UZdGB5MXWkWofXCW1JPNYvc8a
4wVjX63Y6EuccAezuLbS7m2plfPftdOR3CvP4HX15A5ax4yjbBEEKqpoDJDwqifk
ANnvUTa/X4ts+Ld5yFlC3rfACUPj23VY8zR6HswWis5LKjnGUhNdDlzmILFLYmuM
oPHN6BzMIRiMbKFrKbUHzuNLTMR607d4I/dKpnqr6oUjYFFo1pdKHgbrjgxF8y1p
cH+mDe/8N0thkS27Chss8yvzVdtmFoZHSDaeY7QfOG41hqMINNVOLFOkYT9NyoTM
Tdo8ZXHM3+m7SvR0T0AqZ/HTxf4yYziNEuwXTtf0Odih/aGcti4=
=tKNJ
-----END PGP SIGNATURE-----

--ZPt4rx8FFjLCG7dd--
