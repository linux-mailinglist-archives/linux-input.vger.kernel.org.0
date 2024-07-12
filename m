Return-Path: <linux-input+bounces-5011-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3805192F9DC
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 14:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E746A284777
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2024 12:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC89816B388;
	Fri, 12 Jul 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MrYl3G4K"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1DF26AED;
	Fri, 12 Jul 2024 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720785767; cv=none; b=b37kc66t05Lort4tF6M6aigpxRH3GOHw8ISRijbmnA8F5LFxz2mxx4hscs3Io7F/KLwu+kOIvhq8qqUZKpMiDx12GtyuvO8fFqk8d4+KhwGvNc3kCQ4LkhdMedGjtLI+Rxis0ucri4+dckpqx6X+LlNyZPdrbKP6gp0F4YNE1WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720785767; c=relaxed/simple;
	bh=5rxqIu8eGYx5KmffsSFo9gVevBhAc4fDHQYpKo0bY0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KRhn8EXJCI4PSyQ6Y7kNXovSBCJI9UUSCAWsnLM9swO4hRF5oQESvBLZ72CM0jZimddlSsucLWj3yt2KQnlsqktqn0el6wmnMmpxWsKN3W5BhNy28PIZ5gm5IiZF9P34Cl9wJdHSpbVG7EscMEpGCp/ZzSiAxWQyVMWyNXErbSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MrYl3G4K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941DDC32782;
	Fri, 12 Jul 2024 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720785767;
	bh=5rxqIu8eGYx5KmffsSFo9gVevBhAc4fDHQYpKo0bY0c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MrYl3G4KkVblErIuk4+J48p1sOgqd3ZMTPkMlZmMPsJNoNRUP6n0GdA/WovqpaX6H
	 Cbv+u1fSHq0uKO72dazih+wgJcJbhnxU+ZH2Br6sA4PwfWl0Xd/J30lShfQBAQwO44
	 rrqw+wnBKQuThnlOaV0GxKucCQRBXnFov3B4TdOhDjxK6z2V3oLDsXFNi7Heh8uDVx
	 KSI4X5To3dpsodn2TJ1vh6tuIkc6IXZlQS2ptHeEgyTq2/0TlCswnSLi/baxmUGQKb
	 UzxwW6AYa167FoeJJ3CQeRYEiOeEbI3zMLekmL/DTjvGn/WsPC6ul66xtsh2rRFtkh
	 wTcQZ/LDouVlA==
Message-ID: <b6cf55a8-5032-4db9-9431-b938158a1706@kernel.org>
Date: Fri, 12 Jul 2024 14:02:40 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/5] Add support for Awinic SAR sensor
To: wangshuaijie@awinic.com, jeff@labundy.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
 dmitry.torokhov@gmail.com, kangjiajun@awinic.com, krzk+dt@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 liweilei@awinic.com, robh@kernel.org
References: <ZmEnMPhKzqkJssQE@nixie71>
 <20240712094925.2395733-1-wangshuaijie@awinic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240712094925.2395733-1-wangshuaijie@awinic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/07/2024 11:49, wangshuaijie@awinic.com wrote:
> Hi Jeff，
> 
> Thank you very much for your valuable suggestions. They are indeed a great help to me. 
> 
> There are some issues with this driver, but I will do my utmost to improve it 
> based on your advice. I will change the input subsystem in the driver to the 
> IIO subsystem and place it in the IIO/proximity directory. I will also modify 
> the structure of the driver to make it appear more reasonable.
> 
> On Wed, 5 Jun 2024 22:04:16 -0500, jeff@labundy.com wrote:
>> Hi Shuaijie,
>>
>> On Wed, Jun 05, 2024 at 09:11:38AM +0000, wangshuaijie@awinic.com wrote:
>>> From: shuaijie wang <wangshuaijie@awinic.com>
>>>
>>> Add drivers that support Awinic SAR (Specific Absorption Rate)
>>> sensors to the Linux kernel.
>>>
>>> The AW9610X series and AW963XX series are high-sensitivity
>>> capacitive proximity detection sensors.
>>>
>>> This device detects human proximity and assists electronic devices
>>> in reducing SAR to pass SAR related certifications.
>>>
>>> The device reduces RF power and reduces harm when detecting human proximity.
>>> Increase power and improve signal quality when the human body is far away.
>>>
>>> This patch implements device initialization, registration,
>>> I/O operation handling and interrupt handling, and passed basic testing.
>>
>> Thank you for your submission! It's always great to see new devices
>> introduced to the kernel. Maybe I can give some high-level feedback
>> first.
>>
>> Unfortunately, I don't think we can review this driver in its current
>> form; the style and structure are simply too different from what is
>> expected in mainline. Many of these problems can be identified with
>> checkpatch [1].
>>
>> To that point, I don't think this driver belongs as an input driver.
>> The input subsystem tends to be a catch-all for sensors in downstream
>> kernels, and some bespoke SOC vendor HALs tend to follow this approach,
>> but that does not necessarily mean input is always the best choice.
>>
>> SAR devices are a special case where an argument could be made for the
>> driver to be an input driver, or an IIO/proximity driver. If the device
>> emits binary near/far events, then an input driver is a good choice;
>> typically the near/far event could be mapped to a switch code such as
>> SW_FRONT_PROXIMITY.
>>
>> If the device emits continuous proximity data (in arbitrary units or
>> otherwise), however, IIO/proximity seems like a better choice here. This
>> driver seems to report proximity using ABS_DISTANCE, which is kind of an
>> abuse of the input subsystem, and a strong indicator that this driver
>> should really be an IIO/proximity driver. If you disagree, I think we
>> at least need some compelling reasoning in the commit message.
>>
>> Regardless of this choice, this driver should really only be 2-3 patches
>> (not counting cover letter): one for the binding, and one for a single,
>> homogenous driver for each of the two devices, unless they have enough
>> in common that they can be supported by a single driver. Mainline tends
>> to avoid vendor-specific (and especially part-specific) entire directories.
>>
>> I agree with Krzysztof's advice in one of the other patches; I think it
>> would be best to study some existing drivers in mainline to gain a
>> better sense of how they are organized, then use those as a model. If I
>> may suggest, consider referring to drivers such as [2] and its cousins
>> in the same directory; these are capacitive proximity sensors that can
>> be used as buttons, but SAR devices tend to be built upon the same principle.

Not much improved in v3 in this regard.

Sorry, this code is not ready for review. There are so many trivial
style issues, it's like someone sends us Windows drivers for Linux.

Best regards,
Krzysztof


