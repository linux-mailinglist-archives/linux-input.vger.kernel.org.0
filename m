Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E66B4C0E06
	for <lists+linux-input@lfdr.de>; Wed, 23 Feb 2022 09:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233116AbiBWIIT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 23 Feb 2022 03:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238879AbiBWIIS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 23 Feb 2022 03:08:18 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17E743ECA
        for <linux-input@vger.kernel.org>; Wed, 23 Feb 2022 00:07:50 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D878E3FCAD
        for <linux-input@vger.kernel.org>; Wed, 23 Feb 2022 08:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645603669;
        bh=cJAoPDc8aKVGCYTCguUnHYj9Um4T6R7Mz/nddrCfS+U=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=BEnIEv+WsJC6I7DqWHoeNGmj5Ar9fPOuOxjJ5W83I8soAzpOZpRchMPfFMRB43/h/
         Y4tIcXCefv8Le/kZdMPu+KV2NHew2kJAy5oi7n4uKWDZQxnAq9EmQT2Ys+0Qw+8SRb
         oB2PxPAgNLQNa7lWsLs844GO5MzNI3JztTfNYUrbUs7tPzPgCD4DwepA86iOxhG+YE
         PASfdL2vTqmo8kTLmTnvECBB24hFKO8Pn20bKeSocr9L4ZoNuoSfbCY805vv3uncze
         PbbMLdipJe+afTFtCO03ZQCEd2zpfqZ6IlqAlSFZhZkqmhoh2ypA+6GKcM7dIbXv7F
         xJD4ocEeyp3/g==
Received: by mail-ed1-f70.google.com with SMTP id r11-20020a508d8b000000b00410a4fa4768so13100820edh.9
        for <linux-input@vger.kernel.org>; Wed, 23 Feb 2022 00:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cJAoPDc8aKVGCYTCguUnHYj9Um4T6R7Mz/nddrCfS+U=;
        b=Dwi8Z7mn7fKnPS5sqB5Nb5CpOFbLK54CcxKpu7AACJDkpOnrupBLsjby5PT+ctgNoU
         7iwGQgczhaf2xyhSx5Cguon3aC1FNwy4sAF8q/QQo67dwUram5t1PC0p7w49LWyvM5+Y
         b4h2yeaCa4AhD9QF+/in4esxr91HiATJeTdzI2TxOfNOKVDLVewXnS7b4Cpg+SGNhMxn
         Dyta5+t6GgGS+3A/OtDARJDZBqKp2BdhQIlRMG4ez6itfKX196FWu7gfhxUb636A1Yck
         uGo7GNanEUVIgrG/Uy0z+zKBlpz0EzRPP00Gr+kKXLc3KIjOrStDE5cgJa7WHjnw3CnK
         9k1w==
X-Gm-Message-State: AOAM533+e6R1VMFFqbbTjPlBnz6B90ONlwZYf8i9gLaxCQ6Vixj9b/hR
        U3TFAkVzgg3EI+g5fKDFJrc6GstRp47lPwHGmB77RHmGNzR2tCCIMEhdXHK0ok+ssMJwJhc1VMx
        qR6YkL0DDYAJowWXF6KsxSFAzm+QMzSL94PgTuIyd
X-Received: by 2002:a17:906:3b4b:b0:6d3:4b9f:1764 with SMTP id h11-20020a1709063b4b00b006d34b9f1764mr3782772ejf.345.1645603669461;
        Wed, 23 Feb 2022 00:07:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+sAsvC2YVaWkNxMY27IgSZbd57gDhRWf6CFP5QRb8O1Ze/Oy2J3V8J8SGl8x0BiwMVeVhGA==
X-Received: by 2002:a17:906:3b4b:b0:6d3:4b9f:1764 with SMTP id h11-20020a1709063b4b00b006d34b9f1764mr3782763ejf.345.1645603669271;
        Wed, 23 Feb 2022 00:07:49 -0800 (PST)
Received: from [192.168.0.124] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id h8sm11129654edk.14.2022.02.23.00.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 00:07:48 -0800 (PST)
Message-ID: <566af033-352c-ad04-53dd-219cda3f78a0@canonical.com>
Date:   Wed, 23 Feb 2022 09:07:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/2] dt-bindings: input/touchscreen: bindings for
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
References: <20220222203414.8656-1-markuss.broks@gmail.com>
 <20220222203414.8656-2-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220222203414.8656-2-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 22/02/2022 21:34, Markuss Broks wrote:
> This patch adds device-tree bindings for the Imagis
> IST3038C touch screen IC.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

No need for blank line between tags. I guess this can be fixed when
applied, but if there is a resend - please correct it.


Best regards,
Krzysztof
