Return-Path: <linux-input+bounces-11921-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA5A96DAF
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 16:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 69E501B60A9B
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A6C28C5B5;
	Tue, 22 Apr 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cVwKyuQR"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FE7284B50;
	Tue, 22 Apr 2025 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330242; cv=none; b=cBhvqAz7nmw1f5OGXQpSjbOUKMcjkXQcSgvkJyfT/snRttMSDmtuRq/RAPwzRpEqN5GUkATKU1I1TICPg3HGZPQEpEminvPOcmtKGdgeY0rb3QtENbKOyJfoVCQkA+SZUUxCCpqVkr82Ul8RMVSepR9Rdd0td/DXd3G8pR2Ccgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330242; c=relaxed/simple;
	bh=sOIwe0VS+sWfFtU7zCZZgIQ6EcmnnSJDBcSZ+saj2wY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ceeYFXCkg4doUKm9T5UtN+DvvZVqYRNusqeqE5F0PZudABmAgxDiSLgKp/JEvS3rlU18R6fj16hyuerBANbHfN+sihJyNCzbWoS2z8gMCC496jhTjZL2ue0yKnRY+P30ehm3njsRX9gPVoO1dW8oQa4Oub4EUTDvAnpNh4LRYFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cVwKyuQR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330238;
	bh=sOIwe0VS+sWfFtU7zCZZgIQ6EcmnnSJDBcSZ+saj2wY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cVwKyuQRCH48gIXlHPOJnAc1Kp33JadQEXAnwPdP1tWYP+L1CYt9+b9V/CqKzwoer
	 qIb4ErAUugPpbDsKULxUxf8ra68C8d4tidGYOxuRsLEAGqJ3T9olxc8qsxQAcB3n/a
	 xP5FEU6x0W4XKReZ4ErNgm0bg2ohKaN9Dg9plA/iFRjWLbzYmwtu+DbDnD9BWzx+CL
	 Aiw6B4TT37LG5K2+K5T39OZqwjgBda9Y8dWQDAbTuArPJUhNjlPmmXzNMkTU6ykMtg
	 okBUUchJh9sL6wJpARRYSH+0dTeNJM1yvfSxiLj8sf/1M/tlonDtCnPnVfqdm40kJ2
	 MjpuAZI4WQFjw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1999617E35E8;
	Tue, 22 Apr 2025 15:57:18 +0200 (CEST)
Message-ID: <748082be-2850-4ad3-8fba-eaaa859e8d1c@collabora.com>
Date: Tue, 22 Apr 2025 15:57:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device
 trees
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
 <20250421101248.426929-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate device trees.
> 
> Merge the two device trees together and simplify the compatible string
> list. The dtsi is still kept separate since there is an incoming device
> that shares the same design, but with slightly difference components.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



