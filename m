Return-Path: <linux-input+bounces-13332-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E30AF0E91
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 10:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3384189A60D
	for <lists+linux-input@lfdr.de>; Wed,  2 Jul 2025 08:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2CFB22FE0A;
	Wed,  2 Jul 2025 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Op8cI2b9"
X-Original-To: linux-input@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14F6211C;
	Wed,  2 Jul 2025 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751446661; cv=none; b=TTnvNs+wHs/0gsxwmCaBljw3wuI1sQeGA2TYTk3z6cpSw2TbX3Pw2hdxEKzUWXhwd92R+gvGIqy276w1LX5mrQ8243P7ZXgFFPKr0nRVKViGpr7/ZrXyUW8ZjpNd7H+2BbH78mX4m2VXp5NozwuPNTbhX+TA+EzBVksgfN7RUZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751446661; c=relaxed/simple;
	bh=AA9AlIrZgAydaDEjjbmsNIEiAQNjOYkPwuQMM7PW/hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+Lf3AT88Htjd+UrJHPET1e91GP9WRrBpOL1+e2MtMWP6aWKqUwx8w7faMAG1J/9ALcDtNdgDudLIXku08M+BwnTsL1VU6oEtZmVFbuNzOoLhW9E7dOhx6uGZmf3zAVG48+SKHzN1kNQTtRWWNhftaC/w7uGgLVEay1toR4xOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Op8cI2b9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751446652;
	bh=AA9AlIrZgAydaDEjjbmsNIEiAQNjOYkPwuQMM7PW/hg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Op8cI2b9O6bAX4reORlcxA7sX3fWm61pByhJs7+IFee02nmz53x0Vk/5v3SQapl2/
	 6lVtnC8O/3lFCmqy2LgNB3ZP6ZpsqnBCBOmPpYmDaC+GwSbTI+bLKYrWIq4oZb9LEu
	 OyJm/uNOsDZDUv6AUwYF139FXcdtIIy3cjz5moAPV8hlwGCGxd25ZdmqznqZvnTE9T
	 6joiDhezFcor9i9fGncK0Cy9NkreimW9JNHkOl5sHB8/UT4J9ij+AHCiT9JdgLR+X5
	 +dxA1Gi9fFQYzcoBsGeq8fuKT2PfxMV4bjRPo9LVr42CotrNDil50f95uTlphhbKYK
	 bOdegJCZ9+OdQ==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE2B017E059B;
	Wed,  2 Jul 2025 10:57:31 +0200 (CEST)
Message-ID: <53dcc520-fd8a-4c6b-9bc0-cf9daf3e4597@collabora.com>
Date: Wed, 2 Jul 2025 11:57:31 +0300
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: add HDMI audio on ROCK 4D
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250630-rock4d-audio-v1-0-0b3c8e8fda9c@collabora.com>
 <20250630-rock4d-audio-v1-4-0b3c8e8fda9c@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250630-rock4d-audio-v1-4-0b3c8e8fda9c@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/30/25 1:19 PM, Nicolas Frattaroli wrote:
> Much like the Sige5, the ROCK 4D also has an HDMI port, so is capable of
> providing HDMI audio output as well.
> 
> Enable the SoC's hdmi_sound card, and also enable the SoC audio
> controller (sai6) that feeds into it.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

This worked as expected on my ROCK 4D board after enabling
CONFIG_SND_SOC_ROCKCHIP_SAI, hence

Tested-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


