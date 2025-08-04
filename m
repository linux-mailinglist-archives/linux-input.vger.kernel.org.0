Return-Path: <linux-input+bounces-13793-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFCFB19D51
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 10:05:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5AD83A63A1
	for <lists+linux-input@lfdr.de>; Mon,  4 Aug 2025 08:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C013323F424;
	Mon,  4 Aug 2025 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CbCTfOD5"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4AF17D346;
	Mon,  4 Aug 2025 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754294725; cv=none; b=vCQERDOtehehSm5sVJVhHO6YoDvTFtH6Q8wIy+0/JvkUhipubU9cSiXbov77BzrWHoFjVHVGglleQO1rdr2ESleJKqGaXsoGOXq6cq/z12rubhrdWFfXGolFpPkL4a9Vny9MPtCH+j7eLoBV96IlKe2dzwbMAah0DY3SGHp/L9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754294725; c=relaxed/simple;
	bh=FYLnhdEGvKvTuON4KAML6Oi2n8qm37XovUco3wVoE8Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qA/i0H3acS/2sSeCXZAfgdDcEbcDTfu20oFD5k8h53BqR3XaGrym6vpkxC6KSU/jjoXmMHzjxXDfuzLMeRyQDg4+f8SKoK+3AOBONxV3JYRubaOktkIbiUR9m5XcMv6hr53ToxoRZ1YgJysn0TJ8I+9qAP19mUpflnHwng076tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CbCTfOD5; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294722;
	bh=FYLnhdEGvKvTuON4KAML6Oi2n8qm37XovUco3wVoE8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CbCTfOD5k19H11a4u8Q/Woseup+CwmLYRS5HHnfKWg7HCiwgwh6as3K7nqjqmhFKi
	 dixMcCmrIFnvDHVlV+ldfXa8C031R8gxmtAJYO6rfOkedswPQC9lBXxzUSAyBHfocn
	 Y76UqLKPidiEh447HlFNPsj4Cz4VB2gI/5G5Ego6L6X77jBTNp0fdn5uLQ0E9A4utF
	 xuqj/T9V2FN1w4VGto2+U+/FYRHFRPRXE7IbBl/b284iCjrdMxALFF2WqSXlaBJMzC
	 SNySu9agllgUfSfCEoDG9fNGjIqNJp/aOXSukvimp4CZCJ03io549A8zlEkvE+NLQT
	 gyaYO7/ct9n3w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8410217E0DB9;
	Mon,  4 Aug 2025 10:05:21 +0200 (CEST)
Message-ID: <a9cd33f5-cc37-4a1d-b1fd-094761a146ed@collabora.com>
Date: Mon, 4 Aug 2025 10:05:21 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] Input: mtk-pmic-keys - MT6359 has a specific release
 irq
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-1-d0840f85d2c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 01/08/25 15:16, Julien Massot ha scritto:
> A recent commit in linux-next added support for key events.
> However, the key release event is not properly handled: only key press events
> are generated, leaving key states stuck in "pressed".
> 
> This patch ensures that both key press and key release events are properly
> emitted by handling the release logic correctly.
> 
> Note: the code was introduced in linux-next by commit
> bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> and is not yet present in mainline.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Well, you are effectively fixing the commit that you pointed out, so this needs

Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")

and

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo



