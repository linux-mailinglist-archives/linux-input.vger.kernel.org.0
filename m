Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64376196F4
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 14:05:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230460AbiKDNFO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 09:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbiKDNFL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 09:05:11 -0400
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com [IPv6:2607:f8b0:4864:20::a2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A4026AE5
        for <linux-input@vger.kernel.org>; Fri,  4 Nov 2022 06:05:09 -0700 (PDT)
Received: by mail-vk1-xa2d.google.com with SMTP id g26so2349736vkm.12
        for <linux-input@vger.kernel.org>; Fri, 04 Nov 2022 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5p+2212nSs70KkMMypC1tbex5JQYbFSNyVBImxmcawE=;
        b=EWe/VEIPgEDuC4ALFRHz8MGvbLey2Ct+jg3a+a9n4u+IOmvbbp8xXz5iB6Fs8z2Xbm
         b9ilGiiTnbsVoAPVzHY8GPILvliiCuIZ0B2GA6zAyrvwcFjyM16xXFVMFcziEAj5ml5r
         JLPZNX5wHWffm0WE7q+xmQJMiu190ZpECmkvcQUjYYEdveSl1jKq9FLBB1q8yrBQ31G8
         XvJjedCFEXimQf2u9xD49ysAD6O6NnScbrjymzjN5RsQw551tGcbmubuOuchZlH7VPbY
         muEVN03nYo+/R4ReMg8PxDa7BemTA0n6WbIYjZFEoFqGLYqbIVFXa7QZKpYHTmThO+42
         MS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5p+2212nSs70KkMMypC1tbex5JQYbFSNyVBImxmcawE=;
        b=xEy+KMhTdZMxxXKE8PB4k9Y4+yPABit7o8cAoMCHBjdjcP7U2YirnzaEHy5A6kWUih
         LYB+KjdB32TnemoWeZbt4M3ePOHIm+qgpN6r3T4Mh5moHryxlgp6rkMPw5HwqViWp/oG
         h7DF7ZF59rVvUrkI8RkcsN5vFNdrPPkMJK4Nk59Jhqy/AZn5G7EcyHLm8JbnEJ082ikR
         /ZKrkj5osd58Cxo/gLzNZVc9kkxFwvsrmNTmLWWFGLJelUdfp9LAVpO/Abegwlh4I3mH
         qS2WS4bnJL1M17YYG7yL4ZWFjazUByfQtYYW2GEUUp3K+Zn4W8VjWCX0bklO+iofV4Sp
         Y9Sw==
X-Gm-Message-State: ACrzQf0jETXMlb+bkDA3q3sJFjf95s0vlzMfU/PzzdeshOuMAbVwIQ6n
        ieIWCZUfQS8drwrp21TrkOBP6rxgoBuk0j19snQ=
X-Google-Smtp-Source: AMsMyM6oPxXyeO3sUYBtKvpcdqQ+cODYUf3T/akeJLHgfyt896xxdOoQ3b8zvhBZ7+v63AAF4od2miwFNX2NZjYJEWQ=
X-Received: by 2002:a1f:c1d2:0:b0:3b4:a675:4346 with SMTP id
 r201-20020a1fc1d2000000b003b4a6754346mr19317083vkf.39.1667567108564; Fri, 04
 Nov 2022 06:05:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:a58d:0:b0:2f2:a342:51c1 with HTTP; Fri, 4 Nov 2022
 06:05:07 -0700 (PDT)
Reply-To: carolynclarke707@gmail.com
From:   Carolyn Clarke <brad.leagle011101@gmail.com>
Date:   Fri, 4 Nov 2022 15:05:07 +0200
Message-ID: <CAF=xrxSh2f3P-3UNO-0ohHTf+s+8cSCQMo+03TEx1qjTNO47og@mail.gmail.com>
Subject: Please Read
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Good Day To You

I've viewed your profile on Linkedin regarding a proposal that has
something in common with you, kindly reply back for more details on my
private email: carolynclarke707@gmail.com

Thanks,
Carolyn Clarke,
carolynclarke707@gmail.com
