Return-Path: <linux-input+bounces-17163-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DCF4D38E2F
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 12:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3C7930198C6
	for <lists+linux-input@lfdr.de>; Sat, 17 Jan 2026 11:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED2F133344A;
	Sat, 17 Jan 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tt/MKc5q"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C1C30B535;
	Sat, 17 Jan 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768648972; cv=none; b=HakSQafsLRrPm/i0Dwz1RSxuOEWKvtskonP2KZWibLpyZJn+qJR2eyYxFamsI1+ilGQrMAAcOqKsDRhD54wdwnn7NLbHanZPEfDtYsnLxzacCZO20OgqyZ7N10EZjSrH/UwQ9b+2ZVdJ8amNWZgt9cDjL9qpni/CVO2nB+64Vuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768648972; c=relaxed/simple;
	bh=47+LO3HeHNrNN2XQTEfeD8WbyZHoVpGvL8YogN6GiuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLr4PgpuB7NYYS27s2sFplPNxCfreSNMjTXfqQKuS9U1Xtx2ZZuj8Zgy7AhO6rgAfnDm9UTgpxRBC4fxwo2IHD3UMlQjG/TpddcgagTSiqpP4KJh2lUQK+hLW+0YomKgMy2t4Q3C5b5V3/s4OrzDK4w4e35plytAxsU2yqRLr/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tt/MKc5q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01344C19421;
	Sat, 17 Jan 2026 11:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768648972;
	bh=47+LO3HeHNrNN2XQTEfeD8WbyZHoVpGvL8YogN6GiuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tt/MKc5q5H2JsgFauyq4o1HE6Y6sWYFpXTHg6jdSDi+I19GU2eIW+EE9DoE6XZkBn
	 wMUBZNoxsCQuttozmXYba9K/2yfWGuVc4XX+aAXWUBWaXSgOqgOOeLGy9NDsItG20r
	 7mYAWr3Nk4m/JYt+FGimyM3aCPcAeJtoGBEsmFN5lcnNW4mVC8/Ro4prtjpsfvults
	 IAhtSdJa3VDA0haKyRTcGcgKPF4mxh0bxAubQswTNH6vZnRSUVWACxG398nnRmFrNO
	 ji1F6C8+Nn9ctjXKFc3HvO+MJqBV5PmogadBysHAJzzqV9PWSdJMh+2kfosIREyZwm
	 QcipIDF1EmZHQ==
Date: Sat, 17 Jan 2026 12:22:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Frank Li <Frank.Li@nxp.com>, Job Noorman <job@noorman.info>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] Input: ili210x - convert to dev_err_probe()
Message-ID: <20260117-careful-nice-jackrabbit-cc417f@quoll>
References: <20260117001215.59272-1-marek.vasut+renesas@mailbox.org>
 <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260117001215.59272-2-marek.vasut+renesas@mailbox.org>

On Sat, Jan 17, 2026 at 01:12:03AM +0100, Marek Vasut wrote:
> Simplify error return handling, use dev_err_probe() where possible.
> No functional change.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


