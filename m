Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C234322FA
	for <lists+linux-input@lfdr.de>; Mon, 18 Oct 2021 17:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbhJRPhd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Oct 2021 11:37:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:46224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231893AbhJRPhc (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Oct 2021 11:37:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51C95610C7;
        Mon, 18 Oct 2021 15:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634571320;
        bh=JibSQjxE3eYl/3LJTIS9KI3uMWewWr7xZzBC0dfWGTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aTiMfr82haKToQNJsWafwbAPkKDz4OMKjDlHN4AzHZWc5OGHEx82vqxPis3A44u47
         h1o4bOWucgwPQn6QmLRZbtQKZuEfMAcpjDqJKKyrUsBYSoxIg0EIYaAX5EaSSDIUiA
         uN6kHbOPl5GghmzEGqONfQrl6TqOiZfNmzByK3qCWtqrTV7tpWc+KadjH2v+zKBOYk
         ZGD1CkuzrJFqwJczsZDjgw66Js23G5MkBCE67oKtBiuVePB6F3mhBgGolnGblLo7uc
         xF+lD1MKKB52R66Qg+yvvfIK5YzQJpLYX3V7YP7y0kVZ8OSLexRWMSqaeDdExrKdob
         oiJjtsXY177ww==
Date:   Mon, 18 Oct 2021 16:35:17 +0100
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
Message-ID: <YW2UNRAWUphJqhyW@sirena.org.uk>
References: <20211018143324.296961-1-hdegoede@redhat.com>
 <20211018143324.296961-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="pdySZJpBnvtzNFGZ"
Content-Disposition: inline
In-Reply-To: <20211018143324.296961-2-hdegoede@redhat.com>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


--pdySZJpBnvtzNFGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 18, 2021 at 04:33:22PM +0200, Hans de Goede wrote:
> The soc_intel_is_foo() helpers from
> sound/soc/intel/common/soc-intel-quirks.h are useful outside of the
> sound subsystem too.

Acked-by: Mark Brown <broonie@kernel.org>

--pdySZJpBnvtzNFGZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFtlDUACgkQJNaLcl1U
h9AmLAf/akoQqvZR7V/vLj9gdKLLnHFVYPkDDXQ/rV347EYuW1MwbPWahTmi5Ptx
BK063G0PZVbcYuqyrJWFbGMZRnbqLOPITzjq7z0qsMvNfSpS6emjT+jlTA7gGxGa
22tp9TkO2QxeQ1ZK6qXF6ppQHI7VunrVNkDHdGjFGpNtNrHJ/BrTfsEswMXvPaYd
nIWF0qzlS6v2Vy9CV1xuZXtdIUuME3UIPHBaEyr5K+Rszj2S0A6pGVM/mVLA4CUe
BQ5GFTEMgjMJgz4zNvtv3+QGn3C+QgeP3fzROg3Gnv9xFGpk6ia1yvuvcKAslAgL
ABlCBNnMRMeYtS3E5k56LuwghbwTFA==
=jPfX
-----END PGP SIGNATURE-----

--pdySZJpBnvtzNFGZ--
