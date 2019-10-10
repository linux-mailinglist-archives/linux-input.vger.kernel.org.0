Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4D93D3173
	for <lists+linux-input@lfdr.de>; Thu, 10 Oct 2019 21:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725901AbfJJTfk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 10 Oct 2019 15:35:40 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35395 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJTfk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 10 Oct 2019 15:35:40 -0400
Received: by mail-ot1-f66.google.com with SMTP id z6so5942566otb.2;
        Thu, 10 Oct 2019 12:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=vW85aBJEjSoKMu7QeWdMsE/2Qsu8yWRYb2sh33R+nkw=;
        b=LyRxEhWGg7PyHeCzkBzMINGFDo+1rpa+1DPqSbUoOcqtxZjkd0itWVNFlmzhU4Dvrt
         xle526PZyeS+mHls/KYCAzX2CXRxhkjgQD6gXeSf6tHdAnuRhiHLdXRt989F6oNyTqMT
         cZiB8PZLBYH6mRdZAxV6d1QK6sK4aDjs0mrmkKOJRrz/WeTdheu45NFYPSvF5mYMn+ED
         A4+AbWOPXhm5Ou6eZjDMjhFocan5O1RoPrApOw4wKS+WM2cGsIO7sXdAdLIabBYQ15m0
         97oztn3WSAWM6em0ne1rM7D/+KQCGYBHip/KILghV7Yofbtbrw6HBrgpWczSY5ZEniyk
         QmYQ==
X-Gm-Message-State: APjAAAUqOnyXpGxXAEdhDAqXNrRgMS+DJ8foLKiGNbX6VagZZ8pY58Hx
        ahv4VIpV2gRxWHFMn0wiBQ==
X-Google-Smtp-Source: APXvYqwwg6PBkkhgAo4JEubPuzsG20zToJJlWdJg3ulqcuyE/0il11c0fAPHCJsWeAVyOQwVbWbBhQ==
X-Received: by 2002:a05:6830:16c8:: with SMTP id l8mr7098275otr.214.1570736139121;
        Thu, 10 Oct 2019 12:35:39 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id k204sm1963778oif.33.2019.10.10.12.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 12:35:38 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:35:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: input: Add common input binding in
 json-schema
Message-ID: <20191010193537.GA14324@bogus>
References: <1570083176-8231-1-git-send-email-michal.vokac@ysoft.com>
 <1570083176-8231-2-git-send-email-michal.vokac@ysoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1570083176-8231-2-git-send-email-michal.vokac@ysoft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu,  3 Oct 2019 08:12:52 +0200, =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= wrote:
> Create schema for the common input properties and merge all properties
> from the Documentation/devicetree/bindings/input/keys.txt binding into
> this common schema.
> 
> Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
> ---
> Changes since v2:
>  - Merge content of keys.txt binding inti this schema.
> 
> Changes since v1:
>  - New patch in the series.
> 
>  Documentation/devicetree/bindings/input/input.yaml | 32 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/input/keys.txt   |  8 ------
>  .../devicetree/bindings/input/mtk-pmic-keys.txt    |  4 +--
>  .../devicetree/bindings/input/st,stpmic1-onkey.txt |  2 +-
>  4 files changed, 35 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/input.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/keys.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
