Return-Path: <linux-input+bounces-7725-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 609759B2898
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 08:17:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E80D8282030
	for <lists+linux-input@lfdr.de>; Mon, 28 Oct 2024 07:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB4818FDDB;
	Mon, 28 Oct 2024 07:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRuXIMqc"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D771E517;
	Mon, 28 Oct 2024 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730099861; cv=none; b=h0qF56aESuzHGjCj/dtKOQabefkSz5tY2LxwjHg8B/YFb+trSwbAHLTJZhWqtnDD4rXzgGGI8OabzPvJL7kOtey9xZxyitBDWsgwmoMCOQj1GfiYp1XQG/NPTRyYWot59m245H1yEME1q42/4ZQt2R8OK/K/UKeE/qx7K7McfTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730099861; c=relaxed/simple;
	bh=i0c+n5f0SHtSU5lwE7cgKEI5P4wFfDaASqDFa59i0zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9nACOdCRnzxZTnNtMaED1hdmAvIoe1Fqd2Z8+ZV7qXAmvc1Je6tRtQLGMD/d5QwnnHHdlbIHEgfd7hSFFXZ6TT4n5ZYSuPM25PmXBn1Aaw//96tJLDkku9OtFLYBtbCtJUAZBV3/nt2gf2WqEGb3m+glciW1EvdbMGgCVtAlm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRuXIMqc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A652C4CEC3;
	Mon, 28 Oct 2024 07:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730099860;
	bh=i0c+n5f0SHtSU5lwE7cgKEI5P4wFfDaASqDFa59i0zs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nRuXIMqc8Hs8SzdUdSmj3YU4gf8p8v30Mt2eGwBcA5ebefnGe3JFOsEamXHiyfBVN
	 ril82XscbsM9I6pLKjsBIZB5flikoBa9oeQxgAN/J9kqtBN0XvNBNQ0JSGT25ey+Yw
	 KrMbiUPFfPYSyUC47Rwme5Cgg9SOKxvCXZnHvXqmzWXxpe6p1IkJ34pqzTJnc2437C
	 +B4LEcFEkKToY+LT4Bom5V/NFgirQMXYtVPGbO9EaiXgRQjCn6kcywBoDnvkscnXis
	 Ddz0cbAFxxa0lP1ZYZJ6lGJ18c/6y7tlzrt4imlE3cg6xruvLhABAD+Btd956d3cQL
	 JFQYQMRztymaQ==
Message-ID: <754d58bf-e923-43c3-94d0-a423ea364b6e@kernel.org>
Date: Mon, 28 Oct 2024 08:17:35 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: input: Goodix SPI HID Touchscreen
To: Doug Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Cc: Charles Wang <charles.goodix@gmail.com>, dmitry.torokhov@gmail.com,
 hbarnor@chromium.org, conor.dooley@microchip.com, jikos@kernel.org,
 bentiss@kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241025114642.40793-2-charles.goodix@gmail.com>
 <3ypn62dsgarvmxkmdglugcinxmvpmhdqub2zvkygaonn54odf6@amfgijfcd3l3>
 <CAD=FV=X1F3QC=eSXcCn-78iQBzHMzT3z9Sis3yXKW_Bzun3+EA@mail.gmail.com>
 <CAL_JsqLwOekE1mz+3g8NTE3o4GhE9PWwR1Jfk_tL0RYKQmCg-A@mail.gmail.com>
 <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAD=FV=VHMfc2kJo2N3jkB9BR0H7SN2g9JqoDkZuZOOuq0OV6gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/10/2024 18:19, Doug Anderson wrote:
> Hi,
> 
> On Fri, Oct 25, 2024 at 8:59 AM Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Oct 25, 2024 at 10:29 AM Doug Anderson <dianders@chromium.org> wrote:
>>>
>>> Charles,
>>>
>>> On Fri, Oct 25, 2024 at 5:03 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - goodix,gt7986u-spi
>>>>
>>>> Compatible is already documented and nothing here explains why we should
>>>> spi variant.
>>>>
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  reset-gpios:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  goodix,hid-report-addr:
>>>>
>>>> I do not see this patch addressing previous review. Sending something
>>>> like this as v1 after long discussions also does not help.
>>>
>>> Krzysztof is right that it's better to wait until we get consensus on
>>> the previous discussion before sending a new patch. I know you were
>>> just trying to help move things forward, but because of the way the
>>> email workflow works, sending a new version tends to fork the
>>> discussion into two threads and adds confusion.
>>>
>>> I know Krzysztof and Rob have been silent during our recent
>>> discussion, but it's also a long discussion. I've been assuming that
>>> they will take some time to digest and reply in a little bit. If they
>>> didn't, IMO it would have been reasonable to explicitly ask them for
>>> feedback in the other thread after giving a bit of time.
>>
>> If the firmware creates fundamentally different interfaces, then
>> different compatibles makes sense. If the same driver handles both bus
>> interfaces, then 1 compatible should be fine. The addition of '-spi'
>> to the compatible doesn't give any indication of a different
>> programming model. I wouldn't care except for folks who will see it
>> and just copy it when their only difference is the bus interface and
>> we get to have the same discussion all over again. So if appending
>> '-spi' is the only thing you can come up with, make it abundantly
>> clear so that others don't blindly copy it. The commit msg is useful
>> for convincing us, but not for that purpose.
> 
> OK, makes sense. Charles: Can you think of any better description for
> this interface than "goodix,gt7986u-spi"? I suppose you could make it
> super obvious that it's running different firmware with
> "goodix,gt7986u-spifw" and maybe that would be a little better.
> 
> I think what Rob is asking for to make it super obvious is that in the
> "description" of the binding you mention that in this case we're
> running a substantially different firmware than GT7986U touchscreens
> represented by the "goodix,gt7986u" binding and thus is considered a
> distinct device.
> 
> At this point, IMO you could wait until Monday in case Krzysztof wants
> to add his $0.02 worth and then you could send a "v2" patch addressing
> the comments so far, though of course you could continue to reply to
> this thread if you have further questions / comments.

And to re-iterate: both commit msg and hardware description in the
binding must clearly explain this why another compatible was chosen for
the same device.

Best regards,
Krzysztof


