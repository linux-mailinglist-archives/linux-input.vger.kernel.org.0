Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A979927B7FB
	for <lists+linux-input@lfdr.de>; Tue, 29 Sep 2020 01:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbgI1XUo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Sep 2020 19:20:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbgI1XUk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Sep 2020 19:20:40 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD94C0613D3;
        Mon, 28 Sep 2020 16:20:40 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id h23so472598pjv.5;
        Mon, 28 Sep 2020 16:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vsuWKLnYeMqAepqrk/6lbvj79XMPNhiuP6mG1PfPe34=;
        b=DAQE/OdpvMJty/PiUP8m7WDGj6XUkYKfRqvj+WvEeZVXQRMyX59ZrFxphPrwEv/sSB
         DEPkdlaK7CEK0qnn8TQCOmRQYNjTYT62tmIcBKq7k/50TmYoH1cgFE0iSplexDtWUqLb
         LrKLjDmK316DV5PBWiSf5zgDFwRFKis51FBufthjbjgNek9tpA4jlYGplHDUIZRir7G0
         gSPaJ4k5B+ZF26WgZk805tBHginmGRRw4sR2pET6Fy2BhInqwKVoK3wRvdfzyTAcVkSY
         64bFaHmO4BXEtHkvKD9id5Qaid5seBa3etIWSrTo4HBtCodz9xu9S6uw963e4tUrGDOU
         x+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vsuWKLnYeMqAepqrk/6lbvj79XMPNhiuP6mG1PfPe34=;
        b=k7b0wAcsTWZkpEcAhaZ1mEbLbDI4PQS+rTFsKv9Pur+2UoqJFrSNa6agzLS9s+QtAs
         CWNeBhcCse8BPjCkpSITWJGeYHO9mzMrhG/xKxt4yuP8GDUOUChxqb18aoVNdT8UCbKx
         oPr7bCCwaxY9M9P4lhN5tvUq+RVJ/HwMiHnENA357ylbxg8eNkTreh40tJrPoweQhTGy
         1x8fgIvHl+G0rBCDhkCT2GhzEKH9NeXWQxH3OFiAWlzActKGrFGoXEmODNrX1vR9lFEN
         bcKYQ/I8eozGnRZFWfsT+uKpfTN70+x3wxfqwtnRiktomsmMmzzgFFnRQhVIqSUZT1hY
         IX5w==
X-Gm-Message-State: AOAM531JvL8hkujZ+F+0k4Nsw6QvuM6+v8x0L/Tza7wLmCfqk09UKp7p
        25OSi/7nUS7T6sd5dIR4S40bcUuWeTk=
X-Google-Smtp-Source: ABdhPJzuqkV3warjS17g8nEqlLRCjCj/XVrgIQpJq1/rLez4W9NX/3EmfOb1x4tS8XUkEAqvJjvmjg==
X-Received: by 2002:a17:90a:9415:: with SMTP id r21mr1324474pjo.180.1601335239742;
        Mon, 28 Sep 2020 16:20:39 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id y12sm2437659pga.53.2020.09.28.16.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 16:20:38 -0700 (PDT)
Date:   Mon, 28 Sep 2020 16:20:36 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vincent Huang <vincent.huang@tw.synaptics.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andrew Duggan <aduggan@synaptics.com>
Subject: Re: [PATCH] Input: trackpoint - enable Synaptics trackpoints
Message-ID: <20200928232036.GA2520341@dtor-ws>
References: <20200924053013.1056953-1-vincent.huang@tw.synaptics.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200924053013.1056953-1-vincent.huang@tw.synaptics.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 24, 2020 at 01:30:13PM +0800, Vincent Huang wrote:
> Add Synaptics IDs in trackpoint_start_protocol() to mark them as valid.
> 
> Signed-off-by: Vincent Huang <vincent.huang@tw.synaptics.com>

Applied, thank you.

-- 
Dmitry
