Return-Path: <linux-input+bounces-11925-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ACAA96DAE
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 16:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE4B21656F9
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78DD228D858;
	Tue, 22 Apr 2025 13:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MWo+vVJY"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A844B28CF77;
	Tue, 22 Apr 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330246; cv=none; b=qSHaZDT5QJrQFl1aIR/d4FPrXlFTi2T5FodXgnGS4iJFRVNYhAuGNVCVz9yeSWf2BSzvcU2hpV4grr+v1NCLhhJMc8fFqWCSBdhoeeItfEnmeGZybRySi9mlaXEsqKJFcmor2EMcInDQOnAwDigT0R8/cBLiTIcPFtkUXOgRR9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330246; c=relaxed/simple;
	bh=g7WNVJHclvSj1E2AwbocpEvXvRSkv9UNMU2PgjrPJOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCyYTFscivnb3eb8cH+lO4zB+2YeswvgARwOET9yCfHi11J0aZX0I0U4XFfF4YoEBfzszQpkt5kFJzSrCtDMAReqzyoR0wyxy5OcnIA0s4MW8M7CpQeVNxjOPL6RcG3O80ZJ98uFrwMDI+Joldl5sAdZIuFBAdi7eUf1vPSC5ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MWo+vVJY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330243;
	bh=g7WNVJHclvSj1E2AwbocpEvXvRSkv9UNMU2PgjrPJOc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MWo+vVJYRfk7c9rAarBXaDJbhgJAw6zdNajEpHhQtIXVfuaS7FfN3H/8FEjrycj1o
	 4FtlL+sU1iHJgH6MVb57VNzAoBQknaxje3CalTenCHPmNDe4W63jz8sUFqB2vokBC4
	 9VoeSm1aoCRsvH6+sMlU+vYFeMX/6/sQBqETv+T5srm9PLXSj1txRcLrAC+6L1S/Kt
	 42J+Wb2csC0ReauZ5w4RXI70XRlhwvRkpPxaEECnC24fBl6NBeYoYsFAKnY4zw7syr
	 Q8AaSxemKQMBcbtPlN0+0j73SyM91DU05UiZD0MJoUDAdFFHU/TMYax2dQx7BbbRQI
	 1Xfmc0eUnm2yw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8068417E157E;
	Tue, 22 Apr 2025 15:57:22 +0200 (CEST)
Message-ID: <26b9b027-b880-4880-9c12-844bd36bcd44@collabora.com>
Date: Tue, 22 Apr 2025 15:57:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb
 entries
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate compatible strings and device trees.
> 
> Drop the SKU-specific compatible strings and just keep the generic
> "google,voltorb" one.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



