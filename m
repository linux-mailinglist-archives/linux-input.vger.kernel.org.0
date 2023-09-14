Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10F7A79FBD5
	for <lists+linux-input@lfdr.de>; Thu, 14 Sep 2023 08:23:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235166AbjINGXE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Sep 2023 02:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjINGXD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Sep 2023 02:23:03 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68693F7
        for <linux-input@vger.kernel.org>; Wed, 13 Sep 2023 23:22:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9a64619d8fbso79168866b.0
        for <linux-input@vger.kernel.org>; Wed, 13 Sep 2023 23:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694672578; x=1695277378; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IY6Klcup6lhl/U3i4EA23kuZdk+E7DI+uCdmyLnRtE=;
        b=jqYrseqPyH21d5ws8e1CcSoeZVI45XIXn1hiUuNUPmrvJ+VQIf6ofDdaNN5dKDVS+M
         2IwsxHi0e4y5lfzhAdGiiGBAUmuwhFrEgrwjoW1hfMRQYIMBLg112dYI3mfq9Su0ei4D
         9QDQZLW8dWiemwLj+x0Ag/VaSHk8AUEZwuNbuOr2YNxFDhkHEKG+qPSHldMaEAB7e3SA
         ruWROaSiycEiaOBgeaPwD0S6EsdY1AfdkcLG4d/4L2WCdtlRyPpYHtfv1Ay0z5OZEcc2
         2hjNl4r7/b9lbdmRtqSv8BOyoAHSU6LKEG2hemcGunZl0DQhUeMoIjIDIzHPagWOSnDV
         iUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694672578; x=1695277378;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IY6Klcup6lhl/U3i4EA23kuZdk+E7DI+uCdmyLnRtE=;
        b=m5fMFq+RFlGg7sc/6hqgWJM7jSMj3r70CyRG8flGFjLZO+lqM+/ZfWC5aRyYwuzvR8
         0XHb5urgc21NIKqqPw+IjXXj/mkR8QPgvfOHKUZ5/z44uI4KSSFP60YGL19l8lC6qBXC
         o183CVfLo2lQuB7Vib+wsjM9mwVJYb+C5FxrOG7Fkecr1Cg4gjcD4tTUhBUGtE7G9imP
         6cBQ0mjuSAPOphNiNDeKjsoWjP5QMqZgE3znqtOQRctbJHiBu7HU5fFcLwTpOYdUy6gd
         ZxqZTJEiCCI/n7vbwWrcpPrcw4ATeZ+qSv8esX9VwCIZF0V0r6bHEcsO5+aed2Jr6Zxi
         J9Aw==
X-Gm-Message-State: AOJu0YwG9rilpLfAktFp1G8ptjbCNdwidupZP3hlbO4fMfEunR5JyCF1
        SNEKP+Pl1mjYIQztRzLdRKCrdQ==
X-Google-Smtp-Source: AGHT+IGKIIEs8IOe0HhBpjx4EsRiO8dHrpPLhJSDgfHSmzRmaGEaG5r/fh7DRpWKCw5ScNBiYpvtxQ==
X-Received: by 2002:a17:907:7811:b0:9a9:e4f8:3501 with SMTP id la17-20020a170907781100b009a9e4f83501mr3510882ejc.43.1694672577897;
        Wed, 13 Sep 2023 23:22:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id kt27-20020a170906aadb00b0099d959f9536sm527418ejb.12.2023.09.13.23.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 23:22:57 -0700 (PDT)
Message-ID: <95bf5c64-3fb3-6ee0-4290-3696d4b72883@linaro.org>
Date:   Thu, 14 Sep 2023 08:22:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: document Himax
 HX852x(ES)
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jeff LaBundy <jeff@labundy.com>,
        Jonathan Albrieux <jonathan.albrieux@gmail.com>
References: <20230913-hx852x-v1-0-9c1ebff536eb@gerhold.net>
 <20230913-hx852x-v1-1-9c1ebff536eb@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230913-hx852x-v1-1-9c1ebff536eb@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On 13/09/2023 15:25, Stephan Gerhold wrote:
> Himax HX852x(ES) is a touch panel controller with optional support
> for capacitive touch keys.
> 
> Unfortunately, the model naming is quite unclear and confusing. There
> seems to be a distinction between models (e.g. HX8526) and the "series"
> suffix (e.g. -A, -B, -C, -D, -E, -ES). But this doesn't seem to be
> applied very consistently because e.g. HX8527-E(44) actually seems to
> belong to the -ES series.

...

> +  touchscreen-inverted-x: true
> +  touchscreen-inverted-y: true
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true
> +  touchscreen-swapped-x-y: true
> +
> +  linux,keycodes:
> +    minItems: 1
> +    maxItems: 4
> +
> +additionalProperties: false
> +
> +required:

If there is going to be resend, required: goes before additionalProperties:.

In any case:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

