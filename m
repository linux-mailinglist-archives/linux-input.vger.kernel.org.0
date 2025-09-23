Return-Path: <linux-input+bounces-15017-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01232B97390
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 20:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B511F4A424C
	for <lists+linux-input@lfdr.de>; Tue, 23 Sep 2025 18:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B71301716;
	Tue, 23 Sep 2025 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="biZ9Rcul"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF08275B16;
	Tue, 23 Sep 2025 18:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758653003; cv=none; b=HW5rxaBqcGwvpkum+KWF+Ufdeh69+r/RByimedAXP+iyaiRTPXw6rXZcDIEFqBkdPbkVn8kkJmf9KeIOU2ngOWrump333XSFjLfZrndLbf0nZrauEaiMCjMsoSY6Spz+LlTPbus0a8K6UDWKPQTD/v5VuzgGzkug2lWvuggTdAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758653003; c=relaxed/simple;
	bh=BoA7Qt6p/doO1poK8qFimQ63AdK+bLNjKL/AePatJGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6x7EoE1Adjr6fxHG3eobqK5gCTMo/jNHhYPz5nfONhvzc2LVW9I5w0NkGMiHBcy9qLagvTCQtNwsIiCjjyi0pb1gukSCTEeEq48IMf4+OinCHfs6mf7kPd2a57NCOOH6044r++3aQLvwqf9hzQ9UfEyQNi8/KWoOviqLaYdal4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=biZ9Rcul; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE49C4CEF5;
	Tue, 23 Sep 2025 18:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758653003;
	bh=BoA7Qt6p/doO1poK8qFimQ63AdK+bLNjKL/AePatJGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biZ9Rculpz5cocRFM0PpbiAITUomLI5qb5UE9K4ZTvcU/gwOon9KR4Z+1OotvO0+S
	 SDmJf2bWiGk0dmoOvc7VnUHMjADwKaozqZmSxPJnhmhZkOYurLN/Dv1qjpJJTD15XG
	 a2PkkA1+GRcCZMgH9xExcxPON9sEiH9Z8gf5EkhUbYQobrG/egSExmV9WSTOZIcEXh
	 MYktJkmbO2HTfy9UD08EJhXMhcL7iKv/aFdC5DdgOdQMhfwkHJEq/oNmMuzvF7ALdj
	 PsLUPdHRSKOGSG374skm+w7EMoN/UTdWitT6mUKEGbbJAkzrSnW/6Hes4l7tXhMBNz
	 8A2WnJSc522GQ==
Date: Tue, 23 Sep 2025 19:43:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v6 4/6] dt-bindings: touchscreen: fsl,imx6ul-tsc: support
 glitch thresold
Message-ID: <20250923-mummified-striking-192198266acf@spud>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
 <20250923143746.2857292-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PCBzagFcJLSc8BY1"
Content-Disposition: inline
In-Reply-To: <20250923143746.2857292-5-dario.binacchi@amarulasolutions.com>


--PCBzagFcJLSc8BY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--PCBzagFcJLSc8BY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNLqRQAKCRB4tDGHoIJi
0rxyAP9098hBDWKs7oTCrQx4WGee1/ChmLRYUWc4rCGntjhTSwEAtvglJdBLLB0X
KBL4Ckeg2RpE4A/0Kj7HJz/rNTYFWww=
=qofl
-----END PGP SIGNATURE-----

--PCBzagFcJLSc8BY1--

