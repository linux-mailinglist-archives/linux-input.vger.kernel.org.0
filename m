Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAB06526060
	for <lists+linux-input@lfdr.de>; Fri, 13 May 2022 12:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379574AbiEMKr5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 13 May 2022 06:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379329AbiEMKr4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 13 May 2022 06:47:56 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C3A23EB4B;
        Fri, 13 May 2022 03:47:53 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 5EC4D68B05; Fri, 13 May 2022 12:47:49 +0200 (CEST)
Date:   Fri, 13 May 2022 12:47:49 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        bugzilla-daemon@kernel.org,
        "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Satadru Pramanik <satadru@umich.edu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [Bug 215890] New: Regression in 5.18: bcm5974 trackpad causes
 error: xhci_hcd rejecting DMA map of vmalloc memory
Message-ID: <20220513104749.GA2634@lst.de>
References: <bug-215890-208809@https.bugzilla.kernel.org/> <76e24afa-ad7d-bf6d-d610-df61851b3e2b@leemhuis.info> <8365ac4b-c45a-dbff-eed1-8ccc88a8d02f@leemhuis.info> <20220513103724.GA2289@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513103724.GA2289@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 13, 2022 at 12:37:24PM +0200, Christoph Hellwig wrote:
> > #regzbot introduced: f5ff79fddf0efecca538046b5cc20fb3ded2
> 
> Well, this just uncovered an existing bug in the driver.  You can not
> just dma map memory returned from dma_alloc_coherent, and this driver
> would already get vmalloc memory on arm/arm64 platforms anyway, we
> now just do the same on x86 as well.

From a quick look through the trace it seems somehow
usb_hcd_map_urb_for_dma tries to create another DMA mapping for a buffer
allocated from usb_alloc_coherent that uses a dma coherent allocation
below.  It really needs to use the dma address returned from
usb_alloc_coherent instead of trying to map the URB again.  But I don't
have the slightest idea of why that only happens for this particular
setup, and I really need some helpe from the usb folks to untangle it
