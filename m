Return-Path: <linux-input+bounces-3199-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 057098AE9FB
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 16:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0C311C21FCB
	for <lists+linux-input@lfdr.de>; Tue, 23 Apr 2024 14:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED0837144;
	Tue, 23 Apr 2024 14:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="auyV/xM6"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB0613BAD1
	for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 14:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713884377; cv=none; b=bLgkUzQ0FWsnyIr/F60jJGRs3W6w+Ea/gXTZx6plJf/umIqEIcHN4b2sLnPFvZ4pPPoMiZVnz6cnsItkomDvg4w/QeoIPCxKW8DengL66dUfuhyqgt28AEDKyR2NH/SyY5OVmnn5Tct4/of0BgD+btAua7pslq36PsARwxQjLds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713884377; c=relaxed/simple;
	bh=QouSukckyfgBKXDrWVjXbQQdsZEvjQ5swskjuKrz8ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C1my1uN75BLpEQ9nZEFd/ORPz0TKCBwsMOnJ+luSl+mWGL2u7gHC6LtMsOZxVi0YFOIhaEvxa2eth7AvMlXXvbP5e2vhPdtRodCR8FjEK4+UmOyRAAsbif1xrrCIkEbZ6khGzXexdiF6ycb8+CXQ+AyIZytb1ETe6bUYj77LULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=auyV/xM6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4196c62bb4eso30905215e9.2
        for <linux-input@vger.kernel.org>; Tue, 23 Apr 2024 07:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713884374; x=1714489174; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hNylIFVf8XBh22EaEBaD06CJe6GjUGn3xRATV9jc2go=;
        b=auyV/xM6N8Ai7sxsiuPkXL/2oLZjCS769Xjb0HMrsEg+cFv9QR27+3YWV8pEzOyxqL
         l2Y81bGU+8KZqjBmWAtOSNDRx6y9LhtY0wP/7C6YO/hDBZqD9ksyvtAeyudhEl+Jy8CQ
         +BDkdU/vP/Id5XHTT5zbB6w4ySbOk0QftcgebX8ulRip1tHdaxg/nEkxjW6ryWXR5/nj
         xxxjsBd0nbFqv9pxZuxaosL8XDAMpt9kS0tmSRm7v5GZTFe1kyaEdd2JhWtMw6F9QJ0v
         hM8dgjksvZvoT/PCIfn8s6oUJ7B9x7LRDw3Jq9Gx/4++LjZC35VLNwJqTCTBGKTdPoj8
         eOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713884374; x=1714489174;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hNylIFVf8XBh22EaEBaD06CJe6GjUGn3xRATV9jc2go=;
        b=VkAXwZYvLjGAKwuEBcmdVjK367SXHM6JS1TSU1uLglPe9sDDLzWbMYTaxbnF0yb7to
         2d2K1YgLugsmg82L5L8IBrrmrYB6nm79myMw0P1938n1MkNpTtQQkflxmmcwg45tXag1
         v7agVuWt/px742lNLhVzy+a4fvibh9hNslt3TVZuZJXMX3tL+/nsdXzCcce3GV1jrscH
         5iAgMkXdUrQbuRXvkHqXrp/580eCW3odFurABnE32WfYb4Nn+AzwQz+v+ZebabCUBZnY
         0nO9+le1qkscpTVUs8kIfQhvQa+dLIxjTTSnJcHmboOVR4HMyAKo7UMOeoTNclc/ps18
         2BZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJ05FgwPKZa3CZ6XYRRFsW57vZc+znj9vcI8mpTaB9qmV2MdI2g1MmH6aIVGbto7c/4pYyAD/ejwoYo75qMFJ1smDmn51uuJRghrk=
X-Gm-Message-State: AOJu0YxMJpAy3IkTjfnIEiVkKEDTuCEGghOwnfYpybCduKrZ3kpR6a9o
	bE3Ut7lPzRCZMyiV0U18wkGynCvmk7CEChrFP2r4JMUF8ZzdYGiPB4E0+HPYm3U=
X-Google-Smtp-Source: AGHT+IGWn/XnbjiN94q6KClBXQXuqeRES3TOlOesdyrN+8tE6QbyFe9XIYfTTlzKjhVTpRxyt7/c6w==
X-Received: by 2002:a05:600c:1988:b0:418:bbb6:95b3 with SMTP id t8-20020a05600c198800b00418bbb695b3mr10055130wmq.0.1713884373801;
        Tue, 23 Apr 2024 07:59:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id r16-20020a5d6950000000b003477d26736dsm14797515wrw.94.2024.04.23.07.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 07:59:33 -0700 (PDT)
