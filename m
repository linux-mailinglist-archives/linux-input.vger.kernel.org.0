Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7909A752AAE
	for <lists+linux-input@lfdr.de>; Thu, 13 Jul 2023 21:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjGMTCa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jul 2023 15:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbjGMTCa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jul 2023 15:02:30 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5505E2710
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 12:02:29 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-55c993e26ffso311849a12.0
        for <linux-input@vger.kernel.org>; Thu, 13 Jul 2023 12:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689274949; x=1691866949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UES6IuF5s3ENe6JApP0oslvwtogfoMIhcwJhTNCJ2wQ=;
        b=N/U1/DtBoddCxES0BZDGUakA1EUxGKAiAx65yLFrr1Jz95GW3NEh8ldIi7/2TZrMhG
         FycMg3ynH44TJKirwfViGwfWITn1/K4t29s08qEeItzVYHy6XkMeHGlPLVKvoTkqQk0K
         vHK7xwFadKTcDR7L8MDR8QiSqtT7iBw9j8f7sbU8vvKLWX/nFvVdj8je0RbvbvF7MkAE
         kQXv6N7iCVLNvEQi3pGxODvcUg71K2C38zpFUCeQ/y4Vnvbn1R1xvdRu+jlDvThM61TQ
         DbO89IPkT2fsyUrchLq7G8YGYrwVYq+6tpOgLaFClj9k1Bdb861bL13n1Y922h1+FN+Z
         vKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689274949; x=1691866949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UES6IuF5s3ENe6JApP0oslvwtogfoMIhcwJhTNCJ2wQ=;
        b=JHYi6kUHvnpnKk2NI0MYM4bMTOsT3Nj9+lAGfiAPfMKaxsaffYPY/VMzDjWcUEoQ25
         CKGjAxT7L/g8K4o4j8GcskTtzqoeH/7RUg1ptspoNZjbvezgd4+XTLHuMVseVESyeClL
         X2XQtgqCyAoFe3jVlH0o1bUIUX7VJkOltzsuhqNERAWgZzf8KMxOpaaTLbcRdwk0mBIq
         58x0BrsrRjbdDo+6FXEFys/H+41S+hTlaF2lh5krMK40t5/ALU9Pl3pwC68OlXqgPkHn
         sMmaUSx4BNhvHCszxgmoYCpnyTwSG/DvW0yI0RJivwD8c8w90e6E8GnSMuDShCf3mUPT
         Sjdg==
X-Gm-Message-State: ABy/qLbFHUGazXK1Y0C+9ivncp/pj2cEKnSgs/+DCdXdcptw51Tewei4
        gtMHo3dWjc2DVKcQ0/TojfA=
X-Google-Smtp-Source: APBJJlG9BukGO9xRuzH1SE2c6DdNrJd+nBBezetBwDxb+Q0IkqwsW+hSsqpDsMqe2JofMRgEDRwYhw==
X-Received: by 2002:a17:90a:be01:b0:261:1141:b70d with SMTP id a1-20020a17090abe0100b002611141b70dmr1588628pjs.45.1689274948680;
        Thu, 13 Jul 2023 12:02:28 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:75e2:8bbb:e3b8:95b3])
        by smtp.gmail.com with ESMTPSA id q19-20020a170902bd9300b001b9e0918b0asm6249607pls.169.2023.07.13.12.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 12:02:28 -0700 (PDT)
Date:   Thu, 13 Jul 2023 12:02:25 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeff LaBundy <jeff@labundy.com>
Cc:     linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: iqs7211 - point to match data directly
Message-ID: <ZLBKQadqBgEqInzq@google.com>
References: <ZLA+cuciIeVcCvm6@nixie71>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLA+cuciIeVcCvm6@nixie71>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jul 13, 2023 at 01:12:02PM -0500, Jeff LaBundy wrote:
> Point the OF match table directly to the struct that describes the
> device as opposed to an intermediate enum; doing so simplifies the
> code and avoids a clang warning.
> 
> As part of this change, the I2C device ID table is removed, as the
> device cannot probe without an OF node due to the unique nature of
> the hardware's interrupt pin.
> 
> Fixes: f2ba47e65f3b ("Input: add support for Azoteq IQS7210A/7211A/E")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307131717.LtwApG0z-lkp@intel.com/
> Signed-off-by: Jeff LaBundy <jeff@labundy.com>

Applied, thank you.

-- 
Dmitry
