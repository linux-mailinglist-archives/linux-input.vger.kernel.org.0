Return-Path: <linux-input+bounces-2183-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDABF87043D
	for <lists+linux-input@lfdr.de>; Mon,  4 Mar 2024 15:34:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 940EA1F23D8B
	for <lists+linux-input@lfdr.de>; Mon,  4 Mar 2024 14:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 302883EA66;
	Mon,  4 Mar 2024 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="n9+wVMIM"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0947A1DFF9;
	Mon,  4 Mar 2024 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709562841; cv=none; b=GPc8G5Rv/GgChVSvEqWmOTC4HjAVBKosmgL9epzCXpIcQKdrNBMjxhXNaajF/BJ/hA4v3KU93L+EnlddRibNpW+RFoyBIdxfP2c0eUK/+W341KvawFj1C9XJCDPLfkmYMsLyFBJbH8qiGXV0odbPT1+2gtTzxuuN1gDvTM3nIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709562841; c=relaxed/simple;
	bh=n1OGt1q7qIx6wzw21FHK0ipfwH+yh9FrvXjD6olJ2LU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rid7Vv6PuW90KGnuutzfxmZSev9aXzrYX1FB2H1FXNUQTr1oM4WFOH2Brc3yDJwiJNN7dJvAXjlRarQqxe4L8Kxr6p/NgQ1RMkBFvI7/mrNPhm5EuAiiHfsCmn3xVHm+bFrjhWwOLfqKIYUTtGvHzqqWDhlGmu/OziONy6v2n58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=n9+wVMIM; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=xr9mbwGp388Lp+Z/zemh6Y052V9AVvs43i2AXCTBlsE=;
	t=1709562839; x=1709994839; b=n9+wVMIM2Me6yydOFe6UWHqj/sNBPQP69bsj445qtz79RkX
	2chOlNnWkufiL2jax1Ax1B1hCODaFiHere9ZJ2M62ihVqi1qyPL/9eiDppXHlI9+BHySM8Ops5A9+
	VNnMTjkuwC/qktLWryq4p2JeiPvX7IdFC5ueA+AGBHMiCvV43DWAa6rBLGEN4QeGHZZZn/GuNw5ro
	lOGukMDoLkXNJFLQcueClB5eSvHE0cE9SxI1117qDO0fLfouG/KeAdht7ZJ6ksDcewnjqxQNtzx/e
	8xJiC1vdHWNh8cxZ3d2iz58NsG+VeTUTz7BXgWi+rSHO4H8kr5gkd1i2kq/ays/Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rh9O8-000638-VF; Mon, 04 Mar 2024 15:33:57 +0100
Message-ID: <3bb95fcd-65cf-45dd-8d81-1a41b1ae0288@leemhuis.info>
Date: Mon, 4 Mar 2024 15:33:56 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression with Lenovo ThinkPad Compact USB Keyboard
Content-Language: en-US, de-DE
To: =?UTF-8?Q?Rapha=C3=ABl_Halimi?= <raphael.halimi@gmail.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Linux Input Mailing List <linux-input@vger.kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@jikos.cz>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Mikhail Khvainitski <me@khvoinitsky.org>,
 Linux Stable Mailing List <stable@vger.kernel.org>
References: <a29d56d2-c440-4a26-a9ac-014595d2ae8c@gmail.com>
 <21370dc5-94a3-442c-ae04-76f9f94b1b96@leemhuis.info>
 <c8986411-2bf7-4b7d-8ac1-f702dc7c725a@gmail.com>
 <7a5fc584-1520-4e52-9c77-d67a656524c6@gmail.com>
 <10022b0c-89c3-43e1-89ba-00e458fe1dfd@leemhuis.info>
 <7a8d9d60-a151-4b25-882b-48e6929339a4@gmail.com>
 <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <9db59ae4-be28-4ab3-a2ae-0b0f661f56be@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1709562839;1f5e658a;
X-HE-SMSGID: 1rh9O8-000638-VF

On 24.02.24 17:15, Raphaël Halimi wrote:
> Le 24/02/2024 à 14:51, Raphaël Halimi a écrit :
>> It can't be the third one (43527a0) since I clearly remember that I
>> experienced the regression before it was applied to the Debian kernel.
>>
>> So I'll try applying only the first one (46a0a2c), and report.
> 
> I can confirm that the module compiled with 46a0a2c alone does produces
> spurious middle-clicks.
> 
> Maybe "ThinkPad Compact Keyboard with TrackPoint" should also be
> excluded, like "ThinkPad TrackPoint Keyboard II" was in commit 43527a0 ?
> 
> But then, would 46a0a2c still be relevant ?

Hmmm, another week without any developer looking at this. That's not how
it should be. Guess I have to bring this to Linus attention sooner or
later then. But before doing so, please confirm that 6.8-rc8 is still
affected and reverting the culprit on top of it fixes the problem (the
tricks you used are not bad as such, but they can have side effects --
which might also be the reason why no developer has looked into this).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

