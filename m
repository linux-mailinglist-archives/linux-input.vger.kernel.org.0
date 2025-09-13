Return-Path: <linux-input+bounces-14680-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936AB5610D
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 15:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B366E165C95
	for <lists+linux-input@lfdr.de>; Sat, 13 Sep 2025 13:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 293BC2ED14B;
	Sat, 13 Sep 2025 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b="S1GReF/J"
X-Original-To: linux-input@vger.kernel.org
Received: from sv9.manufrog.com (sv9.manufrog.com [46.246.119.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062342EC570;
	Sat, 13 Sep 2025 13:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.246.119.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757769085; cv=none; b=VO25nFMjHtIv/E05XRHa0349fGjj1VUtW9AkLmeM4G246yA2pKZWRpZCYlKnGjuDiTuSU8mAEjAeLJasib9qzc+PQyFv4qsYSwldzyiS8gTSoo991d/Y/ZTgxBrehuDoGNw5mPmL1nS8+wKGqYp/6Pwqc5hQsAlWNerVvkqEGAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757769085; c=relaxed/simple;
	bh=v0BBL64UmOk+e62Q4T1pCcqVThxT3xZi5jSjhI5lYy0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=FK4uTRgORU5kTBp20Wg+eaB6ce7Rc4mJtKQvpMNSmKBFlmmd/XXMBLKyLm1j4F8mVWnC16cxf8PEwBWRPtEiLoSO3HK1vky9yeRJ6nouE7MTeb/XzBWqwybnlNLW5rrCFrZcrqpMEfEmKVGsWOLMzLbiI600kanz+zmHaTF3Ljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se; spf=pass smtp.mailfrom=oscillator.se; dkim=pass (2048-bit key) header.d=oscillator.se header.i=@oscillator.se header.b=S1GReF/J; arc=none smtp.client-ip=46.246.119.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oscillator.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oscillator.se
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=oscillator.se; s=default; h=Content-Transfer-Encoding:Content-Type:
	Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ImRo0mF6q6nENrBTd4EI8p/Zv5nZZbTSLKettAexwII=; b=S1GReF/JGBFsi0MdL5iOwVTOpw
	FZyfgj8fepG8l5gsLdVTiDGH5uMdpBHuQcDS5sI4/NSbzVfsABzwshJncYKq3suPDjRURABnxlq1f
	O1rKWeFSDfTQSV8OH5LGIzXo5iBdOEH8TxNOFxxjtpNGWSkmDetttLi3dmz6wiYTKyENXtZQlJUk/
	lTZJfsHMi/mevRXSZyL833yNsCsQuIZh0xrCT55biRo/+QFwG2zS+B/C65YDYw5JXNebGeEisTieO
	AjdNPQWeGd87h3rFRFHaXPEsRT+ly6GFccRa0jTYimouT1t5tzNFtCCvJG9cu4Kal1kxj1yjTJqaF
	A0a8j0nw==;
Received: from [::1] (port=55148 helo=sv9.manufrog.com)
	by sv9.manufrog.com with esmtpa (Exim 4.98.2)
	(envelope-from <staffan.melin@oscillator.se>)
	id 1uxQ2F-00000001cTy-1N03;
	Sat, 13 Sep 2025 15:11:18 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 13 Sep 2025 15:11:16 +0200
From: Staffan Melin <staffan.melin@oscillator.se>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: zhangheng <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>,
 Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 stable@vger.kernel.org, 1114557@bugs.debian.org
Subject: Re: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
In-Reply-To: <aMUxg6FLqDetwiGu@eldamar.lan>
References: <aL2gYJaXoB6p_oyM@eldamar.lan>
 <c8f3d402-e0ec-4767-b925-d7764aec3d93@kylinos.cn>
 <e81e8d68cb33c7de7b0e353791e21e53@oscillator.se>
 <aMUxHZF-7p7--1qS@eldamar.lan> <aMUxg6FLqDetwiGu@eldamar.lan>
User-Agent: Roundcube Webmail/1.6.11
Message-ID: <f08669ec112d6ab2f62e35c0c96d1f06@oscillator.se>
X-Sender: staffan.melin@oscillator.se
Organization: Oscillator
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
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

Ah, thanks, I get it now :)

So I got 6.16.7, and the patch applied without problems.

But no luck, the same results as before: touchscreen not working, xinput 
--list not showing the Jieli touchscreen. dmesg shows the same as 
before, too.

Best regards,

Staffan


On 2025-09-13 10:55, Salvatore Bonaccorso wrote:
> Hi Staffan,
> 
> chiming in hopefully it is of help.
> 
> Now really with the patch ...
> 
> On Fri, Sep 12, 2025 at 09:57:04PM +0200, Staffan Melin wrote:
>> Thank you,
>> 
>> I tried to apply this patch to 6.12.39, the first problematic kernel, 
>> as
>> well as 6.12.41, the first bad I tried, and on both I got an error 
>> message:
>> 
>> Applying: HID: quirks: Add device descriptor for 4c4a:4155
>> error: patch failed: drivers/hid/hid-quirks.c:1068
>> error: drivers/hid/hid-quirks.c: patch does not apply
>> Patch failed at 0001 HID: quirks: Add device descriptor for 4c4a:4155
>> 
>> To which kernel version should I apply the patch?
> 
> As the deveopment goes from mainline then down to stable series, the
> fix needs to be developed first for mainline. So the patch is targeted
> there.
> 
> But please find attached an updated patch which hopefully should work
> which resolved the context changes on top of 6.12.47.
> 
> But ideally you can provide a Tested-by on zhangheng's mainline patch
> to get things rolling as needed.
> 
> Regards,
> Salvatore

