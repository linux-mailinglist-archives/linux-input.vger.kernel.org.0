Return-Path: <linux-input+bounces-16948-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C529D0FBD5
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 21:00:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F15E30019F1
	for <lists+linux-input@lfdr.de>; Sun, 11 Jan 2026 20:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FB8D50276;
	Sun, 11 Jan 2026 20:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitmath.se header.i=@bitmath.se header.b="m6g0zahK";
	dkim=permerror (0-bit key) header.d=bitmath.se header.i=@bitmath.se header.b="f6hq1ZXU"
X-Original-To: linux-input@vger.kernel.org
Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DD92AE78
	for <linux-input@vger.kernel.org>; Sun, 11 Jan 2026 20:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768161621; cv=none; b=NH+N/+W2UktvWbx5DjvT98MAM9K2TuFhBxvXpVTkHXI7m0E1brW1oRnPU48rEcmVb12H8nwl5dR2pQhtNKwpU9TyAghlEi7r0Hry2vyM4Zsrid48lhN8fc2lDBafjN/o0l72B0ZHvPetyINzgSWFGo/+WZS3ykTjxdhUSYwb6VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768161621; c=relaxed/simple;
	bh=YkdBC+BJPgjg6jT6Iql6IRzNIOzQedEYQlPuYzW2Lj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JyU78Mq2cGPvCBAMAkRxLuxpNxtzQFINUN0EkEPgrfJz7zzo6bhtxrPtiXhFLQsdoGMXDcrxiIANh9NnytmN4wdXqq/MDDPeZ+wAu9Drtf3xoUwrhsChmbsbMoxPvrhs8maG/dCqfeMFKewXhD/+BysB+ZXT9FgxzdsnFu1Gmlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitmath.se; spf=none smtp.mailfrom=bitmath.se; dkim=pass (2048-bit key) header.d=bitmath.se header.i=@bitmath.se header.b=m6g0zahK; dkim=permerror (0-bit key) header.d=bitmath.se header.i=@bitmath.se header.b=f6hq1ZXU; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bitmath.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bitmath.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1768161547; x=1768766347;
	d=bitmath.se; s=rsa2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=cIR1Ynbp6r/WBwD75IdpVBtN6nIGDTM0A0/QjVv0CiM=;
	b=m6g0zahK51q44yLPsjMfks5/RMcK7rcndbC5G187D09s8IxdAXuhe3G+oEPsi7H1qugVia9jkE39H
	 i1HgWJ1g5e8gfsSYWyyIbiCC+6FKG+X+kgCm7I4pa/fLN7B2oGA4eUI8pDdBi4piKcik9NOSiAPSqt
	 5wc0e6Ujyzz34824JngPkkTae6wt/zh+0auRvz4CgqoAFMVQ6N0AAtT1H8kV6/H3cosxRlv0btWJMW
	 85f4xLO2Yrugy1UFGnyVvlVY6rv+7FsyTXRXTzVYvtQIhSRhQqIrSqvxpV0uZZY7wi9OzpeHIyJVyD
	 zGQhmLRem0RFv8X9P3caqWFEyuaLILA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1768161547; x=1768766347;
	d=bitmath.se; s=ed2;
	h=content-transfer-encoding:content-type:in-reply-to:from:references:cc:to:
	 subject:mime-version:date:message-id:from;
	bh=cIR1Ynbp6r/WBwD75IdpVBtN6nIGDTM0A0/QjVv0CiM=;
	b=f6hq1ZXUATYaUbF680mTutl3ve2AY5hjS5k8an8p+ljfb6rbDaa7rj+pGzGsO4+QO45iYgPpR5yc/
	 4dWiqzXDA==
X-HalOne-ID: fb9d67ea-ef27-11f0-a524-4f541c8bf1cc
Received: from [192.168.19.13] (h-94-254-62-230.na.cust.bahnhof.se [94.254.62.230])
	by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
	id fb9d67ea-ef27-11f0-a524-4f541c8bf1cc;
	Sun, 11 Jan 2026 19:59:06 +0000 (UTC)
Message-ID: <38ea07c1-50ce-4342-aba9-fe2f4bc6c503@bitmath.se>
Date: Sun, 11 Jan 2026 20:59:44 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bcm5974 trackpad broken after USB reset
To: Liam Mitchell <mitchell.liam@gmail.com>,
 Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org
References: <CAOQ1CL4+DP1TuLAGNsz5GdFBTHvnTg=5q=Dr2Z1OQc6RXydSYA@mail.gmail.com>
Content-Language: en-US
From: Henrik Rydberg <rydberg@bitmath.se>
Autocrypt: addr=rydberg@bitmath.se; keydata=
 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 nQ==
In-Reply-To: <CAOQ1CL4+DP1TuLAGNsz5GdFBTHvnTg=5q=Dr2Z1OQc6RXydSYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Liam,

 > The trackpad on my 2013 MacBook Pro (10,2) stops working after the USB
> device is reset, logging "bad trackpad package, length: 8" when
> touching the trackpad.

This sounds like the device has left wellspring mode, and is not 
properly reinitialized after reset. It has been a decade since I worked 
on this driver, but what I can see, there is no reset_resume handler in 
bcm5974, but there is one in appletouch.

I would look into the code around the wellspring mode switch function, 
and see if it gets called after the usb reset. If not, adding the 
reset_resume handler might resolve things.

Hope this helps,
Henrik


