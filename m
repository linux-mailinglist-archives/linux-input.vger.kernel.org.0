Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B02B82AB152
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:36:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbgKIGgG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729561AbgKIGgG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:36:06 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60504C0613CF;
        Sun,  8 Nov 2020 22:36:06 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id e21so6264268pgr.11;
        Sun, 08 Nov 2020 22:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Yk7TZLCW/uzS8z0ePVinfk4r2Y6c8s7cwrgi26umcig=;
        b=SiFoudmazG9T0PzBvQ99ibdovUOUcx8clR5cHGxIejDL1Di1T2QNIhcu7pO6RB0m73
         Kylk2hc3cM9BqLCaURkgLQ5anLcnAVFCTtAI3Xc1aa/wgT9PSLmvqqJUgSBav+N9PngM
         BAFduzYapULa3VPsHy12wztVgeC7wU4pJ5l9glkaKubTk3tiFX8jiaWxyw49geWOkFB2
         PruWOGgzHf+9GpxXSnS0RpJs7+EpM5pb0pJ46B5dYDX8AfV++M0pNlrtPsoT66vVMBgX
         VLFmd1hmA89p2K8L8Vt7nhRe/9p+WtBgYgeSpYTPppE8y4liBnNEXMAHsAZrprTeLXUY
         Fx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Yk7TZLCW/uzS8z0ePVinfk4r2Y6c8s7cwrgi26umcig=;
        b=U10UI2k9p8msbDbBlK4CbnH+Gwgl+LmrAr/5ww5lSR7g7QfDIRdPEYC8ORpTwcUKzM
         x6vgfNNkpF+PYd59TtMube3LB9ucisrT9vPJZE+4Gs0ZxCWnCVvLtfJVQCmb34SOVrl/
         R1lhiWuYEyHHXiyf+pQvfBAmmVwFXuBhoCNwAMxpeDhO/TpY5eoPp2b7cxASgb2WwirZ
         KN/fdPzSS1Sj/c5PucjPFPlsj7dSMaFBkqlk9uV7rmn+UR6huaAQfLrPvg5fesg8NWyM
         GHJCZFByQDFfUXObmczxuglSxqUBbet9lZtjZ4FGO8G79+txgDZd6WxVDT/wEq0cnOIs
         Vf/g==
X-Gm-Message-State: AOAM532xTv1LCFvlHXb6sQWQrhmb6OQ5WQ6JLjffx0cyHNzimkveJ9YU
        JZnni3BqJcB4nfls23dGffE=
X-Google-Smtp-Source: ABdhPJy8BrGArNzlQ7/yIMwMMDxU+qUyxFE/6knA4FaB5bDxGT+tWvPk7AcoDD+mr3JpGM2xmmRUHQ==
X-Received: by 2002:a65:6a55:: with SMTP id o21mr11968042pgu.141.1604903765885;
        Sun, 08 Nov 2020 22:36:05 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 26sm9188916pgu.83.2020.11.08.22.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:36:05 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:36:03 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Ferruh Yigit <fery@cypress.com>,
        "at www.cypress.com" <ttdrivers@cypress.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 15/20] input: touchscreen: cyttsp4_core:  Move
 'cyttsp4_tch_abs_string' to the only file that references it
Message-ID: <20201109063603.GS1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-16-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201104162427.2984742-16-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:22PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
> In file included from drivers/input/touchscreen/cyttsp_i2c_common.c:24:
>  drivers/input/touchscreen/cyttsp4_core.h:236:27: warning: ‘cyttsp4_tch_abs_string’ defined but not used [-Wunused-const-variable=]
>  236 | static const char  const cyttsp4_tch_abs_string[] = {
>  | ^~~~~~~~~~~~~~~~~~~~~~
>  In file included from drivers/input/touchscreen/cyttsp4_i2c.c:17:
>  drivers/input/touchscreen/cyttsp4_core.h:236:27: warning: ‘cyttsp4_tch_abs_string’ defined but not used [-Wunused-const-variable=]
>  236 | static const char * const cyttsp4_tch_abs_string[] = {
>  | ^~~~~~~~~~~~~~~~~~~~~~
>  In file included from drivers/input/touchscreen/cyttsp4_spi.c:17:
>  drivers/input/touchscreen/cyttsp4_core.h:236:27: warning: ‘cyttsp4_tch_abs_string’ defined but not used [-Wunused-const-variable=]
>  236 | static const char * const cyttsp4_tch_abs_string[] = {
>  | ^~~~~~~~~~~~~~~~~~~~~~
> 
> Cc: Ferruh Yigit <fery@cypress.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: "at www.cypress.com" <ttdrivers@cypress.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
