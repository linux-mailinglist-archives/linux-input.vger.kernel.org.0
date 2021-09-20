Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4524128E9
	for <lists+linux-input@lfdr.de>; Tue, 21 Sep 2021 00:33:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238998AbhITWer (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Sep 2021 18:34:47 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:38813 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234393AbhITWcq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Sep 2021 18:32:46 -0400
Received: by mail-ot1-f51.google.com with SMTP id c6-20020a9d2786000000b005471981d559so4218396otb.5;
        Mon, 20 Sep 2021 15:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LaYTMvroF5ySfI6QJ0ThPVlAx09ZLJgE0Mmrymh+U3Y=;
        b=bTGEG86n34qGK+fB6Q+PBRfKXrgoOaGivEKl0xZD5YHPEB7ODXMhu6c64eePabN2t1
         vB63LVLSKrllkzuWI34ym270MHNyZgKvSx3lZLsESZ1jiKRqMyCiy+KQgbjBCRnuwQKe
         BUxt7VSvgmYqSP9vJZAEwDScal0br/A2mYRD4EqBEQDyzcCPcPtDA2FAuSIM5cseAEw8
         SdY0cyQmOUhlf9aKHycmTVBnuMZsHkCoQFQS6DuB1ztbeGO3vHqdkfh556VfEyGtIgKc
         OojyGpkpDaULHIG5YYedbYl95UJgf7d1JfRMUxSf7ampMamaVf8cLF9ABxfJ7YM5Zg/4
         rMUA==
X-Gm-Message-State: AOAM531QYJy3bS7gx4cRnSdYJJQPzFlEltTgffQnUs3vdYsegZOq9z2K
        RiuiMSFQNuR40tF+De/AcA==
X-Google-Smtp-Source: ABdhPJw87xZoHf3w+GQGKrDfl+ogomFK7KSQ9zKshQl/wynqsa6OZJSG5bZKC4CcbyqbIC/2Ld8+ug==
X-Received: by 2002:a05:6830:454:: with SMTP id d20mr2923366otc.156.1632177078729;
        Mon, 20 Sep 2021 15:31:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k23sm3846545ood.12.2021.09.20.15.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 15:31:17 -0700 (PDT)
Received: (nullmailer pid 918253 invoked by uid 1000);
        Mon, 20 Sep 2021 22:31:15 -0000
Date:   Mon, 20 Sep 2021 17:31:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Samuel Holland <samuel@sholland.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: input: sun4i-lradc-keys: Add R329 and
 D1 compatibles
Message-ID: <YUkLs+2amM5nHEz0@robh.at.kernel.org>
References: <20210908034016.24119-1-samuel@sholland.org>
 <20210908034016.24119-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210908034016.24119-2-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 07 Sep 2021 22:40:14 -0500, Samuel Holland wrote:
> The R329 and D1 SoCs each contain an LRADC with a programming interface
> compatible to earlier LRADCs. However, the LRADC now has its own clock
> gate and reset line, instead of being always active.
> 
> To support this, add clock/reset properties to the binding, and require
> them for the variant in the new SoCs.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>  .../input/allwinner,sun4i-a10-lradc-keys.yaml | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
