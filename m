Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE6B2D19AC
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 20:37:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgLGTfu (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 14:35:50 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41234 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgLGTfu (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 14:35:50 -0500
Received: by mail-oi1-f194.google.com with SMTP id 15so5510012oix.8;
        Mon, 07 Dec 2020 11:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/+fQcCWdXugKxwJU7ISQBHOa/TSruKBMJOC0TWO9h64=;
        b=p+Brfa16kAgEDk8s1k+sn+vvDku3uD182/bfl79zE7SIXFQPOu7c+r7QYKRCIW46fz
         5zKvqIda9KA6fJbcrfrShPKdgslU6VO23OOwgPq4y++NMxJeQe16N5CNdylr7JON/1Wq
         PyRyqQzEl05URMnwlw9BHyrr41B/+a42iErh/xWcnSEgPM/SZYr9EexatELe4f5SP7t2
         uy08t44806gjgbErIaP69cfqaODoWZ0kpd5v6lGMLi8x+S5nf5aEiwO3+UM9SS77pYEq
         414xpfJee4m/A6OdKGzvD1Y3UrV9+JlKt81osXU2V4PUtTOvHfIYqt5jKFvPM1w7fMiw
         CQGg==
X-Gm-Message-State: AOAM5322lHmLvblHTJiO3e9E4dZ5SSQPA4rDqQnp/l8TXQC7R7+bNiuE
        XyLImHSUbe+65qNvNVDDLA==
X-Google-Smtp-Source: ABdhPJzr+YAshb71S96cNLAvLimBLklCBnzH+63xgY0/6FocJfgE1XrD4Z5QQx0XzNr/RxBOLdZIhg==
X-Received: by 2002:aca:b4c2:: with SMTP id d185mr313873oif.124.1607369703359;
        Mon, 07 Dec 2020 11:35:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d15sm2708014otk.62.2020.12.07.11.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:35:02 -0800 (PST)
Received: (nullmailer pid 679274 invoked by uid 1000);
        Mon, 07 Dec 2020 19:35:01 -0000
Date:   Mon, 7 Dec 2020 13:35:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, Nemo Han <nemo.han@unisoc.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: input: Convert sc27xx-vibra.txt to
 json-schema
Message-ID: <20201207193501.GA679219@robh.at.kernel.org>
References: <20201117034949.47877-1-zhang.lyra@gmail.com>
 <20201117034949.47877-3-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117034949.47877-3-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 Nov 2020 11:49:48 +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Convert the sprd sc27xx vibrator binding to DT schema using json-schema.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  .../bindings/input/sprd,sc27xx-vibra.txt      | 23 ----------
>  .../bindings/input/sprd,sc27xx-vibrator.yaml  | 46 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 23 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibra.txt
>  create mode 100644 Documentation/devicetree/bindings/input/sprd,sc27xx-vibrator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
