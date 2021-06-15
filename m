Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA6A3A86DE
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 18:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhFOQxD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 12:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhFOQxD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 12:53:03 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CFEC061574;
        Tue, 15 Jun 2021 09:50:59 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id o88-20020a17090a0a61b029016eeb2adf66so2016206pjo.4;
        Tue, 15 Jun 2021 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lbeZzOW6z9XmrC83Je35B7sCo6cJlKVCuaDtS76Km54=;
        b=bX1L0KIpNXdsGB7/Qw+Gkz5m9v5bpCRjvp11HzRnd23D0ResOceFUVFUGIapmQ2PAm
         JZaq7Uz+7i1d5jSGI1Xth1PJiB9mVsB6MqYzxYtSsJfgaVhObQlVEabUUCXLt+oul4ow
         d+UThykRKGehnPLeyJSz81zt6zqeXZCAK5xNXad2/3mGQO9HSX9pfIx6cbkGZcxxyAmd
         duCXLplVLCsFdxHVh0AgHe5FWmVnOsvYxRHqxxE+6B3Kt2TzN2bdTUuAxLFytLSYN+JH
         v3XFqexc2/kOW7fy9vm6ZNlEqzQTfTQFluLxqKV20P2avAn/AsLTSRBpmKq3s7UCnNZU
         nN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lbeZzOW6z9XmrC83Je35B7sCo6cJlKVCuaDtS76Km54=;
        b=j5D7WsgqeA5noYd+4WTmW2XQroxlIztXaOfPUIEmdJ1lB1qhhQeMTUFBjG91PoB1ZB
         7AWIP7awgmn27Z/YKBYMhbDv8oYM+hDvXYg3vStJFOpkcAiWD+X2z2dF8hkVOwJ7gGeY
         QkK+vTKC5jXNgCBpvL7KKq3idmTy3qR203tFzROV9SeOeklE+5Tb7hmMaYvnc4Cje49r
         GJPQ4m3Q6g0GkNv8/uVgPWtv+uIO5IyIABIBif4KrrA13f28g6qwxm6krOBRrrW9ZxoL
         1BC/+iyONTQUGMEfJQGZRsbp5AN98YmnQWWJy+qtdCe7fzx+f0rPylmvnDNzKBUbplvj
         8hwQ==
X-Gm-Message-State: AOAM5308iyO8y49XYDfvRw0qnj/eInHBEoWRzRAegp3Bzrhhm4n9hSXy
        8FDukgL3r5PqOJsjQs2Nz9g=
X-Google-Smtp-Source: ABdhPJzj3829ov8sJFHZcfOV964rVb9FqDYeh8PTf5+fa7PhcQPyGT4cJ5aqmaABfZ4ng3eP/IxeNw==
X-Received: by 2002:a17:902:7598:b029:ff:655e:f0c8 with SMTP id j24-20020a1709027598b02900ff655ef0c8mr4728933pll.50.1623775858286;
        Tue, 15 Jun 2021 09:50:58 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:2a26:15ba:dc71:c4ba])
        by smtp.gmail.com with ESMTPSA id s13sm16499942pgi.36.2021.06.15.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 09:50:57 -0700 (PDT)
Date:   Tue, 15 Jun 2021 09:50:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alistair Francis <alistair@alistair23.me>
Cc:     linux-input@vger.kernel.org, linux-imx@nxp.com,
        kernel@pengutronix.d, pinglinux@gmail.com,
        tatsunosuke.tobita@wacom.com, junkpainting@gmail.com,
        ping.cheng@wacom.com, linux-kernel@vger.kernel.org,
        alistair23@gmail.com
Subject: Re: [PATCH v6 1/9] dt-bindings: Add Wacom to vendor bindings
Message-ID: <YMjabvPhPRzjDlgQ@google.com>
References: <20210615103014.798-1-alistair@alistair23.me>
 <20210615103014.798-2-alistair@alistair23.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210615103014.798-2-alistair@alistair23.me>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Alistair,

On Tue, Jun 15, 2021 at 08:30:06PM +1000, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair@alistair23.me>

Please also send DT bindings to Rob Herring <robh+dt@kernel.org> and
devicetree@vger.kernel.org.

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b868cefc7c55..abd878ff23d5 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1236,6 +1236,8 @@ patternProperties:
>      description: Vision Optical Technology Co., Ltd.
>    "^vxt,.*":
>      description: VXT Ltd
> +  "^wacom,.*":
> +    description: Wacom Co., Ltd
>    "^wand,.*":
>      description: Wandbord (Technexion)
>    "^waveshare,.*":
> -- 
> 2.31.1
> 

Thanks.

-- 
Dmitry
