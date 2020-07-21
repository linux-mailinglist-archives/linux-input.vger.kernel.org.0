Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F44227AE0
	for <lists+linux-input@lfdr.de>; Tue, 21 Jul 2020 10:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728813AbgGUIjl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Jul 2020 04:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbgGUIjl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Jul 2020 04:39:41 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED11C061794;
        Tue, 21 Jul 2020 01:39:41 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id j10so15521033qtq.11;
        Tue, 21 Jul 2020 01:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pl7EZWmiDwJBT7lZl+dqeQwSQYq+gpMZJQPAX61Vc1k=;
        b=japsxIaYfxBdMqncvjy5ilGa0f46e0ryCrw3nPjtP8bIcI3e6Cda4GMoR2yvJ9of4X
         exN1AayGIZ2ZqEuJzgUO/h7w4c7FXIFPiZySVql8I3oVXAGTfXRaM70E4mQc0kT4m8l6
         q7ZHk3dbYAb+fHPAN8/6n+6OldMzj/s9ikyxFbhwhK3yR/hbC6nS1AWDULLElQPYQRfk
         LvakODx5M8I8gCRYdQ5xND272MzjvK7ALX4eSrg7tF1QkdPMVP7aqs77TkuxuMgBYqtt
         GRNs2xMKToJ1xd5KjNYlTf6LQHJwW6uU2hPvkRZfifSBVoLxKJiRS1KRoHF+vV5mwgLA
         ZkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pl7EZWmiDwJBT7lZl+dqeQwSQYq+gpMZJQPAX61Vc1k=;
        b=eJnNYiVCh4TRvEZuXJtHgZ9NchBQJ1ifEhgIF3axbh5Dkqw0g7mgu06MioVssLBu2D
         MZ+Xep7QHR2HtHqzTClnDC4sCAROsn3MkNnv1FW2UGewm3DTrAfa7nK5iBcYjwJJZWNC
         ttkLW2f29mJQ2gyu5V6b08obMC8/MH/gOhnhqWLZUn/3jsajs7pwWEd/vcBU8Vrvwp5S
         AbAHFcjnLq5Q2qdHXL+O/CeR5LYp8/nmyJ0UdkxP10UqezS7xpI2gSZDdbqYkVOpVaov
         X3hBNQfbl66hVHsEQq7kMuO7sQzMRuX/ZuzNhEoup+vGR70o9FLvpk6Dkc4ndXhfBVZi
         Vozg==
X-Gm-Message-State: AOAM5300Z/LgVjMWG133t0S5c2IH5tkaZZ6916mcMpaGg48QW2V30uZt
        0Q6WpyT768qftGrIIVAK+Hr++h9mmQ==
X-Google-Smtp-Source: ABdhPJxe1Z/jmzC0J6uu0OyPwe0gihfRluX1lhIi7H0/BdRm6UJYVkGpYiWbPdzC7W9ZSvEqERmqag==
X-Received: by 2002:ac8:191b:: with SMTP id t27mr28779822qtj.16.1595320780558;
        Tue, 21 Jul 2020 01:39:40 -0700 (PDT)
Received: from PWN (c-76-119-149-155.hsd1.ma.comcast.net. [76.119.149.155])
        by smtp.gmail.com with ESMTPSA id z36sm22239254qtd.22.2020.07.21.01.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 01:39:40 -0700 (PDT)
Date:   Tue, 21 Jul 2020 04:39:38 -0400
From:   Peilin Ye <yepeilin.cs@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        syzkaller-bugs@googlegroups.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH v1] usbhid: Fix slab-out-of-bounds
 write in hiddev_ioctl_usage()
Message-ID: <20200721083938.GA8005@PWN>
References: <20200718231218.170730-1-yepeilin.cs@gmail.com>
 <20200720115400.GI2549@kadam>
 <20200720121257.GJ2571@kadam>
 <20200720191656.GA3366@PWN>
 <20200721071637.GK2571@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721071637.GK2571@kadam>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jul 21, 2020 at 10:16:37AM +0300, Dan Carpenter wrote:
> For some reason the reply-to header on your email is bogus:
> 
> Reply-To: 20200720121257.GJ2571@kadam
> 
> "kadam" is a system on my home network.

Ah...I thought `Reply-To` and `In-Reply-To` are the same thing...Sorry
for the beginner's mistake...

> Yeah.  And in the caller it does:
> 
> drivers/hid/hid-core.c
>    297          if (!parser->local.usage_index) /* Ignore padding fields */
>    298                  return 0;
>    299  
>    300          usages = max_t(unsigned, parser->local.usage_index,
>                 ^^^^^^^^^^^^^^
>    301                                   parser->global.report_count);
>    302  
>    303          field = hid_register_field(report, usages, parser->global.report_count);
>                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> So ->usages is always greater or equal to ->global.report_count.
> 
>    304          if (!field)
>    305                  return 0;
>    306  
>    307          field->physical = hid_lookup_collection(parser, HID_COLLECTION_PHYSICAL);
> 
> > 
> > Here, `values` equals to `global.report_count`. See how it is being
> > called:
> > 
> > drivers/hid/hid-core.c:303:
> > 
> >         field = hid_register_field(report, usages, parser->global.report_count);
> > 
> > In hid_open_report(), `global.report_count` can be set by calling
> > hid_parser_global().
> > 
> > However, the syzkaller reproducer made hid_open_report() to call
> > hid_parser_main() __before__ `global.report_count` is properly set. It's
> > zero. So hid_register_field() allocated `field` with `values` equals to
> > zero - No room for value[] at all. I believe this caused the bug.
> 
> I don't know if zero is valid or not.  I suspect it is valid.  We have
> no reason to think that it's invalid.

I see, I will stop guessing and wait for the maintainers' feedback.

Thank you,

Peilin Ye
