Return-Path: <linux-input+bounces-8423-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A589E7667
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 17:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A89AF16BA2C
	for <lists+linux-input@lfdr.de>; Fri,  6 Dec 2024 16:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A2B1F3D26;
	Fri,  6 Dec 2024 16:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaA2EEt+"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3979D192B66;
	Fri,  6 Dec 2024 16:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733503870; cv=none; b=YGRdPkmSZCkz5KrIjaXiy0zCJ0nA2axjOZhxZpzJu4vy519PjwxnlURgzPbZiP7j3kRnX69DvAoMjsv9KFvq2Ai36Jlz+IoZNgZ9WPOB7FbXFMqnH/YyLrLsob37wgmrkVMCe2bp1hUmuDq7Wm4gOX7FYmz5hLWtUOLZnDpJmSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733503870; c=relaxed/simple;
	bh=5EWq1MsWNn7cBmDKqtoVlCA6lKskrj7+wTJqOVj+Cm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XyejFGsWPGZa4mTELjBew+1lwE1J5Xe+eyjIRmyOnhzw7cQuQAGEGtQ4vul56E6oJ0RZKtqpR5gzHrTJ5Qep0pwRKPwED1VAB+SgXvGlkT+kkA0JDR1L66LEw6B+6FthM4R1gI72/DTL47hWtWJ4qM6auyNdVSW0QLwxOpvpTvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaA2EEt+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB361C4CED1;
	Fri,  6 Dec 2024 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733503869;
	bh=5EWq1MsWNn7cBmDKqtoVlCA6lKskrj7+wTJqOVj+Cm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QaA2EEt+jvKv3pQlCiSv9Z67oTyutNh3x6UsqAIdHKupvB1Su4ov0GL3uVYF8C6KF
	 OCToFnZWj88fyXa2Oa2qfOOyw5D/XtzkM2YiTlV3iBgEfxdbYa3uLvlWsLDWJ75L/7
	 YuMM5kDDJ8Dzv3esfV9GQINpjPPkQsbUIBeALG9PKp3vtoxVTMzhSUjAAPYbOAeSfk
	 AUE/s6w/BZa9/3s/X8SILLF4xKAFuT8+CXxJBBBnzyBbpwiYOE2jtG5EiznBZS/3Zy
	 edSFDds1Q7GybDlh4Q+HtQ1gRdvJuwuYfCBGnAG1y+Lq+nRxgSYL5RjwidkGByxqKr
	 8gnEvFIJa8gMQ==
Date: Fri, 6 Dec 2024 16:51:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roy Im <roy.im.opensource@diasemi.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: input: convert dlg,da7280.txt to
 dt-schema
Message-ID: <20241206-charity-recital-f833c55756e6@spud>
References: <20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h7++Js70dRAqwPEZ"
Content-Disposition: inline
In-Reply-To: <20241206-topic-misc-da7280-convert-v2-1-1c3539f75604@linaro.org>


--h7++Js70dRAqwPEZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 10:59:52AM +0100, Neil Armstrong wrote:
> Convert the Dialog Semiconductor DA7280 Low Power High-Definition
> Haptic Driver bindings to dt-schema.
>=20
> Due to the implementation and usage in DT the array must be
> an uint32 array.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Switched to flag instead of boolean
> - Switched the array to unit32_t, because this is how it was defined in t=
he txt, DT and driver
> - Link to v1: https://lore.kernel.org/r/20241204-topic-misc-da7280-conver=
t-v1-1-0f89971beca9@linaro.org

- made more properties required

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--h7++Js70dRAqwPEZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1MreQAKCRB4tDGHoIJi
0mqoAP9hRF/MHTM+ZC1+CMd87NPwXHs12JHLjPK+FHc5zmu+TgD+NRTUP3VOVFJA
xXyq3+eHAXNJ6siCclXJGmimm8ALEQQ=
=2f3Y
-----END PGP SIGNATURE-----

--h7++Js70dRAqwPEZ--

