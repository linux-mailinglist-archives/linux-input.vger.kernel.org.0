Return-Path: <linux-input+bounces-15945-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D70CC42841
	for <lists+linux-input@lfdr.de>; Sat, 08 Nov 2025 07:28:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E4FE4E2667
	for <lists+linux-input@lfdr.de>; Sat,  8 Nov 2025 06:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263422DC76E;
	Sat,  8 Nov 2025 06:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZKepcjY"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D95C34D38B
	for <linux-input@vger.kernel.org>; Sat,  8 Nov 2025 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762583276; cv=none; b=tRS1foFTh2th4hXrC2JrHNhxUScprDYUmof+zpM78jEhE3IxH74z5vzDB3/rsiyaKEid2VeLQh9ZZZk0blRhQjMZEMgm80TcSG4AKYuf9lFQWulOp3x2ij21dh46IE9K2hcfw+3wtCFVooTBqQ41knpfV1ymdzJiixM4hKDwBXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762583276; c=relaxed/simple;
	bh=jr673S/vviLKQukNOixc31tqvtS/AczogMM32DGArIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r1VoCOCQrv7+QEwIgmgbqv0qEbKv/tsiSS0a4DeGC0iJE4dJivwSWoc2Uh82Xf5gycPJ5hQl0Eob6qRD46HwaVSBZ6CLaR29UTZC5fQWuhvaNL54qRfl7TFaSLny0yjwbHOwbYNRpF7vErlDZaMHtIshU634aFt3+lvaAOcHsyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZKepcjY; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7ade456b6abso1246105b3a.3
        for <linux-input@vger.kernel.org>; Fri, 07 Nov 2025 22:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762583274; x=1763188074; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=muwGka20OQlgVtBzcQxGNcxf2dzVjpN4UKyUNjIPNwc=;
        b=SZKepcjYetbrflksISVaxJJHf1CrnLTtvLIcL4tSmgNg0P3xGw9h7y2da8CuOjrbFS
         MmEtsNZ4Rwc8I2zIYExj5xd9BksVkHQhQC0T89rMwFVeLEd5+VtnKiTVu+oj7jF0C+Qv
         /hJkFL8rBgkA/EW9+mRaIoe9qUggyjhTDprDXMzOYoHVZUF+AxHL/Fnzm/YTtu0YvM3f
         i0CT0VqD/CjPpJ2ZVfMekzFGNIsf6uD8/skISsVAck8/N5tsiJEgCoQQPa9PzH1eveMc
         4GAqyKtMqyqdeO3cITU04dkD3f0blQcmcxXAMmSJjXmEcwsSsJ3GIDb9SxOQcm6XfHYl
         ZQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762583274; x=1763188074;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=muwGka20OQlgVtBzcQxGNcxf2dzVjpN4UKyUNjIPNwc=;
        b=qTnmGTDzx66rE50FVAMWpLt2XEFGM0DyRd4dyGCgaE1W5M2LxH9d0C88quN4sqxZRy
         wh3VIU9LQWG8qBTgkTJHrJay2w71e4sBsvOfHpQmOmbtfhr5+jQnlSkUfJaM/4upzsID
         1KzktS8M+1X86+DhoSO76F3kUcYkboZG1iIA8r+xNSM8pXlnD30QRKBeWvyqR3B7tegk
         sjMobj4OedhwmS47BATgV/A13BpJphsISpjVFHjTQW0pWSAKJjc+6WWLFhWlYRh7qx0F
         +jmVC4+8oSolP9fph8jqYtVtAzFPDDsIZMCCFYpmDGNYP2KHLPrf5GsHjE4/GE5Idkol
         XzKA==
X-Gm-Message-State: AOJu0YzchyY+azHLePwenFjQJnebLcEmhbS81bEibswnD1UMVuVvfiug
	36sb49EwcBaTeaeI36JLc6++mXLiY0S7XI2mpbn71FLNhUOymaZn+HRz
