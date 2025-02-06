Return-Path: <linux-input+bounces-9811-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88B3A29E91
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 02:59:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50611167BBF
	for <lists+linux-input@lfdr.de>; Thu,  6 Feb 2025 01:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CF21B7F4;
	Thu,  6 Feb 2025 01:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="Q2sF0Xjs"
X-Original-To: linux-input@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F34A06
	for <linux-input@vger.kernel.org>; Thu,  6 Feb 2025 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738807148; cv=none; b=q9adE14619LIMAxRL2dgPpPE9seyllriRW6cVJjY/b89RkBsbT6J0ZzTNT2aFUX1l2+YILCDI3/rRE6gwJFexoZvLkNviGxEtOdJPAu7rEVA2/ST+49ndRRLlb1SoL3YE0HZqP9y78N4BjxQftfLDz2CYIg3Gj1Ilpy5/VNhOYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738807148; c=relaxed/simple;
	bh=YqFH9rMn15zyWVsv6Ljv+5QNYbSw0kpLjvElz0AT44E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QR3Nu5v4/fTDHVFQgP2I6R70ok6LylsvBlVeRkhtdz/7qzSDhEfsO7otQsqcs109Vq0Rvoo12EApVwY20qlrcYliKHdsRvgwhv33r8WcP8sjbeuk5Qwr6xQ6gi6m6RFjxr4iVcJVZueJPj197h/giZDqxH+0VU8IbAqw+9fRr3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=Q2sF0Xjs; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1738807144; bh=YqFH9rMn15zyWVsv6Ljv+5QNYbSw0kpLjvElz0AT44E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q2sF0XjsFqp0pZ/4/bi1vosPtB80D3kivX1MLDHCHyyqJgOHPW3kEe+xQY+kaRpsu
	 c3G0kSwx40S6KOdRTqfRz9sW+9h+mzHOCcTPZCVIv9v+UPCz8y+7xxbnFaF1w7UVCF
	 sdpKh4DpC+OzL9Bn/8svf+2rwHDGhxPUUIq9QySDShlZZMLn7YAo7+yDL+2JgwYbvZ
	 rYGnLPkE2N8pmiBgQ0kK/osZBup1WQ9+GyUcsIvns7Y1lvGYVUCoggxNfThojEI9TK
	 pLsnNcPwNb5uC/uZrfkJi/YAcW5Oem6Uhj/506Zm1LmP0Fbd9FK8g2AyhNA4ZELXdL
	 11hUN4D36HU3Q==
Received: from [192.168.0.22] (71-212-74-234.tukw.qwest.net [71.212.74.234])
	by endrift.com (Postfix) with ESMTPSA id 5C2C7A043;
	Wed,  5 Feb 2025 17:59:04 -0800 (PST)
Message-ID: <e6286529-6eb5-4440-afa3-db956c3bb8d8@endrift.com>
Date: Wed, 5 Feb 2025 17:59:03 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hid-steam: Move hidraw input (un)registering to work
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-input@vger.kernel.org
References: <20250205035529.1022143-1-vi@endrift.com>
 <1119qo78-r459-2qop-rro9-496p33op0035@xreary.bet>
Content-Language: en-US
From: Vicki Pfau <vi@endrift.com>
In-Reply-To: <1119qo78-r459-2qop-rro9-496p33op0035@xreary.bet>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Jiri

On 2/5/25 1:07 AM, Jiri Kosina wrote:
> Vicki,
> 
> all three patches look good, thanks for fixing the issues.
> 
> Is it possible to identify commits that could be used as 'Fixes:' tag for 
> each of the patches? If this has been the issue since the beginning, it's 
> good to reference the initial commit by the Fixes: tag still.

Sure thing. Patch 2 is just some code cleanup and doesn't fix any bugs. Patch 3 Fixes: cd438e57dd05 ("HID: hid-steam: Add gamepad-only mode switched to by holding options"), but Patch 1 is a bit rough to track down since it's so old. I believe it Fixes: 385a4886778f6 ("HID: steam: remove input device when a hid client is running."), but I'm not sure, and testing it would be kind of rough.
> 
> Thanks,
> 


