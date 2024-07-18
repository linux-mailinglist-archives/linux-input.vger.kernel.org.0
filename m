Return-Path: <linux-input+bounces-5073-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A42934545
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 02:06:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5984C1F21D99
	for <lists+linux-input@lfdr.de>; Thu, 18 Jul 2024 00:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3666197;
	Thu, 18 Jul 2024 00:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OIGyU1y9"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FC4195
	for <linux-input@vger.kernel.org>; Thu, 18 Jul 2024 00:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721261205; cv=none; b=RHqvsJtdgtZqDvKsbOzWWiId1WTg2R+sRwWcjfi+vQ8iTYmSXf1Mc9fgIT7XRCidaZAg33dOzFJJ6sVXxs5q6cAhCx4eLWoop7JTb1I3/xfF1/8vIudga2bagNl2o1jbpe/B8HTMJSZkBqUBVN3G/fxOYTm/VUjmP9sFNvdu2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721261205; c=relaxed/simple;
	bh=Xkz58+QSvJiuTlC2lz/e84dYQNbL0WG8gkdYmvlTP98=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=G7H5DFuUqjE3wY848x8odYEkbqA1TYCaKS1Rqh/V0oEIPMSylvr5q9W/bI+Mu3421qN0paKEsWTWi8mx9O4RrmHTY4xzhgr/1q08YqfjUFo7pQsL00vCxpGlH08OyO8Kly0jV9iCFWJXWiRQCpjLQfHe3HlgODloJvuQtrfb2Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OIGyU1y9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6923C88786;
	Thu, 18 Jul 2024 02:06:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1721261201;
	bh=4i0laKYJYx/PH7HTEEUc8C2HKzaw5whI88YKq09O69k=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=OIGyU1y9FES4QuIgDJNG1CO4ztV3eYbtcRkWP6RBR8Ng4YkRh0aKVMWjthrA+yOR4
	 IOUlNpEQPV2z/FGp/nfRoymR6noRP7EoNPqBcyfgHKJ8BtS01irqPDtH0n2KC7/ZOt
	 tbPuuNur1DvkHdXjXU3r/mg2G5jHowewSu14o7qB0907TblLIFrDQGJD1jq/QrmQqQ
	 clZe7SeQVbM0drIWZTxiG1xUDk8p5YaNUquk+JOyZMKOE3dAUVaFjaUyI1vD41dK15
	 g1iONhDWiD2U0Ji9+/YUJzqOmkJsjTDkHPANSHZZny0pGd740WuBXNgukDsRntCxO/
	 gZzSWtxH1Nbtg==
Message-ID: <ef0cb137-5155-4956-bda0-70757a05066c@denx.de>
Date: Thu, 18 Jul 2024 02:02:50 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Input: ads7846 - ratelimit the spi_sync error message
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, kernel@dh-electronics.com
References: <20240708211913.171243-1-marex@denx.de>
 <8AA709E7-9739-4CC9-B6EE-77D152B35984@gmail.com>
Content-Language: en-US
In-Reply-To: <8AA709E7-9739-4CC9-B6EE-77D152B35984@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 7/8/24 11:39 PM, Dmitry Torokhov wrote:
> On July 8, 2024 2:18:57 PM PDT, Marek Vasut <marex@denx.de> wrote:
>> In case the touch controller is not connected, this message keeps scrolling
>> on the console indefinitelly. Ratelimit it to avoid filling kernel logs.
> 
> Instead of ratelimiting, maybe we should try reading touchscreen state when
> probing and abort if the device dies not respond?

Ratelimiting also helps if the touch controller fails or disconnects at 
runtime, which would still trigger the scrolling messages. With this 
cheap prototype hardware, that happens.

