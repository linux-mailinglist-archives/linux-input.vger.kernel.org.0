Return-Path: <linux-input+bounces-5205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD699407B0
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 07:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FCBF1C2235D
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 05:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5F816132F;
	Tue, 30 Jul 2024 05:38:39 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FC7166300;
	Tue, 30 Jul 2024 05:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722317919; cv=none; b=F3FSNBBI764LBEknONaKUZaHXCTyGBdOnTly4V9aprQr3wB5DL+u5kUa3a23v16EydYfr4q5+P/e+wARJPxgcgtrvxtuXipSgjFyZ1IXho5155D8t6m4f02B358i8+VJI79Zjxr3fZrW71AIw//8SfD+JJttTAdEU94tUeh5FWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722317919; c=relaxed/simple;
	bh=YLLS9x7Pad+8gVyQzdOvWpOAZMSaeduoNMwDbMU64cA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NWWPDGec8EvCwWC6mCpXUxnv2J/7Eeb/Q7K0AidQd8BKPlfvCPKDy8TArIaFdfkuUXqVdus4Vhmx8WUBHwROcatZTfkx+lkbaGxlrOk1mbqK8z1sYdnIYoDqLJe1KcY9mDg0sZqAfEeEUhA9dQKip0udI5xHuzNSGMa0hDXe+1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav311.sakura.ne.jp (fsav311.sakura.ne.jp [153.120.85.142])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 46U5cJGI076620;
	Tue, 30 Jul 2024 14:38:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav311.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp);
 Tue, 30 Jul 2024 14:38:19 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav311.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 46U5cJ4C076616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 14:38:19 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <3ace9a7f-159f-4c61-807a-c0d9be996986@I-love.SAKURA.ne.jp>
Date: Tue, 30 Jul 2024 14:38:19 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
 <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh> <Zqe76gATYUcDVLaG@google.com>
 <CAHk-=wgweFg4hOus9rhDEa437kpkdV88cvmOHeZWwhgSa5ia1g@mail.gmail.com>
 <ZqfYfIp3n7Qfo1-Q@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <ZqfYfIp3n7Qfo1-Q@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/07/30 2:59, Dmitry Torokhov wrote:
> Please do not. Or you will have to patch it again when we will still see
> the same allocation failures because someone requested an input device
> with "too many" slots (1024 results in 4Mb mt->red table for example).
> 
> Just fix malloc/syzkaller not to trigger on benign memory allocation
> hickups. They are normal.

I chose 1024 because as far as I know 4MB is max acceptable size for
all environments without triggering too large allocation warning.

You worry about mt->red, but did you notice that syzbot was reporting that
memory allocation for mt->red has an integer overflow bug, which can cause
out of bounds write or ZERO_SIZE_PTR pointer dereference bug at input_mt_set_matrix() ?

https://lkml.kernel.org/r/6d878e01-6c2f-8766-2578-c95030442369@I-love.SAKURA.ne.jp

Lucky thing is that the uinput interface is for only the "root" user...


