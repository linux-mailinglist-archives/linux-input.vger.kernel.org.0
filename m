Return-Path: <linux-input+bounces-13791-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285BB19D4B
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 10:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF0F37A67E6
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 08:03:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2F1230BCB;
	Mon,  4 Aug 2025 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mCjt1dDb"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431697DA6D;
	Mon,  4 Aug 2025 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294722; cv=none; b=HffRkzd9AEHm2TvNfLxZNU9UoGL/sXk+/64gaflPbXjYF1VoHjUdDkgHXxdlbkwZ0cty8UVRpwY16mh0rQbyXIgGlTLv3cvdGQLaPPI1D8yF8nXFhJkBlOhuLlyOrdDs5bYa0RJE/jyulP3vxtM+x8d08bFRTC8nnBti7ukf2oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294722; c=relaxed/simple;
	bh=tiVkrmqya68jCQkn9+C7XNjyHLbNElH+ErQQzOmyqIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psDQd9Co/EwOlY3yVryACfG+UFaMoIjuZEXx8hooSRTLyUpqIid6wcTJr1rSE9yesmQIfr0VOcWr6qi4veumnBJKgpotuTWqnnAqaVIBiMXvIbGVm4013c/UtMaew+90J2Lj/MXobmGvtPVqq8CVaGnfSPGGqHMXm6tQD5k02Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mCjt1dDb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294719;
	bh=tiVkrmqya68jCQkn9+C7XNjyHLbNElH+ErQQzOmyqIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mCjt1dDb6+2H9uFfcbbuoC9P+p4qLkx1SG9F5sOH2B5q3pkFj1RaPIvN8jNJqdyjE
	 1Ns6bAElCjy3LDry6fDmJG81p+RUSa/DLbMazHn439PoWl3UjzmQuB/7CXmLJvVHdt
	 eHeKNK11PR5glWnJHfh/JWqKsAANw2/qb2qLIYzhtYnk7IA3IzVxTndwXLIiXSujBz
	 a0tyzmwGHkNv490h79+zIe4qRh8BnL2vI2KTSJTbkGcCD65z4Fgtm4TW+8l+3W43Od
	 SEEgaqrszb/qg4CtjJm5EJETB1QgurBXfir5RRZXdJV3phOE0lpLrnCdeBClcdIAyD
	 fEkF0oHvLCkVw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 207B417E048E;
	Mon,  4 Aug 2025 10:05:19 +0200 (CEST)
Message-ID: <31dacaaa-b48c-498f-9022-44a32d383a8c@collabora.com>
Date: Mon, 4 Aug 2025 10:05:18 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support for
 blue and red LEDs
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-3-d0840f85d2c8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-3-d0840f85d2c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 15:16, Julien Massot ha scritto:
> The Radxa NIO 12L board has an RGB LED, of which only red and blue
> are controllable.
> 
> Red and blue LEDs: no need to choose, both are enabled.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



