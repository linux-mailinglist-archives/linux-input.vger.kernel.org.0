Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E23A109B49
	for <lists+linux-input@lfdr.de>; Tue, 26 Nov 2019 10:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727408AbfKZJej (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Nov 2019 04:34:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:49504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727400AbfKZJej (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Nov 2019 04:34:39 -0500
Received: from localhost (unknown [84.241.194.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A9E8A206BF;
        Tue, 26 Nov 2019 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574760878;
        bh=Ohbjea8qptAUUQ/O12H8GrlNo7892ZclhwRkAsG3+9Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C4RTBtf+Em9QDnGqGAVZjFoEs/jSF0Olq/p4PV+O+slBrxWDegQNKkWlK99CcHQWi
         N+2TPWflx7CTfiTvFkRr4kWtxwQQVs6ol1Wgz9qrnj8L3MbEYruFxzC/IqhVFqe4hF
         2S6CdXOHyy808Cj4LIRPMNvyUrU/EC0TqwELMQhk=
Date:   Tue, 26 Nov 2019 10:34:34 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Navid Emamdoost <navid.emamdoost@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Richard Fontana <rfontana@redhat.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        emamd001@umn.edu
Subject: Re: [PATCH] Input: Fix memory leak in psxpad_spi_probe
Message-ID: <20191126093434.GA1383178@kroah.com>
References: <20191121200115.24846-1-navid.emamdoost@gmail.com>
 <20191122190208.GA248138@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191122190208.GA248138@dtor-ws>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 22, 2019 at 11:02:08AM -0800, Dmitry Torokhov wrote:
> Hi Navid,
> 
> On Thu, Nov 21, 2019 at 02:01:11PM -0600, Navid Emamdoost wrote:
> > In the implementation of psxpad_spi_probe() the allocated memory for
> > pdev is leaked if psxpad_spi_init_ff() or input_register_polled_device()
> > fail. The solution is using device managed allocation, like the one used
> > for pad. Perform the allocation using
> > devm_input_allocate_polled_device().
> > 
> > Fixes: 8be193c7b1f4 ("Input: add support for PlayStation 1/2 joypads connected via SPI")
> > Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> 
> This is fixed in the current version of the driver, but you can send it
> to stable@gerkernel.orf with my

Was it fixed by any specific patch, or just a side-affect of some other
larger change?

thanks,

greg k-h
