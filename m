Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4BB6F269C
	for <lists+linux-input@lfdr.de>; Sat, 29 Apr 2023 23:37:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjD2Vhy (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 29 Apr 2023 17:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230225AbjD2Vhx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 29 Apr 2023 17:37:53 -0400
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com [IPv6:2607:f8b0:4864:20::b42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D25121
        for <linux-input@vger.kernel.org>; Sat, 29 Apr 2023 14:37:52 -0700 (PDT)
Received: by mail-yb1-xb42.google.com with SMTP id 3f1490d57ef6-b9a6f17f2b6so14392052276.1
        for <linux-input@vger.kernel.org>; Sat, 29 Apr 2023 14:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682804272; x=1685396272;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEzM+W+OEmpHfEeEaAySJoGydPuqhtpau7d10u77fwA=;
        b=N1xnLYzxAo1KF1vJV7MMqnxF/vA/u3NnNyCSVpeE5Gce0S7jy+NxO0MwvYprsvP8jP
         9KgBO60AWrtsAsuv/WG7YcLbn3Yk3Pq7IHOdxJ8wOGKjEd9thlmiG04Q8+DsyOc/Hji7
         6tZElWkSFskQoOZvwk7RpvDFtVyfZnR3JTZZHebPSd3y03F3+8wRQ4UL30LW72i/FgZ/
         MxYXWxOoy3NWdEt6MukNLi2uvoi2ju09b5Lyq6JKKl5xuH3tEzFlNnsstR/67kK0wfax
         bWiCcdXiBiVHiZ7yKs8et7bfgaYDlYUW7kM6WcoODBryd5JwKRNW4WIXh4OT73kA0PyV
         luCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682804272; x=1685396272;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QEzM+W+OEmpHfEeEaAySJoGydPuqhtpau7d10u77fwA=;
        b=M5iuvc/J6xmFDYGaEDUc+1ANdESx7yVVer0pfODjcc9oSsqPNVHumw/esjcfV1iPKi
         36bm/HjhT0fqf4blip1E9eOGWBDCWPPz41/jhfXUbkJbxqukiQ48Raadpew5zbMCL2kT
         h22QmE2gimpQ8ED2b/mqgWVDv2pMD6izRHdEW2hQofyTDnb0uWJyvnlktuMs6uVRsNt6
         wdSjKPsw5gz8OuGAPzXE5amSkBlBLv+tDeOPKK00og9FUrdAPSZdiGjz/U+xJ6vrWtzv
         VyuFSfmXEDMWj/MTsoZSEup2zaFmwPSDPAw/xrs1Pn94kI6goDWJCymGL9FZhkBThIrm
         pJnw==
X-Gm-Message-State: AC+VfDzqLTILHM6M4SL8U5BpmUtrw4W7ReiCmPrA03gbUjg+q2kMlB4Z
        WQ7rP3p6pUSlX4DSySz5MWLz328JpPXiPUeoVBiA/yEaHUTQig==
X-Google-Smtp-Source: ACHHUZ5kCWNoeAvvmTCerX4TR00fjpbqxCWUaO9nMP0EmfcYu+Z50E1UrhVMhZo+RLiyD9WPD1Wk1GcHUzDfdRkpZiQ=
X-Received: by 2002:a1f:6419:0:b0:443:b924:da82 with SMTP id
 y25-20020a1f6419000000b00443b924da82mr5230777vkb.2.1682802795768; Sat, 29 Apr
 2023 14:13:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c321:0:b0:3ca:d75f:21c3 with HTTP; Sat, 29 Apr 2023
 14:13:15 -0700 (PDT)
Reply-To: ava014708@gmail.com
From:   "Dr. Ava Smith" <smith191919smith@gmail.com>
Date:   Sat, 29 Apr 2023 22:13:15 +0100
Message-ID: <CALs781XtgCAZ2tx0ZMtnRHCLoZWTpuhXMvd0rZPLecSgwjZ+7g@mail.gmail.com>
Subject: Hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello Dear,
how are you today? I hope you are fine
My name is Dr. Ava Smith, I Am an English and French nationality.
I will give you pictures and more details about me as soon as I hear from you
Thanks
Ava
