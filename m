Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B8A5BEB09
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 18:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbiITQVt (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 12:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbiITQVS (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 12:21:18 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE48745987
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 09:20:54 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id d24so2903478pls.4
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 09:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=jJXR4QCgKEKFUSG8vusb6sfxw0STSpEfWJnRz7e0NC9MtZBKjvXzZMpF9Ej7hQMVcP
         eVEmYyt4wAn0MuJOiaThRMoysdxiAnExsZMBLHXih5pxGpv47+BvokjE3+IRVOU5DKEz
         pONIbVBodbWf8ggeVFWQYebPl4TvN/IC/y3ICmpak/mN6HBpZXY+z43POF01MRYi9SQ6
         vSuU6e6TNOQGtFwtjF6WT5KAOfHj3Lrbb/dR61CgJKlfK/vj2/fksALzXndGb+2BL1Gs
         QD5cseJB+vVnLGKR1Tm89b65OC5vSH0PNE3tljGl6XWbeglgRND6GHSubY266qO89pCf
         84Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=s2PkvR1wBLIlDWWEJa1IovNkEFXYlGq7TisQCNW/W5eULov4cmdb081JMOFgNCl2nm
         O3vHXsErT0ZbsIGnHZNRA2jBreKMiLAgRxKA75fAIeLUmxR8abcAvWebN/ZMC3IAaGP7
         9d/6SAW6pX8IHQGzdaTYncVRqC3jsUTna/zH64Jq5pD5Vz+axBSBClU2+Qjw6UdGMi1X
         2Ty8C5l1zFXbODpGfX0Lxv8jy7btqQ/jE1XctZOVhEDRqzu9mlmnRO/eDEeWs0k8RWzJ
         uf29rOT9ZKZe2wRdE47R1FjhbLG5H1ayXZVn+WcixALs3tpQDRimcXKQkc3kl6Pm6oTX
         7Dfw==
X-Gm-Message-State: ACrzQf1kvnOhK/ij+uBffguimdSwk7DMc5RXUuhm3Emi3O+j6WkCsxQd
        jKiS/vPY5ujFO1r7xwZTF499I1jiIOOjfFBn
X-Google-Smtp-Source: AMsMyM5Jg+ji0iF3avp2yrwfXFu5Y5fRYa7i6ePgzpk/ySoFQnfnpNozUjg7dtpWhbvbrMPnjwPrBlTUfiXNh42Is2A=
X-Received: by 2002:a17:90b:4d12:b0:202:e772:fa09 with SMTP id
 mw18-20020a17090b4d1200b00202e772fa09mr4859555pjb.30.1663690854475; Tue, 20
 Sep 2022 09:20:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:e896:b0:2f4:3ded:66bc with HTTP; Tue, 20 Sep 2022
 09:20:53 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <tinaeevan@gmail.com>
Date:   Tue, 20 Sep 2022 17:20:53 +0100
Message-ID: <CADEuEs9rKLpQBXWA9XeeeCp5APpp=aHu-Jtng8pa+Eub4s0+yg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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
