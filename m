Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EFDF35AB45
	for <lists+linux-input@lfdr.de>; Sat, 10 Apr 2021 08:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhDJGGF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 10 Apr 2021 02:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbhDJGGF (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 10 Apr 2021 02:06:05 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DEB4C061762;
        Fri,  9 Apr 2021 23:05:51 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id r13so152198pjf.2;
        Fri, 09 Apr 2021 23:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+QqrR6nJLIJpxNKniX4QgAdfwxaTVv5QORmwk6N+7R8=;
        b=BxU6UurKVlpBe9NcSla9Ch2tbNutO0gQ8tUkN1PMV8ircC21jCVJJ79M3mHU3SQpVg
         osdD828g7oB87mJCsaObQ39qdvW5RzzlhUu9FNopVRF4/MOhHnddEjiFVV0stc4aYE7F
         HxcnMkQLRE94JaJQYAIeBVyglCUTYWcRFlmBGo+qNzMi8eCoyY41KDV5O+Q9s6Ochosn
         RSfGmRflAaNfj8QGhthbFJv4dpGPqvxkRJsSoSxw5+gkecgJU0YHLxWYFsmHgR7qYvdH
         Z+DuUvyoabOUJ/KiapDnhLffU56dl6sHt81hJEB4zBXXtgee7MTeeJzJYW0N6Qc03v3N
         uIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+QqrR6nJLIJpxNKniX4QgAdfwxaTVv5QORmwk6N+7R8=;
        b=b6CpOD+IJd4VoZfur31QVFu781Se8ZOTkxTC4zHSNrM5B7C9CKfIjUHf2GdnzCctqP
         dyBEsNWrcJCshWiXtyb2Kwd75/p7MjYI2DWLO2gS1O5qKkai9Z+ac47t0XdW6Upc2qxU
         ESdZhZx5CrFo/F+IjUUDr/V62Qv1LilVdGXVbXMGGKkKtzQjytxToq9M5c20Tga3An9f
         aK3GOvwcFj/znc3Xz7WtGpkNRTer4pyqa5qckSifXLNVB6dDZ358cVgF88gES9eDFhmz
         y9anUsHyqOYXrRsf65LKze63mx/QvnBvrR2Q8SRV0MaUk1y6b7kqUWP7285MXnxpQDwn
         tlig==
X-Gm-Message-State: AOAM530jIsDBLyPlj8jz1aPlEN74TfPRrPEKWEKJLsWYVA8kFTlPOjib
        qoOMSo5ZEeEczlwKxPMZQ0A=
X-Google-Smtp-Source: ABdhPJwOJoX9RadkLhhwNcwb9FYwA3EN3KCOfhflo+230g2FGTAJdS8OeSDtpQ0kI6QldgEcNECDQA==
X-Received: by 2002:a17:902:ed52:b029:ea:aaaf:60d6 with SMTP id y18-20020a170902ed52b02900eaaaaf60d6mr5118140plb.55.1618034750983;
        Fri, 09 Apr 2021 23:05:50 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:c9de:23b9:54df:4a55])
        by smtp.gmail.com with ESMTPSA id f2sm3459985pfe.177.2021.04.09.23.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 23:05:49 -0700 (PDT)
Date:   Fri, 9 Apr 2021 23:05:47 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Simon Shields <simon@lineageos.org>,
        Tomasz Figa <tfiga@chromium.org>
Subject: Re: [PATCH] Input: mms114 - Convert bindings to YAML and extend
Message-ID: <YHFAO638UtJ1umc8@google.com>
References: <20210330201233.2360006-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210330201233.2360006-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Mar 30, 2021 at 10:12:33PM +0200, Linus Walleij wrote:
> This converts the Melfas MMS114 bindings and extend like this:
> 
> - Require nodename touchscreen@ (this seems to be the case for
>   all in-tree DTS files)
> - Add the mms134s and mms136 compatibles
> - Add the avdd and vdd power supplies
> - Define the I2C clock frequency property
> 
> Cc: devicetree@vger.kernel.org
> Cc: Stephan Gerhold <stephan@gerhold.net>
> Cc: Simon Shields <simon@lineageos.org>
> Cc: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Applied, thank you.

-- 
Dmitry
