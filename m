Return-Path: <linux-input+bounces-16611-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF1CC69AE
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 09:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0111230076AB
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 08:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F0825C80D;
	Wed, 17 Dec 2025 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YATqAVZQ"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C79D1F19A;
	Wed, 17 Dec 2025 08:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960278; cv=none; b=OCPx55etzHXUbdfegW+0DvbUQP5/9EGOwLR7HOCb9taROfcSKLn7yLl5zS4E9E8Vq0eS/CJML0sDssADoWPh3LA0gMzka2PPBmhVuHm7IP3BiWCP+uf3FD38QHuSOhnT8WuscDrW+ngEmYbePYOgta269oZQpYtbN4BHlybnRzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960278; c=relaxed/simple;
	bh=ryoAGCrbNL6MiCN+uo1T2w6mNoskaai3T4G0+EvUCEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwSqUseTwlg3Y1oLNrkX0t5PmnT11I7cAXdSvfRX7Ise7n4rQc1/ykb/E/g04hFy+sZhopnzaDnrSIjtXN3aIilOMe0M3LafrCYBehxHTSSCvn5zbNRYfKKjR/X7PxyeSWRaGIF7L/3FangHt8k4rhxf9UI0Ee2v1sY7Qy0yQ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YATqAVZQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8A4C4CEF5;
	Wed, 17 Dec 2025 08:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765960277;
	bh=ryoAGCrbNL6MiCN+uo1T2w6mNoskaai3T4G0+EvUCEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YATqAVZQRwof4ZvZmVY5lQYranH3I3lQayPyfpORo8kXGYqD+e1+aTdlqvGmjpxjO
	 5FWcL7dHALOF9Zr16+VTZraexeUuIc6fkykhZC6RSx1p8J3JUU0/acah1lkUyj+O50
	 eyNnZLW4fPhaZ3urptadO9ndOsIGqGqNpeGwtyO6XqZHRWguCeDXXf5Jzok/rVFW2c
	 luPrjAiq7ByNNDzVZjOKBIzlNijqnEnPUbX8J5DSZy9tqRL9OeibyU6C0E5dk727qS
	 /xwy8zFBkZu5KTn69PDgT5RSAzY0bzMUmbQ74BosQRJsLLl4OWPxjfYSyQVIENFYsz
	 P9TedzWILIafw==
Date: Wed, 17 Dec 2025 09:31:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Message-ID: <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>

On Mon, Dec 15, 2025 at 01:29:29PM +0100, Nicolas Frattaroli wrote:
> adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> property. This makes it impossible to model devices that have ADC inputs
> that should generate switch events.

The solution is to use unevaluatedProps instead, which also allows
dropping other properties.

Best regards,
Krzysztof


