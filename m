Return-Path: <linux-input+bounces-16915-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A76D0C592
	for <lists+linux-input@lfdr.de>; Fri, 09 Jan 2026 22:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13535304718C
	for <lists+linux-input@lfdr.de>; Fri,  9 Jan 2026 21:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383B833D6EC;
	Fri,  9 Jan 2026 21:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SYXUhEP6"
X-Original-To: linux-input@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EEA33DECB
	for <linux-input@vger.kernel.org>; Fri,  9 Jan 2026 21:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767994794; cv=none; b=kK2p2DU1dgBp4Qxkjp7B+dLIo9b3R5gEHsRWa/XIHl10DwEfYBVzwVR+ZPUw1IEUzQ/WpvexESnEZyK4Vg3I3EhyA/TH8DZq2i9/tRdJjKsY4Gxjn2XoH5u459dlhKCQ8i+GZK5FzWzvtkdFsRcWvn5q8xNm43filedvw+GV3Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767994794; c=relaxed/simple;
	bh=2TONpOtiAdOpe+8CZmPigeyTFItzuphg78IHpEPQQHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZE0aj4WQU8semnjXAvsEHbTaIE/U2N/IMlekG7a9KGsEo6djkFzR1O2gEZkpOEIA0bHu/gScW+0xrYv/6Xqj6fXYumyIaCKjrKEGH5DQ4HIrOh5TqQsDGILos7lCDP/0OeejuTWxynb356Bjk1roOUjkKE8gT1Ca3XnA2B4GO0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SYXUhEP6; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <0c4d84ab-1725-45bc-9c1c-8bdc1f5fc032@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767994787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c8tMXOnuAtuUkCGUZeluaJcBlvfdJrx3OeoezqVhGzw=;
	b=SYXUhEP6bgYIYohlnrcLcTeFyL0VUkmM0y7cNjZ++hgvEHwXrEkf0CSCd9HSpCWa6edufR
	HsQbysZJ5Wjg8UKxZmpxuBnY3j7x1QWctU2oBEIrLSCNaPoKkQXrQKaXZb7kMZcLQGbjLc
	RmMAWKT9Jxcw+4/aIfQCJ4oaUmHaOvk=
Date: Fri, 9 Jan 2026 13:39:40 -0800
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v1 08/10] bpf: Add bpf_task_work_schedule_*
 kfuncs with KF_IMPLICIT_ARGS
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Mykyta Yatsenko <yatsenko@meta.com>,
 Tejun Heo <tj@kernel.org>, Alan Maguire <alan.maguire@oracle.com>,
 Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 bpf <bpf@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 sched-ext@lists.linux.dev
References: <20260109184852.1089786-1-ihor.solodrai@linux.dev>
 <20260109184852.1089786-9-ihor.solodrai@linux.dev>
 <CAADnVQJDv80_T+1jz=7_8y+8hRTjMqqkm38in2er8iRU-p9W+g@mail.gmail.com>
 <b099a95e-5e69-4eeb-a2c9-9a52b8042a85@linux.dev>
 <CAADnVQ+_AmiwuupkVJTGyKY3KOp68GLuivs2LMEr0M_yaHPUUg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <CAADnVQ+_AmiwuupkVJTGyKY3KOp68GLuivs2LMEr0M_yaHPUUg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 1/9/26 12:47 PM, Alexei Starovoitov wrote:
> On Fri, Jan 9, 2026 at 12:02 PM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>
>> On 1/9/26 11:58 AM, Alexei Starovoitov wrote:
>>> On Fri, Jan 9, 2026 at 10:50 AM Ihor Solodrai <ihor.solodrai@linux.dev> wrote:
>>>>
>>>> +__bpf_kfunc int bpf_task_work_schedule_signal(struct task_struct *task, struct bpf_task_work *tw,
>>>> +                                             void *map__map, bpf_task_work_callback_t callback,
>>>> +                                             struct bpf_prog_aux *aux)
>>>> +{
>>>> +       return bpf_task_work_schedule(task, tw, map__map, callback, aux, TWA_SIGNAL);
>>>> +}
>>>> +
>>>>  __bpf_kfunc int bpf_task_work_schedule_signal_impl(struct task_struct *task,
>>>>                                                    struct bpf_task_work *tw, void *map__map,
>>>>                                                    bpf_task_work_callback_t callback,
>>>>                                                    void *aux__prog)
>>>>  {
>>>> -       return bpf_task_work_schedule(task, tw, map__map, callback, aux__prog, TWA_SIGNAL);
>>>> +       return bpf_task_work_schedule_signal(task, tw, map__map, callback, aux__prog);
>>>>  }
>>>
>>> I thought we decided that _impl() will not be marked as __bpf_kfunc
>>> and will not be in BTF_ID(func, _impl).
>>> We can mark it as __weak noinline and it will be in kallsyms.
>>> That's all we need for the verifier and resolve_btfid, no?
>>>
>>> Sorry, it's been a long time. I must have forgotten something.
>>
>> For the *generated* _impl kfuncs there is no decl tags and the ids are
>> absent from BTF_ID sets, yes.
>>
>> However for the "legacy" cases it must be there for backwards
>> compatibility, as well as relevant verifier checks.
> 
> I see.
> I feel bpf_task_work_schedule_resume() is ok to break, since it's so new.
> We can remove bpf_task_work_schedule_[resume|singal]_impl()
> to avoid carrying forward forever.
> 
> bpf_stream_vprintk_impl() is not that clear. I would remove it too.

That leaves only bpf_wq_set_callback_impl(). Can we break that too?

Then there won't be legacy cases at all. It was introduced in v6.16
along the with __prog suffix [1][2].

If we go this route, we could clean up __prog support/docs too.

I think it's worth it to make an "all or nothing" decision here:
either break all 4 existing kfuncs, or backwards-support all of them.

git tag --contains bc049387b41f | grep -v rc
v6.16
v6.17
v6.18

[1] https://lore.kernel.org/all/20250513142812.1021591-1-memxor@gmail.com/
[2] https://lore.kernel.org/all/20240420-bpf_wq-v2-13-6c986a5a741f@kernel.org/



