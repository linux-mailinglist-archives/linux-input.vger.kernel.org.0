Return-Path: <linux-input+bounces-11704-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB45A84253
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 14:00:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1185A4E03BF
	for <lists+linux-input@lfdr.de>; Thu, 10 Apr 2025 11:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339CF28A3EC;
	Thu, 10 Apr 2025 11:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yu3YMy69"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB25E284B41;
	Thu, 10 Apr 2025 11:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286129; cv=none; b=rqFv+NeCq516fnyArLp++7W4PI1aPWgc7V18sysJrsOKtPBHsC6CdiFc9SLx7UlZQjCbwqK2tmg9XiIPQyKDwb3/3s7GMQ+Nw+w0nbt8TwqP76Km3/z+5CViN1D02QieOE5PzKp+s+tJPHbQeHa3p8yiWt7aZcI7vtlfZgrOA1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286129; c=relaxed/simple;
	bh=44mkjIR7pjgJknW4oYteunNsO6k7W41ROQuF095Di9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ua2WzlTJqWy59KwtgZxikZpCh6ShmhtCi0dMZoQsKzmdgLr1s1LexVMBJ2khzuJiPvMbv6H+Jt2LO9jIKlDw1oSUds1i3b1EaM9Jajni58/vOT+bVCJzPx6t66SJ3YgS9zYEcXyUy+na6qDrVXT2l6lewcEJadm59M81/bql7QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yu3YMy69; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59FECC4CEDD;
	Thu, 10 Apr 2025 11:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744286128;
	bh=44mkjIR7pjgJknW4oYteunNsO6k7W41ROQuF095Di9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yu3YMy69SBaEHcwWB/bBSwo3+G/+eWT8dZvarlELXzx0YoyU6a0z/7gBdef0RX/Xu
	 x1IKkEAKcQiTwHEtCxT493es7kzZ3l/cZ7EbZqjJNZ4XRd0FyFGiSicD+I0Kjr4t0s
	 +qmv0/zcdQnzPhdiz7Tkm5kypacjj+mxTD+Sa7TNIpflAcoHfVILNjMkhPwyNRGU7f
	 ncui0uhN/3PGyY0hF/Pdrsclys/cd/ZEg39idVkD5kHUYzjSj7Rlcq2NA/WXe+w6GE
	 sZnbIT+zbOygAzLwyBoO6EWl5lzNOksM3e3hIzMF2rs8NdnVQ5Eu8lFdEAy4bk7jSD
	 OUTolvWxkJuyA==
Date: Thu, 10 Apr 2025 12:55:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
Message-ID: <abd7861d-7a70-4e91-8a21-f79d3dd2fccb@sirena.org.uk>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/zWocYay+0q0iG5Y"
Content-Disposition: inline
In-Reply-To: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
X-Cookie: You will be awarded some great honor.


--/zWocYay+0q0iG5Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
> Requesting to see if we can get some Acked-By tags, and merge on usb-next.

Acked-by: Mark Brown <broonie@kernel.org>

I have been keeping an eye on this as it's been going past but never
managed to find the time and sit down to review the whole thing en masse
- what I've been looking at looks OK, I just didn't look through the
whole series as a full piece.

--/zWocYay+0q0iG5Y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf3sagACgkQJNaLcl1U
h9BlOQf+PWeo8Hynxe91uIIrJSTfuERxNvZ1HRUqPMKkURxYTRpth87Y6ZxZLg87
VfPrmdvDQrWUNxxUGDp0mnXaY3Y3UThA2VW0DyenTqszWWmCXnRgtOdOR0d6Vhko
KYWBQtBsDlticj3MN4ZURMYjja6hQiLlxLD4yo7UCtXEnBPjxI/aXuGPTLfSplro
Ah42pk9RyPGzNIyysQDrTAV62NzNxhrvADXTuXCErpGTImGoQlQc5GJF7jA9VQAQ
Sj5AW7L2Mu+3j/HacwSvTrYyieb5BSCQtdGM/IBIp0JDjhMeteNluItqAMMnZfjq
zfrSfMooXxcEuPvJ8fJkHrOzsoUISQ==
=iANO
-----END PGP SIGNATURE-----

--/zWocYay+0q0iG5Y--

