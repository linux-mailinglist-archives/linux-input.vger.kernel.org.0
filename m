Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C80C3345623
	for <lists+linux-input@lfdr.de>; Tue, 23 Mar 2021 04:17:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhCWDRZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Mar 2021 23:17:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCWDRS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Mar 2021 23:17:18 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008DBC061574;
        Mon, 22 Mar 2021 20:17:17 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id o11so10301795pgs.4;
        Mon, 22 Mar 2021 20:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oUvFJMX9EZymrOCXLEB0pDZiEWYnlCvwmAXj8NqhD3Y=;
        b=kxF08rRZ2ylHCiQByq8wltkppY8GOUjWwf/QZSNnzx3aGs55yqDAoFGgwaiXb4cTUv
         ehshFNNTD6HGslgGh0SwDvOgdrDkyRkrNyHGoccFmD64x0zNpxfn9Vn1qv5eSg89PdUP
         6GvZU810j1q7qiLH9PK6Cl/yFgL5Ze7z2a6NK59D4b6/H+RGllaMgQzPq0uA6o9LBrQy
         5AHwHHWUhh5YkfueW3H8DrwSc+pGQSPtlYEA60TMAGPnZPB9S6oSezf8K/5lnijxYKSI
         LmQi1sezI3QD3YyWLMXYAGm1d/OoCqL32flKT7YxLe3FzVBXyzl4Q+/jbLF3LLgc6YPM
         Rhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oUvFJMX9EZymrOCXLEB0pDZiEWYnlCvwmAXj8NqhD3Y=;
        b=Sj+kLwX4bnP1nQ0T3Zlzl3GLq2+yYPEa24gWUDLAmIogvoA0Xzy4GlllQF7wEBiOZp
         I1urU0OrZn45ud/gHmAxOTLnwfKaBniItTT5gxEEnY/ecA2kfOdR03GYk5tPq2dOhoOv
         EBQgj9h9IB+LESveQDzapw5qptcLvHRSv/rU67X7I1p482B7B00gMR8hOmfI2OX2P56Y
         0x7B7/aDdmbBLPTLQmOgExY0wSzgWXYglp+b4E7Wpeiaj6PzZqDcNdR1Y3R168D/y5oo
         31uBJQWnmvshSna6ud1Oki5nY1JlbZGkvJlnvYb9SK+PgGK+9Ft5A1N7vplGaFBLKYPd
         2DGw==
X-Gm-Message-State: AOAM532i9Ajc9fMmv3iAfbetw9q8/hzF8MHUN9GSx0A8O+chXuh+s+j0
        1HAEmKyPcWuR9PAC2pcCeT8=
X-Google-Smtp-Source: ABdhPJwlbdaI+tukqbNbJbJ0wypyWFSnSEr52pvu0ZppCTxMMOiKqbAb/yXftLHVK1KilhBj5nto8g==
X-Received: by 2002:a17:902:f242:b029:e4:6dfc:8c1f with SMTP id j2-20020a170902f242b02900e46dfc8c1fmr2894175plc.0.1616469437528;
        Mon, 22 Mar 2021 20:17:17 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:499f:7361:582b:fd05])
        by smtp.gmail.com with ESMTPSA id x190sm15007268pfx.60.2021.03.22.20.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 20:17:16 -0700 (PDT)
Date:   Mon, 22 Mar 2021 20:17:14 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     robh+dt@kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] dt-bindings: input: iqs5xx: Convert to YAML
Message-ID: <YFldut9XlAu/c3DU@google.com>
References: <20210323021006.367-1-jeff@labundy.com>
 <20210323021006.367-2-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210323021006.367-2-jeff@labundy.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Mar 22, 2021 at 09:10:06PM -0500, Jeff LaBundy wrote:
> This patch converts the legacy text-based binding document to YAML
> format. Extraneous details and touchscreen properties that weren't
> actually supported have been dropped.
> 
> The reset GPIO has since been made optional in the driver; this is
> now reflected here as well.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry
