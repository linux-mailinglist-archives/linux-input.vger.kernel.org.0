Return-Path: <linux-input+bounces-3706-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D628C52FB
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 13:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D2D851C21079
	for <lists+linux-input@lfdr.de>; Tue, 14 May 2024 11:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEA2E12AAE9;
	Tue, 14 May 2024 11:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="IjpGmEL6";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="JS6ll6Zs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b="N2yv6I2v"
X-Original-To: linux-input@vger.kernel.org
Received: from e242-11.smtp-out.us-west-1.amazonses.com (e242-11.smtp-out.us-west-1.amazonses.com [23.251.242.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8E784D26
	for <linux-input@vger.kernel.org>; Tue, 14 May 2024 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715686253; cv=none; b=oirrlZXh0vU8/w3XxeQS7IDOzvM0ZnDl6/F2uV9S6GNH+TxKf5Eew++nOGTk7FDPHiauzljrNsE30OFN7HUrQU4bT7WPgC9mXFrv4AANfw8+K48m9vbsu8CY8Wqls5T40jySKsvTECGelrfoYWC3new8Skhkb4DEk7Iz6sgsto8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715686253; c=relaxed/simple;
	bh=Mp1H5GK5t1PoH7UNIE4NnuvhylOlmlEEe/KCn6j6gTo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=m2A4N4enrOi8YDw+7eXbwMmN6SEDTZ/vtGLHDfLzl/2odWJiDpmy6+f3QUqJ2lGtgxt2jIlfl3vh9uP+nP9WNq7vdo3qQ/FfXipUk9YthYz1GvwBmJE9K/xA9DemSGUqa1bv9Ztaut6don4gLkXUEo6fBQx3vagf4ZZws2exdxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net; spf=pass smtp.mailfrom=us-west-1.amazonses.com; dkim=pass (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=IjpGmEL6; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=JS6ll6Zs; dkim=fail (2048-bit key) header.d=arazil.net header.i=@arazil.net header.b=N2yv6I2v reason="signature verification failed"; arc=none smtp.client-ip=23.251.242.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arazil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=us-west-1.amazonses.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=qo5nb3djytn6yyi2uek5wqamxnq536po; d=arazil.net; t=1715686251;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Mp1H5GK5t1PoH7UNIE4NnuvhylOlmlEEe/KCn6j6gTo=;
	b=IjpGmEL6Ieien7//jxrFeg07onu57r9n8TiL2k88xQjOrxAv2peH8Nc7NhVlN50k
	OyxQ1Gy89RUXSUwmHXzKtO0m+fSf99PZJnq2IwhBRmHeIkOewDgB1n+P8m0movvpcxH
	qb8DT9Ghgx7zvwIcFKx67ZYj3JBxYjTisYJWTWlHWLcb2c8dFQBXRHctWfmDCQoSh7u
	x5wwR10MyrOrM1iTRJR23rVXztwhyqE9I195YerJTQdgU2Z5HKKqB0QUzq7FQwQsruA
	o7P1dqD5HUhKRkVgsKQF0M/OmZMrBFFulrtUtQm0tbRoh5+SqIHVC+Cxajky7CH9Kbk
	SUsjhWbCUQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iek43urnex4zqv5t3opageoatkmhcael; d=amazonses.com; t=1715686251;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=Mp1H5GK5t1PoH7UNIE4NnuvhylOlmlEEe/KCn6j6gTo=;
	b=JS6ll6Zsc/yUTZ9ngRvedusWUGgP4AAgb33KJEp9dwQAwXuhlLFVftAEIdL9MgHF
	YgH1wzYuCQOBnnd496Txbou8MxYbxQdV0ZTDacGohYzclKvSad+q72RRayuRWL2rpti
	jmPEi/hiWunwf9qHm6yjbNOm35lI5d9jdykgfGwc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arazil.net; s=dkim;
	t=1715686249; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qkoAxb1UnbfxEHtCfFTr1C7zEetYrxhif0SfM1ZV9Kc=;
	b=N2yv6I2vCZt1g/4uYmTMWHKutevW6NZOIyOvYQ5M71K96lSHpXITBkrV3SX9kV13X+VjEq
	wRgo0uZIuhKL0g3Icv/B41z/pIcsgl5FhzZfB3CIoFNygWqjX7OrxdUPgubLUEdBtMy+am
	CvZsr1smMty2VudCcRTxSWvUnk7+/ZO0zzSCAP8xF8fanLWi4HYlT99h+/x1MN/mzOkynA
	dbQo3Tn60Ycn+p/E0OBSeMGy7GT7QR+rW12wKd2hOG2ItqstdXOZDqAHob8zoeHF0J31MX
	mNZm46bs/f7jMSZjCLbCtrnEd3zatEKb6C+v75ecdFS4X8fyIs39NXBIsIaOLQ==
Message-ID: <0111018f76de9aab-52df4770-44d1-4a1a-9e81-d1c955ee9107-000000@us-west-1.amazonses.com>
Date: Tue, 14 May 2024 11:30:51 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BUG: Framework Laptop 16 i2c-hid Based Touchpad Sometimes Fails
 To Initialize Properly On Early Boot
From: Arazil Songweaver <arazil@arazil.net>
To: linux-input@vger.kernel.org
References: <e7d0def9-a785-420d-81bf-2502ec89e961@arazil.net>
Content-Language: en-US
In-Reply-To: <e7d0def9-a785-420d-81bf-2502ec89e961@arazil.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
Feedback-ID: 1.us-west-1.+ToUlskFmoAr0tQOMQW4CAabIYpBdjD9BBfO15fkT3E=:AmazonSES
X-SES-Outgoing: 2024.05.14-23.251.242.11

This issue is also now available on Kernel Bugzilla under: 
https://bugzilla.kernel.org/show_bug.cgi?id=218836

-Arazil

On 5/13/24 9:57 PM, Arazil Songweaver wrote:
> We are experiencing an issue where the touch pad on the Framework 
> Laptop 16 fails to initialize properly when the "i2c-hid" is loaded 
> early in the boot process. This issue is especially prominent when 
> "i2c-hid" is built directly into the kernel. When the "i2c-hid" module 
> is built in, the issue occurs roughly 50% of the time. 
> (https://community.frame.work/t/touchpad-not-working-since-update-archlinux/50304) 
> Moving the module load to later in the boot process appears to resolve 
> this issue by making initialization more likely to succeed. 
> (https://gitlab.archlinux.org/archlinux/mkinitcpio/mkinitcpio/-/releases/v39.1) 
>

