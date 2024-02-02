Return-Path: <linux-input+bounces-1632-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8152846A20
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 09:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F321F2AD4F
	for <lists+linux-input@lfdr.de>; Fri,  2 Feb 2024 08:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 846BC17C64;
	Fri,  2 Feb 2024 08:05:26 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27717C60;
	Fri,  2 Feb 2024 08:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706861126; cv=none; b=R+TDCMS+ERVJXdQiXvBIJbFzEL6WrmIarwdtn6iW+jy74iwgp3ZmwM2Zf0aPxkSg1sLda7EGs7udGPrWPeE642b43NS3c/rmzZDCPP+eVNT+nOgb/FrZ96aFGyt20drA8EeUnekevA1hQo+eE1ggBh6FTtECCAhxQqRxaznIRa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706861126; c=relaxed/simple;
	bh=Vg1XxSqmJwWWwd4PvpyxRuBAnDABWmuMzUuRFetuMFY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=MLUsNbtg6m7nUj8MsxZdbmx5pOFJhV6+Jtga342xTNJnHTeFsqp2EjoNRODD7+Rwkf2Rau7gPVz8s1frmadjmVZS947vJRiABGAdLKBOi7PfdpgyG+0h4K4fGzwqqbEYgjTJoZV0umv7svRR562MXTn3A4057T+8HMgtHeKTZkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rVoY5-0000LL-NL; Fri, 02 Feb 2024 09:05:21 +0100
Message-ID: <4cb64e29-4b17-45cc-86bd-dcbbef14848f@leemhuis.info>
Date: Fri, 2 Feb 2024 09:05:21 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PS/2 keyboard of laptop Dell XPS 13 9360 goes missing after S3
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: LKML <linux-kernel@vger.kernel.org>
Cc: linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
 regressions@lists.linux.dev
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <0aa4a61f-c939-46fe-a572-08022e8931c7@molgen.mpg.de>
 <4eaf27ed-66a2-4aeb-a6b9-21e2b0455676@leemhuis.info>
In-Reply-To: <4eaf27ed-66a2-4aeb-a6b9-21e2b0455676@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706861124;0a3b6850;
X-HE-SMSGID: 1rVoY5-0000LL-NL

On 27.01.24 09:12, Linux regression tracking #update (Thorsten Leemhuis)
wrote:
> On 18.01.24 13:57, Paul Menzel wrote:
>> #regzbot introduced v6.6.11..v6.7
> 
> #regzbot introduced 936e4d49ecbc
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/all/20240126160724.13278-1-hdegoede@redhat.com/
#regzbot fix: 683cd8259a9b883a51
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

