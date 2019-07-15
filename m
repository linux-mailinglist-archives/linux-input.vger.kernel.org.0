Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A1C869AC5
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 20:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729486AbfGOS2B (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 14:28:01 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37287 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729441AbfGOS2B (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 14:28:01 -0400
Received: by mail-pl1-f193.google.com with SMTP id b3so8723678plr.4;
        Mon, 15 Jul 2019 11:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vV4WIuFVWSowVxdcBrDNJldP8oVRmJNjbPGIqETShrE=;
        b=MEY12os+XMnEhWg5GfwUXvxRHvRARG9u3PP1fHshEFmvGirCUi0JasnGNtrAJqT1ij
         nBEzXGZ9lTlVtgd5nwQ7+x9OwTDJ99KYwonSWpiSa7Oo+ukvzxWh75eZpC6v3q3HJyuC
         rMLTeFMwCjyBVfw6osNYtIPMm37UG0D97sBLWSZZatYkCDG75lvlxOrdavJAy2hh7JGo
         JjzqgOnNr7aRyRyNU+c3QOk4nAiGwnZjPbxVA69QzlDNfIsw7cvmxLdP137T/0HVfEHn
         ogj/Iggc067Ql/yR8TOFab0eISpJYwghOt2VZP9QxoPpbCXEtMVsaBfa8mABzFlCNQXs
         ULeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vV4WIuFVWSowVxdcBrDNJldP8oVRmJNjbPGIqETShrE=;
        b=rGF8uRFD3T4IRnK/eZVo0eO4yB3DWjHKWFHJMWEvLiPyQDUwmtAXrhY8SsNo1NayH/
         V2BtkSYY6BcN0NmenHrqyycIfbFU+aNTu+XB3HxbJ8lrBP9PjBL4k2XwjWO6QOss6FuP
         +XMO3C1/aFf/swArPxhcPAMlxb3q/RdESQDi4LL70mJRsRNfvReVjdG/uxoObah10vYj
         r9z7+3HRebvskQ1eeTK+kV8P5q4ElF902UG3C1zh8mIgiwSW1poENtolZNgbTVkhn7eA
         3Qg9MMiiobh9Nwd5jUaB4vtuX65rTdDUIQQGMUd1p1/vfkhi60nNNCWn/qaNLNoL+1IG
         vNrA==
X-Gm-Message-State: APjAAAU1LFrxEx0UyxWU+LoC/HLFx5va8afzwA4pj78y76ioXwEWFrAL
        ch0HGEkB4+O5hFOFbbBthZanLj/JfO8=
X-Google-Smtp-Source: APXvYqwlQxaYtQ3W9asliY6NCAax9aqzBq50Uyb9WkSepsFTF+isUMy3YX5bQI8ifKgEeEUm4dLi+Q==
X-Received: by 2002:a17:902:100a:: with SMTP id b10mr4158933pla.338.1563215280259;
        Mon, 15 Jul 2019 11:28:00 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id z20sm28673126pfk.72.2019.07.15.11.27.59
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 11:27:59 -0700 (PDT)
Date:   Mon, 15 Jul 2019 11:27:57 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v2 2/3] input: touchscreen mc13xxx: Make platform data
 optional
Message-ID: <20190715182757.GA136092@dtor-ws>
References: <20190711222346.5245-1-lukma@denx.de>
 <20190711222346.5245-3-lukma@denx.de>
 <20190715071048.GB153485@dtor-ws>
 <20190715104344.3f17b660@jawa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190715104344.3f17b660@jawa>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 15, 2019 at 10:43:44AM +0200, Lukasz Majewski wrote:
> Hi Dmitry,
> 
> Thank you for your reply.
> 
> > On Fri, Jul 12, 2019 at 12:23:45AM +0200, Lukasz Majewski wrote:
> > > From: Sascha Hauer <s.hauer@pengutronix.de>
> > > 
> > > The platform data once was optional, make it optional again. This
> > > is a first step towards device tree support for the mc13xxx
> > > touchscreen driver.  
> > 
> > I would prefer seeing it together with patches introducing device tree
> > support.
> 
> Ok, I will merge this patch to patch 3/3.

Uh, I must be missing something, but I do not see anything dedicated to
device tree handling in 3/3...

Thanks.

-- 
Dmitry
