Return-Path: <linux-input+bounces-5138-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D674793AFD2
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 12:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91491283B80
	for <lists+linux-input@lfdr.de>; Wed, 24 Jul 2024 10:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0239914375C;
	Wed, 24 Jul 2024 10:27:00 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8DF17C6A;
	Wed, 24 Jul 2024 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721816819; cv=none; b=UxkPPmXQSYE+s9JggE5YL1Ir+Sn7rPMQrscfq0YjY6LnpYqibbOBD2UiQEp76LHO7iSnH6kqcI1hUiPFvcGrA58jCzRNaMg770EZG7Du4FhHhxsm+3+WgqLg8kf69Ityil5rVw+l6TUZVNiZUztrAZldSR2VfxnBUcQObZ6qTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721816819; c=relaxed/simple;
	bh=khxFS8JzO7a0khzuZCVXyyuvYE+qxwdOFESudcEjzEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cs18u2LE8ALniAIWbBGoHjwX71hy9YN7oXI6x7JjLS78q+LRD74mVdUtVxbbjRhzyD0lt/+Zj/9Op/s6cWoIdLsjV3bsZ07gR1VVoulD7U584ykv79rxNC/yRmiMaLZUNoqNW+IWFgFDqVKpCk/YfsjS3i61k6xWhgeN2/JHcBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 46OAQY6M029443;
	Wed, 24 Jul 2024 19:26:34 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Wed, 24 Jul 2024 19:26:34 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 46OAQY5U029439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 24 Jul 2024 19:26:34 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <192daba9-7c15-4483-8fcd-7f5f1ceca1b4@I-love.SAKURA.ne.jp>
Date: Wed, 24 Jul 2024 19:26:33 +0900
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [input?] [mm?] WARNING in get_taint
To: syzbot <syzbot+a34cc64ce2f703da7c62@syzkaller.appspotmail.com>,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        syzkaller-bugs@googlegroups.com,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <00000000000089c945061dfb23e4@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <00000000000089c945061dfb23e4@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Waiting for Linus to process
https://lkml.kernel.org/r/63149ac0-73a4-49c0-975b-75dc3bd32f7a@I-love.SAKURA.ne.jp .

Hmm, syzbot failed to identify as a dup of

#syz dup: WARNING in input_mt_init_slots

On 2024/07/24 18:45, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    933069701c1b Merge tag '6.11-rc-smb3-server-fixes' of git:..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=16a3dcb1980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e5bbfd9a8c60696e
> dashboard link: https://syzkaller.appspot.com/bug?extid=a34cc64ce2f703da7c62
> compiler:       arm-linux-gnueabi-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=119babfd980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12c02411980000


