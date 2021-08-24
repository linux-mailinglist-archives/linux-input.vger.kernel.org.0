Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4438C3F5D50
	for <lists+linux-input@lfdr.de>; Tue, 24 Aug 2021 13:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236477AbhHXLuy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 24 Aug 2021 07:50:54 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:43328 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbhHXLuw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 24 Aug 2021 07:50:52 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out1.suse.de (Postfix) with ESMTP id 43283220DF;
        Tue, 24 Aug 2021 11:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
        t=1629805807; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8Z5/syttl+KkV+aV0OMJFiXZO0vkS3XEk32Pj0Kzkiw=;
        b=YXuZ0FND55m5auKvX44dT/4kt0T4PU/M9pxcWkFvLWmftF8dV6OR5D683OVmsNxwmhvyhH
        fVOJ6rmh9tMZdbw8GeqnK62pqunDWxhL8la14LMKVLBEa8IWESs6eo56z8s2jC6nKTkx+W
        Q6E9bDLptj/sk47/HxT7e6nu5E38lNg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
        s=susede2_ed25519; t=1629805807;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8Z5/syttl+KkV+aV0OMJFiXZO0vkS3XEk32Pj0Kzkiw=;
        b=3FfxMv2XRepAj5vHWfJoj8Wa+gEg0YGkMm8FySOWWiyTUmCoYcAvyZhFSylQmGh68/+m6G
        gr1UMhvKEiZb9hDQ==
Received: from lion.mk-sys.cz (unknown [10.100.200.14])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by relay2.suse.de (Postfix) with ESMTPS id 05E07A3B87;
        Tue, 24 Aug 2021 11:50:07 +0000 (UTC)
Received: by lion.mk-sys.cz (Postfix, from userid 1000)
        id DCAD1603F6; Tue, 24 Aug 2021 13:50:06 +0200 (CEST)
Date:   Tue, 24 Aug 2021 13:50:06 +0200
From:   Michal Kubecek <mkubecek@suse.cz>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
Message-ID: <20210824115006.a5zzgxjy6nwakdmg@lion.mk-sys.cz>
References: <20210819152626.GD228422@rowland.harvard.edu>
 <00000000000009e24705c9ecf9b3@google.com>
 <20210819195300.GA8613@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l7x2dllvpqdjqmjw"
Content-Disposition: inline
In-Reply-To: <20210819195300.GA8613@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--l7x2dllvpqdjqmjw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2021 at 03:53:00PM -0400, Alan Stern wrote:
> The following simplified variant of Michal's patch should fix the=20
> problem.
>=20
> Alan Stern
>=20
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
=2Egit 794c7931a242
>=20
> Index: usb-devel/drivers/hid/usbhid/hid-core.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- usb-devel.orig/drivers/hid/usbhid/hid-core.c
> +++ usb-devel/drivers/hid/usbhid/hid-core.c
> @@ -377,27 +377,23 @@ static int hid_submit_ctrl(struct hid_de
>  	len =3D hid_report_len(report);
>  	if (dir =3D=3D USB_DIR_OUT) {
>  		usbhid->urbctrl->pipe =3D usb_sndctrlpipe(hid_to_usb_dev(hid), 0);
> -		usbhid->urbctrl->transfer_buffer_length =3D len;
>  		if (raw_report) {
>  			memcpy(usbhid->ctrlbuf, raw_report, len);
>  			kfree(raw_report);
>  			usbhid->ctrl[usbhid->ctrltail].raw_report =3D NULL;
>  		}
>  	} else {
> -		int maxpacket, padlen;
> +		int maxpacket;
> =20
>  		usbhid->urbctrl->pipe =3D usb_rcvctrlpipe(hid_to_usb_dev(hid), 0);
>  		maxpacket =3D usb_maxpacket(hid_to_usb_dev(hid),
>  					  usbhid->urbctrl->pipe, 0);
> -		if (maxpacket > 0) {
> -			padlen =3D DIV_ROUND_UP(len, maxpacket);
> -			padlen *=3D maxpacket;
> -			if (padlen > usbhid->bufsize)
> -				padlen =3D usbhid->bufsize;
> -		} else
> -			padlen =3D 0;
> -		usbhid->urbctrl->transfer_buffer_length =3D padlen;
> +		len +=3D (len =3D=3D 0);	/* Don't allow 0-length reports */
> +		len =3D round_up(len, maxpacket);
> +		if (len > usbhid->bufsize)
> +			len =3D usbhid->bufsize;
>  	}
> +	usbhid->urbctrl->transfer_buffer_length =3D len;
>  	usbhid->urbctrl->dev =3D hid_to_usb_dev(hid);
> =20
>  	usbhid->cr->bRequestType =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE | dir;

I have also tested this patch on top of 5.14-rc7 on my system and it
does address the original issue (no error/warning messages in kernel log
and communication with the UPS works correctly). So if you are going to
submit the patch formally, feel free to use

Tested-by: Michal Kubecek <mkubecek@suse.cz>

Michal

--l7x2dllvpqdjqmjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEWN3j3bieVmp26mKO538sG/LRdpUFAmEk3OgACgkQ538sG/LR
dpXE4wf/VuEuJqtzh6gtYNTMaSfBfjsorpwI062dsvUF62U5npWQB1sSkQE34isz
gdVuYh3jFrMQGzAN0O4OWq3+pKc5jNdlE+4zZ+BnSitRsCzlI+qUSqlcLUVItapW
cFsaU0aVG8+hRWwqKabhYO2BpNsw9jdPsEi4/hvE/dF9Qvv/uJ9hr610+19wJhPx
u8VkKCE3gkFoxDEc7YQprmPIbTKRISSSq7OUKi37XAUG3+iLKvxqa8RpaY3bd3+f
I3mgCvFLd0FzCtGpZWxgkC+NsjB3q2CMWkRuFeiPnBtuRaK2iCjI0p9UXrDngUQp
AZ0R9IT7ZMQqJYc1t39SvEG/BVCzdg==
=/GWp
-----END PGP SIGNATURE-----

--l7x2dllvpqdjqmjw--