X-Gm-Gg: ASbGnctFGM8lMQaW7oeVvgBsTLqSwXa5Ao41wXnyW8gxKArerUAzGbssovK2VIp0HEs
	WNVaxA9TybcYA65GN62G3yRYZuunKt/40oi1BMxb083xwHB5TKx4JK7QQG5wv5vdXIjKBEzEzWM
	FYUlIqX0oi7JfBbeP5ETiThvqGZm8Te1gvXxBy52eTIqBwQC7tsvQ7XGvrr6TUnMebNIVmkWRGw
	vo0E8bidjcgA+6gY3o/MpsnsfsS1EeZqW74PVTFPWQZYcPpn4ttoOlC7bikCB/B8vlXKreH1Xyn
	o5DNlvnnk/QsKsberymkWAEwHr+PN2PKy/sT0TioIfG/xVzKXXXh1zsdf2+Q9wJddLF+71jd0D1
	USzRjlbT1xRuD8/p0MDQtGMk6lEItTnAUyDHj4uC8JBJa+aAxljrJxQJMrGuR+YmsA5Ug9yI4dr
	brTKLnELDJkQ03ObWa/gVIqBg6wLr4cuLfoWW7B7hS79iwiCCMYvRv
X-Google-Smtp-Source: AGHT+IG9e2zFV0/4/rzvivbRQoaIRBU8Mc3hMcU/wOqZTUa7pTGvjX3/SKOWyYRT02HwuIW5Xkd7Tg==
X-Received: by 2002:a05:6a00:140e:b0:7b2:1fb0:6da0 with SMTP id d2e1a72fcca58-7b2276c0243mr2601417b3a.28.1762583273712;
        Fri, 07 Nov 2025 22:27:53 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:57b9:b373:19a1:a072])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b214155c8esm1532861b3a.38.2025.11.07.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 22:27:53 -0800 (PST)
Date: Fri, 7 Nov 2025 22:27:50 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: duoming@zju.edu.cn
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kuba@kernel.org, alexander.deucher@amd.com, pali@kernel.org, 
	hverkuil+cisco@kernel.org, akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com, 
	tglx@linutronix.de, mingo@kernel.org, Jonathan.Cameron@huawei.com
Subject: Re: [PATCH] Input: psmouse - fix use-after-free bugs due to
 rescheduled delayed works
Message-ID: <fyj4osf7b4ircqyn53kmpnvppr5cmkj7w53tgtgab6gmauprpa@lvlkypjstn4f>
References: <20251108045609.26338-1-duoming@zju.edu.cn>
 <jbkzqczxnnf5el6xxyumeyoact7iw3js6reoand3clrpjyyblf@fhxvbg7fu6n5>
 <15ef9eb6.22570.19a6221252c.Coremail.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15ef9eb6.22570.19a6221252c.Coremail.duoming@zju.edu.cn>

On Sat, Nov 08, 2025 at 02:22:10PM +0800, duoming@zju.edu.cn wrote:
> On Fri, 7 Nov 2025 21:43:37 -0800, Dmitry Torokhov wrote:
> > > The flush_workqueue() in psmouse_disconnect() only blocks and waits for
> > > work items that were already queued to the workqueue prior to its
> > > invocation. Any work items submitted after flush_workqueue() is called
> > > are not included in the set of tasks that the flush operation awaits.
> > > This means that after flush_workqueue() has finished executing, the
> > > resync_work and dev3_register_work could be rescheduled again, resulting
> > > in the following two use-after-free scenarios:
> > > 
> > > 1. The psmouse structure is deallocated in psmouse_disconnect(), while
> > > resync_work remains active and attempts to dereference the already
> > > freed psmouse in psmouse_resync().
> > > 
> > > CPU 0                   | CPU 1
> > > psmouse_disconnect()    | psmouse_receive_byte()
> > >                         |   if(psmouse->state == ...)
> > >   psmouse_set_state()   |
> > >   flush_workqueue()     |
> > >                         |   psmouse_queue_work() //reschedule
> > >   kfree(psmouse); //FREE|
> > >                         | psmouse_resync()
> > >                         |   psmouse = container_of(); //USE
> > >                         |   psmouse-> //USE
> > 
> > Before flushing the workqueue we set psmouse state to PSMOUSE_CMD_MODE,
> > but psmouse_queue_work() is only called from psmouse_receive_byte() if
> > the mouse is PSMOUSE_ACTIVE. Therefore there is no chance that work will
> > be scheduled while psmouse instance is being freed.
> 
> I believe a potential race condition still exists between 
> psmouse_receive_byte() and psmouse_disconnect(). Specifically, 
> if the condition check 'if (psmouse->state == PSMOUSE_ACTIVATED)' 
> has already been passed, and then we set the psmouse state to 
> PSMOUSE_CMD_MODE and flush the workqueue, it is still possible 
> for psmouse_queue_work() to be scheduled after flush_workqueue().

Setting psmouse state can not race with psmouse_receive_byte() because
we take the serio->lock and disable interrupts. 

Thanks.

-- 
Dmitry

