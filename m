Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77FC17DC0EB
	for <lists+linux-input@lfdr.de>; Mon, 30 Oct 2023 21:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbjJ3UEM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 Oct 2023 16:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjJ3UEL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 Oct 2023 16:04:11 -0400
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48C62CC;
        Mon, 30 Oct 2023 13:04:09 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5a7b91faf40so45861517b3.1;
        Mon, 30 Oct 2023 13:04:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698696248; x=1699301048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7EFaII1QqA4dlCF/XdXqD8XAo5yEqLk3DjmlDXGLSA=;
        b=W1CnuJ0ybQuEBVxxmC71nxz84JuITpjJzKBbgoSmS1UQj+GdXzruW0DFD5XsKXziBL
         PqZgXLryw6BpixCzUHY/vSuIZFfbv3gtIA89+FIjR4e5TQGVM/HjpeU3uMb3z4PAh2CR
         FEgTfap8vbDSheVsrapgQ5mv7BDWrBsMgzIn5OZPOOa5rHPSwA32coKcgiTKENTPjE8+
         XJbCeCWaywB/UQUCikXPeIrfs0CgsEIVgX4PT9oPHS+Yanhot0XkCdOf8gG4GiUWjDcx
         9SCuk78ZiWsHiL8fWO71LTjL/SC26is1DDX8aHvSWUX4D4OPgfmkwxgLgARX9P9UzO34
         Nvow==
X-Gm-Message-State: AOJu0Yzfi4KCFLkdQhlf7tMKjqoUY79lMSun5lyRNQsVVBKgCELTovTd
        n45U3mAwnLnqe7MVlPMc1Q==
X-Google-Smtp-Source: AGHT+IG+1LMHYbwiDtlkh/ITWj/85Pq+zk/em6iekZavfHE3PtV8B/dlLxt+UZmjy90VEIH+5aPDZQ==
X-Received: by 2002:a05:690c:fd5:b0:5a7:fc84:4314 with SMTP id dg21-20020a05690c0fd500b005a7fc844314mr11939752ywb.40.1698696248383;
        Mon, 30 Oct 2023 13:04:08 -0700 (PDT)
Received: from herring.priv ([2607:fb91:e6c7:c3eb:a6fd:69b4:aba3:6929])
        by smtp.gmail.com with ESMTPSA id u141-20020a817993000000b005a7f676f305sm81621ywc.106.2023.10.30.13.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 13:04:07 -0700 (PDT)
Received: (nullmailer pid 2221667 invoked by uid 1000);
        Mon, 30 Oct 2023 20:04:05 -0000
Date:   Mon, 30 Oct 2023 15:04:05 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v6 01/36] dt-bindings: input: qcom,pm8921-keypad: convert
 to YAML format
Message-ID: <20231030200405.GA2216664-robh@kernel.org>
References: <20230928110309.1212221-1-dmitry.baryshkov@linaro.org>
 <20230928110309.1212221-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928110309.1212221-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Sep 28, 2023 at 02:02:34PM +0300, Dmitry Baryshkov wrote:
> Convert the bindings for the keypad subdevices of Qualcomm PM8921 and
> PM8058 PMICs from text to YAML format.
> 
> While doing the conversion also drop the linux,keypad-no-autorepeat
> The property was never used by DT files. Both input and DT binding
> maintainers consider that bindings should switch to assertive
> (linux,autorepeat) instead of negating (no-autorepeat) property.
> 
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/input/qcom,pm8921-keypad.yaml    | 89 ++++++++++++++++++
>  .../bindings/input/qcom,pm8xxx-keypad.txt     | 90 -------------------
>  2 files changed, 89 insertions(+), 90 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/input/qcom,pm8921-keypad.yaml
>  delete mode 100644 Documentation/devicetree/bindings/input/qcom,pm8xxx-keypad.txt

As this is still warning in linux-next, applied.

Rob
