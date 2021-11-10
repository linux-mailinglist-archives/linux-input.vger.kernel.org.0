Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D744244BBA3
	for <lists+linux-input@lfdr.de>; Wed, 10 Nov 2021 07:24:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhKJG11 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 10 Nov 2021 01:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229731AbhKJG10 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 10 Nov 2021 01:27:26 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDCBFC061764;
        Tue,  9 Nov 2021 22:24:39 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id gt5so711166pjb.1;
        Tue, 09 Nov 2021 22:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X8Y4mryIZvDcMx/ySuKm9FHgIZsKCOnrCg4bYK3dpLw=;
        b=GbiFyJ5WpH8n2YlDA6MEOs1D9rWDpN/YQjXYRZOX4h7xBeVNWt4otlxgXN3/mt0sxz
         EGD/RkB6eM8lOb1baYd1bZzaUL5+h/7MTxa8gPIx4sorHbIZ4Vi/kwFte2jqkBOBFtPu
         a7wahZuQjIvKiJ38cZ6TCn+gKd0fkrrY2Vk45vR7H5i5GItjzQJ1Y36xr16IvbZhCeXM
         kTP+UzrtpT1+cmSqpaCpR1FkvloO490pP4XifaE2hUfVxVTXVzoagZoomg34Rc+ogtR1
         pru1bCUGMYvO8r7kyopSX0hvgDw1uT6KfhDY3BpmwkChLyxRsSx+gnAUBDGjqCSFCnIN
         flRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X8Y4mryIZvDcMx/ySuKm9FHgIZsKCOnrCg4bYK3dpLw=;
        b=4C4j4HECAaXIe8jELftjhaVKKGo8z2E8tLPmXOxQXq2umhfGdjjCTLhEhB7UytO23j
         gVaCKymA5VMBLW2CF/n/LJRVLHv+ppchUnISZQ1guS8sl07I86KMgJTPNyKI/mFHlHkW
         /KLGOM1Ia2cP859JqkctARLvD75cgXrGraQhPXyzCpC5aaA2GNLyA6qUs/TNGRegNHSQ
         yzKbnhuxSx8/FkKofL1zYneUtYz+2bkvnL/eqz57F+IVMnrsI2eRb4p+KpbTEQW6w8/B
         rWLA7Rbo9SMymF5qpwdOJd1bVJiZFi7NKYfer/cqgAqwO4lBnjGptwQ7lFkRacpEv11W
         S/og==
X-Gm-Message-State: AOAM531iSSXpgxGqYGK67JPfgVpOdpL7C7c8GsRUOBpVtKb7u4XWvOfe
        lHwGRudajc8dvFtLoC7J8+EV9VShceQ=
X-Google-Smtp-Source: ABdhPJyXPzyDpZ7X4tuP6DPWOENAd3jtXjqMaR+gfrMjEY3AI26YBlmtYdi1y1fq1AOY1D4MOzZsyA==
X-Received: by 2002:a17:90b:1c06:: with SMTP id oc6mr14214654pjb.126.1636525479052;
        Tue, 09 Nov 2021 22:24:39 -0800 (PST)
Received: from google.com ([2620:15c:202:201:b345:ee3a:151d:b1d1])
        by smtp.gmail.com with ESMTPSA id pg13sm4718306pjb.8.2021.11.09.22.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 22:24:37 -0800 (PST)
Date:   Tue, 9 Nov 2021 22:24:35 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Yufei Du <yufeidu@cs.unc.edu>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        jingle.wu@emc.com.tw, josh.chen@emc.com.tw, dave.wang@emc.com.tw,
        phoenix <phoenix@emc.com.tw>
Subject: Re: [PATCH] Input: elantench - Fix the firmware misreport
 coordinates for trackpoint occasionally.
Message-ID: <YYtloz8RA3enzkNZ@google.com>
References: <20210729010940.5752-1-phoenix@emc.com.tw>
 <000001d79d99$53762dd0$fa628970$@emc.com.tw>
 <YS0+TU21/nok6Ge9@google.com>
 <3a98b10e-6b78-b769-e22d-2496d7bcd69d@cs.unc.edu>
 <YYi+ZoeGtFO+/HYO@google.com>
 <de131144-b396-1f94-70ab-7d13dcd3a16f@cs.unc.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de131144-b396-1f94-70ab-7d13dcd3a16f@cs.unc.edu>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Nov 08, 2021 at 01:14:44AM -0500, Yufei Du wrote:
> Hi Dmitry,
> 
> > Sorry I lost track of this patch. Can I add your Tested-by to it before
> > applying?
> 
> Sure. Thanks!

It is applied now, thank you everyone.

-- 
Dmitry
