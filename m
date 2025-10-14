Return-Path: <linux-input+bounces-15448-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE42ABD6FA7
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 03:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9CC0F4E5DB6
	for <lists+linux-input@lfdr.de>; Tue, 14 Oct 2025 01:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AAA13DDAA;
	Tue, 14 Oct 2025 01:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tw3Xi3hr"
X-Original-To: linux-input@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC62BCF5;
	Tue, 14 Oct 2025 01:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760405097; cv=none; b=leCQSe6VFRiFsEvGiqEj4MNbW3W2QsUde/wX05monKyXPPUShuULnYUbzehdxYMWmhvDz7pK6ksYyWga5gfGPsYKIqqlrvfjaWe6hm2U/juBYT08HNJJz1YyG22qHQbev1fNvn9LBSRGHcM/UQV0o0w9gmuoxsUQr6MLtrQ5NVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760405097; c=relaxed/simple;
	bh=dwDNYzLtZek3emqqOnmqEDMBCYxOGSmi01Td2aUQlBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAx6UbLqFjqRwtVIrChf/5IgXfimBgvhcVNU3fi/dVknViSpu0msGrMf930mFLWzS3xLKQe/YFxTvZoZ0uecEG4RPr3zW3/Qf1bUY50vU9yK3DqUftWAMRx3TV8al+uUpRLnhgvudtcnnVcglIFghrDPy1z+TsbBCiuD7h0D024=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tw3Xi3hr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dFuiWkTQSqkPPmvEk4s9u5Zjw6QgEpQYW1CmmcwGTPo=; b=tw3Xi3hrcRc8ChTfKdoB9hA3aO
	rSYWjh1lNDrGHcaIJMdpphw52G1r1a9sqeTlUE3H70I2NbcDHqE/Q+i7+p1tBf0bT5qtvhP8sSjLG
	1ZvrD3BUnj3JiB14kB/zdTfS+9lXsYRPzGWmtxwApTmIUj6W0XmhZBfQCFVcy9Sx19FcHPbZz097K
	0JVXCx+U+QqvOORB5giaEYgY0Y2SxuYiSWwYJxh1JinzIaIrzXKgemWn6pb32xPcR4R3dPW8LzFyd
	oL6nMD1LvIWK41g/msWXrGWn81IZJ42t5CulDamgsrxOl57uA9bpSxxX0PVeTJBcj6itF2DY46tzN
	FaNRLHNQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8TmY-0000000Eth2-1oZa;
	Tue, 14 Oct 2025 01:24:54 +0000
Message-ID: <3c94c8b1-b53d-4dc5-86b4-70c89b91fa15@infradead.org>
Date: Mon, 13 Oct 2025 18:24:53 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: Kconfig: Fix build error from CONFIG_HID_HAPTIC
To: Kuan-Wei Chiu <visitorckw@gmail.com>, Jonathan Denose <jdenose@google.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Thorsten Leemhuis <linux@leemhuis.info>,
 Lucas GISSOT <lucas.gissot.pro@gmail.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com>
 <aO1q4coXPqU/K6KI@visitorckw-System-Product-Name>
 <CAMCVhVNLr+2ivRo9T4rVt4mkncwbOfXEL9bE=pDGRp=Qjy1c9A@mail.gmail.com>
 <aO1vQYCKU7fA0Fxm@visitorckw-System-Product-Name>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aO1vQYCKU7fA0Fxm@visitorckw-System-Product-Name>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/13/25 2:29 PM, Kuan-Wei Chiu wrote:
> On Mon, Oct 13, 2025 at 04:23:36PM -0500, Jonathan Denose wrote:
>> On Mon, Oct 13, 2025 at 4:11 PM Kuan-Wei Chiu <visitorckw@gmail.com> wrote:
>>>
>>> On Mon, Oct 13, 2025 at 08:54:57PM +0000, Jonathan Denose wrote:
>>>> Temporarily change CONFIG_HID_HAPTIC to be bool instead of tristate, until
>>>> we implement a permanent solution.
>>>>
>>>> ---
>>>
>>> The "---" line here will cause many tools used for applying patches,
>>> like git am, to discard the content below it [1].
>>>
>>> Please don't add this line unless you don't want the following content
>>> to appear in the commit message.
>>>
>>> [1]: https://www.kernel.org/doc/html/v6.17/process/submitting-patches.html#commentary
>>>
>>> Regards,
>>> Kuan-Wei
>>
>> Yes, that was intentional, the information below the '---' was
>> included as additional information and not for the commit message. The
>> error messages were too long, as was the link to the longer
>> discussion, and this caused errors in checkpatch.pl.
>>

checkpatch is just a dumb script. Don't let it determine what goes
into a patch description. It can (easily) be wrong.

> Then at least your Signed-off-by tag needs to be above the --- line?

Right.

-- 
~Randy


