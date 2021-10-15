Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A937B42EC9E
	for <lists+linux-input@lfdr.de>; Fri, 15 Oct 2021 10:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235914AbhJOInX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Oct 2021 04:43:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:39164 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237235AbhJOInW (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Oct 2021 04:43:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DDEB4611C2;
        Fri, 15 Oct 2021 08:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634287276;
        bh=kAdxWi7lhPZh6+Y8to2Q5TxPurbAjRC53PQ5fvWF+08=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AziAd0fSfqteyBGRKJxuec31+ee4K4lWuN8L82JOX6B9y2s9q38DpbG0j77B0Kgzy
         r3aGyEUYNZM+sk1tRqeIJuvdIs+N61cuoZQWXjNEBNB1BTSZbx4CgDrua/d4j1k6t9
         yIU2TfyBswB7ZdY77N+Xrcm3ve1rmhGSI8Q4XjqE=
Date:   Fri, 15 Oct 2021 10:41:13 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [PATCH] input&tty: Fix the keyboard led light display problem
Message-ID: <YWk+qaUnN+M/dX9o@kroah.com>
References: <20211015083613.7429-1-changlianzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015083613.7429-1-changlianzhi@uniontech.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 15, 2021 at 04:36:13PM +0800, lianzhi chang wrote:
> Switching from the desktop environment to the tty environment,
> the state of the keyboard led lights and the state of the keyboard
> lock are inconsistent. This is because the attribute kb->kbdmode
> of the tty bound in the desktop environment (xorg) is set to
> VC_OFF, which causes the ledstate and kb->ledflagstate
> values of the bound tty to always be 0, which causes the switch
> from the desktop When to the tty environment, the LED light
> status is inconsistent with the keyboard lock status.
> 
> Signed-off-by: lianzhi chang <changlianzhi@uniontech.com>
> ---
> The latest changes:
> (1) Move the definition of ledstate to the input module (/drivers/input/input.c), 
> and set or get its value through the input_update_ledstate and input_get_ledstate 
> functions.
> (2) To update the ledstate reference in keyboard.c, you must first get the value 
> through input_get_ledstate.
> (3) Other necessary changes

You have not changed the subject line at all.

Look at how others submit patches that are new versions on the mailing
list, and most importantly, read the documentation we have about this.

thanks,

greg k-h
