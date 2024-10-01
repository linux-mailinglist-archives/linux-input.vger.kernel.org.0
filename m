Return-Path: <linux-input+bounces-6934-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE6298BAA0
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 13:07:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A8251C20EA7
	for <lists+linux-input@lfdr.de>; Tue,  1 Oct 2024 11:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B890D1BF303;
	Tue,  1 Oct 2024 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyFkZsH2"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE4B19D88A;
	Tue,  1 Oct 2024 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727780840; cv=none; b=kbAAv3UoyBd23r0OUqgSlwgObF9v2r+Zts8MVIkL0R8DDmOklqT9urs1cFZgCapQVH5h/hgGtLiB/b+ZTmxMvUL+xWuGUUzTjU44jk/9eBjxUMsU70sHXTYFode/anUC6yJu/xncBP/C2ygwAI+p1OyFFHiY12A9A5NFdfBOahA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727780840; c=relaxed/simple;
	bh=o0ib4p9BLqUoNdnKPQTdiWpsl0UL02H149/KT3vytJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gvV3fpLQQAVb87VNz73KWy4lByQJ7UWaFoh6mG7VCkd33PM0OxarxVdqnEpqut/lu04P2AunPfXFVuIDTwfO4OtvXUQ74LcRh3nl5KjUWPe6S5nUOF3/M1bgWziz0SxePvYhB1p1BH5SkEudDNAiiPGrcflvIbXiS6e0C4xblFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyFkZsH2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEC78C4CEC6;
	Tue,  1 Oct 2024 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727780840;
	bh=o0ib4p9BLqUoNdnKPQTdiWpsl0UL02H149/KT3vytJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MyFkZsH29tzHQ8Vq5hZvpMUdoajniCpw785nmNekWVem2rwvcjRCcVuX7EtpXP7DX
	 5dol7u4GHA7OBQh7q9JqSc5kLBM+B09oc/DLhiGpM5WziGvkpbUW11ddO9csNBX6jS
	 HJ+neE77R2/5jPoovPMNdByuHupxKjQ1KedtIaeVEjn80yenM4mKz0FlkVBPWz2+0C
	 BwvNmw9nxL8rtib97StocSdGOzTGYL1e2h6oGRAzE4IXLkCrZuj7yyIiMS7HcO1I4S
	 nd5qIiQfsAicGdAOvwM6fBUyWk590a3+7gIFAjDu/jDaH1/OKUfIPrwzx0ILuEMYSN
	 cgEfP1duIWW1w==
Date: Tue, 1 Oct 2024 12:07:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] Input: elan_i2c - Wait for initialization after enabling
 regulator supply
Message-ID: <ZvvX5KcKaVBLedD1@finisterre.sirena.org.uk>
References: <20241001093815.2481899-1-wenst@chromium.org>
 <ZvvHdlD6E5bzsWwV@google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FB6ybZExq1WM35s/"
Content-Disposition: inline
In-Reply-To: <ZvvHdlD6E5bzsWwV@google.com>
X-Cookie: Editing is a rewording activity.


--FB6ybZExq1WM35s/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 01, 2024 at 02:57:10AM -0700, Dmitry Torokhov wrote:

> This will add an unwanted delay on ACPI systems that handle power
> sequencing in firmware. However use of "optional" regulators is frowned
> upon in this case as the supply in reality is not optional.

> Mark, has there been any developments that would help reconciling
> difference in behavior between ACPI and DT systems. Ideally we'd need to
> know when supply was turned on, and adjust the wait accordingly.

There's not been any changes here, but there's always been an event
availalbe when a regulator is turned on?  There's also no difference
between DT and ACPI systems here, both could have the regulator fixed on
and I'd certainly not want to rely on an ACPI system implementing a
device specific delay after power on given the sort of stuff they like
to put into machine specific drivers.

--FB6ybZExq1WM35s/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmb71+MACgkQJNaLcl1U
h9CGOQf/XaxfJ10h2QybwaLcAhwIr4t4aVxpAo30seHpdJXr5g6e8m/PIKcnHaj0
svyCjb7p8/wvufBwBxK/bsNPGdmK36l2rdkszNGlf7Xx9MsB91sSlHtlQaZq6Y4X
ZvkkbkyP/uDTFekDdhbJJMMFNyZ/9nZOttpF+c6kjkhgtPzfEloTUhMA+Uct0iEO
Ak44DWhDyFhtbm4YtX7KKCGCGJmFKEAch6zRJbyfxkwTN/c6vExQuONmwSdLNUWK
UYfmcwUgGShfkf7yhRLvVHcGE4rgSY+yzpjq8QZtHdkfCebPipnqtp6Wc55o4gUr
JyXW3M0Lo6QaPKwLTvcJBN7g94P/gg==
=ax8w
-----END PGP SIGNATURE-----

--FB6ybZExq1WM35s/--

