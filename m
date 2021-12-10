Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8779470261
	for <lists+linux-input@lfdr.de>; Fri, 10 Dec 2021 15:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241953AbhLJOHD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 10 Dec 2021 09:07:03 -0500
Received: from mail-ot1-f44.google.com ([209.85.210.44]:39783 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238527AbhLJOHC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 10 Dec 2021 09:07:02 -0500
Received: by mail-ot1-f44.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso9696272ots.6;
        Fri, 10 Dec 2021 06:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=rVRrTBb9q/NCoqfDDtJ8WKORuC9JyQfXU3LAsb0zmuQ=;
        b=i++gI6AaUWjZXe6AB3rI4w2ILQfbS1GtUWNKvB+amKE7lh5lsreWmCeOsKjaS44NSm
         KQ08kRRMqra478Luq1uliqRanfAL7LrAsmOu7bwauEQErt2zWwj42DamCXGIzAj+Acvk
         u6i3Azl6pvlXNB02XayRxzxHw0a8ttEYZWrDz32MJkVSiuSFImxF1sPiQRv0rHmaRoBn
         19SWiqGfc8eipi7BSCYk4eaKYWesn9pDzR//as+zPoMA8//0DCid4W/W1haZZwYRi+XP
         3ow2TnQAoB0YIWNMQ+7NBsbA3loSJniasa9JFZgsTR30oRmEYnv2FUJbtilx0OhO5pgF
         +T3g==
X-Gm-Message-State: AOAM53287GxJ16MrhMFqHIuWdpK1w5eDCsz8cTiLZnI+DaSRI/3w92jo
        qUNsn8aWEs6HIyIvyKP/Fg==
X-Google-Smtp-Source: ABdhPJzN2rZdC0uEutsphHM9PYfxPzgBhWCxfsRbj5UYe++lcRt03vRrmfIyfu/AMzS+uRmmQ2tx5g==
X-Received: by 2002:a9d:4b09:: with SMTP id q9mr11055852otf.140.1639144978004;
        Fri, 10 Dec 2021 06:02:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j20sm517383ota.76.2021.12.10.06.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 06:02:57 -0800 (PST)
Received: (nullmailer pid 1252238 invoked by uid 1000);
        Fri, 10 Dec 2021 14:02:56 -0000
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>, Joel Selvaraj <jo@jsfamily.in>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20211210022639.2779173-2-caleb@connolly.tech>
References: <20211210022639.2779173-1-caleb@connolly.tech> <20211210022639.2779173-2-caleb@connolly.tech>
Subject: Re: [PATCH v4 1/6] dt-bindings: input: add Qualcomm SPMI haptics driver
Date:   Fri, 10 Dec 2021 08:02:56 -0600
Message-Id: <1639144976.203271.1252236.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 10 Dec 2021 02:26:52 +0000, Caleb Connolly wrote:
> Add bindings for qcom PMIC SPMI haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
>  .../bindings/input/qcom,spmi-haptics.yaml     | 123 ++++++++++++++++++
>  include/dt-bindings/input/qcom,spmi-haptics.h |  32 +++++
>  2 files changed, 155 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>  create mode 100644 include/dt-bindings/input/qcom,spmi-haptics.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml: properties:qcom,wave-play-rate-us: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml: ignoring, error in schema: properties: qcom,wave-play-rate-us
warning: no schema found in file: ./Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
Documentation/devicetree/bindings/input/qcom,spmi-haptics.example.dt.yaml:0:0: /example-0/spmi/haptics@c000: failed to match any schema with compatible: ['qcom,pmi8998-haptics']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1566175

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

