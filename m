Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0095E2C97D0
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 08:07:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727341AbgLAHG7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 02:06:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725859AbgLAHG6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 02:06:58 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93289C0613CF;
        Mon, 30 Nov 2020 23:06:18 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id d77so54886pfd.2;
        Mon, 30 Nov 2020 23:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q1SvftNK3zi/hMGb+K8LgTI3L4X8qWPNkvVjZfh/PF4=;
        b=uCeo1u1iPqDk0zo/Oo9m+EeB+yHWn7q/buUrmGWP93MAZRNIpvIvoGVyNWzBAjiLE7
         D+VuEPK7EVOPY/xFi+WvXq012S2zumlGYVI7DkPUW4USj4ICby8+9eyTGpXmUoidN5et
         YODYRi6XCIkp7AO5Ksvfdr3sdOuCI0cbiD4bp1bSbqz8ei1JwoJbsb0IU6LWnj++zrt5
         K0a6fkryMSUVBFUazj3R6HmD9OPZ1JY2pfGb7fU+WEDyFGzxEV8ygEyyb6jT596t4lPg
         l0QCD9jtmZNjFl1i2FTIQhR0NwYwg5Idffdr01zKK71/Q4JmcBfHzwiBknd18gA9SR1R
         nANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q1SvftNK3zi/hMGb+K8LgTI3L4X8qWPNkvVjZfh/PF4=;
        b=PlTo7uXrTg0QdxnjbIlVUTqBLQmvi0xixKXZhVESfsu3PwK4PJMSOrZN/Np+PPT3fw
         6iWZsBLDrffEdxt9GA4mtzBnmHTPgZNP7KF2ydw7jzlcD8SMlN0lhMcxE5JCUuBtiGIT
         q4gwKVgaCsiSCmRsTkOQqi/cZ29vomsaputcYVmCy/5mY5zzFa6gbFME37CnqvwWqXB7
         XhV+ftRvubdQR/3f4SukJcKAmk9Ip2h8jhEhg5D9r6v6BNn9TGqoEAQsiQWsiVSvYx1B
         CWHjcuYAHbh9tFV5Sx0o2Q7QProYNTvQaVA2GzUDHGDiCBIH7cjMfoLeTJw420YzEg11
         iLCg==
X-Gm-Message-State: AOAM530KdbsP/eyOle1x3FQ/GMFPjssgsAKQNgG0PsoRSZLwSo/7o9r6
        pR6sZ7Bye5DHXt98lbyhaOy6Lm5dNSg=
X-Google-Smtp-Source: ABdhPJw0Dix9k/qLw9my/qcvzt+npSJvsk9DPAOx6EXRKRFuanHXphbwCnm0/IJcz7SfkILoKn/qyg==
X-Received: by 2002:a05:6a00:1647:b029:18b:e825:8a6c with SMTP id m7-20020a056a001647b029018be8258a6cmr1253646pfc.19.1606806378096;
        Mon, 30 Nov 2020 23:06:18 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id e17sm1363579pfm.155.2020.11.30.23.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 23:06:17 -0800 (PST)
Date:   Mon, 30 Nov 2020 23:06:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Furquan Shaikh <furquan@google.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] input: raydium_ts_i2c: Do not split tx transactions
Message-ID: <20201201070615.GT2034289@dtor-ws>
References: <20201201060050.1193986-1-furquan@google.com>
 <20201201062807.GO2034289@dtor-ws>
 <CAEGmHFGYuM91U+Tvq+YDt180cfHQKnOKMY5ToHZ7v44fOs-_8w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEGmHFGYuM91U+Tvq+YDt180cfHQKnOKMY5ToHZ7v44fOs-_8w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 30, 2020 at 10:54:46PM -0800, Furquan Shaikh wrote:
> Hello Dmitry,
> 
> On Mon, Nov 30, 2020 at 10:28 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > Hi Furquan,
> >
> > On Mon, Nov 30, 2020 at 10:00:50PM -0800, Furquan Shaikh wrote:
> > > Raydium device does not like splitting of tx transactions into
> > > multiple messages - one for the register address and one for the
> > > actual data. This results in incorrect behavior on the device side.
> > >
> > > This change updates raydium_i2c_read and raydium_i2c_write to create
> > > i2c_msg arrays separately and passes those arrays into
> > > raydium_i2c_xfer which decides based on the address whether the bank
> > > switch command should be sent. The bank switch header is still added
> > > by raydium_i2c_read and raydium_i2c_write to ensure that all these
> > > operations are performed as part of a single I2C transfer. It
> > > guarantees that no other transactions are initiated to any other
> > > device on the same bus after the bank switch command is sent.
> >
> > i2c_transfer locks the bus [segment] for the entire time, so this
> > explanation on why the change is needed does not make sense.
> 
> The actual problem is with raydium_i2c_write chopping off the write
> data into 2 messages -- one for register address and other for actual
> data. Raydium devices do not like that. Hence, this change to ensure
> that the register address and actual data are packaged into a single
> message. The latter part of the above comment attempts to explain why
> the bank switch message is added to xfer[] array in raydium_i2c_read
> and raydium_i2c_write instead of sending a separate message in
> raydium_i2c_xfer i.e. to ensure that the read/write xfer and bank
> switch are sent to i2c_transfer as a single array of messages so that
> they can be handled as an atomic operation from the perspective of
> communication with this device on the bus.

OK, I see.

> 
> >
> > Also, does it help if you mark the data message as I2C_M_NOSTART in case
> > of writes?
> 
> That is a great suggestion. I think this would be helpful in this
> scenario. Let me follow-up on this to see if it helps with the current
> problem.
> 
> >
> > I also wonder if we should convert the driver to regmap, which should
> > help with handling the bank switch as well as figuring out if it can do
> > "gather write" or fall back to allocating an additional send buffer.
> 
> I will start with the above suggestion and fallback to this if that
> doesn't work.

So my understanding is that not all I2C adapters support I2C_M_NOSTART
so that is why regmap is nice as it hides it all away and figures things
on its own.

So simple solution of I2C_M_NOSTART might be a quick fix for Chrome OS
kernel, but we'd either need to always use more expensive 2nd buffer as
is in your patch, or regmap.

Thanks.

-- 
Dmitry
