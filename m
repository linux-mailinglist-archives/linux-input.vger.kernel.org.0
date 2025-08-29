Return-Path: <linux-input+bounces-14382-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7FCB3BB7D
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 14:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD5F41BA776C
	for <lists+linux-input@lfdr.de>; Fri, 29 Aug 2025 12:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CED317715;
	Fri, 29 Aug 2025 12:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="xm8vajwe"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C82C374B;
	Fri, 29 Aug 2025 12:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756471089; cv=none; b=UVFzN7a/KEP3SnM76/uSG5fl5Vl7oDPEiM7azf678DtKxd9kHemkV728b8ibdf7fhytY6NQZ62rTrE1omW8NGfRWl/tZoZXWXQk3n3wktiMJhoywBcnIAWfnRX7lg6vzz1Adw2nfZs037fI8SDuWi+jyl7KK2HLiSHr/5lhYp6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756471089; c=relaxed/simple;
	bh=WpCT1BEi88kOYc1KlNxAEIr7FEnG2KH3hWXRvs1KhWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sQR3apC6pwbePdmHn9RL7nXG8VFsvN8zwO7MywhP6SAQ7L8sJS2WDafnE9eluDIHlnjKIq3FMiYiHaEcgNAAVENWQyFgsrwPMo6Mz5lBlHVqppY37P593whwi5ear0h08AdRGtBd1lLhONg/Xw7SEqaHjQEU/ZEeU5N+Wy6Cxfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=xm8vajwe; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=OzmW5No5ytDzgBIZKPfdhdcoLrbkRFgOz/I63mOxbCI=; t=1756471087;
	x=1756903087; b=xm8vajweWj/w9gj8fS7xXwQe5sBSk0CP3ftRQLLyEIOY5KP3XzUOnIezX3i0L
	a9LSP//0FQ1IShilw3tnNRlWKpLOMyhSGoCPEYeHPmupluWtKI8pjJ/I5ch5JkJ59vb1ZL3C7qvyQ
	ca+q12Cyz5vdcA+NRe/iWYqHGyry5Z/6HEOpppeFlo8FsHS1iEA6p8km64UqgEO5/JHza+Iw4ns1e
	Rb6+gKjHm48sNOEDi6ifeyuQp4ULwvxhewh9lZ7IYVLhHk6CInjQ6iqau0l0ti+1/BuUVkqXzfH1R
	RaVZf1leeipzGKUkHEQj/yFPLIQCmSJuAvyXujH9zotNTmZSUg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1uryMn-00AAN3-1Q;
	Fri, 29 Aug 2025 14:38:05 +0200
Message-ID: <27863761-d747-459a-af85-18abe207c0ca@leemhuis.info>
Date: Fri, 29 Aug 2025 14:38:04 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bug report - Sticky keys acting not sticky sometimes
To: Alerymin <alerdev.ca4x6@simplelogin.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 dmitry.torokhov@gmail.com, linux-input@vger.kernel.org
References: <175646738541.6.2676742517164037652.877606794@simplelogin.com>
 <dd24398b-0d10-45d4-b93d-4377c017f2e7@leemhuis.info>
 <175646914218.7.12773379431621187280.877650584@simplelogin.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <175646914218.7.12773379431621187280.877650584@simplelogin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1756471087;983e20da;
X-HE-SMSGID: 1uryMn-00AAN3-1Q

On 29.08.25 14:05, Alerymin wrote:
> On Friday, August 29th, 2025 at 11:58, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>> On 29.08.25 13:36, Alerymin wrote:
> 
> Well, I read the reporting page a bit too quickly so I CCed the
> regressions list while I shouldn't have, sorry. I've never seen it
> work normally, it's not a regression.

Happens, no worries. But in that case a hint to anyone that might reply
to this thread: feel free to drop the regressions list and the stable
list (it's off-topic there, too)

> On a github issues on kbd-
> project legionus had a few ideas about it: https://github.com/
> legionus/kbd/issues/140

FWIW, some developers do not follow links in cases like this, as they
get a lot of reports every day and not much time at hand (and walking
through other tickets often is cumbersome). You chances will thus be
higher is you summarize the important bits in a case like this; then
people might follow the link if they really care.

Good luck! Ciao, Thorsten

