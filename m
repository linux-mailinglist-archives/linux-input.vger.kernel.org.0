Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 229C666FE5
	for <lists+linux-input@lfdr.de>; Fri, 12 Jul 2019 15:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfGLNVE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 12 Jul 2019 09:21:04 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35185 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727363AbfGLNVE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 12 Jul 2019 09:21:04 -0400
Received: by mail-io1-f66.google.com with SMTP id m24so20312774ioo.2;
        Fri, 12 Jul 2019 06:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=2UL2mnZCPkCTZV6CESXKITDWEo89BRhgftonMWCOO2w=;
        b=JDEL7uvNosMXNs0O5gFmKuRffJoPn286onZf3iA/yRKnyFlvyPi14stFNwAOZjsziO
         p+TtEE+2vN46meqqFXj8p1i8Wr7QAvQ4SBWh9h+GjyuI7AvN712ZsBH0b9IHsFyD5jJM
         oooXtHOUG++fwyaBz6XAGL3J+PBfVjyjl9f03YaCaTqARmnGkbPXZdeDPMCWjev7z9Yq
         6e/RZRF6dvzK+I7+Td1hphRrzyXBu9CrMSCW8VHJ27fFO9NcNYZwk5eLP4x+mx6530MS
         CxMTEpRzyu9lYyfkn1PwvZsTEjx4fWDcCKuxwfi4fKQbmUkH3neyL3iHznMx19mC4Q+a
         uEnA==
X-Gm-Message-State: APjAAAUeBVU1KvMBZ7XQAb3PICnnqV7wGKNNTdbsLnVu9K3FgH4hHBpI
        xJbIa/P1bqhWIVLg/URlEfpFmAc=
X-Google-Smtp-Source: APXvYqwUoy6UABopNKNR3d8AK3hktAfMGC3cBS4c0ekTlwdNS08IyL6BP+rsgMImFLqeDLBme67yfg==
X-Received: by 2002:a6b:b985:: with SMTP id j127mr10700748iof.186.1562937663053;
        Fri, 12 Jul 2019 06:21:03 -0700 (PDT)
Received: from localhost ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id v13sm7594326ioq.13.2019.07.12.06.21.02
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 12 Jul 2019 06:21:02 -0700 (PDT)
Date:   Fri, 12 Jul 2019 07:21:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: Convert Allwinner LRADC to a schema
Message-ID: <20190712132100.GA6212@bogus>
References: <20190711093835.20663-1-maxime.ripard@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190711093835.20663-1-maxime.ripard@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 11 Jul 2019 11:38:35 +0200, Maxime Ripard wrote:
> The Allwinner SoCs have an LRADC used to report keys and supported in
> Linux, with a matching Device Tree binding.
> 
> Now that we have the DT validation in place, let's convert the device tree
> bindings for that controller over to a YAML schemas.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  .../input/allwinner,sun4i-a10-lradc-keys.yaml | 95 +++++++++++++++++++
>  .../bindings/input/sun4i-lradc-keys.txt       | 65 -------------
>  2 files changed, 95 insertions(+), 65 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/allwinner,sun4i-a10-lradc-keys.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
> 

Applied, thanks.

Rob
