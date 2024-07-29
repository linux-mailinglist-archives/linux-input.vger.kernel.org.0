Return-Path: <linux-input+bounces-5191-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E0693F9E6
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 17:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 370E21C21912
	for <lists+linux-input@lfdr.de>; Mon, 29 Jul 2024 15:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75ED15B11D;
	Mon, 29 Jul 2024 15:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWoa0IvQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A90158D6A;
	Mon, 29 Jul 2024 15:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722268655; cv=none; b=ZdhR2VJg5b+th0jUQlK8+Ut9rkrziEim7h/IviJXTytFdXwIyRDpYnoPQsqMQ9fnxwYa912lXcmCCEvxZ7o6zY8D/peovDlNNTnOA+hSpibbIi/xLM7NjBjnVJ2s4usVgR0QY8/hN7jYcAAZE9g2KwS02DVb5SijLMBdbyTprnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722268655; c=relaxed/simple;
	bh=fWXaTKT3tUIlTXw2tF/cHlY1x1wKCILNMVNS6v6J8c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IhqDwBNOLS9BP8nk17IqqZUbXD8qi+B4SxamaoSDpxv4J0yUVMKR1wLBIIB1VvB9t/1ZrZsZ/5iNvtp/70yrBdK/fzQOmS/X4x/UVccGA3t/LVtEBEbgVTEPGlXlfL2X1WvR+bnglXOWbrplncG4HD3yNEz+PApFphB//qcbljI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWoa0IvQ; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d19c525b5so2127602b3a.2;
        Mon, 29 Jul 2024 08:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722268654; x=1722873454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=le7zTPFO3Im6pzJulPiBn3avhj4IBSMkvCfiE56ZkUY=;
        b=NWoa0IvQSpJEpThsHYeNRiFfb5GFeUyxizuX6+87hGkJsic/x5BKk5Oh1abl3IAA14
         qgSi05xSrYD1CTcDUy0yejOtzJMxpWr0mRyDoUWmXZMwVeKQBOB44gHcT9rOZvIwIO4a
         5SXhtVV44TLjZ0z0BMoEUx1cLkz4YQb9SzXnthFS/yXwm/XtSvBCTNys8oTbOovpbLdd
         tLLHzDOK0C40T6gsvdorzwJZcD8eWhQeTfwVCkgtc/ZPzagirllVq5HEmVXlMzCAT0yf
         b5pX95WHDd1XKG/uu0wBzoirtMJBWjYNrn/qbhMSyX0C/8Lfpo5CDzwUO83ujrcY2HEX
         edCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722268654; x=1722873454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le7zTPFO3Im6pzJulPiBn3avhj4IBSMkvCfiE56ZkUY=;
        b=sxNwnRfPP+PnMuW2wc2C0cmS8aCLHzpsNCs37OLR99sLZ2oq/keHsKECizYAKrodjL
         WlkT4FGPnV9FZ2BTU7PiHw1BTft/b7dIf0jwRHp6tO/PUTKjcnrulPUnFyvq7bGfLgBp
         urmEFS/Z3OzaZPJcyeO1lLlSypv0roqd+yO/tX5TIeyFEQ9y4tHo/i84LJ5SFo7AkKqH
         /OvOvIN4SILJZ8iUf3CjTU0CeKbIclpxRjVXPvwQgzhkWGA198KVRLe7oiau3oxcWbVr
         NU4Ax/mpIKOQU9tdoyVbw0ByQpMc3cAmOwPppNRMoCIYeQ8nUOD61NGf/yb7fCcIaccn
         oIUw==
X-Forwarded-Encrypted: i=1; AJvYcCVcla/tMUZmp4wCkug2P+j7bZ6d1jMZR/G7t3QDypNxVWA6pWJF3Q2527qMFl83YkTH2ITagLysC5As4yCYVOZDa1zGTCvuxiZqGvPREj2DV7r0bBiQAQeIhYKOJy92bGecMGwXdExmgvk=
X-Gm-Message-State: AOJu0Yzk5PR4xiDSzpz07jM/HzTPRFoK/gOjJvakfAAb1spSZMbl5IEr
	vJ01QMHwL9CkWJNSA/5Gos1z8cZdqITBFEoWbprcd2Ip1ZLmi3Zh
