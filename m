Return-Path: <linux-input+bounces-3553-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E40F8BE620
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 16:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61B5C1C21FD4
	for <lists+linux-input@lfdr.de>; Tue,  7 May 2024 14:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3DAA15EFD8;
	Tue,  7 May 2024 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAEXXUXv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFC7154BFC;
	Tue,  7 May 2024 14:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715092604; cv=none; b=pTtw/kqkmR8Pkhgw5Manz8AEtuzULtQI2fQz/wVZOr31lEw3UULhooBzBRHO6NaOqNsVmsmCl7K82xZxARJ/9WdLE8jcsVTpV255S3wnxAEF46OJbQ66TAtDjkH/O0+ld8V/qRACeUN/YCML0aH7rrn/BHnHMgQ3QN0ZlKryRCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715092604; c=relaxed/simple;
	bh=tMTmRH5/GWPjl9T+PClN91yYJR6r89On46+/BeKoh6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmLoIwAjK2Jg7MIh2FudhPIS9+ewTTdVfCRNmr5+Msk8V5bmtiSimUb3HLNCMI+nwCEczaX4HerPLh6DniOxQVN/jR5xUEGt5ziaMX6dTeqzcMMKlafZWekmMVfm1xm9b0XaFJBT7bQ2sS8UWsFYksMTMO0y/inA1jHrfgk1nHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAEXXUXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DBEEC2BBFC;
	Tue,  7 May 2024 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715092604;
	bh=tMTmRH5/GWPjl9T+PClN91yYJR6r89On46+/BeKoh6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TAEXXUXvP/RwXMufOxMcpdr0ktv6yxwsW7WAv9/h370YTCjXFYtnJUhRjnfUWyslu
	 +LaWO4UEtWUnCDAbfm2GMxC0GdtC2ZUAYfABjbvYuAimQn5h7LvLT9N51BLY9YpM6t
	 L0H17jUkUxj/47TYyxguGxRlqBPtGopQwDyCRaVSRYZLdD4vFAbNTueiqKVsE+9W0V
	 cpQ5THDkwwmOTm4S2uhYLKLktFIpUxroiI6hixZ+/S6Y2Wk/WUReX2aBn3p3JiWQpG
	 /J6wpeUm/bk67u57GqPOBJoE8YZL4RHhMvI3t2pMpndWL4ZXVIr57X0JcrD4CH5BLl
	 w4KYGQzrl5w2A==
Date: Tue, 7 May 2024 23:36:41 +0900
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Charles Wang <charles.goodix@gmail.com>, hadess@hadess.net,
	Richard Hughes <hughsient@gmail.com>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH] Input: goodix-berlin - Add sysfs interface for reading
 and writing touch IC registers
Message-ID: <Zjo8eTQQS1LvzFgZ@finisterre.sirena.org.uk>
References: <20240506114752.47204-1-charles.goodix@gmail.com>
 <6362e889-7df2-4c61-8ad5-bfe199e451ec@redhat.com>
 <ZjmOUp725QTHrfcT@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lPiblj3fTQ4wDvEh"
Content-Disposition: inline
In-Reply-To: <ZjmOUp725QTHrfcT@google.com>
X-Cookie: Accuracy, n.:


--lPiblj3fTQ4wDvEh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 06, 2024 at 07:13:38PM -0700, Dmitry Torokhov wrote:
> On Mon, May 06, 2024 at 02:03:13PM +0200, Hans de Goede wrote:

> > If raw register access is seen as a good solution, then I think this
> > should use regmap + some generic helpers (to be written) to export
> > regmap r/w access to userspace.

> I think the less code we have in kernel the better, especially if in
> cases where firmware flashing is not essential for device to work (i.e.
> it the controller has a flash memory). That said IIRC Mark felt very
> strongly about allowing regmap writes from userspace... but maybe he
> softened the stance or we could have this functionality opt-in?

I think unmediated raw register access is a terrible idea, you can't
safely write a driver if userspace can just go in and randomly write to
registers with no coordination with the running driver and for some
devices the kernel needs to ensure that any writes don't damage or
destabalise the system.  If a driver provides an interface that looks
like raw register accesses that's of course fine (I mean, a lot of
firmware formats basically boil down to register write sequences which
is clearly fine) but it should be the driver doing that and it should be
looking at what's going on and ensure that it's joined up with the needs
of the rest of the system.

--lPiblj3fTQ4wDvEh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmY6PHgACgkQJNaLcl1U
h9D1eAf8CiFrx1FTof5H3G+5IPZ86vGYxnBqYnt4ClHpxIe7bCBCQTi2o0/+2eOr
dbx61ihnlezPAkp+0cFqM7/Kzxruc9I0cEP6jp4LtOP6sDJgTz9Zj0zRht2i6A5b
j+BOo/2UHk+Q7nhde9m/7tjL6MkwsHpvg+ydWB679H/PnBo8hm75lgjq3gy+3gGd
EOMryKmKcnF/bPEk24QpI1BNf3mdbJ63Avcj0LCvack3yeaEoXPKJ89xN1SqLdAe
LMzF9V0YqKi3H8llb0Jfccvta9feqUQ/k/XI2mq2j4nr2/M7UBh/ckThwHUZRT18
nB7fKVugWFClUR8n/kKIp2fRdxsG9A==
=4jXB
-----END PGP SIGNATURE-----

--lPiblj3fTQ4wDvEh--

