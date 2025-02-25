Return-Path: <linux-input+bounces-10351-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B35DA4456B
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 17:06:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6A89863627
	for <lists+linux-input@lfdr.de>; Tue, 25 Feb 2025 16:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64E0189B9C;
	Tue, 25 Feb 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t00Pzmwv"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CD186E2F;
	Tue, 25 Feb 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740499524; cv=none; b=DzraU2wjfRq2nabLamC228eYsYk7ub1x5vkR1dSa4JoNzn35VS75JU1DT7axP07WjAVKENp/B9wMrIBqsB2Ca8U9UGk7Hh5qNrUcjr/J/w7rSWA20sR8v5rNbgzOcLedlo02VR7imzPbG1w7mjYiT6+K/ulEDQ5pQtDPgiGu42A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740499524; c=relaxed/simple;
	bh=cFi9U2kTnzP+grVkXJv06JPxyOEcEWtyZx/m6rp9CB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzW2pZMVVCBia94SC9wLwAdz6rSPZElYeHnNJjzlROkjFScEEM6mqrJ36tpjpCUzOrJHK6oWU3WsM6e2Sy2xK8lcFCkQfwGJEIUgLfExuWsDCA44tgDg1wMLOxNzD5rTFRVoinvMBzkPGkSzEXp4LamW7wAOR6CF9NSMoRF8RHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t00Pzmwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F83C4CEE6;
	Tue, 25 Feb 2025 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740499523;
	bh=cFi9U2kTnzP+grVkXJv06JPxyOEcEWtyZx/m6rp9CB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t00PzmwvglZ4g/SQQLkqQQGCCVIYyxZWpDWqpSB5s+QK/VSaKclPS1UrdZgXJZAz3
	 uSDoyZDWTgMncBW9cYeoVUhmtgnr7xgM9wCdlysnqTWWH1Q/RDsg8X8nUs7f3sS8sd
	 Zhs/UAPEzFlO4x/iZ+iipXFFG/mrFN9Pwqv5qHPRYXbQsc3tSStHnORRG87LkY+QW+
	 UW35Tww/NRD97ZpOYH0HAD5FKx0E9P9EpG024fIpLTlv39B299cYgfUOP//RMggHWR
	 fvsPR3KRWiYaU1eS44ejV5W8cR/6wWBPwVMQgrO6QoIriiHDAk4J04nPnWE1Y00Z/x
	 Sml7t+ldFep0Q==
Date: Tue, 25 Feb 2025 10:05:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andras Sebok <sebokandris2009@gmail.com>
Cc: krzk+dt@kernel.org, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com, markuss.broks@gmail.com,
	conor+dt@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: input/touchscreen: imagis: add
 compatible for ist3038h
Message-ID: <174049952156.2586588.3267651143072217754.robh@kernel.org>
References: <20250225084914.81715-1-sebokandris2009@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225084914.81715-1-sebokandris2009@gmail.com>


On Tue, 25 Feb 2025 09:47:00 +0100, Andras Sebok wrote:
> IST3038H is a touchscreen IC which seems mostly compatible with IST3038C
> except that it reports a different chip ID value.
> 
> Signed-off-by: Andras Sebok <sebokandris2009@gmail.com>
> Link: https://lore.kernel.org/r/20250224090354.102903-4-sebokandris2009@gmail.com
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> This is the fixed version of the patch, which is already applied to
> Dmitry Torokhov's input tree.
> Sorry for not CC-ing the devicetree list and maintainers before.
> 
>  .../devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml   | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


