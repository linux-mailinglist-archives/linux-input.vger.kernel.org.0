Return-Path: <linux-input+bounces-6941-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9D98BD0B
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 15:06:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84C591C231C2
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:06:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A684EEC5;
	Tue,  1 Oct 2024 13:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDh1XgYu"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50C14A06;
	Tue,  1 Oct 2024 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727787984; cv=none; b=ZA4XxdD5Gu3tWUJQEvoA+ykwuwc7sf3ErDsnnSe+cHnvpTrnhpDQULoGw42+xrVJDrjuk+OrolpMVKBwqE4hB9HgBsHamW4rrSzVV3t29gIR4DMYToXD5mRi3pMNO/0rjS4Ffi0+GmgJ5Uxmn7MyFpAqIsoUsHnSlwoXi4QWu/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727787984; c=relaxed/simple;
	bh=cFOTlNXs9lvP/XXg2/XHyR4LIBvLe3YCumZ4xkyzg6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPY/xeQUCxvnAee5tg5KGKFHZLV5jFiqsGG1xCU99CfLCSyRNxfBE0LT6yQV6hzs6/H6rJUvfTZV+/Q/mFBS11HuvVQG9QnmR8cvTIw7+03j1aekrRSqV5RsSOXEt99O00FCfM8+mYpxduJRfeGJufvqup7Qm+jGS5XxFlB/NC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDh1XgYu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 354A0C4CEC6;
	Tue,  1 Oct 2024 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727787983;
	bh=cFOTlNXs9lvP/XXg2/XHyR4LIBvLe3YCumZ4xkyzg6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDh1XgYuwiZxQx/AJCeypD0C93AMDEUh87R4p9LcQ3eqNcvzurmHFyMUjKwkrh3RW
	 DwiDtWa3j1UsZL6gLI9T6GBThbrVnZdYFME2t9rEd0Sf6ZP9p8GS43TWdkDPFFqGjg
	 G9fHX11SHBUrOXWnxyyQD63aqR8DHdWIQq4jhu3sjnPs7fu35uzGxBM1xqZjwCNy+e
	 H0WbWZuoUFaxOeVUF+mtXBdmNLjhM2At92X0YCHJEKme50cmv0PJ0mqBzhYVaOjMrR
	 h6LVUXQCTGn2fGGlmsqYSHIY1dKadkdXSNF8RtU0DsDk3f8Z0zQZbUL82KfTcfSVXK
	 6/F/F+trOs+VA==
Date: Tue, 1 Oct 2024 14:06:19 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <7db1299f-f925-4689-806f-f1ea4191fd4c@sirena.org.uk>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
 <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
 <ZvvyEux8f2ylRQOn@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9FG04CYkkI4pyKXe"
Content-Disposition: inline
In-Reply-To: <ZvvyEux8f2ylRQOn@google.com>
X-Cookie: Even a hawk is an eagle among crows.


--9FG04CYkkI4pyKXe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2024 at 05:58:58AM -0700, Dmitry Torokhov wrote:
> On Tue, Oct 01, 2024 at 12:07:16PM +0100, Mark Brown wrote:

> > availalbe when a regulator is turned on?  There's also no difference
> > between DT and ACPI systems here, both could have the regulator fixed on
> > and I'd certainly not want to rely on an ACPI system implementing a
> > device specific delay after power on given the sort of stuff they like
> > to put into machine specific drivers.

> Well with Elan in native mode ACPI FW does do proper power sequencing,
> that is why this commit mentions failures observed on Mediatek devices.

Yeah, but that's got to get washed through the individual system
firmwares to get deployed and my confidence in vendors is not high.

--9FG04CYkkI4pyKXe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb788oACgkQJNaLcl1U
h9Brogf/TJNU2WRZY2mkqAck0/ybRptVqwd2DVZdO6y6WsZB4PZsj1lwGL5WY2/j
7xotH4A4gcYmQXH9uBO/tWkVR7XSQev8e8/8ZTUiqhvPwrE8s3UEs8mA7IIiHTsL
GLPCNqN2b0UZbJ6n4L8s6YpZ9/nmh/mmYIKHgVHouVjYIU6IzcpPVJBNENmQ9clK
VLajmL2IVHsFYFez27PdQdSjvvO8wW5Q6a7EVQDfHb9zvSzz+SrXbnIqFtzgsfW1
DwWlM1rD/F3k4hhHofiUMph/xE+jvrRQZTeFeDZD5WdEx2EiHnj71OKR/SEEgNRJ
VZhln3AkvKTHzHpEfupY+2qYpmLJ+Q==
=ZiUy
-----END PGP SIGNATURE-----

--9FG04CYkkI4pyKXe--

