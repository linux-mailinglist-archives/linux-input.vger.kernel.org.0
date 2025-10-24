Return-Path: <linux-input+bounces-15700-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F26CC06AE8
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 16:23:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEF663ACDA3
	for <lists+linux-input@lfdr.de>; Fri, 24 Oct 2025 14:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52BB202C5C;
	Fri, 24 Oct 2025 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="mTSKbx+l"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3001F542E;
	Fri, 24 Oct 2025 14:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315775; cv=none; b=sSUr94ZqlUrcJlLUzn/U8PammvyO2ynOUAVilapTBMVM/0Hg7uZIcba/B1kMkFEP7DTW2pp014hblwBRr73S8c7IeKqYKvryxgcOKICvXESCokh9FGvngrFRQQEFuooRQ+HbvqX5yvRyiHR4kzpKYKqwKcEEkz4TpboSh5rL+uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315775; c=relaxed/simple;
	bh=D8rwdLfRMn4havyDY8OTgR1d65A4aha3vFMkV1JJCg0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=N0gC73+/BH5LnIlLgfCRPKmy29jxWRgGcQo9Wt7TTMd2z68Xw4EM1bGTq2FZDvvA1PWa9RMv+BVdwUPfAdeF6P0ebvU8lJRmMLVl6JDsKUbMERdXaqsMcuuLsRniPnDEPSlHfWGcFNbs1rNWIQpCMcpnhCwQRfKDICEcLw1GY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=mTSKbx+l; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HuBoivuDNXV7Ej1/tQOGfJDgROX6oaEWQgF6U5IGuB0=; b=mTSKbx+ls5nJ2eqwWjtIdXH1zS
	wrRFUsG51Chiol9k/tARSG4fWdqGiqUXDL1NFnVuFBej3HKHA3QXfCminwia7MttpmvU7AvDEfbo4
	n2j9khE9t8JE7CG4UqsuL98krOKLU/irTDTVpogazf+eBEXOes5hPVs8tsfpx0s1w5YmC6yGNUxBO
	uQtcyhonCrojhWw6ljeysLmzZjAF+qBdgusck2V4wx3xnKo4VSsXn7L5AM7rxzVkscLzyB1XgS63v
	o7TvZPHKZx2rn+xqtjnleIb82AWCz/n7R6KlGR7Q2ObWc/z1tDc370cwSH4DN9KDghq7u8VY36Wsl
	WNJQb04Q==;
Received: from [::1] (port=58822 helo=sv9.manufrog.com)
	by sv9.manufrog.com with esmtpa (Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1vCIgk-0000000B6WQ-2Ehc;
	Fri, 24 Oct 2025 16:22:41 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 16:22:38 +0200
From: Staffan Melin <staffan.melin@oscillator.se>
To: zhangheng <zhangheng@kylinos.cn>
Cc: Terry Junge <linuxhid@cosmicgizmosystems.com>, jikos@kernel.org,
 bentiss@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, 1114557@bugs.debian.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v2] HID: quirks: Add device descriptor for 4c4a:4155
In-Reply-To: <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn>
References: <20250923022445.3276026-1-zhangheng@kylinos.cn>
 <e0dde746-3761-414e-8df1-eb8557cadbf8@cosmicgizmosystems.com>
 <e605f642-c967-4d41-8145-a10e8f48fb1b@kylinos.cn>
 <365f9f8e-549e-42e1-ac8c-7ff1f42c6977@cosmicgizmosystems.com>
 <8f0155d4-72a7-45ec-a272-7892e783bbed@kylinos.cn>
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <b29aadf6399a79b113f5dd7749fff437@oscillator.se>
X-Sender: staffan.melin@oscillator.se
Organization: Oscillator
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - sv9.manufrog.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oscillator.se
X-Get-Message-Sender-Via: sv9.manufrog.com: authenticated_id: staffan.melin@oscillator.se
X-Authenticated-Sender: sv9.manufrog.com: staffan.melin@oscillator.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Thank you,

I can confirm that this latest patch fixes the issue on my GPD Duo.

Tested-by: staffan.melin@oscillator.se

Many thanks,

Staffan


On 2025-10-24 05:32, zhangheng wrote:
> Hi Terry Junge，
> 
> I have made the changes as per your suggestion.
> mic.txt is the microphone report descriptor and is working properly.

