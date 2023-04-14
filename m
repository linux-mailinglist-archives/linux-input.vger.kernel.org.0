Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B44F6E1D69
	for <lists+linux-input@lfdr.de>; Fri, 14 Apr 2023 09:44:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbjDNHoT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Apr 2023 03:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229543AbjDNHoQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Apr 2023 03:44:16 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1272F44B2
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 00:44:14 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id rp27so6478622ejb.12
        for <linux-input@vger.kernel.org>; Fri, 14 Apr 2023 00:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681458252; x=1684050252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xggPyA5Loe1PP8kK256jqhC93KUTQ15DwlgDEOkunfA=;
        b=lfChVG0kCG4fpYP4QhuqIz/B3aGDMndQAyK5F34Aw9DcYHwWZj2sxxsAdDoUMyECtw
         Waao+Y7Of9MwB+er1zwTwdFcMR81qJMZsNo5eJUy1aOPd7lunlBS4k1Jjxexk55HxqTh
         cxicVe6SJ+Aui9RRgVdj1g2YOrgboXSiIJ3zQL0baMb9mCrRbXs3QIWihfEfcondhNS/
         qdPMG4B+/0gy7av2wtoBx5ubpbcsDWGCUFKAWvcvD6DlAEDYSqM4ahmtk4j0sjeUgKnm
         bl0NS9l8VgnoMPzgpJBQc0om3NPsuZlkIJdOEm3u90Dw77vUiTJjdlmt54iQBIVSVG7U
         ltKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681458252; x=1684050252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xggPyA5Loe1PP8kK256jqhC93KUTQ15DwlgDEOkunfA=;
        b=GZRmcAho1GO0oLfw/n8RjMlT9rrinmrhKp5TmYVyGIcJV0+JU2wFiypM5oulS9jlVe
         RRLvyG98MgEgr+h8X9QAAD4ZL2/VfQ4sxG0iom/Mtx11jvC3qdbO6TTIPCDlSw9+WAYT
         uFFiwfSgrAPulDHxlVUlLUXW0bJi93GyvPAfce7n/ai2D5/25Xpym/QoB5aFm/QDAznx
         W9dE8KGdBDYo3R4EeFDpJlN/9o5bG0RJpvYuFecOd8klqgnN2XryqGkUR80BYXnMdG7+
         OZC+6/JiJr3KCrf5HTtTfJDHiv2ja6nOi/bg98LwgOqSnJzbXdIPwe3YxDGpTfgGsDNr
         TZXg==
X-Gm-Message-State: AAQBX9cA2Q57IxlpnBDlSjsO5p0EfKJ0t7DpuCsYJL8QijC9WagXRKHI
        DLOVpnNUxfxnzmnAgvQucuhokg==
X-Google-Smtp-Source: AKy350YPcZ3BLKpDrlII+wqnI5EW6oBxcl0fHOpJPCrNIqmVgoO5mmHwNDo4YKuiP7xHtB3sEAX9hQ==
X-Received: by 2002:a17:907:7810:b0:8b1:7ae9:647 with SMTP id la16-20020a170907781000b008b17ae90647mr5407027ejc.76.1681458252561;
        Fri, 14 Apr 2023 00:44:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id gv16-20020a1709072bd000b0094a785e362dsm2118002ejc.141.2023.04.14.00.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 00:44:12 -0700 (PDT)
Message-ID: <046eac79-b97e-9f95-8a2f-05cf00a00f81@linaro.org>
Date:   Fri, 14 Apr 2023 09:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/5] dt-bindings: input: touchscreen: add bindings for
 focaltech,fts5452
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>,
        Caleb Connolly <caleb@connolly.tech>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Jeff LaBundy <jeff@labundy.com>,
        Markuss Broks <markuss.broks@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Job Noorman <job@noorman.info>,
        Alistair Francis <alistair@alistair23.me>,
        Chris Morgan <macromorgan@hotmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230410160200.57261-1-joelselvaraj.oss@gmail.com>
 <20230410160200.57261-2-joelselvaraj.oss@gmail.com>
 <f9552bb6-ea73-93b4-f15d-d5d7c326c708@linaro.org>
 <b89c39af-da87-8138-9899-fb631ebe76e1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b89c39af-da87-8138-9899-fb631ebe76e1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 14/04/2023 02:32, Joel Selvaraj wrote:
> Hi Krzysztof Kozlowski,
> 
> Konrad Dybcio suggested to use interrupts-extended instead interrupts.

Sorry,

I have no idea what this email is about.

There is no context here, no reply, it just appeared alone in my inbox
without any reference. Please respond inline to existing messages,
keeping necessary context you are replying to.

> So in my WIP v3, I have updated it in the dts and bindings example.
> However, I am confused if I should replace the "interrupts" with
> "interrupts-extended" property in the schema too? I see a lot of schemas

No.

> specifying "interrupts", with examples using "interrupts" or
> "interrupts-extended". At the same time, I see some specifying both
> "interrupts" and "interrupts-extended" (like one of these two) and very
> few others specify only "interrupts-extended" in the schema. Which is
> the currently recommended way to do this?
> 
> In between, the interrupt property should be a required property as the
> driver will not function without an interrupt. I will fix that in v3.
> 
> Thanks,
> Joel Selvaraj

Best regards,
Krzysztof

