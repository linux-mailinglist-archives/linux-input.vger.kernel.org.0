Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E4F335C960
	for <lists+linux-input@lfdr.de>; Mon, 12 Apr 2021 17:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239725AbhDLPFr (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Apr 2021 11:05:47 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:37873 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238723AbhDLPFr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Apr 2021 11:05:47 -0400
Received: by mail-oi1-f173.google.com with SMTP id k25so13736527oic.4;
        Mon, 12 Apr 2021 08:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hxjUXN8xFC+DQ9a25MnzMvjtux0+RBvtyUOiP9ULVt0=;
        b=V7Dt0AeYKyi2Etnyy8QE1+7gYuOXzACCPUawrAp3MPj9ONOPQ3E7eY/SPTrfBgOyMu
         gCxFcbOzRA0PjJkrgpqVCB8knR02dEyfe/hiT3qATGDiXCs5AKLNZ7RXI/cQ3fYy+CJO
         9a880Rdu6djxytujjmPsvXJuoNPRaBncPfBa5tARTnmmhBnfHkjK696fNfNXcIKtvxb+
         QUpf99ajYQruOMqM72CuHNj6Z+ip0XY3YCFlq9OudCvjeY5rbjNrkOsOJahOZtp1j3AR
         VSG+aDZTx4xg52E0nfNZsWE8mcKL6ohBizYag9HMFfVQLPnk6QhV9iU0WoMs0L1iZmju
         QS8A==
X-Gm-Message-State: AOAM532y8ags0d0iKvjBUH0AlvAd7rvSuaOAxNzQrR/+MArfh7q0Xdp7
        XYesfEIh/mpN1FTOtbwK2w==
X-Google-Smtp-Source: ABdhPJxlNew1mE8fC8S2Vq6hl71EGrcSJ2hYqBDF+xbknl+yYIzHcPB8pzdC4o6wCN34VEqcEA5Gmg==
X-Received: by 2002:aca:ab44:: with SMTP id u65mr6463220oie.173.1618239928938;
        Mon, 12 Apr 2021 08:05:28 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s1sm23143oij.37.2021.04.12.08.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 08:05:28 -0700 (PDT)
Received: (nullmailer pid 3898179 invoked by uid 1000);
        Mon, 12 Apr 2021 15:05:27 -0000
Date:   Mon, 12 Apr 2021 10:05:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc:     devicetree@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: Add Hycon Technology vendor prefix
Message-ID: <20210412150527.GA3897939@robh.at.kernel.org>
References: <20210408202137.GA1890401@robh.at.kernel.org>
 <20210411114804.151754-1-giulio.benetti@benettiengineering.com>
 <20210411114804.151754-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210411114804.151754-2-giulio.benetti@benettiengineering.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 11 Apr 2021 13:48:02 +0200, Giulio Benetti wrote:
> Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
> include "hycon" as a vendor prefix for "Hycon Technology".
> Company website: https://www.hycontek.com/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

