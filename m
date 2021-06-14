Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB2D3A6835
	for <lists+linux-input@lfdr.de>; Mon, 14 Jun 2021 15:40:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhFNNmU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 14 Jun 2021 09:42:20 -0400
Received: from mail-il1-f180.google.com ([209.85.166.180]:44650 "EHLO
        mail-il1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234200AbhFNNmQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 14 Jun 2021 09:42:16 -0400
Received: by mail-il1-f180.google.com with SMTP id i17so12204645ilj.11;
        Mon, 14 Jun 2021 06:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=OxkVXBVM55LDwVRAZPY6AljtXcBqUD2U0cvNY0im0TI=;
        b=Dl2l5ICfALK0KfquruUxr0jmurOyOla+6ywhgnh4IvG+ZRYbJ5192uXACZCiQbsbIm
         /ir62VToOl9AWAPOCUe39zJrMTw4sAoKg/aiz5o7Zdhx5UoQirMwfELxn0kjzOhixRJq
         DhzIru6kIyaATKay3imHHfK47keSyjZQiBl9g6T0aXTAkRBdYURqyc8brIfAI6pd1jUT
         uMj7nS6Dxc0SyZc+JEmxjaWwrBNIA24clu7A5mpQfQ7vs3FwTnDU7mbMGBfZ9pe0eaAO
         AbGNQC+HkJDZg9Uw6W8oDI9Zk5ZZRqzEdYtBttMBWEYUobTbZzZClNoqjeP8fkee8ron
         nY7Q==
X-Gm-Message-State: AOAM530wWEhr52zDrqrYuL7A4A8HDwvVi9CBszN7ldSUtyXlRajTSkA/
        LMu6aveanJAoHybo+KyU1djlsFE30w==
X-Google-Smtp-Source: ABdhPJy6lhmA8NFPbyoWawUnEPz8LESbIgELTYTaG2/ny9Psly+KNDI+gFkFRpNEZ6qgODjZAgjcWg==
X-Received: by 2002:a92:ccd1:: with SMTP id u17mr13864514ilq.239.1623677998429;
        Mon, 14 Jun 2021 06:39:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id r10sm7695817ilq.46.2021.06.14.06.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 06:39:57 -0700 (PDT)
Received: (nullmailer pid 630749 invoked by uid 1000);
        Mon, 14 Jun 2021 13:39:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-input@vger.kernel.org, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20210612205405.1233588-2-caleb@connolly.tech>
References: <20210612205405.1233588-1-caleb@connolly.tech> <20210612205405.1233588-2-caleb@connolly.tech>
Subject: Re: [PATCH 1/4] dt-bindings: input: add Qualcomm QPNP haptics driver
Date:   Mon, 14 Jun 2021 07:39:48 -0600
Message-Id: <1623677988.130611.630748.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 12 Jun 2021 20:54:31 +0000, Caleb Connolly wrote:
> Add bindings for pmi8998 qpnp haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,qpnp-haptics.yaml     | 123 ++++++++++++++++++
>  include/dt-bindings/input/qcom,qpnp-haptics.h |  31 +++++
>  2 files changed, 154 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,qpnp-haptics.yaml
>  create mode 100644 include/dt-bindings/input/qcom,qpnp-haptics.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/input/qcom,qpnp-haptics.example.dt.yaml:0:0: /example-0/pmic@3: failed to match any schema with compatible: ['qcom,pmi8998', 'qcom,spmi-pmic']
Documentation/devicetree/bindings/input/qcom,qpnp-haptics.example.dt.yaml:0:0: /example-0/pmic@3: failed to match any schema with compatible: ['qcom,pmi8998', 'qcom,spmi-pmic']
\ndoc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1491323

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

