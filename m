Return-Path: <linux-input+bounces-5330-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E620947658
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 09:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B26E281364
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2024 07:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0E4A148312;
	Mon,  5 Aug 2024 07:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="PXfTzEXU"
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B63149C60;
	Mon,  5 Aug 2024 07:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722844335; cv=none; b=XH9cngjuUUnN8uRizoj+91vpn/7pmSpn0eF89OrhSpKgkOjis2Lb5OhlkxuGCZ7YN4zpFq84hVCDTzWkWSDZ8oVMzCi8Gt2boE3/3cPu7fKKcVDokdQr03TH7HqQ1stGAlh82GS9ms265t/Pqmf5vLEumis4rGZ6a9UpZfSvrp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722844335; c=relaxed/simple;
	bh=3aW4nH3vgZoUQRm15WC8tjx3YwoliExaUBNNXskj8Ew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PDDOoAwaEJji0IIrIlICYHPrYg6QJ60ZSNnxLC3s8go9rRPaeT1n6aqYmof9PeZ3Gzfk8bofLrjXTNDM7UemMpHS1eff5+JHd0IlLgfj7RSWAZbkH56Wr3JAYeAWOmPFYBtyErrLmYaqLJhJ91khNkjgkRy3oCJ3h7s1Xk+6Ev0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=PXfTzEXU; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1722844304;
	bh=dX/LpPoHut8lETBwmF/IEv0TvOdoORDmfrs936mQZ+Q=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=PXfTzEXUlvaaubI0B6c+I7CsCssmJNKB5JGvsy9dOESFxEKqHxWazJUYMjE1Ig4Py
	 jx5z0O+/qhz2MmAzr1iCxuvF3R6jr8MqoUgRQbS063Z2ZY4tiru226lo3cK/X7GQdf
	 3ZVedaQQLYbZhOnCsdjJ+h/nBI/Z6kCG16RvnZ9o=
X-QQ-mid: bizesmtpsz8t1722844302tm82f4s
X-QQ-Originating-IP: 4ukN1MC4aqboCviRCrmkyr4OHY5tnDpuhOgKA2gu7vQ=
Received: from john-PC ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 05 Aug 2024 15:51:40 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 5759599161836929121
Date: Mon, 5 Aug 2024 15:51:36 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hdegoede@redhat.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - fix LED state at suspend/resume
Message-ID: <64DEA81E07C8F88E+20240805155136.6212f08d@john-PC>
In-Reply-To: <ZqQbr8aZnaYi20Dp@google.com>
References: <20240726102730.24836-1-maqianga@uniontech.com>
	<ZqQbr8aZnaYi20Dp@google.com>
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

On Fri, 26 Jul 2024 14:57:03 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Fri, Jul 26, 2024 at 02:57:03PM -0700, Dmitry Torokhov wrote:
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
> Ah, OK, I see it now. We do not actually toggle input_dev->led when
> suspending, so atkbd uses wrong data to determine the LED state.
> 

Yes, that's true.

> > 
> > The input core is supposed to turn off all LEDs on suspend. This
> > happens in input_dev_toggle() which is called from
> > input_dev_suspend(). It iterates over all LEDs on a device and
> > turns off active ones one by one.
> > 
> > I think what happens here is we are running afoul of the throttling
> > done in atkbd (see atkbd_schedule_event_work), and it does not
> > actually turn off all LEDs in time. But on the other hand
> > atkbd_cleanup() (which is called to suspend the keyboard) calls
> > 
> >     ps2_command(&atkbd->ps2dev, NULL, ATKBD_CMD_RESET_DEF);
> > 
> > which should turn off everything anyways.
> 
> But still, why ATKBD_CMD_RESET_DEF does not shut off the LEDs for you?
> 
Looking at a ps/2 keyboard
document(http://www-ug.eecg.toronto.edu/msl/nios_devices/datasheets/PS2%20Keyboard%20Protocol.htm),
the F6 command does not seem to affect the state of the LED.

> Thanks.
> 
> -- 
> Dmitry

--
Qiang

