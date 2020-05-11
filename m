Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B01C1CE20D
	for <lists+linux-input@lfdr.de>; Mon, 11 May 2020 19:53:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgEKRxi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 11 May 2020 13:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726310AbgEKRxh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 11 May 2020 13:53:37 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B47FAC061A0C
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 10:53:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so5069972pfa.9
        for <linux-input@vger.kernel.org>; Mon, 11 May 2020 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Rjlg80nGFm4D0dkaxgb97IJA/DtpQ+i5HvnMwLg8crg=;
        b=as0XLWM5PA1P/2xapiz2zNG5RUTdFPwVmXbjcfFO2SQZ1abPyqOEGrZTL2VPNBtBUy
         qzrvgKtXWvegJDfqo/3pHlk0seJRhteLNRo3ny/sdjImM6ffF4rwAs64Ot8/nGtrdPP1
         UsicvHDV+NdzBc3ZJGdZ8OQCA0rUmANMJJ9pxhABHUoTRvQyAvDiSoR5n3THQQzLRRP/
         vK83PAX332+6m9QZMn0Wp7BdRkTarDDouN2DT7cQnlgOyU7NmyftuPQXalWxSJGWcxp5
         3P8xZqlPvkgQiCKna9mIwwsDs66aq5d36tyfPyDeUrJYN5Cc2eunJ4sBkfqqK08t91pW
         CLPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Rjlg80nGFm4D0dkaxgb97IJA/DtpQ+i5HvnMwLg8crg=;
        b=T2JWJQOIESSNMesvjvRL5uIKy2utNfudoS6NlfS3aYl3CZIW63C5Lq+nx6+RNvnfKa
         Z8sI2Dy269n1tmLcGocZsmm5zpU1mSqOSES/CL42n7qnN0XvpUssBfnfmdyFR5k9F5fA
         lZwcj0BbMjlckK6WhtW+vi5wpEt4KsLFv5Owm//uakLwqTV06nxv6NEnXoEt8yp93UYf
         f/YCQVLj2mGc5buccnR7ZRKxMzCs6d+ippyX4Qz+zNtOU4G8v2e8QlD8vrUo3NkH361Z
         Nfnb0SxPNS5fvgNFKBF7fdgaxtNWUBaTjNv4rh1294d8SnTiduALUPgjqTikWkfxQYFs
         Kw8Q==
X-Gm-Message-State: AGi0PuZwKBD89Jar/juvQOkWlsV7oWdWwFeJMN4f0l9S6hVRRC2ZFZlU
        jPzDxy6UDpPoIwyuzatKbXuiNtx/
X-Google-Smtp-Source: APiQypIBKcP+6yLHWhhDCidI1PowxpCAFOYS4GKklzs/SMYC/mCCAjOPyFiRbwwBlHmcpd3NsA45bw==
X-Received: by 2002:a62:b514:: with SMTP id y20mr16897570pfe.49.1589219616932;
        Mon, 11 May 2020 10:53:36 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id y14sm9665718pff.205.2020.05.11.10.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 10:53:36 -0700 (PDT)
Date:   Mon, 11 May 2020 10:53:34 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     andriy.shevchenko@linux.intel.com, hdegoede@redhat.com,
        LW@KARO-electronics.de, linux-input@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 1/4] Input: edt-ft5x06 - fix get_default register write
 access
Message-ID: <20200511175334.GS89269@dtor-ws>
References: <20200227112819.16754-1-m.felsch@pengutronix.de>
 <20200227112819.16754-2-m.felsch@pengutronix.de>
 <20200509190524.GN89269@dtor-ws>
 <20200510110644.7ynyfmdhnrl57auk@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200510110644.7ynyfmdhnrl57auk@pengutronix.de>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, May 10, 2020 at 01:06:44PM +0200, Marco Felsch wrote:
> Hi Dmitry,
> 
> On 20-05-09 12:05, Dmitry Torokhov wrote:
> > Hi Macro,
> > 
> > On Thu, Feb 27, 2020 at 12:28:16PM +0100, Marco Felsch wrote:
> > > Since commit b6eba86030bf ("Input: edt-ft5x06 - add offset support for
> > > ev-ft5726") offset-x and offset-y is supported. Devices using those
> > > offset parameters don't support the offset parameter so we need to add
> > > the NO_REGISTER check for edt_ft5x06_ts_get_defaults().
> > > 
> > > Fixes: b6eba86030bf ("Input: edt-ft5x06 - add offset support for ev-ft5726")
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > 
> > I'll apply this, but I wonder if we should not move this check into
> > edt_ft5x06_register_write(), and also have edt_ft5x06_register_read()
> > return error if address is "NO_REGISTER"?
> 
> I tought so too but I wanted to keep the fix small and backportable.

Any chance you can make a follow-up patch so that going forward it is
cleaner (and the fix can still be backported if needed)?

Thanks.

-- 
Dmitry
