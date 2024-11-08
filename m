Return-Path: <linux-input+bounces-7971-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A15319C17A3
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 09:18:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 523491F23EF0
	for <lists+linux-input@lfdr.de>; Fri,  8 Nov 2024 08:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E9C11DC184;
	Fri,  8 Nov 2024 08:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="tg6SVgTl"
X-Original-To: linux-input@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B171DF271;
	Fri,  8 Nov 2024 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731053856; cv=none; b=DmvgpABzZwL6VwCOMYx2K0zmeKsUiBtS7cxZUtmgY1o+/hWP9j1W6ejJfiCeASKKnVUBrx9b6RWnx6gQFyaPdP0yzjPUvr0sg96jXxTER7MlzHFG0JVWho1rkTWuDCxnCd4dk+jscQUg5yibjdbtSTo0yEofKdTYR/eOrcTr3Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731053856; c=relaxed/simple;
	bh=k7rp7Sn2oZXoMSx7ATZhxKVX+kcwRgo6utwNRF/ps7g=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hMNJbO7Cu/D5T8zbzltHp76qSAFdhBpCAnrFctwDHQF2fXsiycyj3BJQFVgAwj2eRh1imS2e2rWt6ytVErkStSZ2LjNqdskZf7Sgmj+rU7OX5+vCqm4hBSKuhPQePSUv7z2wZStaHD5vG2Nv0FpieMCg3Lti08aFIoZZf8bytio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=tg6SVgTl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=QM7a8cxNyGbOO7tE6cCOCOnSvxuRSLu/JiAuMhBFQvk=;
	t=1731053854; x=1731485854; b=tg6SVgTlKSbWRVLxpBA8wqzO2RLMnV5IVQhYUaTryYOae84
	qHPgko2wi41SOEma3sXrvS5vrJjmHiOtaEQDt7Fcj6Ux3sw8DlX+K8uuZViCHrJ/5KZEBNsg2/MVf
	YUnEkxMgsrRDVtaHEhH2JZ1xre2HzNPi6m+HYqppAuLJN2Sh2xy7Oc01b4cBChZzLe9t0h9lGkIiN
	nqdC71ps4zknIc/oyfPBL+SbFJEvClmgMnPfYZ1ZL3Tf7xkLoRnA09L6R542qlq91z0XRhEmivpsY
	c+fX53D2N3xK/jgLqOKhyneI6rkgJnfPkmNACAfcgbV52cpxZJrGhAe1/NZ9NnqA==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t9KBP-0004Zk-Ef; Fri, 08 Nov 2024 09:17:31 +0100
Message-ID: <5373bbfb-5242-4a95-9075-412547a73675@leemhuis.info>
Date: Fri, 8 Nov 2024 09:17:30 +0100
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] Bug 219440: Touchscreen stops working after
 Suspendi: i2c_designware.1: controller timed out
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Kenny Levinsen <kl@kl.wtf>
Cc: Michael <auslands-kv@gmx.de>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jkosina@suse.com>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <d5acb485-7377-4139-826d-4df04d21b5ed@leemhuis.info>
Content-Language: en-MW
In-Reply-To: <d5acb485-7377-4139-826d-4df04d21b5ed@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1731053854;8e260e88;
X-HE-SMSGID: 1t9KBP-0004Zk-Ef

On 05.11.24 17:06, Linux regression tracking (Thorsten Leemhuis) wrote:
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> Jarkko, I noticed a report about a regression in bugzilla.kernel.org
> that appears to be related to i2c_designware [...]

After a bisection it turns out the regression is caused by a HID change
from Kenny, thus dropping Jarkko from the list of recipients and adding
Kenny and a few other appropriate folks and lists.

The culprit appears to be 7d6f065de37c31 ("HID: i2c-hid: Use address
probe to wake on resume") [v6.10-rc1].

For the rest, see the quote below or the linked ticket:

> To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=219440 :
> 
>>  Michael 2024-10-29 08:43:55 UTC
>>
>> Just noticed that the touchscreen on my ASUS vivobook S14 stops
>> working after a suspend-to-idle. As this is something, I clearly
>> didn't have before, I tested every kernel version released in the
>> last six months and found the kernel, where the bug was introduced:
>> 6.10. The last 6.9.12 is still working correctly. Since 6.10 all
>> kernel versions have the problem.
>>
>> Some more info:
>>
>> Hardware: ASUS Vivobook S14 (TP3402VA) Kernel working: up to 6.9.12 
>> Kernel defect: from 6.10 OS: nixos
>>
>> I do not have much knowledge about the input devices. I tested that
>> i2c_hid_acpi seems to be relevant for the touchscreen (and also the
>> touchpad), as, when I remove it, both stop working. Reloading the
>> kernel module restores functionality (but NOT after a suspend-to-
>> idle!!!). Otherwise, I do not see any error messages or so. (Or do
>> not recognize them...)
>>
>> Any help I can offer to identify the regression bug?
> 
> [...]
> 
>> 6.12-rc4 does not work either. The regression started with 6.10.
> 
> [...]
> 
>> i2c_designware i2c_designware.1: controller timed out
>> i2c_designware i2c_designware.1: timeout in disabling adapter
>> i2c_hid_acpi i2c-WDHT1F01:00: failed to change power setting.
>> i2c_hid_acpi i2c-WDHT1F01:00: PM: dpm_run_callback(): acpi_subsys_resume returns -110
>> i2c_hid_acpi i2c-WDHT1F01:00: PM: failed to resume async: error -110
> [...]
> 
> See the ticket for more details. The reporter (Michael) is CCed.

Ciao, Thorsten

