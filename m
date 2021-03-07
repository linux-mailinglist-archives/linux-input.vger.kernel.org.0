Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD3E3304C8
	for <lists+linux-input@lfdr.de>; Sun,  7 Mar 2021 22:13:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhCGVMC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Sun, 7 Mar 2021 16:12:02 -0500
Received: from aposti.net ([89.234.176.197]:54586 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231397AbhCGVLd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sun, 7 Mar 2021 16:11:33 -0500
Date:   Sun, 07 Mar 2021 21:11:18 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] input: gpio-keys: Use hrtimer for software debounce
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <UUAMPQ.MF37I5G7AY0J2@crapouillou.net>
In-Reply-To: <YEU1irDqZJCdCS0o@google.com>
References: <20210305170111.214782-1-paul@crapouillou.net>
        <20210305170111.214782-3-paul@crapouillou.net> <YEJ57PuEyYknR3MF@google.com>
        <79IIPQ.DQ7JNXZ0OI5Q2@crapouillou.net> <YEU1irDqZJCdCS0o@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Le dim. 7 mars 2021 à 12:20, Dmitry Torokhov 
<dmitry.torokhov@gmail.com> a écrit :
> On Fri, Mar 05, 2021 at 08:00:43PM +0000, Paul Cercueil wrote:
>>  Hi Dmitry,
>> 
>>  Le ven. 5 mars 2021 à 10:35, Dmitry Torokhov 
>> <dmitry.torokhov@gmail.com> a
>>  écrit :
>>  > Hi Paul,
>>  >
>>  > On Fri, Mar 05, 2021 at 05:01:11PM +0000, Paul Cercueil wrote:
>>  > >  -static void gpio_keys_gpio_work_func(struct work_struct *work)
>>  > >  +static enum hrtimer_restart gpio_keys_debounce_timer(struct
>>  > > hrtimer *t)
>>  > >   {
>>  > >  -	struct gpio_button_data *bdata =
>>  > >  -		container_of(work, struct gpio_button_data, work.work);
>>  > >  +	struct gpio_button_data *bdata = container_of(t,
>>  > >  +						      struct gpio_button_data,
>>  > >  +						      debounce_timer);
>>  > >
>>  > >   	gpio_keys_gpio_report_event(bdata);
>>  >
>>  > I am not sure how this works. As far as I know, even
>>  > HRTIMER_MODE_REL_SOFT do not allow sleeping in the timer 
>> handlers, and
>>  > gpio_keys_gpio_report_event() use sleeping variant of GPIOD API 
>> (and
>>  > that is not going to change).
>> 
>>  Quoting <linux/hrtimers.h>, the "timer callback will be executed in 
>> soft irq
>>  context", so sleeping should be possible.
> 
> I am afraid you misunderstand what soft irq context is, as softirqs 
> and
> tasklets still run in interrupt context and therefore can not sleep,
> only code running in process context may sleep.

I probably do. My understanding of "softirq" is that the callback runs 
in a threaded interrupt handler.

> You can test it yourself by sticking "msleep(1)" in
> gpio_keys_debounce_timer() and see if you will get "scheduling while
> atomic" in logs.

I tested it, it locks up.

>> 
>>  But I guess in this case I can use HRTIMER_MODE_REL.
> 
> This changes selected clock source, but has no effect on whether timer
> handler can sleep or not.
> 
>> 
>>  > It seems to me that if you want to use software debounce in gpio 
>> keys
>>  > driver you need to set up sufficiently high HZ for your system. 
>> Maybe we
>>  > could thrown a warning when we see low debounce delay and low HZ 
>> to
>>  > alert system developer.
>> 
>>  This is exactly what we should not do. I certainly don't want to 
>> have 250+
>>  timer interrupts per second just so that input events aren't lost, 
>> to work
>>  around a sucky debounce implementation. Besides, if you consider the
>>  hrtimers doc (Documentation/timers/hrtimers.rst), hrtimers really 
>> are what
>>  should be used here.
> 
> I explained why they can't. They could be if you restrict gpio_keys to
> only be used with GPIOs that do not require sleep to read their state,
> but I am not willing to accept such restriction. You either need to 
> have
> longer debounce, higher HZ, or see if you can use GPIO controller that
> supports debounce handling. See also if you can enable dynamic
> ticks/NO_HZ to limit number of timer interrupts on idle system.

We can also use the hrtimer approach if the GPIO doesn't require sleep, 
and fall back to the standard timer if it does. It's possible to detect 
that with gpiod_cansleep(). The diff would be pretty slim. Would you 
accept something like that?

Switching from HZ=250 to HZ=24 leads to a 3% overall performance 
increase across all apps on our system, so a pretty big optimization, 
and this is the only blocker.

Cheers,
-Paul


