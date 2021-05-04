Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF6E8372B73
	for <lists+linux-input@lfdr.de>; Tue,  4 May 2021 15:55:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbhEDN4f (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 May 2021 09:56:35 -0400
Received: from mail-oi1-f178.google.com ([209.85.167.178]:46004 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231348AbhEDN4f (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 May 2021 09:56:35 -0400
Received: by mail-oi1-f178.google.com with SMTP id n184so8802502oia.12;
        Tue, 04 May 2021 06:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=WZ5pxjNNPTm2l3JODG+DqBDp5b/+2GpgjrzHvwx+hHQ=;
        b=bi31w9451m/u7YzuTtKvTQ8BYOpKpSAwivbeQK8rxr7+0t9+yB8RU3xcFQ1LOmcDFc
         tJOpHCUFou4J/IiKU52h6BatGoCoLtdXqWoLInItcQJsgfYtCwSamY6USOD0HZ1eAZUI
         qvoc7zZ73KCDOex+gFslhV0wtx8ZbBYsdq7052DmY485KLv7s1AypPDc+GM37d1829s7
         SdCHQ9FgC/Iea3lP4hlO31/vUULhtMZooBlTdoiDm5HdchoFEYFn49K2x+lFOBkBp+5y
         zEox4zQgctRt6LHUDO8nPoxww+xGrGB5kOpX0L8S8WDErsVObfE6jyP69jLIQV7SB68B
         tM3w==
X-Gm-Message-State: AOAM530gwQX50KFe7Cwy3ss+eZgYUOrZsvf77WSChiHv1MXTRey9skHV
        WrcET0bsF7udopEX59Blqw79AfcdaQ==
X-Google-Smtp-Source: ABdhPJysUHmtjEPdrD01jgFrUXWS7410DKobwxFJ93Tr2tYYhc99uHjI5qXjC5uHLXdXydJKDgIQBA==
X-Received: by 2002:a05:6808:64d:: with SMTP id z13mr13100573oih.103.1620136538794;
        Tue, 04 May 2021 06:55:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f21sm746616otp.52.2021.05.04.06.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 06:55:37 -0700 (PDT)
Received: (nullmailer pid 4044730 invoked by uid 1000);
        Tue, 04 May 2021 13:55:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>,
        "~postmarketos/upstreaming@lists.sr.ht" 
        <~postmarketos/upstreaming@lists.sr.ht>
In-Reply-To: <_T7bJripXfkFGJcfJVL7E_n7RsT5UQzhvxauebspa-aGiMZkX3jk1yHiWeoqHOYQkd8UZgX2TT964OFeEYqtCMh-ZlPiK5kpb3AJqhZFKSs=@protonmail.com>
References: <_T7bJripXfkFGJcfJVL7E_n7RsT5UQzhvxauebspa-aGiMZkX3jk1yHiWeoqHOYQkd8UZgX2TT964OFeEYqtCMh-ZlPiK5kpb3AJqhZFKSs=@protonmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: input: Add binding for cypress-sf
Date:   Tue, 04 May 2021 08:55:37 -0500
Message-Id: <1620136537.083522.4044729.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 04 May 2021 08:48:26 +0000, Yassine Oudjana wrote:
> Add a device tree binding for Cypress StreetFighter.
> ---
>  .../devicetree/bindings/input/cypress-sf.yaml | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/cypress-sf.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/cypress-sf.yaml: 'maintainers' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/cypress-sf.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/input/cypress-sf.yaml
Documentation/devicetree/bindings/input/cypress-sf.example.dt.yaml:0:0: /example-0/i2c/touchkey@28: failed to match any schema with compatible: ['cypress,sf3155']

See https://patchwork.ozlabs.org/patch/1473675

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

