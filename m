Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D853FBCDA
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 21:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233774AbhH3TXr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 15:23:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233573AbhH3TXn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 15:23:43 -0400
X-Greylist: delayed 12871 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 30 Aug 2021 12:22:45 PDT
Received: from vulcan.natalenko.name (vulcan.natalenko.name [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A266C061760;
        Mon, 30 Aug 2021 12:22:45 -0700 (PDT)
Received: from spock.localnet (unknown [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id CB281BC390B;
        Mon, 30 Aug 2021 21:22:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1630351360;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aQUSrjXYDmFy5wo91A3BlmOanLGBJFlJUThDcUa6cIY=;
        b=DTPGffspKIFV3EMr8m1fq7zzOJhTF3oWlsRiQNzIze8r/VrkCms0ecOdgzWidkAvCJLj0j
        89cZ2wbLzltPNGEb761vENBjvgANtfuWAx+efROfY76c/VlW4Q24Z1DP7orHLU5d381GpG
        hSpW7gJxd3bS5n4Z5FGPCdh2xrRkap4=
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     syzbot <syzbot+9b57a46bf1801ce2a2ca@syzkaller.appspotmail.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, mkubecek@suse.cz,
        syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] WARNING in hid_submit_ctrl/usb_submit_urb
Date:   Mon, 30 Aug 2021 21:22:39 +0200
Message-ID: <2760703.iRigd37PT7@natalenko.name>
In-Reply-To: <20210819195300.GA8613@rowland.harvard.edu>
References: <20210819152626.GD228422@rowland.harvard.edu> <00000000000009e24705c9ecf9b3@google.com> <20210819195300.GA8613@rowland.harvard.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello.

On =C4=8Dtvrtek 19. srpna 2021 21:53:00 CEST Alan Stern wrote:
> On Thu, Aug 19, 2021 at 10:35:11AM -0700, syzbot wrote:
> > Hello,
> >=20
> > syzbot has tested the proposed patch but the reproducer is still
> > triggering an issue: WARNING in hid_submit_ctrl/usb_submit_urb
> >=20
> > cm6533_jd 0003:0D8C:0022.0001: submit_ctrl: maxpacket 64 len 0 padlen 0
> > ------------[ cut here ]------------
> > usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType a1
>=20
> Ah.   The padding code doesn't add anything if the length is
> already a multiple of the maxpacket value, and of course 0 is such
> a multiple.
>=20
> The following simplified variant of Michal's patch should fix the
> problem.
>=20
> Alan Stern
>=20
> #syz test:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> 794c7931a242
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
>  		usbhid->urbctrl->pipe =3D usb_sndctrlpipe(hid_to_usb_dev(hid),=20
0);
> -		usbhid->urbctrl->transfer_buffer_length =3D len;
>  		if (raw_report) {
>  			memcpy(usbhid->ctrlbuf, raw_report, len);
>  			kfree(raw_report);
>  			usbhid->ctrl[usbhid->ctrltail].raw_report =3D NULL;
>  		}
>  	} else {
> -		int maxpacket, padlen;
> +		int maxpacket;
>=20
>  		usbhid->urbctrl->pipe =3D usb_rcvctrlpipe(hid_to_usb_dev(hid),=20
0);
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
>=20
>  	usbhid->cr->bRequestType =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE | dir;

I've tried both Michal's patch as well as this one, and both work for me,=20
hence feel free to add this:

Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>

once the fix is submitted.

Thanks!

=2D-=20
Oleksandr Natalenko (post-factum)


