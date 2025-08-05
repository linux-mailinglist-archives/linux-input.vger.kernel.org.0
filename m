Return-Path: <linux-input+bounces-13826-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7768FB1BB76
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 22:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD88C182BC5
	for <lists+linux-input@lfdr.de>; Tue,  5 Aug 2025 20:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADD32219A95;
	Tue,  5 Aug 2025 20:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="qiEWSq7P"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9322D4315E;
	Tue,  5 Aug 2025 20:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754426019; cv=none; b=ddP+kPj9qsGaWeHgRqm2T6P9m3/SYL6kgjnrogQuNH9/oLzUj8JPYUkTiGhUc73D0Mq81EN9XQjtDI4p8MBfbXM9a3rJ+YYokXQK/NWzsqkoGnoRt33UvZ2zmfBHzHw7vb4XA5hrWxgXpG8G/DJi6VTy1rwu0omGT109m0/gEmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754426019; c=relaxed/simple;
	bh=nfVspZqWAHj5ymORAIDiEh0obQXe/3IXyXave1VHwBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Unv4DeDP51PnqUuiNjVbb+PRVqiJ1z7Cve/qXCej+7XXufhUnVuQndOXGidhHd4EWA3KE6eVKtxIfIFcIg3gwSIYmcyGV3IyoSWyofe5C97KcadreRLVEoY5cFG3FXXuuUlECeHlT/yrdqNzp+5yT5AJCLVIF2ruPOZ+D1YAZV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=qiEWSq7P; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1754425420; bh=nfVspZqWAHj5ymORAIDiEh0obQXe/3IXyXave1VHwBE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=qiEWSq7PGMTh0Mmgpot1/XP2XiY+8u6IzSC4xsN4ovIgYsamlhWIOxWj0dQmo5n0k
	 CzT7sYcBTWfaebaUsONV8f1sKtp42GBv9SqmKo6ywbeaT3gxLm09c9IGuaLV2dao2L
	 /a/v2T8ejWFg+5XEM0aF5GoRaMVfvw+Natba0eGjgZImbw2ylCMNFcN6+WwZKhIy15
	 sKTvjoOC8w1hvqqPyCOfbeUCfXTQ8oYViQPnUf2geiuNY9Ce9+nNdbNUFEj2sSgYLE
	 lKHemh5gQ+kY1mAKEEvLydM/FvbivzEpLRzYGVGqHrsum+ywE1WE1pRWvI7sDSTQOe
	 bvKFtHRDpdvYw==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 53082A03F;
	Tue,  5 Aug 2025 13:23:40 -0700 (PDT)
Message-ID: <1607cb00-1146-4a64-92cc-65eb91062706@endrift.com>
Date: Tue, 5 Aug 2025 13:23:39 -0700
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] xpad: Add support for Thrustmaster, Inc. Ferrari 458
 Spider Racing Wheel
To: =?UTF-8?Q?P=C3=A4r_Eriksson?= <parherman@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Rojtberg <rojtberg@gmail.com>,
 Nilton Perim Neto <niltonperimneto@gmail.com>,
 Antheas Kapenekakis <lkml@antheas.dev>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250805192036.53918-1-parherman@gmail.com>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <20250805192036.53918-1-parherman@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pär,

On 8/5/25 12:20 PM, Pär Eriksson wrote:
> Hello,
> 
> This patch series adds support for the Thrustmaster, Inc. Ferrari 458 Spider Racing Wheel (USB ID 044f:b671) to the xpad driver. The implementation is inspired by the work in https://github.com/Capure/xpad.
> 
> The wheel reports steering and pedal data at non-standard offsets, so custom axis mapping is introduced via a new mapping flag.
> I have tested the changes with the actual hardware on Fedora 42 (kernel 6.15.7-200.fc42.x86_64), and confirmed correct input reporting.
> 
> If you prefer a different name for the mapping flag, please let me know.
> 
> Please consider this for upstream inclusion.
> 
> Pär Eriksson (3):
>   Input: xpad - Add MAP_FERRARI_458_CUSTOM_AXES mapping flag
>   Input: xpad - Add Thrustmaster Ferrari 458 Spider (044f:b671) device
>     entry
>   Input: xpad - Implement custom axis mapping for Ferrari 458 Spider
> 
>  drivers/input/joystick/xpad.c | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 

So I have several concerns with this series in general. First of all, it should be just one patch, but more importantly, the device *does* have standard offsets...just not standard *gamepad* offsets. GIP, the Xbox One controller protocol, uses GUIDs to specify the type of device in question. Most devices you're familiar with use the gamepad GUID, but the wheels use a different one which have a different set of mappings. So ideally, the name of the flag would be MAP_WHEEL.

However, the problem runs deeper. This is all easily detectable from the metadata. xpad *in general* does not support the metadata parsing, so we can't autodetect it without parsing it. Unfortunately, the metadata message is fragmented. xpad *in general* does not support fragmented messages. xpad is based on a very rudimentary understanding of the protocol, which is very obsolete at this point.

I have a new driver I've been working on for a few months that supports all of this stuff properly, including wheels, that I am hoping to support for the 6.17 merge window. I may be too late, but if I submit it soon you can at least pull it downstream while waiting for the 6.18 merge window. I'll see if I can get it ready before the end of the week.

Vicki

