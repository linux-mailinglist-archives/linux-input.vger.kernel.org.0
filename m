Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1DB1ADAC3
	for <lists+linux-input@lfdr.de>; Fri, 17 Apr 2020 12:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgDQKMf (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Apr 2020 06:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728893AbgDQKMe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Apr 2020 06:12:34 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44BBFC061A0F
        for <linux-input@vger.kernel.org>; Fri, 17 Apr 2020 03:12:34 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id e26so2341596wmk.5
        for <linux-input@vger.kernel.org>; Fri, 17 Apr 2020 03:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YnzOyKxiPqTU4HRGOnE/2vSvqos+ev8HgXqi6MMPUKA=;
        b=MlchuBUdauSRQyVE8Hbv9cCHUBQnKekE7cJzDwYcy4tfuZ7V+FMXj487UTXnEaG4Wd
         UHYa9lDHkMYV1mIR6FDjbBX8wA2mZYxcUJM6jv8AbqtG96GWX2ARJenZlnxJKZmodbPd
         T6RzR/dRTIc6jgCqNr/zKACA8xy7IVa3p+IruV02ORfvu3JbAvSYQaS8BoiHjRKjVu0O
         JM+s3vuyiSEaT8LxUzfnLvNAc4BMJw1vrfdzfMosDz1f8ORavXpagIN1p8MxQW3vRrzP
         xRHYHQGRfagXNnGlbN9e8Gk5VbVpRdh+YTrg52fvzk3HfMHrEgNVPyMH3WzaPGbvdosP
         9L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YnzOyKxiPqTU4HRGOnE/2vSvqos+ev8HgXqi6MMPUKA=;
        b=swrof6UlIKqB0/iOQJlWlk1Selrh07z5rvBp8GFHnZt+bZcSNILudS1qxvRmfeqNxy
         1Sp5KEIbrxSwCdScqjqnISUAPlApQgrsx9NG4BWAbQHurc6IAdzGmX8nNWw36sLswnwX
         vrgIjaFNzPhLtsk7VNw+cm4YxnABMLz6QdXT30TRzp0IOLjbdmirWrwho1/s4i/nMwXn
         tunGzX+0w8HheCMNxwLiJ0mSki2no3oaRtH2cezvadkwmckD+k/dmW9drC4B1VldAXZW
         0M0EHwB4K6NR1I8RzTHhR4u+hN1Vrr9LzgBZWz3mL/OWQNF1zTG8Uqg/QEoXOCJkStAL
         udZw==
X-Gm-Message-State: AGi0PuaaoKm9wxQvaXMj2ieRCxmzzixine5/oqEq4W23DAUBdesA2C/j
        Rk8TF06WTocXfktwrybanQPg8w==
X-Google-Smtp-Source: APiQypJmV0Jf3iT0zgAm2M3NypsATxn0J7ih2FYSnTAkimi9GQNwmKxabVorLTmViOtz5IsBr1LPBw==
X-Received: by 2002:a1c:3105:: with SMTP id x5mr2735875wmx.51.1587118352876;
        Fri, 17 Apr 2020 03:12:32 -0700 (PDT)
Received: from dell ([95.149.164.124])
        by smtp.gmail.com with ESMTPSA id s9sm20080119wrg.27.2020.04.17.03.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 03:12:32 -0700 (PDT)
Date:   Fri, 17 Apr 2020 11:13:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Gwendal Grignou <gwendal@chromium.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benson Leung <bleung@chromium.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200417101333.GA3737@dell>
References: <20200306085513.76024-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306085513.76024-1-ikjn@chromium.org>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 06 Mar 2020, Ikjoon Jang wrote:

> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
>  2 files changed, 129 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
