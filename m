Return-Path: <linux-input+bounces-7600-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 791939A9162
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 22:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238551F22D0F
	for <lists+linux-input@lfdr.de>; Mon, 21 Oct 2024 20:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A241FBF56;
	Mon, 21 Oct 2024 20:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b="qstA2uyL"
X-Original-To: linux-input@vger.kernel.org
Received: from bout3.ijzerbout.nl (bout3.ijzerbout.nl [136.144.140.114])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E7E450FE
	for <linux-input@vger.kernel.org>; Mon, 21 Oct 2024 20:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=136.144.140.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729543275; cv=none; b=g5kmkzhEz6jQh6+Na4uSn7wMAJt8Llg271sH7/eC6EJE5arUyPGCJ7WMfyfngtRQ/QWncbdRV06IgnY6ws3ioLocyQUFygpW15/CVfsz9yY4XbAYVKOoIt2hdk18WPq3ZMjgLe0SRF83p+lnBjZMKsPnzdM4xjw0bQ16WUzQdP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729543275; c=relaxed/simple;
	bh=S1u4+7JlC6BpoIomuTFWTJnRyqmbgIbY3Hf2trWzNP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dOfSdnO0VyFjvZqIj5XdICkwyi63UJqeeOI9fvh3wjs1WdFtR4jbU4O6PKhM0fMF1Bgoq1PrSzVa1dAMk8zePLck8ZKjxUtsgt87fVOzIQkVENyCTGS02qF4mUltwU+3sxIZ1Aum0L2gMuCfPfPz8ZqYawN+w9Tg6Q8rcGXof04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl; spf=pass smtp.mailfrom=ijzerbout.nl; dkim=pass (4096-bit key) header.d=ijzerbout.nl header.i=@ijzerbout.nl header.b=qstA2uyL; arc=none smtp.client-ip=136.144.140.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ijzerbout.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ijzerbout.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1729543268; bh=S1u4+7JlC6BpoIomuTFWTJnRyqmbgIbY3Hf2trWzNP4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qstA2uyLWptclJJtXyf8rpwRFqMbHj6u5BkcUEX0yVrMUOs5dx1Fs+e8iQjLPvs8/
	 d7w2/8dUFd5BJjfv8y/InndoNpThjhjXERA8iwpj5TfOOmw0DpHMHEyX2AkK3Mc79u
	 h3knX9TLJETSsjSf0Fk/XJf9MRtHqwkme5889aBLF91lrEdvvXjL72jnnJjlHIcM/E
	 6xTWP2oUQiqqdPe/pbTwVS2vBzHyuHQCDaHXrrT+s9k2y5/0exhHTr/eAjgu8ZdQV4
	 HvJ7F90zHXquKsT/RMD+U+iY7QXawmH94u+70u19wM6bZUzQD4FuuVK4eZuj3RYGhQ
	 3wtTQj8yCilxpTL9lFEzCjE5UJJ1HTEBYX5A18M6VkU1FbUcaMJgNA/6XJd1CvMktz
	 TfhW2PqGFQOSPm4q15XWO6Qu8MgGQ+4gW/cV1YppDWlxVSOjA2/qnU4/th+hnCiFtn
	 cAe5CTavimA7YQrijUy5A5aGUe12EWqxIahugMsPUaiQZg56TsxSFA65vuoXjkrucu
	 WSRd9auukr374uYD+LxEGHeGQYH9MqIJACFx42KxNBZToDe/ahbrf33hJmpiHcIq9v
	 npA7BmXLnTQq7AIhnWyT5H6ZD39bB3Ev0NR9b7NBoi9mSwJGbEV6R/awZukOyw6+H7
	 h8v5VB6W1xjLH4c4cKXEvze4=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id A76F118DB7A;
	Mon, 21 Oct 2024 22:41:08 +0200 (CEST)
Message-ID: <a6d13b00-6ca8-426f-86fd-cbb55d219217@ijzerbout.nl>
Date: Mon, 21 Oct 2024 22:41:06 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/24] Input: serio_raw - use guard notation for locks and
 other resources
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
References: <20240905041732.2034348-1-dmitry.torokhov@gmail.com>
 <20240905041732.2034348-21-dmitry.torokhov@gmail.com>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20240905041732.2034348-21-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Op 05-09-2024 om 06:17 schreef Dmitry Torokhov:
> Use guard notation when acquiring mutexes and spinlocks, and when
> pausing and resuming serio port. Such guard notation makes the code
> more compact and error handling more robust by ensuring that locks
> are released in all code paths when control leaves critical section.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>   drivers/input/serio/serio_raw.c | 121 +++++++++++++-------------------
>   1 file changed, 49 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/input/serio/serio_raw.c b/drivers/input/serio/serio_raw.c
> index 0186d1b38f49..aef8301313b2 100644
> [...]
>   static ssize_t serio_raw_read(struct file *file, char __user *buffer,
> @@ -200,40 +185,32 @@ static ssize_t serio_raw_write(struct file *file, const char __user *buffer,
>   {
>   	struct serio_raw_client *client = file->private_data;
>   	struct serio_raw *serio_raw = client->serio_raw;
> -	int retval = 0;
> +	int written;
Didn't you forget to initialize `written` to zero?
> [...]
>

