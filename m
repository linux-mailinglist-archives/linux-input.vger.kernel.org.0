Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8AE268446
	for <lists+linux-input@lfdr.de>; Mon, 14 Sep 2020 07:53:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726040AbgINFxG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Sep 2020 01:53:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgINFxC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Sep 2020 01:53:02 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92B14C06174A;
        Sun, 13 Sep 2020 22:53:18 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id y1so4339488pgk.8;
        Sun, 13 Sep 2020 22:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fu+Unq5S6ACh7iYsqq0q6WI21x0YuOKv2but7DIYHco=;
        b=o/X10V9OrT4RY5VME92I67Ty5nMf/YdeZnF4osFSsDvxrcqLjrieCBh/BuQxCo8Odl
         GJZ05F1zlzMzPte84nYm6xExf0+97izmbQT/DvQDBpukvyTFRGYw/bKTb7f17HFk3UKO
         9X9DHs7/l17ZiTa+qrC2r9b3xbn4yek/kHH/pA0x5R7sdm90rlo0rTgD2XfEwf61RbS2
         L9lbVMniijOCyro99DIa0Tu2eW+hu4jZvOk/qaqYXomiyItVwy8g4LStZkTl/4a1TdZM
         dYAFaYEA/ld9TZBMvtPvAljAsSNRXLaDHXBwMQECCJVDbH4qqZ7JaVVqMo2bJCAnIJsV
         o3jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fu+Unq5S6ACh7iYsqq0q6WI21x0YuOKv2but7DIYHco=;
        b=N/elPBe6pVyUWm+e/m1tqVLBOq/8cRqgdO0JafQ6xmwJHnGcxnumXdA4KCHXRTnFbr
         iyumR2kdkZqIm5LTcIqgspNPDCNz/mXPlU/ZC5TMapWF9+HIIqWWS/EGVLI/CjNfwmjk
         XsHdLzNF1u8cwAJRcSePw2+gsl3lP6j1vMQRemecZ7rJQtWoExuadgFuGMTVy4lG1Da4
         cWc3yezTlgadN508hGTNL6E44F4Yyxite+Dg1ES7KrtV8Bhf2Yd2AD/HRlWHxq7SriFF
         D9W1KwLfaz9Hawe4kZRe0XcvdHFpIN+mfAkP8ZcOml+WgRdFu3tQU1G6BvlqWKwg7s+M
         rtiQ==
X-Gm-Message-State: AOAM5330mTb+GxMw56ova5a+W2D+x0xq+Vewk/t1xpBvRhmDBXt8YEtt
        GKsUNHPOigWQ6MlCf9hsSBI=
X-Google-Smtp-Source: ABdhPJwtLsRNLtWA3y2GtumiwQhYjfTb+m+yPk/jEtTINjVXfSq6KN2ZYqJ/Sw2Ya7XHIe8ichHrsw==
X-Received: by 2002:aa7:86d3:: with SMTP id h19mr12315138pfo.84.1600062797975;
        Sun, 13 Sep 2020 22:53:17 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id m21sm8836737pfo.13.2020.09.13.22.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2020 22:53:17 -0700 (PDT)
Date:   Sun, 13 Sep 2020 22:53:15 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Fengping Yu <fengping.yu@mediatek.com>
Cc:     Yingjoe Chen <yingjoe.chen@mediatek.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-input@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v18 2/3] drivers: input:keyboard: Add mtk keypad driver
Message-ID: <20200914055315.GJ1665100@dtor-ws>
References: <20200909072159.14888-1-fengping.yu@mediatek.com>
 <20200909072159.14888-3-fengping.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909072159.14888-3-fengping.yu@mediatek.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Fengping,

On Wed, Sep 09, 2020 at 03:22:00PM +0800, Fengping Yu wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch adds matrix keypad support for Mediatek SoCs.

I am generally happy with the driver, however I do not believe this will
be the only Mediatek driver ever. Do you think we could rename it to
mt6779-keypad.c and use mt6779_keypad_ as prefix for function names?

Thanks!

-- 
Dmitry
