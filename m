Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C98AD1923E0
	for <lists+linux-input@lfdr.de>; Wed, 25 Mar 2020 10:19:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgCYJTR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Mar 2020 05:19:17 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44625 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgCYJTR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Mar 2020 05:19:17 -0400
Received: by mail-wr1-f67.google.com with SMTP id m17so1887328wrw.11
        for <linux-input@vger.kernel.org>; Wed, 25 Mar 2020 02:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=jNQsElt5CknsQbyuzbClTNd1rNuCD5PB0IFY7FEkEZE=;
        b=Zbj6ldZYm/mR4aIkxVyvY0IPEf0i16ypXx5eYF0TkoVSDTejJNAwc128AVd2WXPFvo
         xZ4lSV5Z37VyDD4C0CeoUTKuDVd97oJKvHvnUYhKiNnQf0iMWhCO8Jr2TQgTe8tIOtdM
         6humiowd7FhUMmlsTlfTvB6RKGIWWCqQ7EVNY6qNUHIJZTFtA+WcFM8HGw/gPSmA2DVJ
         zcBaHh6jKvUjRHNl5Rd/1CWV8sZ51VL+znHwfW2zFnzcM0MUB2ME0GFN828xxmA5BQBT
         K9PL+VfT2szihueuddUB3PiYHcUerLFe4r+gqKQW7/X7MJslYafLSu9W/qEWxyA0VQUI
         WbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=jNQsElt5CknsQbyuzbClTNd1rNuCD5PB0IFY7FEkEZE=;
        b=WIcYp67WFcDfZkyxYGX0SqWB7xP8OyMu+k9VCC5pXWankejqM6o0+fCFTZOZxaiQbV
         5KZmHP9NiWl0CU1iGmpG57AunrZpdwTShuMdtslFwrvxDCOi/DtfD+ji/UUJQtBKf3Mq
         WNiNOB2LnRF3iPAhskwGFstGpftgShul7HxP1bnpsaVnH/vwNAPuLQjh782eISZJR0Pb
         6Ic4uBy2Md3xcRUZwkKzniun1VwFKMyIWmhj4EU4f9uHAsDHqdDSA4eOizfPbqX0lxB/
         Ykb/1J2X1I6QS3E226Gj64qzRC3Nhgz+uXoyq41KbvdtmMDjPJZTebxlmrRAfLIMLwVZ
         9Q8Q==
X-Gm-Message-State: ANhLgQ2QE/iAGDPl3m0aj0QWBOzg9O5GOHIfCYGOiqUScZLI0BRLzJBE
        vCjjxyIGwSjGXiryvgF3HvrMMg==
X-Google-Smtp-Source: ADFU+vt92TEy1uQV/pgVv75Mxe1VsUGqvn6nRZAGARmxAmaHNRKw1/pBPR5pqT6ZOGKIR2rc2xfxew==
X-Received: by 2002:a5d:6646:: with SMTP id f6mr2228715wrw.235.1585127955840;
        Wed, 25 Mar 2020 02:19:15 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id o9sm33495181wrw.20.2020.03.25.02.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 02:19:15 -0700 (PDT)
Date:   Wed, 25 Mar 2020 09:20:04 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Benjamin Gaignard <benjamin.gaignard@st.com>,
        dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, lgirdwood@gmail.com, broonie@kernel.org,
        wim@linux-watchdog.org, linux@roeck-us.net, p.paillet@st.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v5] dt-bindings: mfd: Convert stpmic1 bindings to
 json-schema
Message-ID: <20200325092004.GF442973@dell>
References: <20200304094220.28156-1-benjamin.gaignard@st.com>
 <20200310211849.GA13562@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200310211849.GA13562@bogus>
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 10 Mar 2020, Rob Herring wrote:

> On Wed, 4 Mar 2020 10:42:20 +0100, Benjamin Gaignard wrote:
> > Convert stpmic1 bindings to json-schema.
> > 
> > Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> > ---
> > version 5:
> > - move $ref regulator.yaml under a patternProperties
> > - move remain fixed strings under properties field
> > 
> > version 4:
> > - move on uppder node $ref: ../regulator/regulator.yaml 
> > - move fixed strings under properties field
> > - remove unneeded () in patternProperties
> > - keep ldo3 separate from other ldo properties
> > Note:
> > - 'st,mask-reset' property stay in each subnode, I don't find
> >   the syntax to avoid dupliquate it. 
> > - ldo6-supply and all possible *-supply are describe by this regular
> >   expression: ^(buck[1-4]|ldo[1-6]|boost|pwr_sw[1-2])-supply$":
> > 
> > version 3:
> > - put $ref under allOf keyword
> > - for each regulator node add the list of supported regulator properties
> > 
> >  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  28 --
> >  .../devicetree/bindings/mfd/st,stpmic1.txt         |  61 ----
> >  .../devicetree/bindings/mfd/st,stpmic1.yaml        | 339 +++++++++++++++++++++
> >  .../bindings/regulator/st,stpmic1-regulator.txt    |  64 ----
> >  .../bindings/watchdog/st,stpmic1-wdt.txt           |  11 -
> >  5 files changed, 339 insertions(+), 164 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/input/st,stpmic1-onkey.txt
> >  delete mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.txt
> >  create mode 100644 Documentation/devicetree/bindings/mfd/st,stpmic1.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/regulator/st,stpmic1-regulator.txt
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/st,stpmic1-wdt.txt
> > 
> 
> Reviewed-by: Rob Herring <robh@kernel.org>

Can you take this please Rob?

It would save an IB and PR.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
