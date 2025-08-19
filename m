Return-Path: <linux-input+bounces-14141-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F22D8B2C08F
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 13:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8219418989D6
	for <lists+linux-input@lfdr.de>; Tue, 19 Aug 2025 11:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 309C132A3E4;
	Tue, 19 Aug 2025 11:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="paW+NgQL"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0672623D29A;
	Tue, 19 Aug 2025 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755603028; cv=none; b=DqIdzBZH0JKNs+nLdiZJWjhthfU43saUb6Pe33SWm0FUgvHOK1dgTHYJCppUNw56tHTgXbY4gaJhOpvMYa04NuIiPuCL4z0o6GLPE4bDb/3ZsVdwBs/6pjnI0kiAdMywlJ0PGm2sKd+LRRcLphn+MjAHjrqQnuneYKYsRA52Sxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755603028; c=relaxed/simple;
	bh=TufGJ41bl0pldV+vDEN6jI/0Btshd9uvN4DmHejO0ew=;
	h=Content-Type:Date:Message-Id:To:Subject:Cc:From:References:
	 In-Reply-To; b=UrWlqz1uXQ/dl71tkwBVjv9OI5IbsYLLk0i364oV03zhEx2yQ9sYt4fnOIOW7Cb2KsA/NuRlMkGe84l3eLAhci6t271X0TkDnWRAcR7gnH5v/H9KSpphdqEQAFjomqDIGckaPHLFlWwgLeXzI4n7bmGBjOTBHCUOmMY0dlHKTxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=paW+NgQL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D851C116B1;
	Tue, 19 Aug 2025 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755603027;
	bh=TufGJ41bl0pldV+vDEN6jI/0Btshd9uvN4DmHejO0ew=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=paW+NgQL0MNx7bJPWJ09Ki+b76jNUmGW5dkkyTL3llluY7g/H1k2HelIrkfOBqd6L
	 2jtDIipNWFMrXspO0TlNJgyEu7SaHTZoZa81XQWTudqHEwjSBOIJPwgQWamQ4WJump
	 r1j/hTnBGCkTSt6oUwfES17M/YtN5vfaBZdnv1YbH20mBccZ3PArmFSJaCe4JnUzJj
	 19MaVaU8us7E+hSzLJmJi6njwNcXMb1u4CIUVnxf00p0fGURWejAzJOKWMzsoGALjh
	 ojPcwF1YGj4HDpqA78TcZot5nRpB4Sqv2wtyo//+YP23m3LJds2kKWRWbB9qRQXqBl
	 vI3+WQJ/T69vQ==
Content-Type: multipart/signed;
 boundary=ba60e21c6832b427ea94554e3cc38afd143a0dd691c8ee47b63a8a90c298;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 19 Aug 2025 13:30:23 +0200
Message-Id: <DC6DBZ4HHGOF.11HI37DX56PH0@kernel.org>
To: "Michael Walle" <mwalle@kernel.org>, "Job Sava"
 <jsava@criticallink.com>, "Lee Jones" <lee@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Julien Panis" <jpanis@baylibre.com>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 0/3] Powerbutton driver and powerdown request for
 TPS65224 PMIC
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <jcormier@criticallink.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com> <DC6D9ESWXGKO.1NS287IU5YJSZ@kernel.org>
In-Reply-To: <DC6D9ESWXGKO.1NS287IU5YJSZ@kernel.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

--ba60e21c6832b427ea94554e3cc38afd143a0dd691c8ee47b63a8a90c298
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Aug 19, 2025 at 1:27 PM CEST, Michael Walle wrote:
> Hi Job,
>
> > The following patches were created to get the tps65224 PMIC
> > powerbutton driver and power off request working on the
> > MitySOM-AM62PX. The patches are as follows:
>
> Are there any news on this series? Do you plan to post a new
> version soon, or do you want me to take over? I'd like to get
> support for this into the kernel :)

FWIW, jsava@criticallink.com is bouncing.

|| <jsava@criticallink.com>: host aspmx.l.google.com[2607:f8b0:4023:1004::1=
b]
||     said: 550-5.1.1 The email account that you tried to reach does not e=
xist.

-michael

--ba60e21c6832b427ea94554e3cc38afd143a0dd691c8ee47b63a8a90c298
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKRgUBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gSFwGAygBxeQh3YXB0w4P3rBlrTDx7V6y70c92
jG8bz/FtbgLrwvV6v2lMPidO1cuwOyr5AX0f2pWo0qCAZx3vR3SCWLgCmiYdRI4Y
m/ew3a4UJbJNsceDoF+yJLSzeTzt2WPGL9s=
=uJXx
-----END PGP SIGNATURE-----

--ba60e21c6832b427ea94554e3cc38afd143a0dd691c8ee47b63a8a90c298--

