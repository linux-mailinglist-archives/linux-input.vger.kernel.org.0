Return-Path: <linux-input+bounces-17087-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEC2D1D812
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 10:27:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 79FEB30213E9
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 09:22:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84A2037E31A;
	Wed, 14 Jan 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OgL+fOXV"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A762D8377;
	Wed, 14 Jan 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768382578; cv=none; b=gq9w3DPNxSN7/NJZxYhdCqFYa8i4rzHOCetZnlNCg6wDFLz9bBZHqqO9Yxpa4XL4bBG+ard4MlgJMsADIA0GpBokAOXp2UYNAWKvD3w5HdGAGj1N0BQNF/NFo/aD6/kidUd2LNwhpZo6CLHudizknMwp/zZ9d7J+K0s+awO+scY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768382578; c=relaxed/simple;
	bh=Yo8uRrjOQtUu3sP57XmGHMPngzKoh4iDTFvKQ8mfj9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHZ8uaEi9St8dUZO0q2htVCf+6Uyb4xupdkDRWgk8nfUjhiZ4qPNXuF/vfJP1lASPO36f+I7cLXJQHRpYme0u75JDfRcsfFKSTzzXzRfGgOSxCAkb+DhmZew/++qvVjv3La7UhUEBYx6i4e4VvVLNPjkneJ2AjU1ej/9VBjC+uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OgL+fOXV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E2CBC4CEF7;
	Wed, 14 Jan 2026 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768382578;
	bh=Yo8uRrjOQtUu3sP57XmGHMPngzKoh4iDTFvKQ8mfj9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgL+fOXVH7H0C3YZjiZ0hk6pA018WwsQtcvpcguzIR+dWsUUo5h2zrtM4nuSC+k7K
	 VvlLMjjBjiiRrv0IoVPUoUc7VUoGIpLPC/h2/tL+7N/IuWUfECXkMHTjJQMxorFplG
	 8ethPnZZw7zCA2OUy0KL6w8kf17gIO8+sobc8E2arntkDDHSFhUPosEIA/L+KJq5dh
	 YKxc+fchokpesZ5S2vAA5say6EV5EBTc/RKDN8ExddImtl2NyTdgHCK/rbs1j9sGe9
	 xHj+wybsJfyPR/fP2BD+9tBUrrT7qXPhvQdEufsF9xioev+w5k7xuxbBwBE0r2dSbw
	 hbKGObrNxkuNQ==
Date: Wed, 14 Jan 2026 10:22:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: SzczurekYT <szczurek@szczurek.yt>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: input: touchscreen: edt-ft5x06: Add
 FocalTech FT3518
Message-ID: <20260114-cherubic-malachite-gecko-ecbfa3@quoll>
References: <20260113-touchscreen-patches-v1-0-a10957f32dd8@gmail.com>
 <20260113-touchscreen-patches-v1-1-a10957f32dd8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113-touchscreen-patches-v1-1-a10957f32dd8@gmail.com>

On Tue, Jan 13, 2026 at 09:12:35PM +0200, Yedaya Katsman wrote:
> Document FocalTech FT3518 support by adding the compatible.
> 
> Co-developed-by: SzczurekYT <szczurek@szczurek.yt>
> Signed-off-by: SzczurekYT <szczurek@szczurek.yt>

You need to use real names or real known identity.

See submitting patches.

> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>

Best regards,
Krzysztof


