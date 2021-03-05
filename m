Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63B0B32F454
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 21:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhCEUBD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-input@lfdr.de>); Fri, 5 Mar 2021 15:01:03 -0500
Received: from aposti.net ([89.234.176.197]:58206 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229488AbhCEUA4 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 5 Mar 2021 15:00:56 -0500
Date:   Fri, 05 Mar 2021 20:00:43 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/3] input: gpio-keys: Use hrtimer for software debounce
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <79IIPQ.DQ7JNXZ0OI5Q2@crapouillou.net>
In-Reply-To: <YEJ57PuEyYknR3MF@google.com>
References: <20210305170111.214782-1-paul@crapouillou.net>
        <20210305170111.214782-3-paul@crapouillou.net> <YEJ57PuEyYknR3MF@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,

Le ven. 5 mars 2021 à 10:35, Dmitry Torokhov 
<dmitry.torokhov@gmail.com> a écrit :
> Hi Paul,
> 
> On Fri, Mar 05, 2021 at 05:01:11PM +0000, Paul Cercueil wrote:
>>  -static void gpio_keys_gpio_work_func(struct work_struct *work)
>>  +static enum hrtimer_restart gpio_keys_debounce_timer(struct 
>> hrtimer *t)
>>   {
>>  -	struct gpio_button_data *bdata =
>>  -		container_of(work, struct gpio_button_data, work.work);
>>  +	struct gpio_button_data *bdata = container_of(t,
>>  +						      struct gpio_button_data,
>>  +						      debounce_timer);
>> 
>>   	gpio_keys_gpio_report_event(bdata);
> 
> I am not sure how this works. As far as I know, even
> HRTIMER_MODE_REL_SOFT do not allow sleeping in the timer handlers, and
> gpio_keys_gpio_report_event() use sleeping variant of GPIOD API (and
> that is not going to change).

Quoting <linux/hrtimers.h>, the "timer callback will be executed in 
soft irq context", so sleeping should be possible.

But I guess in this case I can use HRTIMER_MODE_REL.

> It seems to me that if you want to use software debounce in gpio keys
> driver you need to set up sufficiently high HZ for your system. Maybe 
> we
> could thrown a warning when we see low debounce delay and low HZ to
> alert system developer.

This is exactly what we should not do. I certainly don't want to have 
250+ timer interrupts per second just so that input events aren't lost, 
to work around a sucky debounce implementation. Besides, if you 
consider the hrtimers doc (Documentation/timers/hrtimers.rst), hrtimers 
really are what should be used here.

-Paul


