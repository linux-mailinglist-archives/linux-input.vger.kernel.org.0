Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A860821E1EF
	for <lists+linux-input@lfdr.de>; Mon, 13 Jul 2020 23:15:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgGMVPo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 13 Jul 2020 17:15:44 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:36476 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726325AbgGMVPo (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 13 Jul 2020 17:15:44 -0400
Received: by mail-io1-f65.google.com with SMTP id y2so15089940ioy.3;
        Mon, 13 Jul 2020 14:15:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TLAmIh7PGiy8Elkp9WfdHWsiIaBqblmgqgbJwsBm6fc=;
        b=c8b79tEb/oPhiWsJPYUFTqmtnYTQrcp02k/JfGiaIJSdgkEsu9WCTSpwKFQVniqHc5
         xdghb9mQelLbtLatS1RcrtXXga73nVziZXGogKIwd4dPjo9ml/EdniqY/eOUn3e8nQpM
         ftyYpbdmyR2z3IddtevLrYzXyyzr7m6D5a1YFDlY4V72XjrPDj5PZRRInXXA+UiwHHa/
         NlVAgGESyEvQFe9N9RZuCtZhpDLNh9ybUmL1ZeT6f9VkiLwtQ790kpnen/C0wt2AYN8T
         JY5xu754OQQk32Eh8dsXdfLCGeSG8Llu+Rk2JYDXXl/BX43PLSfK8QvD6PvIacJ/7PRH
         HGvw==
X-Gm-Message-State: AOAM532pybpffIx1e5QTFa0a0EbFTEIYDpCwv6K7VqULu0VdiXcrQw/G
        vSJcUYsyQd1Lvj8llhZCQg==
X-Google-Smtp-Source: ABdhPJyz9AdNVksfPY6LcZ1FntFB0jMTvlZlVxQt3pFsHDsgWUb1QWLWtG8R3kxLoEFWfBrXh5P/3Q==
X-Received: by 2002:a6b:3ec6:: with SMTP id l189mr1794349ioa.32.1594674943360;
        Mon, 13 Jul 2020 14:15:43 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id t14sm9372021ilk.17.2020.07.13.14.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 14:15:42 -0700 (PDT)
Received: (nullmailer pid 742503 invoked by uid 1000);
        Mon, 13 Jul 2020 21:15:41 -0000
Date:   Mon, 13 Jul 2020 15:15:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ondrej Jirman <megous@megous.com>
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Tomas Novotny <tomas@novotny.cz>, Chen-Yu Tsai <wens@csie.org>,
        Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v3 1/4] dt-bindings: input: gpio-vibrator: Don't require
 enable-gpios
Message-ID: <20200713211541.GA742453@bogus>
References: <20200702112041.1942707-1-megous@megous.com>
 <20200702112041.1942707-2-megous@megous.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702112041.1942707-2-megous@megous.com>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 02 Jul 2020 13:20:38 +0200, Ondrej Jirman wrote:
> It is possible to turn the motor on/off just by enabling/disabling
> the vcc-supply. Change the binding to require either enable-gpios
> or vcc-supply or both.
> 
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> ---
>  Documentation/devicetree/bindings/input/gpio-vibrator.yaml | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
