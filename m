Return-Path: <linux-input+bounces-4358-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CC908ED1
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 17:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EB59B29C47
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2024 15:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F0C615FA73;
	Fri, 14 Jun 2024 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNmdsXPW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDE1158DBC;
	Fri, 14 Jun 2024 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718378878; cv=none; b=ZJp0h7fgWLvJDelSdiWsLEwqNm7ozDW7aAsum2zhYz83gimft5IQkq9JRI3lEZBZ76PHTeoPdo1RS6f5CEIT2S6W+hOZvhaO46Hs+ytWxNCytX/+bO9ugrDNE155gOn+SgZJzG+i3ZENLVrRSVgFDJ/A8sGD4jb4IpY53h7GXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718378878; c=relaxed/simple;
	bh=UHL8yEBqBL2xIDcD8jhKMI6KNHOoZnRSFip6JEy6Ddw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpWVJnxAERpR1d9W5RFaGW4+dH+pwR9ucENKaTXhSG+1yqShEH9tlTy0SltAilepcHXfe0gVN0UMGrF/vocatXPNOyZO4XAZASRZOGgTjR7m59RT82nLDB5xiMgYTYOz/yXKnpjmGTLtnu6hJCshrVfW9FmVsReG7flNVCUU10M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNmdsXPW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D66BC2BD10;
	Fri, 14 Jun 2024 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718378877;
	bh=UHL8yEBqBL2xIDcD8jhKMI6KNHOoZnRSFip6JEy6Ddw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uNmdsXPWeF7ctjBV9Dbs9fHGscpXxgcjT1Du81hOvRSFGyvEc5QeMaCkxpJ9r913q
	 eJSnd/K/0GuZqnSdrW6jFI0Nq3OvSwXGXKu7RiqqodhWu2Itaqqb6mv3NxMiWEct/c
	 +v9ikpMxDbKqqIZpHulN4zvnqacDzcgUYl5FQ8hU85rP91NACX/GvbareWHWIacW5k
	 Oyt6qwAkbWfdy9vvf53/MF5FkDghebU+1NvnpCjhfsJWm2DXUd54aOsBvHxDCZ4fxV
	 lcfX8rpcRd1QfcVM7SGcj/4FyAMBCZjRvELW0j4qrcdwoKEm7XX2nB7ozvCDhV/B98
	 DhMXeiPyyYjKQ==
Date: Fri, 14 Jun 2024 16:27:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dan.carpenter@linaro.org,
	dianders@chromium.org, robh@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <20240614-blah-sworn-1e13ec9c0e94@spud>
References: <20240614121538.236727-1-charles.goodix@gmail.com>
 <20240614121538.236727-3-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tW7EexHhrd4LQWuH"
Content-Disposition: inline
In-Reply-To: <20240614121538.236727-3-charles.goodix@gmail.com>


--tW7EexHhrd4LQWuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 14, 2024 at 08:15:38PM +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.

> +properties:
> +  compatible:
> +    enum:
> +      - goodix,gt7986u

> +  goodix,hid-report-addr:
> +    description: the register address for retrieving HID report data.
> +    $ref: /schemas/types.yaml#/definitions/uint32

You're also missing an explanation anywhere in the patch for why this
address varies between gt7986u devices.

--tW7EexHhrd4LQWuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmxheAAKCRB4tDGHoIJi
0p0WAP0bcvR8lBU9nHpM3WHqK5MvJz4Cu+Rc33nsJemIQuIlCQEAl9PCkGiuPulC
vPaBvZRIVYfCIyBYcQiKakHRBUeAfAM=
=U5GX
-----END PGP SIGNATURE-----

--tW7EexHhrd4LQWuH--

