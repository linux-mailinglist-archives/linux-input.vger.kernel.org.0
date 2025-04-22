Return-Path: <linux-input+bounces-11918-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF000A96D99
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 15:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D77617CA09
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BDDE28A1C7;
	Tue, 22 Apr 2025 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="b9Jp1fuJ"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26758283C91;
	Tue, 22 Apr 2025 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330226; cv=none; b=TFT6hjiSE6s/AhGi+msWq7lb1OzfFNEp91H0sDBut6mxb0tsI8ENiFX6MQsBHIMuEauKKEcPdWbtq9Kko4PMxqrbVK/kpMsVzcNvCPo8jN+55jqFIg54sawL5jHS5Kjt6/zi5+ELb33MHfI5uSd7uyg0i7tAfSBTosVnVCieF5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330226; c=relaxed/simple;
	bh=P0PnNjNfw5TonK4bC7HdNBzKGNWZw94cWOwyHMvPVFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KepcnGrvC8nrGeitoZyroFk/Wy2oIng7QggGEFk7MwgQNUnBkA/PY/vq759Y2Pe6Kgnav1H1LtkSPR4qtvdVwvhcRlpZRnfpDGHieuac+uqexxhV5v63AB/UxE9jI/QK1Qn7KEQTdNmzmb31TkA0Zlt6Mx7qo1ZTmzoB/CSYPX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=b9Jp1fuJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330222;
	bh=P0PnNjNfw5TonK4bC7HdNBzKGNWZw94cWOwyHMvPVFY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b9Jp1fuJAapiaX2kjyp4dWMOiazs8Kv9ItszrwLVpXIiMlA5nQr7G42j+GjN58P4f
	 uZlXBoJyWbyN4X4lwAGds8Omwc84K4jIsJgdZwilJvbVXNiUwXoasKJNZnAqa9g66m
	 q74ZgOE23mnb/WkeysVBPPUdI+de1eHEHw4DJRuV9YfJTlilZ5/cP3UUvPL9aMchk6
	 0PbKc8UIOcSDUs1wa27K8Ef1GaBp2zNRw8HjHyo24gRGC+PlGxQ9Ipqy/Nnux09Qls
	 bi72io72BGcLU3RRiC6rHdcE75s/1OZLZspwo2XSfsOVPeL7bq01SpuSuFikOW/BjX
	 YO8Xc77SC0KYA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87AAB17E155C;
	Tue, 22 Apr 2025 15:57:01 +0200 (CEST)
Message-ID: <a201bb4d-1dbc-4f21-b742-18ca3d35e1fa@collabora.com>
Date: Tue, 22 Apr 2025 15:57:00 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] platform/chrome: of_hw_prober: Support trackpad
 probing on Corsola family
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
 <20250421101248.426929-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> Various MT8186 Corsola Chromebooks (squirtle, steelix and voltorb
> families) have second source trackpads that need to be probed.
> The power supply for these are always on and their reset/enable
> lines are not exposed.
> 
> Add them to the probing list.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



