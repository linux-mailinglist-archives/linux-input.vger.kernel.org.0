Return-Path: <linux-input+bounces-16613-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4A2CC7C25
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 14:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CDF0304BC42
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 13:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F5D34FF74;
	Wed, 17 Dec 2025 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="foeIRv8T"
X-Original-To: linux-input@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0038034C811;
	Wed, 17 Dec 2025 12:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765976298; cv=pass; b=BuHTFhDwXKUCgZXcTB1KnXD/LPm5On60kgNygq90C0fJaLLbaIIe0PZLxuMFx7vkxeANph2bUgcZaIo6dhfrVhblEBr4dtJgsdwSD0lg+YXSlGMzzVaXZd7aoidySVyzTIa271Ddfk51HvyP4YtUJcVeAvm3k5mgYhE0zCW22VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765976298; c=relaxed/simple;
	bh=LrvfmBmzDcA3GwDRV7f9xZnGQTMmRHRy9Ho1m8R+Wok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jK3fjvsbL8uNg4Q1wQyEUelBsfCitirmz9RtW47z2w24/BtkZncRmCwSinyJi+GHLTVjFaaePNkM9sbs5HxSm7JhCe3OHAFFExZ5qRpeYk5h6hvxy7NO6NY2W/TzXmZF9xBYvg1c/aWg/ogWiJ1TjJZj2k56ej24HPc5eSsoAf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=foeIRv8T; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765976272; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FoqdNb4g5Gtkd8jGGwm/maHLrre5WN7i25q/udEcMHPG48TC9bLlCuMRzI/R2OL3+rZ5wyKhHhUFtGYvFGHyO7iOVxPzUsmzICdTrehXVXBXpZwAhTbhMad58FSf8ph3Bz/MCwLEsuNAGxWP8a6P7SFuBa/i9PVoaKWyF9m+u7Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765976272; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LrvfmBmzDcA3GwDRV7f9xZnGQTMmRHRy9Ho1m8R+Wok=; 
	b=eh9MgmX/bEjXh147aGbIug8Y9zOvoJ6XmSyCwjAocNyXKnExbeCLAO4y7axvDxOwHbLzV1/iK57cBwhIJFU5mBUo1VpdlrXK1PlMiyxSi/ZnbGjMy9nwanRPOh506t0BoGAc+xxaq+GVaKVFIcpUNpk4WEX/CsfNeoxDcz3fwos=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765976272;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=LrvfmBmzDcA3GwDRV7f9xZnGQTMmRHRy9Ho1m8R+Wok=;
	b=foeIRv8TCls/G5ux4frn10VOXe7im29PLKscuAUx8H/eXtXbu12qaJwIrkzY+Bw8
	SK5/4DflcoPyCMD0aCdHI8guUqFPK2B1uCoirliEZxH8z1JCp4A+T9DcnN3RlGPnVzt
	iTidSd6zWY1Ti8lK+kar6VvLQCR3nLR4mS7Dc/lI=
Received: by mx.zohomail.com with SMTPS id 1765976271997185.16439333799497;
	Wed, 17 Dec 2025 04:57:51 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject:
 Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow linux,input-type
 property
Date: Wed, 17 Dec 2025 13:57:46 +0100
Message-ID: <6778765.lOV4Wx5bFT@workhorse>
In-Reply-To: <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
References:
 <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
 <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 17 December 2025 09:31:15 Central European Standard Time Krzy=
sztof Kozlowski wrote:
> On Mon, Dec 15, 2025 at 01:29:29PM +0100, Nicolas Frattaroli wrote:
> > adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> > property. This makes it impossible to model devices that have ADC inputs
> > that should generate switch events.
>=20
> The solution is to use unevaluatedProps instead, which also allows
> dropping other properties.
>=20
> Best regards,
> Krzysztof
>=20
>=20

Hi Krzysztof,

to understand the motivation behind this suggestion correctly:
are the "linux," vendor prefixed properties, especially with regards
to key codes, generally a bit of a thorn in the side of DT bindings
maintainers?

I'd imagine so since they technically tie the DT to a specific OS
kernel (though of course, others are free to translate those key
codes). And the whole idea of configuring which code is emitted
from something is basically abusing DT for configuring software
rather than describing hardware.

I'm mainly interested because this is a thought that has been in
the back of my mind for a while now, and I'm curious if the DT
binding maintainers happen to have arrived at the same impass=C3=A9,
where linux,input-type et al abuse the DT model for something we
would tell any other vendor not to abuse it for, but no better
solution exists right now to achieve the same thing.

Kind regards,
Nicolas Frattaroli




