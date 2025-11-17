Return-Path: <linux-input+bounces-16162-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A53DC64F05
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 16:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 2667A28EAB
	for <lists+linux-input@lfdr.de>; Mon, 17 Nov 2025 15:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D630B27F010;
	Mon, 17 Nov 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGre4gJE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D17405A;
	Mon, 17 Nov 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763394421; cv=none; b=rsg+4qpeuWKzlhWO9LisoQCS5aHAuCo6CV48sByjdFc2g0dnLaHFh3S+L+koCZ1EN1ha6zks07BnNdDrEYuKW+YyVri1w3vB+jzUvhvQWEpqxUcDxIAut90w4JRdx70ja8qsr/sY5pPedV0lECgHPmbgIeHc6lxKBlmqzZfn3DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763394421; c=relaxed/simple;
	bh=v9g+IdI4PAz/7Ua9rmmO/qkJeIMbui4DhIkf9tqg18g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=npLNlo0i9f0A3b2ZGN6Y+LIJ2EYj+5Ryn/0IqbD75r81+gHjn8UkYZw79JXFQ5Ivdv99i66Y4CsRBapcFOZhnJy1tL931buQr04EVIjor3BFk40aSv6GHIdlbfVgwgc7lld3Ngdbx2C+WJmxGErrkQfWArGcnYmX0hQB/c8vY78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGre4gJE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B75C4CEF1;
	Mon, 17 Nov 2025 15:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763394421;
	bh=v9g+IdI4PAz/7Ua9rmmO/qkJeIMbui4DhIkf9tqg18g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hGre4gJEBpnUJKYX7BD3I8qYtq145r275WSwbhMsofE0APB0V7LyZFT28HyHOWjpF
	 vWBSUR0bZLUSNtesYaEjChk+5XlEhPrTjzfV8GZjOh1gABRWszte25/CL57ikkrUeQ
	 6WsAOj33Xzdds5pprxhY+94wPrjFbSHZlTQ27FgvLB6IPZxTwg3YoRCKz5tPCNp8AI
	 SrFOV8QDLnbiQbjX2jp7QdJxd1yffs9A3TCsrfyWzkcB2IMzy5CyUDYozjoY+N0oMd
	 XzMONBNtzB7avkPj5S3mw6w4yAhxNenJE5IOlt7VYrqLFq9SLjzyX/bP45hUFHW9Cz
	 lw9OWuX0zEI2g==
Date: Mon, 17 Nov 2025 09:46:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: daniel_peng@pegatron.corp-partner.google.com
Cc: LKML <linux-kernel@vger.kernel.org>, linux-input@vger.kernel.org,
	Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech
 FT8112
Message-ID: <176339441678.2237343.3650642092927839407.robh@kernel.org>
References: <20251117094041.300083-1-Daniel_Peng@pegatron.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117094041.300083-1-Daniel_Peng@pegatron.corp-partner.google.com>


On Mon, 17 Nov 2025 17:40:40 +0800, daniel_peng@pegatron.corp-partner.google.com wrote:
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> 
> Create new binding file for the FocalTech FT8112 due to
> new touchscreen chip. Confirm its compatible, reg for the
> device via vendor, and set the interrupt and reset gpio
> to map for Skywalker platform.
> FocalTech FT8112 also uses vcc33/vccio power supply.
> 
> Signed-off-by: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> ---
> 
> Changes in v6:
> - Remove the commit description for the incorrect section.
> 
>  .../bindings/input/focaltech,ft8112.yaml      | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/focaltech,ft8112.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


