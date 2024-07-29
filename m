Return-Path: <linux-input+bounces-5188-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE4893F685
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 15:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10BBA282DC7
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 13:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A0E14659F;
	Mon, 29 Jul 2024 13:15:41 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1933C24;
	Mon, 29 Jul 2024 13:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722258941; cv=none; b=mlY+PUID4W7gybZnJXGe+gC8Lj88cTE/1WSWoITAax/FJdAC5sLWUQ4UMfMU42TTwkDIw42mUI0v5NPQfqZ+MiggDViclu2cHXr7wW63IZpCKl6logVLqfobSIF9/JGDa8LDIDWYDBrJtEJfxkEtzySHeXmhIV8Y/qhhqBb3JLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722258941; c=relaxed/simple;
	bh=h8xRu8LsNWNa8EWzLy5DooHRaMgYnciqNZEMwnIPldw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vaqf/yTQcKPMQiH2SVvM7525actKu4xllzqDRIVzJdH1cvdK5mRLqCZEUKFnTVGeATwyshO8GffGAuzKeFU0Zb2GH0J/WM2rvT5aGuFTmWMtjLpaRgApwBBiXXmxaKzIUx6lzg9vO/gU08/5GP2YGdgISyCLARSTKsqMZ61nknM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav111.sakura.ne.jp (fsav111.sakura.ne.jp [27.133.134.238])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 46TDFQnY043626;
	Mon, 29 Jul 2024 22:15:26 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav111.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp);
 Mon, 29 Jul 2024 22:15:26 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 46TDFQXw043622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 29 Jul 2024 22:15:26 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
Date: Mon, 29 Jul 2024 22:15:26 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <2024072944-appraisal-panning-a0b1@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/07/29 22:05, Greg Kroah-Hartman wrote:
> On Mon, Jul 29, 2024 at 09:51:30PM +0900, Tetsuo Handa wrote:
>> syzbot is reporting too large allocation at input_mt_init_slots(), for
>> num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
>>
>> Since nobody knows possible max slots, this patch chose 1024.
>>
>> Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
>> Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
>> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
>> ---
>> This patch was tested in linux-next between next-20240611 and next-20240729
>> via my tree. Who can take this patch? If nobody can, I will send to Linus.
> 
> What is wrong with the normal input maintainer and tree?  Why not send
> it there?

I don't know why. I couldn't get further response from Dmitry Torokhov.
Who can make final decision and what tree is used?

e.g.
2022-11-23  0:28 https://lkml.kernel.org/r/03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp
2023-09-03 13:55 https://lkml.kernel.org/r/07350163-de52-a2bf-58bf-88c3d9d8d85b@I-love.SAKURA.ne.jp
2024-05-27 10:35 https://lkml.kernel.org/r/7b7f9cf5-a1de-4e5a-8d30-bb2979309f02@I-love.SAKURA.ne.jp


