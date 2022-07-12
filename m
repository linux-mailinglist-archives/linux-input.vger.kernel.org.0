Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFE4B57167E
	for <lists+linux-input@lfdr.de>; Tue, 12 Jul 2022 12:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232502AbiGLKDQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 12 Jul 2022 06:03:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232546AbiGLKDB (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 12 Jul 2022 06:03:01 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87101AAB39
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 03:02:58 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id c15so2003075pla.6
        for <linux-input@vger.kernel.org>; Tue, 12 Jul 2022 03:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=kTnWqPCQ7JZ842fbaIQWezAeKboDsupaMXi3CH+q7qQ=;
        b=HAdKN0Hro5TjsXzWS2OSd9yZNaTjy1JuValPi86Ul7innz3/m3OIXeOHooc7dHBiEr
         rJCqEscTdWFwu4+9+RvE0s0Pk7+Ysd+8V16ObHYUYKxbfHltN8M/J8B5zJe8/M90uOJS
         MhUjUCh34DXQiV7noqtxZs6RNxKzdjkKvTBFnPCLpCQfZQC8dsnqjet19kCfz7inOcwi
         2ro64uFSPzQpQYlpGh5dGRXx2n093Xn5X3PwAfrtM53XHz88elbn1Jdgo5mnLr+dY0wO
         JadPkB5lplOvxbN19eiKfqcKiVMeuG+yWvJOvkgyjMVpvEUY+vOAnw4LC8s378Z1rptC
         /tWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=kTnWqPCQ7JZ842fbaIQWezAeKboDsupaMXi3CH+q7qQ=;
        b=YBiJc9zkXZK1C0XczMD1SjEwn9tvA1Ln1ywYK1NSRAKETWK8QsNGBkvh6cg2emn/RY
         JtP4vaxOEsX0MQZyiU8afiKC8PxQQtOn3MwnoL7or9DEXAyGRbTqJuYuwrmWb7vnmv3n
         Fsy4O+leKp6nqo/voJFcI3JswLyArFOQq5deVloEW0Vx7QytDaEOLv+LlvJN87r0unux
         7bGBWNqLL8goMYKot1K4N7xjrJg1gQ7pwfZuXQPSRIGtBUYU/+ka223epkeRYjRj1YtQ
         G8syqigiTz3UFPgXLTlx06ZMYYzIhxbw0hLxJdPUUuEhxENQrfY8xHrS3kWlv0BsNO90
         fNog==
X-Gm-Message-State: AJIora/mf2N3ZE1+ERBQHJeBo/lBsf9qCTLvVhmJ3NYe5OF2c8mwCPmo
        FMN2aisLNEKrV1xFyHQQrd9dcMQ5PLOWQuShqiHr9f5+Ro58OA==
X-Google-Smtp-Source: AGRyM1v+sfIuQOnWZliWPqeBBuRCBQu3nVoqGoAprBzqdHFrnvk3ksKt1bNt4FIFEfg/Jp5QbuTnRr/ROCw42mNSbdI=
X-Received: by 2002:a17:902:8f87:b0:16c:2c88:39ec with SMTP id
 z7-20020a1709028f8700b0016c2c8839ecmr20248972plo.52.1657620178094; Tue, 12
 Jul 2022 03:02:58 -0700 (PDT)
MIME-Version: 1.0
Sender: hr.falocoltd@gmail.com
Received: by 2002:a17:90b:2247:0:0:0:0 with HTTP; Tue, 12 Jul 2022 03:02:57
 -0700 (PDT)
From:   Al muharraq group <al.muharraqgrp@gmail.com>
Date:   Tue, 12 Jul 2022 11:02:57 +0100
X-Google-Sender-Auth: m3nsQUFd7S5wYDV8K-d_TyRTak0
Message-ID: <CA+c3rs1tkFfLP-92un8WvsoBpL47-2+9HHQp=ZgF7mCXhQ=rsQ@mail.gmail.com>
Subject: Al-Muharraq Project funding
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Greetings from Al-Muharraq Group Ltd.

I have contacted you to consult you for a funding resolution for your business.

My Name is Saif Yusuf. Do you have projects that require funding? We
facilitate the funding needs of private project owners around the
world covering infrastructure, housing, real estate development, IT
parks, industrial parks, film studios, food parks, agricultural
projects, health & wellness, hospitality, education, electronics &
telecommunication, power & electricity and oil and gas sectors.

If you have any queries regarding funding please revert back to me and
find the solution to your financial needs.


Sincerely,


Saif Yusuf
Business Consultant

Al-MUHARRAQ Group.
#sblcproviders #bankguarantee #mortgageloans #unsecuredloan
#projectfinance #startuploan #tradefund
