Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C065E3EDDA8
	for <lists+linux-input@lfdr.de>; Mon, 16 Aug 2021 21:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229755AbhHPTNX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Aug 2021 15:13:23 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:60996 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhHPTNX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Aug 2021 15:13:23 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 2036B1FFCD;
        Mon, 16 Aug 2021 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1629141170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bLS7JbPsgoJbranNPm2czgSZVcMxJZOHABRNcu46Ask=;
        b=iiIk1yfTICvxIUWMfkLRDkxANadOaEzCF1k3U5AH2DFOxWS3+RyjEeXmSTv4YSYs/3Ru30
        OnA5s8gEmj3COvGl/SukJ7/uSX6dt+7Pn9fO3XXt3hakIxA8xfKIWN75aM5bu46oWtgTlz
        RG0rUYdFKopPTtHeEfJauWBmZGhH05Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1629141170;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bLS7JbPsgoJbranNPm2czgSZVcMxJZOHABRNcu46Ask=;
        b=E6mboCSuqLSTpqnqzQfD2rw0/viszt8gLpcJKzxPBzsNW2hFu8O6poGJO8nHpU+U7lh+Rs
        ZPiQ8iK4uLFgcoCw==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id D39EBA3B88;
        Mon, 16 Aug 2021 19:12:49 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
        id B9ED36082B; Mon, 16 Aug 2021 21:12:49 +0200 (CEST)
Date:   Mon, 16 Aug 2021 21:12:49 +0200
From:   Michal Kubecek <mkubecek@suse.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue
 full" since v5.14-rc1
Message-ID: <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz>
 <YRpnfJ719DwPu2B0@kroah.com>
 <20210816141347.zougsudwe5tqgkpt@lion.mk-sys.cz>
 <20210816143856.GA121345@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3ww3jcnbtghg6slm"
Content-Disposition: inline
In-Reply-To: <20210816143856.GA121345@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--3ww3jcnbtghg6slm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2021 at 10:38:56AM -0400, Alan Stern wrote:
> On Mon, Aug 16, 2021 at 04:13:47PM +0200, Michal Kubecek wrote:
> > Looking at the code, the primary problem seems to be that the "else"
> > branch in hid_submit_ctrl() recalculates transfer_buffer_length to
> > a rounded up value but assigns the original length to wLength.
>=20
> Looks like you found the bug.  Fixing it might be as simple as setting=20
> len =3D padlen in that "else" branch.  You could then combine the=20
> transfer_buffer_length assignment with the one in the "if" branch and=20
> hoist them out after the entire "if" statement.

With the patch below, there are no errors and the UPS communication
works correctly and so do other HID devices. But I would prefere someone
familiar with HID code to confirm that this is what we want and what
would be the right way to handle usb_submit_urb() errors.

Michal

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index 06130dc431a0..ef240ef63a66 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -377,27 +377,26 @@ static int hid_submit_ctrl(struct hid_device *hid)
 	len =3D hid_report_len(report);
 	if (dir =3D=3D USB_DIR_OUT) {
 		usbhid->urbctrl->pipe =3D usb_sndctrlpipe(hid_to_usb_dev(hid), 0);
-		usbhid->urbctrl->transfer_buffer_length =3D len;
 		if (raw_report) {
 			memcpy(usbhid->ctrlbuf, raw_report, len);
 			kfree(raw_report);
 			usbhid->ctrl[usbhid->ctrltail].raw_report =3D NULL;
 		}
 	} else {
-		int maxpacket, padlen;
+		int maxpacket;
=20
 		usbhid->urbctrl->pipe =3D usb_rcvctrlpipe(hid_to_usb_dev(hid), 0);
 		maxpacket =3D usb_maxpacket(hid_to_usb_dev(hid),
 					  usbhid->urbctrl->pipe, 0);
 		if (maxpacket > 0) {
-			padlen =3D DIV_ROUND_UP(len, maxpacket);
-			padlen *=3D maxpacket;
-			if (padlen > usbhid->bufsize)
-				padlen =3D usbhid->bufsize;
+			len =3D DIV_ROUND_UP(len, maxpacket);
+			len *=3D maxpacket;
+			if (len > usbhid->bufsize)
+				len =3D usbhid->bufsize;
 		} else
-			padlen =3D 0;
-		usbhid->urbctrl->transfer_buffer_length =3D padlen;
+			len =3D 0;
 	}
+	usbhid->urbctrl->transfer_buffer_length =3D len;
 	usbhid->urbctrl->dev =3D hid_to_usb_dev(hid);
=20
 	usbhid->cr->bRequestType =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE | dir;

--3ww3jcnbtghg6slm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmEauKkACgkQ538sG/LR
dpU94AgAvbyi6DxI+0UkhSO6Ln39x8aE67gCKdMLjoAuiA0mWfVQCfFnLA/M22rd
+MnTe/1jHEUphGXHTQOSiGJk/rPx6zYZTP3IRpXf2j2NBTBWtAXt2EJVJdWNUirO
6knH8tZSnxXvMsKWBlGGMRptV4FD0XiNhSYmfzV1+QXWjZ312Y+V9icKW8ITVIUR
U3WJ1xU+TN60Y6FduWK+gZOC6HpggSNkJQb+gh5okLl4Lp6bRUO1fDT2zAqvaA6f
x2BtYVqWyE3DWr7rkE68aYYO2l9Ytc+5DMOCTeV35Uo+6q3VHC1z5uepDwVqV8ST
g84Aa8aWYYBDV9pBZo1PcrxtZQA8rQ==
=UjF7
-----END PGP SIGNATURE-----

--3ww3jcnbtghg6slm--
