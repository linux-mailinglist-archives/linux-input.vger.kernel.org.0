Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C587FA2460
	for <lists+linux-input@lfdr.de>; Thu, 29 Aug 2019 20:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730057AbfH2SWt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 29 Aug 2019 14:22:49 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:43409 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727894AbfH2SWs (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 29 Aug 2019 14:22:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id 4so1951486pld.10
        for <linux-input@vger.kernel.org>; Thu, 29 Aug 2019 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WG33S5Y2v71cgp8eaKKlmVyiOujXtYDT4ZGnTgalxMI=;
        b=d7B7wAkkAS9y3Z80ZqT1yHgEkXcaGVRrBNQp9GdFwnTumFkRqWNT2QaBPSyRyWEalo
         JC6a85ZF4JdLg3DpWuov6sq7ER+t0GwyIWwaMza42zffJSWwrN+PH+yqcYfQCyRT+s0F
         RQoZNLsytG3ZgpsQynWdJlQ9nS/hzxWvi5M8Ht3sbUK5nP9sIuyy8ZCOYF8/8vnVYN0t
         DDKABe2SP/BgZmxhqHOF5VQVWNucb2BWV12VvDIQqNOxwO5VKp3hOLFYqrOr4LhwPnUm
         rtEQfn3/Qse1FEVPVfyXc91jX8n9mGvfYIkWw8D6HUZrkLk1xYOd2Rk3b4XvyJTtTajL
         wBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WG33S5Y2v71cgp8eaKKlmVyiOujXtYDT4ZGnTgalxMI=;
        b=ZcsLhElmI4f5gnnF8UM0LGBAME1bt+RSDWB7LjKDAi+9ChElEBP6d2FOCVpKDcsA7E
         UvbAuTDSlXjMcfFi+ymagmkAdqUtqeGL0ktnLgEpPf4BAAVdLaUeml94gIFGinb4aowa
         QmU7I+DEFRLD7h4Cak/8vwgI0HgKrG5/BcYprNLodbu0ZKJiY6CupGqNGAQzOMOcR6q0
         7XfWcPiXSau7ULdONAHIdyy7RdxQGJOnUXz836ezEljUkYGbE50zja4QRYB8lzDQVM+W
         rTj4KHKXrMUo962b/WpRZisP2wje5qHsK6nP/8rcjFf/zG1FKTPQuo1yCaiKFoVbhQzr
         bObQ==
X-Gm-Message-State: APjAAAVfXEDRLvsP1IOxh/cV5FfCPqqZxLT9CWq3fHXDrhYQ6B5WGMgF
        RGfk6WQf45Yl9z/hBpnJHfs=
X-Google-Smtp-Source: APXvYqxbO/cew6/ZeECdyx+AjxNrqQfPIhTjZd+V9DsCoPnlHDALG2ceho1ElZotyw4z/BvRv8fi+w==
X-Received: by 2002:a17:902:1e6:: with SMTP id b93mr11282463plb.295.1567102967543;
        Thu, 29 Aug 2019 11:22:47 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id q8sm2365184pjq.20.2019.08.29.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 11:22:46 -0700 (PDT)
Date:   Thu, 29 Aug 2019 11:22:44 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Atif Niyaz <atifniyaz@google.com>, linux-input@vger.kernel.org,
        Alistair Delva <adelva@google.com>,
        Tom Gall <tom.gall@linaro.org>,
        YongQin Liu <yongqin.liu@linaro.org>
Subject: Re: Possibly -next regression from "Input: allow drivers specify
 timestamp for input events"
Message-ID: <20190829182244.GC187474@dtor-ws>
References: <CALAqxLWRV2A3cGUgKfX2j1RPruESTqhG+stXCfrFTL8XaM4UWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWRV2A3cGUgKfX2j1RPruESTqhG+stXCfrFTL8XaM4UWQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi John,

On Tue, Aug 27, 2019 at 02:54:17PM -0700, John Stultz wrote:
> Hey Atif,
>   I was testing today's -next with AOSP on the HiKey board and was
> seeing some odd mouse behavior and I've bisected the issue down to
> commit 3b51c44bd693 ("Input: allow drivers specify timestamp for input
> events").
> 
> In the logcat log I'd see a number of:
>  I InputDispatcher: Dropped event because it is stale.
> 
> Usually it would seem like flings weren't really responding right, and
> then the UI would basically freeze for awhile (even though the mouse
> cursor could still move around, the UI was just ignoring new input).
> 
> Just skimming the patch, It seems like maybe we're hitting:
> 
> if (!ktime_compare(dev->timestamp[INPUT_CLK_MONO], invalid_timestamp))
> 
> check and the device timestamp (at least occasionally) isn't
> zero/"invalid" but also isn't actually correct.
> 
> If I comment out that check, and always call input_set_timestamp(dev,
> ktime_get()), the issue seems to go away.
> 
> Do you have any suggestions for me to try?

Ah, of course, once we hit it first time, we set the timestamp, and then
it will become stale.

I guess we need zero-out the timestamp on input_sync(). Can you please
try doing that?

Thanks.

-- 
Dmitry
