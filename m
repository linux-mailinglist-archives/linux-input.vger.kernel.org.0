Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1F72AB360
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 10:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgKIJRL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 04:17:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgKIJRL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 04:17:11 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1270C0613D3
        for <linux-input@vger.kernel.org>; Mon,  9 Nov 2020 01:17:10 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id p19so5026423wmg.0
        for <linux-input@vger.kernel.org>; Mon, 09 Nov 2020 01:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/8J7+TVsK84Hl/hXT+QqDQgHlP8pwg1VmC/OL+3Gn2A=;
        b=BL7ng4pfh4YApIruaOjnkw+juuxONFz8qbvu0r6n6FA/b6LNQJwpwKqtPJrvjlRgFq
         pMVa3LUu88J7BrKi2TZYoslRp7zkxMYKZSRL5lRN+PcunD6Xr2KGOoy0SnxOCA1eO6ni
         Xy5IwQplaEcE8nFExYU0fRuXcszeFpin8IV21xkJjt0L9a+ngmCNL/1o1h9QtqtBhoka
         kbXMTy+NT4kSxush8SEg61Gf/zcueTbxuK6Uzl0FTFsh36tRhiE8senuZGgPGVFSfjwz
         Oaf6SKt6QS37oKcALk/gwFOi+BeLUC969BHLjevnolECPCrp2nekVeSi0GsLhoftPEiV
         r73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/8J7+TVsK84Hl/hXT+QqDQgHlP8pwg1VmC/OL+3Gn2A=;
        b=srUhovS6wu87MBhFjlN6OtLoG0Svf+D4DjzQ10WPKklE7BlO2QdNHtKjG15y1pr5zO
         S3igiwQqkeSOEGrpxZnr84oGVcWx8kmlktmJBN4H14V9X2B94IW6gx2MoS4GRjKrSH7C
         eqnwLBS8//xKO8l+nhJ1aH+xuh03OdOW2Jq0sH4NPzgqNZYn0mFS02RTbvFhPJ5uOAjQ
         yJKwcSz1U1s5uUADJZaeJxojPbDhQ88NxaC4LTlOMqQy9kXzo5ZpUm2OiilNCnF4apMr
         A66qtF/iUJhOyVWdGgnTqiNX4GLTySrJ/MMLgcPnxyEAE1fngrJ/X+JZSCAgtqrVkVg+
         zm8g==
X-Gm-Message-State: AOAM532/My1bEGksWdfW12bneGlSjeQ/0FPMcmULLZTILU9noruwOiLF
        j6kj1cfQkboGDnSPj/etxJlUrPFJNfeVQb2u
X-Google-Smtp-Source: ABdhPJzLgDNAfmlt8Dp8TpAfOkmsvtztUSpcdw4J+gp+SWl7HFzUYAmQGtkfSSXOWUsOE0YzQqst4g==
X-Received: by 2002:a1c:5f45:: with SMTP id t66mr6773036wmb.132.1604913429339;
        Mon, 09 Nov 2020 01:17:09 -0800 (PST)
Received: from dell ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id u16sm12337564wrn.55.2020.11.09.01.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 01:17:08 -0800 (PST)
Date:   Mon, 9 Nov 2020 09:17:06 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Ferruh Yigit <fery@cypress.com>,
        "at www.cypress.com" <ttdrivers@cypress.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 15/20] input: touchscreen: cyttsp4_core:  Move
 'cyttsp4_tch_abs_string' to the only file that references it
Message-ID: <20201109091706.GU2063125@dell>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-16-lee.jones@linaro.org>
 <20201109063603.GS1003057@dtor-ws>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201109063603.GS1003057@dtor-ws>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 08 Nov 2020, Dmitry Torokhov wrote:

> On Wed, Nov 04, 2020 at 04:24:22PM +0000, Lee Jones wrote:
> > Fixes the following W=1 kernel build warning(s):
> > 
> > In file included from drivers/input/touchscreen/cyttsp_i2c_common.c:24:
> >  drivers/input/touchscreen/cyttsp4_core.h:236:27: warning: ‘cyttsp4_tch_abs_string’ defined but not used [-Wunused-const-variable=]
> >  236 | static const char  const cyttsp4_tch_abs_string[] = {
> >  | ^~~~~~~~~~~~~~~~~~~~~~
> >  In file included from drivers/input/touchscreen/cyttsp4_i2c.c:17:
> >  drivers/input/touchscreen/cyttsp4_core.h:236:27: warning: ‘cyttsp4_tch_abs_string’ defined but not used [-Wunused-const-variable=]
> >  236 | static const char * const cyttsp4_tch_abs_string[] = {
> >  | ^~~~~~~~~~~~~~~~~~~~~~
> >  In file included from drivers/input/touchscreen/cyttsp4_spi.c:17:
> >  drivers/input/touchscreen/cyttsp4_core.h:236:27: warning: ‘cyttsp4_tch_abs_string’ defined but not used [-Wunused-const-variable=]
> >  236 | static const char * const cyttsp4_tch_abs_string[] = {
> >  | ^~~~~~~~~~~~~~~~~~~~~~
> > 
> > Cc: Ferruh Yigit <fery@cypress.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: "at www.cypress.com" <ttdrivers@cypress.com>
> > Cc: linux-input@vger.kernel.org
> > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> 
> Applied, thank you.

Thanks for this Dmitry.

I'll rebase in a couple of days and fix the stragglers.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
