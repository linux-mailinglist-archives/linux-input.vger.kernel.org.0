Return-Path: <linux-input+bounces-14207-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A76B2E5B2
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 21:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 403945E2D74
	for <lists+linux-input@lfdr.de>; Wed, 20 Aug 2025 19:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3702848BC;
	Wed, 20 Aug 2025 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQ43nyeo"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC2336CE0C;
	Wed, 20 Aug 2025 19:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755718588; cv=none; b=cp9Io8CYfmV7dCjYadpNTApQdetXCeCKn39HGp4KIpJz+LbzGPas8sIKEQVZL1hHTIKBPf3/Tl0/K1ni7eaIXkGxjbzE97kTLT7dgcIqeT+b1FST+gqhKzR6AGvAI1M15uL0HjkvOELmJY3mfo0WMFdgnoHp+8ROtMUU6dMsKzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755718588; c=relaxed/simple;
	bh=2MK83q8fm+W+GxCxyndeu3wsn/WRUJyYnSEotKUfP6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DtAQP7OIkkWBb0OEh6RSGCVLYIgbWcKd0PjubgpAZacxnONTilTjy4lfsdhYY+PQkt8VVMFAo3nzh9cflLQIxggTRpKuBxVzhyitlOMgbOWC0RXyv6z6YiVvC3L3VKF8CA3I725OG1RxIGU5VWZEWX1nZ79WcgAk9IUNXXJL8Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQ43nyeo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FF8C4CEE7;
	Wed, 20 Aug 2025 19:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755718588;
	bh=2MK83q8fm+W+GxCxyndeu3wsn/WRUJyYnSEotKUfP6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQ43nyeo20agUsZqPkTAeBMNWRAWci5exsOGQz5TZ2xLQvStbqJYbysnYfZAjoW69
	 GLeuKLTtmE7f+zjfeb4MJpkX2Vsz9+eXvTHsT/GbtQScG42qFyYuqO7FhWkIzgw2hr
	 0iaemP2xP2EfkLo8DM9fgufHDvZfcGqR83dO1YIA14wqsSqr1Zbcar10Kzcz5+poie
	 Rqxv7+MhFQUumWbc/YgTMrWPBNn+oCuoLCyOvZ85CORmQyVALN6Lin/enQzbR2rmTS
	 +sM4fyitI3wXGs7U9/y/PvDf4StUxm4wJ8jjiuGopJpDf2lJdNxhNzs210q2CXbWan
	 93lLV78GC+p2g==
Date: Wed, 20 Aug 2025 20:36:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jikos@kernel.org, bentiss@kernel.org,
	dianders@chromium.org, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input: Add Parade TC3408 touchscreen
 controller
Message-ID: <20250820-despair-aftermost-034a1f899f41@spud>
References: <20250820122520.3356738-1-yelangyan@huaqin.corp-partner.google.com>
 <20250820122520.3356738-2-yelangyan@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4+jjH6/rh50/BQUb"
Content-Disposition: inline
In-Reply-To: <20250820122520.3356738-2-yelangyan@huaqin.corp-partner.google.com>


--4+jjH6/rh50/BQUb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 08:25:19PM +0800, Langyan Ye wrote:
> The tc3408 touch screen chip same as Elan eKTH6915 controller
> has a reset gpio. The difference is that they have different
> post_power_delay_ms.
>=20
> Signed-off-by: Langyan Ye <yelangyan@huaqin.corp-partner.google.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--4+jjH6/rh50/BQUb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKYjtwAKCRB4tDGHoIJi
0gccAP9QfOYySBQKkm1pFVXm3hP5HM0XpEfKQXtJNbu76yyFHwD/QVseVWkMh8Dq
N2Oh8XMg5LzYparXNKsQN8z0eFgY4wk=
=Umhn
-----END PGP SIGNATURE-----

--4+jjH6/rh50/BQUb--

