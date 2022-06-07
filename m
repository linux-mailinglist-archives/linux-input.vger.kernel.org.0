Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5331D53C640
	for <lists+linux-input@lfdr.de>; Fri,  3 Jun 2022 09:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242452AbiFCHdY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Jun 2022 03:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242463AbiFCHdW (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Jun 2022 03:33:22 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17E5239148
        for <linux-input@vger.kernel.org>; Fri,  3 Jun 2022 00:33:16 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id v25so9057378eda.6
        for <linux-input@vger.kernel.org>; Fri, 03 Jun 2022 00:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=v4EM3dPasfZitoQH8LU4gnwy1t1cMAZ7lAV86zPiO4I=;
        b=IpLU+4n4iGD1z+DRgpvxnYm0AyOc5eTVc7omXkKu85Rt5dHNJdImqHyjMYw+m+xQ9+
         6+U5EmqeXbMhh0G+peDzKL3ESBp9o64dtWLzu/yDeTZVr7ibNqdHM83Q9+PIjsrmlAbv
         oJP0JQZzvxqbAEz5/D25E98e4HWXT7CYdf1USgC/lMRkZlccSHayWgTzLxq6r+rfRhcW
         I+FOOnn2X7M2CTyswgmdbOXodDsMETr3phkOIMHzAogJT37F+1453klWnIPGe1dJwRv8
         TaRvboI+ECl5sRVFcNX4mYh1DexfAVt8hb+2rkDvEW2j4TXNcx8XRehTfqJ0OXm/q789
         +mJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=v4EM3dPasfZitoQH8LU4gnwy1t1cMAZ7lAV86zPiO4I=;
        b=qFLR2XpF+1Z5q+lmpTpcjPmyE7mq1mj1DyD7KBFMaAmjILhYrc9bh8RXa+2wrqpB7+
         QP90POe9xX9KhKiaWqFii8iGgciMJeU2xGIELxgq24vR4NjtuuBPy4itq6z6IYLpUtJ4
         9iIEFrTU05HmK/vr26m9qpXh2p3WadkEbWXpznGMqSI+DxJLZm+jIRxsqeb47MxLT9nO
         rmjpKDlvj8ULcC7uP2RSTLd37qcgfYWssWgFjb+DfG1Ri9TaXLV3OMACIjSELEKYqAWx
         /XSW0tq7dgK1FOktxsOVznCnFcyqsNEwUpHsUOpqYLRiuOHbRV35vwVDkVi+E3zTq1/F
         KrWA==
X-Gm-Message-State: AOAM532n6YCLTn8MB+u6kqlZzrzlqEUFBzZMQpPA9rnaq/Up9JdW9/2E
        PuZjdOyKGItBVn9dNk5KS1sMmQ==
X-Google-Smtp-Source: ABdhPJy3rIcq0bmEyzjKNR/kZPKD1do3wbJt3k7DEsjEef/5Z2LIFy5VydAUbMFsoL2n6Ytxvgml4w==
X-Received: by 2002:a05:6402:28a5:b0:42d:df55:5b91 with SMTP id eg37-20020a05640228a500b0042ddf555b91mr9293709edb.353.1654241594458;
        Fri, 03 Jun 2022 00:33:14 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id kl10-20020a170907994a00b006fec69a3978sm2546835ejc.207.2022.06.03.00.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jun 2022 00:33:13 -0700 (PDT)
Message-ID: <46528513-dd44-35a4-1456-4867dfbcc90a@linaro.org>
Date:   Fri, 3 Jun 2022 09:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/2] dt-bindings: Input: st1232 - Support power supply
 regulators
Content-Language: en-US
To:     Mike Looijmans <mike.looijmans@topic.nl>,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        geert+renesas@glider.be, martink@posteo.de, hechtb@gmail.com
References: <20220603051058.6075-1-mike.looijmans@topic.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603051058.6075-1-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 03/06/2022 07:10, Mike Looijmans wrote:
> Add support for the VDD and IOVDD power supply inputs. This allows the
> chip to share its supplies with other components (e.g. panel) and manage
> them.
> 
> This provides the devicetree bindings.
> 
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
