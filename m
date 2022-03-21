Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D141C4E1FAF
	for <lists+linux-input@lfdr.de>; Mon, 21 Mar 2022 05:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234948AbiCUE7u (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Mar 2022 00:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243479AbiCUE7t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Mar 2022 00:59:49 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82DF17E0C
        for <linux-input@vger.kernel.org>; Sun, 20 Mar 2022 21:58:24 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d18so11714269plr.6
        for <linux-input@vger.kernel.org>; Sun, 20 Mar 2022 21:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=euRRtPhaiOemJpsgwWfFDkM8NkA6gbP+vw5cZXd8jz0=;
        b=UxttMibwVvtaGWqb6NvPCy8Ar9bUqoZG3P8aMD1RvlBuR6kCDGLgdqF7dYCHJzFyw3
         5Qa2VoVe+vcxEFdBJ2Yf+4qYRCrT64PofW0FTvXYlwkSCL5W+xaMmJNEIHPzkizIrW8l
         d1mQhi1EGfzCJ3AQHVHCA5bRFC0jxjqrbothD1eA2mUNPa2z4HcZUxNjBNLq+GfZR/Q7
         /6eiwYBUaequOwnCzJaauonfZtDoyw7qlyiutN0cT7CKZNEgBwAIzTCIsK0508JRWHmH
         Sh339w+Ir3zCfb/MCP+FOsycSnIonZ+h1pMVunPop9rU/i7nL9BUlRC9GuVYVsjaPOqM
         4u6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=euRRtPhaiOemJpsgwWfFDkM8NkA6gbP+vw5cZXd8jz0=;
        b=ie99QCW+YgeeaAcSdQ9a5KlGWAFkRifbbOV7JmvRM1NhWzQTkeObLHcDo5Q2CgRuvP
         I3RhvbWI2Y+btogpvt62nSo23UIoqcDT5CaRZWX6fyv4WLBSNBKAzc2t1v81fIzKV48I
         L/l8Hzc44NR4/zFeVEokfUP8Q+FQJ9xHfm0rIRA//esA6+asLPyZ6BWcvIovGyAESlYn
         jsow38mmLMrGnvqTjPaZqZ6sgQub6G6cBtjj2baNH8B3oXx1VLTHOo+l9s9RPYrgRa9V
         i1JsbPpT9oftDTHoGH80pAHr59PNtRHZnVl0Fu3Vf2kE1WrvFq7daDWwaPRBSMUO0MNV
         +w+w==
X-Gm-Message-State: AOAM532RKZH8hBFE1bwreldBdFTx/PXboECRjiVeTVEziJnRJj88nJk6
        bL0ZoiMDQH2SOmlu4eo5U5I=
X-Google-Smtp-Source: ABdhPJwnClQAwWiEvYgn7rpbu3V/TZ2n/YRfSeRqOeQBdau50CvGpXj/WN0X1sfBtjxF5heUEdnmwg==
X-Received: by 2002:a17:90b:3e88:b0:1bf:3bd0:4b5f with SMTP id rj8-20020a17090b3e8800b001bf3bd04b5fmr34550631pjb.106.1647838704201;
        Sun, 20 Mar 2022 21:58:24 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:31f6:c8f1:6f10:b2ec])
        by smtp.gmail.com with ESMTPSA id o1-20020a637e41000000b003804d0e2c9esm13275555pgn.35.2022.03.20.21.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 21:58:23 -0700 (PDT)
Date:   Sun, 20 Mar 2022 21:58:21 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: iqs5xx - use local input_dev pointer
Message-ID: <YjgF7Qkm2ci7wtyo@google.com>
References: <20220320025707.404544-1-jeff@labundy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220320025707.404544-1-jeff@labundy.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, Mar 19, 2022 at 09:57:07PM -0500, Jeff LaBundy wrote:
> Both iqs5xx_axis_init() and iqs5xx_irq() already define a local
> input_dev pointer 'input'. Use this instead of iqs5xx->input so
> as to make the code a bit smaller.
> 
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
