Return-Path: <linux-input+bounces-8794-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC09FD275
	for <lists+linux-input@lfdr.de>; Fri, 27 Dec 2024 10:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 447BA3A05B1
	for <lists+linux-input@lfdr.de>; Fri, 27 Dec 2024 09:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4948D15575E;
	Fri, 27 Dec 2024 09:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYCwX0B5"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC3C135A63;
	Fri, 27 Dec 2024 09:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735290740; cv=none; b=VnX4Vt1gWVPvkOlST6Rqwp40Q2bp99qdFmYBGQa5szwV2KQqkyz2muqJvPabYG7y4zc36GJBfRNFLp2/bCVzgf996usXxHnRSlhKYPclf8uBk2iTx//cLlOFBRDJmSHHesMaMY3qe4BB9r340KTw8YaWbvB8yWfufCoNITed5CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735290740; c=relaxed/simple;
	bh=C9m0pK+sHBtnCL2Zja1nhK8WY0KqFF0of4phBzhsUBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5OjUWvTDh6qCBb3gbHxBCBH/lowPvJM6CGORH7XkNyMciQYfHUXl89cyFTTgf8Yv3w4zu3cZulmil3McerTlehEy2yu01Dgdirk+8rmNRXQVoqjBIrJz2NvIULVcoVUDNfyzpH4xPcQ8WIINXaVtFxV7Dl6doNUQLBFoIA+6m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYCwX0B5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ADF6C4CED0;
	Fri, 27 Dec 2024 09:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735290738;
	bh=C9m0pK+sHBtnCL2Zja1nhK8WY0KqFF0of4phBzhsUBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aYCwX0B5jalzOdqKRrrXyTK2djttuPaYMO6me+VstDKTFZgaXEN3NHzkbxqyBh8dt
	 u9NlpMcgGB5ui1YmYB6ZLq3f9Sv4W80QrmsijX5hPz2q+IQPX6v1UdtEEpRk3s8LDn
	 +2yaURUvj6mEO2rFOhe6Agq89HqGcox6Bg18iLJHqHVPwfICYCr7l5IbG3ISOCFzgj
	 ePBjXSGMTlGR6bVTHOUBOT4DsUweMfZ/ukCr16z4xWJUWrGW5WgJjuKujKYE7a377K
	 +ECBlnqeehV0wYBLI710zq+opLt77y4/CW0wIeK5zPjUQQAwe3z0BlQCg1wnJ/tMxx
	 +TZw075fxq5ug==
Date: Fri, 27 Dec 2024 10:12:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
	Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: mediatek,mt6779-keypad: add more
 compatibles
Message-ID: <2cikysv5mwmc4utckjg7iaqx66ncwu3nsxd4kqipj3gw4mymbf@3gipwanf44ji>
References: <20241225192631.25017-1-val@packett.cool>
 <20241225192631.25017-2-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241225192631.25017-2-val@packett.cool>

On Wed, Dec 25, 2024 at 04:26:19PM -0300, Val Packett wrote:
> Add compatibles for SoCs using this device (mt8183, mt8365, mt8516).

This we see from the diff. Say what is less visible, e.g. are they fully
compatible with other variants? Partially?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


