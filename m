Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCA05183960
	for <lists+linux-input@lfdr.de>; Thu, 12 Mar 2020 20:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgCLTUZ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 12 Mar 2020 15:20:25 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44127 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726779AbgCLTUZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 12 Mar 2020 15:20:25 -0400
Received: by mail-oi1-f196.google.com with SMTP id d62so6671059oia.11;
        Thu, 12 Mar 2020 12:20:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GhJvI6SXnxumTZiju604gArYxIMDgxUFSUD1KLJ0wAU=;
        b=mDkniB9vNS8TOCzn3rFZLBSzWPxNbBq73VtdXHzixo4E01EMSVqG8x/AnhCqcoI+64
         +qLp+RpT2w4n43D+IfNP6j+FleP5F9/N7mzZqiMYeuLgJzhQPCQkPG9F0QZxwCkda3W6
         wfp3WU4p/pQ4ddGstes5w60yOfpsQWlOG1woDqg7dLvv53CIuHCkuYzCYVUZk+qQWe9y
         1fr4bU65uRd3rvCWNru683vRsLGyuHYfygO5DnnEs0XIyIl9ulCHaTZKx4Qk+v4MqZdM
         nD2oZK92JFvZQEUFgelQNG1SsNkTbn5KR4aQ9Gp/Tf6DbD33lf4GMKWbPNgMij8fI9Pz
         6XRQ==
X-Gm-Message-State: ANhLgQ0AcWhSefhYuoa0GBGtYsbY1bZ+oXmO1Krtm8UmVquQMbJWMKyz
        Pja5HdaxpBtiQDKXAo++aQ==
X-Google-Smtp-Source: ADFU+vt+tKHi0IfSz+DZ3wsjyAwIH9cWufc6MEOwUwwMLPydxHHr0G4bItnb3g1/44KQYNly7aWvNg==
X-Received: by 2002:aca:4a86:: with SMTP id x128mr3989088oia.29.1584040824868;
        Thu, 12 Mar 2020 12:20:24 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c12sm7039643oic.27.2020.03.12.12.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:20:24 -0700 (PDT)
Received: (nullmailer pid 19761 invoked by uid 1000);
        Thu, 12 Mar 2020 19:20:23 -0000
Date:   Thu, 12 Mar 2020 14:20:23 -0500
From:   Rob Herring <robh@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v7] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200312192023.GA19701@bogus>
References: <20200306085513.76024-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200306085513.76024-1-ikjn@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri,  6 Mar 2020 16:55:13 +0800, Ikjoon Jang wrote:
> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 -----------
>  .../bindings/mfd/google,cros-ec.yaml          | 129 ++++++++++++++++++
>  2 files changed, 129 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
