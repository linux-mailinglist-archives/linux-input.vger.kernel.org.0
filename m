Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96F202ED70A
	for <lists+linux-input@lfdr.de>; Thu,  7 Jan 2021 19:57:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbhAGS5h (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 13:57:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:40366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726326AbhAGS5g (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Jan 2021 13:57:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF96D23406;
        Thu,  7 Jan 2021 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610045816;
        bh=45f8KASW0Fu7tUm+Dkt9MA/Dys/qG3Qvhkz1nV7oF+w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z6eEr4w+MSGu2+K/9RX7GcDNB/RBBp3zccod4WgznbweMUNNPKLf2shwA1u/rXdf2
         pDWTt5pE+1DGmvS0+zwaVWv0yfFGNlisiC9bR8b4sC0QpbZnSEQQg8TxoWSqdPFZWR
         NiFAuH3vZio1vYAn+lP8cWg18rxiRxwAot3cr210=
Date:   Thu, 7 Jan 2021 19:58:15 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Barry Song <song.bao.hua@hisilicon.com>
Cc:     tglx@linutronix.de, maz@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxarm@openeuler.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] genirq: add IRQF_NO_AUTOEN for request_irq
Message-ID: <X/dZxzz5PA37Ie3B@kroah.com>
References: <20210105021411.34020-1-song.bao.hua@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105021411.34020-1-song.bao.hua@hisilicon.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jan 05, 2021 at 03:14:11PM +1300, Barry Song wrote:
> Many drivers don't want interrupts enabled automatically due to
> request_irq(). So they are handling this issue by either way of
> the below two:
> (1)
> irq_set_status_flags(irq, IRQ_NOAUTOEN);
> request_irq(dev, irq...);
> (2)
> request_irq(dev, irq...);
> disable_irq(irq);
> 
> The code in the second way is silly and unsafe. In the small time
> gap between request_irq() and disable_irq(), interrupts can still
> come.
> The code in the first way is safe though we might be able to do it
> in the generic irq code.
> 
> With this patch, drivers can request_irq with IRQF_NO_AUTOEN flag.
> They will need neither irq_set_status_flags() nor disable_irq().
> Hundreds of drivers with this problem will be handled afterwards.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>

Can you also convert some in-kernel drivers to this new api so that we
can see how this works?

thanks,

greg k-h
