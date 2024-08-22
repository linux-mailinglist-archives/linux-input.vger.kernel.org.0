Return-Path: <linux-input+bounces-5736-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EE495AD24
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 08:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 674A3B211AB
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 06:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47CD1304B0;
	Thu, 22 Aug 2024 06:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="rxQUoBxE"
X-Original-To: linux-input@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-30.smtpout.orange.fr [80.12.242.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76E212D214;
	Thu, 22 Aug 2024 06:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724306572; cv=none; b=T2NcgzC8RrQnl5BkcFCtCRgfnFKD/SzVo3I9RhmJsIXBoEw/akd64/AoGV7etqMDiOpGSc1VW9eKhl0M5DmrLTh77YSzOpyyKLGKO7lacZELqF9sJfEc5YLFXTgs8Qyhgn219x2C/8/iZXb+LRxkJxTFJ9nUXfdkCN1K3HMVc6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724306572; c=relaxed/simple;
	bh=9hQq3Cggm+CLvBV/nj8HKe6LznylH6xfIF09n6ueqP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pZA4vbuUIm8VvGgEjNUpJOGUJDPE7rjMAvaPtc6a329hxNMzegXV3rwyFa2FuJwFMN5Ktdvc2jSZxr3od2x0SpfgoEX5BtaBGVYDZH+tNjFXo43puTInkd4XRy8VkOnr1iG0U5+iUvfgF1ABYZBHuhzI7x5BTXuXkg3C8v/sfdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=rxQUoBxE; arc=none smtp.client-ip=80.12.242.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id h0uFswYJ8Jokxh0uFsXpWb; Thu, 22 Aug 2024 08:02:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724306567;
	bh=WypjVt1rMzUmmOHxryPtXP32L1+Fh9Dgn3lMlwanlvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=rxQUoBxEpJbK4ORPz14zJ7h2wu/SQbdDkUTSiQShojXn9qO6a1eDcgrrjgtStbOI9
	 mUKEugvxIYCBCljWRzCJtCkbqwjMuMaLgrNSIXnLwPkPqe0hqc0sAl6cvSJRZ67BPb
	 erhsH+Ikuwo95DErqQuE0ZOKiak1jaM+QgPIRPEyShvpDaiKxEYu6aqYAy4bk0r6x5
	 r9FWhkPvlqLVv47Dt21kTPpIqb6YdhRPaoX3RmoFSaI66jo4C0cyRU9sS/lqj6TjaG
	 NnFIIs8BLrO7D1U+m+O7dOmr6Y9fY4+Fu0wlc+UBfjcfi9KKgk5W3TIRbl1WL8szru
	 wN/NCxxavapTA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 22 Aug 2024 08:02:47 +0200
X-ME-IP: 90.11.132.44
Message-ID: <171ecc6e-281e-4b43-8bab-c776faa89ccb@wanadoo.fr>
Date: Thu, 22 Aug 2024 08:02:47 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] HID: corsair-void: Add Corsair Void headset family
 driver
To: Stuart <stuart.a.hayhurst@gmail.com>
Cc: linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-kernel@vger.kernel.org,
 Markus Elfring <Markus.Elfring@web.de>
References: <20240820002210.54014-3-stuart.a.hayhurst@gmail.com>
 <8a4c117b-7cab-4149-a9e7-c6214d6d92ad@wanadoo.fr>
 <CALTg27kBYb5+GOwBz4a1-xeM-21DrbUh7eQyNkW9K_m6TdSwNQ@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CALTg27kBYb5+GOwBz4a1-xeM-21DrbUh7eQyNkW9K_m6TdSwNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 22/08/2024 à 03:03, Stuart a écrit :
>> Maybe is_wired could be close to other bools below, to improve avoid
>> holes in the structure?
> 
> Possibly, I put `name`, `is_wired` and `sidetone_max` together, since
> they only depend on the device model and are set once.
> 
>> Missing newline.
> 
> Done
> 
>> I'm not familiar with the hid_hw_raw_request() API, but I think that a
>> kfree(send_buf) is missing here.
> 
> The `__free(kfree)` on the declaration should take care of that

Sorry, I missed that.
You are right.

> 
>> Nitpick: No need to init.
> 
> Thanks, but that `ret` won't be in the next revision anyway
> 
>> You could save 2 lines if ret was initialized when declared.
> 
> Could I? Wouldn't it get overwritten by `hid_hw_raw_request`?

No, you are obviously right.

BTW, the return value of corsair_void_request_status() is not used.
Does it make sense to change it into avoid function?

> 
>> devm_kasprintf() would simplify this.
> 
> Well that's a lot simpler...
> 
> Thanks,
> Stuart
> 
> 


