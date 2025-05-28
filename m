Return-Path: <linux-input+bounces-12615-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA5AC6381
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 09:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 740164E05AF
	for <lists+linux-input@lfdr.de>; Wed, 28 May 2025 07:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4401424635E;
	Wed, 28 May 2025 07:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="MZY20TUS"
X-Original-To: linux-input@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5A1DE4F1;
	Wed, 28 May 2025 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419124; cv=none; b=eAGNdVBBJ99ZfY//uBd7bklEHNmhRxq0pvkpua1MHRmSwXHGix/ukOdQ5FiLhtykyiCqMzg81syxwHddyFVcwTPAMuHyr65TQjzJzFOxKj2u16j3vffH3OerBr1ok6w+RgmvHM6RB1KSWUTTtLsugykkOwE6H6m/x7288eG8x9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419124; c=relaxed/simple;
	bh=GwAIH0J4QxodC4TBbWXZN0g8BBoWbus+4IO1ifLIQZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=XEuXVlqt30kJX25hTbl4CGrKlgJfOeG3l9KTiILgvwf7/vOBwh0yoh2wtEvQpBR91g3TnXgSIgu5TuK/MjBEsoxvA3C3Q/68h71kjFxLRPKkfm+7GrXuidy2LDX9oTCU9dhlV1spjvSBiz5XKd9uo+vsNIc1kPyeD7xe6idfDX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=MZY20TUS; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S5K2Zc023650;
	Wed, 28 May 2025 09:58:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zs/m0sTwjcc/cPY4fbpGq8K8yrAOAzwWnhRtkFcb4oA=; b=MZY20TUSWorsKXkH
	iZj2sXs6x5m2C5ADe4PIn1Ww24WqZxmm5Y0Nq3c+oiIck/cUZFB0vYxUbNYoWoPJ
	yA0aQQ9f/469vaJMc2ScDZV4sNyfRF9faM8D9bqX5d6dVQLeVroAq3nNfLdIl3yz
	QdFNDPs99aNgY95rsUYhltqttb88A147ZFAEoGPMCW0vz9XHg0G9bvZu+GZDxyLQ
	xHugAG5+4JAtbTW3JrfktXlgc3LbzcscjNU+ZGj2wxwoAixkC3CyhYy2RtFApu3V
	EbtGzyxVyKVqvD1LdjJmI0OLhiw4ul+xFt9cMWl6GZ4ocrrVToGUoGG7236MNtbT
	3X3rTQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46u3hk84u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 09:58:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 1A40240046;
	Wed, 28 May 2025 09:57:03 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9B9E5B27A38;
	Wed, 28 May 2025 09:55:46 +0200 (CEST)
Received: from [10.48.87.141] (10.48.87.141) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 09:55:46 +0200
Message-ID: <bd6c5a45-f6ee-4cdc-99fe-6af22e30015b@foss.st.com>
Date: Wed, 28 May 2025 09:55:38 +0200
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
 <661af124-3072-4dcf-b613-ec3e48549626@foss.st.com>
 <20250527144159.Dcstk83c@linutronix.de>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20250527144159.Dcstk83c@linutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01

Hello Sebastian,

On 5/27/25 16:41, Sebastian Andrzej Siewior wrote:
> On 2025-05-27 15:36:37 [+0200], Gatien CHEVALLIER wrote:
>> Hello Sebastian,
> Hello Gatien,
> 
>> Can you elaborate on "This flag change makes not difference on
>> !PREEMPT_RT" please? IIUC,this makes the callback not run in hard IRQ
>> context, even in !PREEMPT_RT, no?
> 
> If you set
> - HRTIMER_MODE_REL_HARD
>    then the callback runs in
>    - hardirq context on !PREEMPT_RT
>    - hardirq context on PREEMPT_RT.
> 
> - HRTIMER_MODE_REL
>    then the callback runs in
>    - hardirq context on !PREEMPT_RT
>    - preemptible softirq on PREEMPT_RT.
> 
> - HRTIMER_MODE_REL_SOFT
>    then the callback runs in
>    - softirq context on !PREEMPT_RT
>    - preemptible softirq on PREEMPT_RT.
> 
> Therefore if you switch HRTIMER_MODE_REL_HARD -> HRTIMER_MODE_REL then
> it is a nop on !PREEMPT_RT.
> 

Thank you for the details.

>> Regarding the need of the spin_lock: gpio_keys_irq_timer() and
>> gpio_keys_irq_isr() appear to access the same resources. Can't we
>> have a concurrent access on it from:
>> HR timer interrupt // GPIO interrupt?
> 
> Yes, it could.
> 
>> But looking back at the patch, this situation does not depend on
>> the HRTIMER_MODE_REL_HARD flag. So maybe it should be addressed
>> separately.
> 
> Yes, please.
> 

Ok, I will do that in V2

>> On the other hand, I should use the new
>> guard(spinlock_irqsave)(&bdata->lock);
> 
> Yes, please. The other instance already does so.
> 
> Sebastian

Ok

Best regards,
Gatien

