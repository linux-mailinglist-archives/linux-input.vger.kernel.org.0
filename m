Return-Path: <linux-input+bounces-5279-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3A945902
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 09:37:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E62421C216B5
	for <lists+linux-input@lfdr.de>; Fri,  2 Aug 2024 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B37F215B134;
	Fri,  2 Aug 2024 07:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="FUUr2IUp"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A84482EF;
	Fri,  2 Aug 2024 07:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722584249; cv=none; b=h5YqtOQ6Ns4V0gH1J/qj5P8aaM2eSscBuGgrhtEqBV5eE5hT+nBjWsftpNZqmUmiSGx2u5t338QLIOm8WSpEkF/Bn8ffXbrv2brlK/4BSNYTUf6XjgUe4B4IrZE0zyJH4RrhzbF7Zlh0HsytclQQrd3lybcz/Dzbrpz0ifG8Ckk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722584249; c=relaxed/simple;
	bh=WuEYORx3IyoiSp+v+nyNnIg6eYQ7oAvqa66kuTpzhuU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gvAlOhkavqygZ4blzvbcOxRnB7sDaY++BIW+n/KJOlPIsfGYgXGzuwjWiEaabBZNBqipgIsKzbnZnEZ2hp6rKmhCnpe9lSnVqqpzwG7dJt4rgA3RvecyvFhXoZFlsCPoWq1Lctrshryk2XOCkYMGnm4edtnAbYfLkV7wQRNKvZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=FUUr2IUp; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1722584189;
	bh=r3hNelFkCsMXD8kt/m3OWh+QBBUibrJz4XoFzCwXigM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FUUr2IUpSuB1ExjLhT7TdmtrrSb5nLyMcGNm3LWZ5ni7lVnF4LkISVWxqFotNUXIZ
	 U5GuoKvAChCIemaH7IKMWjkCvp9wtoQA3rTdLjFdtFJPR5H/OWImFph/ZYlsLZtAXQ
	 TmwqeaEjG8JUZud5FNA4txR5GoMf2LR6x16S8g1o=
X-QQ-mid: bizesmtpsz10t1722584187tihcfq
X-QQ-Originating-IP: BDTqJCUnh5xPEZDI/VQyPDJxR62AaYus1bLOS6IUXhA=
Received: from john-PC ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 02 Aug 2024 15:36:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5280773945744906871
Date: Fri, 2 Aug 2024 15:36:24 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hdegoede@redhat.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - fix LED state at suspend/resume
Message-ID: <5CC999395DCE8ABD+20240802153624.02dfe6a4@john-PC>
In-Reply-To: <20240730101708.50fa6734@john-PC>
References: <20240726102730.24836-1-maqianga@uniontech.com>
	<ZqQbr8aZnaYi20Dp@google.com>
	<20240730101708.50fa6734@john-PC>
Organization: UOS
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4a-0

On Tue, 30 Jul 2024 10:17:08 +0800
Qiang Ma <maqianga@uniontech.com> wrote:

> On Fri, 26 Jul 2024 14:57:03 -0700
> Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> 
> Hi Dmitry,
> 
> > Hi Qiang,
> > 
> > On Fri, Jul 26, 2024 at 06:27:30PM +0800, Qiang Ma wrote:  
> > > After we turn on the keyboard CAPSL LED and let the system
> > > suspend, the keyboard LED is not off, and the kernel log is as
> > > follows:
> > > 
> > > [  185.987574] i8042: [44060] ed -> i8042 (kbd-data)
> > > [  185.988057] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> > > [  185.988067] i8042: [44061] 04 -> i8042 (kbd-data)
> > > [  185.988248] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> > > 
> > > The log shows that after the command 0xed is sent, the data
> > > sent is 0x04 instead of 0x00.
> > > 
> > > Solution:
> > > Add a bitmap variable ledon in the atkbd structure, and then set
> > > ledon according to code-value in the event, in the atkbd_set_leds
> > > function, first look at the value of lenon, if it is 0, there is
> > > no need to look at the value of dev->led, otherwise, Need to look
> > > at dev->led to determine the keyboard LED on/off.    
> > 
> > I am not sure why duplicating input_dev->led which is supposed to
> > record which LEDs are currently active on an input device would
> > solve the issue. Could you please explain?  
> 
> At this point, the suspend purpose is to turn off the led(calling
> input_dev_toggle(input_dev, false) in function input_dev_suspend()),
> but the dev->led gets the status is on, so it will not turn off the
> led.
> 
> > 
> > The input core is supposed to turn off all LEDs on suspend. This
> > happens in input_dev_toggle() which is called from
> > input_dev_suspend(). It iterates over all LEDs on a device and turns
> > off active ones one by one.
> > 
> > I think what happens here is we are running afoul of the throttling
> > done in atkbd (see atkbd_schedule_event_work), and it does not
> > actually turn off all LEDs in time. But on the other hand
> > atkbd_cleanup() (which is called to suspend the keyboard) calls
> > 
> > 	ps2_command(&atkbd->ps2dev, NULL, ATKBD_CMD_RESET_DEF);
> > 
> > which should turn off everything anyways.  
> 
> Send reset command under the actual test did not turn off the led, get
> it just reset the i8042 register? Did not change the led corresponding
> gpio status?
> 
> > 
> > I think we need better understand what is going on here. Maybe post
> > the entire communication between the kernel and i8042?
> > 

Description of ps/2 keyboard interface on this
website(http://www-ug.eecg.toronto.edu/msl/nios_devices/datasheets/PS2%20Keyboard%20Protocol.htm):

0xF6 (Set Default) - Load default typematic rate/delay (10.9cps /
500ms), key types (all keys typematic/make/break), and scan code set
(2).

It seems that sending this F6 reset command does not mention what
effect it has on the LED.

> > Thanks.
> >   
> 
> ---
> Qiang


