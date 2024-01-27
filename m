Return-Path: <linux-input+bounces-1507-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F4C83EBF9
	for <lists+linux-input@lfdr.de>; Sat, 27 Jan 2024 09:12:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BBA51C217DC
	for <lists+linux-input@lfdr.de>; Sat, 27 Jan 2024 08:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2F912E73;
	Sat, 27 Jan 2024 08:12:14 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E101D6B8;
	Sat, 27 Jan 2024 08:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706343134; cv=none; b=s0twB1zR/D20//oYmIC9OC6mJDUglY/UafpWtTGE1tjdF/RVQWc/cUISDwWxkpZihz1Bh2qwHH0Jm7UzEkYyC5MNZD3LHt6IWF0UNMhL8WviKxAcZZ5Wf5LcSHIhYpUKQNW0Ccl+L5uXW3XHu28IeXdxcMp0EI4FpNk0o1jQWeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706343134; c=relaxed/simple;
	bh=5wFm7bEd3bm4ljgTMNExGYyMDt8ohCYwcMY/1+WcDs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNJoe6MT2ZA9hUOplqIgPItiVQBGMgk3AyOxh05lPxZgVSKXxjlOpPNx1hhL8Ldk0IInxX38umc2EezPkNcRc60T+5RFlzbF2xUMHkCPbWB8pX4VcNpWeXImvIJ/DvTM5/K1yA/dNWEMDKG2FxA1oWOpRFaGQHInis9ZyJZ2wrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rTdnN-0000YQ-2M; Sat, 27 Jan 2024 09:12:09 +0100
Message-ID: <4eaf27ed-66a2-4aeb-a6b9-21e2b0455676@leemhuis.info>
Date: Sat, 27 Jan 2024 09:12:08 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PS/2 keyboard of laptop Dell XPS 13 9360 goes missing after S3
Content-Language: en-US, de-DE
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
 regressions@lists.linux.dev
References: <0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706343132;662e3dd7;
X-HE-SMSGID: 1rTdnN-0000YQ-2M

On 18.01.24 13:57, Paul Menzel wrote:
> #regzbot introduced v6.6.11..v6.7

#regzbot introduced 936e4d49ecbc
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


