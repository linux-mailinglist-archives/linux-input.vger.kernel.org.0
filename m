Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 372001632EE
	for <lists+linux-input@lfdr.de>; Tue, 18 Feb 2020 21:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgBRUUU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 18 Feb 2020 15:20:20 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35597 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726461AbgBRUUU (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 18 Feb 2020 15:20:20 -0500
Received: by mail-ot1-f65.google.com with SMTP id r16so20868422otd.2;
        Tue, 18 Feb 2020 12:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0sk/DiFbdUO1CjcLOsbgvHtz8ywIVcvdBJdDGhidsjg=;
        b=JL18C3pCBTlenvdqJXAft45qjB7pNiYaCmnzhjrX72gRFMzUYtWKCO0moQCJVK6buM
         gt/VRN5m3xSX3Zdhrz0ATH74mVg/1WGAExwwv2uoRUvRnvoPOnUNB7dN8ubygBCXyyNT
         vJAw10SSTkhECfq1jdH+9a6aUZoLjL1aEKKWkdtB587LN+HUDtAX5nZHnv89eMr9l8WT
         OLf39xxDHVbY5ff2/fFvEIu7nIAX3gC200GFSqEo6XlrNoKxpCYjub3Pj83KoHOShClN
         v5Lu61iE1wLiLLe59saCG4bqCcLHvc4oooF02AXGTC6lpohGra+qCvemVZGFINeivHb0
         NDMA==
X-Gm-Message-State: APjAAAWQo5UjV5ByJPldpaVdvb2AsZo7/uPkCQQdtH/NONpQhzWVWvXP
        GA++DmOMXwN/fsOa/+4mLw==
X-Google-Smtp-Source: APXvYqyYp4q4l5K8GhDL9kSXvC3+KeqD2chiQs3xknPlpocsA8HgwMxMkWvRAMwYExwt9IlnRp8r5A==
X-Received: by 2002:a9d:67c9:: with SMTP id c9mr17953988otn.144.1582057219213;
        Tue, 18 Feb 2020 12:20:19 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d131sm1548444oia.36.2020.02.18.12.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2020 12:20:18 -0800 (PST)
Received: (nullmailer pid 32149 invoked by uid 1000);
        Tue, 18 Feb 2020 20:20:17 -0000
Date:   Tue, 18 Feb 2020 14:20:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Ikjoon Jang <ikjn@chromium.org>
Cc:     devicetree@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nicolas Boitchat <drinkcat@chromium.org>,
        linux-input@vger.kernel.org, Ikjoon Jang <ikjn@chromium.org>
Subject: Re: [PATCH v4] dt-bindings: mfd: Convert ChromeOS EC bindings to
 json-schema
Message-ID: <20200218202017.GA31468@bogus>
References: <20200114021934.178057-1-ikjn@chromium.org>
 <20200214062614.220699-1-ikjn@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200214062614.220699-1-ikjn@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 14 Feb 2020 14:26:14 +0800, Ikjoon Jang wrote:
> Convert the ChromeOS EC bindings to json-schema.
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> 
> ---
> v4: text reflows, add type references, and fix examples
> v3: node name changed in rpmsg example
> v2: cleanup description, fix typos, remove LPC, and add RPMSG example
> ---
>  .../devicetree/bindings/mfd/cros-ec.txt       |  76 ----------
>  .../devicetree/bindings/mfd/cros-ec.yaml      | 139 ++++++++++++++++++
>  2 files changed, 139 insertions(+), 76 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/cros-ec.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/cros-ec.example.dt.yaml: cros-ec@0: 'google,cros-ec-spi-msg-delay', 'google,cros-ec-spi-pre-delay', 'spi-max-frequency' do not match any of the regexes: 'pinctrl-[0-9]+'

See https://patchwork.ozlabs.org/patch/1237876
Please check and re-submit.