X-Google-Smtp-Source: AGHT+IFyX7r2VxCoszFlGQxsLVfjWXCFGVJwPcFMhbiNyC0+SNLVAT0LdNU9yFcHPYOnHlTsqkpWJg==
X-Received: by 2002:a05:6a00:1304:b0:70d:311b:8569 with SMTP id d2e1a72fcca58-70ecedb0a31mr5455663b3a.26.1722268653598;
        Mon, 29 Jul 2024 08:57:33 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:74de:62d6:bed2:4c63])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead89fac7sm6924827b3a.186.2024.07.29.08.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 08:57:33 -0700 (PDT)
Date: Mon, 29 Jul 2024 08:57:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Henrik Rydberg <rydberg@bitmath.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH (resend)] Input: MT - limit max slots
Message-ID: <Zqe76gATYUcDVLaG@google.com>
References: <a7eb34e0-28cf-4e18-b642-ea8d7959f0c7@I-love.SAKURA.ne.jp>
 <2024072944-appraisal-panning-a0b1@gregkh>
 <f9b4ff23-ee3e-418f-b65d-c40fe28fbba8@I-love.SAKURA.ne.jp>
 <2024072930-badge-trilogy-c041@gregkh>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024072930-badge-trilogy-c041@gregkh>

On Mon, Jul 29, 2024 at 04:28:38PM +0200, Greg Kroah-Hartman wrote:
> On Mon, Jul 29, 2024 at 10:15:26PM +0900, Tetsuo Handa wrote:
> > On 2024/07/29 22:05, Greg Kroah-Hartman wrote:
> > > On Mon, Jul 29, 2024 at 09:51:30PM +0900, Tetsuo Handa wrote:
> > >> syzbot is reporting too large allocation at input_mt_init_slots(), for
> > >> num_slots is supplied from userspace using ioctl(UI_DEV_CREATE).
> > >>
> > >> Since nobody knows possible max slots, this patch chose 1024.
> > >>
> > >> Reported-by: syzbot <syzbot+0122fa359a69694395d5@syzkaller.appspotmail.com>
> > >> Closes: https://syzkaller.appspot.com/bug?extid=0122fa359a69694395d5
> > >> Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > >> Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
> > >> ---
> > >> This patch was tested in linux-next between next-20240611 and next-20240729
> > >> via my tree. Who can take this patch? If nobody can, I will send to Linus.
> > > 
> > > What is wrong with the normal input maintainer and tree?  Why not send
> > > it there?
> > 
> > I don't know why. I couldn't get further response from Dmitry Torokhov.
> > Who can make final decision and what tree is used?
> > 
> > e.g.
> > 2022-11-23  0:28 https://lkml.kernel.org/r/03e8c3f0-bbbf-af37-6f52-67547cbd4cde@I-love.SAKURA.ne.jp
> > 2023-09-03 13:55 https://lkml.kernel.org/r/07350163-de52-a2bf-58bf-88c3d9d8d85b@I-love.SAKURA.ne.jp
> > 2024-05-27 10:35 https://lkml.kernel.org/r/7b7f9cf5-a1de-4e5a-8d30-bb2979309f02@I-love.SAKURA.ne.jp
> > 
> 
> Again, it's up to the Input maintainer.

Sorry, I meant to respond to this and it got lost in my mailbox. To be
honest I really dislike all this extra patching for the sake of
syzkaller. Syzkaller is a tool and ideally we should not modify random
places in the kernel just because it decided to [ab]use one mechanism
that is also used for other purposes.

Now, to the issue at hand. I believe there are 2 classes of warnings: a
true warning that is emitted for clearly unexpected situation that was
caused by a bug or an invariant violation somewhere. Those we definitely
want syzkaller to report so that we could identify the root cause and
fix it.

iThe other types of warnings, such as the warning in the memory
allocation case, are warnings of convenience. We have them so that we do
not need to annotate all memory allocation checks with custom messages.
Instead we just rely on k*alloc() and friends to give us a spew when
they can't allocate memory. These allocation failures are expected and
typically are handled (and if they are not handled we'll get an oops a
moment later). We really do not need syzkaller to trip on those.

Can we change k*alloc() to stop triggering panic on warning when we run
with syzkaller?

Thanks.

-- 
Dmitry

