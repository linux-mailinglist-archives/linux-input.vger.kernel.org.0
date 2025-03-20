Return-Path: <linux-input+bounces-10996-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBF9A69F1F
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 05:42:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4F121898793
	for <lists+linux-input@lfdr.de>; Thu, 20 Mar 2025 04:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2191E1DD0EF;
	Thu, 20 Mar 2025 04:42:33 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from cosmicgizmosystems.com (beyond-windows.com [63.249.102.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED4B33E1;
	Thu, 20 Mar 2025 04:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.249.102.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742445753; cv=none; b=tnvOcAvyoe28+jSWhysD+KK6lyyqFRexeA6Vpnn66VTjCrtJXY38yD/+fgdQEa8SGRYyDxAt1ViAaDQ2NXFxYmFGVVDH6hpqA8woMf+Z4c34XPslMc73zbqyT38+kxgt3/ErLSMPeTMv6RIfPVR9I4Eu+n6NDM6bPnh4ehjQeiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742445753; c=relaxed/simple;
	bh=sUCMany7RovlZz48dOs1Xqc7+CapH8WJnynZhBKIswo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bq97Mi69jD8p37clEyNLreuq4nfbKeZJUUhkmfJGT2stNIXAcaPr32qiJx3XShI4KK0dlOBiFScPJfCxLjXu9g1Pz+IQeM+3/0VyNi42JTtHZWqLhJpbnIITulAA6KiXxUP2KnALTUNwUyh6/Fp9rzmOnXP9ykrDpLOVq5jhDgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com; spf=pass smtp.mailfrom=cosmicgizmosystems.com; arc=none smtp.client-ip=63.249.102.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cosmicgizmosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cosmicgizmosystems.com
Received: from [10.0.0.100] (c-71-63-147-217.hsd1.wa.comcast.net [71.63.147.217])
	by host11.cruzio.com (Postfix) with ESMTPSA id 23ACE1D76AB5;
	Wed, 19 Mar 2025 21:36:48 -0700 (PDT)
Message-ID: <8c5668e9-728e-4223-ad74-232f6ece931f@cosmicgizmosystems.com>
Date: Wed, 19 Mar 2025 21:36:47 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] UBSAN: Array-Index-Out-of-Bounds in usbhid_parse (HID) on
 6.14.0-rc4
To: Alan Stern <stern@rowland.harvard.edu>, Strforexc yn <strforexc@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Nikita Zhandarovich <n.zhandarovich@fintech.ru>, linux-usb@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CA+HokZreT4LYLbru4cc0iU4jKkdf40YnVunaGX0hFV2GAnnuEg@mail.gmail.com>
 <21b63d7e-5141-426b-af06-9465609e2ca2@rowland.harvard.edu>
 <CA+HokZrYvNhfGQ7Kf+smO1EzrX2Fvtqm92cEnE0M534kXZKHjA@mail.gmail.com>
 <765270fa-dfca-46cb-9d4a-7f4a61c19663@rowland.harvard.edu>
Content-Language: en-US
From: Terry Junge <linuxhid@cosmicgizmosystems.com>
In-Reply-To: <765270fa-dfca-46cb-9d4a-7f4a61c19663@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/4/25 7:14 AM, Alan Stern wrote:
> On Tue, Mar 04, 2025 at 10:21:03AM +0800, Strforexc yn wrote:
>> I hadn’t come across this patch earlier—thanks for sharing it! After
>> reviewing it, I can see that it addresses the UBSAN
>> array-index-out-of-bounds issue
>>
>> Alan Stern <stern@rowland.harvard.edu> 于2025年3月4日周二 00:02写道：
>>> Have you seen this patch or tried to test it?
>>>
>>> https://lore.kernel.org/linux-usb/20250131151600.410242-1-n.zhandarovich@fintech.ru/
> 
> You might want to work with Nikita on testing, improving, or 
> resubmitting the patch, because it hasn't been merged into the kernel 
> yet (as far as I know).
> 
> Alan Stern
> 

You may also want to try this patch that addresses the same issue by eliminating the for loop.

https://lore.kernel.org/linux-input/20250312222333.2296363-1-linuxhid@cosmicgizmosystems.com/

Terry Junge


