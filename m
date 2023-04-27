Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2CE16F0EED
	for <lists+linux-input@lfdr.de>; Fri, 28 Apr 2023 01:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344414AbjD0Xao (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 27 Apr 2023 19:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344400AbjD0Xal (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 27 Apr 2023 19:30:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CF374483
        for <linux-input@vger.kernel.org>; Thu, 27 Apr 2023 16:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682638191;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=APGco6aEZNObW78hE/OSpvb8OxCU/Biuh2aipIMgkF8=;
        b=C2/acZjc4zObvp1IQv+u3QHmKG3WPwGTcCAGkgLivD4fzsvIqWCIwez/zPWDvdr8cKBvbL
        GoYKD9r2aYSpdLBSae9F3gJMPtdZS8wipEb09wIbouxy9atCsOn4iWMuPqaMBB/cDIStvF
        vVeFcNaFQeyXMwgmshO27rE0pbIlqms=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-9E8oJcR8MxGjsq3M_4HnUg-1; Thu, 27 Apr 2023 19:29:49 -0400
X-MC-Unique: 9E8oJcR8MxGjsq3M_4HnUg-1
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-555f6759323so149344197b3.2
        for <linux-input@vger.kernel.org>; Thu, 27 Apr 2023 16:29:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682638189; x=1685230189;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=APGco6aEZNObW78hE/OSpvb8OxCU/Biuh2aipIMgkF8=;
        b=cztPD+v73J4OjL+wikqMFkEa/Gw8SW18T18yVhwNUWL0K30V17gC/Y0kXFoAWsJmz6
         O528PwQzbzVVEnI41BydQqKB15FmiC+3sPDM3FqCxL87TOoJLUQfucb0xpRxHmQAYT59
         oyPtiAlAtZrM9CE5EDuRUBQFucH8xS6+AEoT6SyolfS9e/spu69sWfPpLmUMKw+3Gqh0
         Y8N6BKMH5VxKY//MYas5mjopvffJDf5CyZR4FooSkUj7lapuZqeBsthu+odEQEQUCT4W
         rDastKBxZClteMLkQ13OhJyVoChT+f6f/kvI5BUXQrdWGPulW9xn4yG+fDgdUJPpbs5g
         NcRQ==
X-Gm-Message-State: AC+VfDzXaCLIT+S+JcrGORt/WR7dgcv+GD97+SVZVB1JVUIWXMPo8Ixi
        b/pQ35gmv7z6n/LoQby87cJ9LfDhBdO156sEqajWwzfSvGV1Z4aOpE+9auELB0dPbHqOsyuqdZ4
        Mh9Vbfh0hKcqalsy4Sd0BP2g=
X-Received: by 2002:a81:4f51:0:b0:54f:8b2b:adec with SMTP id d78-20020a814f51000000b0054f8b2badecmr2624515ywb.33.1682638189446;
        Thu, 27 Apr 2023 16:29:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6sokai3nLi8Ghu/YrOhpsnAtHNmXbN/Ev70qVf2+yqg+ChxRtHYPD1D1nlvWdnZWkdWuuWwg==
X-Received: by 2002:a81:4f51:0:b0:54f:8b2b:adec with SMTP id d78-20020a814f51000000b0054f8b2badecmr2624498ywb.33.1682638189232;
        Thu, 27 Apr 2023 16:29:49 -0700 (PDT)
Received: from x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id a11-20020a0dd80b000000b0054fb975df99sm5115368ywe.18.2023.04.27.16.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 16:29:48 -0700 (PDT)
Date:   Thu, 27 Apr 2023 19:29:46 -0400
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
Subject: Re: [PATCH 1/4] dt-bindings: input: pwm-vibrator: Add enable-gpio
Message-ID: <ZEsFajeqFX35e72a@x1>
References: <20230427-hammerhead-vibra-v1-0-e87eeb94da51@z3ntu.xyz>
 <20230427-hammerhead-vibra-v1-1-e87eeb94da51@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427-hammerhead-vibra-v1-1-e87eeb94da51@z3ntu.xyz>
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

On Thu, Apr 27, 2023 at 10:34:26PM +0200, Luca Weiss wrote:
> Some pwm vibrators have a dedicated enable GPIO that needs to be set
> high so that the vibrator works. Document that.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

Reviewed-by: Brian Masney <bmasney@redhat.com>

