Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0AB75E56A1
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 01:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiIUXNM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 19:13:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiIUXNL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 19:13:11 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F215DA8960
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 16:13:10 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id z26so3024778uaq.0
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 16:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=FyAtRR97nFSHuzxsaBmRPTUoBYWBDY2Uv7aagsQ56QmVSyjXkidl6TEz80WIw27/NY
         +K21K+mxQT57I1IxqGX15eiH0KYYSeS6dvt4hCCA/b8oC+dcczEds2cT9HwIVARUWfRv
         AepgOkxXOcdaPBgadH/l80wdNxzhVo9nr4o9Tz5rDY/01YJiyP+jc0Cn4wbwDHoYdVIq
         D4VUb2IWqHmwI8BOAdfYm1cIi29zfdEgxSbCI2h0fnItmdA/RzmXvvLyIB5wAQqHX5QC
         dLG1djk/u22/XkbhoU8RWBLGxUn8j9vM8Gx9IUR5TXrAMsOd5FSEX8o5L8dNIocjLNkZ
         tAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=apCbsXEC7zzTkDYch1PVS6hwqKne+qdivfNUlkJMhrjxZS36kpPUOS2mA90lgafQ6a
         DQnL9pw2MqjK5aVEbIcLA1rflcc1T/KamXFn/bahayG12XqGHwTqppSw4U9GWp/cmf1/
         FLuEggyyVPGWRJQmYfGuZSnQKm+Hoeb+8NScCyJVduInR484e64hjgOc3mIFVGhaQ27Z
         LyTRbD+wf2/IMJAXonyxuleenKMFEwSvskMilzMjGEXN8KGX3OAd35UkKU8RysDllymo
         Jtna37Dj5Xo57bYt4uKFxYTVCiXUDGEMIHyByhIC8QmcakzdOGHGPwtJkoPRWzUZL2GP
         g/bA==
X-Gm-Message-State: ACrzQf0HTGCQUGTcq/Eog7OK+rP2k56uBl6CCHGrawaWjE/JQv08XNyH
        By0omx3LdxwwsgnpZ5lAWcxdHae0kf2xTI7AIWw=
X-Google-Smtp-Source: AMsMyM5hGKn/2JkmUlBRU7DGYnU9kxEwZTLV4Eu2WOlGrQfzbPRWAdvdMvD5DN0afz64PjMitTpx2vAZAoglBDVfTB8=
X-Received: by 2002:ab0:4467:0:b0:39f:52ec:46d7 with SMTP id
 m94-20020ab04467000000b0039f52ec46d7mr228511uam.77.1663801990074; Wed, 21 Sep
 2022 16:13:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:f6d9:0:0:0:0:0 with HTTP; Wed, 21 Sep 2022 16:13:09
 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <alassisidemion@gmail.com>
Date:   Thu, 22 Sep 2022 00:13:09 +0100
Message-ID: <CAG8=Qajf_PboHx3Upt_EgO=sou-0U4HPtxVB=C=BcPozsTd9zQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
how are you?
