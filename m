Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D207E1D6EC3
	for <lists+linux-input@lfdr.de>; Mon, 18 May 2020 04:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbgERCXN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 17 May 2020 22:23:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgERCXN (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 17 May 2020 22:23:13 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94B4BC061A0C;
        Sun, 17 May 2020 19:23:13 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s69so4397340pjb.4;
        Sun, 17 May 2020 19:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AECABquhuOQOtjkWWvwJpD/Rbci5f831n0D/HGMDZto=;
        b=TN4Owd/3xxxwaVocpj98tZTBpFftUNCv2ZSM7l+590xQOOUBUMUhambNtRBlGnDQnq
         93cM8OkEieGY3MkkySU1fO9kTifhacKxryvlShY6gq6GTHLQeI51IMgE+6bUz+dDmGLQ
         LAZcG1xoUwWolYAg4ijN4G7qTmJcd00M8xwOgbIvpZ8IeWKn0Hh9u+UT33mRh3G2pJLd
         cR7WR2d8serdyZZ74rnWslvCXBrjy5YkfDFe1QLTrOlqfh4wQ1bbyuxudUpMhLGE/vT5
         wed/gGAINxleNOO3TyhXWbiDqk9iHOfHH5yvZb/kDZLkj9+yjetO0u69eNJaUc1ljmok
         Vj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AECABquhuOQOtjkWWvwJpD/Rbci5f831n0D/HGMDZto=;
        b=WQsXtMKavzzuVQVhhXgyJleoC1RwT5UNQQRNbSGkV97PI5BFGMR76TY1gXKtwokTTY
         fxfsplvosuBIDgkwvR9D5GgjyweoZSTRI7DCvJEPTdKXvXa7xqJV3qjVu4S1R7933K7F
         xIA+0WWunTsy+Zj/028L66J5CxyerQ7mzTT555FdbFuMOWupinzHec6lYPy4Xw60VLnl
         Lm4WcdUoW/6eHXy6Oqe5OjsE8trU48Ul+zNGt/lbfCZxaPyBv6TuFvDNZpy8ioqXou9g
         vV7Sx5YC0a67EJpQ9bWB0t/ZLQZQyLhreN0b+/C7BKjoAb49TgcZRU0MsKNtRuHzc1l/
         l86Q==
X-Gm-Message-State: AOAM531rvBAXiAgwdcOJumMbzsPNQvp9VXohjT2g4C4zuYOoqXquLoEB
        eQqrUtzg8wuJJPOJP0DraDc=
X-Google-Smtp-Source: ABdhPJwxt2qo7hcuvDHUGAFZueDaF1Ca0B2/XesLtOmigOsOrQ17yU8w1LPK4agUPI267FBmyRjqFw==
X-Received: by 2002:a17:90a:ba07:: with SMTP id s7mr16463666pjr.232.1589768593096;
        Sun, 17 May 2020 19:23:13 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3c2a:73a9:c2cf:7f45])
        by smtp.gmail.com with ESMTPSA id c2sm6429910pgj.93.2020.05.17.19.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2020 19:23:12 -0700 (PDT)
Date:   Sun, 17 May 2020 19:23:10 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] input: misc: Add support for Azoteq IQS269A
Message-ID: <20200518022310.GK89269@dtor-ws>
References: <1588352982-5117-1-git-send-email-jeff@labundy.com>
 <1588352982-5117-2-git-send-email-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588352982-5117-2-git-send-email-jeff@labundy.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Oon Fri, May 01, 2020 at 12:09:42PM -0500, Jeff LaBundy wrote:
> This patch adds support for the Azoteq IQS269A capacitive touch
> controller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
