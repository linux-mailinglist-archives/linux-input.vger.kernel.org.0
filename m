Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C514345E7
	for <lists+linux-input@lfdr.de>; Wed, 20 Oct 2021 09:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhJTHck (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 20 Oct 2021 03:32:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:49400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229809AbhJTHci (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 20 Oct 2021 03:32:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4EE6860FC3;
        Wed, 20 Oct 2021 07:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634715024;
        bh=nTtxR8RtHzmZkuJwB5xogwj67/lJSwYpi2PBZyRy1XI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kS4Bw6eonrmOxVd8H1KySUKUSRxh6hQvR6lZZGwrnPDK5h925kUt1sKm+qZXwhZuV
         J5MhbkvLxHN3dshiU9gqF1NFsUQQaoGfPJ4Wjlpj3Rw6uIy+3VgDnEh7GlXGhFKTIV
         nYvO/BxhR2xjoaRJ1WJmcCktguVmXPDpYiUj/rVk=
Date:   Wed, 20 Oct 2021 09:30:21 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     lianzhi chang <changlianzhi@uniontech.com>
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        jirislaby@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-input@vger.kernel.org, 282827961@qq.com
Subject: Re: [[PATCH v3 10/20]] input&tty: Fix the keyboard led light display
 problem
Message-ID: <YW/FjXp2Xdwapy/8@kroah.com>
References: <20211020064842.29573-1-changlianzhi@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211020064842.29573-1-changlianzhi@uniontech.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Oct 20, 2021 at 02:48:42PM +0800, lianzhi chang wrote:
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

This is patch 10 out of 20?  Where are the other 19 patches in this
series?

And your subject line should not have "input&" in it anymore, right?

thanks,

greg k-h
