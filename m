Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31C8E3FDF06
	for <lists+linux-input@lfdr.de>; Wed,  1 Sep 2021 17:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343851AbhIAPwr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 1 Sep 2021 11:52:47 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:44048 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244935AbhIAPwr (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 1 Sep 2021 11:52:47 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 231F62255C;
        Wed,  1 Sep 2021 15:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1630511509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ow6/rWz+rfX4gHhV3kQzt1ewiKyuiNJvRdwHyzz/Cvs=;
        b=1LN9ZpaRki1JWzgNAofUEzqPUUyIqfp4tazYFhkzpkoGlEN92/XOVKEzV+xdGfyi2B0wik
        cWItf6sWDgW/0xEsWKRINbAZjbgFuumOK6UtTwqPBZ63GDQTLfS1BlowsCHHveoROol9SX
        V+X2ajB1fztPXWV61bgFCbI+OsBmRgg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1630511509;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ow6/rWz+rfX4gHhV3kQzt1ewiKyuiNJvRdwHyzz/Cvs=;
        b=LPOoiGyfTgGnylJ1dlSM80ROzUFVXFTx7QdB4A3ChI6dn6unOsFWN1hEDUgAyCJmcEbswd
        BOOm3NMP1NCLZ5CA==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id F1477A3BA3;
        Wed,  1 Sep 2021 15:51:48 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
        id D0686603E0; Wed,  1 Sep 2021 17:51:45 +0200 (CEST)
Date:   Wed, 1 Sep 2021 17:51:45 +0200
From:   Michal Kubecek <mkubecek@suse.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
Message-ID: <20210901155145.qflw5s4zqiud7gke@lion.mk-sys.cz>
References: <20210819195300.GA8613@rowland.harvard.edu>
 <000000000000c322ab05c9f2e880@google.com>
 <20210820140620.GA35867@rowland.harvard.edu>
 <nycvar.YFH.7.76.2108241351490.15313@cbobk.fhfr.pm>
 <CAO-hwJ+i4MqOj0umUW9kFgYSZLt3QMb6hDZHQwb8AKH9pKxSTg@mail.gmail.com>
 <20210901153811.GA403560@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gp77egl6iokcy2xv"
Content-Disposition: inline
In-Reply-To: <20210901153811.GA403560@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--gp77egl6iokcy2xv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 01, 2021 at 11:38:11AM -0400, Alan Stern wrote:
> On Tue, Aug 31, 2021 at 11:51:31AM +0200, Benjamin Tissoires wrote:
> > Tested-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >=20
> > Alan, would you mind resending the patch with the various tags with a
> > commit description? (unless I missed it...)
>=20
> I plan to break this up into three patches, each doing a single thing.  T=
he=20
> first patch in the series will be the one written by Michal.  The second=
=20
> will fix the problem found by syzbot, and the third will be a general=20
> cleanup.
>=20
> Michal, is it okay to add your Signed-off-by: tag to the first patch?

Yes, sure.

Michal

--gp77egl6iokcy2xv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmEvoYwACgkQ538sG/LR
dpWh5AgAuhHDWsvQPRZVb7cY81aSjYIx1Khz3vIrDxpsvBsDmL2cHS2xRBmBek4r
ajEvsMKOSuiu2QJbMGpawJJkaBrFyeYai3sGFlXSJcoBBYw8w2WiD6EL65NDELu/
6aC81GCRhnFPlhK0QgIjBcjmCBTxKWlHpl8e2bL8RLhpCSGh/QGXBkdWTVvNoErZ
hvnhXhtojdjV2gm5tyjyGq9n8gOFFJLk72l7dx5vgM52VM93np2qcNsL3PTK7pMd
1Ii6sRdM+0RNZyrp8py3udQgZp576FJ9vrc/cAR0drRje83menl5/STgYiBXlaqt
Xj9BYHN8Bo6q3t7SvDbvVqMgI34TIg==
=yV4p
-----END PGP SIGNATURE-----

--gp77egl6iokcy2xv--
