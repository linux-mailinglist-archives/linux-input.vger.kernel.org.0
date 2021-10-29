Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A6343F4DD
	for <lists+linux-input@lfdr.de>; Fri, 29 Oct 2021 04:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231356AbhJ2CQE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 28 Oct 2021 22:16:04 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:43810 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbhJ2CQD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 28 Oct 2021 22:16:03 -0400
Received: by mail-oi1-f172.google.com with SMTP id o4so11175714oia.10;
        Thu, 28 Oct 2021 19:13:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gGohQJqlejKfcVZOP9ip7LqKRM4sYO5ESmWMoVW4o80=;
        b=HVFGnCGZ86MCfDWxQrsAT9JhvdGvUoFA7Fh0yjjmOP6NVwJc5A/1K0hiM8a5re+gDB
         j+uZl42d9wsxJhtz0F4fJP4ZQDTSSMMcLy/bDi5PwDeWlpFsxeEq/6SdXQUCYbyDO1lu
         9JhhxLGrW7YNrEb/SELW4T6W6/OdcggZ2rGDYq92I14KTVoAkkjhQbgJubOU3QCFyQ4k
         Gv/ZIOk6HSlN/l/u8UtdVVo4UkSpERGFqUHy7ql13QmNGCDlwzKee23FUerbLmj8ELQQ
         Eh7+ZrFIolw86T3BMcJP6KoMxqu9l8XNxz0jR7XemeNgyObDKrwe/ybvXSws2NeOYLg9
         OUiA==
X-Gm-Message-State: AOAM533D5tvkdi4UmNanXe3DpysvtTCbjs3v0kYPSnvoltCn2sirW+bo
        sp1ujvgdb1HaHTDfUN2W7RWDsSpdIQ==
X-Google-Smtp-Source: ABdhPJzBL5UoW9RJ+PnAi6XGZJz7drdyg2UEJX8dkid5Fe3fKtqjMq6vKVRiISavWP9D3NCKzhRgwQ==
X-Received: by 2002:aca:5841:: with SMTP id m62mr2009997oib.150.1635473615577;
        Thu, 28 Oct 2021 19:13:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d10sm1476198ooj.24.2021.10.28.19.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 19:13:35 -0700 (PDT)
Received: (nullmailer pid 1022205 invoked by uid 1000);
        Fri, 29 Oct 2021 02:13:34 -0000
Date:   Thu, 28 Oct 2021 21:13:34 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dario Binacchi <dariobin@libero.it>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: input: ti-tsc-adc: fix tsc node example
Message-ID: <YXtYzsiQO7Cbz0Rj@robh.at.kernel.org>
References: <20211024145931.1916-1-dariobin@libero.it>
 <20211024145931.1916-5-dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211024145931.1916-5-dariobin@libero.it>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 24 Oct 2021 16:59:28 +0200, Dario Binacchi wrote:
> The commit c9aeb249bf72e ("Input: ti_am335x_tsc - fix spelling mistake
> in TSC/ADC DT binding") didn't fix the typo mistake in the tsc node of
> the example.
> 
> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> ---
> 
>  .../devicetree/bindings/input/touchscreen/ti-tsc-adc.txt        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
