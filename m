Return-Path: <linux-input+bounces-3911-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D32BF8D20A3
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 17:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CEC1B227D5
	for <lists+linux-input@lfdr.de>; Tue, 28 May 2024 15:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2341171641;
	Tue, 28 May 2024 15:42:12 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29E216C456;
	Tue, 28 May 2024 15:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716910932; cv=none; b=IMHSxStX6L4rSq0H94WFMsTWf1RywlsPc+DV5Fz39m75uOtF6DaNyGtFXyXu3ekU5Fns09YKwOP9NyHTkQ+ABzMR7OuRfQlLfkKsn1mVkSSxyQCw4JS2B5lFAttseM+acB5tAIRB2FBMlJD0iFl5hZX/nIODSsV97zC9x4Nui6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716910932; c=relaxed/simple;
	bh=bfpy5G4RtMHHpcTdRExNjKl9hXkG8+T/fn5rO7ns+Q8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hXvTcN41/H4E3N+f9k0CXKgeLDz1Rh7N0GnKFwmMYKAl9d3UynebPre3bheDBdreVp+2w5xQDubHgujmW1/hZFIpQSBN4QgQxOOuWEHVSi4e4Uy8Ctl+sRiThS8tCZuk8EGyLUNHR99mBVy4PC9zBtvMCC8MJVc+CJMikPhN8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F38CC32786;
	Tue, 28 May 2024 15:42:12 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id C77175FA0C;
	Tue, 28 May 2024 23:42:09 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Hans de Goede <hdegoede@redhat.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 James McGregor <jamcgregor@protonmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20240426092924.15489-1-jamcgregor@protonmail.com>
References: <20240426092924.15489-1-jamcgregor@protonmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: allwinner: H616: Add LRADC
Message-Id: <171691092979.680152.13758975851829859883.b4-ty@csie.org>
Date: Tue, 28 May 2024 23:42:09 +0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Fri, 26 Apr 2024 09:29:37 +0000, James McGregor wrote:
> Version 2 moves the LRADC DT node to the right place. It was out of
> order before.
> 
> The Allwinner H616 series of SoCs have a low-rate ADC (LRADC) with
> 6-bit resolution and one input channel. They're compatible with the
> existing drivers, so it only needs to be enabled in the DT.
> 
> [...]

Applied to sunxi/dt-for-6.11 in sunxi/linux.git, thanks!

[1/2] dt-bindings: input: sun4i-lradc-keys: Add H616 compatible
      https://git.kernel.org/sunxi/linux/c/3086803a1f43
[2/2] ARM: dts: sun50i: Add LRADC node
      https://git.kernel.org/sunxi/linux/c/7adc2d68f4a6

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>


