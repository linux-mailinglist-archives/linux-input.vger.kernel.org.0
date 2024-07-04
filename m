Return-Path: <linux-input+bounces-4843-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF39927228
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 10:54:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 091791F2206A
	for <lists+linux-input@lfdr.de>; Thu,  4 Jul 2024 08:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31BA1A4F1F;
	Thu,  4 Jul 2024 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCEIivqD"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DAB1A4F1D;
	Thu,  4 Jul 2024 08:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083242; cv=none; b=s8bFq2s8M5931VQW11jpgNBsxhgTMkuZ44wQaHx5CVxAm6vMH3twiduUomXviVGQnn71Gn14jGTfd2/fCqQwAh9tFzHR84MNCgIg/HgRW/KNq7U9DrG8uKA/KVlZ9EL9O6h9XakvHvOEJOCF4HJcMHtY7AvEWg2ltfII/+fxANM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083242; c=relaxed/simple;
	bh=0L7KqZH0qN+sxBtauXN7w27g3chtAvU5R0FzrgjSgE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J7XQ5QrwUqgfjAkKmqNI2yRnxUb6KZwjwffqOZR1+FIsx66MkY81EjxgqRnDw08sGMJYFlydBase8D/l5Y/HwuYwzy4kXhr5EzFHf8AFaJKQqf/bpcz4WCvbIS9nOiFhUmtdE2u0mBQ0Az+6/UKkzbLMqzsz9Qe1w3s1CJAiOrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCEIivqD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A674C4AF0B;
	Thu,  4 Jul 2024 08:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720083242;
	bh=0L7KqZH0qN+sxBtauXN7w27g3chtAvU5R0FzrgjSgE8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OCEIivqDuc6sAxjXaW2+EXu2PoNVZPA+eaHbOr+OlnrQDfS/LI7JdoAFVjmb6BJ6P
	 se7B1TWFedkDH0/7kUL0NTnmYFY6+IxyXm2tqy7t8ohXJ1Q4QwPpqAJmkMfYnLw6GO
	 btlDCUPOfs2Zx4vsY0bH5ptiP+BqPizbNKm2PxhGk2qNdUV4VUm8PwCSun5cNB27o/
	 FNDtZqcSRcTzIzEVPEUapig9wdF/SBR5aX/DM9QFXYcKn6k9upL5NeAfEdnaFBWckk
	 6orpcptAvlIAkV86RmfyMbt7fIIosKbGsngKunTUj2xfu4wlwcfj0fQq8CElqd3a5i
	 6eUhAvmDKLnuw==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Jiri Kosina <jikos@kernel.org>, Aditya Garg <gargaditya08@live.com>
Cc: Orlando Chamberlain <orlandoch.dev@gmail.com>, 
 linux-input@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
In-Reply-To: <E1D444EA-7FD0-42DA-B198-50B0F03298FB@live.com>
References: <E1D444EA-7FD0-42DA-B198-50B0F03298FB@live.com>
Subject: Re: [PATCH v3] HID: apple: Add support for magic keyboard
 backlight on T2 Macs
Message-Id: <172008324081.1517774.10367638592868266446.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 10:54:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0

On Wed, 03 Jul 2024 17:54:11 +0000, Aditya Garg wrote:
> Unlike T2 Macs with Butterfly keyboard, who have their keyboard backlight
> on the USB device the T2 Macs with Magic keyboard have their backlight on
> the Touchbar backlight device (05ac:8102).
> 
> Support for Butterfly keyboards has already been added in 9018eacbe623
> ("HID: apple: Add support for keyboard backlight on certain T2 Macs.").
> This patch adds support for the Magic keyboards.
> 
> [...]

Applied to hid/hid.git (for-6.11/apple), thanks!

[1/1] HID: apple: Add support for magic keyboard backlight on T2 Macs
      https://git.kernel.org/hid/hid/c/394ba612f941

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


