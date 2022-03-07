Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA114D0B00
	for <lists+linux-input@lfdr.de>; Mon,  7 Mar 2022 23:24:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241560AbiCGWZQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Mar 2022 17:25:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241562AbiCGWZP (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Mar 2022 17:25:15 -0500
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2336FA00
        for <linux-input@vger.kernel.org>; Mon,  7 Mar 2022 14:24:19 -0800 (PST)
Received: by mail-pg1-x534.google.com with SMTP id e6so14724948pgn.2
        for <linux-input@vger.kernel.org>; Mon, 07 Mar 2022 14:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5XGM55zTp/ghUTL/l1RFf75h8K2T8eN+88bG2iz9m9Y=;
        b=bhTFtf5EA8CKNZ4cwr9iTTKQ02Txq8HIsf/TK2pM0eqKWLlhSYBlFSoQ8grISDjo3/
         7iia1ap7bGUMDbLbVgv+JcxKKlStqpzYzbu2YzT3JGUPpkVlaWEzNBB3DFKxvxKClmNH
         CmKyH4X/+E0rBJf2zEwEl2VIzHtaO+eqduwAvn8GQsqjGh+q1pIFhWw2DCf4ayyf8UBx
         Yyu24zy0REFKaHSKfGnzn5METaVdRUNitxu9SJFFVjfcFGNdPjh6shALtEraLgN5P0a/
         F2v0aex7tne/8Qza1NpIaec9h8RYXUx3ZsfzNoOnJyefmTSm31CpF+EmnQE4zA5rPJpt
         Otfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5XGM55zTp/ghUTL/l1RFf75h8K2T8eN+88bG2iz9m9Y=;
        b=GZG/TAX+MpUyZYYVXK0Jnd9Kakp4u+RkHzK4NIMzOX3N23hFzewURGr8/o3Cc/+EA0
         RSOzs0RhGERn/dNzAjhaBZnWCPU7TfOPHtRXdCEpIsI5y6/w9AqrAO+BnnPpxCh63bYR
         fDMg71Rmkqr8Ofa99Pr9OTTfSkflqvSlk72PutfX+aTFlcUEsc90SIXi/amVWc3DU8RG
         QEFwFw5eIaiLEJIok6aHEt5QuoJxynNjTxluz78Yo9Bncmefi/Y/Z3KXO2RMioynP/09
         vFwILk8pCu4Pys+uYgT11fBuQ4Gmobmzl9Qikxmi3jtHtOV3ReqdeAYqrqmx4ut6+du6
         IbCA==
X-Gm-Message-State: AOAM533TFNwj5WnvtRbmYukhIIlJPAF66XEVClM75ZZJM4vuwJwxlKjS
        kogt79OEa0LyrtzNy/tF9ro=
X-Google-Smtp-Source: ABdhPJxlWOTPznwSICo7/25RitXST6yp8+WxdP+FYA5e1ogAK/fr/J0R/BkTgSniYFw9BcUlnACXVg==
X-Received: by 2002:a62:7a10:0:b0:4f6:9396:ddde with SMTP id v16-20020a627a10000000b004f69396dddemr15071871pfc.82.1646691859337;
        Mon, 07 Mar 2022 14:24:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c900:27f3:5496:6185])
        by smtp.gmail.com with ESMTPSA id x2-20020a17090a6c0200b001bf6c74bdd2sm358506pjj.1.2022.03.07.14.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 14:24:18 -0800 (PST)
Date:   Mon, 7 Mar 2022 14:24:15 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-input@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>,
        Nikita Travkin <nikita@trvn.ru>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v3] Input: zinitix - Do not report shadow fingers
Message-ID: <YiaGDwG3JXj8qDcN@google.com>
References: <20220228233017.2270599-1-linus.walleij@linaro.org>
 <YiLHyOQw/Zp+IQ4+@google.com>
 <CACRpkdZpESVJ4EE9g1DP__o1ZdMT=-mFM=36DLQ5L_BW8DVZVQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdZpESVJ4EE9g1DP__o1ZdMT=-mFM=36DLQ5L_BW8DVZVQ@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, Mar 06, 2022 at 01:32:57AM +0100, Linus Walleij wrote:
> Hi Dmitry,
> 
> On Sat, Mar 5, 2022 at 3:15 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> 
> > I actually liked that we iterated over individual contacts here. I took
> > the liberty to rearrange your patch a bit, could you please tell me if
> > the version below looks OK to you?
> 
> Looks good and works good, gave it a spin on the hardware to make
> sure!
> Tested-by: Linus Walleij <linus.walleij@linaro.org>

Awesome, thank you.

-- 
Dmitry
