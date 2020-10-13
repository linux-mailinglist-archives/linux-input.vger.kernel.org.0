Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D0A28D025
	for <lists+linux-input@lfdr.de>; Tue, 13 Oct 2020 16:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgJMOXI (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Oct 2020 10:23:08 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34464 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbgJMOXI (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Oct 2020 10:23:08 -0400
Received: by mail-oi1-f196.google.com with SMTP id w204so7459761oiw.1;
        Tue, 13 Oct 2020 07:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vDm5xdsSsTMam4e94bVOwkhlRC57aQgO+FTINBCvZcc=;
        b=clkKBDJlheEEeRiN9/9higdmwhhZBwCB6nvUTgj0KUK0actg3lXkkGwTPmPLQLitDJ
         gYVQZzy4F/o5vpthmzKT0vypfnU0KVCHniIq0/mdHt9jQRoYgq06W2/bgol/PMaW/7xT
         JoxMiQdsVC2TgdvCu8YrDQHE776Ur7w/DDPqGtfqHVWCrEdD5vPCzmkhzIOZauUpzuzD
         LJ7L6TLH/bxKnX6TlcfhI5O4AtljTYze/Ak+8zKnzmkloqZYBBCmO/a5r0ufQB7jJClS
         Aew18gSjrIqpdlmqMgIsVpwSWkr+6+tuYUMzsQeLl2lZ3rVl0RO9Cziq8tbrAdfm22qw
         QskA==
X-Gm-Message-State: AOAM5314001a/MUuZ+utnopPvHcSqaHpDpmLIS7wBRIk9YqdYRvmsDI5
        yDpjW/2iO3bnL4JykWj+SA==
X-Google-Smtp-Source: ABdhPJwGxR1ydZVCcZA3/LNdoB3o6c/rDHsR48dQfgr0s3+Yb8pk+b+UmQFGyGRHLKZUE/FFURHkNg==
X-Received: by 2002:aca:4d14:: with SMTP id a20mr6635oib.46.1602598987496;
        Tue, 13 Oct 2020 07:23:07 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f9sm3140361ooq.9.2020.10.13.07.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 07:23:06 -0700 (PDT)
Received: (nullmailer pid 3449471 invoked by uid 1000);
        Tue, 13 Oct 2020 14:23:06 -0000
Date:   Tue, 13 Oct 2020 09:23:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     kholk11@gmail.com
Cc:     priv.luk@gmail.com, konradybcio@gmail.com,
        linux-input@vger.kernel.org, martin.botka1@gmail.com,
        rydberg@bitmath.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmitry.torokhov@gmail.com, marijns95@gmail.com,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: Add vendor prefix for Novatek
 Microelectronics Corp.
Message-ID: <20201013142306.GA3449425@bogus>
References: <20201008181514.668548-1-kholk11@gmail.com>
 <20201008181514.668548-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008181514.668548-2-kholk11@gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 08 Oct 2020 20:15:12 +0200, kholk11@gmail.com wrote:
> From: AngeloGioacchino Del Regno <kholk11@gmail.com>
> 
> Add prefix for Novatek Microelectronics Corp.
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
