Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25F005F9D22
	for <lists+linux-input@lfdr.de>; Mon, 10 Oct 2022 12:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231823AbiJJKyz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Oct 2022 06:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231866AbiJJKyy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Oct 2022 06:54:54 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529A712A8D
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 03:54:53 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id y14so6870111ejd.9
        for <linux-input@vger.kernel.org>; Mon, 10 Oct 2022 03:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX4BMjOypo5d/OsLI8Sw4NpZ7scgBV3K3bt0u2CQOQc=;
        b=VzjXzi9JzNrDydFYx2iGm4RvGVgm6Z9i8e2j8gHBqCE9MliRXf+UN4F/j8w0qL2ZeG
         Xy4ozrMx+cNRwBuacZs9WIGT9nd5WIUIwqorv8BXPJOpGsji8+UqZ8UFsRTUwQGUkx1o
         zbnLRHMkxd9h4RJLrCDVcW4DTbobLjFUAFxLqk6mCOSriaXTd7BXs7MLG0GxupJR83H3
         j2OT0xtX5fhTAPl4Trqq0Sr4Navnj4hlftGo05C8hjvf5gJpZss65/z+Br0i3PXI4OnH
         cCnyBWuF935a0QvNwdGgBYje5j5O8nqZQAmmMTnADdAyRspvVkJpAt2n3LgH5QbPbUCw
         NDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wX4BMjOypo5d/OsLI8Sw4NpZ7scgBV3K3bt0u2CQOQc=;
        b=SyHJBGs2q7OHpKtfqL9GvEZhjOqMCO+rIXZs9XckVXcCmdowCBiUXa5+hz7cGUPuhG
         mmqc4NRJdBA2FaAV6Oo4xXZNt9cGMVCNO4/nuSb+lzmwmpiGX9EPasWQsSrlsKwhHMWq
         Qb79aMwjHJNJZL+7L1hG7cIaBRNpPbewMEhV7JATY3s3sX12BvmvROEXZGvIkQrs6Rfa
         YTwrsIy6isTg2Yge0z8e3wtyDmWDxeN3Bamtfa/zSllhJsYwJkXyOVK7ghDv3PKxpsn5
         X0D1Sr3Y948ej4bj5nejz1ltZl7jCJj4vO73yi+Y7Eq5bQGOvUqWCPqgd62E2aPCxmdg
         F9Zg==
X-Gm-Message-State: ACrzQf0apGsuzfWqaU9FxKLgRyv2whOvrnIyBxbap01sCEEiS7ASOC1r
        TJQ2OOKtaYY+gGTeeZHMbVP93hkfXQCztnUR2Hw=
X-Google-Smtp-Source: AMsMyM6qoCLbebmqnjoi3oWYyYLMkji+2AVCYzcogaAsMvjnmctaxa4vilRwBPYjmsWfMaN8byz2TD85aLTKyPtwQZE=
X-Received: by 2002:a17:907:1691:b0:78d:4051:9429 with SMTP id
 hc17-20020a170907169100b0078d40519429mr14683171ejc.721.1665399291416; Mon, 10
 Oct 2022 03:54:51 -0700 (PDT)
MIME-Version: 1.0
Sender: mroscaraaro3@gmail.com
Received: by 2002:a17:907:766a:b0:78d:b690:47b9 with HTTP; Mon, 10 Oct 2022
 03:54:50 -0700 (PDT)
From:   kabo uago <uagokabo003369@gmail.com>
Date:   Mon, 10 Oct 2022 10:54:50 +0000
X-Google-Sender-Auth: 9nS3rhhKGKAtaY6gWYzMOAbYyf8
Message-ID: <CA+FoMfeXc1_SC1UkPy36vGCQj=5O8Jg2aKF9-cLroPoGM4bY1Q@mail.gmail.com>
Subject: GOOD MORNING !
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.6 required=5.0 tests=BAYES_50,DEAR_FRIEND,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:634 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5046]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [uagokabo003369[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mroscaraaro3[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Friend,
My name is Mr.Kabo Uago, I have an inheritance fund of $13.5 Million
Dollars for you, contact me  for more details.

Regards,
Mr.Kabo Uago
