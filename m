Return-Path: <linux-input+bounces-9839-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B80A5A2C369
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 14:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA6427A20BD
	for <lists+linux-input@lfdr.de>; Fri,  7 Feb 2025 13:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520C71E0DE5;
	Fri,  7 Feb 2025 13:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tKGCkBJw"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7429454
	for <linux-input@vger.kernel.org>; Fri,  7 Feb 2025 13:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738934472; cv=none; b=GwDZwB5Xj12jc10zaN9KbhJULHLPyQQLF51gItKud2dnHb5zvoLL6CRygiLxMCCAAIZbotqkMU0ZpJOkUjhNSXfaKmoEp8uCp/zuDAzH4sVjf6q6Dh6HBMfkgjav5bPL7l9azXx8qaOYml8GdXUs7lVY8dV3xR9xCpnmhMz7bhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738934472; c=relaxed/simple;
	bh=HwA3xfdUZwX9aiMwcaIn6qdcbIY+5UOHgxjCdv7v2mE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=EOyGeYPS0yTIKFsAo6w5+YEbsgfQApaZ6DN+/ieJWw+blIVaUV4S6qRLTYIHQDL8x3fVLcoP0uauPS9NXRTGTxEUCr72qc8gx2lIEgjNuIZpS4bNs+LD/SgRL0sdcYA27Uv2IgFRAdgwK7pmPrjrcuHKpSFsPWfSjXJ3/QivJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tKGCkBJw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193A9C4CED1;
	Fri,  7 Feb 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738934470;
	bh=HwA3xfdUZwX9aiMwcaIn6qdcbIY+5UOHgxjCdv7v2mE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tKGCkBJwj+pjkdVLYgeYDeLJ2H9NN9ntRjkGOrBD2niBF97XHKQWI//v2o/gXdX+t
	 u5+JMbdfYEKOdlXO26h+4z6GF+N1OwSa3eA8eZRzL3ESx6Rkp7SB5xA1HKkDeY2skx
	 Gk2r5mdsYhWdddGtCT0NjF4fyQFRwULInZpQL8FAFnmUqO54AylVdAwg6wAjKJBMFD
	 KesOKZK7N2EPd/G+LGawx/MjLbZ7kEjDPqnXSBYFVHWA2aSb64sKRElgmTKhe8tKYN
	 v+78KijFsS4Q+OvDbQkFV2trGdVqUZdkdI/phSBlWXRKLfI2YE+4G/fByOqo0eTnR7
	 K1KGkcSFbzXSA==
Date: Fri, 7 Feb 2025 14:21:07 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Tulio Fernandes <tuliomf09@gmail.com>
cc: bentiss@kernel.org, linux-input@vger.kernel.org, 
    ~lkcamp/patches@lists.sr.ht, Karol Przybylski <karprzy7@gmail.com>
Subject: Re: [PATCH] HID: hid-thrustmaster: fix stack-out-of-bounds read in
 usb_check_int_endpoints by null-terminating array
In-Reply-To: <20250205215034.51291-1-tuliomf09@gmail.com>
Message-ID: <no7277o4-3964-4s97-0r95-154rr6rn4r88@xreary.bet>
References: <20250205215034.51291-1-tuliomf09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 5 Feb 2025, Tulio Fernandes wrote:

> Syzbot[1] has detected a stack-out-of-bounds read of the ep_addr array fr=
om
> hid-thrustmaster driver. This array is passed to usb_check_int_endpoints
> function from usb.c core driver, which executes a for loop that iterates
> over the elements of the passed array. Not finding a null element at the =
end of
> the array, it tries to read the next, non-existent element, crashing the =
kernel.
>=20
> To fix this, a 0 element was added at the end of the array to break the f=
or
> loop.
>=20
> [1] https://syzkaller.appspot.com/bug?extid=3D9c9179ac46169c56c1ad
>=20
> Signed-off-by: T=C3=BAlio Fernandes <tuliomf09@gmail.com>



> ---
>  drivers/hid/hid-thrustmaster.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaste=
r.c
> index 6c3e758bbb09..3b81468a1df2 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -171,7 +171,7 @@ static void thrustmaster_interrupts(struct hid_device=
 *hdev)
>  =09b_ep =3D ep->desc.bEndpointAddress;
> =20
>  =09/* Are the expected endpoints present? */
> -=09u8 ep_addr[1] =3D {b_ep};
> +=09u8 ep_addr[2] =3D {b_ep, 0};
> =20
>  =09if (!usb_check_int_endpoints(usbif, ep_addr)) {
>  =09=09hid_err(hdev, "Unexpected non-int endpoint\n");

Ugh. Makes me wonder how 50420d7c79c was tested at all in the first place.=
=20
CCing Karol.

I've added

    Reported-by: syzbot+9c9179ac46169c56c1ad@syzkaller.appspotmail.com
    Fixes: 50420d7c79c3 ("HID: hid-thrustmaster: Fix warning in thrustmaste=
r_probe by adding endpoint check")

and applied.

--=20
Jiri Kosina
SUSE Labs


