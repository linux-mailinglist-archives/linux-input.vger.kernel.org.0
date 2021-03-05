Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0DE032F2BF
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 19:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230215AbhCESft (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 13:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbhCESfb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 13:35:31 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD973C061574;
        Fri,  5 Mar 2021 10:35:31 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id t26so1953571pgv.3;
        Fri, 05 Mar 2021 10:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bebTZOBS90Mn7EMR9IqSfE9satt6qw7eQpkaCcjmPC4=;
        b=QBsRsPbSSqwPsOQf7nmJQt+eB1kupI6HHagrsUgxHLWyzMb4H/9DN8jx1PpFPjB1zu
         epRM30Gu/7qLI09d+hqPh7/hO0ZfzDVBpwsD6s7V5dyhV5mN4s5CkXnDo4Rb/Hyc8QRi
         QDZa9bIovsZfiy+oo7pZNmocVb8gFGmsu3FUdTnGnxFam/ZsJK6F8kHe0vHOE6kLxvaS
         LMh4tyY8p1loEjDHGVok8pm1TFNhhboaw45uQUru+T6Gp1uEmybfoNlQKgYEg6AtCr7F
         y/OjUBgDoONigOJpLBhUgo0mC4INLLNE1E708VaEkV/VcXYNjnNq+NR01WFlK1UiAVrw
         6QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bebTZOBS90Mn7EMR9IqSfE9satt6qw7eQpkaCcjmPC4=;
        b=c7DsDvdPOCtMHKX5Ozp31z+R+mtdFvOge+jK0pmbVNQj8lzARsRDQ6d5z1an1+4UIB
         AgOZ7gWI6ntrzFQCPfeN+4BemgWL13QTrvaPwHHxf2v5ku4SwtvrXmmQiA+7TIrkb/Nl
         3bGq2wv+aT+GqyckYwrEoB7uZtIit4W0GGb3UdUPgRjZ0aRedvn0Ou35hQcHo0xPsEl+
         xq1yKAUri4/BCwmez2b67YFxfLnNyvnNNDEOOx0WRoHxiWg9P33WScivaTNkQ7wyUQ8E
         Wxn+N0N3tQBkI+8xY33ryWBKgbFFJ0vsLwAqAuUA9wnL8cyx+WWBsvnj8WbPMkyrj6Pw
         XSkA==
X-Gm-Message-State: AOAM530X+nWc0DWy8HWxQwKse5oorR2l9FBLP1Tp7KUv3PgX0pqmdGAt
        Xxx54krOgr2ckpDPgbGJEgg=
X-Google-Smtp-Source: ABdhPJxb0ulaBrIkxI29f08vnaSprwKYVBnjN0VJdc3afyg0naid8D3i1/g1tns/y3E1VWs9Bn+7TA==
X-Received: by 2002:a62:1896:0:b029:197:491c:be38 with SMTP id 144-20020a6218960000b0290197491cbe38mr10147888pfy.15.1614969331120;
        Fri, 05 Mar 2021 10:35:31 -0800 (PST)
Received: from google.com ([2620:15c:202:201:70ea:1e11:c25c:35fe])
        by smtp.gmail.com with ESMTPSA id a3sm3122976pfi.206.2021.03.05.10.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 10:35:29 -0800 (PST)
Date:   Fri, 5 Mar 2021 10:35:24 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     od@zcrc.me, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] input: gpio-keys: Use hrtimer for software debounce
Message-ID: <YEJ57PuEyYknR3MF@google.com>
References: <20210305170111.214782-1-paul@crapouillou.net>
 <20210305170111.214782-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305170111.214782-3-paul@crapouillou.net>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Paul,

On Fri, Mar 05, 2021 at 05:01:11PM +0000, Paul Cercueil wrote:
> -static void gpio_keys_gpio_work_func(struct work_struct *work)
> +static enum hrtimer_restart gpio_keys_debounce_timer(struct hrtimer *t)
>  {
> -	struct gpio_button_data *bdata =
> -		container_of(work, struct gpio_button_data, work.work);
> +	struct gpio_button_data *bdata = container_of(t,
> +						      struct gpio_button_data,
> +						      debounce_timer);
>  
>  	gpio_keys_gpio_report_event(bdata);

I am not sure how this works. As far as I know, even
HRTIMER_MODE_REL_SOFT do not allow sleeping in the timer handlers, and
gpio_keys_gpio_report_event() use sleeping variant of GPIOD API (and
that is not going to change).

It seems to me that if you want to use software debounce in gpio keys
driver you need to set up sufficiently high HZ for your system. Maybe we
could thrown a warning when we see low debounce delay and low HZ to
alert system developer.

Thanks.

-- 
Dmitry
