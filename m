Return-Path: <linux-input+bounces-14669-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B458B55749
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 21:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27C9C3BA011
	for <lists+linux-input@lfdr.de>; Fri, 12 Sep 2025 19:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76B3D2BE7B1;
	Fri, 12 Sep 2025 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="Dji0bKfm"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C012848B0;
	Fri, 12 Sep 2025 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757707038; cv=none; b=Be0gLfL4lQ18TwxaS1C6i8PMc8qu5uGLL/fGbHk982cY0FDIsOZ8zdx71ECcZNyE/lSLr282IqHemKGs7tWRZ1RyDzeSynUcinHQ0Subiei9Dpl4rphX9wl1bLg8MEDLfe+3vUOH+1mPffOOJ2uREWIqIglugNfx2+v82ugWvYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757707038; c=relaxed/simple;
	bh=RuV43at9oIUzSJcsK485G4uQ64nYxSvVDGjhkRb7P5A=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Oq4Ie1Rp9U5uc/RhUjCv+wpz6PBrpxSbHv+NScSZnUbICJcLxe1Q1V2drpQMnonmAFpZB+GZAhH9lJp7mvdCCPoWYsMPAE8oMKveRbv/oZvo/VJutMsreWVBQrponxCGtcZZn+xPoP9rPunG5eckjiIlpZV8DzYxKCf4OYB1SMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=Dji0bKfm; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9g4tINQ3Nuz9BImuzc0dqyBpOKAEGiLicPpQhPXc8pk=; b=Dji0bKfmqJiUkwVgBmJmsWAB/L
	tffBxTLVA5K2FGhBefgPhkphycN/gKjMZyv73ZA9EVqF8Mxl+O/72ZlrVVkzQ0prW/nuXIzv9Fo+m
	u6CZAc7AoqFRMBmUbfmuGCUfDfPD6waroHkYNoEHW2SZjKa0ttcimM5RYimQJxuPGuouqsXPOXFor
	IIlSfMvzAJ5Mf1V9rlKQRL3amtWWMjREakspeL764lE/Ix7fhdK6oSZR7CTxnYkkD3gi7H+JqOi90
	DYiYzuzwunAcGHGiddd4T4UK1jDvX40p7Rfob6hWDGLg4J7pPL72y8kj3DCR/XgkrRwc110PIGyYf
	4WJbqYWg==;
Received: from [::1] (port=51882 helo=sv9.manufrog.com)
	by sv9.manufrog.com with esmtpa (Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1ux9tP-0000000AD8S-1vEg;
	Fri, 12 Sep 2025 21:57:06 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 12 Sep 2025 21:57:04 +0200
From: Staffan Melin <staffan.melin@oscillator.se>
To: zhangheng <zhangheng@kylinos.cn>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Jiri Kosina
 <jkosina@suse.com>, Benjamin Tissoires <bentiss@kernel.org>,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org, 1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
In-Reply-To: <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
X-Sender: staffan.melin@oscillator.se
Organization: Oscillator
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - sv9.manufrog.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - oscillator.se
X-Get-Message-Sender-Via: sv9.manufrog.com: authenticated_id: staffan.melin@oscillator.se
X-Authenticated-Sender: sv9.manufrog.com: staffan.melin@oscillator.se
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Thank you,

I tried to apply this patch to 6.12.39, the first problematic kernel, as 
well as 6.12.41, the first bad I tried, and on both I got an error 
message:

Applying: HID: quirks: Add device descriptor for 4c4a:4155
error: patch failed: drivers/hid/hid-quirks.c:1068
error: drivers/hid/hid-quirks.c: patch does not apply
Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155

To which kernel version should I apply the patch?

I used the command
git am < <file>

Best regards,

Staffan


On 2025-09-12 14:49, zhangheng wrote:
> I am currently working on resolving this issue by limiting the original 
> patch
> 
> based on the information in the device descriptor to avoid affecting 
> your device,
> 
> You can try this patch and look forward to your reply.
> 
> 
> 在 2025/9/7 23:10, Salvatore Bonaccorso 写道:
>> Hi Zhang, hi Jiri,
>> 
>> In Debian Staffan Melin reported that after an update containing the
>> commit 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY"),
>> the input device with same idVendor and idProduct, the Jieli
>> Technology USB Composite Device, does not get recognized anymore.
>> 
>> The full Debian report is at: https://bugs.debian.org/1114557
>> 
>> The issue is not specific to the 6.12.y series and confirmed in 6.16.3
>> as well.
>> 
>> Staffan Melin did bisect the kernels between 6.12.38 (which was still
>> working) and 6.1.41 (which was not), confirming by bisection that the
>> offending commit is
>> 
>> 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")
>> 
>> #regzbot introduced: 1a8953f4f774
>> #regzbot monitor: https://bugs.debian.org/1114557
>> 
>> So it looks that the quirk applied is unfortunately affecting
>> negatively as well Staffan Melin case.
>> 
>> Can you have a look?
>> 
>> Regards,
>> Salvatore

