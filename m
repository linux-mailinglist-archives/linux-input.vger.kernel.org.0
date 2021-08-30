Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3483FB93B
	for <lists+linux-input@lfdr.de>; Mon, 30 Aug 2021 17:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237607AbhH3PtK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Aug 2021 11:49:10 -0400
Received: from vulcan.natalenko.name ([104.207.131.136]:54714 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237542AbhH3PtJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Aug 2021 11:49:09 -0400
Received: from spock.localnet (unknown [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 14F33BC3384;
        Mon, 30 Aug 2021 17:48:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1630338491;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=W6OwYTHqyMN6IxAME1ujn3yNsxUf4Dt4pjg5xjlW1no=;
        b=BbsNq347OIy9el2IFdXZ6v3xjHcOwTyAi+oP+ssH7qBfIzK461d+u3WvmlWP4hy5Nn0w9K
        Vq3w+d/QFDEEoru2z6IVnxxhbGsqSZgNrxtrcLwxzf4YWn93SIdLJCwCPO5/dv3AcyQ/2K
        lgRASMCEX+wHkpXkWlqCDb4NEVPf8Yk=
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Michal Kubecek <mkubecek@suse.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: Re: [REGRESSION][BISECTED] flood of "hid-generic ... control queue full" since v5.14-rc1
Date:   Mon, 30 Aug 2021 17:48:09 +0200
Message-ID: <1954573.0n35tlyJVE@natalenko.name>
In-Reply-To: <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
References: <20210816130059.3yxtdvu2r7wo4uu3@lion.mk-sys.cz> <20210816143856.GA121345@rowland.harvard.edu> <20210816191249.7g2mk5thwpio7cfc@lion.mk-sys.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello.

On pond=C4=9Bl=C3=AD 16. srpna 2021 21:12:49 CEST Michal Kubecek wrote:
> On Mon, Aug 16, 2021 at 10:38:56AM -0400, Alan Stern wrote:
> > On Mon, Aug 16, 2021 at 04:13:47PM +0200, Michal Kubecek wrote:
> > > Looking at the code, the primary problem seems to be that the "else"
> > > branch in hid_submit_ctrl() recalculates transfer_buffer_length to
> > > a rounded up value but assigns the original length to wLength.
> >=20
> > Looks like you found the bug.  Fixing it might be as simple as setting
> > len =3D padlen in that "else" branch.  You could then combine the
> > transfer_buffer_length assignment with the one in the "if" branch and
> > hoist them out after the entire "if" statement.
>=20
> With the patch below, there are no errors and the UPS communication
> works correctly and so do other HID devices. But I would prefere someone
> familiar with HID code to confirm that this is what we want and what
> would be the right way to handle usb_submit_urb() errors.
>=20
> Michal
>=20
> diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
> index 06130dc431a0..ef240ef63a66 100644
> --- a/drivers/hid/usbhid/hid-core.c
> +++ b/drivers/hid/usbhid/hid-core.c
> @@ -377,27 +377,26 @@ static int hid_submit_ctrl(struct hid_device *hid)
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
>  		if (maxpacket > 0) {
> -			padlen =3D DIV_ROUND_UP(len, maxpacket);
> -			padlen *=3D maxpacket;
> -			if (padlen > usbhid->bufsize)
> -				padlen =3D usbhid->bufsize;
> +			len =3D DIV_ROUND_UP(len, maxpacket);
> +			len *=3D maxpacket;
> +			if (len > usbhid->bufsize)
> +				len =3D usbhid->bufsize;
>  		} else
> -			padlen =3D 0;
> -		usbhid->urbctrl->transfer_buffer_length =3D padlen;
> +			len =3D 0;
>  	}
> +	usbhid->urbctrl->transfer_buffer_length =3D len;
>  	usbhid->urbctrl->dev =3D hid_to_usb_dev(hid);
>=20
>  	usbhid->cr->bRequestType =3D USB_TYPE_CLASS | USB_RECIP_INTERFACE | dir;

Any luck with moving this forward please? I've got a similar issue with APC=
=20
UPS and v5.14 kernel, and this patch also solves the connectivity issue for=
=20
me.

Thanks.

=2D-=20
Oleksandr Natalenko (post-factum)


