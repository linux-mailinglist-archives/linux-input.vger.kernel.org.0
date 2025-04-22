Return-Path: <linux-input+bounces-11923-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE2A96DA7
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 15:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DB93176D6D
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D0D28CF72;
	Tue, 22 Apr 2025 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cky0Yhy2"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AA28C5B7;
	Tue, 22 Apr 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330244; cv=none; b=de6/3KUI77+qkwndt4QQI3+pK6iQt1oKzyJKbq+GzPi28GdXUbr7/OVSeUTXIpH6WC4i5ZGlvArAr6fEXjj2p8ihhMwz5YE+m3Wx12q7ObuWebOb0ebqcTPjUBGHs6GAs1CPFGdM68y0OG5Y1POJqBJww0xPgzfU3NGB4YxbFbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330244; c=relaxed/simple;
	bh=sRX4HfUJdU7lcgcSh/8xeDqOhZ8/zUxPhEsiu2cBQm8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n2CB8OJcUdM27OKWSUGUyCJeJrAfwP9Bz0g+QwKT5u+batYaozuxsPdaXuPE8fnf2XPEE5LiHoqaecKA2+roeF1QlnfuxNXvSJxaB36SzQ0GusbnpUkWfd1sImaob/1heo10GH+7TE46zqw63Zzyi3odhmTNpd8KdfT1mpBnKN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cky0Yhy2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330241;
	bh=sRX4HfUJdU7lcgcSh/8xeDqOhZ8/zUxPhEsiu2cBQm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cky0Yhy2DIsuOtweyefTTMgSOzhbcOp9Z9JmboN5FQUCMjy2TZiKWIef9tcVIA1+T
	 /QoI4yEmASecn0JZsXuNEyvrGpBGDgbcqs5ihc+o69m9mR0EpeKG+8z1QCwpnagTAi
	 aEmARG91n8nfF9/tRas5SbBIntzpOYyPyLcBIrwoQL/Y98tBUc7kJTu1r+/v5AyLzE
	 mh27OR0WwbIFaKyWGQ0skmcB3uRWeVz2VBm5R3elvjzuLnZannrN8OsmCBdMQDtIdU
	 +lKkwKysIPevQxr4gR0AHW7A+7jwe5XENMV4lLCS8DAvsArn+k2HppHdFPWLbVzw39
	 GkM1VNXkHNf4Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C5F317E362C;
	Tue, 22 Apr 2025 15:57:20 +0200 (CEST)
Message-ID: <c0df9d60-5cda-4e7d-81fa-6f385bea7cd7@collabora.com>
Date: Tue, 22 Apr 2025 15:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan
 eKTH8D18
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
 <20250421101248.426929-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
> 
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
> 
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



