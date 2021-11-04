Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 804BA44538B
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:07:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbhKDNKc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbhKDNKb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 09:10:31 -0400
Received: from angie.orcam.me.uk (angie.orcam.me.uk [IPv6:2001:4190:8020::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A3876C061714;
        Thu,  4 Nov 2021 06:07:53 -0700 (PDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id CB5D792009D; Thu,  4 Nov 2021 14:07:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id C555092009B;
        Thu,  4 Nov 2021 13:07:52 +0000 (GMT)
Date:   Thu, 4 Nov 2021 13:07:52 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
In-Reply-To: <17ccc35d-441c-70c1-a80a-28a4ff824535@collabora.com>
Message-ID: <alpine.DEB.2.21.2111041227510.57165@angie.orcam.me.uk>
References: <20211103155438.11167-1-andrzej.p@collabora.com> <20211104120111.GB23122@duo.ucw.cz> <17ccc35d-441c-70c1-a80a-28a4ff824535@collabora.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 4 Nov 2021, Andrzej Pietrasiewicz wrote:

> > Is F10 sensible default? Would it make sense to use something like
> > alt-shift-esc so that this can be enabled by default?
> 
> Why "alt-shift-esc" could be enabled by default? Do you mean to enable it for
> all systems regardless of whether they declare or don't declare KEY_SYSRQ
> in their 'keybit' bitmap?

 FWIW from my perspective it'll work better as a replacement rather than 
additional key combination.

 The reason for this is with their more recent laptops Lenovo in their 
infinite wisdom have placed the <PrintScreen> key (which in a traditional 
PS/2-keyboard manner produces <SysRq> when combined with <Alt>) in their 
keyboards between the right <Alt> and <Ctrl> keys.  With thumbs not being 
as accurate as other fingers (and the overall misdesign of the keyboard 
and touchpad interface) you can imagine how often I have inadvertently hit 
<SysRq> combined with a letter key, wreaking havoc to my system (and of 
course I want to keep the key enabled for times when I do need it).

 Also Documentation/admin-guide/sysrq.rst mentions that you can set an 
alternative keycode sequence for KEY_SYSRQ with `setkeycodes <sequence> 
99' already, but I find this pretty limiting as this only works for single 
keypresses rather than combinations of keys, because <sequence> actually 
refers to a single scancode (possibly 0xe0-prefixed).

  Maciej
