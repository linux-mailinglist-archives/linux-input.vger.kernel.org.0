Return-Path: <linux-input+bounces-8842-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A439FF80C
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 11:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 329B11881E41
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 10:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4435D1ABEC6;
	Thu,  2 Jan 2025 10:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lnDjH4e4"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642681A2C04;
	Thu,  2 Jan 2025 10:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735813766; cv=none; b=IQ+CT5fZm2eLgRvk7CJ4WgN2iqENxbM69vOISlhacGI9Rd+YJmuZ+Z0kErDOzADM8e6VNWGt1SuqA9o3Eg4qOhPv6ZxmEyM2LY8RUWeTpGOroOP9SVZhnt9MmNdhHjANG1Kh0ZwHPGuL7o8zLOE+rGTWVu4MRd37Zvj4h4oh8oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735813766; c=relaxed/simple;
	bh=Ui5Ax6l8RhcBEr+KDx7Y4gphne3ZIzmcVAcKme4QbaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLNkGTrCx8jr498rvWh7dpwVwvA4LerlsI3lLI/MtCFS0LtedypelPilAVuJN+1gdtSFVQB7EYtuqrQ0YwLfTsxTs2FrpiqKF7nbk0LESgF+Y8PMjLiXqoRbP54PecylPIXJ8o5CtroEfBVfM5+EUxIFRYgenh6hyM4QtEY5i/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lnDjH4e4; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813762;
	bh=Ui5Ax6l8RhcBEr+KDx7Y4gphne3ZIzmcVAcKme4QbaQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lnDjH4e49m8sL1pxJma4tV+WV36PeaCESERSgKFzZ3vdQMEN9zzML5rdbDRyg/eST
	 9ct3oa0EUyVQDfdp/Q1IG7Q+gngQiatZsaNQAsMuFgoRUwXZzpmvVjEC6g4h0UJ7Mx
	 hNlu7cbv9eNvpih8yHi1beLLwFKTpLdCcTx4sJ3j8zrqS0qnKvQxkk/B4CfGFf3dEA
	 mft19HRNPjMgfjG/bx8NYctNzd9hv5poQEcZ10r1Hu3xBYcy9TaWhrDCwcBWzo1Jfr
	 fIaiQqKA5HJn5O+FNi9pivNFs75XYXnB6kQBwAwhffXZvNNIjWcKioR0uMAtpdmLXS
	 y+mBUYcmX+j5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4B8317E1554;
	Thu,  2 Jan 2025 11:29:21 +0100 (CET)
Message-ID: <5a4db8a5-82fa-4feb-bc2e-c78d9e1c88e2@collabora.com>
Date: Thu, 2 Jan 2025 11:29:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mt6779-keypad: fix compatibles and add to mt8516
To: Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241225192631.25017-1-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241225192631.25017-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/12/24 20:26, Val Packett ha scritto:
> The mt8516 patch was previously sent in another series but rejected due
> to not using an mt8516 specific compatible - which the other usages
> of this driver (mt8183 and mt8365) weren't doing either.
> 
> It's only fair to add the SoC-specific compatibles to all of them then :)
> 

Nice!!

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> Val Packett (3):
>    dt-bindings: mediatek,mt6779-keypad: add more compatibles
>    arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
>    arm64: dts: mediatek: mt8516: add keypad node
> 
>   .../bindings/input/mediatek,mt6779-keypad.yaml        |  3 +++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  3 ++-
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi              |  3 ++-
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi              | 11 +++++++++++
>   4 files changed, 18 insertions(+), 2 deletions(-)
> 


