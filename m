Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9D9784B54
	for <lists+linux-input@lfdr.de>; Tue, 22 Aug 2023 22:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjHVUY1 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 16:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbjHVUY1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 16:24:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DF7CEA;
        Tue, 22 Aug 2023 13:24:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 48CF4652CF;
        Tue, 22 Aug 2023 20:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDE1DC433C7;
        Tue, 22 Aug 2023 20:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692735864;
        bh=IaufNM1F3JpnjmORgWEADp4Fszgw8gPenfutQK5mq44=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jKdOP27JseAJ3pvCPREc/Pb2KEsWO6whWnEh7E0C9qzql+4zXvrQsHs29BoBurD6M
         /VEIKm3eNTiJ38XqGftZuIDIb6ufFFxrKDrugQWi0hvyBtbVgi/bzuMWl2IDeIJinS
         n6HSz/mZ6qy2yvhUt37bYS1LL77QQyqBAPjnR/9fRqIjJSChwjamADen3/WDjDgs1K
         2RvIcgely14qyn4Lm9D8PN0uZ1CmjsYM/LxRdLxct3vms7R2jqV1dZiKsKu3pskEy9
         Iod/vUv+Vw13ej4vobIJCuQ70iNzOAwmzq9GTvXV1R2xG/NQoi4atMG0NebXv7BtOP
         ke7JVRJl+XAkA==
Received: (nullmailer pid 725743 invoked by uid 1000);
        Tue, 22 Aug 2023 20:24:22 -0000
Date:   Tue, 22 Aug 2023 15:24:22 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v3 03/32] dt-bindings: bus: convert qcom,ssbi schema to
 YAML format
Message-ID: <169273586120.725658.11487910435459187716.robh@kernel.org>
References: <20230822001349.899298-1-dmitry.baryshkov@linaro.org>
 <20230822001349.899298-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230822001349.899298-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


On Tue, 22 Aug 2023 03:13:20 +0300, Dmitry Baryshkov wrote:
> Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with bus
> bindings.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/arm/msm/ssbi.txt      | 18 ------
>  .../devicetree/bindings/bus/qcom,ssbi.yaml    | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/ssbi.txt
>  create mode 100644 Documentation/devicetree/bindings/bus/qcom,ssbi.yaml
> 

Applied, thanks!

