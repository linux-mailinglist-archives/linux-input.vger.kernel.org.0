Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D229653724D
	for <lists+linux-input@lfdr.de>; Sun, 29 May 2022 21:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231744AbiE2TPg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 29 May 2022 15:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiE2TPe (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 29 May 2022 15:15:34 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C90F6339D
        for <linux-input@vger.kernel.org>; Sun, 29 May 2022 12:15:33 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id x17so3019991wrg.6
        for <linux-input@vger.kernel.org>; Sun, 29 May 2022 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent;
        bh=GtTLdaSdhdOu6L801rLHQP43WYUiK4TnjJhCafDrDhc=;
        b=HZspqSmSZ+hubcTw3j6DNxsvad4g6NdBGMyrDz2ALK6QeyFB7tPuIVPMoMR9zgSo9q
         cuUS7jkVgUNL7vCIdgzpmF60RrEb4DON/ClYLqYZErW/wH8ld3SaU8AMpKA22tnTVMpn
         dyxb9tR7aHr/FlX8FSm4JeNBXMXZWJpnszEcYG/1DjC+w8Wk4i1X2GX4O+LM/LZOFhdE
         XkUODF/qUewX2ykRz/4V2yxuSuCudDLMltdMs4sw0F3Rb9VEpngk++fHai4Fn5eanuOW
         68lJ7EnSYWzC8w7VnyojvJx0cmkMpFvzQ8+fT/CAPAWW0z4EOc6+E/h1bzeaEacpPpEb
         apXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent;
        bh=GtTLdaSdhdOu6L801rLHQP43WYUiK4TnjJhCafDrDhc=;
        b=do+Az+m4YJI2khP933s3pzCSyCdLLyhzgbpT63oH7PJIxoFhJz+UCKMsH2ZVBkSeFL
         MICLzLwVfgo/edT0qTQ4MmLSb+JMfiCk+g2JYVdmOVHnPf+3vyrWxt6dwk0Zbd8kFjJj
         C3v3us5RHnkNKF1Py99/azjRM1G8dpwiM4QU+gmD3rkNiYTNYaE1OHI63FCPPZLhTgek
         KIpPML3A22FdD3kg7fcUzvhC3PWKBCq6HhHcMEuvOl8TcYRBwsjKEBt/LB6jDr6fPYZj
         Sds8ATAWIJQoMa+KtKAW5wt7AI8TWOaJLsXRACi6Gdfi0gReyoLekuioDzJjxevGsWv1
         WnBw==
X-Gm-Message-State: AOAM530YFQSrtKcuzUdslPOv0VF7l5o2rilGrm/bePA90hg0vM/064SX
        5v07k2I2Hjr/jpP3ipKRrfI=
X-Google-Smtp-Source: ABdhPJwW2MCXIcs3l37ueS8h7MG26226FyDbokjuxR1Ugt3GsT8pLpya8aBFvifQVDm/jGLoCO3Utw==
X-Received: by 2002:a05:6000:2c8:b0:210:ddd:170c with SMTP id o8-20020a05600002c800b002100ddd170cmr13935784wry.338.1653851731824;
        Sun, 29 May 2022 12:15:31 -0700 (PDT)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d64c1000000b0020fc6590a12sm7089420wri.41.2022.05.29.12.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 12:15:31 -0700 (PDT)
Date:   Sun, 29 May 2022 21:15:30 +0200
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org, jikos@kernel.org
Subject: Re: [PATCH] HID: nintendo: fix unused const warning
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20220528212331.3460905-1-djogorchock@gmail.com>
In-Reply-To: <20220528212331.3460905-1-djogorchock@gmail.com>
Message-Id: <33BPBMJYM4USN.3UH0DZT3WSR4S@homearch.localdomain>
User-Agent: mblaze/1.2-7-g31dd7c5 (2022-03-20)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

"Daniel J. Ogorchock" <djogorchock@gmail.com> wrote:
> JC_RUMBLE_ZERO_AMP_PKT_CNT is only used when force feedback support in
> the driver is enabled. Place the declaration in the CONFIG_NINTENDO_FF
> ifdef to avoid a warning when compiling without rumble support.
> 
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---

LGTM!

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>


> [...]
