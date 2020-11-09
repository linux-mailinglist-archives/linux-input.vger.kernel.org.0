Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B1D2AB14E
	for <lists+linux-input@lfdr.de>; Mon,  9 Nov 2020 07:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729585AbgKIGeC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Nov 2020 01:34:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729076AbgKIGeC (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 9 Nov 2020 01:34:02 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926BCC0613CF;
        Sun,  8 Nov 2020 22:34:02 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id q10so7185104pfn.0;
        Sun, 08 Nov 2020 22:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v++8bd1IUyvw9X6vvcXByPhjPZXgynykom+xOoMhlmM=;
        b=EySDcw55Ewl5X1c+Vyl5QXKtK/wmO9qDxi3zh74md2x9q8nfZnrwX9x13o+eKSOoMG
         XKNY8rh93euWg9MTcxK8HB8XOuyYWTIN5VbQdrSiMqsGu6xjBw6CfnJa/gWVMRiWGPJl
         rvcpEToH3DXIPkJ037s9TT4MrIejEF52AEAT4+jaxCm97WuwB9wyyzqOH260KrcBn3j0
         16PxVHOQxtc2V7+xJtMZyRYMNsbTWE+wBcRiPV13mFjURzDuDof9uvTWabAvhFEWZ+lv
         C2loNhrdypU1jZiFKbjGjC1YFtezDgil5Hw0iGK6GTEkBb06SNCg7Nhj1C4BGPoX3fqe
         QtBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v++8bd1IUyvw9X6vvcXByPhjPZXgynykom+xOoMhlmM=;
        b=PtI7nPSAptI9W96QQGUJ7+3zSW905Q9ACIDotCfzgKonDrA6Q3lgNwnYFINNAi/Zrg
         wMZX+m5CAWCmcroCX5yPATY8ULOjm6medWgNYLurUxrPJpYknH1p0YooftHgFTrAsQTY
         edD/6sjXWB4763ary99c0zRbCWD0MGdFdvaQPvIqnpDUXY8XOaHcAk7sjIQIMIYCbqKp
         oWKCCl0WJuNk4FGSAFmux5VC/K2Ny1ZPbXLhDzvO6BQShJI7Ok0UidBSrj42I0qLffDT
         8wZMHC+vscu0vK606Gc0dOukEdNiVO10c6Ua1YwebYMGUEnJ2RCBRZI7fzGIAlSP5UmG
         KLKw==
X-Gm-Message-State: AOAM533W1maNkgxHHQZDJaWwmt04nZNwP7PfhKCJH08xF8Qyts/hJ2Hv
        x9u1qWqu6P1LYHsFwDSkvHAmJb0CYKQ=
X-Google-Smtp-Source: ABdhPJw4xq4pMwy0fY+Na6Gmzs9quPzQyEOW/Kiivgpn4MNSWAwYZydKcrsEy93MozD78mWsd1aAPQ==
X-Received: by 2002:a17:90a:c381:: with SMTP id h1mr12107584pjt.2.1604903642107;
        Sun, 08 Nov 2020 22:34:02 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id l7sm9960078pjg.29.2020.11.08.22.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2020 22:34:01 -0800 (PST)
Date:   Sun, 8 Nov 2020 22:33:59 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Eugen Hristev <eugen.hristev@microchip.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 09/20] input: touchscreen: resistive-adc-touch: Struct
 headers should start with 'struct <name>'
Message-ID: <20201109063359.GR1003057@dtor-ws>
References: <20201104162427.2984742-1-lee.jones@linaro.org>
 <20201104162427.2984742-10-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104162427.2984742-10-lee.jones@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, Nov 04, 2020 at 04:24:16PM +0000, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/input/touchscreen/resistive-adc-touch.c:34: warning: cannot understand function prototype: 'struct grts_state '
> 
> Cc: Eugen Hristev <eugen.hristev@microchip.com>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied, thank you.

-- 
Dmitry
