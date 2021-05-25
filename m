Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E731738F8E3
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 05:37:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230010AbhEYDif (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 23:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhEYDif (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 23:38:35 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74187C061574
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 20:37:06 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id m190so21646234pga.2
        for <linux-input@vger.kernel.org>; Mon, 24 May 2021 20:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q2K7Ekmr0MyOBWRVtSmB0rSJcrKiIP5TauS2+nwyhso=;
        b=Ox3ETs5DoyQOOHfDP+sdH49aRPWnfuoNhbr4XeTh9UoT0JjO4o/aLmGGeskLAZUBWS
         2uKNIPWSJgi1LslOLBa1pYHRanPO+hlVp4cshJavp8bc5ev4MeYsggX9xpJrvv7W1GM4
         P16QI9KdoHAXHnu8QOYzXWqKKrvLlh1dgBYnHANj+1G4Fo1LRhk5QnSyhCFng9N5Yawd
         LvXfHXyFnOrNeyKMLVDzCwP5R76tvyxHMot42JMjRUyuRBgv52SeNjBi2eiRqrtz+pXx
         g/Bwvv9k0Lu0ixXi8O9sGsy3nXiWFBmzCtxeqvo70oCyxsak+n9ZR2tI6/0PdHJHEHUv
         iP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q2K7Ekmr0MyOBWRVtSmB0rSJcrKiIP5TauS2+nwyhso=;
        b=LRUUlXC6NW1CNB+eBthpFMlZYEN/DGZlaUv6zQMR34uNpsl2p+dHvhYGbzJxVaa/7u
         BjCxjmIjLU7f4YseT5eTtDXix5d+dgKL3PiCnXmcgNWLcWluxEzSXGnpjyBGz8H76+4Y
         fpRUaWQh3Gcf4KaMhfzagixEXfqNRqPfw2ZHKJkpIhZzoyZSKSMB9dMFGXXwfQy/n2Ic
         nAbfkK94uOxJXZeBlJtbf5bVy7Fi4xHFSXYkYo4GAj6dBva/cmjplwlZQfUsjh533rDH
         Nj1aa3rxE+eg1GB4DT/zub2vfzOno8xGHBWwYNKxPBZjjKFzOEHFbKZ9P/0IdA0P6rGo
         CCAg==
X-Gm-Message-State: AOAM532fqSmY3gLQEIzpzF93CUaqbiLYnwaB+nYnGkN/XPgv6ZoTnV3O
        UCMf0HqANHUg00RaGSI7PZA=
X-Google-Smtp-Source: ABdhPJw/FWUP+mo+qjnZnzJ4sPV8w7eO0T8wmc69zM3wppsGAfJKFTPXd8NXsVUJeDyTY/HBYfyMPA==
X-Received: by 2002:a63:d710:: with SMTP id d16mr16586559pgg.214.1621913825764;
        Mon, 24 May 2021 20:37:05 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:870d:a395:9098:674])
        by smtp.gmail.com with ESMTPSA id 136sm12132516pfu.195.2021.05.24.20.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:37:04 -0700 (PDT)
Date:   Mon, 24 May 2021 20:37:01 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>
Cc:     linux-input <linux-input@vger.kernel.org>
Subject: Re: [PATCH 1/1] Input: hil_kbd - Fix error return code in
 hil_dev_connect()
Message-ID: <YKxw3U7GlxT/BArl@google.com>
References: <20210515030053.6824-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515030053.6824-1-thunder.leizhen@huawei.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Zhen,

On Sat, May 15, 2021 at 11:00:53AM +0800, Zhen Lei wrote:
> Return error code -EPERM rather than '0' when the combo devices are not

I believe -EINVAL suits better here, so I used it and applied, thank
you.

Thanks.

-- 
Dmitry
