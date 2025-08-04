Return-Path: <linux-input+bounces-13792-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 702C9B19D4E
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 10:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD9FF1884B73
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 08:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD5023BF9C;
	Mon,  4 Aug 2025 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oBRfKqPU"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F17D227E9B;
	Mon,  4 Aug 2025 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294723; cv=none; b=l3ShBOqozJ/U4cwBB0VNcWe0uCV0NSjVAvgs5HwG/zaBvlC/VUEok60DCb/93vnBtvviseGa4pw9hm16adNvxOhcIcG8nPdzHem7HiYGlS89m22oABIVujRl1/NZBB0vRPQPEAs3VFmvaEIjJf9au16XRpDBqHSGHlAy2usomW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294723; c=relaxed/simple;
	bh=S+PqPv/59aRdZ+m3YatdQ4jD8LmxVEOwCVFI2KZi+lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvQWu2HrjTtJXA/p5Ku4W90ZE155G3y2P04MsVFODZ3QBuoSCjfK016fG0Pb+9GEECrSvA22KZeSHdxqPVtBR3KGlApahOsz0Xl0Rpcqp+Tp3YkeFf1GXBrYTEw/7r27MYJA4LYmGfrgvbNYp0i/vJAe/YOg+GDYzXkI+KT0jeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oBRfKqPU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294720;
	bh=S+PqPv/59aRdZ+m3YatdQ4jD8LmxVEOwCVFI2KZi+lc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oBRfKqPU+GZqk6Re0ppKUER1MI815o2Fic1CxK3vW8YVkkmSAgZ/ZXn63bWRvwrlq
	 JRYjvgE/iKnmYe0QBdzOh3K/E5WvDS8FWhraEnEQkPmnZdJ/t0v3p84QHdC7IjV0rc
	 fr5/JEjQiJkOmMrPbY4MB63W5eHbY5NTZN0MjqjVnnN44HU8Bl8N3YV8rJrkLyTCkI
	 2q9fVa5YbTw2vaVGtoVLKGmHu6L9Z6TtagZ55lDirCqtZvIEBauyygKy5t5y2NRkvH
	 ++PNMp9+h9+2al1ksA796P2Ia/Mlr7/Hv/zPI0TC+6hftabJ/J3dzpbGiDtGz42ZmA
	 e3Jv8Jc//5BpQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 052CF17E0593;
	Mon,  4 Aug 2025 10:05:19 +0200 (CEST)
Message-ID: <9fa71ab9-cb25-4db3-b1df-2da6a292f246@collabora.com>
Date: Mon, 4 Aug 2025 10:05:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: mediatek: mt8395-nio-12l: add PMIC and
 GPIO keys support
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-2-d0840f85d2c8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-2-d0840f85d2c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 15:16, Julien Massot ha scritto:
> Add support for PMIC and GPIO keys on the Radxa NIO 12L board:
> Declare a gpio-keys node for the Volume Up button using GPIO106.
> Add the corresponding pin configuration in the pinctrl node.
> Add a mediatek,mt6359-keys subnode under the PMIC to handle the
> power and home buttons exposed by the MT6359.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



