Return-Path: <linux-input+bounces-14514-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37575B46294
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 20:47:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4D1FA6195A
	for <lists+linux-input@lfdr.de>; Fri,  5 Sep 2025 18:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A959225A29;
	Fri,  5 Sep 2025 18:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVKzL03Q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F164305967;
	Fri,  5 Sep 2025 18:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757098047; cv=none; b=dGPT4Li0Bbn9SmARUlCPgvsF4OCDTq4gS0Es400H2GyK+mAritCwmge1SPtEgph1D5uTknuEbQpgmN/i/8Jjed/+4wEGtTkPOMONU3sZAJ0Q7vJWsvujSFoznZ+KMqfnZOViHzWxAMiiFskAFLiOJE39QYiJn3JkKgmOkXI4sxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757098047; c=relaxed/simple;
	bh=LXak4icoXUTmBEdN9vsGZghkWJN3uJNIOcaOt36cTOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dDZ4bD64b+gmz4cL7pgGEles0gQ9K6VumwuwO1qqHQ1DK2q1kGs9KXk68fHcGlXkki8BlINTw52lg/dPphVL/0QXQtU68dsj81D7EuBGX+mIW17Vu2HkAp+U7RdUw+wp1N3kbe9dmT6+KkaWjaxCHig3/PpB2DShl0uTv0r6O/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVKzL03Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1977BC4CEF1;
	Fri,  5 Sep 2025 18:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757098046;
	bh=LXak4icoXUTmBEdN9vsGZghkWJN3uJNIOcaOt36cTOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hVKzL03Qdp4EbxjyRQpQ1jat1eCn3z/uutEy6fbmUB2D1O2x553mNTLeaj0HRzUs8
	 eajgLwb1sHAwI/+cP9EhW/K8a82pqWTIipT7dkD0JaZM0JWqrrrwTClK7r8MEMnQjA
	 sEe4EyyWG2m+ptQ0gf1uuUhzqWc531Coj12fgW/qwNNr3z18kP7mYoRjnynT1gqQOk
	 mkVT89KPCDC/tWkvEGQrZEbVrjM5IQ1YfV3WX6i07Zk/7MK2Gmd3rY0i3cCxKHAUrS
	 GcwMQL6k1dmC0hh3+Ei6D02NU58XQ9cur3AIK2gYmxwmIXxt5ZFaGUrdu0C3zn3unJ
	 Qw0L+zbP2Q/iQ==
Date: Fri, 5 Sep 2025 19:47:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: touchscreen: goodix: Drop
 'interrupts' requirement
Message-ID: <20250905-carton-ethics-f0fb9355b24f@spud>
References: <20250904195727.168152-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SVYqlKTNw7ktgOkd"
Content-Disposition: inline
In-Reply-To: <20250904195727.168152-1-marek.vasut+renesas@mailbox.org>


--SVYqlKTNw7ktgOkd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--SVYqlKTNw7ktgOkd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLswOgAKCRB4tDGHoIJi
0mmWAQDXrL8dMMRPzybw95N7zmRgSDDpPsaQat9gamLA9oaA+gEAlbHTWXZqHvdz
Mtm/rIpZipOBp7gZD3liZ+wcjYwEbQM=
=vVEN
-----END PGP SIGNATURE-----

--SVYqlKTNw7ktgOkd--

