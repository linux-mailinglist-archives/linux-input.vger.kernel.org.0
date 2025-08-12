Return-Path: <linux-input+bounces-13953-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182FB22BB9
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 17:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05BB47A53AC
	for <lists+linux-input@lfdr.de>; Tue, 12 Aug 2025 15:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435B12AD0D;
	Tue, 12 Aug 2025 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOTo0vla"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2020CA921
	for <linux-input@vger.kernel.org>; Tue, 12 Aug 2025 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755012693; cv=none; b=nNUU7Doqk0VcLTVAzImr4e+8k6ZTcmrsRl5HNAvMEtGl4CNsArDQkjpdsP/zD7/6Om7wwITzfQcdJIgMjd/LeP4M+ki070Gb43x0331Utkq6JHQuqURdP6tG7QjPPMjrY7+t6szcXFd6rT5GEz2reM+NXtMzWGGGS2PpLuB7jqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755012693; c=relaxed/simple;
	bh=J+i9OAkZqeTj/3eO6ZJDiOmTZnLNnQ4BuFXhj/68xPY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kzJmXJdwmmMQnW/21u1gQt4Ds7TtKD0unmPI4n+BPueVTmOg7Y4CgkoqmqbW00QaQQDYSbUhKnag+0yPZC3VEonaOEBeIWoRpUgfLSEJdstCuS4KfdtEe8lNyb7/ohmpqAhhx3NB1oMszqX3JBokrsq+xVnlcKfuYzgdPUgzCBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOTo0vla; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5234EC4CEF0;
	Tue, 12 Aug 2025 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755012692;
	bh=J+i9OAkZqeTj/3eO6ZJDiOmTZnLNnQ4BuFXhj/68xPY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AOTo0vlaCRtrDUyeq7JRYO98u6E5o1lREOmGMbiLu0EgMHYrDe0ZGZKVRAbmb/5b4
	 DRqLdlrPcfxyTCgbbcLPC6EyOzd38hjNgcrXCwQshhVjmY+5ITyOX+ZTqhjDI6Uu79
	 jsEsMKNzvApdXe6j7w1gPLfgdNljAjRi0K+LeEeKrfy17lYefpdA2dU0q3tKm+QVdh
	 TWkfOUK/JNNJvM3MOs7n4g/aoAg2P5GSn6vZLElsapSsyrQi2vJWicQvFAOnlYF83Z
	 179ExW+D8ASf29RXb+OD+vUEFfLRLZ2V1wXXAmAOMWdFY3kIuq6SyvLJVk56Bo66Vc
	 qczWRDXmnEYrQ==
Date: Tue, 12 Aug 2025 17:31:29 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Benjamin Tissoires <bentiss@kernel.org>
cc: "Cheng, Ping" <Ping.Cheng@wacom.com>, Ping Cheng <pinglinux@gmail.com>, 
    "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
    "Dmitry.Torokhov@gmail.com" <Dmitry.Torokhov@gmail.com>, 
    "stable@kernel.org" <stable@kernel.org>
Subject: Re: [PATCH 1/2] HID: input: map HID_GD_Z to ABS_DISTANCE for
 stylus/pen
In-Reply-To: <qylywmhjcciqyqbyyoa5lmgdne3mcfexbzy2lk36mhhindepf7@laz3kov67brd>
Message-ID: <r8o3qq5o-63n7-p49o-9s2r-r354r8151062@xreary.bet>
References: <20250710212859.7892-1-ping.cheng@wacom.com> <29911p88-1n01-s610-9opn-98n874r84srr@xreary.bet> <GV2PR07MB9153ED83B6705961417EA1969B2BA@GV2PR07MB9153.eurprd07.prod.outlook.com> <qylywmhjcciqyqbyyoa5lmgdne3mcfexbzy2lk36mhhindepf7@laz3kov67brd>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Aug 2025, Benjamin Tissoires wrote:

> On Aug 12 2025, Cheng, Ping wrote:
> > Hi Jiri,
> > 
> > Please revert this patchset since I need help from Benjamin to make the selftest real. Patch 2 does not do its job...
> 
> Furthermore:
>   CC      drivers/hid/hid-input.o
> drivers/hid/hid-input.c: In function 'hidinput_configure_usage':
> drivers/hid/hid-input.c:863:28: error: this statement may fall through [-Werror=implicit-fallthrough=]
>   863 |                         if ((field->application & 0xff) == 0x02) {
>       |                            ^
> drivers/hid/hid-input.c:872:17: note: here
>   872 |                 case HID_GD_X: case HID_GD_Y:
>       |                 ^~~~
> 
> So this breaks compilation entirely :(

Hm, I really wonder how this escaped me, as I always run a compile+boot 
battery before pushing out.
Sorry for the hassle, I'll investigate more where the glitch was on the 
side of my automation.

Now dropped.

-- 
Jiri Kosina
SUSE Labs


