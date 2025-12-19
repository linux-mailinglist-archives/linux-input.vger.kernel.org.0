Return-Path: <linux-input+bounces-16637-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FEBCD000E
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 14:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9763530C801E
	for <lists+linux-input@lfdr.de>; Fri, 19 Dec 2025 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAC9329C4C;
	Fri, 19 Dec 2025 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CVW5cSu/"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FFC32939C;
	Fri, 19 Dec 2025 13:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766149562; cv=none; b=aOxWbUhmDf8xq/SFMg220H1Q8rp53cPhulJSoKemlM0fKWrpwpxIFxmvXiCR0sb1D+bCAvkbN8DUonYCbYrlh2Mva8cgFl090rEUmA6y2hPkHAT3HNOySPtaQuD//a2HYpmdJarYS51+D87L8q/BJ1MDTS1HfOKL8BRDqH3YPs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766149562; c=relaxed/simple;
	bh=dxz0eYv3kynzveeZpS4F9f4011GYmOWoqT8vtLlCW0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IN9WIlrvw/K24xBue2QeEgZBkVSAxLkJHSYngMu+oZ5GLC2nI3qIBclCdT982qomoIlnUaS5yLG16XIV7P5IB83y6VCC1WGoiLytgy7+8/yZnQH+ffapZGyY3wHjJmaBXhGJ2gBpANaAVpOmj4RqySFXmPZUgVSCQwrebkm8Q3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CVW5cSu/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D761C116C6;
	Fri, 19 Dec 2025 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766149561;
	bh=dxz0eYv3kynzveeZpS4F9f4011GYmOWoqT8vtLlCW0M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=CVW5cSu/WD5QGrt7C+a0jl+2O9dYND8MA2Gr5Hy27MkT7WNypoBYIb/ksFIPWHDRu
	 Gh70pjGWxoRaqa+jg+zD+/joiqEA6mkdHVSgeoHSlWjpoPhk+BAvCdu0lW7ss2d4rL
	 QGtKnnMisjqxiWH5IJe9Z8KoWIEA3nbPYBBb39wS9DZ4qM6/ihzZonXcIvYwBNJLal
	 6VBWtkzaNYSXLom4JZ3Tz7uT9xtWpnqbq6V9myNzrXeqzDl3hzP1pbyUpbpoRxFUA8
	 bk5ExbhHe4UAPtBXESRyI5BYJAhzovUqGjQeZiJhPpa2Mnpt2tUOogWM5oecZaMfWX
	 VijgaFhX/9PBQ==
From: Benjamin Tissoires <bentiss@kernel.org>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Even Xu <even.xu@intel.com>, Xinpeng Sun <xinpeng.sun@intel.com>, 
 Jiri Kosina <jikos@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251203165651.69215-2-fourier.thomas@gmail.com>
References: <20251203165651.69215-2-fourier.thomas@gmail.com>
Subject: Re: [PATCH] HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg()
 nents value
Message-Id: <176614955981.1654761.17681072325881573574.b4-ty@kernel.org>
Date: Fri, 19 Dec 2025 14:05:59 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev

On Wed, 03 Dec 2025 17:56:35 +0100, Thomas Fourier wrote:
> The `dma_unmap_sg()` functions should be called with the same nents as the
> `dma_map_sg()`, not the value the map function returned.
> 
> Save the number of entries in struct thc_dma_configuration.
> 
> 

Applied to hid/hid.git (for-6.19/upstream-fixes), thanks!

[1/1] HID: Intel-thc-hid: Intel-thc: fix dma_unmap_sg() nents value
      https://git.kernel.org/hid/hid/c/0e13150c1a13

Cheers,
-- 
Benjamin Tissoires <bentiss@kernel.org>


