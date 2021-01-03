Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A10312E8D3D
	for <lists+linux-input@lfdr.de>; Sun,  3 Jan 2021 17:39:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727486AbhACQix (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 3 Jan 2021 11:38:53 -0500
Received: from mail-io1-f46.google.com ([209.85.166.46]:43225 "EHLO
        mail-io1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbhACQiw (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sun, 3 Jan 2021 11:38:52 -0500
Received: by mail-io1-f46.google.com with SMTP id o6so22848220iob.10;
        Sun, 03 Jan 2021 08:38:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1kJVhpksm4jkbhD+fHMugBUW25LFDOTn9tmnMyzMqgw=;
        b=JZEILY7Baj2RIbdNSXkR2iKWVCi1BfRXpnf/5gWACYXmJ8OQL6ovtYxBIJowTxFADb
         MoawSgoEdfSYzYmKptVnkGL9mxo/4oELNiWHIcuEmes7UJsvaHmF/IS45OckkAMQwjH6
         A1gTg7nAToyC0mUYVqj470Fei3/ol0l+kZK0LokhMkjJgka/aJfSpVp8nvsz5yQX1UXi
         UUpu3TiEiTt/bJWlEPvNqZGVIIhSWC+Fw4FHAvJOe3idM6VtUX50P33iSn6VAqEKWj7P
         oywufdmi5/vISs6mYRFWWfmrPPA+nvhpsH/ZTFxH6uQe7kMyGEjDWtu6J3j2R+Al5ieW
         gqqw==
X-Gm-Message-State: AOAM532b5YGSlUucyac51zF7bdF4jR7vxAJnkF9u9W9XI8PSWLR6zZ/t
        GEa48GegXOSPYTrexLfuGg==
X-Google-Smtp-Source: ABdhPJzlMI6n/NalP1e8jIQi3gb8aBQJqi9q6UduKZy5SC6l2eAjAoX5Ncinnv8V2QVlL/vbfoe5Mg==
X-Received: by 2002:a02:8585:: with SMTP id d5mr59449962jai.109.1609691891697;
        Sun, 03 Jan 2021 08:38:11 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id t2sm41646859ili.31.2021.01.03.08.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 08:38:10 -0800 (PST)
Received: (nullmailer pid 4009040 invoked by uid 1000);
        Sun, 03 Jan 2021 16:38:06 -0000
Date:   Sun, 3 Jan 2021 09:38:06 -0700
From:   Rob Herring <robh@kernel.org>
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: adc-keys.txt: clarify description
Message-ID: <20210103163806.GA4008983@robh.at.kernel.org>
References: <20201222110815.24121-1-xypron.glpk@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201222110815.24121-1-xypron.glpk@gmx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 22 Dec 2020 12:08:15 +0100, Heinrich Schuchardt wrote:
> The current description of ADC keys is not precise enough.
> 
> "when this key is pressed" leaves it open if a key is considered pressed
> below or above the threshold. This has led to confusion:
> drivers/input/keyboard/adc-keys.c ignores the meaning of thresholds and
> sets the key that is closest to press-threshold-microvolt.
> 
> This patch nails down the definitions and provides an interpretation of the
> supplied example.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> ---
> I know that this file needs to be converted to YAML. But lets first get the
> text right.
> ---
>  .../devicetree/bindings/input/adc-keys.txt    | 22 +++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
