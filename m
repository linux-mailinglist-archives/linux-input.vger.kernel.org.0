Return-Path: <linux-input+bounces-8848-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A879FF989
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 13:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6103A3320
	for <lists+linux-input@lfdr.de>; Thu,  2 Jan 2025 12:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2051B0F0A;
	Thu,  2 Jan 2025 12:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="DABCNyMQ"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10D51A9B32;
	Thu,  2 Jan 2025 12:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735822382; cv=none; b=IFw8Kz0YGsHE2qD67HbDBuAS2VtCI4VVU8sCHxK+ODu8ikhiaqLrysu2NIO4qnmxiVwelB/BFqESCUzt6RA0IObhI8FMYzi1/xT5nRVMEVsU/ERnXeAkyDvWS5Y0n19CoCyHeAlx8MDpbGfw9GzkKSlimmkgyOKBcfUUph94CCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735822382; c=relaxed/simple;
	bh=zm43TYi4z+GwQwZRB2Q+5ZdBGmn9Rmo1nucOK3h8gdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlwOft7Urjh2mbQkDbnf8ylpYIpdO4PSRjHu2A+GuCsk2qrCBHFDymyMI/j/Z7vfNIzZBmGWykNWHgN7JFBvUzv68LzQQu/DD2+EpuudxI0fcNMi+DEHS11cLgv4eORlgJUYnwJpsrpSzWPZT3DjQ6n8OvGJMXkNTniROzLDf6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=DABCNyMQ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735822378;
	bh=zm43TYi4z+GwQwZRB2Q+5ZdBGmn9Rmo1nucOK3h8gdE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DABCNyMQZZNP5B5uxElY723LcC3CFpvBGbIFj3H/uzuKCKeMGL2ckKeDsks6NAKxK
	 p4T0C5m89z9fhqOJGKp9qq0z/B1nfhSRAg4ghdjfjgHaJe8BaQeBi+aRKzgmJYMZ2m
	 b1YB325qi2g430c4W5nycd+v47IEcVbeJyd1Iv8YNzkZKbMztDuKd9+OK+KZAbDf5Q
	 voWTWoLaBRRCvh9DkGs8G2hLQZDKHqlrcNn51at5hAl079LZ3pTLiAnh+hCKVD+cVL
	 a122Xf0hzI2okwxTVloWfV3lWMrUCYez+CnK451e+mtcOVLxBtVMm4K4RLPxcbZn2w
	 HahNEz0kbb91A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C3E3A17E156E;
	Thu,  2 Jan 2025 13:52:57 +0100 (CET)
Message-ID: <fa2033e4-0cb5-47cb-bbe7-cbcdb9318c54@collabora.com>
Date: Thu, 2 Jan 2025 13:52:57 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: mediatek,mt6779-keypad: add more
 compatibles
To: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>
Cc: Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Fabien Parent <fparent@baylibre.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241225192631.25017-1-val@packett.cool>
 <20241225192631.25017-2-val@packett.cool>
 <2cikysv5mwmc4utckjg7iaqx66ncwu3nsxd4kqipj3gw4mymbf@3gipwanf44ji>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2cikysv5mwmc4utckjg7iaqx66ncwu3nsxd4kqipj3gw4mymbf@3gipwanf44ji>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 27/12/24 10:12, Krzysztof Kozlowski ha scritto:
> On Wed, Dec 25, 2024 at 04:26:19PM -0300, Val Packett wrote:
>> Add compatibles for SoCs using this device (mt8183, mt8365, mt8516).
> 
> This we see from the diff. Say what is less visible, e.g. are they fully
> compatible with other variants? Partially?
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Yeah saying that they are fully compatible would be good here, but anyway
the change is self-explanatory (just IMO - but I know MTK SoCs so stuff appears
obvious to me from time to time, and might not be obvious for others).

Anyway, input maintainers, please let me know if you want to take this (or the
next version) through the input tree or if I should take it in the MediaTek tree
along with the devicetree changes.

Cheers,
Angelo

> ---
> 
> <form letter>
> This is an automated instruction, just in case, because many review tags
> are being ignored. If you know the process, you can skip it (please do
> not feel offended by me posting it here - no bad intentions intended).
> If you do not know the process, here is a short explanation:
> 
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> </form letter>
> 
> Best regards,
> Krzysztof
> 


