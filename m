Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E80A04329BA
	for <lists+linux-input@lfdr.de>; Tue, 19 Oct 2021 00:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbhJRWZj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 18:25:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:39466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhJRWZj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 18:25:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2D1160F57;
        Mon, 18 Oct 2021 22:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634595807;
        bh=+5+FcQUycSBCcdTJVdkEdUZqNj9ZSNQUuVmNGAUQGGM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VptKryPmU7qyjXCSs/4te/qeSuRiLufwujOpcXXT9iKyHTiHOaY7T5W5peaQkmZ0o
         QXZgz4EjlGBILkPvBvzu3O4q8WjrrXU8L7IX4wo4J9NlGC0Z8xyC1rk6EU3MpAk5Bh
         LOb9yivCPAqZ1+JPxs4vcyGf6GdsnU7dRlkANNqwtcc8A3fYeepFEnSW355DishdY9
         BENqomU8aGfGfK8y8DHDVhY4WNmGejS6GiYOXIzeHpAdsh3rYy8ZvzuAHNnDVL1m9H
         YK3aQCF3Z2XLr1as4NZENuQFyXEJ2xlgGbHpUc6qcnSEqUck+RgFzoy4wDUfyOEu+U
         O9z+FE9j2/ekw==
Date:   Mon, 18 Oct 2021 23:23:24 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        alsa-devel@alsa-project.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 1/3] ASoC: Intel: Move soc_intel_is_foo() helpers to a
 generic header
Message-ID: <YW3z3Ehz9ZD06G12@sirena.org.uk>
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-2-hdegoede@redhat.com>
 <YW2UNRAWUphJqhyW@sirena.org.uk>
 <c34cc4b8-31c8-9425-214f-2a0f39f048d9@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SQ3NCdbEKKY1NF3R"
Content-Disposition: inline
In-Reply-To: <c34cc4b8-31c8-9425-214f-2a0f39f048d9@redhat.com>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--SQ3NCdbEKKY1NF3R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2021 at 11:13:57PM +0200, Hans de Goede wrote:

> Does this mean that you are ok with me merging patch 1 + 2 through
> the drivers/platform/x86 tree ?

Yes.

--SQ3NCdbEKKY1NF3R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFt89sACgkQJNaLcl1U
h9D77Af/XtiF5NvyxP333blY0iXME4zq1rD4DkpJluCocSzJLyILvVLQFTzOWftv
HyBDIvEKIBSZDll0aHHLjbeQkXHhq0GhQvSPZh0m2I5/CjFJbzBte/qh3Z1fYLth
nCKDxDDlILMjwCXpkr98CCzPPDu/iS6EdNX4tt4uS+IaVWaG7AD+PrarHI5FHe4t
DAQwiw6r32IIfws1C/TAiagkX6eZJc8d6OChzk23Yk5BMM5cR8i/ffUl4pVyCp9z
Ux4tGrnffE2DLf8RH/4i1734CqWI2syNdMLJEdcTNrDV6fysd64dgK0weWpzCIxo
02JYtfFDS9mSOnCR+6ud5RUETb07fg==
=TnDh
-----END PGP SIGNATURE-----

--SQ3NCdbEKKY1NF3R--
