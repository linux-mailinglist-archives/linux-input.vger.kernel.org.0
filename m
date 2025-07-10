Return-Path: <linux-input+bounces-13458-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95B7AFFEBE
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 12:07:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DDAC7B7E4D
	for <lists+linux-input@lfdr.de>; Thu, 10 Jul 2025 10:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365922D5436;
	Thu, 10 Jul 2025 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TIR/tVOF"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D02D542E;
	Thu, 10 Jul 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142044; cv=none; b=T8dUogwxbvzmnYSk6EMywqcrP+ELwTi7D+KIiXBwKPygiaOw60CBA8Af86cM7uFjA3tUZ9Raulr0YEKRTBWRv+hexPK9yZo7qAwjY82yQR1+hrcJcOcBHWeZWP+2qrCb0hXi4oXA7aajjx13/VPcqtena1hzruWrZhZ+cOnnxI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142044; c=relaxed/simple;
	bh=768rJ19T6qTWhnPt9HLiVkRdCPkgqm4cUEhdjbSkZJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XDUXxyTR/xlcRyg7sKME8PYFobVYETMgx9M9zeZ61O6+Zg4MM8DB5QFPAvZks8oxVVQ+NGzD9I9nfSFlF6UyHB+i/6A4K7Kd+J75+J0jJgGzoRKuNrmUD5swm0PH50MMyHzFlUUf0SwTY7JsIOlXQZS9wU10o30zpyaGF1/sAeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TIR/tVOF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D4BC4CEE3;
	Thu, 10 Jul 2025 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752142043;
	bh=768rJ19T6qTWhnPt9HLiVkRdCPkgqm4cUEhdjbSkZJ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TIR/tVOFU9e6yyzEaGt9sIpXPFFK8dmqXcjZR5Ptg2gmA8/umjn/JKnrAHZRyOmv3
	 uiCdADNWAx/SYNL1uWasE/p44yqXQ+rcg2tG/muN7jBigzlDoFPMM/V9THi3jATR/w
	 sR7ryACMm8olTzjJzOYR4oCjrpbdCvEtRKp0kh/srU4SlF5sLc+Yv9dmDynclz9LnB
	 kF1mm1NYaZMJ3lxvxEZk8Mjne0nH5vrF9UxhYlxChz1gPWw+4w33XeOjpazw17W4yN
	 okDkhhQQwAFLT1ccpVsDU9cKLEFF3tfjBFGEpaZOwTLjcQgI7beF4/Vj4Cf3rg/KVD
	 Z1PZDYPHQCyqQ==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20250710094120.753358-1-andriy.shevchenko@linux.intel.com>
References: <20250710094120.753358-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] HID: debug: Remove duplicate entry (BTN_WHEEL)
Message-Id: <175214204240.728686.14468996712698294332.b4-ty@kernel.org>
Date: Thu, 10 Jul 2025 12:07:22 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Thu, 10 Jul 2025 12:41:20 +0300, Andy Shevchenko wrote:
> BTN_WHEEL is duplicated (by value) and compiler is not happy about that:
> 
> drivers/hid/hid-debug.c:3302:16: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
>  3302 |         [BTN_WHEEL] = "BtnWheel",               [KEY_OK] = "Ok",
>       |                       ^~~~~~~~~~
> drivers/hid/hid-debug.c:3301:20: note: previous initialization is here
>  3301 |         [BTN_GEAR_DOWN] = "BtnGearDown",        [BTN_GEAR_UP] = "BtnGearUp",
>       |                           ^~~~~~~~~~~~~
> 
> [...]

Applied to hid/hid.git (for-6.16/upstream-fixes), thanks!

[1/1] HID: debug: Remove duplicate entry (BTN_WHEEL)
      https://git.kernel.org/hid/hid/c/04515e08bca9

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


