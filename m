Return-Path: <linux-input+bounces-15331-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C66BBC6874
	for <lists+linux-input@lfdr.de>; Wed, 08 Oct 2025 22:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8EBB7341B88
	for <lists+linux-input@lfdr.de>; Wed,  8 Oct 2025 20:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9328C26E146;
	Wed,  8 Oct 2025 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqRf9YIX"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EC1221FBB;
	Wed,  8 Oct 2025 20:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759953765; cv=none; b=YDoNzvIK8FK7pbQ5M++JJiiFUIXfBiQ5gDXtmAs3rZYRliRrgKl8FEUa4rUfdWFmufX8WYSZiGYYmB+CEyUH10biwxYIqVhlNSGsqkSmtI15dGUcTrXK9ihbqNrDbBB4F89zyLkI2VjQ8q/IuUrKq5QP/u8a35AoOOA6Xd2aI4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759953765; c=relaxed/simple;
	bh=1NTrQfMk7I47irFXZzpnFfD40VIXny+JiR4rIQloyUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrbYxrgO4DRn/lets0SpADMYLRPmCjlQlwjexD5C7h0wosozzB8MDWgviDFM8+y5/ZBJCP0rct1yH9PDpHbH9ceNgH0s1UfJAUnvhhiF0UHLjwtwMVASJEhchXhX+qNypKJtVlWmVme7YyM2kehMVIKX0W6bMqrSAFP//IY4zFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqRf9YIX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C44D6C4CEE7;
	Wed,  8 Oct 2025 20:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759953765;
	bh=1NTrQfMk7I47irFXZzpnFfD40VIXny+JiR4rIQloyUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EqRf9YIX9eb12wp1TUgzMO+NSdtMQE6vJA81Mj+XBQfPgGfUsvzZxNAfOV1j78V4z
	 0WNFM7tPSiWBcrnGWUJRK1cTTf/J4lmxrMhfO1/2ifoVBzljsTHXCma8rwX+9ZSsFU
	 delriRw5KL5OCWNLohVOdMOgzf/LN1mKKi71UXJN1vysNe53WNyh2Kglh1NNkwQDHw
	 ExtawShGsQl0N1331VsTaJt549aqUWPrjuHudcV7PDntX7iqtoUEl2IreI6taatjZ8
	 80tSZLHnORlFF2W66KkXQZLfXXifvaQDcyquSu58pqhj1cvgs8qF285Ia1GyrPjG8p
	 BSvOtSTX6y+YA==
Date: Wed, 8 Oct 2025 15:02:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: touchscreen: rename
 maxim,max11801.yaml to trivial-touch.yaml
Message-ID: <175995376307.65934.4901589755709190733.robh@kernel.org>
References: <20251002164413.1112136-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251002164413.1112136-1-Frank.Li@nxp.com>


On Thu, 02 Oct 2025 12:44:04 -0400, Frank Li wrote:
> Rename maxim,max11801.yaml to trivial-touch.yaml for simple i2c touch
> controller with one interrupt and common touch properties.
> 
> Add optional reset-gpios and wakeup-source properties.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v3
> - add wakeup-source and reset-gpios optional properties
> 
> change in v2
> new patch
> 
> previous discussion
> https://lore.kernel.org/imx/20250925-swimming-overspend-ddf7ab4a252c@spud/T/#t
> ---
>  .../{maxim,max11801.yaml => trivial-touch.yaml}     | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>  rename Documentation/devicetree/bindings/input/touchscreen/{maxim,max11801.yaml => trivial-touch.yaml} (70%)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


