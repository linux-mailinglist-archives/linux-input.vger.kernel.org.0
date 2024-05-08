Return-Path: <linux-input+bounces-3588-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A81898BF4A1
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 04:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48623B22345
	for <lists+linux-input@lfdr.de>; Wed,  8 May 2024 02:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6901210A2C;
	Wed,  8 May 2024 02:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EuiAqF3B"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4137BEAD0;
	Wed,  8 May 2024 02:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715135868; cv=none; b=Yr6/dSBg4s50qkJtcudJQjgUsTYAZV/aAyAZpK0yh/6qsJTiJv+XL1Qi5BC4BanqacLR4zN7j9gfzbpeBj+Ks+fcXNSQUu1k/mQST13gYgW5H/xtvfKisVJ775WPkT11R8Ckdcn11/C4nVvHpA6brbKogeX4MajnGxUNBamGqLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715135868; c=relaxed/simple;
	bh=ABIHuAol1RkqvO67SLAalaYd+ekF8teyJLNahtOn3xQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg/Wt3HQ/khCaNDmteNMArG4bi3fMmHokzcO8aS76Vvl1bcjy3D3nZARv1n9O6eU3bs1XdigiGdrj5n31936tSYbLVErlnO0hnTDwS6KORZpf6HU+TYhMH7pyKinhOxR49/L7gvMiVNk4CvUPUNUcvNvmjRnVww1QGZ+px+3f6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EuiAqF3B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B8BAC2BBFC;
	Wed,  8 May 2024 02:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715135867;
	bh=ABIHuAol1RkqvO67SLAalaYd+ekF8teyJLNahtOn3xQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EuiAqF3BdoPrwlz++LYhqIM49/GJvGRGrQQIVXUnAmQxZie7fmk8uEUjCDyMTTazl
	 5CDNXr0lrGrh8jqEKIfSSN7B7JXDdq+IOq0Or2lxPjIrkH5ZauuRWzXKjoQIrl67UW
	 1hZ7Qp36DSrxugHVWBWFkUwhM1rCHOg5FSeKaLNRufQI/AnsRJMTHAt+UP72eIn/A7
	 6OlACuIRdCRjN22ovlMKdx+BC4u6IJq6aMf+2X21mcGBXYnhr570zIKyL5OMnMPbNn
	 BbfxEHqdbCeknorwM3D2XEp/Yoz3lcDkSjjpYaSyPQyp7x/VMAblhlsxJYf5lMgtcW
	 V2LEXsiAeDebw==
Date: Wed, 8 May 2024 11:37:45 +0900
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Jeff LaBundy <jeff@labundy.com>, Hans de Goede <hdegoede@redhat.com>,
	Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
	Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <ZjrledLjn8RsGiwC@finisterre.sirena.org.uk>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
 <Zjo8eTQQS1LvzFgZ@finisterre.sirena.org.uk>
 <ZjpFVGw6PgjRcZY3@nixie71>
 <ZjqYp1oxPPWcF3jW@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7rZlMyEu+j77dzs2"
Content-Disposition: inline
In-Reply-To: <ZjqYp1oxPPWcF3jW@google.com>
X-Cookie: Accuracy, n.:


--7rZlMyEu+j77dzs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 07, 2024 at 02:09:59PM -0700, Dmitry Torokhov wrote:
> On Tue, May 07, 2024 at 10:14:28AM -0500, Jeff LaBundy wrote:

> > For example, many devices must be placed in a bootloader mode during
> > the FW update, and may clamp or toggle an interrupt pin during this
> > mode switch. If user space initiates this sequence while the driver is
> > unaware of this process, it may attempt to read status registers from
> > an I2C address that is temporarily offline.

> And yet we have i2c-dev and hidraw that are often successfully used to
> flash the firmware, do diagnostics, etc. without encumbering the kernel.

Yeah, those seem like a reasonable enough model for safer devices - they
do the exclusion thing so you don't have a real driver running at the
same time.  For things like PMICs there's some concerns of course.

The other model I've seen used BTW is to expose a MTD device, if the
device actually looks like a MTD device (perhaps even is just a flash
that's fairly directly exposed) that minimises the kernel code quite
well.

--7rZlMyEu+j77dzs2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY65XgACgkQJNaLcl1U
h9BwWAf/UP+aNwRClILavfD13cThg00n7zwWD9uhBnaRChYB9X1iTj6+IoVXwHRW
gO4qxaTP/uzc+Q4vahodQjkHIe3l3t4pegJ/+BKursC9ACilGMPLuf1KBnJIQRfZ
i/4n2DqCOVXj7AYTl52TJWwzv85l9b1sbvkhFHRPFTQCNcUWZhL6H7q2XuQJWsTo
zDHOqqE9vcAEkzPJJEbr1wWfCcJRZ9bE+cHJgNJfXU2izOily6RfiJ9uFcWtaehD
oHYYdBe6YbnwyPkorEqIRhRTO5D2snGctfbUnfxCmGbIuR8Ob+rIbIxd3siJDu5y
vb5eJWjLE+iXONTQ3zx6HWctftpcuA==
=+Mn4
-----END PGP SIGNATURE-----

--7rZlMyEu+j77dzs2--

