Return-Path: <linux-input+bounces-13582-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A10B08EA3
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 15:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9B74A64562
	for <lists+linux-input@lfdr.de>; Thu, 17 Jul 2025 13:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C0F2F6FAD;
	Thu, 17 Jul 2025 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b="hzgOKMbw"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF632E5401;
	Thu, 17 Jul 2025 13:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752760694; cv=none; b=uAAAg8Av55KN2TiIpL9JidlYFxPZb5S7/Fqu3epJdUtsFOnNU2psQYUNPDdugXknUIN0Ncix4yeq68cvD0Y7xc6DUtWfyR5LBuM5LTtQPb5Q5vfgvbczvfLYauOEdN0AJrr3EAScX2lylJI6lz1d7YqUl+T+3TeRhFQaHun0pYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752760694; c=relaxed/simple;
	bh=Xb5AqYLOJOh1de4tCf5sm81OFU6MchKvsJafw/8bFko=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=U5EQMM/j/daD+dM40QDhWWioyQhydLIYmqMBcbdhm+tMndIVXwJijIPjnUiOGczIXs2wxQb71KpCQ12ykWX3i5alwYV2bJ6DKz+4gltsNPTAMp0qevHe67wO55/ZyT90AxDLJmZyeszPlMNVa0LChA47QGs1YDPEz+F5umf0SB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc; spf=pass smtp.mailfrom=walle.cc; dkim=pass (2048-bit key) header.d=walle.cc header.i=@walle.cc header.b=hzgOKMbw; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=walle.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 02688422;
	Thu, 17 Jul 2025 15:58:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1752760683;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=Xb5AqYLOJOh1de4tCf5sm81OFU6MchKvsJafw/8bFko=;
	b=hzgOKMbw90nzTDCnPUn+Riecr2u8xiPo2ay6d8M+vgobGcv9qVL1t01c6GnJD/v7lCjCxq
	7ebc1lD9zrTw3pIm5rccmtepgm+DgZ704rzoB0wv4DsWU7JBTAI1euzC/TQYi3zOzcVPMb
	VEmaYv6177fmp2IPYPpk/q3nVeS9IquAI1+BiySHBPXr5r/AbW9VHT9a9/yqVbsJQmUMTZ
	Lx3JxWlV1pTIoA4bJKNLwjJCci2fK7cuuyqtDkfTOgmMUxDCa16CXVIxZtLt41IISZeBlI
	yDQf5ttGx+n14q9w3OLYsMG9rJFyhBrcfqDZEF/8TbiIO72nEFHjhoVSi2sjLA==
Content-Type: multipart/signed;
 boundary=3710b5797a6b588603c65c66b2c301341f3ef2fc31ae6b731f7a44e0304f;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 17 Jul 2025 15:58:00 +0200
Message-Id: <DBEDT0OKPYAC.EX6HDQCKUWIS@walle.cc>
Cc: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Julien Panis" <jpanis@baylibre.com>, "Dmitry
 Torokhov" <dmitry.torokhov@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>,
 <jcormier@criticallink.com>
From: "Michael Walle" <michael@walle.cc>
To: "Job Sava" <jsava@criticallink.com>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Add power-button option for TI
 TPS6594 PMIC
X-Mailer: aerc 0.16.0
References: <20250520-linux-stable-tps6594-pwrbutton-v1-0-0cc5c6e0415c@criticallink.com> <20250520-linux-stable-tps6594-pwrbutton-v1-1-0cc5c6e0415c@criticallink.com> <20250521-wandering-tested-porpoise-acbef7@kuoka> <CAKMwjwTP=xSsX3UuK02sKbXWaU7y-ErytNYCL_P0UveDytQW2A@mail.gmail.com> <20250529-wise-tremendous-stork-a7d091@kuoka> <CAKMwjwQOBE651A-5VVjwcv5TspO2eNZfgwWzMpTTWxhR3nGKUw@mail.gmail.com> <0fb4b411-1b27-43fc-8d48-e5220fc85478@kernel.org> <CAKMwjwSZEhXav2U-bd+JNyVDK3JdJoN1kJjnxpfKXBKsW2XxdQ@mail.gmail.com>
In-Reply-To: <CAKMwjwSZEhXav2U-bd+JNyVDK3JdJoN1kJjnxpfKXBKsW2XxdQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>

--3710b5797a6b588603c65c66b2c301341f3ef2fc31ae6b731f7a44e0304f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > Someone knowing the device should come with arguments whether
> > other states for this are useful at all. Or not useful and then argumen=
t
> > that in commit msg for example.
> The other states are not useful for the kernel. Only the push button
> has a need for an interrupt handler. The other states the PMIC handles
> on its own.
>
> What exactly do you want me to change?

Because the driver isn't setting the configuration anyway, wouldn't
it be possible to read the config bits (Register 0x3c, bits 7-6) to
figure out whether the pin is configured as power-button instead of
having this property?

I mean, the correct config is likely stored in the NVM anyway, and
reconfiguring it to another value seems unlikely.

-michael

--3710b5797a6b588603c65c66b2c301341f3ef2fc31ae6b731f7a44e0304f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHkBaREcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+E5CAXkBi9lzevsKZnpN8rYJ9T7yS4kCJpkCvRgl
uAK3Dcbf9f8v/SNIb4Qk2l/LQ8qwTcUBf0SY+/vVXtPhuBs0s65DjZ/3Muz4cI2Y
BXtSh36SBXezAA3922CoXHXD3VP/XRPpbQ==
=rDW6
-----END PGP SIGNATURE-----

--3710b5797a6b588603c65c66b2c301341f3ef2fc31ae6b731f7a44e0304f--

