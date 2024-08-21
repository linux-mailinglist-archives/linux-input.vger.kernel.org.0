Return-Path: <linux-input+bounces-5726-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD9959966
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 13:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B59E283CF4
	for <lists+linux-input@lfdr.de>; Wed, 21 Aug 2024 11:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B99209750;
	Wed, 21 Aug 2024 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="MCrADFJy"
X-Original-To: linux-input@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-208.smtpout.orange.fr [193.252.23.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1A8208D5E;
	Wed, 21 Aug 2024 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724233956; cv=none; b=H5Jwf98/JKxY23p2A1+NYr7TvS5NzpA7Jd4/XdMiVjMgXdeHSqihc0kDDpISQ58dPdQNxdq2fGLNnakYgXvR9Rc3mh+Rm96OkcrE5usQSeLAGxURMXTN8ThnuqqpAlvw0mzEV95bDJNqoQrGZ7KMa6U0qO0VkFqynD/BTyuyWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724233956; c=relaxed/simple;
	bh=efaMJisE1csBNHMgzNlrdBMW6I1j3sElVPdv8eM7GVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f3uIoSV79C5riQ6Yr/dhzmXnC0SPtsEY6i6CYZEgFub4oqAzvFEA/B6tWIj6ah4pByt5T6qBOKYVxMWOptPltvC+OKR5maa0QAVQTPu2AOvlAUWp8JinMXoBrBCO3lNqv3wQBvOzwjbBJ4Y96Dlssq4CjO1m8oSFIjmROY9pLpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=MCrADFJy; arc=none smtp.client-ip=193.252.23.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gi0usBwoUzHoQgi0vsJnJd; Wed, 21 Aug 2024 11:52:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724233945;
	bh=9GZn7f7pGGsAOSSuARBG8S3X2+G0DybjoUxpTfZIbVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=MCrADFJyguIsaQaxMtM57PNk0PcldvYVgJ4NQrkqd0Dx+12Q49XcGpO/fRMXQCj6N
	 4GRAAGC8/cAbwsbOMY0j4HTZHtWZosB2KHe2YEdnaBGeS0Mj+Vr9E9tmxBjfrMRssW
	 yV2Mqw+smCnEvDgStJZ8kv57W4caR/IGK39G4oDEznN+AoOeRHCu6qN2f3xg/AM0c3
	 /aCs5c+GSjlCkXI2Wc2G2yLJzBNtsgcsynnY1sPZdNIQqWn/C4Io5MQcvhk8ZfpJfb
	 qC3h6UCmQu+lD1CLUFCEC/+BRfDFzFYTedbbp0Gjp2ZCbsmqAYTbgngOGo753IssRa
	 ZZ8M5p+ZljgGg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 21 Aug 2024 11:52:25 +0200
X-ME-IP: 90.11.132.44
Message-ID: <78b667fa-8e54-4023-9187-4ecb999d3c01@wanadoo.fr>
Date: Wed, 21 Aug 2024 11:52:24 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
To: Markus Elfring <Markus.Elfring@web.de>,
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, linux-input@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
 <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de>
 <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
 <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de>
 <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com>
 <f0aa2ca0-6256-48e4-8d2a-dfd5da072ad4@web.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <f0aa2ca0-6256-48e4-8d2a-dfd5da072ad4@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/08/2024 à 09:26, Markus Elfring a écrit :
>>> This was the case for a while.
>>>
>>> Increasing applications of scope-based resource management provide
>>> further opportunities for smaller scopes according to some local variables,
>>> don't they?
>>
>> Personally I'd rather it just fits in with the rest of the kernel,
>> but if the general consensus is that new drivers should use tighter
>> scopes, I can do that instead.
> 
> There are the usual communication challenges to consider also especially
> with collateral evolution in such software areas.
> 
> 
>>> How do you think about to collaborate with other data structures
>>> than character arrays?
>>>
>>> See also:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst?h=v6.11-rc4#n953
>>
>> Hm, I picked a character array since all it's doing is sending a
>> buffer to the device.
>> There's no published specification to follow, only "Well the Windows
>> driver sends these bytes and this happens".
>> So there isn't really a structure that really comes naturally,
>> especially with all the magic numbers.
> 
> I imagine that further development concerns can be adjusted accordingly.
> 
> 
>> Unless you're suggesting I just do `unsigned char send_buf[3] = {...}`?
> 

Hi,

If I recollect correctly, there may be an alignment issue and just using 
the stack is not enough to guaranty what is needed.


CJ


> Such a programming approach might also look promising.
> 



