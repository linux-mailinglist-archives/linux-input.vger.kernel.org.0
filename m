Return-Path: <linux-input+bounces-12595-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2EAC500B
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 15:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEA581885980
	for <lists+linux-input@lfdr.de>; Tue, 27 May 2025 13:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F732749D9;
	Tue, 27 May 2025 13:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WNpIQmMi"
X-Original-To: linux-input@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F10267AED;
	Tue, 27 May 2025 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748353127; cv=none; b=Bom30fpitAgUCfRfh1av67BoJNXzatcRW8rTOR0y6jAQMK4aC12jVNIz3Q7YcDeR6D6cN9c+0XvI7n7Yki+LrdclnUr/nIooMltJLcx2LcukhZtp6lX7GfpCrNZa/p6C1/k7A1/i26cQCzt0i3Ii6cQTP9TnMH1ypw2es56DvP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748353127; c=relaxed/simple;
	bh=YAK22hh9bF0xUHaZ37cM77JZCPU+tfEdr966jOJvfXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=vFPkcTPmUqAWQ98j+E5JlK5ZuF0E8v5+ufk+L+gWXwNqEYVlIFFW5qdHjznkGkKhkaQpgb+avyH158XqLIR+PcSldacPzY9gZmmh0aXRdP0+M71xEY7dbelU95Qsdd2lsd8ZeRaZ1tX9RtTuNJBXfYqWMKjaUx1UQp0Wiea46/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WNpIQmMi; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBw2xZ002122;
	Tue, 27 May 2025 15:38:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	G8Ua6pTVZVcQk45Vtse+7jeBJIEk6dgYvFzDSEU8xck=; b=WNpIQmMicdz4CkGh
	l4ItB+PvWAGucajYF5iwdkXyXW5x0sCd/uwj6HQvwEdKDFALbMSaop27sGgjcqqX
	Sq2LU4oJt1HFFK1jivnqP3el78O4HKDDCk7QF+VHf3MeImw+qv3cf0qQJiz1i0DA
	7kdqsm37saO1vqXi3UNdJ1yJ737PKsdQCzEfkXvuglxfq+POJkDua5gHZNgHrPkw
	vlmOpEySaJ/eUFsOukTJgJvb4nA4Hs/8cPggy5qTyM2YX8i+VKXos65gX2Mbq+0D
	LUHKWJd/IxGSJQ7Fkfkg2387Q84UB1O8uu3bueGYA3BTmOHbTivK/K8xsrdbtENU
	95iHzw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46w54hjs1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 15:38:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1A4D840053;
	Tue, 27 May 2025 15:37:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9ED31AEF6B9;
	Tue, 27 May 2025 15:36:42 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 May
 2025 15:36:42 +0200
Message-ID: <661af124-3072-4dcf-b613-ec3e48549626@foss.st.com>
Date: Tue, 27 May 2025 15:36:37 +0200
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: gpio-keys - fix a sleep while atomic with
 PREEMPT_RT
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Clark Williams
	<clrkwllms@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Paul Cercueil
	<paul@crapouillou.net>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-rt-devel@lists.linux.dev>,
        Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>
References: <20250526-gpio_keys_preempt_rt-v1-1-09ddadf8e19d@foss.st.com>
 <20250526141321.FcXEgnV4@linutronix.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250526141321.FcXEgnV4@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01

Hello Sebastian,

On 5/26/25 16:13, Sebastian Andrzej Siewior wrote:
> On 2025-05-26 15:56:29 [+0200], Gatien Chevallier wrote:
>> From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>>
>> When enabling PREEMPT_RT, the gpio_keys_irq_timer() callback runs in
>> hard irq context, but the input_event() takes a spin_lock, which isn't
>> allowed there as it is converted to a rt_spin_lock().
>>
>> [ 4054.289999] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>> [ 4054.290028] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/0
>> ...
>> [ 4054.290195]  __might_resched+0x13c/0x1f4
>> [ 4054.290209]  rt_spin_lock+0x54/0x11c
>> [ 4054.290219]  input_event+0x48/0x80
>> [ 4054.290230]  gpio_keys_irq_timer+0x4c/0x78
>> [ 4054.290243]  __hrtimer_run_queues+0x1a4/0x438
>> [ 4054.290257]  hrtimer_interrupt+0xe4/0x240
>> [ 4054.290269]  arch_timer_handler_phys+0x2c/0x44
>> [ 4054.290283]  handle_percpu_devid_irq+0x8c/0x14c
>> [ 4054.290297]  handle_irq_desc+0x40/0x58
>> [ 4054.290307]  generic_handle_domain_irq+0x1c/0x28
>> [ 4054.290316]  gic_handle_irq+0x44/0xcc
>>
>> Considering the gpio_keys_irq_isr() can run in any context, e.g. it can
>> be threaded, it seems there's no point in requesting the timer isr to
>> run in hard irq context.
>>
>> So relax the hrtimer not to use the hard context. This requires the
>> spin_lock to be added back in gpio_keys_irq_timer().
> 
> Why does it? This needs to be explained or it deserves an independent
> patch/ fix. This flag change makes not difference on !PREEMPT_RT and so
> should be the requirements for locking here.
> 

Can you elaborate on "This flag change makes not difference on
!PREEMPT_RT" please? IIUC,this makes the callback not run in hard IRQ
context, even in !PREEMPT_RT, no?

Regarding the need of the spin_lock: gpio_keys_irq_timer() and
gpio_keys_irq_isr() appear to access the same resources. Can't we
have a concurrent access on it from:
HR timer interrupt // GPIO interrupt?

But looking back at the patch, this situation does not depend on
the HRTIMER_MODE_REL_HARD flag. So maybe it should be addressed
separately.

On the other hand, I should use the new
guard(spinlock_irqsave)(&bdata->lock);

>> Fixes: 019002f20cb5 ("Input: gpio-keys - use hrtimer for release timer")
>> Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
>> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> 
> Sebastian

