Return-Path: <linux-input+bounces-9151-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2CA0A8C0
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 12:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 641E47A0607
	for <lists+linux-input@lfdr.de>; Sun, 12 Jan 2025 11:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4ADD1A4F2F;
	Sun, 12 Jan 2025 11:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b="UEE935iv"
X-Original-To: linux-input@vger.kernel.org
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D7F2556E;
	Sun, 12 Jan 2025 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736682565; cv=none; b=OLtpBdhG1qYpzyzaYT7zVXmsKBcMIgGggVFe70EWvpVNp4WC9h9XK0NUYGb131t+u8IDoBYFiXp8kvDYTqzVKZRWqlWkJxxTSSbP/iN44U8kk1AZYclzNm7sXQUZQbFR5yzrpi2rft05MpI8ON1pxLLSHB5mHxORzEBFLxBVVpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736682565; c=relaxed/simple;
	bh=PsmB0veP9nQnQImMvJz1PgpXOpd5BNSD03m6Uk1kITQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2F95ChNxIIyoS28meH3q+t5USQ2yKD7H4LYLo8WniXPx4oUF7Iju2vE6BYC8Ck8ahmcymNpODUHCsFNXKB60LRaFmWlSbyPgwdFe6CY0vZ9jBy9ML1bYb43ugVI2//3sIeMfCaPuocLmC/ovPBPkwo5dMyTemU4XZ6BVm7XK4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de; spf=pass smtp.mailfrom=mayer-bgk.de; dkim=pass (2048-bit key) header.d=mayer-bgk.de header.i=@mayer-bgk.de header.b=UEE935iv; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mayer-bgk.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mayer-bgk.de
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YWDFZ1K4wz91JH;
	Sun, 12 Jan 2025 12:49:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mayer-bgk.de; s=key2;
	t=1736682562; bh=PsmB0veP9nQnQImMvJz1PgpXOpd5BNSD03m6Uk1kITQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UEE935ivpVh1BE+ch16naTVkl4UTI0KeXAdht8pfdX15BnqhBDqOuyoxB3BKMrMHd
	 3sG/+tzy/qk2D0Kc9dAZ2gqU1i/DP1bs3YW28JPr9OXaNsQSqbJOpPUHQprSgAu7m2
	 b4dI0Udev3iC0PY/M6WnZ8ZXA8cYXBIXc+8t7sbYDr0HaW6SIrXr0ZZe0QEneRfH2t
	 WqTC1rdAIqHAamin9R/T8gNjc9LArQkJuyldt4y8Xq22V7GfEs1MI1HkCxZ978t/nz
	 cbwxonyByFWM9nftROOZp8NW62vYb8i3CyqVcDgfpZ4RTvT0G/OAj1g+PeHMk3AVKk
	 5HXUOPCNHVrIw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4YWDFZ0Zflz7xfW;
	Sun, 12 Jan 2025 12:49:22 +0100 (CET)
Received: from mxe85d.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4YWDFY6JW7z8sbH;
	Sun, 12 Jan 2025 12:49:21 +0100 (CET)
Received: from [192.168.1.212] (ipbcc1eb64.dynamic.kabel-deutschland.de [188.193.235.100])
	by mxe85d.netcup.net (Postfix) with ESMTPSA id 4C6471C00EF;
	Sun, 12 Jan 2025 12:49:17 +0100 (CET)
Authentication-Results: mxe85d;
        spf=pass (sender IP is 188.193.235.100) smtp.mailfrom=christian@mayer-bgk.de smtp.helo=[192.168.1.212]
Received-SPF: pass (mxe85d: connection is authenticated)
Message-ID: <a0532dd6-9d62-4b96-969e-42cf79b13981@mayer-bgk.de>
Date: Sun, 12 Jan 2025 12:49:17 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] HID: steelseries: add SteelSeries Arctis 9 support
To: Bastien Nocera <hadess@hadess.net>, Christian Mayer <git@mayer-bgk.de>,
 linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
References: <20250101151209.100072-1-git@mayer-bgk.de>
 <20250101151209.100072-2-git@mayer-bgk.de>
 <1a966d05a55e7d7252f8aa03857c390e3518f76d.camel@hadess.net>
 <baad8f90-e9cb-4c1d-bbbc-fa556c1c2e1a@mayer-bgk.de>
 <73e15575fba6cb1093b1b8298e29e9a52ed5930f.camel@hadess.net>
Content-Language: en-US
From: Christian Mayer <christian@mayer-bgk.de>
In-Reply-To: <73e15575fba6cb1093b1b8298e29e9a52ed5930f.camel@hadess.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <173668255763.31277.998484798085612949@mxe85d.netcup.net>
X-Rspamd-Queue-Id: 4C6471C00EF
X-Rspamd-Server: rspamd-worker-8404
X-NC-CID: 7LPvLqs6XKb9cbYjwZw/EJV24AxGmcWf6dTDB3yzV06OsyIIVz0=



Am 09.01.25 um 14:35 schrieb Bastien Nocera:
> On Sun, 2025-01-05 at 11:16 +0100, Christian Mayer wrote:
>>
>>> On Wed, 2025-01-01 at 15:11 +0000, Christian Mayer wrote:
> <snip>
>>>    
>>>> +	if (sd->quirks & STEELSERIES_ARCTIS_9) {
>>>> +		ret = hid_hw_open(hdev);
>>>
>>> Is this needed? If so, this probably needs to be added as a
>>> separate
>>> commit, for all headsets rather than just this one.
>> Yes that's mandatory to get raw_events from the device.
>> I thought about adding this to all headsets, but i was not sure if
>> this
>> breaks anything for the Arctis 1 headset.
>>
>> But i can add this for all headsets, that's fine with me.
>> Would you like me to create a completely separate patch for this or
>> should i submit this with the preparation patch which refactors
>> steelseries_headset_fetch_battery?
> 
> Please send a patch that does it for both headsets, and I'll test it
> locally.
I resent the patches with the requested changes (v2)
Please use 
v2-0001-HID-steelseries-preparation-for-adding-SteelSerie.patch for testing.


