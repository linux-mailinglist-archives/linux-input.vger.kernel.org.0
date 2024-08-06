Return-Path: <linux-input+bounces-5379-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08748948BD8
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 11:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81DEF1F24ABD
	for <lists+linux-input@lfdr.de>; Tue,  6 Aug 2024 09:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE76E1BD50E;
	Tue,  6 Aug 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM8UjgBW"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB0B1BDAB3;
	Tue,  6 Aug 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722934874; cv=none; b=FzanjS7eUNMgYFgb9bV395A/dy4F0tth1/bnPZ6bRmq0quhIVVN1EM9/DESljx8RGAKhXK45U6EqUBVdM0bsO1kX5nwySGo07+h+pjZU/eOgoWTWAdeKXYy0FhHR60cGvRM2XSlX9bXiuPsBTYQ2U6yVTNwbmp7zwTnzTy3LVwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722934874; c=relaxed/simple;
	bh=L0cMy7BX/xJ5GR4bUZhq4dRlhgNgDWoAwhPfqndFBYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B13CzycjJwDDJT08fCvv6X+XRttPX5+5xDjB+Pl6/VuHKOEcaKXLEC/Tz1Etpi5HqELF1bAbXmx4ywQ2QiKx6b1UzG+tJpK4are4OKKFnalZp98o1F3kUpydHGEbA4PHJvZd403d+dQt5T+TKhu7yQqttuZE7rGxeceIRUh/BM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM8UjgBW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B21E3C32786;
	Tue,  6 Aug 2024 09:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722934874;
	bh=L0cMy7BX/xJ5GR4bUZhq4dRlhgNgDWoAwhPfqndFBYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LM8UjgBWvS6ZTPyVQamwy+hBbWDmrC/+bH+wUC6ITRwpfUi01HDpXPAXOF9pPvefx
	 NxbYvSdY1EE8LSnf2s6q+hW3++Ft6hLYpLkhlbJIT2sgefaaoiVGFcI1DfRZYafbHS
	 pH4vuR1Ikv5I17OHgPGijB841Du3+LhPMGjMhjb2YRm27vORb0VW+9NJGT2XvNcXe1
	 0Zn38Ljsq6Gj3dWQVu28zHxHBWOGCfplxoV65TNGZQyNVOmR0in3M5kacKkvDSZd4H
	 umOShC9WlI8RKf5qWoLXPlIG8zLNhib38hR3PYx23xvkWv1w/5aEUAQ+irAZCEXr98
	 CTJpmA77MIyQA==
Message-ID: <bd4f6aca-ca3a-465e-8b46-e9c5e11ebad7@kernel.org>
Date: Tue, 6 Aug 2024 11:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/3] adp5588-keys: Support for dedicated gpio operation
To: utsav.agarwal@analog.com, Michael Hennerich
 <michael.hennerich@analog.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Arturs Artamonovs <arturs.artamonovs@analog.com>,
 Vasileios Bimpikas <vasileios.bimpikas@analog.com>,
 Oliver Gaskell <oliver.gaskell@analog.com>
References: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240806-adp5588_gpio_support-v9-0-4d6118b6d653@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/08/2024 10:48, Utsav Agarwal via B4 Relay wrote:
> Current state of the driver for the ADP5588/87 only allows partial
> I/O to be used as GPIO. This support was previously present as a
> separate gpio driver, which was dropped with the commit
> 5ddc896088b0 ("gpio: gpio-adp5588: drop the driver") since the
> functionality was deemed to have been merged with adp5588-keys.
> 
> This series of patches re-enables this support by allowing the driver to 
> relax the requirement for registering a keymap and enable pure GPIO 
> operation. 
> 
> Changelog
> ==========
> 
> V2: 
> 	-  Changed gpio_only from a local variable to a member of struct
> 	adp5588_kpad
> 	-  Removed condition from adp5588_probe() to skip adp5588_fw_parse() if 
> 	gpio-only specified. adp558_fw_parse() now handles and returns
> 	0 if gpio-only has been specified.
> 	-  Added a check in adp5588_fw_parse() to make sure keypad 
> 	properties(keypad,num-columns and keypad,num-rows) were not defined when 
> 	gpio-only specified
> 
> V3:
> 	-  Moved device_property_present() for reading "gpio-only" into 
> 	adp558_fw_parse()
> 	-  Added print statements in case of error
> 
> V4:
> 	- Added dt-bindings patch
> 
> Signed-off-by: Utsav Agarwal <utsav.agarwal@analog.com>
> ---
> V5:
> 	- Removed extra property "gpio-only", now pure gpio mode is
> 	  detected via the adbsence of keypad specific properties.
> 	- Added dependencies for keypad properties to preserve
> 	  the original requirements in case a pure gpio mode is not
> 	  being used.
> 	- Added additional description for why the "interrupts" property
> 	  was made optional
> 	- Rebased current work based on https://lore.kernel.org/linux-input/ZoLt_qBCQS-tG8Ar@google.com/
> - Link to v4: https://lore.kernel.org/r/20240701-adp5588_gpio_support-v4-0-44bba0445e90@analog.com
> 
> ---
> Changes in v9:

That's some mess in changelog... v1, v2... v5, v9, v8, v7?


> 	- Added dt-binding dependency for interrupt-controller. Now if
> 	  interrupt-controller is specified, interrupts must be
> 	  provided.

So that's the reason of skipping tag?

Best regards,
Krzysztof


