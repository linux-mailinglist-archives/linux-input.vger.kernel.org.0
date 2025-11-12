Return-Path: <linux-input+bounces-16045-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D3710C53F44
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 19:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 09DD74E6830
	for <lists+linux-input@lfdr.de>; Wed, 12 Nov 2025 18:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836FE358D33;
	Wed, 12 Nov 2025 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+BLgP/K"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540BE358D2D;
	Wed, 12 Nov 2025 18:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762971991; cv=none; b=OQbaQj5UfX9d1YcXf+84UiEuFpaP9a0lihADqe/7y2pKNuBE9FomOJrTfwiIgePpuBgS2l5mEABs4E/mcnIZyVuzeqf9Z97728ZY1G+IMvpSKa7RTjUg2wVsccqYcJwem98HKZUGEbs3GuM2ip4dzaB9Q3qc316QwE7EKb0bVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762971991; c=relaxed/simple;
	bh=KqIE5WmfyHmP8ll3rOCY+FYSMtK6zHgkQ3ZM4GG1AjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYL0sJ3sNqMhnmiKUlncHQlcpGYA364TjqXYkuNFoleMVOvHzQcZG6j41DbW5h3hYoduHqZcqZkRRm76Yo/3vHgeT2fzEWDIkerUB6yDYZMPLQxD8/yqBYKHA+DXoNAhVcmWUpSzK6+i+puGwIrPpWkbJE+sL0bzSyIBl0X6vlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+BLgP/K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38A8C19424;
	Wed, 12 Nov 2025 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762971990;
	bh=KqIE5WmfyHmP8ll3rOCY+FYSMtK6zHgkQ3ZM4GG1AjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W+BLgP/Kvh42AwbBcDdL6xFNxRAMUoqlImaEJWOsJ6Mj/IvTdWE86pZzvDLLh4T3A
	 6IPzZvuwMcSmW6zZB01E6oJzEliKrGozmzVTKBtm0tBRU3+RmLbrD1PVlnm23xratU
	 tlzd0dq24GiZdgiTrW640DefdGUlEU1go/6/WTXUSQt0+yxeMbD06/X/z7bmqyesoB
	 h8yI3Mo3dt08CaaUnAE/BL3UlWlol0ZlymcP9lHsaD52mjiX5RaQdo6zhTrQtgNkff
	 CBZJD+uqT+FtHqK2Kz9l0wzQDQivhj3y86kLjUk0logNlnGhCTFXs38J27PnJaXB/S
	 a5rRcfY/BJ5QA==
Date: Wed, 12 Nov 2025 18:26:23 +0000
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
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 02/11] dt-bindings: display: panel: ronbo,rb070d30:
 panel-common ref
Message-ID: <20251112-efficient-dental-219b34a728ab@spud>
References: <20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com>
 <20251107-imx8mp-hb-iiot-v2-2-d8233ded999e@solid-run.com>
 <20251107-cornbread-juggling-2e7e69bcac10@spud>
 <14492bcb-aa74-4fce-b9e6-3d33b08c682f@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+EOiDhVMpxn0wrR/"
Content-Disposition: inline
In-Reply-To: <14492bcb-aa74-4fce-b9e6-3d33b08c682f@solid-run.com>


--+EOiDhVMpxn0wrR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 11:51:55AM +0000, Josua Mayer wrote:
> Hi Conor,
>=20
> Am 07.11.25 um 18:48 schrieb Conor Dooley:
> > On Fri, Nov 07, 2025 at 12:46:09PM +0100, Josua Mayer wrote:
> >> Add missing ref on panel-common.yaml for this dsi panel so that common
> >> properties can be shared.
> >>
> >> Drop reset-gpios and backlight as they are already in panel-common.
> >>
> >> Switch from additionalProperties to unevaluatedProperties so that comm=
on
> >> panel properties are available without repeating them in this binding.
> >>
> >> Notably panel-common defines the "port" property for linking panels to=
 a
> >> source - which was missing from this panel. Mark it as required.
> >>
> >> Signed-off-by: Josua Mayer <josua@solid-run.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Is your ack compatible with Frank Li requesting to move the
> ref on panel-common further towards the end of the file?

I don't care what you do with that. I will say that it is pretty normal
to have it at the top of the file and move it if there ends up being a
need, and it's not worth resubmitting for that alone.

--+EOiDhVMpxn0wrR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRTRTwAKCRB4tDGHoIJi
0oSSAP9SN63sA1M/10C28Rdxq70LHgjhnvuOt7uLqa7qxb9H8wD/TuHCoPY5bn/4
4deqcUE/0q2mjHZ/dBSzUxDDPOOgIg4=
=Dix4
-----END PGP SIGNATURE-----

--+EOiDhVMpxn0wrR/--

