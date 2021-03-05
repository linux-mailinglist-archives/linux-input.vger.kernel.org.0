Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10E4032ECE3
	for <lists+linux-input@lfdr.de>; Fri,  5 Mar 2021 15:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbhCEOPp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Mar 2021 09:15:45 -0500
Received: from mail-oi1-f178.google.com ([209.85.167.178]:37286 "EHLO
        mail-oi1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhCEOPg (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Mar 2021 09:15:36 -0500
Received: by mail-oi1-f178.google.com with SMTP id l133so2651843oib.4;
        Fri, 05 Mar 2021 06:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=fTgufUqapQDE0I/Lwz5PdktHZiGB6p4jIsimCUup02A=;
        b=Y8cU52lpcFYbkGPHrY2WkdpuEum32IwHho4Io2rwwN4CbycW+m4PimpUuOMCk+XRmu
         7ZHNeAc2uQUry87o4tqIsVYKLt6KTecu8Rk9jpOUQ3S1/0x4CHtSTT4xd85MXtIO1En2
         DpJYp851rMrsnUlA+nLa8AwsWr2n7485KbOgssU1gQ32bU156uTuFrUbRLRkaaLgbY2A
         uMKGEzEP6ooDeDgj1dMPZJQrcFDDx/zt4jOLTQdT2YxbejXN1YBZM20prWAac1n0XwIS
         jBu6f64Dig6WcmNbFKenZb+Lj1gfgM9fzshe2uNJ0hISM6771FxCWcCTBSlBXFuBNLfO
         RAEw==
X-Gm-Message-State: AOAM533FnYfqmPP+ceBsLYrto0v8cR2nMzNJ0h/57oJ8AGEZ94GCng1K
        xJJCa5fKR8WrqgUYeKHJCQ==
X-Google-Smtp-Source: ABdhPJxeGs+CZnvQ8TkHBzESgAyiGU4cCzEzHKTSmABK2zYouXKrq93X8c8mj2NcUdZeBIWm53GmYw==
X-Received: by 2002:aca:f245:: with SMTP id q66mr7037445oih.69.1614953736254;
        Fri, 05 Mar 2021 06:15:36 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h2sm620395otn.43.2021.03.05.06.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 06:15:35 -0800 (PST)
Received: (nullmailer pid 90440 invoked by uid 1000);
        Fri, 05 Mar 2021 14:15:34 -0000
From:   Rob Herring <robh@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Collins <collinsd@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        kgunda@codeaurora.org, Rob Herring <robh+dt@kernel.org>,
        linux-input@vger.kernel.org
In-Reply-To: <1614922721-1390-3-git-send-email-skakit@codeaurora.org>
References: <1614922721-1390-1-git-send-email-skakit@codeaurora.org> <1614922721-1390-3-git-send-email-skakit@codeaurora.org>
Subject: Re: [PATCH 2/3] dt-bindings: input: pm8941-pwrkey: Convert power key bindings to yaml
Date:   Fri, 05 Mar 2021 08:15:34 -0600
Message-Id: <1614953734.184621.90439.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 05 Mar 2021 11:08:40 +0530, satya priya wrote:
> Convert power key bindings from .txt to .yaml format.
> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> ---
>  .../bindings/input/qcom,pm8941-pwrkey.txt          | 53 ---------------
>  .../bindings/input/qcom,pm8941-pwrkey.yaml         | 76 ++++++++++++++++++++++
>  2 files changed, 76 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.txt
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml:10:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml:46:2: [warning] wrong indentation: expected 2 but found 1 (indentation)
./Documentation/devicetree/bindings/input/qcom,pm8941-pwrkey.yaml:52:2: [warning] wrong indentation: expected 2 but found 1 (indentation)

dtschema/dtc warnings/errors:

See https://patchwork.ozlabs.org/patch/1447638

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

