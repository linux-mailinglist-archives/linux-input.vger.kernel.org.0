Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45E5E44539F
	for <lists+linux-input@lfdr.de>; Thu,  4 Nov 2021 14:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhKDNPw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Nov 2021 09:15:52 -0400
Received: from angie.orcam.me.uk ([78.133.224.34]:36922 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbhKDNPv (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 4 Nov 2021 09:15:51 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id 457DF92009E; Thu,  4 Nov 2021 14:13:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id 3F62B92009D;
        Thu,  4 Nov 2021 13:13:12 +0000 (GMT)
Date:   Thu, 4 Nov 2021 13:13:12 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jiri Slaby <jirislaby@kernel.org>, kernel@collabora.com
Subject: Re: [RFC] tty/sysrq: Add alternative SysRq key
In-Reply-To: <alpine.DEB.2.21.2111041227510.57165@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2111041311260.57165@angie.orcam.me.uk>
References: <20211103155438.11167-1-andrzej.p@collabora.com> <20211104120111.GB23122@duo.ucw.cz> <17ccc35d-441c-70c1-a80a-28a4ff824535@collabora.com> <alpine.DEB.2.21.2111041227510.57165@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 4 Nov 2021, Maciej W. Rozycki wrote:

>  The reason for this is with their more recent laptops Lenovo in their 
> infinite wisdom have placed the <PrintScreen> key (which in a traditional 
> PS/2-keyboard manner produces <SysRq> when combined with <Alt>) in their 
> keyboards between the right <Alt> and <Ctrl> keys.  With thumbs not being 
> as accurate as other fingers (and the overall misdesign of the keyboard 
> and touchpad interface) you can imagine how often I have inadvertently hit 
> <SysRq> combined with a letter key, wreaking havoc to my system (and of 
> course I want to keep the key enabled for times when I do need it).

 On second thoughts this can be disabled with `setkeycodes 54 0' once we 
do have an alternative combination available.

  Maciej
