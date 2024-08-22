Return-Path: <linux-input+bounces-5737-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6FA95AD48
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 08:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 879251F23FEB
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 06:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1ACD57CBE;
	Thu, 22 Aug 2024 06:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="HgTGu5RU"
X-Original-To: linux-input@vger.kernel.org
Received: from msa.smtpout.orange.fr (msa-216.smtpout.orange.fr [193.252.23.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B43AD2D;
	Thu, 22 Aug 2024 06:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.23.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307325; cv=none; b=rLKBKzoDDeNkTm1FbZ3FiFJYppr1NkEZ74kak78sTrQqYcwA0VOvCKCwtCCiWt2MQLCYy+Ayoo/RG8/aVSAY9zKE6iZk7FP+TfkAJfayXBfFbRbXxclNMBN7XvVBcFW/B3zT7nzR5FoIT+7E2AVOYXDDejiNCSQHP4Zva3O3Ob4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307325; c=relaxed/simple;
	bh=gE7HJGwPzb9QwFIDqoz16H+LTbNCegLBqEQAzMPOryM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FdGcp9ABERb+xH4atNpxQqmpbhZs93oADDNS3WK4KvjdNt+pZixWy0+WlKNS1xF2DQyIVPUC/mrnIVlMtmG7a31aTmBKarDtryOpWugrJ9nieERkNHWRLj+WjaBjO5HgWpYjkDGPvg/EIXQIV2Bnj9WJGMnDxak7U/ag1iyHDtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=HgTGu5RU; arc=none smtp.client-ip=193.252.23.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id h16OsqfTTiKc3h16OsNh1C; Thu, 22 Aug 2024 08:15:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724307321;
	bh=f+FyGUC0UH+gHN6I+2BobiU0UCvWGk6MFyKe4vtFVeY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=HgTGu5RUBF8u71VJSAxWt5rzA3Llul87ftxb0PUUOOv70yF/WsKCP/rwUJ3EXB5bT
	 rvDwt48XcvwlrJFKk/cEBt/I2CQFZPxwq/Otn4Xe2xZybxOBstyUzZPNxKfiwhzmk3
	 J+qRo1Oc80eRsEh8PN7JxaiRvbhunGTCJtQ/3LmYGXpR3qb8EjC4enHyrteHiK/Mpt
	 ypxs8ILczMaXjbg0fDRzekCw0i1zepIHcozKzfSIbcq4UY9tfmGiDgy4fk32DCOBxF
	 6X22Hpkk7Mq62DfJZY9WRkPsJDuMTZ8zZLSsez/QeAtFmpNeMuEyJ4lZtSnTiTC6H2
	 2sn3eDzkL0X5w==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 22 Aug 2024 08:15:21 +0200
X-ME-IP: 90.11.132.44
Message-ID: <fe5a258e-3cf9-47f3-aa36-802813c9866f@wanadoo.fr>
Date: Thu, 22 Aug 2024 08:15:20 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
To: Stuart <stuart.a.hayhurst@gmail.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-input@vger.kernel.org,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
 <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de>
 <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
 <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de>
 <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com>
 <f0aa2ca0-6256-48e4-8d2a-dfd5da072ad4@web.de>
 <78b667fa-8e54-4023-9187-4ecb999d3c01@wanadoo.fr>
 <CALTg27nmNR=AXg=Ku_nXtwFQLxMypdbK4_Bu9CruB=vEDzxZoA@mail.gmail.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <CALTg27nmNR=AXg=Ku_nXtwFQLxMypdbK4_Bu9CruB=vEDzxZoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 22/08/2024 à 03:11, Stuart a écrit :
>> If I recollect correctly, there may be an alignment issue and just using
>> the stack is not enough to guaranty what is needed.
> 
> I can't find any reference to issues with it, I'm not sure what I saw before.
> Also, it seems like the hid-asus driver is using it:
> https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hid/hid-asus.c#L391
> 
> Stuart
> 
> 

It's not.

asus_kbd_set_report() is called, and there, the array is explicitly 
kmemdup()'ed to a variable called dmabuf before calling 
hid_hw_raw_request().



I've not found an explicit documentation, but here are a few results 
from Google related to HID and DMA related issues:


[1]: 
https://linux.kernel.narkive.com/2bRjLz9p/patch-hid-lenovo-don-t-use-stack-variables-for-dma-buffers

[2]: https://bugzilla.kernel.org/show_bug.cgi?id=87991

[3]: 
https://git.kontron-electronics.de/estoll/linux-stm-lvds/-/commit/3d1355b3cfad53feba76a73b052c757a7de7f4de

CJ

