Return-Path: <linux-input+bounces-8039-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB59C608B
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 19:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 499E9B883ED
	for <lists+linux-input@lfdr.de>; Tue, 12 Nov 2024 16:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB0420697B;
	Tue, 12 Nov 2024 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzbeRQeI"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D41D20696C;
	Tue, 12 Nov 2024 16:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731429044; cv=none; b=qa57YNbSv+uiIqnEoB13x+VH9ZiVD46bzpsDqWUlJngUrgCKqKn9fHreA7BQfqF2IdDfzU2iQ2wb8ol+SB4Cqh2beEtio3vF7payPF8WJdzgPKvIUw6K2CMtH1TZ3oymHTt3fLW6B9/LKMfiDq72nG3pRUPoocgzEs9jXwT7Fqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731429044; c=relaxed/simple;
	bh=37P9O3XtdbmUnbGRnOEqrSvRRvU7POKBc/lJtl/mn+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cw9Q2gWOn1HGfo4kJ3pn5923sbY37lwG5BJBo7rhK/l9EXhwh240cQ13Y2dCAnYH1M+ndRGJVM1/Kr3F5ojCX4J2dyzpI3EEK+loHEWxvoT850vtWSgACVaE6MGKD/+ZCYW+S1uJADQvJpp4w7TSl183O71Ba51MvO6h//bSgi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pzbeRQeI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D648EC4CECD;
	Tue, 12 Nov 2024 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731429044;
	bh=37P9O3XtdbmUnbGRnOEqrSvRRvU7POKBc/lJtl/mn+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzbeRQeIIVrKa1QTaxM4CGmf/XfE0msaStpurCxhdtLXweEcQbYeTQMCO1IM4ujmO
	 3CjW6kpNLP9ECDa62po6x2GnKzM0zDEFcAuNWCN/68hdHIvmoNpvaL9oAyEBaY4OMi
	 om9o3hzyESD+l+pymjwT6F7oHTSnv20oEgE9ovGBdhTKY+U4aiQBJ1FJ9JdlmHLjbz
	 W9JueGe4vN5akYOM7Gh+GlxjGBlZ8IauPl38He1hYzeMwvVLNt/N/1ayham4h1NJJB
	 BjR3tgHQBvGr324RC3QcOn3RUeuRBxKlfJpLLWre9gU8mJQivabR1cO1G7kq3WblJV
	 bPfkoQMlNjVIg==
Date: Tue, 12 Nov 2024 10:30:42 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Charles Wang <charles.goodix@gmail.com>
Cc: hbarnor@chromium.org, bentiss@kernel.org, linux-input@vger.kernel.org,
	krzk@kernel.org, dianders@chromium.org, jikos@kernel.org,
	linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
	devicetree@vger.kernel.org, conor.dooley@microchip.com
Subject: Re: [PATCH v4 1/2] dt-bindings: input: Goodix GT7986U SPI HID
 Touchscreen
Message-ID: <173142904157.1142372.532971891848128579.robh@kernel.org>
References: <20241111075000.111509-1-charles.goodix@gmail.com>
 <20241111075000.111509-2-charles.goodix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111075000.111509-2-charles.goodix@gmail.com>


On Mon, 11 Nov 2024 15:49:59 +0800, Charles Wang wrote:
> The Goodix GT7986U touch controller report touch data according to the
> HID protocol through the SPI bus. However, it is incompatible with
> Microsoft's HID-over-SPI protocol.
> 
> NOTE: these bindings are distinct from the bindings used with the
> GT7986U when the chip is running I2C firmware. For some background,
> see discussion on the mailing lists in the thread:
> 
> https://lore.kernel.org/r/20241018020815.3098263-2-charles.goodix@gmail.com
> 
> Signed-off-by: Charles Wang <charles.goodix@gmail.com>
> ---
>  .../bindings/input/goodix,gt7986u-spifw.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/goodix,gt7986u-spifw.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


