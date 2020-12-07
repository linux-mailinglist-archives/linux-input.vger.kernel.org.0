Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317512D19B1
	for <lists+linux-input@lfdr.de>; Mon,  7 Dec 2020 20:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbgLGTgG (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Dec 2020 14:36:06 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37969 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgLGTgG (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Dec 2020 14:36:06 -0500
Received: by mail-oi1-f195.google.com with SMTP id o25so16712533oie.5;
        Mon, 07 Dec 2020 11:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1tvsjAi7sc4t5IExztrA8y6ItDktEVUXn/bNRuvbfww=;
        b=cYYOh3zPWNAHPUWUYveCOl8ZSykfRsgpscj8WJGMhTI01msDqd4FJweVyxTx89GRC6
         XxI8xcVL8TlUx9E+kBNS/fkxS1MqFH3jyFyO9dZ20CCG1nj7wdaz7/nRfdXK6ud1kNb9
         z2mZErM/Yy8jq5NFWVY2qfMpbFwCzbY9kK1tytOO8RajNlAGzvzDBg/wBb6w78+JGUZV
         C0nTNUpeuE1/uOrsaoR3OluvQk3Iji9a/v6YPJ8GMiVhsKfrpFPnIQcPx+DyPzg/qLXW
         deouljPmUjsE3jbFKUX1cgOOpQP9iAdLx3pnWz66YMD2ek1ZD38xX32sztXNYBV9blTv
         epzw==
X-Gm-Message-State: AOAM530cumjqhu6XVlkt+NjlDHpFGJfwKKzevPA3qqCPgymDcraOEt88
        CcnjsggC/+jGOxxygl0ktg==
X-Google-Smtp-Source: ABdhPJyv2Cm/TGmZJYRKuXo0QegMfZ/TS2t6drKyEph6145Lu8CzGj2M2WFKzbVFHcq3OygxKUoZlQ==
X-Received: by 2002:a05:6808:91a:: with SMTP id w26mr259538oih.159.1607369719185;
        Mon, 07 Dec 2020 11:35:19 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t19sm913957otp.36.2020.12.07.11.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:35:18 -0800 (PST)
Received: (nullmailer pid 679970 invoked by uid 1000);
        Mon, 07 Dec 2020 19:35:16 -0000
Date:   Mon, 7 Dec 2020 13:35:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nemo Han <nemo.han@unisoc.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: input: Add compatible string for
 SC2721 and SC2730
Message-ID: <20201207193516.GA679922@robh.at.kernel.org>
References: <20201117034949.47877-1-zhang.lyra@gmail.com>
 <20201117034949.47877-4-zhang.lyra@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117034949.47877-4-zhang.lyra@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 17 Nov 2020 11:49:49 +0800, Chunyan Zhang wrote:
> From: Chunyan Zhang <chunyan.zhang@unisoc.com>
> 
> Add new compatible strings to support sc2730 and sc2721 which are
> two varieties of SC27XX family.
> 
> Signed-off-by: Chunyan Zhang <chunyan.zhang@unisoc.com>
> ---
>  .../devicetree/bindings/input/sprd,sc27xx-vibrator.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
