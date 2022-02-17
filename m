Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEB0C4B9AE8
	for <lists+linux-input@lfdr.de>; Thu, 17 Feb 2022 09:29:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237622AbiBQI24 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 17 Feb 2022 03:28:56 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237578AbiBQI2t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 17 Feb 2022 03:28:49 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 509E81C4553
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 00:28:34 -0800 (PST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id AEF57402E6
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645086512;
        bh=vsKlQAxucxoa2YY4aKRE0fk/SvHQXFadLh+06pTLUSk=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=QLDibmVjRxSPWimBGs0UGeUFLXeDoDrchFPJeUkxRPX/NXLzYxke8/uWPwd8fHP6X
         Gw4pqPum6CyZ2AXjGk28AcuQcxavNkV4nZforAk54Lt6Ax1vXnRK4pTAmKWmkGy++l
         4xgdcHTTh3GH/stXL7gWbwL9/EMAgXW8ZmYWMnccGDw+u5DLq7hKz1RYSld31MfmSb
         E/ybEa//DC1SlXUKAd2gTXQE34bxrONRzvfSgclI7JXC9MDnJM6qIjXBwgtVCi6QKC
         SXe3pTu6DUW8g4ERh1az5ktmcc7f2Xs4CmCfX/Za4i4bAUsH2Fds+0rbs9xDUibesh
         8N2QS151XFR4Q==
Received: by mail-ej1-f69.google.com with SMTP id qf24-20020a1709077f1800b006ce8c140d3dso1140541ejc.18
        for <linux-input@vger.kernel.org>; Thu, 17 Feb 2022 00:28:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vsKlQAxucxoa2YY4aKRE0fk/SvHQXFadLh+06pTLUSk=;
        b=WtBwt8mg75ZxiIuG/Ntt3DxaBciIwe10A/LaWvVNkptfNh770TGedtsl1LHIze5+Yu
         +kKH158uoGkilB1m2yf3caUmttCEYVh2oQffkZpd1Jfj/ACvPqS9lkH5/s6fyC79mR1b
         2b0StugY9NhbwTe6xDUPVpwj6EWyI0HlLAgeR8w0Bm6AfzaY+gBLTsGT/bTSGjT05WmL
         yGzYUCzNkkKiSdS/nxuamuAnTdPBtaDMDCNM7OYwzOuFr49zzdFEJh30v2P+CyDr8XeN
         Lvna77uxwH7EXgFHxTlmDiLTOlsFwptixWZlgJvTSvZxU4QnmACBD10Rjgks3GyaI7zP
         hzCQ==
X-Gm-Message-State: AOAM532UQFbxKt+WAj5HTdP6xhqJwwuy0Y1GGSaODEFzq8s9/1qdSMWN
        wwqo+UMa1ykr3ueiK7cjwYfcMzXy3ya49dXnfu7VnvUW/J45uzy6Pg8uhvtTcEOKk0qhTB0XQE6
        9vnlcMO56nCE5zA4zabaTtWEwPuPoMbLz1ON5sT97
X-Received: by 2002:a17:906:c7cd:b0:6b7:a0ea:81f with SMTP id dc13-20020a170906c7cd00b006b7a0ea081fmr1483500ejb.502.1645086512399;
        Thu, 17 Feb 2022 00:28:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzckXr6KyD0D4pif9ezfy/FnPfKiNqcN1LK/vCekvssppptudHK4a1hEy0QishrOp1goqNyLA==
X-Received: by 2002:a17:906:c7cd:b0:6b7:a0ea:81f with SMTP id dc13-20020a170906c7cd00b006b7a0ea081fmr1483494ejb.502.1645086512237;
        Thu, 17 Feb 2022 00:28:32 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id el5sm2816888edb.71.2022.02.17.00.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 00:28:31 -0800 (PST)
Message-ID: <c3528ff1-878a-5a8a-ae0b-524e4f946743@canonical.com>
Date:   Thu, 17 Feb 2022 09:28:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/2] dt-bindings: input/touchscreen: bindings for
 Imagis
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org
References: <20220216134302.5153-1-markuss.broks@gmail.com>
 <20220216134302.5153-2-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220216134302.5153-2-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 16/02/2022 14:43, Markuss Broks wrote:
> This patch adds device-tree bindings for the Imagis
> IST3038C touch screen IC.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  .../input/touchscreen/imagis,ist3038c.yaml    | 74 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 76 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
