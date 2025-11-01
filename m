Return-Path: <linux-input+bounces-15847-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BBA1C278AB
	for <lists+linux-input@lfdr.de>; Sat, 01 Nov 2025 06:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC99C1A258D1
	for <lists+linux-input@lfdr.de>; Sat,  1 Nov 2025 05:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 050B21B043C;
	Sat,  1 Nov 2025 05:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="YM77R2JI"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055FF15687D
	for <linux-input@vger.kernel.org>; Sat,  1 Nov 2025 05:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761976738; cv=none; b=uSE04EsKdkp7eypjwzbzxi+xRUvu5Dr41vX1HCyTSpYelBqwSSOCitwgtdUnjDwKqnlRN25MTKE7M9b9fr1F5eW5vgbjgBuMW8VogdoRynwODYtCOqZsAwLM74iidgIYlxYlFvsTAaxEWfJADHYV3k9XFa0jXu8HYUik7+54Ghk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761976738; c=relaxed/simple;
	bh=hCyOfjed8ys3sBOIK1DAMnBwEqnA/5RbGrLTogfpar4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lbsmk04xwrLITiYn82yPUIT7hWysx7Ot8eQV+dyOSXE5bvIb8yAVlHqNxXgyE/984EsXhN4MlACu8PXhET9dFv3OvyQVPq8dHG6WTMIfwT4lTslecT5EMHK2046R4ua/bzbhBwLooUJzVYYmFt5+MvDo0mB60sMmMcihTRzat+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=YM77R2JI; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1761976339; bh=hCyOfjed8ys3sBOIK1DAMnBwEqnA/5RbGrLTogfpar4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YM77R2JIN8zruN4Cq/yv1hM4axPnBOoBi4t96S/eoK4j3X/CrwsGoBfGQ1q5SxlXw
	 eg+EGk4Wfo2jKKrB0vLcXCoMKJIPzcJ5CqvIH3nR+OhQu24naC39dmdPAqc+h1RGju
	 ojP9ZVKEUCmVcf6T4d+uqOHClqKXuIjFpf/MDulXrLJWiB8GWKjfwmLTzb5CIkhLOi
	 ECU8qz/yAbzciUJDsBqplVyKr3wN/C3fuPFrR3QIRCPRExQk0SLcrPVdCH3ZcAMVxB
	 LGnDDACbRLPqef0lZqTH5Y4496kkEaKb6sbtUCFRTPuYnbqZSk3VKb7c+aPJAUzrUh
	 h4mmnUCjIa/xA==
Received: from [192.168.0.22] (71-212-14-89.tukw.qwest.net [71.212.14.89])
	by endrift.com (Postfix) with ESMTPSA id D0BDEA01E;
	Fri, 31 Oct 2025 22:52:18 -0700 (PDT)
Message-ID: <b8933438-fd43-4e58-a26d-0febb27911c4@endrift.com>
Date: Fri, 31 Oct 2025 22:52:18 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: xpad - Change buttons the D-Pad gets mapped as to
 BTN_DPAD_*
To: Cameron Gutman <aicommander@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
References: <20250702034740.124817-1-vi@endrift.com>
 <bwun7yd3uwp3cqicg2euq5swxespqjiizxlioohgdk43emzwue@hzyz7gn4vfqb>
 <CAAfxzZ0p=2REL8fhnxe5HwpPK6U7Cat7euMcRnWvUnknrok3sA@mail.gmail.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <CAAfxzZ0p=2REL8fhnxe5HwpPK6U7Cat7euMcRnWvUnknrok3sA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/31/25 8:18 PM, Cameron Gutman wrote:
> On Sun, Jul 27, 2025 at 3:23 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>>
>> On Tue, Jul 01, 2025 at 08:47:40PM -0700, Vicki Pfau wrote:
>>> Since dance pads can have both up/down or left/right pressed at the same time,
>>> by design, they are not suitable for mapping the buttons to axes. Historically,
>>> this driver mapped the D-pad to BTN_TRIGGER_HAPPY1-4 in these cases, and before
>>> that as mouse buttons. However, BTN_DPAD_* exists for this and makes far more
>>> sense than the arbitrary mapping it was before.
>>>
>>> Signed-off-by: Vicki Pfau <vi@endrift.com>
>>
>> This unfortunately changes existing mappings, but I guess new events are
>> better than old ones...
>>
>> Applied, thank you.
> 
> Unfortunately this mapping change caused major userspace breakages.

This is unfortunate, however,> 
> I think it needs to be reverted.
> 
> [0]: https://blog.dwickham.me.uk/why-your-xbox-360-wireless-controllers-d-pad-is-now-wrong-and-how-to-fix-it
> [1]: https://github.com/libsdl-org/SDL/issues/14324
> [2]: https://github.com/libsdl-org/SDL/pull/14339

None of these pages suggest reverting the changes. The blog post suggests that these mappings are correct, and that the libraries need to be fixed. Reverting it is mentioned as an absolute last case scenario. The SDL issues say they need more testing, not an outright reversion.

Reverting this is solely reverting to an old, uncomfortable status quo instead of actually fixing the things that broke. If this gets reverted, presumably more stuff will ship this broken code that will break if we ever fix this issue again, instead of things getting progressively fixed.

The abandonware being broken is unfortunate, but things like Steam Input exist specifically to work around issues like that.

> 
>>
>> --
>> Dmitry
>>

Vicki


