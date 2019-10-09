Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB9AD173D
	for <lists+linux-input@lfdr.de>; Wed,  9 Oct 2019 20:00:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731392AbfJISAT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Oct 2019 14:00:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731287AbfJISAT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 9 Oct 2019 14:00:19 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 136BE206C0;
        Wed,  9 Oct 2019 18:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570644018;
        bh=OJG+giJe+Q7Ljx6NMncXKgZJ6O3ww3uJa7HPqGYceLk=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=tm0GHkhrtvG2djQkr2yzL5Bk6qnl7ExoOkV17uHfLmE2IyLg29ka6jjl4o033K0zV
         NSKkNh8xzW58S2EhwMRplEhHzDSFD3rNc0AIX7haoViveORm7CwrydGOxwVSwkRZvr
         XAECrQzVYtWbh241+pJ5wuAfvkHUdsa25SwmgVXI=
Date:   Wed, 9 Oct 2019 19:59:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
cc:     Candle Sun <candlesea@gmail.com>, benjamin.tissoires@redhat.com,
        orson.zhai@unisoc.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Candle Sun <candle.sun@unisoc.com>,
        Nianfu Bai <nianfu.bai@unisoc.com>
Subject: Re: [PATCH v2] HID: core: check whether usage page item is after
 usage id item
In-Reply-To: <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de>
Message-ID: <nycvar.YFH.7.76.1910091958120.13160@cbobk.fhfr.pm>
References: <1570625609-11083-1-git-send-email-candlesea@gmail.com> <d739f691b677fb3ed88a23476d221527a87c363d.camel@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 9 Oct 2019, Nicolas Saenz Julienne wrote:

> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 3eaee2c..3394222 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -35,6 +35,8 @@
> >  
> >  #include "hid-ids.h"
> >  
> > +#define GET_COMPLETE_USAGE(page, id) (((page) << 16) + ((id) & 0xffff))
> 
> Not sure I like the macro. I'd rather have the explicit code. That said, lets
> see what Benjamin has to say.

Not sure about Benjamin :) but I personally would ask for putting it 
somewhere into hid.h as static inline.

And even if it's for some reason insisted on this staying macro, please at 
least put it as close to the place(s) it's being used as possible, in 
order to maintain some code sanity.

Thanks,

-- 
Jiri Kosina
SUSE Labs

