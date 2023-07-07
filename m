Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0586974BA47
	for <lists+linux-input@lfdr.de>; Sat,  8 Jul 2023 01:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbjGGX7v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 7 Jul 2023 19:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbjGGX7u (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 7 Jul 2023 19:59:50 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2D2A2688
        for <linux-input@vger.kernel.org>; Fri,  7 Jul 2023 16:59:44 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-553a1f13d9fso1868466a12.1
        for <linux-input@vger.kernel.org>; Fri, 07 Jul 2023 16:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688774384; x=1691366384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZQPt2KWL1nME+54ZltYJJMg2BWSwrIJgAzJt+5zqWB4=;
        b=hBfRxSJ5AroUwWhND0NMEPmAssjohiT86ExVO/WKmrFJ1CusDg+IudVBy+9Gr8Pw2m
         bPimkThUAoDbN2dnqYW4tZ7m8IN94aK8XkYTuTRP7T4TVbsmuK88pj3XcoUY5lRY/6qQ
         A4tUNrPwM/aD1QI3iHyfrlgFwV3Vzomh44rz+aXbSfZqy2mfrbmCvpm2kSGItdeEe1ph
         xEluuNM48A+KQAUdgEl14IXjEt7b+ElSA5lfMvEbitzAE/TIzVnMcHEwlQsA2PZuxhda
         dwRz5kdI9qyqV8HYL43dQxFvVPSf2bUwwTyyQklUj8eGkpLcp1SZUZdcoYJhOlyB2XLx
         n24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688774384; x=1691366384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQPt2KWL1nME+54ZltYJJMg2BWSwrIJgAzJt+5zqWB4=;
        b=ZOKQ7cdwjEM8gkgp1Q4RftrRVjfk18CHMRtDYTaiBM5hGeCBNCLze/H0bIy2CG+RJI
         8472tNNrLlVabulgnLtkT6g1cMlitr3Mw1seKSQQFK8HuNwXr40N+LHJ2+Xnny/qMz+i
         VgqU4ArD5qOnL508XKzkBODZ7giymiSYYDZz57/UpiHZpMNpihsbnNxL/Y7hoSR+ijSJ
         Arq+FeRPgTDrtdEHsvJSt6K8hYAf5DiNgxJ83y6lhWlKv460R1v8iQlhDMyL/kUP1rK3
         VKeNG9s3LsqkwzLFSeU5Twb4/MKiVtDFNu94LW0fSwNBEKv4a7WM5O4Z9a6Q1nsDn6Ua
         L5ew==
X-Gm-Message-State: ABy/qLb+pOdwpG0E8d6/F7ke8c9Y+dmg0+9/2SrB/b4AYlvVIhPmsJwX
        82wTktr/z/2muuvELwUtxlM=
X-Google-Smtp-Source: APBJJlGizEQNrSYcJzkMzQoZrq7h4cB/A//qZz6s1OJF95NtrPBhm6pr+VlwMhpWnl+hIMBPuAS2HQ==
X-Received: by 2002:a05:6a21:999f:b0:12f:d812:6a0 with SMTP id ve31-20020a056a21999f00b0012fd81206a0mr7486916pzb.49.1688774384306;
        Fri, 07 Jul 2023 16:59:44 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:38de:2bd4:8f55:60cd])
        by smtp.gmail.com with ESMTPSA id c12-20020aa7880c000000b0066f37665a6asm3358924pfo.117.2023.07.07.16.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 16:59:44 -0700 (PDT)
Date:   Fri, 7 Jul 2023 16:59:41 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     linux-input@vger.kernel.org, Pavel Rojtberg <rojtberg@gmail.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH 1/2] Input: xpad - fix support for some third-party
 controllers
Message-ID: <ZKim7Xg1o4kfhDxa@google.com>
References: <20230607012812.379640-1-vi@endrift.com>
 <20230607012812.379640-2-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230607012812.379640-2-vi@endrift.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Jun 06, 2023 at 06:28:11PM -0700, Vicki Pfau wrote:
> Some third-party controllers, such as the HORPIAD FPS for Nintendo Switch and
> Gamesir-G3w, require a specific packet that the first-party XInput driver sends
> before it will start sending reports. It's not currently known what this packet
> does, but since the first-party driver always sends it's unlikely that this
> could cause issues with existing controllers.
> 
> Co-authored-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Applied, thank you.

-- 
Dmitry
