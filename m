Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75BE024A53D
	for <lists+linux-input@lfdr.de>; Wed, 19 Aug 2020 19:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgHSRwP (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Aug 2020 13:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726729AbgHSRwM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Aug 2020 13:52:12 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21056C061383
        for <linux-input@vger.kernel.org>; Wed, 19 Aug 2020 10:52:12 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id t7so19770704otp.0
        for <linux-input@vger.kernel.org>; Wed, 19 Aug 2020 10:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CjMjzH3fehRCjIooC9HaoDNQWXnBk2N7r4YBAaodSRE=;
        b=ilVda4423tQC2PN57v1Y+or7Ood8LoWFVJ+sJlsRWm2k71cek0UTL0bmC6S/YGy/8y
         wjMoOuMep5J1MZojJAAT9rjKSTSOiH1WKSWvF2VjSbKyf9/0HzEZaGBcXY48iIG4oubx
         I3lnS7pVKGjBqwy0PdQBPtlB1JcMeqJbZx+m5eVwl9b34nYeH6K1Kf+VcDmtFoNs5kbD
         LVDG2qO6NBRSkes6cav0XvQVqY1iD8ylAHxorg0/9JXa0sm919fchCLDgz7Owc9mCw9b
         3dQEMswJFD0cANQWk54fo+LnOQJlnViBNbOfM3PAZWpsVZpJpj4PQCNqEmUo8ZMpfPYg
         c6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CjMjzH3fehRCjIooC9HaoDNQWXnBk2N7r4YBAaodSRE=;
        b=oMS2npwIqR/l/PPmLa7i2vYB+Bl8Dwgx0l9vIFjJaRYx+dhimo7iln3bilOKQG7uEN
         2LcCJ4Ee3JucgMp5z0H72u9Cf9PPaQMukNbCdpCagMdw4R9UOIg6RiwFXQcB45sl2rE6
         0M51CBu5r0KjhgISZe+Mu037EqP4AFuK3Ql4Co3sYl9/3klQ7vWQ58vVfVJnsFlyq1wv
         /TZ6k+8UhPFCFAp63Nu+0Iwel32RoIhyzl/LNGLywURu+NQbRc4E5J2UV+5inoXGcaeX
         /VXX/wgV68hVLh4tlj8r4EXfdOHDwzHsxr/Q5slN+SAGX6+sMFhZTkyBMM1Ptzwjyu9L
         ZLqQ==
X-Gm-Message-State: AOAM530k3i7KYP5mJ633s9LnQZdwAfhPIwZjyo0mT0mvjz88gNIre0sC
        sBTX9ZydkczqP3sw1xoE88MJ1nie4Z3LS56NQ4UUog==
X-Google-Smtp-Source: ABdhPJybPNjixtja1GlAsuU50hmtXdc2pKKDcKjwmlzD8tPzvqkUIfoyoP9CvF3XvtzCUpeLs6YxTdyOn6i9SQ/tqc0=
X-Received: by 2002:a9d:7741:: with SMTP id t1mr18499997otl.368.1597859531040;
 Wed, 19 Aug 2020 10:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200818234215.2255611-1-furquan@google.com> <20200819000845.GW1665100@dtor-ws>
In-Reply-To: <20200819000845.GW1665100@dtor-ws>
From:   Furquan Shaikh <furquan@google.com>
Date:   Wed, 19 Aug 2020 10:51:54 -0700
Message-ID: <CAEGmHFGfKtrEfODrqCpVoOvSS0jOnxWm_c6UYGm6_U2yjgFijw@mail.gmail.com>
Subject: Re: [PATCH] drivers: input: Use single i2c_transfer transaction when
 using RM_CMD_BANK_SWITCH
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        linux-input@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aaron Durbin <adurbin@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,

On Tue, Aug 18, 2020 at 5:08 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Furquan,
>
> On Tue, Aug 18, 2020 at 04:42:15PM -0700, Furquan Shaikh wrote:
> > On an AMD chromebook, where the same I2C bus is shared by both Raydium
> > touchscreen and a trackpad device, it is observed that interleaving of
> > I2C messages when raydium_i2c_read_message() is called leads to the
> > Raydium touch IC reporting incorrect information. This is the sequence
> > that was observed to result in the above issue:
> >
> > * I2C write to Raydium device for RM_CMD_BANK_SWITCH
> > * I2C write to trackpad device
> > * I2C read from trackpad device
> > * I2C write to Raydium device for setting address
> > * I2C read from Raydium device >>>> This provides incorrect
> >   information
> >
> > This change updates raydium_i2c_read_message and
> > raydium_i2c_send_message to perform all the I2C transfers in the
> > function as part of a single i2c_transfer transaction. This ensures
> > that no transactions are initiated to any other device on the same bus
> > in between and hence the information obtained from the touchscreen
> > device is correct. Verified with the patch across multiple
> > reboots (>100) that the information reported by the Raydium
> > touchscreen device during probe is correct.
>
> The devices (touchpad and touchscreen) have to have different addresses
> and therefore should be able to operate independently of each other. Are
> you sure that the problem is not in i2c controller implementation that
> mixes up data streams from 2 separate devices?

Yes, the I2C addresses for the touchpad and touchscreen devices are
different on this platform. Based on i2c tracing and the operations
performed by the driver, the transactions are being sent out to the
correct address. The issue occurs only when a transaction for the
touchpad device is sent after the `RM_CMD_BANK_SWITCH` command is sent
to the touchscreen device and before the driver reads back the
required data. Snippet of tracing in good and bad case (with
comments):

Bad case:
```
i2c_write: i2c-0 #0 a=039 f=0000 l=5 [aa-20-00-1b-94] <<<<<<
RM_CMD_BANK_SWITCH command to touchscreen device
i2c_result: i2c-0 n=1 ret=1
i2c_write: i2c-0 #0 a=015 f=0000 l=2 [03-01] <<<<<< Transaction to
touchpad device
i2c_read: i2c-0 #1 a=015 f=0001 l=2
i2c_reply: i2c-0 #1 a=015 f=0001 l=2 [00-10]
i2c_result: i2c-0 n=2 ret=2
i2c_write: i2c-0 #0 a=039 f=0000 l=1 [94] <<<<<< Write/read after
RM_CMD_BANK_SWITCH to touchscreen device
i2c_read: i2c-0 #1 a=039 f=0001 l=16
i2c_reply: i2c-0 #1 a=039 f=0001 l=16
[15-00-20-74-07-00-d8-02-00-00-00-ef-ff-ff-ff-00] <<<<<< Incorrect
data
i2c_result: i2c-0 n=2 ret=2
```

Good case:
```
i2c_write: i2c-0 #0 a=015 f=0000 l=2 [03-01] <<<<<< Same transaction
as above to touchpad device with same response from touchpad device
i2c_read: i2c-0 #1 a=015 f=0001 l=2
i2c_reply: i2c-0 #1 a=015 f=0001 l=2 [00-10]
i2c_result: i2c-0 n=2 ret=2
...
i2c_write: i2c-0 #0 a=039 f=0000 l=5 [aa-20-00-1b-94] <<<<<<
RM_CMD_BANK_SWITCH command to touchscreen device
i2c_result: i2c-0 n=1 ret=1
i2c_write: i2c-0 #0 a=039 f=0000 l=1 [94] <<<<<< Write/read after
RM_CMD_BANK_SWITCH to touchscreen device
i2c_read: i2c-0 #1 a=039 f=0001 l=16
i2c_reply: i2c-0 #1 a=039 f=0001 l=16
[42-18-22-a2-01-01-01-00-4a-2a-80-07-38-04-18-18] <<<<<< Correct data
```

It can be seen that the transaction which got interleaved in the bad
case is also sent out in the good case with the same response from the
touchpad device. Based on this evidence, the issue points towards a
problem with touchscreen firmware expectations.

Also, this same designware I2C driver is used on many other platforms
as well. What is unique about this platform is that the touchpad and
touchscreen devices share the same bus.

Thanks,
Furquan

>
> Thanks.

>
> --
> Dmitry
