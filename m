Return-Path: <linux-input+bounces-13151-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A72AEC1BB
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 23:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 293AB647CCB
	for <lists+linux-input@lfdr.de>; Fri, 27 Jun 2025 21:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A86162EE270;
	Fri, 27 Jun 2025 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lv0HznvV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775232ED15B;
	Fri, 27 Jun 2025 21:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751058449; cv=none; b=bA+drWgk03xnI4RMs3On/mXQElNwipSmRASd1DTmWrWqGRpvyVRaKSB/kjv6GdeFVQiUnX63V4/u7TUS4Vne4jKzvDsEwCaQ+htauqT9rayVf3lW/h4y35FdCWjx+brPfOgNqbX8WuQSkAyG/nB6kzdzZ2hqSn4AL0RBL2gFPW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751058449; c=relaxed/simple;
	bh=HoAKHVnVB3TJzjVLPcNtHz4b5bTjyeWIfqzTIsuT44c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwHx97t9xZcsPqs22WNWcB1JzVuAMJU4YBlMRCi8xIo+zwertMNc+gIG2lEMk7RvXLcPU8T0ZgaSCD4vBTIZP6NBsGKg7Ruu+mSr+5DOYA3vlBZsM/SyzNwacZTQp8T9cLDjC3+7jOQylQcP5iC3QHAaYwPtdFtZ7hNYP0MN8oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lv0HznvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEA0C4CEE3;
	Fri, 27 Jun 2025 21:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751058449;
	bh=HoAKHVnVB3TJzjVLPcNtHz4b5bTjyeWIfqzTIsuT44c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lv0HznvV+eTyOUirCFk2xwJYwCCGDB+GLUnfF/Z6DyyQheCpor//kTA5vQYBlGGKQ
	 PlJnL/UH+RLwVFeq02Kd3ywr/U+dGpLt1M2IKhRmvF2w7Q/7XCOkmdBj9LUtfasdV3
	 qggy2QQ9+J81KdZ88zRSmYClCFP8Ix2Db/7PAbsWQ6kX+7LRi1pVHsrHU7pJBDI8FF
	 vzLcGqOPD9El6+behuhnvWMmxw0r3VubfnJmJ7Tc+/lE3KcpOWQ10A1+0kIhT+Qiru
	 4PNqvzjI3S2TAR5GBEF14REjZhA5nqjPmKB4Kq1ehzPlKSPQA+CQ9U4imzK+kTXzVj
	 cxdcQtj67xQPw==
Date: Fri, 27 Jun 2025 16:07:28 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
Message-ID: <175105844804.146874.1572190783775455795.robh@kernel.org>
References: <20250625163431.2543597-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625163431.2543597-1-Frank.Li@nxp.com>


On Wed, 25 Jun 2025 12:34:28 -0400, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> ---
>  .../input/touchscreen/lpc32xx-tsc.txt         | 16 -------
>  .../input/touchscreen/nxp,lpc3220-tsc.yaml    | 43 +++++++++++++++++++
>  2 files changed, 43 insertions(+), 16 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/lpc32xx-tsc.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/nxp,lpc3220-tsc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


