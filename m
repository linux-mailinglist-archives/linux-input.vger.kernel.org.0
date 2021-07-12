Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022C23C64ED
	for <lists+linux-input@lfdr.de>; Mon, 12 Jul 2021 22:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbhGLU3i (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Jul 2021 16:29:38 -0400
Received: from mail-il1-f179.google.com ([209.85.166.179]:39442 "EHLO
        mail-il1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhGLU3i (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Jul 2021 16:29:38 -0400
Received: by mail-il1-f179.google.com with SMTP id a7so1623880iln.6;
        Mon, 12 Jul 2021 13:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZN5FcZu+PY4FpNaDTnMX4Eb4fZqMABgdLrcctSAoDkc=;
        b=gFK0BSjQOBiCcrU416K02Fl/oJbtf/4e1gEXc7BVD/F66qUfbfDwfZcjBgsDOjVtt/
         YkL0qgezDEA5t/Y72XV6zqnFFPilPop0ovH2H4YTJjIBMHiwK9RYiC9cuXY5y4VQurtb
         +IoQ+GFUvmToWCIBKnvfcOYNq67XrxxpB6rZ5ocI8S8TBGY1JNEocoisiJQM+dCrE/Qa
         UHV17bO5nZQoeEZSrHsTyA2cHzhwtpvhUrsVwjzA+3Tppze5Nlu0YCBfgIR4cxcAs2+T
         V4Ba/2G4wtMj3x/b2eHJ01EdwVZ0tMBECRNF1QXAKemZGx20hZiVZg4eUaBuwN4L9jp1
         za9w==
X-Gm-Message-State: AOAM5303TIb2zUAYU21SG+9Ldm/mWjEiw2DdQmpTgn+R52sK2Kc5i0kQ
        w4AvqrUT4M921zORpvoPeg==
X-Google-Smtp-Source: ABdhPJxcg8sYJpsV/rPJGQQR+rL0RsXATTQ9MOrIqgRBtvwsZMtksv6fK3PtY7HCahBNuxaaClhrPw==
X-Received: by 2002:a05:6e02:47:: with SMTP id i7mr451594ilr.35.1626121609135;
        Mon, 12 Jul 2021 13:26:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id o7sm8865639ilt.29.2021.07.12.13.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:26:48 -0700 (PDT)
Received: (nullmailer pid 2431753 invoked by uid 1000);
        Mon, 12 Jul 2021 20:26:45 -0000
Date:   Mon, 12 Jul 2021 14:26:45 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     kernel@dh-electronics.com, Rob Herring <robh+dt@kernel.org>,
        Michael Welling <mwelling@ieee.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v3] dt-bindings: input: tsc2005: Convert to YAML schema
Message-ID: <20210712202645.GA2431700@robh.at.kernel.org>
References: <20210620210708.100147-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210620210708.100147-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 20 Jun 2021 23:07:08 +0200, Marek Vasut wrote:
> Convert the TI TSC2004/TSC2005 DT bindings to YAML schema.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: Michael Welling <mwelling@ieee.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: kernel@dh-electronics.com
> Cc: linux-input@vger.kernel.org
> To: devicetree@vger.kernel.org
> ---
> V2: - Switch the license to (GPL-2.0-only OR BSD-2-Clause)
> V3: - Drop quotes, use enum: instead of oneOf+const
>     - Add maxItems to reg: and reset-gpios:
>     - Drop ref uint32
> ---
>  .../input/touchscreen/ti,tsc2005.yaml         | 128 ++++++++++++++++++
>  .../bindings/input/touchscreen/tsc2005.txt    |  64 ---------
>  2 files changed, 128 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/tsc2005.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
