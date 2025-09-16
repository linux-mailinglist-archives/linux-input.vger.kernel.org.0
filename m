Return-Path: <linux-input+bounces-14766-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9ECB59ABD
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 16:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A67116541A
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 14:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBDD32274B;
	Tue, 16 Sep 2025 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wi6UcF92"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225D628C84F;
	Tue, 16 Sep 2025 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758033878; cv=none; b=nlSxWfxdKXN5SPOJzL/C/1VW9G5FJPklVBPi4IOZ+Egwr1935eojWavk2LLaBoG/eBdGZc2zKl6pjtsXWsvm57OB82VQWVguK0LRouyeTnEXrHbk2Uq5HZoGdK/SXBoWuR4NauH9yqGFBaDCSmHLuLEi74WCrru+/Sr/Z8GBB7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758033878; c=relaxed/simple;
	bh=iiC4tjJJx28eT4BRKfnKA87RDzNV9kDWK6nujCe9XzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s6SLqfdB1RkWeaC9N+6shHOGfqdnOfSnPZj08FJV05YcnHQaJbeI1Mtjzf9rQHLGJu050XVY+Zlf1A+CT3NW27q8JWqCiVrhO2g8egA7/ZTckKlW8MNabC5piN47v8xNCu/OYRXfuadocYvRyJOSK5gXqpDp5Lz2GZP274y77+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wi6UcF92; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7ABC4CEEB;
	Tue, 16 Sep 2025 14:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758033878;
	bh=iiC4tjJJx28eT4BRKfnKA87RDzNV9kDWK6nujCe9XzA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wi6UcF92OMC9qqPeGB2uaxqq0YPYtn+E4w6mS0m4xMOABcfBZphJvoQnWPFfDrNNq
	 G4fGDX+dDAi2QI4EvYoqbFDPy/9NBVVC3/NKJ3QIv8rtZRW7dFM0o7MU8I3EDTf9aS
	 ch7DMf/DfmmTQ0k3mYP+ZjFcyGy15enN/yWyZCEt+VJPaO52kQeyyzEQ9ceDPV5w/Y
	 vFJbdyv/o8zrMBfaZDgsn6d6LgzC7bxRwpYYxdltqdEaAzDNqm9UsqMDiP8xMEa+uE
	 QOfAf5jVB1FeQhgWwBlA7NVcq58sVaYqZcMlvfrk72DotRdn6lO2gcof1emMZALfBh
	 Ty0yIzpZSYdLA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 "Dr. David Alan Gilbert" <linux@treblig.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 devicetree@vger.kernel.org, linux-input@vger.kernel.org, 
 Alexander Kurz <akurz@blala.de>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20250914193723.10544-5-akurz@blala.de>
References: <20250914193723.10544-5-akurz@blala.de>
Subject: Re: (subset) [PATCH v4 4/8] mfd: mc13xxx: Use devm_mfd_add_devices
 and devm_regmap_add_irq_chip
Message-Id: <175803387512.3840128.4666901728831953125.b4-ty@kernel.org>
Date: Tue, 16 Sep 2025 15:44:35 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sun, 14 Sep 2025 19:37:19 +0000, Alexander Kurz wrote:
> Use devm_mfd_add_devices() for adding MFD child devices and
> devm_regmap_add_irq_chip() for IRQ chip registration.
> 
> This reduces the amount of required cleanup.
> 
> 

Applied, thanks!

[4/8] mfd: mc13xxx: Use devm_mfd_add_devices and devm_regmap_add_irq_chip
      commit: c5f395868781099e54a220bd5d6dc60c698c8c72

--
Lee Jones [李琼斯]


