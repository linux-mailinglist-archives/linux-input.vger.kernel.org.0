Return-Path: <linux-input+bounces-5755-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1998F95C86A
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 10:53:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4E651F24113
	for <lists+linux-input@lfdr.de>; Fri, 23 Aug 2024 08:53:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A8F149009;
	Fri, 23 Aug 2024 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R09RmYji"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D2F1474D7;
	Fri, 23 Aug 2024 08:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724403180; cv=none; b=X4GqHLf5i/NLtj1/4mzALaquaZFbuDfBB06GTC4wosDQb/NgRT4LmcUV6XWhZgm9YSrHBisud+e2g80zBa4Wu+/C7g0xb4ghr2O/aaRxpuJj7CqyfkfvPvCHKAaNsWNfyGqOJW3ytn3FSqVzGaK8kP2F4y35ySqbNxKVgGNLwpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724403180; c=relaxed/simple;
	bh=jAZUNSCTbHtTAT0sSpKgfRRhAh8SlMCuJUduXH9mB7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BBgjsD/bPyG8GfOfYA0CppYYoMpG3cyJyAF7M93vTcrCj5EW5SbtpZG08BjJI1yDDFwrlTgWt76lj0y/u3RUKYSOBposDKNgX8TjM5qZhH3jNx0psQwS163c7ZEnFn1C9KXXGEdPmDI/RKPaJnGZ/D6IFe80xZFN/u7lCKx/gZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R09RmYji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829E2C32786;
	Fri, 23 Aug 2024 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724403179;
	bh=jAZUNSCTbHtTAT0sSpKgfRRhAh8SlMCuJUduXH9mB7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R09RmYjiwtTqkfNMmTKr4TVTin70hUYiOpGx+It/8f4eXUYTtl8Ie1GCdLKCNW2xz
	 E6Jk8hTjXowNmJ3zMIpQLkyDJ587Ykafxye2NscNSPef0NSiM83y09yJvAV06bgCH9
	 b4Z1MiC/f/hJaPW225ar2Al0709airtUWZ2ZlS093ibcry2R3f37MfgwoNHxLm3/3Q
	 j8dcqrpGcsTGHYZ3ZH6ZpiLnzL/yokhOV72Y8UE14Rcexrt8zGOgJySPcH8hxK0VAS
	 6v6vlrgZGEpaqrn5o4i+Ul1P3Cx9F0UOpXpGiN46gd2gqYjMjn1htCU7bJ62wyjO3C
	 SuI9wFv0jMK5A==
Message-ID: <e0f8dfd7-7232-4814-a5c9-58acd5c11d53@kernel.org>
Date: Fri, 23 Aug 2024 10:52:54 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] Input: samsung-keypad - use guard notation to
 acquire mutex
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, patches@opensource.cirrus.com
References: <20240819045813.2154642-1-dmitry.torokhov@gmail.com>
 <20240819045813.2154642-7-dmitry.torokhov@gmail.com>
 <e6xkutxnpu7acvm5qfyyces4estm4ihc3rzczqpnxrbrkptdm2@6lwrlssvtt3v>
 <Zsd-aVM6504L_hqi@google.com>
 <0afadefb-ecb1-4ec8-a862-bfa06d171457@kernel.org>
 <ZshJMRCe4LvpYNmZ@google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <ZshJMRCe4LvpYNmZ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/08/2024 10:32, Dmitry Torokhov wrote:
> On Fri, Aug 23, 2024 at 08:06:17AM +0200, Krzysztof Kozlowski wrote:
>> On 22/08/2024 20:07, Dmitry Torokhov wrote:
>>> On Thu, Aug 22, 2024 at 05:48:33PM +0200, Krzysztof Kozlowski wrote:
>>>> On Sun, Aug 18, 2024 at 09:58:03PM -0700, Dmitry Torokhov wrote:
>>>>> Guard notation is more compact and ensures that the mutex will be
>>>>> released when control leaves the function.
>>>>>
>>>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>>> ---
>>>>>  drivers/input/keyboard/samsung-keypad.c | 8 ++------
>>>>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>>>>
>>>>
>>>> You need to include cleanup.h (unless some other patch already did it
>>>> and I missed it?)
>>>
>>> Guard for mutexes defined in mutex.h which is pulled in indirectly, and
>>
>> guard() is not in mutex.h and in general we are including headers for
>> the things directly used in the unit.
> 
> Oh, but it is:
> 
> https://elixir.bootlin.com/linux/v6.10/source/include/linux/mutex.h#L196
> 
> DEFINE_GUARD(mutex, struct mutex *, mutex_lock(_T), mutex_unlock(_T))

That's DEFINE_GUARD, not guard().

Best regards,
Krzysztof


