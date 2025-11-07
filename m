Return-Path: <linux-input+bounces-15933-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA004C41245
	for <lists+linux-input@lfdr.de>; Fri, 07 Nov 2025 18:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 73B4F4E37DD
	for <lists+linux-input@lfdr.de>; Fri,  7 Nov 2025 17:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1280632E156;
	Fri,  7 Nov 2025 17:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ggrlbcpe"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E50223DD0;
	Fri,  7 Nov 2025 17:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762537641; cv=none; b=KouRodtupXNHi+nS/SW4q9xc9nTe4nRn2OqDNkhkrgWdVxVEJ7o8MHt6bFvlLH8AQXWOV0QYTAjaRJO60OwexJ8zu0cTIQS7YZ8wi+xqmO8jLjrFBQwcmVgz7mXWR75De/G7CUgW+Cof8MwtwtuVR6SeCTjF9giQMxwOpD/kTfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762537641; c=relaxed/simple;
	bh=Jg+/cSmWZ3S0pISvENcp84Pxt0oIzICkqotwu2cofT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDq7rf12S5fIZt2dr4pipmjIhQxgNFNcfbGodoxSVjlIZb2vrGSIH8m/pNbcT9HCQZhYaYC2jqzkygY8/XP7N6bhIz2x3nvruNAaI4VUjIilxRx8Dk0i3rVQuINQaMB8zyMZ+IBhcZDKisrAMwCo0jygKOk9XwMkXXMn2SZ4PbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ggrlbcpe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64B71C4CEF7;
	Fri,  7 Nov 2025 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762537640;
	bh=Jg+/cSmWZ3S0pISvENcp84Pxt0oIzICkqotwu2cofT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgrlbcpeNMyuSBzVJ/24KfJakT1KJ5Rk75Ti6+p+3gxKmupwC9NqmAszXV3M+OlLk
	 K0gOAHVOF9/FRq/f+M33yLVDGpP+SXUcC48KqI5OPCAFY5ygZahRT28Sn6r5kG/tI4
	 51JhTBK50mO01g/+AgXzqfbeiJGrUyQ+KTBoWIy6W1TPXZ7O/CDYCfGlGeJUPEL+6F
	 1S5dlvzkmxaLLaTE0ARraLJO0D3xo77z5OxRRViI3yz3z8xzc1ZFcqtUj4lH7fqB+B
	 A50s21Br7ar3hlAIEN3xMo//nOVBKvIo7L77VzHtjm1hzf9SrJr2753heWG3R5Z6zU
	 H03pYVM5nd92w==
Date: Fri, 7 Nov 2025 17:47:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-input@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 03/11] dt-bindings: panel: lvds: add Winstar
 WF70A8SYJHLNGA
Message-ID: <20251107-cubbyhole-certified-2de627004084@spud>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-3-d8233ded999e@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9f64Ubgv4dqrvjxG"
Content-Disposition: inline
In-Reply-To: <20251107-imx8mp-hb-iiot-v2-3-d8233ded999e@solid-run.com>


--9f64Ubgv4dqrvjxG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9f64Ubgv4dqrvjxG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQ4woQAKCRB4tDGHoIJi
0lYNAP982+xPMTBA8hmMHUV0GMWimASaZ/P0l9HC8fXdcwGPNAD7BF9R7aUisARG
9v0SFmVQrHfXao9nLlNa46MCEI3asgU=
=tZOE
-----END PGP SIGNATURE-----

--9f64Ubgv4dqrvjxG--

