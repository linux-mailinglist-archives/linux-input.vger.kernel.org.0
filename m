Return-Path: <linux-input+bounces-11922-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE00EA96DB9
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 16:01:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22A613BDE84
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:58:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6524028CF4F;
	Tue, 22 Apr 2025 13:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="MjylqTvi"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8421A28BAA2;
	Tue, 22 Apr 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330243; cv=none; b=QYlR1DFxLIz0TWCMcJ2bKiIcO9qZZNLnBg8Zfl012qbLoLwPQPuuzIA1j85mTTkiSUHR/r2ffIgxbrxnTRN9Fx8AgMwu4c/RiG5TnUz5Q4i+31WzbGzhB0QlgR74/hiMiyq28LEhDD95yD7dIk3f/cgKZINvdOuTCoJRptrLjXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330243; c=relaxed/simple;
	bh=t7nOXqE4tlbUoj6BmNiVFgKSUV9qTZl5Ay/HW3Xp1K8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bBqg78RLgknDT1xvhomKSptcS+OVL+jDGPONW1aWwNI7WQKXWE2Fia4YRUu32VmuO7xqGr77YRUnDYQTuktiX0r1UbCKOa42Xj5kKwQEpW7MweGii32vt4fnKsuB/QojO5pJoMfWUZCI0VdR7JEtrmPm+osYoJke5f0NTFyvGRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=MjylqTvi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330240;
	bh=t7nOXqE4tlbUoj6BmNiVFgKSUV9qTZl5Ay/HW3Xp1K8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MjylqTvi+L1qqKxxF0boEP8g/2kSCHawLIDiEo+gs7N+9IlOjUw9Lax4cjb1trsYY
	 0u5DoItprRmDafebGTqMkqmkS6Mhj9wvT/BFVG4QlHMu31ZO8e1p0AcLGJDb4lmJni
	 OlzVoRjIqjyHWHr988f3jUEDlYjPIXpMpsiEDJg0R21K6QmXoTWBMT+KWwOlVbS+Pl
	 CfanzmJPqud3KnPcpc8KuLi3AYu5vCZ+V9dFhb7X/SY506vTK4SSxuLVxbahzZmlc1
	 DSJIqfCNFJ9eychDUZcka2c1nv4Fiyd5h8ymY+axHjwkPuM8evtu1ANAXi3Pr73yNy
	 2AXQq1vZDotsA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3FB9817E3626;
	Tue, 22 Apr 2025 15:57:19 +0200 (CEST)
Message-ID: <50124f4e-fcc5-45d0-9677-dd1327e0077c@collabora.com>
Date: Tue, 22 Apr 2025 15:57:17 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] arm64: dts: mediatek: mt8186-steelix: Mark second
 source components for probing
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, stable+noautosel@kernel.org
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> Steelix design has two possible trackpad component sources. Currently
> they are all marked as available, along with having workarounds for
> shared pinctrl muxing and GPIOs.
> 
> Instead, mark them all as "fail-needs-probe" and have the implementation
> try to probe which one is present.
> 
> Also remove the shared resource workaround by moving the pinctrl entry
> for the trackpad interrupt line back into the individual trackpad nodes.
> 
> Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



