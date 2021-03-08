Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4527D331A1E
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 23:19:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhCHWTB (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 17:19:01 -0500
Received: from mail-io1-f52.google.com ([209.85.166.52]:37851 "EHLO
        mail-io1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbhCHWTB (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 17:19:01 -0500
Received: by mail-io1-f52.google.com with SMTP id p16so11767217ioj.4;
        Mon, 08 Mar 2021 14:19:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qHQgmbkDSDDiTfT1yKEjfyTu70sGJ/CC8y8c/laS3OA=;
        b=fYlxrL7C78t9DpGgQeJ1j1T2fTYyEVvJV2h+oaTwsjtgSjalSM6mQs646PcTP/LGhp
         jaJ2nrVbvt++yKKEdkRsWYbmXk2xFzLAAr8+saOnov0B3SHnjhUJHu2OR5tY9wyYR97r
         ZqTkS2Yb1dk+QCSA+3E+OLOzhM3wFkLaVw+u7cPChhsL/hbJefagXlmVLRtVdWK6W3Mq
         w8cTvxme0qpecVOcA5X39w/UxVCzlWrkMg9Y9IowaEjnzD44r4PvZvZsnoIaUk/sFXoc
         SZ8Q8qnUzaxQMjfgKVwbm+eFVQgHOz2GKjJ8NQRGU7YBTECFTFh61Ilf1lBqembI8p65
         90Rg==
X-Gm-Message-State: AOAM533pZvuaK4BcCAXs+7/4bXvnjqcj6s+JsQcUqoA1JM9mipg9ss0W
        VFr9mt3mlMvMrmEtJVfTAliQKIuNTg==
X-Google-Smtp-Source: ABdhPJyM5IoP7Vk3u1eUoLTcIXjzHXxloDJ+hkBtL+K7NrawTvImnquE6lkD56P0RQI4/iTwE2V8kA==
X-Received: by 2002:a02:2412:: with SMTP id f18mr25820196jaa.142.1615241940654;
        Mon, 08 Mar 2021 14:19:00 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id 23sm7028534iog.45.2021.03.08.14.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:18:59 -0800 (PST)
Received: (nullmailer pid 3053387 invoked by uid 1000);
        Mon, 08 Mar 2021 22:18:58 -0000
Date:   Mon, 8 Mar 2021 15:18:58 -0700
From:   Rob Herring <robh@kernel.org>
To:     Vincent Knecht <vincent.knecht@mailoo.org>
Cc:     devicetree@vger.kernel.org, Stephan Gerhold <stephan@gerhold.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-input@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Henrik Rydberg <rydberg@bitmath.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: input/touchscreen: add bindings for
 msg2638
Message-ID: <20210308221858.GA3053334@robh.at.kernel.org>
References: <20210305153815.126937-1-vincent.knecht@mailoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210305153815.126937-1-vincent.knecht@mailoo.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 05 Mar 2021 16:38:04 +0100, Vincent Knecht wrote:
> This adds dts bindings for the mstar msg2638 touchscreen.
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
> ---
> Changed in v6:
> - change touchscreen-size-x/y values in example section to reflect
>   scaling removal in driver (Dmitry)
> - add Linus W. Reviewed-by
> Changed in v5: nothing
> Changed in v4:
> - don't use wildcards in compatible strings (Rob H)
> - rename from msg26xx to msg2638
> - rename example pinctrl-0 to &ts_int_reset_default for consistency
> Changed in v3:
> - added `touchscreen-size-x: true` and `touchscreen-size-y: true` properties
> Changed in v2:
> - changed M-Star to MStar in title line
> - changed reset gpio to active-low in example section
> ---
>  .../input/touchscreen/mstar,msg2638.yaml      | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/mstar,msg2638.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
