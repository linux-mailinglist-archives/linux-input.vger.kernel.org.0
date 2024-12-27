Return-Path: <linux-input+bounces-8793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD409FD272
	for <lists+linux-input@lfdr.de>; Fri, 27 Dec 2024 10:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B13B3163842
	for <lists+linux-input@lfdr.de>; Fri, 27 Dec 2024 09:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B54A155741;
	Fri, 27 Dec 2024 09:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rAQzgFZx"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D356D153835;
	Fri, 27 Dec 2024 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735290684; cv=none; b=UcqKypwlqcZdyb7W0oRuKS4ZVWd7/AJmNsSxXYFBP4MoqeNDJnj38tl6eTbiaKKQqnq37Y+l7iHwzcEOvWH/otOcTjglpQMtnxqSPgnETJsPFvLDTlZeuOVuf3TAkXLYn1pA36AZmC0gKibyl/JFkXqxBv/b/tI3ad8hz0++fyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735290684; c=relaxed/simple;
	bh=88ElJIqFyOFuJ3+w4V018XORRbvyV0TPA3MTIY3utmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z50RvUgwQInBSmz9Lo1UP1Z+pneM+MSjGRs2SH/wvoEK5dYOlxzbava2/teAVVIvZTvfpq1H3Y0UCWLxSERVzMTqShbMMyJnpLtLYTSFyKqmi2L/M9wqkeOGLAWgKRvEyf2YaFf9X8G9VB0wGGjJGYJyoHas1wbW3OvYxKYfcaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rAQzgFZx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 819FDC4CED0;
	Fri, 27 Dec 2024 09:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735290684;
	bh=88ElJIqFyOFuJ3+w4V018XORRbvyV0TPA3MTIY3utmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rAQzgFZxDNdkx1KvuVMeKjmdRfubGJakH3dLvTMlIYyfkY2wGUfuLQXeYr1jFMYsx
	 TNgyRw2fVnLe+35Cj1qvwKPWMkidxFcIsdLFbFXlyxgbKwC5yUEPGTsPE2iBru+QaV
	 kPVTStjPVWctNmYZOADNERBQ3a3tpk/xfcfJzgu01bw13KHOYDoQLriEBgK7RwXIvb
	 zaFfiLS1mA5g/JXUQe9WfHZxckrQe/khdVsMGB4XTP8T3Xh69WJd3DXnQv2M0LM3jn
	 ejo5uD7/xNBANteVfgIIj1NPF+E4eC5vo0RJ5LmVAoaqCe4lUE9v2INEdLLr4V9KWZ
	 qlAIiGo7RUHHw==
Date: Fri, 27 Dec 2024 10:11:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: add per-SoC compatibles for
 keypad nodes
Message-ID: <fvefi22ycl2tryz3hfkqp5ji4w75tdup235vdvbqs6b5uly2ia@i7efazaxu2eb>
References: <20241225192631.25017-1-val@packett.cool>
 <20241225192631.25017-3-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225192631.25017-3-val@packett.cool>

On Wed, Dec 25, 2024 at 04:26:20PM -0300, Val Packett wrote:
> The mt6779-keypad binding specifies using a compatible for the
> actual SoC before the generic MT6779 one.
> 
> Fixes: a8013418d35c ("arm64: dts: mediatek: mt8183: add keyboard node")
> Fixes: 6ff945376556 ("arm64: dts: mediatek: Initial mt8365-evk support")

Not really a fix... or describe the bug.

Best regards,
Krzysztof


