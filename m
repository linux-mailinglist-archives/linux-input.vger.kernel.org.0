Return-Path: <linux-input+bounces-8388-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0D39E42D6
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 19:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12E82165EF1
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2024 18:05:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E107623918B;
	Wed,  4 Dec 2024 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brjefTs6"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14FD239180;
	Wed,  4 Dec 2024 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334961; cv=none; b=k5vWxPfKQjcopDFtZXWnF/Fa3MdNIAFVgRPD/1mZ23Vjeois4pAOipuyFKLCjR1sD7/JEMUrPqvHJgL4qYC76E83nsfsV+LSDClQD3GDyvJilGzzmGGCuGHH4ZP/WVdjNntK/NtJ+es0wWu4bqjlcmJY3GOUHBgMjxRy63PJdMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334961; c=relaxed/simple;
	bh=TOM9aePxdCLGUo6xUM1G1Spcg2FXy7L874bypRvmAP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a34+bfob42fhuB8yeA57vYo1EhDoWYmXT4bUdIFDherVB3DR8HhiPvEf0uQbcwkClwAXQCLxtmPG7y5iVJm1x6XWmUeNc2wkpLlGLk+SSJz8QyzyjB4FzbC0nrUgM0R6PxJ9qIpP+DyRWhNnGnMHdvAbqo6ponmZiqXT2KSMJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brjefTs6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50A0CC4CED1;
	Wed,  4 Dec 2024 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733334961;
	bh=TOM9aePxdCLGUo6xUM1G1Spcg2FXy7L874bypRvmAP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brjefTs6cDkW2nRCNYmkohhi5xASlnMC2hrszHenetY8dFlSvH5qSNQfbDIYwb79c
	 U1qMNITZbY2wTvUycDBZh+am0aRbxrpetbs/9Jz1NCVxtUdLSTIdCIeM3W+NxARIX4
	 aR166jdbrJyQAPU3a3+3TcErS/dYKcc4dwkktEKkMysFSm/tpdXBCPruP1Uxswi/oP
	 9lGKQ7Ex3wF/hMhFDyANPFU6N4ak509P6Omr4OC7kVMpY8obKtub+isqwuE42t+kzo
	 1DrXF4agK5awyZEKwYj5jDUzxPsqsSlqfbCxbmZjUL1ggxSsPi5r9RfDVPMW3TveEG
	 qYOWKrOkbRERg==
Date: Wed, 4 Dec 2024 17:55:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roy Im <roy.im.opensource@diasemi.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: input: convert dlg,da7280.txt to dt-schema
Message-ID: <20241204-duplicity-throwing-42a3faca5199@spud>
References: <20241204-topic-misc-da7280-convert-v1-1-0f89971beca9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UJpZzxk7m7DI9NMl"
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-da7280-convert-v1-1-0f89971beca9@linaro.org>


--UJpZzxk7m7DI9NMl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 04, 2024 at 11:54:35AM +0100, Neil Armstrong wrote:

> +  dlg,bemf-sens-enable:
> +    type: boolean
> +    description:
> +      Enable for internal loop computations
> +
> +  dlg,freq-track-enable:
> +    type: boolean
> +    description:
> +      Enable for resonant frequency tracking
> +
> +  dlg,acc-enable:
> +    type: boolean
> +    description:
> +      Enable for active acceleration
> +
> +  dlg,rapid-stop-enable:
> +    type: boolean
> +    description:
> +      Enable for rapid stop
> +
> +  dlg,amp-pid-enable:
> +    type: boolean

Shouldn't these ones be "flag"?

> +    description:
> +      Enable for the amplitude PID
> +
> +  dlg,mem-array:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array
> +    minItems: 100
> +    description:
> +      Customized waveform memory (patterns) data downloaded to the device during initialization
> +
> +required:
> +  - compatible

Is this right? The text binding has: compatible, reg, interrupt-parent,
and a handful of vendor properties required. I don't see a mention for
the drop in the commit message.

Cheers,
Conor.



--UJpZzxk7m7DI9NMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ1CXrAAKCRB4tDGHoIJi
0hTOAP9aMNlPB4ninZpAhijkEK3jkIpRWqkJ/XhPR0rp0mU5WAEAnRwTPZl+B0cN
mQtpCXERWPXq9+Nyu4Po1/WxyYPezgU=
=Nizb
-----END PGP SIGNATURE-----

--UJpZzxk7m7DI9NMl--

