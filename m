Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 734C0968DE
	for <lists+linux-input@lfdr.de>; Tue, 20 Aug 2019 21:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729833AbfHTTFx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Aug 2019 15:05:53 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42959 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729231AbfHTTFx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Aug 2019 15:05:53 -0400
Received: by mail-pg1-f195.google.com with SMTP id p3so3746763pgb.9;
        Tue, 20 Aug 2019 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=/iVGao85VyweUJ8LBC6iqzHvG+k5xZ44VIwFKEMEFlI=;
        b=tXZVQtnDWznIiEugeA6YNVt3N8ghiDBEl7ksTpEyidUhxctiL7oEslx0MJfrrhJP9z
         YdCeVdKu58T0UWFJgvRbxS7ZRHI9lu/Yzw9rGwSKXJ613Z3Fi+xap5nChl30a/+4sxN0
         KgAbw6h6nfIeo9kHdRT+z+jyQQpjxcKHmjBMmYKFjYFm9k6hUeT7rKP+KnA54P2RzhpC
         WGk0KnkxcLXUcswrZxSFUJ2qv6kkK5aSrOuKaIJpl04HaE47GCdQzlPAZeAiZBHI6Vng
         nzNbxFsPX/E60LcsmoajeCX0QsImZ/mq2LxsH3rnMz8WrhXvej5Vp1P9wsBr7YYr27cf
         Ev/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=/iVGao85VyweUJ8LBC6iqzHvG+k5xZ44VIwFKEMEFlI=;
        b=OcD8MYnzIBCjhQBJTtxh/cgWtZP7r5fqntms3l1RyfifLf3FnYfZDtN+TR5BEqrqRc
         lPZHdKzHacuiO5lspsEQHJVvB/08tIoiKgMcY4KUHYOUUkv6oQ0YKRPHLmEeC7oNv2P0
         0+0XDt21ssI/TkpbQakU+46F7xaN5Gwer/DRRRB9By0Eeozw6xoOYxzQIbWX5d8AEEp2
         fU4uOtJhWX738PFNniyPgLlYi9/JIzMdyA6VE/e3871gwo7SF9e6BJ/rWZPMfbGsdJG2
         hU4MF02hGIdUnJMIDZpJHDYI3qPa4PXenR7WOQ2k33GKsFTmVD5DN2YjimQXrOa3CO4f
         hszA==
X-Gm-Message-State: APjAAAXT6+lqzoFpB6GwL5c61NRuDpEY51DbdDSERj/76A7yy5kEK5ot
        Df4fRZvXXrncXzG8U57ELDI=
X-Google-Smtp-Source: APXvYqxFti0YQuE0s1lh1L01QNhCWYKorMGa2n0djkwL6TxqTJxM5CSPeNicEBe8pErRyu5nLgXv2g==
X-Received: by 2002:a62:cec4:: with SMTP id y187mr31302057pfg.84.1566327952246;
        Tue, 20 Aug 2019 12:05:52 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id r4sm25327200pfl.127.2019.08.20.12.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2019 12:05:48 -0700 (PDT)
Date:   Tue, 20 Aug 2019 12:05:46 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] Input: add support for polling to input devices
Message-ID: <20190820190546.GP121898@dtor-ws>
References: <20190809173548.GA32693@dtor-ws>
 <CAO-hwJL1Jq5XjqV32fD7+_nMpi3PhUbrB5QQ+EEs3N6=mBy-1g@mail.gmail.com>
 <20190812171135.GA178933@dtor-ws>
 <CAO-hwJKfHCwLkEDWrzJHejjaB+vY=0RsfY-=xfdRUSQPpeUVAg@mail.gmail.com>
 <8624c907-6d7e-3301-1044-113bb108ba9e@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8624c907-6d7e-3301-1044-113bb108ba9e@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Aug 20, 2019 at 01:56:53PM +0200, Michal Vokáč wrote:
> On 13. 08. 19 16:04, Benjamin Tissoires wrote:
> > On Mon, Aug 12, 2019 at 7:11 PM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > > 
> > > Hi Benjamin,
> > > 
> > > On Mon, Aug 12, 2019 at 06:50:38PM +0200, Benjamin Tissoires wrote:
> > > > Hi Dmitry,
> > > > 
> > > > On Fri, Aug 9, 2019 at 7:35 PM Dmitry Torokhov
> > > > <dmitry.torokhov@gmail.com> wrote:
> > > > > 
> > > > > Separating "normal" and "polled" input devices was a mistake, as often we
> > > > > want to allow the very same device work on both interrupt-driven and
> > > > > polled mode, depending on the board on which the device is used.
> > > > > 
> > > > > This introduces new APIs:
> > > > > 
> > > > > - input_setup_polling
> > > > > - input_set_poll_interval
> > > > > - input_set_min_poll_interval
> > > > > - input_set_max_poll_interval
> > > > > 
> > > > > These new APIs allow switching an input device into polled mode with sysfs
> > > > > attributes matching drivers using input_polled_dev APIs that will be
> > > > > eventually removed.
> > > > 
> > > > Are you sure that using sysfs is the correct way here?
> > > > I would think using generic properties that can be overwritten by the
> > > > DSDT or by the device tree would make things easier from a driver
> > > > point of view.
> > > 
> > > Couple of points: I wanted it to be compatible with input-polldev.c so
> > > the sysfs attributes must match (so that we can convert existing drivers
> > > and zap input-polldev).
> > 
> > Oh, I missed that. Good point.
> > 
> > > I also am not sure if polling parameters are
> > > property of board, or it is either fundamental hardware limitation or
> > > simply desired system behavior.
> > 
> > I think it's a combination of everything: sometimes the board misses
> > the capability to not do IRQs for that device, and using properties
> > would be better here: you can define them where you need (board,
> > platform or device level), and have a working platfrom from the kernel
> > description entirely.
> > However, it doesn't solve the issue of input-polldev, so maybe
> > properties should be added on top of this sysfs.
> > 
> > > If Rob is OK with adding device
> > > properties I'd be fine adding them as a followup, otherwise we can have
> > > udev adjust the behavior as needed for given box shortly after boot.
> > 
> > Fair enough.
> > 
> > > 
> > > > 
> > > > Also, checkpatch complains about a few octal permissions that are
> > > > preferred over symbolic ones, and there is a possible 'out of memory'
> > > > nessage at drivers/input/input-poller.c:75.
> > > 
> > > Yes, there is. It is there so we would know what device we were trying
> > > to set up when OOM happened. You can probable decipher the driver from
> > > the stack trace, but figuring particular device instance is harder.
> > 
> > Could you add a comment there explaining this choice? I have a feeling
> > you'll have to refuse a few patches of people running coccinelle
> > scripts and be too happy to send a kernel patch.

Done.

> > 
> > Other than that:
> > Acked-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> > 
> 
> Hi Dmitry,
> 
> what is the status of this patch? Are we still waiting for Rob to
> comment on the device properties or is this ready to land?

I applied it just now.

> 
> Little bit OT question: what tree/branch do you use to apply patches?
> According to the mailing list you recently applied some patches but
> I can not find them here [1].

Patches that go into current cycle will be in 'for-linus' branch.
Patches that will be merged in the next merge window (like this one)
will end up in 'next' branch.

Thanks.

-- 
Dmitry
