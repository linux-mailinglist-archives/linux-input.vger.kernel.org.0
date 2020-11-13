Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797F52B13FC
	for <lists+linux-input@lfdr.de>; Fri, 13 Nov 2020 02:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726112AbgKMBq4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Nov 2020 20:46:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgKMBq4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Nov 2020 20:46:56 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBBFC0613D1
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 17:46:56 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id f18so5782920pgi.8
        for <linux-input@vger.kernel.org>; Thu, 12 Nov 2020 17:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qly18dz0TmLULGflJqcSslqPheE2jD9TwxhHosOYqWQ=;
        b=oofngI2ZBAFXz6wJ639nN2uIFU/hjn/Nnu7mG6djatoKImQinqI+ReIUQaklUPNjzl
         nC5+sHNWDC4NQ13XiBKjD7IeJP88sw2ued/VRynfFRO+HyLmVl/lVIlZqHWy5FBhTJYC
         hPW+1ML3pwmmlIPpg785ry0ZbMLUe896PiGXm3yoIjAbiKvP85Ym7uh5haPXge2NgWc3
         eToGKryCx9WYuJS3lV5Wi+ZavVxVSXOntLNa4l0OTU7WRI/oFVrysj3mRm/hvJyABi18
         hECqOnw7ADNiNmaHnOjh5F4CIONO9zC7j4MPG4KyRQ8BYy/0MRCWKsQjXS0rMK7u6q/I
         tieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qly18dz0TmLULGflJqcSslqPheE2jD9TwxhHosOYqWQ=;
        b=jhKHF1a6MDW5fRrZtEuyzqOFi2ojGYaRv3xOS4lWe2CFHYeKoe3EPYtgkt0PIEj91z
         2Rj0zLuqCUWyG6JjyvmowIaWs0rpG8qYaKfh4/CHqSYtNAGbca7ymr/mqw7jKckZxt8K
         9SU2VvNDvu14P2IdOqixJynyAqfdcnFKaASjaejaABEgKhPL/t5SILuF2/b/Ku54yOzI
         92PryAwJGc5v/tQ8o22HykhiPbKbzLVDa5DP/7gj5SCwa8XnGZSCNdqdZXw6V9NhDoYC
         kJNiJqkvUTPCxXJ61BtPENL37rv1jyCqD0D1n9gfHMs/bfCiy487V0g8+rAx5Nb2qT8e
         /xMw==
X-Gm-Message-State: AOAM532ghiabn9FhfnTetix10162zKfr1JZoFyp6IDNgBhLp8gQXX9eU
        se4YLP5MU09b2G2bBaRcDAEEG8INJ8I=
X-Google-Smtp-Source: ABdhPJyRHmOVfhItIbLT8tryvxITiAII+EjfKsm1oSFI9w2N5NOK6+JSVCH7LfJXEyfGBzO1e9GasQ==
X-Received: by 2002:aa7:9e90:0:b029:18b:a94:3498 with SMTP id p16-20020aa79e900000b029018b0a943498mr1956406pfq.54.1605232015601;
        Thu, 12 Nov 2020 17:46:55 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id b29sm8068378pff.194.2020.11.12.17.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 17:46:54 -0800 (PST)
Date:   Thu, 12 Nov 2020 17:46:51 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     linux-input <linux-input@vger.kernel.org>
Subject: Re: Is delayed work's precision good enough for input-poller?
Message-ID: <20201113014651.GB356503@dtor-ws>
References: <e1d48a94a9f080534d4940048081d5ecdc64d4e9.camel@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1d48a94a9f080534d4940048081d5ecdc64d4e9.camel@suse.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Nicolas,

On Thu, Nov 12, 2020 at 04:30:49PM +0100, Nicolas Saenz Julienne wrote:
> Hi everyone,
> I just found about an issue in the downstream Raspberry Pi[1] kernel that I
> wonder if it'd be worth fixing generally. The official RPi DSI display
> touchscreen uses the polled input interface. The ts chip works at around 60Hz,
> and that's the period the driver is configured to use (17ms). This doesn't play
> too good on systems with low HZ (100/250). Users complain that in practice they
> experience, at worst, half the event rate. This is due to the rounding error
> when converting milliseconds to jiffies, general system delays, and what not.
> 
> We could somewhat fix this in the driver (raspberrypi-ts.c) by playing with the
> poll rate. But it seems pretty hacky and would ultimately stress the CPU
> unnecessarily. I wonder to what extent it makes sense to move the
> implementation to using hrtimers whenever the poll period is in the same order
> of magnitude as HZ's delta.
> 
> Any ideas/comments?

The polling function in the poller is supposed to be able to sleep, so
you will still have to schedule work which will introduce additional
delay.

If that works for you then I'd be OK with switching to hrtimers for
small poll intervals.

Thanks.

-- 
Dmitry
