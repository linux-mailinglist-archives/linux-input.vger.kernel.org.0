Return-Path: <linux-input+bounces-5140-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E393B60D
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 19:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B2261F2231D
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 17:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28FE115EFB9;
	Wed, 24 Jul 2024 17:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="Wf2ZI1L8"
X-Original-To: linux-input@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7A32E639;
	Wed, 24 Jul 2024 17:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721842617; cv=none; b=fuN6lzQ0xpscYhOTIamVEfjKflgbJg2nmCdBmQKezyNlSr0zqK9e2awQpqNMta9w34jZz8e6m39pAi/inm1IPzKph4exTDALjHnSy3k5goKpIsSaHkzZR6TpEzRNm/153JZiTJr+KUHfGbFZ/eZUgMIzH8o40rm50/xGVffNUUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721842617; c=relaxed/simple;
	bh=/cBPn80bLOKCv+/H/yCLrV6vjovXjhH4bLZtNKr8D3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFLNNS7S53pvY9QLCfSHTDmpqptI6Yb25Bs899dD3/10EtqmpoSnYBqMeqy0TapFKh1UecG6J6V0nHhk4JG5Q+UQNrQaZQvd/otpEs1HxJGthpPAiXVMzityZlidc9Mq8ZT5RoY99iL7eHuvAuS/70fjS4VnSYCPae4698POKg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=Wf2ZI1L8; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 7B2661C009D; Wed, 24 Jul 2024 19:36:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1721842610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=an3NqH+1POnuE0beDev8aj+SC67nRWyTt2QwUTuBvJg=;
	b=Wf2ZI1L80VoiKf0pRGMckpaygLO6rn19EUfxCYXkPO1XwvCDoTea5PyGdak/2bkd7zdqsF
	nSlnfqqQCl/67cUoLvnxx790Kr8iaBslYEh72AWlZ4+URtcNSc7L/U72Q64mO7RcxMjJit
	g6VosIXwfCnhRHl+4jxyzkWlQ6Czq/Y=
Date: Wed, 24 Jul 2024 19:36:50 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>, Lee Jones <lee@kernel.org>,
	jikos@kernel.org, linux-kernel@vger.kernel.org,
	Jelle van der Waa <jelle@vdwaa.nl>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	linux-input@vger.kernel.org, ojeda@kernel.org,
	linux-leds@vger.kernel.org, Gregor Riepl <onitake@gmail.com>
Subject: Re: In kernel virtual HID devices (was Future handling of complex
 RGB devices on Linux v3)
Message-ID: <ZqE7sk0ZW0q8ueul@duo.ucw.cz>
References: <247b5dcd-fda8-45a7-9896-eabc46568281@tuxedocomputers.com>
 <ZdZ2kMASawJ9wdZj@duo.ucw.cz>
 <b6d79727-ae94-44b1-aa88-069416435c14@redhat.com>
 <a21f6c49-2c05-4496-965c-a7524ed38634@gmail.com>
 <825129ea-d389-4c6c-8a23-39f05572e4b4@redhat.com>
 <adbfdf6c-fb59-4fae-a472-17b04dd8a3f6@tuxedocomputers.com>
 <1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com>
 <aec1d22d-9e59-4dfc-b108-5ba339b0e76a@redhat.com>
 <siebkhaauocqkuox73q2e5p2mbsyc7j4gvpzfvt4c3gvncdpap@oxh5pp4gxpuo>
 <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PO2vVUoo5RSgWJzT"
Content-Disposition: inline
In-Reply-To: <870cca8a-1a1b-4d17-874e-a26c30aca2bf@tuxedocomputers.com>


--PO2vVUoo5RSgWJzT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > IMO working with the HID LampArray is the way forward. So I would
> > suggest to convert any non-HID RGB "LED display" that we are talking
> > about as a HID LampArray device through `hid_allocate_device()` in the
> > kernel. Basically what you are suggesting Hans. It's just that you don't
> > need a formal transport layer, just a child device that happens to be
> > HID.
> >=20
> > The next question IMO is: do we want the kernel to handle such
> > machinery? Wouldn't it be simpler to just export the HID device and let
> > userspace talk to it through hidraw, like what OpenRGB does?
>=20
> That's already part of my plan: The kernels main goal is to give devices a
> LampArray interface that don't have one already (e.g. because they are no
> HID devices to begin with).
>=20
> The actual handling of LampArray will happen in userspace.
>=20
> Exception is that maybe it could be useful to implement a small subset of
> LampArray in a generic leds-subsystem driver for backwards compatibility =
to
> userspace applications that only implement that (e.g. UPower). It would
> treat the whole keyboard as a single led.

Are you sure LampArray is good-enough interface? OpenRGB exposes
keycode-to-LED interface, how will that work with LampArray?

Best regards,
								Pavel
--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--PO2vVUoo5RSgWJzT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZqE7sgAKCRAw5/Bqldv6
8ga8AJ9BT/RPUldd2PgRbjEZ62iTLLo7HQCgpJKSBBtTvzqxW31MSQlB/aghnwY=
=B9/0
-----END PGP SIGNATURE-----

--PO2vVUoo5RSgWJzT--

