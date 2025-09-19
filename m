Return-Path: <linux-input+bounces-14886-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E792B87EC2
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 07:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54D641C81A07
	for <lists+linux-input@lfdr.de>; Fri, 19 Sep 2025 05:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AC525B31D;
	Fri, 19 Sep 2025 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utt1xUmq"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461812AD24;
	Fri, 19 Sep 2025 05:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758260195; cv=none; b=cc8hKL9/QdLWDp3K7yLWpUavDtQqrGCanBX9RvPCBuZIWZzpJe3Xv9jvqamkQ2N8a1MsLu7LJOzdEvkIsybEIwkL+rCNSII9Sp2+LtYl6aZMlqgS502/ULV1KMwEK3pWWMD3yxhnMPTCaYvWsdEhYxUyUhTpoj7ocExvYH1eYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758260195; c=relaxed/simple;
	bh=zVUkgSHENxyI1Mixrk5iBXYTpigxhlQe37OI4rFVVk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpzCn7PsKDrhuEVKdNulKpeQ+mq1CfDRxs/4EDoATO6eO37SVZjRuRdQUycBcXiaYIY9opWRXFHGAPknBqRMdj/UCtMuz27iPXDLrT1ySIZ93wcO92dJYdnHsnoWtCsAQejSFAYeEF+m4UDDFTLn6+EK3zFRn4vwrHjIHiOnbRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utt1xUmq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBEA4C4CEF0;
	Fri, 19 Sep 2025 05:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758260194;
	bh=zVUkgSHENxyI1Mixrk5iBXYTpigxhlQe37OI4rFVVk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=utt1xUmqObkzWSY+8/0UE7KRJ2SvaK+Oyul6+pxnKDXU/CIpVuiqEJ9OLgq5ltjnz
	 4if+V/SDy1xLnSdMdNuTcggvAVeWuVEcpiEQsYNBZ3BjIeAaBMT46xMBbUl+wRI5yu
	 5MhtHGzDqjXGkUbRhv1DvcGX8edObtiUVTbnv+pe6R2MALaZkxoiK/v+7TtZqzASix
	 +Z2F6/Az/3j6nVapoJSC7qAAqX1Itt6qaF0mkVne2E0L4vIBvzIG5mgq9fl6o5OyGi
	 Eo8y9O8/w5qlVuq38oukUlX5jR4LMT8IaOMmKajOYKKsfuGnwHhmyNnxHxLoB2nbtU
	 +1Ky0XNnEqu0Q==
Message-ID: <c49cf225-c508-4e23-8786-5110a166d7c4@kernel.org>
Date: Fri, 19 Sep 2025 00:36:31 -0500
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Input: allocate a keycode for Fn+space
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Anton Khirnov <anton@khirnov.net>
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org
References: <20250714150756.21197-1-anton@khirnov.net>
 <20250714150756.21197-2-anton@khirnov.net>
 <u3qzdpgoe2appwnmv2rkcmyg6htrmltna3geymp7llootdwbts@ycmhljii34bz>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <u3qzdpgoe2appwnmv2rkcmyg6htrmltna3geymp7llootdwbts@ycmhljii34bz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/19/2025 12:12 AM, Dmitry Torokhov wrote:
> Hi Anton,
> 
> On Mon, Jul 14, 2025 at 05:07:57PM +0200, Anton Khirnov wrote:
>> The Asus ExpertBook B9 laptop sends a WMI event when Fn+space is
>> pressed. Since I could not find any information on what this combination
>> is intended to do on this or any other Asus laptop, allocate a
>> KEY_FN_SPACE keycode for it.
>>
>> Signed-off-by: Anton Khirnov <anton@khirnov.net>
>> ---
>>   include/uapi/linux/input-event-codes.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
>> index 3b2524e4b667..a49b0782fd8a 100644
>> --- a/include/uapi/linux/input-event-codes.h
>> +++ b/include/uapi/linux/input-event-codes.h
>> @@ -548,6 +548,7 @@
>>   #define KEY_FN_S		0x1e3
>>   #define KEY_FN_B		0x1e4
>>   #define KEY_FN_RIGHT_SHIFT	0x1e5
>> +#define KEY_FN_SPACE		0x1e6
> 
> I'd rather we did not add more codes with no defined meaning. I regret
> that we have KEY_FN_* (with the exception of KEY_FN itself). Since
> nobody knows what this key is supposed to do maybe map it to
> KEY_RESERVED and whoever wants to use it can map it to a concrete key
> code via udev?
> 
> Thanks.
> 

Any chance you can look at Windows and see what the key actually does 
when you have the matching OEM software installed?

I've seen a bunch of laptops that FN+SPACE turns on/off keyboard 
backlight.  Maybe that's what it does.

