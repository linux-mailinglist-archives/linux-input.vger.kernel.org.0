Return-Path: <linux-input+bounces-5203-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23292940481
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 04:19:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 542AA1C21047
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 02:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F113022338;
	Tue, 30 Jul 2024 02:17:53 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8ECA6B;
	Tue, 30 Jul 2024 02:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.184.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722305873; cv=none; b=sPmZEyN/JMv60AvqeNYzhFIVk4NBDDadwVg4lb43as1JQyZi9jdDAVVB9LxMaSUhbTDudOYALHtBZBxgS1piHKPpHA3qs4txsx3ehfvtBfk1E7YF6YaSkJeyILnW2PTR23Rno990tsCBgP6yCdDvLBL/VjYBVjMH8PYs8FTHHPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722305873; c=relaxed/simple;
	bh=PPx3K80hwYGnsiv+UwdqJROvcRODED1kY6ZAkSKw/4M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mMwFRjpH8FDqd8TaGuY5rJOaLmxs6ErORIKkLFCivtLOW6gTgtG8HhEVIfWY0PqckwjAUjmd9Evep29pwdYBfTIJPekSfGXMMXd6kHrciY05Yb7o1heMCIlJdBTfy04JnPZ2pEhaucZAEKLIvjB1Bpp2FTe2fDH1QbXt67wXFJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; arc=none smtp.client-ip=15.184.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
X-QQ-mid: bizesmtpsz9t1722305831t3r3u4m
X-QQ-Originating-IP: mdLFhWG1g68DcX0Zn3U3N9CZOB9bMfzHPt5N90IJ+8A=
Received: from john-PC ( [123.114.60.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 Jul 2024 10:17:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12566941789932203827
Date: Tue, 30 Jul 2024 10:17:08 +0800
From: Qiang Ma <maqianga@uniontech.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: hdegoede@redhat.com, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: atkbd - fix LED state at suspend/resume
Message-ID: <F045C67DC1521849+20240730101708.50fa6734@john-PC>
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

Hi Dmitry,

> Hi Qiang,
> 
> On Fri, Jul 26, 2024 at 06:27:30PM +0800, Qiang Ma wrote:
> > After we turn on the keyboard CAPSL LED and let the system suspend,
> > the keyboard LED is not off, and the kernel log is as follows:
> > 
> > [  185.987574] i8042: [44060] ed -> i8042 (kbd-data)
> > [  185.988057] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> > [  185.988067] i8042: [44061] 04 -> i8042 (kbd-data)
> > [  185.988248] i8042: [44061] ** <- i8042 (interrupt, 0, 1)
> > 
> > The log shows that after the command 0xed is sent, the data
> > sent is 0x04 instead of 0x00.
> > 
> > Solution:
> > Add a bitmap variable ledon in the atkbd structure, and then set
> > ledon according to code-value in the event, in the atkbd_set_leds
> > function, first look at the value of lenon, if it is 0, there is no
> > need to look at the value of dev->led, otherwise, Need to look at
> > dev->led to determine the keyboard LED on/off.  
> 
> I am not sure why duplicating input_dev->led which is supposed to
> record which LEDs are currently active on an input device would solve
> the issue. Could you please explain?

At this point, the suspend purpose is to turn off the led(calling
input_dev_toggle(input_dev, false) in function input_dev_suspend()),
but the dev->led gets the status is on, so it will not turn off the led.

> 
> The input core is supposed to turn off all LEDs on suspend. This
> happens in input_dev_toggle() which is called from
> input_dev_suspend(). It iterates over all LEDs on a device and turns
> off active ones one by one.
> 
> I think what happens here is we are running afoul of the throttling
> done in atkbd (see atkbd_schedule_event_work), and it does not
> actually turn off all LEDs in time. But on the other hand
> atkbd_cleanup() (which is called to suspend the keyboard) calls
> 
> 	ps2_command(&atkbd->ps2dev, NULL, ATKBD_CMD_RESET_DEF);
> 
> which should turn off everything anyways.

Send reset command under the actual test did not turn off the led, get
it just reset the i8042 register? Did not change the led corresponding
gpio status?

> 
> I think we need better understand what is going on here. Maybe post
> the entire communication between the kernel and i8042?
> 
> Thanks.
> 

---
Qiang

