Return-Path: <linux-input+bounces-16073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D8041C56218
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 08:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9C6B0347CBD
	for <lists+linux-input@lfdr.de>; Thu, 13 Nov 2025 07:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4ED032F762;
	Thu, 13 Nov 2025 07:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDsWbQt1"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76242F7AAC;
	Thu, 13 Nov 2025 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763020609; cv=none; b=EGwZpKw7GUrJOPywQx611xdu53iJRioXEX4GytmmEqm7oX4MMdl1yxVh9AEdOk5C1n1WlAUNsf1NhybSLsgKVsSz/0JMmoWogY7sKIjGnpGsAy7+nR+GB0OnHACY6OF8fmcIzaKlE0elY3DK/xshdqVgVJcp6DG9GD2xwZO9LLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763020609; c=relaxed/simple;
	bh=T3RpVWWkJWe3e6PcFNCc8YxUn1ZVQ78yjwIL8n9zIto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsCVBgPuJq0kbITE6A5877x/ng5Vekrp9JfohR71bTMqeCIxHQsrweM15fhTQKzH4UvchBAsDquvv1VcPGjmZ3KeibiyRSZdsegEnrLaJKkt+TPkSBjM7w113ZcCjN7wuoSmoiEgFtY2ueNnYJOcaQ0f9lzTKzWI30mbAzD9jz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDsWbQt1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8330C4AF09;
	Thu, 13 Nov 2025 07:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763020608;
	bh=T3RpVWWkJWe3e6PcFNCc8YxUn1ZVQ78yjwIL8n9zIto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDsWbQt1lNmXhmVeVZq9pYcGopEg4YpOG2piPu0AnHDIanX3kmLa5DL6/RuZkUinw
	 So/DFalGJj8IwzWuaXxJsIQvE+edGmw7LL3f0BSKu9GX9vsepxqg8TdYhVssJWrhGq
	 nT2gRZ/gO4kz5BJ+jsFcfVaugzjiZkXtY2veV2+xzojtuugBtOj57p+g88nQoxJ8iN
	 vZQ81a/1c6lhfmmCeGpq3bnxB0e0FArHNRUD7du3llDS/a9v7V5n4Xoa0gKJZB38jx
	 L6YN94cHVE4H6SrfspqkjwKNhpyRR+hI8ACQsAHw6FseOZTUL57I/pwxCv9Pfpu7HT
	 1ILp9vg7Qnl3Q==
Date: Thu, 13 Nov 2025 08:56:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: daniel_peng@pegatron.corp-partner.google.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: input: i2c-hid: Introduce FocalTech
 FT8112
Message-ID: <20251113-belligerent-wrasse-of-current-3cd3a5@kuoka>
References: <20251113140004.v4.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251113140004.v4.1.I894dde5015f4acad94cb5bada61e5811c5142395@changeid>

On Thu, Nov 13, 2025 at 02:00:55PM +0800, daniel_peng@pegatron.corp-partner.google.com wrote:
> From: Daniel Peng <Daniel_Peng@pegatron.corp-partner.google.com>
> 
> The FocalTech FT8112 touch screen chip same as Ilitek ili2901 controller

So keep the device in that binding under enum. No need to create
document for every device, even if they were different but here it is
pretty obvious - same chip.

Best regards,
Krzysztof


