Return-Path: <linux-input+bounces-7816-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453CE9B828C
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 19:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B0B3BB23E54
	for <lists+linux-input@lfdr.de>; Thu, 31 Oct 2024 18:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D8B1C9B9A;
	Thu, 31 Oct 2024 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="tqHAipJY"
X-Original-To: linux-input@vger.kernel.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816DF1BCA05
	for <linux-input@vger.kernel.org>; Thu, 31 Oct 2024 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730399039; cv=none; b=j59+Toyzerzr8nmn4MXqElSZ1ICfxmGu29FPbfctLJvK1t92VDBMdogBARlKwikj+umnzieGJdzsYIhHjedD6NSlJH9vqf0iOccVUw+cTkdp/ARpduIfw/X8WB7s5xtwwBRV3NFFAtuibB2iu5eXTp1BTA+XpTT0ocU1rz+sloo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730399039; c=relaxed/simple;
	bh=20yAbHsoU9d8bleZtcQzSSGzQ6PiyihMmvcsDu0ZIPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QgV7IMyN/4YIKT+In72LPSjjxR4ykWdPM/4TmMzDtrPasSpyi6GLOudffiPVqGkZB6FR8OfAu8WYyg9F2MmfRm5BMQkCWig05aI9JfUZTIB1wRQ1i9G2MaR7H/IFElVeqtrScMQM2sEXQJ8C0nwNdxB60E+ByR/lbwswGyK2Wq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=tqHAipJY; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5BC9488DE8;
	Thu, 31 Oct 2024 19:23:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730399035;
	bh=xecPqWen4nGjf9ehy9y+EAHTeLYIQMthCY4HDZXYCnE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tqHAipJYAk67fcJ8l656J6XqHUiknilbG49SrPlxJCoyw0uOpOaM71VdTvcDwh2Xt
	 OeDfl+o788yNMsUgVUW5QlcRIqYg0bSExoVJb5WfuKTIw8v+ANNbjhlY/JD7RsiYgf
	 Kv7TLFXE1EVcRW/QRdxIrASjcS4KIQKA7/sAtuHQVwb7d9ccv/UbrEqhfzpFNt0F01
	 P6c/g76JE97MJuL4Qgy2FyvV/I2N1UR8YlR9Tl9LdncSXy145hzhnPlzUbT52tbgPQ
	 0Ff6LDDiWTFcadHAzi/dkDHysB7nbxVf9jUfHZOjfmiXVWTxyHGqQTLxEMh+uX1obg
	 TM+9J1CN8+0ZQ==
Message-ID: <4b7f0fcc-781a-4725-8985-6d033c0e9dac@denx.de>
Date: Thu, 31 Oct 2024 19:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: ads7846 - add dummy command register clearing
 cycle
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@dh-electronics.com
References: <20240320072533.170029-1-marex@denx.de>
 <dfc1b846-24ea-42c4-adfe-2b762e2f8851@denx.de> <Znstp_l5l2PUgIfP@google.com>
 <CACRpkdaC79-UPDg17cnanBFbsnOrzgwks7HCLxfrn_eBwNuXxA@mail.gmail.com>
 <ZnyXMLJBvuryshct@roadster.musicnaut.iki.fi>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZnyXMLJBvuryshct@roadster.musicnaut.iki.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/27/24 12:33 AM, Aaro Koskinen wrote:
> Hi,
> 
> On Wed, Jun 26, 2024 at 02:40:00PM +0200, Linus Walleij wrote:
>> On Tue, Jun 25, 2024 at 10:50 PM Dmitry Torokhov
>> <dmitry.torokhov@gmail.com> wrote:
>>
>>> I am concerned that we are putting workaroud for a single controller
>>> into common function. Can we quirk it based on compatible? If not then I
>>> would like someone to run tests on other controllers. Unfortunately I do
>>> not have such hardware.
>>>
>>> Linus, do you have devices with ads7846 or tsc2046 by chance? Spitz?
>>
>> Sadly I do not, but it is inside the Nokia770 so maybe Aaro can test it?
>> (Not sure if Aaro has the 770 though...)
> 
> I sure have 770, and I can test patches.
> 
> However, ads7846 has regressed and it has been broken on 770 for
> a couple years already as half-duplex support got suddenly deleted
> without any pre-warning to users (770 was using this driver maybe
> a decade without any issues). I reported this as a regression but
> input maintainers preferred to prioritize "nicer hardware". See e.g.:
> https://marc.info/?l=linux-input&m=164783764828520&w=2
> 
> I'm planning to restore the half-duplex support for 770, but it's not
> on my top prioriority list so it will take a while.
> 
> Meanwhile, maybe you can ask the users of such "nicer hardware" to test.
Seems there is basically no interest anymore . Can this patch be applied 
or how shall we proceed ?

