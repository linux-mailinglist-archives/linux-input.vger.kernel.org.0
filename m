Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D37155755CE
	for <lists+linux-input@lfdr.de>; Thu, 14 Jul 2022 21:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240395AbiGNT0Y (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 14 Jul 2022 15:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240142AbiGNT0Y (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 14 Jul 2022 15:26:24 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96ADD47B96
        for <linux-input@vger.kernel.org>; Thu, 14 Jul 2022 12:26:22 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r10so3880733wrv.4
        for <linux-input@vger.kernel.org>; Thu, 14 Jul 2022 12:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:to:cc:subject:from:references:in-reply-to:message-id
         :user-agent;
        bh=A8PM+ftjarV99c43F3HQCIFQsC5GRGO5C1VMgstOy1c=;
        b=NAWl7y9v0W/6ZX2qJN4CbBYGlm0h0+vh8E5KrNdA2sFx3GQBH+0MyfQtl/OneSSFeI
         i6REOIsIiNC2aRJd4ombruG/Q31VuDtf/GwgMsF7pYpsnPlZMNxbGsL8nS/JzjKLqcss
         EYFwDz39eYcwnm8ZHqSpLbSs10YlyuJQEfzAfmR8CqdYDkJTcbaqaNFhAVWlzmjegTWg
         RXnDGWEsmfhW8YdgPXGzuc/uX+6l7mLEyqKo9+N4Qxmf4kCZ5QIhgSMuzP6PVBtSOFmT
         5CVSq9FC3SBDpJyRw5PfAkMlXVMuKmNUHFUfm8V1wkUMQIwgE+k3yojU2wagW49NsHCL
         76/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:to:cc:subject:from:references:in-reply-to
         :message-id:user-agent;
        bh=A8PM+ftjarV99c43F3HQCIFQsC5GRGO5C1VMgstOy1c=;
        b=cwZ1Sejo3B38qHe4kzDp6F9+5D2xFOmH2qJC6R4CivJAdULxP/c+YNeMr/mgZg4xck
         4rP/rBiBz5DCNmtuV4Yu60Fjpa6or0b98vXIM23V/PEYO7lUekeoRRn+KvZS5FKIP/L4
         4IjTHFA4Zhwm0zc3yjnV7vrHO+P9aCW9mYogZsSZLK0phpkf2LKaDEAYqGOJABogH/9Y
         8Yzv1ZrJTPrRANFJakJkPeIsLxZyWlmNjAgLNWk7sMfU3PsdhvbzYFCQGNchV2f6gJKS
         9BZuzCCwuZrL64wVeLirQ+Nwj6jhlRYkSJkK6PlBkEoeXcqFIl9oiHCKy2AfewIEBMnQ
         4WQw==
X-Gm-Message-State: AJIora9krPinHw8GqCsUnTwQ4B6dnlAVWjt6J1VtaJIaSl+w8o38ejg+
        bHwAF6Th1JTRbQePg94d2Gw=
X-Google-Smtp-Source: AGRyM1vveAaa3q2hBfsACkQioWW7CcVlNAzRkvbidjR2mMgPzh+HFuh+9Rt6wIZJAe0lZlndCNQS5g==
X-Received: by 2002:a05:6000:154a:b0:21d:b74d:3561 with SMTP id 10-20020a056000154a00b0021db74d3561mr9524593wry.584.1657826780986;
        Thu, 14 Jul 2022 12:26:20 -0700 (PDT)
Received: from localhost ([2a02:169:1e9::acc])
        by smtp.gmail.com with ESMTPSA id r6-20020a5d6946000000b0021b91d1ddbfsm2183359wrw.21.2022.07.14.12.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:26:20 -0700 (PDT)
Date:   Thu, 14 Jul 2022 21:26:19 +0200
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: nintendo: fix rumble worker null pointer deref
From:   "Silvan Jegen" <s.jegen@gmail.com>
References: <20220713202059.3835-1-djogorchock@gmail.com>
In-Reply-To: <20220713202059.3835-1-djogorchock@gmail.com>
Message-Id: <37WF0J70J9KKY.2YOPZP4AF1N0M@homearch.localdomain>
User-Agent: mblaze/1.2 (2022-06-21)
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
> We can dereference a null pointer trying to queue work to a destroyed
> workqueue.
> 
> If the device is disconnected, nintendo_hid_remove is called, in which
> the rumble_queue is destroyed. Avoid using that queue to defer rumble
> work once the controller state is set to JOYCON_CTLR_STATE_REMOVED.
> 
> This eliminates the null pointer dereference.
> 
> Signed-off-by: Daniel J. Ogorchock <djogorchock@gmail.com>
> ---
>  drivers/hid/hid-nintendo.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Silvan Jegen <s.jegen@gmail.com>


Cheers,

Silvan
