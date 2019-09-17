Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B824FB5386
	for <lists+linux-input@lfdr.de>; Tue, 17 Sep 2019 19:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbfIQRCH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Sep 2019 13:02:07 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43078 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726134AbfIQRCH (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Sep 2019 13:02:07 -0400
Received: by mail-pf1-f193.google.com with SMTP id a2so2505040pfo.10;
        Tue, 17 Sep 2019 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yjvgVAX10hQcQOXmjulUL0Ymv6qJVhXERMjZnBg4j9w=;
        b=scfyELVARGy5wBalIBPt8LnpoigYHnVhVZEiO8VDh9a6rTTFRhvJHktQyrwfZLcM8x
         WMy2Lw3tTRZXw27paGJBSWKVTbRde9Wezl8e8E0uyhzzizLgGVU2Z1ZdlxFVuDjiqixm
         9dfaz3iZe9lLBpbgzUFQCW6HZFf8+XymgKHdzGA04dr5oQ+WyNq1Lffr5LMcfzyf3YP+
         Z/8laRTObqWcswe/p5P5cUl5dQm/f2cNuztS3p2t+jtNVj/HOOSsZZHLBuhVhblTr1Jr
         AtP4Z1ej6sOtEa+XOcyZ6hLmjmEO31PpXjQHNeTUjUMkOPha5FsEY5LnTwJZkYxW4PhC
         hahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yjvgVAX10hQcQOXmjulUL0Ymv6qJVhXERMjZnBg4j9w=;
        b=UHOyvD4nG7RtDEOm0dYqqD9Shi8pMFS3b2z0wXmT92mowReJEitqZqo+9aJalfiRsC
         Ljeu4Zu3nzn/jIiPT48TkzT2OIu2cOjncwzm+cOheiY/cN23d91SeCqqxkUMhvw1vZVf
         zWngUeDVuhLnK+iU8zaw0C8uEwjUmYUHbMuv9YfiIUCjfkZ+QUTk2B5j6vJB0YMWPACm
         h5DJKxEoMwqcMqqcI/ntx1qans0g66nXTQBbvxRHZ699Nkyyr4LgpQqhTwJwgML7eW8F
         o/sNmq7vw+wGHOYH/nsns4hArmP/tqQOH8CQ29ggOlhUq4qQOHBrapjyNe8Vw5tEQuhF
         NJLA==
X-Gm-Message-State: APjAAAXvOh8JraYTOL3va8AESKxh1krTZ5FtpKuVyMVZp0pSwAWWIWjv
        Lc4vBdS7phm1fktWzh3+I4c=
X-Google-Smtp-Source: APXvYqw73NBG3kowk41SxosYfL+G9OEk80H8tt7WWXPB4Niywp1W2jQUw9ceRRTQwzqEegqZhgZhRA==
X-Received: by 2002:a17:90a:3301:: with SMTP id m1mr6164310pjb.27.1568739726749;
        Tue, 17 Sep 2019 10:02:06 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id t13sm2916622pfe.69.2019.09.17.10.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2019 10:02:05 -0700 (PDT)
Date:   Tue, 17 Sep 2019 10:02:03 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        robh+dt@kernel.org, bparrot@ti.com, simon.budig@kernelconcepts.de,
        hdegoede@redhat.com, fcooper@ti.com, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/6] Input: edt-ft5x06 - add support to disable the
 wakeup-source
Message-ID: <20190917170203.GN237523@dtor-ws>
References: <20190917155808.27818-1-m.felsch@pengutronix.de>
 <20190917155808.27818-4-m.felsch@pengutronix.de>
 <20190917163215.GH2680@smile.fi.intel.com>
 <20190917164639.bsspf3xoqfggpxwj@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190917164639.bsspf3xoqfggpxwj@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Sep 17, 2019 at 06:46:39PM +0200, Marco Felsch wrote:
> On 19-09-17 19:32, Andy Shevchenko wrote:
> > On Tue, Sep 17, 2019 at 05:58:05PM +0200, Marco Felsch wrote:
> > > Since day one the touch controller acts as wakeup-source. This seems to
> > > be wrong since the device supports deep-sleep mechanism [1] which
> > > requires a reset to leave it. Also some designs won't use the
> > > touchscreen as wakeup-source.
> > > 
> > > Add a firmware property to address this. The common 'wakeup-source'
> > > property can't be used for that because the driver must be backward
> > > compatible with old firmwares which may assume the default on
> > > wakeup-source behaviour. So we need to go the other way by explicit
> > > disable the wakeup-source capability.
> > > 
> > 
> > > [1] https://www.newhavendisplay.com/appnotes/datasheets/touchpanel/ \
> > >     FT5x26.pdf
> > 
> > Please, don't split URLs
> 
> Hm.. then checkpatch complains.. If you prefer it, I can change it in
> the v2.

Checkpatch complains about valid things and it complains about insane
things. In this case simply ignore it.

Thanks.

-- 
Dmitry
