Return-Path: <linux-input+bounces-15995-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7AC4C5F1
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 09:24:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 859ED18C1F66
	for <lists+linux-input@lfdr.de>; Tue, 11 Nov 2025 08:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D2D26738C;
	Tue, 11 Nov 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnA0gC/B"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE7223C4FD;
	Tue, 11 Nov 2025 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762849159; cv=none; b=d52kBnRQYx/25iOAUY8Oz/MXikOgzQbZrOeoAMy2O06eNWAN6cgAorVT3m5PqqRgi/AqVI7jF6zgAn3be7iC3TfjBAZajR63XLyDudaxGVS0H+35PaFfP5TkFGErF2WuD9EhRpJr8lCSFN4kdBbWUMV9HnA0LGpx4DnebbiDbds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762849159; c=relaxed/simple;
	bh=Drbywmxg9GWYk/JjVMjMbrxgl4SbkQlps/ChqVmfp5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFaS0vsorUQtdDppQS3sRYlnEjn0qnQgjPNw9rT4apQntxelzP+pMCiAjbyk4FPigp+X/4QqQofIBTuDshfQgDhqggpS+RdL2uKu6DY6lIxdJQAGATcQDdzqvsSabS5U6mHghZiIf6riQS0Wyp1EcAWazd5nM4tC6LjeKMT2xl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnA0gC/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF66C116B1;
	Tue, 11 Nov 2025 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762849159;
	bh=Drbywmxg9GWYk/JjVMjMbrxgl4SbkQlps/ChqVmfp5E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnA0gC/Bb2WGbILMjE9Z2tIzS0BQmjwFDJcJ6LRrjtqSD7AFEA99J7BWy8Nsleh1z
	 U7viSiWZYSw/fpKIENFpxka7FMINWR50BbRCn/7tk5drbGymxLHVEv0FmTbG6Lgshb
	 NDbsAQZ+LD388aWymy7ArHqCzAbu0xwvJIeBfX2Yjg5yB6yAzHiuW5CUXtghSHiV14
	 oPk6dsEt2w/qRzQdyyYFQYMxgyoRG409wZw9YDnisWq+cm3rYUhEaKr92718mndJKz
	 4/1TdPp6DfnZsuIjQulPEcviBQBSt9s2rw1O8Wd/4s5HT86CiKf5RwcMxIthFzNGJz
	 yutK8yf/DBnAA==
Date: Tue, 11 Nov 2025 09:19:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: daniel_peng@pegatron.corp-partner.google.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech
 FT8112
Message-ID: <20251111-stylish-impala-from-venus-9936d2@kuoka>
References: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251111143853.1.I76ee34ac45e1469dbeb11de0d1e47d794af7dc88@changeid>

On Tue, Nov 11, 2025 at 02:38:59PM +0800, daniel_peng@pegatron.corp-partner.google.com wrote:
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> 
> The FocalTech FT8112 touch screen chip same as Ilitek ili2901 controller
> has a reset gpio. The difference is that they have different
> post_gpio_reset_on_delay_ms.
> FocalTech FT8112 also uses 3.3V power supply.
> 
> Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>

You already sent this v1! And received review there.

Don't send duplicates. Instead version your patches properly and respond
to review at v1. Next patchset will be v3.

Anyway, this patch has the same issues as before, also bounced from your
own Google servers as spam.

You send it through Google, so at least you could be sure that Google
servers accept your own patches.

Best regards,
Krzysztof


