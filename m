Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98F0A3AF219
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 19:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhFURmX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 13:42:23 -0400
Received: from mail-oo1-f46.google.com ([209.85.161.46]:43828 "EHLO
        mail-oo1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbhFURmV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 13:42:21 -0400
Received: by mail-oo1-f46.google.com with SMTP id z14-20020a4a984e0000b029024a8c622149so4681256ooi.10;
        Mon, 21 Jun 2021 10:40:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=OTu1rFDXJaf7m6eaRf3X1vz4LoglE2W+ViSBkQZ+Tmo=;
        b=iaZMWWwWPpbDk8oFGmtGwTM/DQ7U0hjnZCDVUvJ5NpfK0TnxR2IunoanE1zXXMZ5ap
         FMfLAPf5ELorhFyevqVvDkqSKZHInIq8KIrdowvKF+MiYRBNMk8HgcGRitOq4cbxdIJ7
         18COWDJR0tphxG9yQPCDnBm8rG7o+3yWFNtJj6rGBNApTlaPS+p7nc8zeE+eqUWtbVwI
         Pbmd0o7PVHpZ4s8sIE1zhVEBdzRQnP/lkLrxgfmuEau05ie74R/LwAEngfmDEbKVLBmk
         dmZaEsw+mGmrGRzH1gGcIZTsS4QO8ggXDjbpnLCZ9YBgWcouy2yRG2GKh0vYQUqXvqev
         OjTg==
X-Gm-Message-State: AOAM533cgZlWv5KvRAs3i7Z3xdL3cLbU6oEgxH8EldIzR309f7KCsn+x
        GXm3LgYgf4TWachuVGPo9w==
X-Google-Smtp-Source: ABdhPJyj0i0dlbjjULNKOFeXXFeW9k3yDTGHMW07iAO8gEx7hy2a9JMAVGFPynK0H0u+7IZnwMYzRw==
X-Received: by 2002:a4a:e989:: with SMTP id s9mr12227893ood.44.1624297205219;
        Mon, 21 Jun 2021 10:40:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a78sm3685164oii.42.2021.06.21.10.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 10:40:04 -0700 (PDT)
Received: (nullmailer pid 1161628 invoked by uid 1000);
        Mon, 21 Jun 2021 17:40:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, phone-devel@vger.kernel.org,
        jo@jsfamily.in, jami.kettunen@somainline.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
In-Reply-To: <20210618175041.323495-2-caleb@connolly.tech>
References: <20210618175041.323495-1-caleb@connolly.tech> <20210618175041.323495-2-caleb@connolly.tech>
Subject: Re: [RESEND PATCH v2 1/6] dt-bindings: input: add Qualcomm SPMI haptics driver
Date:   Mon, 21 Jun 2021 11:40:02 -0600
Message-Id: <1624297202.328811.1161627.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 18 Jun 2021 17:51:03 +0000, Caleb Connolly wrote:
> Add bindings for qcom PMIC SPMI haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,spmi-haptics.yaml     | 128 ++++++++++++++++++
>  include/dt-bindings/input/qcom,spmi-haptics.h |  32 +++++
>  2 files changed, 160 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>  create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml:23:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/input/qcom,spmi-haptics.example.dt.yaml:0:0: /example-0/pmic@3: failed to match any schema with compatible: ['qcom,pmi8998', 'qcom,spmi-pmic']
Documentation/devicetree/bindings/input/qcom,spmi-haptics.example.dt.yaml:0:0: /example-0/pmic@3: failed to match any schema with compatible: ['qcom,pmi8998', 'qcom,spmi-pmic']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1494375

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

