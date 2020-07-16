Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC782218F0
	for <lists+linux-input@lfdr.de>; Thu, 16 Jul 2020 02:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgGPAav (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Jul 2020 20:30:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726778AbgGPAav (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Jul 2020 20:30:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDC2C061755;
        Wed, 15 Jul 2020 17:30:51 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id u5so2850592pfn.7;
        Wed, 15 Jul 2020 17:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uBPdtbhMDCIggv17A7lK3I7hrccMMLMD89OHuuDi1eU=;
        b=bVF+hrfSIOlIlmuAGTW5yiXwT4RoYYlnCvPXrvElEncMCO//sXA+rvu0EkYVIbM0yv
         FEdY7jJOK09kJubN3ipoG4VKHPdJhqUAUjoHwdTInEV8wD2TE/W4chYi/D4j9EPjjfHx
         xHQX0hA0C/ZsQU2Je1EniCNAMbauy5Yfv0BymXRiCaFq6oVu1XZ7GN/AQpAmJRbzkKDU
         sCjkWUd7QsyPwcSYk3+W/QGPnCAu+29ObprDLm0vbvh+rrRW34BGpNrjVhaJfsVTzabu
         QjT4CUZRZ4tveBTuoHsPfwaIxzKlLlgIkWBbAt9hSQBzNaWYxdNAMDpKN6FF2kEdmw/T
         uO9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uBPdtbhMDCIggv17A7lK3I7hrccMMLMD89OHuuDi1eU=;
        b=nfjKXDWHILM0QLZNON5YGLS8W2NglRVg1l+307ad4iYhiDHffZQmp4KZa6yeYhzDsS
         17YGinV3yeZcKKgUs6k94oKgxEMejEfXp1/I3BY4Ax/LfD1fBvF3Eo/jvl2132bDPIC+
         QqB8+X2jxS3uBp4oBUmPiVBffRAuGlkNk3lOVwCW8kse7EnOrmoNCeMafb/5ITY3kwb3
         3uUwEGLrerWZKPuP4w3g3zaxSxd1HyPC92+dxhZojzt2pzMlygl+tBqjxM+lL/BGZ548
         P7ygdS1VHwVawGXZc6kmCzC+N2XKvzvI6CTNmdm1U8PTHF38+Hg/2sFhBEpSxdCE6X1Q
         sWkg==
X-Gm-Message-State: AOAM533N/s0FylIm5Ul2IQ1QmNAaLGBU1aRDC6DNsfDU4F/0uGNYORdH
        ucOk6Zluk0H1FeWPcVKSJeWpEeAnzX0=
X-Google-Smtp-Source: ABdhPJyD+t29HuVzUhJe/yC3SyDbA1xtQsKOt8C3Hm+nYyCZ1rph5BZPsVsiqsQGoPHg9vVsLqJCCQ==
X-Received: by 2002:a63:3646:: with SMTP id d67mr1967957pga.363.1594859450491;
        Wed, 15 Jul 2020 17:30:50 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m17sm3223968pfo.182.2020.07.15.17.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 17:30:49 -0700 (PDT)
Date:   Wed, 15 Jul 2020 17:30:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        James Chen <james.chen@emc.com.tw>,
        Johnny Chuang <johnny.chuang@emc.com.tw>,
        Scott Liu <scott.liu@emc.com.tw>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] input: mt: cleanup open-coded __set_bit()
Message-ID: <20200716003047.GA1665100@dtor-ws>
References: <cover.1594599118.git.mirq-linux@rere.qmqm.pl>
 <cf1dda3a372896cb01033ce084a7deb9620df7aa.1594599118.git.mirq-linux@rere.qmqm.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cf1dda3a372896cb01033ce084a7deb9620df7aa.1594599118.git.mirq-linux@rere.qmqm.pl>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Jul 13, 2020 at 02:24:55AM +0200, Michał Mirosław wrote:
> Replace open-coded __set_bit() with the function.
> 
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

Applied, thank you.

-- 
Dmitry
