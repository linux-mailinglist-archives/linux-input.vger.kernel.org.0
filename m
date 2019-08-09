Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26CDF87C99
	for <lists+linux-input@lfdr.de>; Fri,  9 Aug 2019 16:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406285AbfHIO0x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 9 Aug 2019 10:26:53 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36999 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHIO0x (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 9 Aug 2019 10:26:53 -0400
Received: by mail-pg1-f196.google.com with SMTP id d1so13133724pgp.4
        for <linux-input@vger.kernel.org>; Fri, 09 Aug 2019 07:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NJo+pVqMDNA4smLIKs9RuPihrAcF5xIPFF0cyL9uEB8=;
        b=LtWe6SoDdt9Nz/G9FRBYzCWr+fs+Q/uV+bN50sYeEJwHSsk9L57wWMnoIulh9yrTHn
         j96VyOt3pQdb+u2woSXhGgC2BjLxzOpjahC8GK1y3iTECMqRrBDszibYeT8u/3w4bcl6
         iFJm1tiCX5zmdQBLLzH7wA0xqaa7vz6aQQdcoQtmyDS5mRx9nWO7ijLEzqRAaXOq1TBX
         XHkST29W0OHwHMyYiXaXd603lWE3Oi2rp/qHXN6Tb0EhnngC1go8ULR0N8TeUTVq2ujN
         DxQhgt5XyMZqFdq2BEGExwt5sgC8IfhZ2mdR+d+82hCD925vwhPXL/SG+WA2CofvckTR
         DwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NJo+pVqMDNA4smLIKs9RuPihrAcF5xIPFF0cyL9uEB8=;
        b=nkV+bn3gsWu/TG+VuRoUg1wwMmAOKBjBqrz3jwsdEOVD5X34On9zgAH40OungJpI0P
         acC7tNwB6dczI7nzrpVvaST5yPwvnaM7YkrAeP307HNf+IsviKcdJUFTBqIb7JLnvCYw
         XxBt1LQRkQ7H8vGeXKVWkt1bOHuL0szd6elBnLbjf1tuXEse/Vyoyl9Az2CAaQPX2LtE
         VHGu8QBhmYKRBWXs0pROXSZga16Tiuc92DRvJUZ9pL2QrxGpT9YTVrIuykqZ4yppRM5s
         BzvDnDThJve//KCufuDfrBiIYyCCancL536OqAkvf5oKIm6t/UTL8K75oOebje1KorFS
         7olQ==
X-Gm-Message-State: APjAAAVjnxjLj1x6QCFJ9cxGX062yxWPWRS8ngOBxwlNCvdM5LI3aNE0
        j8PaYnFKkvxApG4iq1BeWDs=
X-Google-Smtp-Source: APXvYqzvbSavNv8CLEyCXVESDM8SVWJEk+VLhJvkW4CDMtrPnf5eIsDB4uYqWOTjikPs45T7g6z9Rg==
X-Received: by 2002:a63:61cd:: with SMTP id v196mr18035947pgb.263.1565360811888;
        Fri, 09 Aug 2019 07:26:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id y23sm105116128pfo.106.2019.08.09.07.26.51
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 07:26:51 -0700 (PDT)
Date:   Fri, 9 Aug 2019 07:26:49 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Linux Input <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: bu21013_ts: Convert to use GPIO descriptors
Message-ID: <20190809142649.GH178933@dtor-ws>
References: <20190808144458.1258-1-linus.walleij@linaro.org>
 <20190808190334.GE178933@dtor-ws>
 <CACRpkdbp20f2D8ezPiLdSjpxYvq0OkM9rnGJocT8trj2Jyb0aQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbp20f2D8ezPiLdSjpxYvq0OkM9rnGJocT8trj2Jyb0aQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Aug 09, 2019 at 10:10:59AM +0200, Linus Walleij wrote:
> On Thu, Aug 8, 2019 at 9:03 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > Do you have a device to test this on?
> 
> Actually, yes! I will try to kick it into action and mention in the commit
> that it is tested on that device.
> 
> > I am not very fond of mixing up
> > devm and non-devm resources, so if we are cleaning it up I'd like to do
> > more cleanups...
> 
> That's fine. I will send some cleanups and move more stuff to
> devm_* when I have the device up and running.

Hold on, I have a few patches, I'll send them your way later today.

Thanks.

-- 
Dmitry
