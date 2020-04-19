Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9A41AF687
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 06:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgDSENs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 00:13:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgDSENs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 00:13:48 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F826C061A0C;
        Sat, 18 Apr 2020 21:13:48 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o185so2802709pgo.3;
        Sat, 18 Apr 2020 21:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3s5cKFQ7XPNe0wu0jQrVSX2Ly/Khgn/8amiFN2ieLnw=;
        b=nc7C4dtP5jWEPmI/augCn+uFPjAAh138K7yvfwh8oXVE+ZYZqIpHa+07/oyFlmAWSE
         8ko6vN4BtMRK2fWqQFms4VjhA9BcA02OcsEUn1RTESHhD6tFFcuv8PYg9/Fehy9Y4zuB
         urcq4LYm8rKvhwGDzOrLIiiLKhY2lD2Ni6uOi5+uwnMb6Cj+HjFiZFmnPtpvy+4IzKXB
         G5jR7t+6ydWF8geHkbLrCLXKOvB7juzZNNXzB2Pu0gtpRTsFKp0ZysekCeBQPQgTZCBX
         a8rSk7OnTSs5oGA3rnpV26xLIjuPMi9rBIWgxbkOGZ/0JReIvrzCKr4R6Hk/WK6PvN/g
         v+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3s5cKFQ7XPNe0wu0jQrVSX2Ly/Khgn/8amiFN2ieLnw=;
        b=MAQXFPvdPzNXqIcugQLhp/+xjt17snxt4O4xm2hDkFvuano8dNZ8SK7PFLk0kU8zNZ
         /YrZFAxDPL3Q86WJgMGj1ZSBwjE9TokGGqs8+9RHhqSOj6YX0yYXkV0eIQWxImM3kJ33
         umLguihBYptWsP2ZVdLucSlDLRwCjOJ5j/MfIFqh2kz5RC+mkt2tfWtwXJQCo5Vmxkyt
         0nHCMBk+SbFeeroaKnYExSkYDNlkqWFyao18OF6k38p11HpwqYfQsIgcdPJRKsi+Tv/E
         PUut/DtN1HmNsPTCjhx8bMANiI6wBKf2mLFxZshljyapBScgKS5OUQSeT6lttuSgXZsJ
         uRuQ==
X-Gm-Message-State: AGi0PuZJhibf4Dg1FDMlwDqm8Cd/7pF0dZYfy3ewxFHw0xcLRp2S6Zhw
        XXrEYcz7L4zyQNoMs0iUWrE=
X-Google-Smtp-Source: APiQypJ0sQupgLMr/STedCRQuJsXmt1qheRZ06mnhejtYsJkcteV/9gzGW+Vl0sOMLQ+AAFaMmP5oQ==
X-Received: by 2002:aa7:9575:: with SMTP id x21mr6722659pfq.324.1587269627673;
        Sat, 18 Apr 2020 21:13:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id x26sm15331040pfo.218.2020.04.18.21.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 21:13:47 -0700 (PDT)
Date:   Sat, 18 Apr 2020 21:13:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Julian Squires <julian@cipht.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        syzbot <syzbot+7bf5a7b0f0a1f9446f4c@syzkaller.appspotmail.com>,
        linux-input@vger.kernel.org, andreyknvl@google.com,
        gregkh@linuxfoundation.org, ingrassia@epigenesys.com,
        Kernel development list <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs@googlegroups.com, Ping Cheng <pingc@wacom.com>,
        pinglinux@gmail.com, killertofu@gmail.com
Subject: Re: KASAN: use-after-free Read in usbhid_close (3)
Message-ID: <20200419041344.GC166864@dtor-ws>
References: <000000000000f610e805a39af1d0@google.com>
 <Pine.LNX.4.44L0.2004182158020.26218-100000@netrider.rowland.org>
 <20200419040944.GB166864@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200419040944.GB166864@dtor-ws>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Apr 18, 2020 at 09:09:44PM -0700, Dmitry Torokhov wrote:
> Hi Alan,
> 
> On Sat, Apr 18, 2020 at 10:16:32PM -0400, Alan Stern wrote:
> > linux-input people:
> > 
> > syzbot has found a bug related to USB/HID/input, and I have narrowed it
> > down to the wacom driver.  As far as I can tell, the problem is caused
> > the fact that drivers/hid/wacom_sys.c calls input_register_device()
> > in several places, but it never calls input_unregister_device().
> > 
> > I know very little about the input subsystem, but this certainly seems 
> > like a bug.
> 
> Wacom driver uses devm_input_allocate_device(), so unregister should
> happen automatically on device removal once we exit wacom_probe().
> 
> > 
> > When the device is unplugged, the disconnect pathway doesn't call
> > hid_hw_close().  That routine doesn't get called until the user closes
> > the device file (which can be long after the device is gone and
> > hid_hw_stop() has run).  Then usbhid_close() gets a use-after-free
> > error when it tries to access data structures that were deallocated by
> > usbhid_stop().  No doubt there are other problems too, but this is
> > the one that syzbot found.
> 
> Unregistering the input device should result in calling wacom_close()
> (if device was previously opened), which, as far as I can tell, calls
> hid_hw_close().
> 
> I wonder if it is valid to call hid_hw_stop() before hid_hw_close()?
> 
> It could be that we again get confused by the "easiness" of devm APIs
> and completely screwing up unwind order.

Let's also add Ping and Jason to the conversation...

-- 
Dmitry
