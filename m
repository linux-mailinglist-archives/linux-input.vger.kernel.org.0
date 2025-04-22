Return-Path: <linux-input+bounces-11920-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6685DA96DA1
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 15:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76C35164F99
	for <lists+linux-input@lfdr.de>; Tue, 22 Apr 2025 13:58:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5307328B4EC;
	Tue, 22 Apr 2025 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oe0CVLPR"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743DF281530;
	Tue, 22 Apr 2025 13:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745330241; cv=none; b=k0FLGO+bymSnxzRRchS6OeRQQwiyfbACTBDpFvx37xHlKyG6X/Ns+hzVq8RTupgV86zKPLhdqsbVRynyTmwEfpEtY/EPmN39mhrX8rin+RxCzG/Qn1VdgX7FCEqt7Y2VR89sp0Jm4alpyIrn/TfwpkCJcSytH5WUYEDq8Pfz7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745330241; c=relaxed/simple;
	bh=BLr1Iiik2vEEXPZBT2XxibrJ3gHHLcnn4LfvqfMJQ5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j7w4jCr897s2735wglpWBMX4+J//yU397rOEjmmhpZ6sS6YjpGDxEEBxosH6MBs+82MMxo0wVN33UCAgdI5rYkDUkd4LZkqqwppM9O85mLCrnVEFi3auWEQ2+A/zBnt/awKn2gByd0S6I5xxNm55gp4ipl5sWMEG4LsDmfryJN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oe0CVLPR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330237;
	bh=BLr1Iiik2vEEXPZBT2XxibrJ3gHHLcnn4LfvqfMJQ5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oe0CVLPRxvOuXTqdrn5jptO2HwBGymkZb3BchyMPPsVVgo6HjlUP3kBCeya+9gkPk
	 2211W/G/IGQFaxLMi5A7dXX5BbWB7/eoD0P6XBJRIKoSGbsPSiCzYeE/Rc0ZwbGObL
	 e4F8cPmPCbtqp1wkFMAbJpp+XXPHRPNjJt3m82ZGs2Flu65zEwo/wC9vn/xvfrMuq2
	 05FWeSS6dfh/nu3rFkGFT1OTouSHZxWBTCEnFrHLnsGs+osoyUgVeE7TG5fCau/mmi
	 Qg/OIKdn+k+HEqqALzYmgqmd9rMI49wwV+qIWC0nUBeB0KlZ7WdDU/m1nTQMJ3+S9u
	 qQbo9uPqrnStA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C8C2817E157E;
	Tue, 22 Apr 2025 15:57:16 +0200 (CEST)
Message-ID: <e9d8c9e2-9d54-411f-85e5-ece70886bdcc@collabora.com>
Date: Tue, 22 Apr 2025 15:57:16 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: mediatek: mt8186: Add Squirtle
 Chromebooks
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
 <20250421101248.426929-7-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> Add a device tree for the MT8186 based Squirtle Chromebooks, also known
> as the Acer Chromebook Spin 311 (R724T). The device is a 2-in-1
> convertible.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




