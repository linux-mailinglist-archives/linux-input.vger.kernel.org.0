Return-Path: <linux-input+bounces-6757-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E90A698728F
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 13:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 254D31C22637
	for <lists+linux-input@lfdr.de>; Thu, 26 Sep 2024 11:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8D11AED28;
	Thu, 26 Sep 2024 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkIPvqrz"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE941AE873;
	Thu, 26 Sep 2024 11:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727349244; cv=none; b=t995ib83YoKovuNVMoDNGXzDt7Z9XmrTLQ88w+56+g1MDgOGYMQN0Wkp3136LQcOED/jyhwz69fhEvK566gmgJLSFYaKGxLG4yZBbvTDnUlpFjo4SArDApdmZy7F+YwHLG9tgiUN50j/+UIiWhngSvR6154s3PQAVK3Z4jcsbzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727349244; c=relaxed/simple;
	bh=GfdmnkTR2lyNTVysAy7FcooIJNtcfTaWPhkccLC2EUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TP53BO1lLO5eem8FrhC/fAyzNHAcr7GXnRjmFG5cx3jawy/nsXBe0wYLfzYJKD6tnrdEHa1hs/yjWO+KgFMI2MMsLj80RseWha2MI9DG4XB0ir1ts1uxf6dAdh153fx8btOfmj4u6d9J1/FnAWjHIT+XNmJPR1FaGtejHjS3Tw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkIPvqrz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA297C4CEC5;
	Thu, 26 Sep 2024 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727349244;
	bh=GfdmnkTR2lyNTVysAy7FcooIJNtcfTaWPhkccLC2EUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bkIPvqrzPg0mdGyJPNg1LrgPdGCTTomSyOEwQu+/gUktclMrdpytdIQiDI9mT8iry
	 emReRw9MdBT21/Q4Vvf3ydJ2RWWZxA4WLA+ztcwxqLtB0hFUt2yDI/LOMJ89Wn2GL7
	 NK24a8lDCk8t0+Vz7do3vPpT9c9Pir8LsTCmxA4dtRqz/ZrNwDLYyDhrlt0TL+Y+1g
	 5UWoL2fFOJ1hitGnywKUT0uSEzNwM3nN5p8U9DpBku8tXUDikOmsuOomcn5p426JSQ
	 yf2G/DEWxbfb9kNYQm3/KGKOVqk2C5rT2v6WevuQtqa+dskolk6S0SbsMb03g/NMox
	 hqd4TkwGQwPHg==
Date: Thu, 26 Sep 2024 12:13:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: dmitry.torokhov@gmail.com, dianders@chromium.org,
	dan.carpenter@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	jikos@kernel.org, bentiss@kernel.org, hbarnor@chromium.org,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 2/2] dt-bindings: input: Goodix SPI HID Touchscreen
Message-ID: <20240926-password-cadmium-87ccdf950fd1@spud>
References: <20240926044217.9285-1-charles.goodix@gmail.com>
 <20240926044217.9285-3-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uUWCvzz8nDTGstS0"
Content-Disposition: inline
In-Reply-To: <20240926044217.9285-3-charles.goodix@gmail.com>


--uUWCvzz8nDTGstS0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 12:42:17PM +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
>=20
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>

Please remove my reviewed by, I didn't review this new "spi"
compatible.

--uUWCvzz8nDTGstS0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvVB9wAKCRB4tDGHoIJi
0lopAP0S+yDwzvKIJmNWzqKdm5InSTHF3O99utkw1ANIRxDk6QEAsHrFJKxdfYen
qyT0qu+6M5uQCT2fbA4PsRe8UoFx1QI=
=wdQ/
-----END PGP SIGNATURE-----

--uUWCvzz8nDTGstS0--

