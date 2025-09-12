Return-Path: <linux-input+bounces-14670-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6597AB55880
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 23:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EB453BC1E9
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 21:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4466273D6D;
	Fri, 12 Sep 2025 21:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="qwoVily+"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D808721E097
	for <linux-input@vger.kernel.org>; Fri, 12 Sep 2025 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757713077; cv=none; b=vFN6r4sOxty0yuUkS1z0sF+LVDladRe6uuuVWjsJWyHTnfZFRyKh7WNUM/iy0JH9E8Zd9HO3kst1mAhJdlQJuVFd00DcT3IzfVrJ+LxoojsSfTa4TEtExHQtZO6y7v0gURih4sSNj17KA1i+vaQ+uVLhVL3EJE/v5I719LMZl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757713077; c=relaxed/simple;
	bh=nSxbWu7+O4U/A/c4snJs8VIMkbPUJLsjD5m7j9QcKeE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uA8/Ucl/+J7tyVDTwx/WgwgbYEo2+zPF6lXMg6sOWeKqyAg9FGAJ0sYOojPYvAHVgJStM0CMGcmF5PNzkJH98NSyXVuemLroBfW07GgaEaa/OaMNX8im9qv5l8aCqk7CVOIJVhAdjAU85I9IOm6u/z4ds+nvrYNpDk9d/NEuFDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=qwoVily+; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1757712716; bh=nSxbWu7+O4U/A/c4snJs8VIMkbPUJLsjD5m7j9QcKeE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qwoVily+47KuNxNXXe/8JI8eQ9m4HHp1LCYj3sLXXriEdhpkwxJa36qPo/uUxUv5c
	 smi4CZ0s0d8eROEI8PAfN5BU1CqwNdBXYqK/VaSpUHyEshtcga5jRO6BhXyIGXg6hO
	 rvycHCTMk+n71giFp6BcIiQ2OowFz+cVdl+M2hyBW1p/8Mri8eindxlbI2tcY8MhwY
	 rCWDC6Aguw8PCRzZ3FzSrAeJS4EsnGRp4F8/Ke4BuPYIiM850QdX41w86CG1yP/LQ/
	 7an1YyrUJek9nUjdJUwzzkMYSivpYM+sWdTSEb+5COAVNS+SCNCIJg31QO6tMLs1AK
	 VDfvytWHGAykA==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 34D16A08B;
	Fri, 12 Sep 2025 14:31:56 -0700 (PDT)
Message-ID: <338cb599-8131-4bca-89b1-414f74db7d3e@endrift.com>
Date: Fri, 12 Sep 2025 14:31:55 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Adding Kernel xpad support for Flydigi Apex 5
To: Jiri Kosina <jikos@kernel.org>, brandon <brandon@emergence.ltd>
Cc: linux-input <linux-input@vger.kernel.org>
References: <198f7064b23.1194b1b9d477339.120973386817363979@emergence.ltd>
 <75r4880n-on78-7010-2q64-so6pp5qsos82@xreary.bet>
 <r856p96o-850o-47sn-rsps-04n94875o975@xreary.bet>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <r856p96o-850o-47sn-rsps-04n94875o975@xreary.bet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jiri and Brandon,

On 9/12/25 7:14 AM, Jiri Kosina wrote:
> On Fri, 12 Sep 2025, Jiri Kosina wrote:
> 
>> On Fri, 29 Aug 2025, brandon wrote:
>>
>>> Hello,
>>>
>>> This adds support for the Flydigi Apex 5 controller to the xpad kernel module. This has been tested as part of: https://github.com/paroj/xpad/pull/328
>>>
>>> This patch is very small and simple, it simply white lists the controller so it can be used. The trigger and stick mappings are none standard, but SDL has the correct mappings already shipped so it's not a problem in Steam or games I've tried.
>>>
>>> Here is the patch:
>>>
>>> --- linux/drivers/input/joystick/xpad.c.orig 2025-08-29 18:20:56.157442704 +0100
>>> +++ linux/drivers/input/joystick/xpad.c 2025-08-29 18:19:29.539174760 +0100
>>> @@ -422,6 +422,7 @@ static const struct xpad_device {
>>> { 0x3537, 0x1010, "GameSir G7 SE", 0, XTYPE_XBOXONE },
>>> { 0x366c, 0x0005, "ByoWave Proteus Controller", MAP_SHARE_BUTTON, XTYPE_XBOXONE, FLAG_DELAY_INIT },
>>> { 0x3767, 0x0101, "Fanatec Speedster 3 Forceshock Wheel", 0, XTYPE_XBOX },
>>> +	{ 0x37d7, 0x2501, "Flydigi Apex 5", 0, XTYPE_XBOX },
>>> { 0x413d, 0x2104, "Black Shark Green Ghost Gamepad", 0, XTYPE_XBOX360 },
>>> { 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
>>> { 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
>>> @@ -578,6 +579,7 @@ static const struct usb_device_id xpad_t
>>> XPAD_XBOX360_VENDOR(0x3537),		/* GameSir Controllers */
>>> XPAD_XBOXONE_VENDOR(0x3537),		/* GameSir Controllers */
>>> XPAD_XBOXONE_VENDOR(0x366c),		/* ByoWave controllers */
>>> +	XPAD_XBOXONE_VENDOR(0x37d7),		/* Flydigi Controllers */
>>> XPAD_XBOX360_VENDOR(0x413d),		/* Black Shark Green Ghost Controller */
>>> { }
>>> };
>>
>> Thanks for the patch.
>>
>> It's however whitespace-damaged, and also is missing a signoff. Could you 
>> please fix that and resubmit, so that I could merge it?
> 
> (sorry, it's not me who should be merging it, but Dmitry Torokhov as an 
> input maintainer -- please CC him as well on the next iteration)
> 

A corrected patch was already submitted by someone else: https://lore.kernel.org/linux-input/20250903165114.2987905-1-lkml@antheas.dev/

Vicki

