Return-Path: <linux-input+bounces-15731-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E5AC0BDDA
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 06:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A92D4E4CB1
	for <lists+linux-input@lfdr.de>; Mon, 27 Oct 2025 05:50:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EBC22D5410;
	Mon, 27 Oct 2025 05:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="ieFUi6qf"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9CD23815D;
	Mon, 27 Oct 2025 05:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761544237; cv=none; b=HY2vSWTRqyQGu9TwqgvxgqgUiKZpb7N7ryzDzXJDdQxcJQ3x7whdLpbczJr0zUB2RbOKPQqt5cJf921RQTXh0WGbPSgL2EKBflzuqXvrn/DIe9hbawB6Tvt4TOj8XVpnJ3xCWhvftgN5wG+ZGIwi+oBlHaABQPSdIGjk0MBa7Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761544237; c=relaxed/simple;
	bh=jj6TUKRc2Zhhkk/TNhdEP82UUqNHf9SsCbz2XFWwVEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elMC2nZVQZooB43q1adOV0cxWi4oPEt9Nv1DIxRvc9t2+LLsebFEUVNFoarb34sywwiTA9PYIq22jMl/IGljv7UQd9onPfaiRkrDl5SjMCeyhblfTRftYDtUZlpMH+zdLXGxaleRvvJecnkpx2hZJBpr72s3T1P1ckmsDthZrWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=ieFUi6qf; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Yg0FFRl/qGtRj9XiWzK/4Q+GPjug6uMG9wysYCk6HcI=;
	b=ieFUi6qfFZKD3s5vEx7O8IUYcToJJdVhQv7JWlCfACOeupTDn6ubewIqfz66tv
	xfPvfpqwbsLF/mpTE7va1/repVHmloVmpM7TXZGuwKdYoUrkX0e6xM94taLHbobe
	gIosuLXSOiZNkW42LQUpUNaXuhuXQFC0YMfYu47VL48RI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDX_1kMCP9oRjq+AA--.29602S3;
	Mon, 27 Oct 2025 13:50:06 +0800 (CST)
Date: Mon, 27 Oct 2025 13:50:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Kurz <akurz@blala.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx53: enable PMIC RTC on imx53-qsrb
Message-ID: <aP8IDGBw1iapJn2U@dragon>
References: <20251011060251.13356-1-akurz@blala.de>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251011060251.13356-1-akurz@blala.de>
X-CM-TRANSID:Ms8vCgDX_1kMCP9oRjq+AA--.29602S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUra9aUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIA4fhGj-CA490wAA3K

On Sat, Oct 11, 2025 at 06:02:51AM +0000, Alexander Kurz wrote:
> The RTC inside mc34708 is supported by RTC_DRV_MC13XXX since v3.6-rc1.
> Enable the PMIC RTC on the imx53-qsrb. Without a battery the RTC may be
> powered via the micro-USB connector when main 5V power is not available.
> 
> Signed-off-by: Alexander Kurz <akurz@blala.de>

Applied, thanks!


