Return-Path: <linux-input+bounces-1612-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F884560F
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 12:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 635772849DA
	for <lists+linux-input@lfdr.de>; Thu,  1 Feb 2024 11:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4A23A1C3;
	Thu,  1 Feb 2024 11:12:19 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D5F4D9F4;
	Thu,  1 Feb 2024 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706785938; cv=none; b=MZQffvO4h7xeYE3JEgR6IQwOSMGZ4kOjYykLDva6KArzyKLGLK6kndBR2M7esftOAMCmImAj9EjyPrnkrUgK7bkna9XWoF4OaB203gn/7aIry8wNk08JkQex2Z/SyH9JOG5ykzzYBPtC2Pf50tjCZwdLCFiLaF7E3bnwFc36/+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706785938; c=relaxed/simple;
	bh=EN1d5/97kBFynxSWdKKGsnZPJq2Lg2/jadtPBPf6tHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmCTkoEfY4b+dZSqpukJ/ysVQfnkZJjn5hXaobon2lV0+nz7fy9+09cUru005d3/duggY2R0mifBb0wZVLD2Brl581Uy1BvkHI2e4DrmSM+AjNlDO5q7RUfUeYaB85MKEQW8qKvjkxQnhDu3gi9GSjzy5GU/M8YxRmxQOfaEOo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rVUzN-0005ej-Nm; Thu, 01 Feb 2024 12:12:13 +0100
Message-ID: <dcb4cfe6-1a50-43cb-ad92-76905c05dde3@leemhuis.info>
Date: Thu, 1 Feb 2024 12:12:13 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH regression fix 0/2] Input: atkbd - Fix Dell XPS 13 line
 suspend/resume regression
Content-Language: en-US, de-DE
To: Hans de Goede <hdegoede@redhat.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, stable@vger.kernel.org,
 regressions@lists.linux.dev, linux-input@vger.kernel.org
References: <20240126160724.13278-1-hdegoede@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20240126160724.13278-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706785937;c3eda33f;
X-HE-SMSGID: 1rVUzN-0005ej-Nm

On 26.01.24 17:07, Hans de Goede wrote:
> Hi Dmitry,
> 
> There have been multiple reports that the keyboard on
> Dell XPS 13 9350 / 9360 / 9370 models has stopped working after
> a suspend/resume after the merging of commit 936e4d49ecbc ("Input:
> atkbd - skip ATKBD_CMD_GETID in translated mode").
> 
> See the 4 closes tags in the first patch for 4 reports of this.
> 
> I have been working with the first reporter on resolving this
> and testing on his Dell XPS 13 9360 confirms that these patches
> fix things.
> 
> Unfortunately the commit causing the issue has also been picked
> up by multiple stable kernel series now. Can you please send
> these fixes to Linus ASAP, so that they can also be backported
> to the stable series ASAP ?

Dmitry,  Hans, what's the status here? I wonder if there is still a
chance to get this into -rc3 so that Greg can fix the affected stable
trees as well next week or so.

Ciao, Thorsten

> Hans de Goede (2):
>   Input: atkbd - Skip ATKBD_CMD_SETLEDS when skipping ATKBD_CMD_GETID
>   Input: atkbd - Do not skip atkbd_deactivate() when skipping
>     ATKBD_CMD_GETID
> 
>  drivers/input/keyboard/atkbd.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 

