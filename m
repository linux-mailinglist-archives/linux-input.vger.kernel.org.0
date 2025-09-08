Return-Path: <linux-input+bounces-14542-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04390B48C51
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 13:37:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B91523A433B
	for <lists+linux-input@lfdr.de>; Mon,  8 Sep 2025 11:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3FA2EAD19;
	Mon,  8 Sep 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JNQqV+Vn"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9010C2E9757;
	Mon,  8 Sep 2025 11:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757331418; cv=none; b=HsQyE9gS54OeP6LG2x8+wakdhSlCWZuWL4+e1cGatPAixoNA4cjs9cx3G3/XBoDPoQOYEQDtdsrmNupwgjNJoMUtbeO0ShQIYf6Qe+J0ibu2SigHtcK1HGT2M4O1IsUC4QU7KdPKA5WPPh0vJQ0uHdk0pfxqHNEE9jZuhDSRr/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757331418; c=relaxed/simple;
	bh=I6Ct7QSfsb2a9mw4d/2CXNoZn43ncDeWvUzisVJqmmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IovWtYn+T/citni0sWLg0YwdcoyInNhFNY041LEAshgTG/F/YIo238LU6U+Ji+iwqVTuqdxZSTEih6dvNz5E+Rt8/TL/J4baNsJ8VMjGDbTmGag2DXY70T93lHMBqZa93Oci581VjT5gEvyPrCxTB4q9TOcgwO9reictCi9t7qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JNQqV+Vn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757331414;
	bh=I6Ct7QSfsb2a9mw4d/2CXNoZn43ncDeWvUzisVJqmmQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JNQqV+Vnjs1Dxd1EtX4PPTlKmtQwxCDb/AQgr8shMEFalu8USKWWhlJsPwZsVd4tK
	 gAiFpxVnuYm7yRt0XtVeHIbJAWTLopQRL2GYFWTHlJ8ouEriWtaZKvkR04T0QmCPBw
	 CR1usZ2oOFpAfkxZOgJ+IDXpPg1+aqMbVEsnOk+WfDg/cnXIugkfalEh/Et4NRGmud
	 rDuVIVRrxJtTdR1kBrS63nW2H/YRw7PNQOrF7xhCf5eMLPcwifMBAfLsmWEfaNaJ+T
	 C0ZyXXat54wei7+pXSgw3VcLeSemvIfVVyv7JG3eeuBJwr/XcbPiPGuUi67C8ftwRm
	 DPbUAegLYxVFw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4787517E0DD7;
	Mon,  8 Sep 2025 13:36:54 +0200 (CEST)
Message-ID: <104d8128-26fb-4eb6-ac3f-3abbb35245b2@collabora.com>
Date: Mon, 8 Sep 2025 13:36:53 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] Input: mtk-pmic-keys - MT6359 has a specific
 release irq
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250905-radxa-nio-12-l-gpio-v3-0-40f11377fb55@collabora.com>
 <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250905-radxa-nio-12-l-gpio-v3-1-40f11377fb55@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 05/09/25 13:51, Julien Massot ha scritto:
> Support for MT6359 PMIC keys has been added recently.
> However, the key release event is not properly handled:
> only key press events are generated, leaving key states
> stuck in "pressed".
> 
> This patch ensures that both key press and key release events
> are properly emitted by handling the release logic correctly.
> 
> Introduce a 'key_release_irq' member to the 'mtk_pmic_regs',
> to identify the devices that have a separate irq for the
> release event.
> 
> Fixes: bc25e6bf032e ("Input: mtk-pmic-keys - add support for MT6359 PMIC keys")
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Please clarify the commit title.

Input: mtk-pmic-keys - Use platform data for release irq support

...or something like that.

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

