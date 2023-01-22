Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31BC2677231
	for <lists+linux-input@lfdr.de>; Sun, 22 Jan 2023 21:04:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbjAVUE2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 22 Jan 2023 15:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjAVUE1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 22 Jan 2023 15:04:27 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3964E93C4
        for <linux-input@vger.kernel.org>; Sun, 22 Jan 2023 12:04:26 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id s3so12382723edd.4
        for <linux-input@vger.kernel.org>; Sun, 22 Jan 2023 12:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLl9PR6sEpr3tIWaSAX25KWJytmOInssz8fRd9oDq20=;
        b=pMStElh5iDZtNksQKcNNTfjGIA5NCRsb/K49G8EkA8M2j9wfiuATeRMH925ZB9jN3+
         sLfEsHa6U6h4SODs1LUcD1HM/F7aEWMA4OD/ZSCaUhI/ilpSIvNcLkIKozuictgrE/1k
         dBL9hASzxYhEeQMzgQWzrB3b/DV/B2zj37crmIZX+DkmQjqn1cf2LBXKqM/IBa+NRqYy
         jctKi59SfBH5CsV7h+6KpweL4E0Clq452LUDTRsJ1162/QXpdv6dtT3m0MgnMfoeJkWK
         mBvQ5earHFYyDa/37jgSLpeQi/8kRuUSajg7u/+C54ByyUejFc07ns6/Ar/tWFfQ+eHU
         Q+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KLl9PR6sEpr3tIWaSAX25KWJytmOInssz8fRd9oDq20=;
        b=tlby7KJiGag80GuYaxlxI0/i5bUbql4h3jTBy8J4PWtRL8d61cyZEwyh5/pJPWhzj7
         l3QyQrLxGPS0MsNZDmpEy8Fve68g7MkzfQHQhMFUa47HjwtQ/I3tFp7thphOrBcgFmCW
         WT97qpjfVpK5ikL92Z4ywVEAN2qySzhvLOsUnk+XVwIrMzhCc/MqLzbdHAnXjyZlsdWn
         pu/ICWA1TP9430QjJIQCQrsognyyEXb2SRZIb5C3l21SbcFG2GPfgpLeYo+vMxN/kpL3
         /1IPyGKOIViprlOTw1U07WGLlqbM9w3mgT4g64QdvTtHX2n9/B6hetPlb03CedID9Jfz
         gSWw==
X-Gm-Message-State: AFqh2kpFqFzA8ma1eiu6mF/UbwMna7GShzl0WX+eOf8SI3vvS46f5nix
        FJ3PiaOeG3Sy8KsBb9tTyAcDyb+V3/QbsQ==
X-Google-Smtp-Source: AMrXdXsjRIJetlugpnL2yp4A8rKWutTAAU/s1iV1PbVI4PV9KQAcv+Fy2mWxbJlbaVRHOY7A4+W3Kg==
X-Received: by 2002:a05:6402:454:b0:492:8c77:7dad with SMTP id p20-20020a056402045400b004928c777dadmr21691336edw.8.1674417864591;
        Sun, 22 Jan 2023 12:04:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a4f3:6f00:fdec:b2d9:7885:5e8b? (dzx520yj99w5qw0fgn6gt-3.rev.dnainternet.fi. [2001:14ba:a4f3:6f00:fdec:b2d9:7885:5e8b])
        by smtp.gmail.com with ESMTPSA id ew7-20020a056402538700b0049b58744f93sm14022546edb.81.2023.01.22.12.04.23
        for <linux-input@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 12:04:24 -0800 (PST)
Message-ID: <32629b93-8148-17fb-676e-b37c82821094@gmail.com>
Date:   Sun, 22 Jan 2023 22:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   "Tommi P. Laiho" <tommi.p.laiho@gmail.com>
Subject: Subject: unsubscribe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Please unsubscribe the following email address from the Linux mailing list.
Email: tommi.p.laihol@gmail.com

