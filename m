Return-Path: <linux-input+bounces-10446-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F4CA4A106
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 18:59:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5017A168928
	for <lists+linux-input@lfdr.de>; Fri, 28 Feb 2025 17:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7B681C175A;
	Fri, 28 Feb 2025 17:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="kOJrMZjT"
X-Original-To: linux-input@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90821F4C8E
	for <linux-input@vger.kernel.org>; Fri, 28 Feb 2025 17:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740765549; cv=none; b=Tb3PSQChAh5DiaBkGZgjfljjlwRytJLl+L7oVtmX+jzSuVdir3sUtura1Wd/TRDEacVmWJvEaS/c/6uv6cBRGYSYFF7J8J2OczS9vLPnUAOOo/FDFMGPwXVYSQdpr9GXrQZ2uX+6UdZ2TCmXVTMivwR0kegIGYLNzi2NtBRd2mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740765549; c=relaxed/simple;
	bh=NZFoaf4zSJMllmjO2mXpc5yFyD5MEK90v3SfJLOJQz0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OA1f2nIjxa7YU2RICxDfGLrQTGbwpFll1RgHJBGynvuh1Ye97rqbTzgToO7dvtEYneHAUb/JYqnlySIU+4tdTQBy70peLq2c15zpqrKhLzRP7LNN64YEhG8CHf8NaMS9X4JdDkg57pbHRJWsusl3IACTByoW8173lMozALQZqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=kOJrMZjT; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 6AC542FC0059;
	Fri, 28 Feb 2025 18:59:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1740765543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NcrKki3bqHiCKdj6Or16A3iLGtQRGRvZyhdskyxAZh4=;
	b=kOJrMZjToRuUhiyY+aReo3RDv1o9X6NAxxY2vP56moBw8wLwHUneBwksoIfwY4c4OogobI
	ds8kzNhE8FABVl5A7Hb1kl3/UrHDTVirpgcKj8Zd7XvF8E6mzU891cRbdvp7RPYYnv/e1h
	eDMB6XQRguuNS3yAaq0D8DYx0lJAvQo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f9ff0025-d801-4129-9622-09f99e410fcb@tuxedocomputers.com>
Date: Fri, 28 Feb 2025 18:59:03 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fix strange media key for PS/2 keyboard in a driver
From: Werner Sembach <wse@tuxedocomputers.com>
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <75f6f0bd-084d-48a2-b7d9-b8a05fa80f55@tuxedocomputers.com>
 <d41e5d88-818f-40a8-8691-b5ebc42ec042@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <d41e5d88-818f-40a8-8691-b5ebc42ec042@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 27.02.25 um 22:29 schrieb Werner Sembach:
> Hi,
>
> Am 02.01.25 um 18:49 schrieb Werner Sembach:
>> Hi,
>>
>> TongFang/Uniwill Notebook barebones have their internal keyboard connected 
>> via PS/2 and pressing the touchpad toggle media key sends the 3 key combo 
>> KEY_LEFTMETA + KEY_LEFTCTRL + KEY_ZENKAKUHANKAKU.
>>
>> If it were a HID keyboard I could use a HID-BPF program to remap this 3 key 
>> combo to a singular press of F21 which seems to be the default for touchpad 
>> toggle and now I wonder if something similar is possible for PS/2 keyboards?
>
> Gentle bump.

I think I found what I was looking for: i8042_install_filter

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/i8042.h?h=v6.13#n62

https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/input/serio/i8042.c#n197

>
> In the meantime I tried fixing it on the XKB level but that comes with it's 
> own challenges: 
> https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/merge_requests/794
>
> Best regards,
>
> Werner
>
>>
>> Kind regards,
>>
>> Werner
>>
>>

