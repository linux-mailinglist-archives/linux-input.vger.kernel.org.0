Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9130E6F0F0E
	for <lists+linux-input@lfdr.de>; Fri, 28 Apr 2023 01:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344236AbjD0Xf3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Apr 2023 19:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344315AbjD0XfY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Apr 2023 19:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 943CC2D6B
        for <linux-input@vger.kernel.org>; Thu, 27 Apr 2023 16:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682638477;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=WAbmGag01n5DmSI3CzgProTjcse9Z3IcWuvX59Ri6Jg=;
        b=MOrWLxFdXApybiuFt3Vg9kLxQUjpXHw8cw0js24W0dO5kftNfGpvhnrX9zVGCxbD4H1CW+
        c3e2+a/eEGAXdNnO8rLVPywXWve2ozjyONJkjHBwMMnlpcu9LTRijqGkMqhzmzOA2bZFSL
        OScKLdzZs/w438dL5EG9FqniadtRZlE=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-2lm2uhlKPBabn2WMDpkxjQ-1; Thu, 27 Apr 2023 19:34:36 -0400
X-MC-Unique: 2lm2uhlKPBabn2WMDpkxjQ-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-54f88a34bd6so129322257b3.2
        for <linux-input@vger.kernel.org>; Thu, 27 Apr 2023 16:34:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682638475; x=1685230475;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAbmGag01n5DmSI3CzgProTjcse9Z3IcWuvX59Ri6Jg=;
        b=jrJbf3UOvKgFZLKTzmZ+BIcnW4iFike1TwL9gP+wGh8wE3dc+uit9WqrWIbm3iqX82
         CNZ5DE77PTSvQ0E1e2n2RFdYI4ZF1jPp6Z2ZyG0+vxravuPGn7HdXAd2ScXPEOYYvGtz
         3mwrNj2rlOFSJOUjSYmfnFGFZYPGxdRqCXq8IuzQA7PIWbnH89cM/+HjbQqMecnZHaf3
         JzyYyP7F0X388hqfT+j1VUjG5QPuNNL/W+Km6WgEfu+skiWZOmF/8k0EJy99UvmY4926
         8q5UR44zXHA+73NWXo9B3/Gu12B3HFGRgk74ayUUorjzCy0zcPx10AwHrhMmdMpW/xi8
         BOtA==
X-Gm-Message-State: AC+VfDxMSfv3i9gqsXerKUln5YnmdxR58340XlYNitOCoovKwPFC9Rfx
        O47T8rB/Os4h97QHtEYMf0of7hT25LlWq6oRhRxjDAW0F8k1zlf8uW73vdSed4oGdc3ho+3wr4I
        vaVYHYaHjeqQUWoR64C6eplY=
X-Received: by 2002:a0d:c946:0:b0:556:c672:3455 with SMTP id l67-20020a0dc946000000b00556c6723455mr2381993ywd.40.1682638475579;
        Thu, 27 Apr 2023 16:34:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ73hjwG6+Ltq+wLdLn36T+dLP3PI+N06414PCgAVqJLApv/bdsLxACX1f3tsLzSETOMQ8YF9A==
X-Received: by 2002:a0d:c946:0:b0:556:c672:3455 with SMTP id l67-20020a0dc946000000b00556c6723455mr2381963ywd.40.1682638474836;
        Thu, 27 Apr 2023 16:34:34 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id h190-20020a0dc5c7000000b00545a08184f8sm5137345ywd.136.2023.04.27.16.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:34:34 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:34:32 -0400
From:   Brian Masney <bmasney@redhat.com>
To:     Luca Weiss <luca@z3ntu.xyz>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8974-hammerhead: Add vibrator
Message-ID: <ZEsGiERTqoMJVh/h@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427-hammerhead-vibra-v1-4-e87eeb94da51@z3ntu.xyz>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Apr 27, 2023 at 10:34:29PM +0200, Luca Weiss wrote:
> The Nexus 5 has a vibrator connected to the clock output of GP1_CLK
> which we can use with the clk-pwm driver, then we can use that pwm with
> pwm-vibrator to get haptics functionality.
> 
> This patch is based on Brian Masney's previous patch with clk-vibrator.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

