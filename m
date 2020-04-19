Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A251D1AFCA3
	for <lists+linux-input@lfdr.de>; Sun, 19 Apr 2020 19:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726022AbgDSRS7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Apr 2020 13:18:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725932AbgDSRS6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Apr 2020 13:18:58 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D180C061A0C;
        Sun, 19 Apr 2020 10:18:58 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 145so1506609pfw.13;
        Sun, 19 Apr 2020 10:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qapmg8H0xsf8FtuVuTZYqLZSXqZnlrHTeBzdG8nPoxQ=;
        b=ZLj0QO7JBhhyg2TkZzrF+7SNq3YZXndE/CqFNKiGMtdjt9k32EAhBGxNkIZIIP7oqu
         iAX9gedTI9rI8ozBIW3Uqycn1NbdiuLkxJtKetbn64NN2dyX1yITXvGbBuFy/jZ2WodC
         FEiZ1vjh6No0KocBqnIVkdi3Qsr8sOpfwb3fsvt6gKcEQGDlqrldwa9QvrrI1sNhFl3j
         KL8BZIs/jO2fDXlD8p/yaMeg5A63UP4cXEBfZvgz0pHyKNKkOoODGubbdxv+Q+l9Kn1C
         liD791cj7zzYUIvOhrzeh0t7pmmKLfydHg2b/vUlmMChzQrwbtMTptZXblc4CI/0VlsX
         bCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qapmg8H0xsf8FtuVuTZYqLZSXqZnlrHTeBzdG8nPoxQ=;
        b=PhEcdo6mr9GiEqIWros97z6UdS6W1Yi+mCHjPSNi8eLG+6fsGIfqnn35JH12r/OKWw
         gxp5zKeFsszzdm8NB7AP6mqJP27VBetSW05og5wGfPSiPazIDVWL4yBskYr9b0dqaRV3
         LGqqMOzvRR7iA1fz1dUNEEK1aN58H4vr7TyQyZYZCtiYjneWTZQ8om6nEUfDl8hH8owC
         enI1aXsL1O1rIwrY8RgXbBm7flaCSrrGLw4p+KpZFutoO6EcJ5NlZNbtffjowHeRxB91
         AyhKZ1vNNi75cEOJ6T4N6+xcZij3CdfcY7cRqBf36nbXhWZDfCP6Ys1rAjOPIiLVaTV6
         6g4w==
X-Gm-Message-State: AGi0PuYUCG2LvPN1JxX3LnXQtAeObgTqZPxIOiG/CvF788Bpj9ZUgUoU
        Zt543GZtz5ogreS9mkDG7Swa3HrG
X-Google-Smtp-Source: APiQypJBlIWcg4jaSV+mBDmX6rq5LhzmSESAt2LOosTpZPo72+cTWIIFEXwLzWJ6w/2GFdsnOpkRxg==
X-Received: by 2002:a63:4a59:: with SMTP id j25mr12358714pgl.336.1587316737845;
        Sun, 19 Apr 2020 10:18:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id c15sm2406100pfo.188.2020.04.19.10.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 10:18:57 -0700 (PDT)
Date:   Sun, 19 Apr 2020 10:18:55 -0700
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
Message-ID: <20200419171855.GJ166864@dtor-ws>
References: <20200419041344.GC166864@dtor-ws>
 <Pine.LNX.4.44L0.2004191000080.29527-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2004191000080.29527-100000@netrider.rowland.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Apr 19, 2020 at 10:07:34AM -0400, Alan Stern wrote:
> On Sat, 18 Apr 2020, Dmitry Torokhov wrote:
> 
> > On Sat, Apr 18, 2020 at 09:09:44PM -0700, Dmitry Torokhov wrote:
> > > Hi Alan,
> > > 
> > > On Sat, Apr 18, 2020 at 10:16:32PM -0400, Alan Stern wrote:
> > > > linux-input people:
> > > > 
> > > > syzbot has found a bug related to USB/HID/input, and I have narrowed it
> > > > down to the wacom driver.  As far as I can tell, the problem is caused
> > > > the fact that drivers/hid/wacom_sys.c calls input_register_device()
> > > > in several places, but it never calls input_unregister_device().
> > > > 
> > > > I know very little about the input subsystem, but this certainly seems 
> > > > like a bug.
> > > 
> > > Wacom driver uses devm_input_allocate_device(), so unregister should
> > > happen automatically on device removal once we exit wacom_probe().
> > > 
> > > > 
> > > > When the device is unplugged, the disconnect pathway doesn't call
> > > > hid_hw_close().  That routine doesn't get called until the user closes
> > > > the device file (which can be long after the device is gone and
> > > > hid_hw_stop() has run).  Then usbhid_close() gets a use-after-free
> > > > error when it tries to access data structures that were deallocated by
> > > > usbhid_stop().  No doubt there are other problems too, but this is
> > > > the one that syzbot found.
> > > 
> > > Unregistering the input device should result in calling wacom_close()
> > > (if device was previously opened), which, as far as I can tell, calls
> > > hid_hw_close().
> > > 
> > > I wonder if it is valid to call hid_hw_stop() before hid_hw_close()?
> 
> No, it isn't.  If it were, for example, why would evdev_disconnect() -> 
> evdev_cleanup() need to call input_close_device()?

Because input and HID are not the same. For input, when we attempt to
unregister an input device we will go through all attached input
handlers (like evdev) and if they believe they have the device open they
will attempt to close it. How close is implemented is up to particular
driver.

I am not sure about HID implementation details, but I could envision
transports where you can tell the transport that you no longer want
events to be delivered to you ("close") vs you want to disable hardware
("stop") and support any order of them.

> And why would 
> usbhid_disconnect() deallocate the usbhid structure which usbhid_stop()
> accesses?

This happens only after we return from hid_destroy_device(), so
even in the presence of devm I'd expect that all devm-related stuff
instantiated by hid-wacom would have been completed before we get back
to usbhid_disconnect().

Can we validate that calls to wacom_close() happen?

> 
> > > It could be that we again get confused by the "easiness" of devm APIs
> > > and completely screwing up unwind order.
> 
> That's probably what happened.

Thanks.

-- 
Dmitry
