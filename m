Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B492738F8EB
	for <lists+linux-input@lfdr.de>; Tue, 25 May 2021 05:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhEYDkr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 24 May 2021 23:40:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbhEYDkq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 24 May 2021 23:40:46 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D06D2C061574;
        Mon, 24 May 2021 20:39:16 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id kr9so7967459pjb.5;
        Mon, 24 May 2021 20:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QOMx6S5Svo75qhT8EVMIczrEF8W1ia8RcvUjP8gNL8U=;
        b=SHin2bobx8qEbT+hhQVm7Hnks0KnChnlPqQqPNbhd8+FPhxNbFcCuygNDwRfb3J70s
         QFsYzykwpGsUASvKWq3H2Eyw0nkeyr88XdLXEJ1RNEEQYDRtjPKus6Z4X+A0yyqoPWbE
         rdrMOTlHNewh3oI9Eo+tB/mWuF3tFn1HhsrmjKWTnQLZzkpiymCaLaD5h4BUatRdQfNX
         5sMItCeo7vLFgkIDpQiRs3LAQH9y9C81YvZ3I86ScrLYqeNlTJXK1Fx2YwR4VwKfvbWf
         o3pEn9ZsCE1O9JXK72TVt3eiTt8DG/7ws7AndEzh45OMhEbKFnJdiQrVLDpTK01Ky1nF
         Oy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QOMx6S5Svo75qhT8EVMIczrEF8W1ia8RcvUjP8gNL8U=;
        b=nA7gpmaDGmx+xb96CW7D5trU5KdAk0IIEGGH4gjwiS/oxIOwe0anh//M8hX8pOYlLc
         UAqgjgZdq9ndiTRXCBPYO0IAqK5Kmlo0ceIz2lZWXvkhHncIqJGwGPzhVdEbJhvdOwuG
         1SfpbKyBznzH3XGkGAh7GQBntflech5KN5cz+TNvKeMDBVg8eqINxrlkd4Qj1eryzXtY
         scgLQXahXzdJS03r2xSxNexhN7x5l2UB5jX5BiDPy3rLNVdHJlOobodRc6QVGIPtjN6h
         lQ3jN2L3FahNDy3UqQbJVGrcSM5huTnS+4zzo177jZ9J8l84tW9iL/xxRoteGJZ8UfiQ
         tsyQ==
X-Gm-Message-State: AOAM530TjHNUZmtDpYamZjHK28UmwHZfSXhZUPKfcjqdOTuTjSw60y+/
        9sG4pEbIpX+9VGqBsd1iQAgIfRWZ894=
X-Google-Smtp-Source: ABdhPJzn4/lyAagQsR/z/q2Wkj7lTWR74FV9JBQO02c8GzavzXiPp5CYFeFjB9wuqLaIEr+J4kHwGg==
X-Received: by 2002:a17:902:b20a:b029:f4:8b9a:5bf8 with SMTP id t10-20020a170902b20ab02900f48b9a5bf8mr28365346plr.37.1621913956336;
        Mon, 24 May 2021 20:39:16 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:870d:a395:9098:674])
        by smtp.gmail.com with ESMTPSA id t14sm11489716pfg.168.2021.05.24.20.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 20:39:15 -0700 (PDT)
Date:   Mon, 24 May 2021 20:39:13 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        fabio.estevam@freescale.com
Subject: Re: [PATCH] dt-bindings: input: remove fsl-mma8450 which is handled
 by trivial-devices
Message-ID: <YKxxYWNLEjEwih9/@google.com>
References: <20210521192210.12839-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521192210.12839-1-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, May 21, 2021 at 07:22:10PM +0000, Corentin Labbe wrote:
> trivial-devices.yaml already provide bindings for fsl-mma8450.
> Since input/fsl-mma8450.txt provides no extra value, lets remove it.
> 
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

Applied, thank you.

-- 
Dmitry
