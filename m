Return-Path: <linux-input+bounces-4197-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A18FFF1D
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 11:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8DD928688B
	for <lists+linux-input@lfdr.de>; Fri,  7 Jun 2024 09:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC7215B131;
	Fri,  7 Jun 2024 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bzKCedMX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBC3525D;
	Fri,  7 Jun 2024 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717751994; cv=none; b=bXGqTPH3PbBia9hCpqhBa430ik1METTCQpr5SezJt0xslbEN8z3RknfkbbwaRcO82TwQteJTsxWRwrYURo9z/GnWg1Kk7bl99FJOKcmq8GwK9s1B2nPkTCqYx58p1UwuzJjjAd7Gfxej6aHuRlcmqfQViwTJZ/ZrMBuSzttxXNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717751994; c=relaxed/simple;
	bh=1xgRUotaCgHquP4MwSoL0WEQhyxCOUipAIyH5fdf2Gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kidMgSadO7BEr7VGnMtkSpWRs6Ysqsrk4HzArDcHYnlX/L0W2AHkfDu2cwBxo+hi4OTHr7wIBdbTQJg37Ry2uAh17sY77L6Wk+IM6UF0nPzcWfsHeEGwLjsLvDnRmO4i+wJQLKsAQy1f56HEjdvLOvlo4h0swKzGTEOcfG4HrZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bzKCedMX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87990C2BBFC;
	Fri,  7 Jun 2024 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717751994;
	bh=1xgRUotaCgHquP4MwSoL0WEQhyxCOUipAIyH5fdf2Gs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bzKCedMXmGeiGeepYcjF08r1Z3qYSndyuPtGVjuzCHDjozZz+6Vh3i92+UzUm1OBO
	 erz1c+t4Wf63U3pw1EDDJuVy8NqdmyoU/o+8zPC/gX+EcHTT0yApFRPwSiJoU9AQW3
	 dJafK/+BMrx2P38R1SbSY6dH9PIAqIu5Mok7aFgGZVhQl3ytLTdKSDMtHFc4s4F2zM
	 KQ33s8wpiJ0fZ59h6oHvcsfpzmqTy4j/L+W17zRjbp1ZTf8ilksBjpB3K776DvBtAe
	 Tc89SlLxDhFoA71tYbFeVqVBVyUpkUjSbysR8/vTdjj08ZTNvNbceqwc9jvl7CBBA2
	 zWhKjKj6bghpA==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Benjamin Tissoires <bentiss@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Douglas Anderson <dianders@chromium.org>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240507144821.12275-1-johan+linaro@kernel.org>
References: <20240507144821.12275-1-johan+linaro@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] HID/arm64: dts: qcom: sc8280xp-x13s:
 fix touchscreen power on
Message-Id: <171775199124.3024895.440336395574423157.b4-ty@kernel.org>
Date: Fri, 07 Jun 2024 11:19:51 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4

On Tue, 07 May 2024 16:48:14 +0200, Johan Hovold wrote:
> The Elan eKTH5015M touch controller on the X13s requires a 300 ms delay
> before sending commands after having deasserted reset during power on.
> 
> This series switches the X13s devicetree to use the Elan specific
> binding so that the OS can determine the required power-on sequence and
> make sure that the controller is always detected during boot. [1]
> 
> [...]

Applied to hid/hid.git (for-6.10/upstream-fixes), thanks!

[1/7] dt-bindings: HID: i2c-hid: add dedicated Ilitek ILI2901 schema
      https://git.kernel.org/hid/hid/c/8d3ae46c6433
[2/7] dt-bindings: HID: i2c-hid: elan: add Elan eKTH5015M
      https://git.kernel.org/hid/hid/c/07fc16fa5552
[3/7] dt-bindings: HID: i2c-hid: elan: add 'no-reset-on-power-off' property
      https://git.kernel.org/hid/hid/c/e538d4b85b8f
[4/7] HID: i2c-hid: elan: fix reset suspend current leakage
      https://git.kernel.org/hid/hid/c/0eafc58f2194

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