Message-ID: <1714205b-39cf-4803-b251-a35f6b9ab3e9@linaro.org>
Date: Tue, 23 Apr 2024 16:59:31 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616
 compatible
To: Andre Przywara <andre.przywara@arm.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, James McGregor <jamcgregor@protonmail.com>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
 <20240422164511.2488261-2-andre.przywara@arm.com>
 <20240423111502.6e068887@donnerap.manchester.arm.com>
 <f2021c5d-25fa-4bdf-8f8c-b0bc271eb54e@linaro.org>
 <20240423135106.02ab4473@donnerap.manchester.arm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240423135106.02ab4473@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/04/2024 14:51, Andre Przywara wrote:
> On Tue, 23 Apr 2024 14:18:23 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
> Hi,
> 
>> On 23/04/2024 12:15, Andre Przywara wrote:
>>> On Mon, 22 Apr 2024 17:45:10 +0100
>>> Andre Przywara <andre.przywara@arm.com> wrote:
>>>
>>> Hi,
>>>   
>>>> From: James McGregor <jamcgregor@protonmail.com>
>>>>
>>>> The Allwinner H616 SoC has an LRADC which is compatible with the
>>>> versions in existing SoCs.
>>>> Add a compatible string for H616, with the R329 fallback. This is the
>>>> same as the D1, so put them into an enum.
>>>>
>>>> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
>>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>  
>>>
>>> Compared the descriptions in the manual between the R392 and the H616, they
>>> look the same:
>>>
>>> Reviewed-by: Andre Przywara <andre.przywara@arm.com>  
>>
>> Why do you review your own patches? Does it mean that you contribute
>> code which you did not review before?
> 
> I just merely sent the code on behalf of James, because he had trouble
> with the email setup (Protonmail has no SMTP), but didn't want to delay
> the post any longer.

OK, thanks, I suggest using b4 relay in the future.

> 
>> This is odd process.
> 
> I agree, I would have liked it more if James would have sent it himself,
> and then my review would look more natural, but with my review I
> wanted to explicitly point out the technical correctness. Besides: I found
> this ordering issue in the other patch only after sending, so needed to
> somehow respond anyway.
> Also I wanted to make the process transparent: someone posts a patch (in
> this case via a proxy), then it gets reviewed.
> 
>> Your Review is implied by sending the patch.
> 
> Is that really true? I was under the impression that sending is

For authorship, both tested and review are implied. You cannot send code
which you do not think is correct, therefore your authorship fulfills
entire Reviewer's statement of oversight. There is nothing new said in
statement of oversight comparing to what authorship says.

Now for testing, I think it is also kind of obvious that whenever we can
test our own code, we test it.

For sending other people patches, we could disagree. I stand that I
would not ever send incorrect patch intentionally. Therefore reviewer's
statement of oversight is entirely redundant as well. I just cannot send
someone's patch without reviewing, thus without adhering to points
expressed by statement of oversight.

> independent from review. I mean I doubt that every maintainer sending
> patches up the chain (when they add their SoB) implies a *review*? Surely

Yes, every. This applies to mass-maintainers, like netdev, Greg, Andrew etc.

Every patch I apply to my subsystems is reviewed by me. I cannot do
else, because that is the requirement of maintainership.

There are however maintainers (see i2c patches or Intel DRM) who accept
patches and do not review them. When they review, they provide
additional Rb tag + Sob. This is weird because it means when they accept
patch, they take it unreviewed! Their SoB does not imply reviewing patch
and this is in contrast to kernel process.

BTW, Stephen Rothwell mentions this to every maintainer on adding their
tree to linux-next ("You will need to ensure that ... reviewed by you
(or another maintainer of your subsystem tree)").


> they do agree on the patch (also typically expressed by an Ack), otherwise
> they wouldn't send it, but a "review" is still a different thing.

IMO, this would mean such maintainers accept code which they do not
understand/review/care. They are just patch juggling monkeys who take
something and push it further without doing actual work.

That's not how maintainership should look like. Maintainer must take
reviewed code and, if other maintainers do not review, then they must
perform it.

> The Linux history has both Rb + SoB from the same person and just SoB
> signatures, so I assume that it's not implied.

It depends on people. As I said, I2C and DRM provide Review tag. For me
this is silly and suggest that all my work, that 1000 patches I took,
was not reviewed.

> 
>> And you have there SoB which indicates you sent it...
> 
> Yes, but SoB just means I sign off on the legal aspects: that I got the
> patches legally, compliant with the GPL, and that I am fine with and
> allowed to release them under GPL conditions.
> That does not include any code review aspect, AFAICT.

So you want to say, that you are fine in sending intentionally buggy
code, knowingly incorrect, because your SoB and your "git send-email"
does not mean you reviewed it?

Best regards,
Krzysztof


