Return-Path: <linux-input+bounces-17121-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C545FD26675
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 18:29:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2944B308208F
	for <lists+linux-input@lfdr.de>; Thu, 15 Jan 2026 17:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372473BF2FE;
	Thu, 15 Jan 2026 17:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTQ2sLTP"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E1F3A7F5D;
	Thu, 15 Jan 2026 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497292; cv=none; b=OhYaw/WKJqDEFpPVT2H8MuuS7cPS9EZ7hpQUpO7iEPqDjvtNR4crSUE0VqlKafV9c0xYolpOiMyMMcenMlII+6V/Pb3DQgdkbUhE+GbzARyGgN89QwlQj/yp8bcC50hwIAajBT7MMfkljqQcOoXLsmP17DUxUXxCS8/4quV/vK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497292; c=relaxed/simple;
	bh=SqIaAV3Bl2HGes6A5ndqKbz0ZJAsXcilfEpOOHvfmoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btt3ZbFGava3dbtz5+3R08iL6r1miPuYLQ663q9I1SAX8CerH8/9rnpggnXYpN9UXHBlJG1DHp5mMHUB+0Z6qapsOS/hLO1hXsHFjUvuSOVWoTzli86r2xm57MHtGSwE4d0/xdV1HHZhQrUV1IaQ2a91rVgM9zajw0OYYThIo+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTQ2sLTP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE5D0C116D0;
	Thu, 15 Jan 2026 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768497291;
	bh=SqIaAV3Bl2HGes6A5ndqKbz0ZJAsXcilfEpOOHvfmoQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WTQ2sLTPc1wSvT4l8JQ1GWoBmIzcrFl6aOP3u8Gg+pyZYNmyHAN0MGYSEkGHHSunW
	 I1x2KwRUyaybJDSol9H3YeXHJXIlUhli8K9cDOV+61Aawkpav44E33255CwwndfVuQ
	 dgWNG2io51Eo7+wb2B7qJuq+U45G4QURBdPK17VqBxF/eOjTqF2KQEgYencpstxn0y
	 wZNr46o66IDkUGtvjaDiOle8fuC/Rz0ey0KpR2Dg9rhqPVISILBergBKU/9PbdAWjE
	 l1yUOdkEWkte74MBeX4I2ay0je/6RwuoSquxCaW0VW7otHflJyD1ZTANuhk4pHZLQj
	 G2ckx/8wPV2ZA==
Date: Thu, 15 Jan 2026 11:14:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Joel Selvaraj <foss@joelselvaraj.com>, linux-kernel@vger.kernel.org,
	Jens Reidel <adrian@mainlining.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	kernel@dh-electronics.com
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: edt-ft5x06: Drop
 'interrupts' requirement
Message-ID: <176849729021.904850.15924382838002274823.robh@kernel.org>
References: <20260109035149.1341931-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109035149.1341931-1-marex@nabladev.com>


On Fri, 09 Jan 2026 04:51:44 +0100, Marek Vasut wrote:
> The interrupts property is optional, since at least the Linux kernel driver
> supports also polling mode. Drop the interrupts property requirement.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Jens Reidel <adrian@mainlining.org>
> Cc: Joel Selvaraj <foss@joelselvaraj.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-input@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  .../devicetree/bindings/input/touchscreen/edt-ft5x06.yaml        | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


