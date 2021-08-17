Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C29AA3EEC31
	for <lists+linux-input@lfdr.de>; Tue, 17 Aug 2021 14:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237125AbhHQML0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Aug 2021 08:11:26 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:41556 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbhHQMLX (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Aug 2021 08:11:23 -0400
Received: by mail-ot1-f45.google.com with SMTP id w22-20020a056830411600b0048bcf4c6bd9so2005910ott.8;
        Tue, 17 Aug 2021 05:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=jQ2l3WXqoH22mFDQEW/1VSsXU0XAw7Dnr3dv/FtM+pE=;
        b=T6xdRfeT2AbrU9CtB8MAGkBykyhAv5vDgrkQ76UcLWQD+7L0cKNq973+UPOrG+5+MY
         1I7K31qrtzcE5i7g7Bp0pQ4xSSbGP1PI4MgWoXksNiLlJLEfmTidhx3gdhMqZGmxTWi/
         Sk91wN0Pd2ESjM6izMsRzM42GQFdxUbkXYMKlrgxJKEvRbo0tDcT46JGvHzjAHPEleWj
         zkgl95by/8U4GoXAVxeb0rlVW+kztTBeHfUGPTOVW8zXULhwu20IiyENxS+0Vrxf1+Xe
         Q6grshsUrHsabqE3qlCdEA7x49jh0/O2bp0fHFqbJKRxFid6AzxdElGYCMq69QRpi6Mm
         PgOw==
X-Gm-Message-State: AOAM533NJcxWcaF6ESRNad7Z49vwM+E27P/QyE/TCzcDpByyiGCuHBeV
        zH10oByjNPgAIO53UVw1Ng==
X-Google-Smtp-Source: ABdhPJyx5bUXH5T9Qhnhqxeq+w14eA1RIP7smOUbOTFqJYFnmnDAEPgvnRUQRvyS1m1hxMFMT6e+Pg==
X-Received: by 2002:a05:6830:1105:: with SMTP id w5mr2354720otq.85.1629202250091;
        Tue, 17 Aug 2021 05:10:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u15sm424438oiu.43.2021.08.17.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 05:10:49 -0700 (PDT)
Received: (nullmailer pid 4133263 invoked by uid 1000);
        Tue, 17 Aug 2021 12:10:48 -0000
From:   Rob Herring <robh@kernel.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     linux-input@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Joel Selvaraj <jo@jsfamily.in>, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jami Kettunen <jami.kettunen@somainline.org>
In-Reply-To: <20210816221931.1998187-2-caleb@connolly.tech>
References: <20210816221931.1998187-1-caleb@connolly.tech> <20210816221931.1998187-2-caleb@connolly.tech>
Subject: Re: [PATCH v3 1/6] dt-bindings: input: add Qualcomm SPMI haptics driver
Date:   Tue, 17 Aug 2021 07:10:48 -0500
Message-Id: <1629202248.430426.4133262.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 16 Aug 2021 22:19:55 +0000, Caleb Connolly wrote:
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

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/input/qcom,spmi-haptics.example.dt.yaml:0:0: /example-0/pmic@3: failed to match any schema with compatible: ['qcom,pmi8998', 'qcom,spmi-pmic']
Documentation/devicetree/bindings/input/qcom,spmi-haptics.example.dt.yaml:0:0: /example-0/pmic@3: failed to match any schema with compatible: ['qcom,pmi8998', 'qcom,spmi-pmic']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1517351

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

