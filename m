Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652D52BA0FA
	for <lists+linux-input@lfdr.de>; Fri, 20 Nov 2020 04:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727222AbgKTDRV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 19 Nov 2020 22:17:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726281AbgKTDRU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 19 Nov 2020 22:17:20 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74600C0613CF;
        Thu, 19 Nov 2020 19:17:20 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id t37so6016988pga.7;
        Thu, 19 Nov 2020 19:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7d06uGnwa3OtUYz9yRcXoPbaRdUlmhPGFQRkdMiIseo=;
        b=uX1VFR8Fp+b0qRThdTYKgzOIsEzTY+pPp+iXkamodZ9oxrBicXTU7nz8H//kB60Di8
         bwjACk38+w9+xo4tMHgt7tu/3ag28qnFV26vLWL0Yi9T2DxTTnnl+TKzryuSOHWDF5Cu
         H+QcvdLau9FJEMIV1Pb84uWCdvNZA9Xqr9UyBqv0y7soLpIY7glRcYRFoKUqG8E28YrT
         2vu2P87Pe406uZ2PBXjHGEdRG6UEoxd6YUO2SimcmsEkSpn0ZwSj9Dx0mSr1zD7tqf0L
         92lOZ5hJkNmKrgF6NUZW+y4hF8H/5x88Sn4GfCB6+aj31VqOgED2W8bBiE+Vj9tBvO/4
         4B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7d06uGnwa3OtUYz9yRcXoPbaRdUlmhPGFQRkdMiIseo=;
        b=GLXyDyreyJcYHFhIaithvSymVOkMZXwH8BCQ8ni8KtAanHnWp9m4/xFn94WyzyP/Ad
         PFtjYWO2vjPG+GcRCbFvxwAfSZs11z0GzLo7cv8oRAihH/I0fsr226bzLtxedRHeV8Em
         OTvaEIyUqNqieGRxxS+BTpfgUovvJmypNEN0wveikXeJD1P09CqYXSySgsGYYRG8uPtb
         57Ggci4Sy5D8X1xG5qdBpMIk5skOBf5jCV7LQM06Lca4FzLvRVC97IsU5F4gf5msQkR1
         voplmBvk91U3aAhOp/Xy795hvmdFKLALDu6aNJpiAIpXQPJ7V0sQ/XKaa/5fl6ObufpN
         xEvg==
X-Gm-Message-State: AOAM530dnR3psq4i9IPIW0Z9F1ZqHTwe26uVyYPb/mM1lSrIIrgkTRg5
        3G8BSg0UBYGfmHZVy+jSHEE=
X-Google-Smtp-Source: ABdhPJx8P2EE7QznY4G2BVc1/R4PdIF5SC9aTs4R5KCk73CnEGuoSumJfvWvFdwuHuG8PUpBTbFaHg==
X-Received: by 2002:a17:90b:2342:: with SMTP id ms2mr7960349pjb.136.1605842239978;
        Thu, 19 Nov 2020 19:17:19 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id p7sm1229344pgr.31.2020.11.19.19.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 19:17:19 -0800 (PST)
Date:   Thu, 19 Nov 2020 19:17:16 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        patches@opensource.cirrus.com, linux-input@vger.kernel.org
Subject: Re: [PATCH 09/15] input: misc: wm831x-on: Source file headers are
 not good candidates for kernel-doc
Message-ID: <20201120031716.GP2034289@dtor-ws>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-10-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201112110204.2083435-10-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 12, 2020 at 11:01:58AM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/misc/wm831x-on.c:30: warning: cannot understand function prototype: 'struct wm831x_on '
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>
> Cc: patches@opensource.cirrus.com
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
