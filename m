Return-Path: <linux-input+bounces-4953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE4492D52A
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 17:41:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DD800B2472D
	for <lists+linux-input@lfdr.de>; Wed, 10 Jul 2024 15:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC2A189F26;
	Wed, 10 Jul 2024 15:40:59 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from mail.enpas.org (zhong.enpas.org [46.38.239.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF86191494;
	Wed, 10 Jul 2024 15:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.239.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720626059; cv=none; b=EW7LFSXV/saO/XhaDwxR4GtMgBBwJEv8khpwA4rMyEanVM+5HtqBmq01rAOrjqdaHvoCu5orVOQvDiqc6CjvdPK8oQIVPCVqhyDweaUSJla7C+a68WHZXVQGIOwtL41mm60nrucOxeYNtqJVG42BMK/4DqrwWcOUxFcsuu/zB0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720626059; c=relaxed/simple;
	bh=CrL/Jn/Ty/fnR5ezAckIV+af6We6y4cUsMgzE8M/R7o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=uCCfNzvj6D7MYgtbMrW5EklZQtHgUj0zmFy51vcqNn+21ROgi1iDyIUoBJhj/yaq1hRKxgnwyhvgjCUTd5MoPDtWjfCQowtw3VcQvsZ0mQmobkAZA21Wxmpv9DdHHb4QuPfu0+nEAbHJcHfxfxSVQomBUrRjZ0PZTM4sTgvNKdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org; spf=pass smtp.mailfrom=enpas.org; arc=none smtp.client-ip=46.38.239.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=enpas.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enpas.org
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.enpas.org (Postfix) with ESMTPSA id 1A3FF1000C8;
	Wed, 10 Jul 2024 15:35:21 +0000 (UTC)
Message-ID: <afda41dc-7b36-4ddd-abfc-c9430d8c9503@enpas.org>
Date: Thu, 11 Jul 2024 00:35:16 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Max Staudt <max@enpas.org>
Subject: Re: [PATCH v1] hid-playstation: DS4: Update rumble and lightbar
 together
To: Roderick Colenbrander <thunderbird2k@gmail.com>
Cc: Roderick Colenbrander <roderick.colenbrander@sony.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240616163055.75174-1-max@enpas.org>
 <CAEc3jaCkH5JwNTpHRZYsekbwX+G6T5tMTLD0+O6E7Q2hqcAFHw@mail.gmail.com>
 <dedb2c39-fc28-4cba-802f-5d56f23db722@enpas.org>
 <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAEc3jaC-Tmd2XtK9H2sipBJAhCf16dMWx46r8Hs4p9At3LC_Jg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Roderick,


On 7/9/24 01:07, Roderick Colenbrander wrote:
> The console behavior (I checked the code) does use the flags as well 
> like I do. The architecture there between usermode/kernel is a bit 
> different, so in some cases flags do get set when not needed.

Thank you so, so much for double checking this. It's always great to 
have someone who can speak authoritatively on such matters and eliminate 
the guesswork.


> Various devices tried to capture bit patterns and see what kind of 
> worked even though not really right. (Officially licensed
> controllers are a different story they use different hid reports.) We
> didn't know other devices did this wrong.

Licensed controllers... That will be my next patch set, apologies in 
advance :)

They need quite a few quirks, too... And as it turns out, my previous 
patches have laid a lot of ground work for them :)


> Correct the validation tests are all uhid based, which is the best 
> which can be done.

Please correct me if I'm getting the wrong idea here, but what I read 
between the lines and from your email address is that this is something 
in Sony's interest.

So an idea comes to mind: Maybe somewhere inside Sony, there exists 
something like a DS4 simulator at the HID level, which could serve as a 
foundation for improving the tests? That would get the tests much closer 
to the gold standard, which is using a real controller.

If not, then maybe there is protocol documentation that could help test 
writers in creating more precise tests?


> There is the hid-tools one, but the one which we help out with, but
> the key one is the Android ones. We have so many problems with these.
> Mostly because of vendors not enabling e.g. FF support or LED support
> other things.

Hm, but downstream users misconfiguring kernels is not our fault, is it? 
In that case, the tests actually do their work correctly if they show 
that something is amiss.


> The main new Android kernel (public knowledge) is now 6.6 and many
> new devices due later this year/early next year will use it.  The
> eco system is a lot wider now and the drivers are used a lot on
> non-mobile devices (cars, televisions, chromecast,..). Occassionally
> driver patches are also backported from upstream to older Android
> kernels (patches have to be merged upstream first).

I see. But still, that is just typical downstream risk of building on 
behaviour that the kernel does not provide guarantees for. I know 
first-hand that backporting is a lot of work and easy to get wrong, but 
this is the first time that I hear that as a reason to stop improving 
the mainline kernel. Hence my confusion here.


> Not that I wouldn't want these kind of patches, but I have to weigh 
> both sides.

Thanks for your understanding, and hence my offer to help if I somehow 
can...


> The pain on addressing things downstream and in Android conformance
> tests is quite painful.

Hm, I can somewhat imagine this. I've heard that Android conformance is 
quite strict.

Given Sony's supposed interest (see above), I guess it would be a 
worthwhile investment to make the tests more robust? We could just hold 
off on this patch for a while until downstream has better tests... What 
would be a timeline for this to trickle downstream?


> We would also have both code paths used in the wild forever, because
> existing 6.6 devices wouldn't change behavior.

Well, that's kind of the point of LTS releases, if I'm not mistaken...


> (The official Android tests are kind of kernel version agnostic as
> they work across multiple kernel and Android versions.

Hm, sounds to me like the Android test framework is broken if it cannot 
be kernel-specific in such cases. What's required in order to improve this?



Max



