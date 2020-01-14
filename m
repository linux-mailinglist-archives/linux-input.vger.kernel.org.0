Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 911E213B5E4
	for <lists+linux-input@lfdr.de>; Wed, 15 Jan 2020 00:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgANXbg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Jan 2020 18:31:36 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:44819 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728890AbgANXbg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Jan 2020 18:31:36 -0500
Received: by mail-oi1-f195.google.com with SMTP id d62so13599767oia.11
        for <linux-input@vger.kernel.org>; Tue, 14 Jan 2020 15:31:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jAkgnrf4y6WZwtNfVCRDWdRSB0xmK/6Aa/25HCZGKjg=;
        b=pQGahGqzCOgD7kKzS2qGDIwhNndX0kkM004gtwKSFx4uONzwLNpTmiYxmRLDniDxvq
         fRoFuicJZZb/c/CABjM9l4YxbhWTOJF9NC814qb3KklDdC0K2bJICQQwCLMgm0fGHtzP
         QHQJyNDnfD6MT0QUbMm5YiR9y3/ExprrBDLO75ZQ/2J4pWsM6Ae/rczwxnRmYWI6FbEc
         nEh4Hf400Z2rQ1mA1LKUbe/6RnUexw2CriZEcIWugLOfgnFc37qN0b1H/tCw3CFgCumh
         kgKkio1y9bahnhf0wtGlmGJ+5ZajyO8zxc9kw0Q+lkE9LTpMPIuRAxbSELOxqiRIofhC
         wJmw==
X-Gm-Message-State: APjAAAVr90YpE+HiHl/X5ed2GXLbcwbGiuHDbkb71sIybz5hksUUxfEt
        EWQoPb8VceFZYQie2oJOBSUL/Tk=
X-Google-Smtp-Source: APXvYqwPhBV1XTUp031BMeeCOL2FnsIJ+5oX+UKfa7aKQiOnSoRLRflQ28aAaavV7+X5iSREp4HWsA==
X-Received: by 2002:aca:1b19:: with SMTP id b25mr19154965oib.24.1579044695474;
        Tue, 14 Jan 2020 15:31:35 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id p184sm5062371oic.40.2020.01.14.15.31.34
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2020 15:31:34 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2209ae
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Tue, 14 Jan 2020 17:31:34 -0600
Date:   Tue, 14 Jan 2020 17:31:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     dmitry.torokhov@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com, hadess@hadess.net,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yannick.fertre@st.com,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: touchscreen: Convert Goodix
 touchscreen to json-schema
Message-ID: <20200114233134.GA23810@bogus>
References: <20200108091118.5130-1-benjamin.gaignard@st.com>
 <20200108091118.5130-3-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200108091118.5130-3-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 8 Jan 2020 10:11:18 +0100, Benjamin Gaignard wrote:
> Convert the Goodix binding to DT schema format using json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - enumerate goodix's I2C adresses
> - add description for irq-gpio property
> - reference the common properties used by goodix
> 
>  .../bindings/input/touchscreen/goodix.txt          | 50 --------------
>  .../bindings/input/touchscreen/goodix.yaml         | 78 ++++++++++++++++++++++
>  2 files changed, 78 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.txt
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
