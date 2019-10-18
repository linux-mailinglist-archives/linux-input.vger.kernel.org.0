Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06802DCE6A
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2019 20:40:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394568AbfJRSk0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 18 Oct 2019 14:40:26 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45785 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394377AbfJRSkZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 18 Oct 2019 14:40:25 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so3811341pgj.12;
        Fri, 18 Oct 2019 11:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=E0Nr+xgvo/HGPyIRgeBTMe73qDbXu0iO1es6rYh3atw=;
        b=Bf5mqpce+ifo+PJO0O/SZ7JgDewHLwuztM3akSVpq1Vran9Cwo7TXbaD18j+XelfCz
         /vH1vTG4DsHYGzitLUHuNsDcjMGHoowXtcrHus+0aTCVda86N8BYRjPe84ybpLvopGC1
         0bTmUK8pxbRiyO3f67IAHOa+e0fYPtCyC7XEnyHkSQm3O7ozpLeaMNJfOVqLo2/esk0i
         gH1xIU1LRpcgoGHqQmw81kZNn9sjhBlsjMsm//1QPwir6pjOAljIfplB1CDZo9jr8Wfi
         /X/MoZPaw01qrVsPPGIVn+2X6PlTzeR/z7s8O+F+XeNJQDjw2jzpdFXHBFVA854YXxWL
         t7og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=E0Nr+xgvo/HGPyIRgeBTMe73qDbXu0iO1es6rYh3atw=;
        b=NddDDq9zVYCRYvbUNg4t2aItiXhVA5KDqe2eYONvv1HC6fi2/tCfwUvQ2etAQJlkr6
         WARrKkwLExs57+IUoBdoSu2ppIrSTLWVwybXFtufW0zmu2kz4KB7am7gshXAN647jIeJ
         qFvUQT21yTBp92djfevHqrUT1hpbuAMh/tdG98SU3KcfL9ATKBDB2fpRkzvfl548+IyM
         yI7YYKBmY8ttQ7IxmogcdbNQOKFRBJDPF1TiuyHsFTSzCyVzeaCqnVI8SQIAmFwZr24/
         w5KUVoZpHzxOTSTzouRIu8aMV4rTf3jlAnPnwZCqkg4Vkegm0EoEE4gh2kXxEHyJs8y2
         RvZA==
X-Gm-Message-State: APjAAAXEokeTrvoWMjNg0cbkye1JZh0aEr1Qs7Abz4/ikzQn6Ma8vf7f
        K/cvwAce2byy3WKrG3Xe/8Y=
X-Google-Smtp-Source: APXvYqxZXck+TqDk8p3s1SMIsgJls7MRurLbHvbPWJuC+WsBJrXRQkFb0GC5zMWshR4Y7Y8BVTdeWQ==
X-Received: by 2002:a63:155e:: with SMTP id 30mr12136523pgv.204.1571424024619;
        Fri, 18 Oct 2019 11:40:24 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id w25sm6570261pfi.60.2019.10.18.11.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 11:40:23 -0700 (PDT)
Date:   Fri, 18 Oct 2019 11:40:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 27/46] input: touchscreen: mainstone: fix pxa2xx+pxa3xx
 configuration
Message-ID: <20191018184021.GN35946@dtor-ws>
References: <20191018154052.1276506-1-arnd@arndb.de>
 <20191018154201.1276638-27-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018154201.1276638-27-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Oct 18, 2019 at 05:41:42PM +0200, Arnd Bergmann wrote:
> There are two different ways of flushing the ac97 queue
> in this driver, selected by a compile time option.
> 
> Change this to a runtime selection to make it work when both
> are enabled.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
Dmitry
