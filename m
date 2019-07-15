Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9DE5683E5
	for <lists+linux-input@lfdr.de>; Mon, 15 Jul 2019 09:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbfGOHKw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 15 Jul 2019 03:10:52 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34836 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbfGOHKw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 15 Jul 2019 03:10:52 -0400
Received: by mail-pg1-f193.google.com with SMTP id s1so946875pgr.2;
        Mon, 15 Jul 2019 00:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZKdTjc8KBUPXXzOQggqXZL8HabvXh/rPTtBXZzOt6Mg=;
        b=BTOsOS95ytg9fiZmPjbqDerEGdWiVZ4JUuAX9Y+H9YLhmIJhbeKua9uB7Tcgj3Ww3y
         dQz/UTIsGfiBuVqtKjHU49vy4hXSavF6NTr/bxFI51qTCyfCQx0nqa8IOQOdXvCEK2Yd
         pI6VKO73bxYWDp8hfBakcTYE9E1bu1cS90tq2gdQ6twc9z9Dx08AsAc6hPdnTGnIYqz/
         S12Ian6rO1JoJ/w2N3UrOCo4f93S+Ri8zCtmMhuJwKCB4cB/SauFY5rnCm7Xr3MSlxQG
         aNcrzxYUThZYTDEWtYPQA5SJnQLqPWcA/5mbfvttjKochjoDxznM5+wEq+vJpJd0G5BS
         EuJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZKdTjc8KBUPXXzOQggqXZL8HabvXh/rPTtBXZzOt6Mg=;
        b=lTrB3uD6S1zbp6hpmOGmzh8IEFgsxAdchybBhirtL+fOgObnoo7V4vpcB7zTAdnQO+
         LBS0b1XUcdbGgZLZH1qaTdSd433+thV1IK3fWa2rF38TZCxfNYOJMU0DqKspFFTlMS3V
         OV1gundWhFPdVjic1G86dV+GitHSzoUC2yCoOIDWIXmRBdNUouVgDqqztQntmLdYmU78
         dIbFL6IZGze+1Y08KMKDKESwtA9mPCycOPlsliXVZxqyirKEGOvswzI1+xkm21ojNmNP
         4H1CUBIVjQhVSVslRJtg87KVqjD38GthFkX87SQNPPY1OlXSaHAHHxduDdKCcwn3oVHH
         43og==
X-Gm-Message-State: APjAAAW12U3p1VGtFF4MngBbaaR+fYPGFQk7MRFFDJKV8ffyATmEFXc3
        93yN3VgZDBTr4J4Qx3konoo=
X-Google-Smtp-Source: APXvYqz070Aox+gMTy1nSal/+R2lUbCNQZy/yMqAZLaeAee+FjC6pHogtdgyQic/euKJm00w6GUU8A==
X-Received: by 2002:a63:520f:: with SMTP id g15mr22110217pgb.28.1563174651270;
        Mon, 15 Jul 2019 00:10:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id b26sm20620292pfo.129.2019.07.15.00.10.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 15 Jul 2019 00:10:50 -0700 (PDT)
Date:   Mon, 15 Jul 2019 00:10:48 -0700
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
Message-ID: <20190715071048.GB153485@dtor-ws>
References: <20190711222346.5245-1-lukma@denx.de>
 <20190711222346.5245-3-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711222346.5245-3-lukma@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jul 12, 2019 at 12:23:45AM +0200, Lukasz Majewski wrote:
> From: Sascha Hauer <s.hauer@pengutronix.de>
> 
> The platform data once was optional, make it optional again. This
> is a first step towards device tree support for the mc13xxx touchscreen
> driver.

I would prefer seeing it together with patches introducing device tree
support.

Thanks.

-- 
Dmitry
