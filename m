Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63564550D4D
	for <lists+linux-input@lfdr.de>; Sun, 19 Jun 2022 23:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiFSVar (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 19 Jun 2022 17:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiFSVaq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 19 Jun 2022 17:30:46 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAE3FAE5A
        for <linux-input@vger.kernel.org>; Sun, 19 Jun 2022 14:30:44 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id r5so9409429iod.5
        for <linux-input@vger.kernel.org>; Sun, 19 Jun 2022 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=6BUqBhQ0Hi1/ig7PGzf6FbFjSTx12z1sbwmg7yholYI=;
        b=IEO2iAVEQfy8SAHYX7/CXY/6N1SK9fH4rpRw3x0LVYev2jZLiwyQSkbXwVcCUEPOjm
         JHgYJRvvd0nHBABLmazvuNgwYtlXY9u/up7SRBEtUyMs4XYMP1iHr6VeSGTOrUsY+fLc
         3izuVtcKmBHGLy2PyasHiHYPEi5ko77VAWu5OHLcMvXg2hdmV7/BDaTZqyeFZGs6RHg/
         S+RY06xcsaFGsSHuHLx1VNXY3R/a4xykPh8sZ3EV15z5qa4XGO2vSjJwG6ak1RKOrFqk
         01tprY95Yg5wpLKKhlzq/zc+dr+q2++Vj51Dz2P6QZRb68UPcW6l8+R7zihOLbCXSPYb
         cEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=6BUqBhQ0Hi1/ig7PGzf6FbFjSTx12z1sbwmg7yholYI=;
        b=a627GhLFbpegaerSc6cI0XbSIvR70Ukzf5N6IwyUP7WpfqpnRqCQS9eJdhCO4GKkl2
         Cc8OyY/ZvcNWr1hXEXJgqtrWPe+gx49jmfF0R5W7C7ZTHAvgU0aNO7T0lVuH8JV/D+1M
         Gr0Ch3+bnvDSGNnzi0S2cw7HJqhvIP8kbfjY8LcipMbMmJ0+eX5SAFTcKZReS3Io/xFN
         PJQf0ai4nFxGiMOOWm/2eR/zbFQWsuwJ8waDEb3nmxclZvEOo/BQ2aSL//G4rVd2jxp0
         16FQTCfFZ6iqrmgae/X6USERqten1hj8lw6l21q3LZNXBtYqGLCKZ19n8myKda8KhQwq
         XDsg==
X-Gm-Message-State: AJIora+dbmgGXc6RJ/ViCSIOVImJ9k+r8yv2TEkTAO/LbFmLpf7bUhfs
        s0YIDoOQ3CVYQlyRNCT5UpoHhhJGDeDyVqmANRQ=
X-Google-Smtp-Source: AGRyM1uHj/iwFypHVo3ccT1Xw5dUG8glLAP4Kgg8u4WuV8WGX0g32Fqxxn1+bzh7YDAaU2ybOHZDvvF0uqM+BLnhewM=
X-Received: by 2002:a05:6638:4687:b0:332:1af5:b43c with SMTP id
 bq7-20020a056638468700b003321af5b43cmr11730690jab.289.1655674243818; Sun, 19
 Jun 2022 14:30:43 -0700 (PDT)
MIME-Version: 1.0
Sender: kaboreusman943@gmail.com
Received: by 2002:a4f:be10:0:0:0:0:0 with HTTP; Sun, 19 Jun 2022 14:30:43
 -0700 (PDT)
From:   MUSA AHMED <ma7304719@gmail.com>
Date:   Sun, 19 Jun 2022 23:30:43 +0200
X-Google-Sender-Auth: YbJheGoRx57tHi9xj_HnOJetQuQ
Message-ID: <CAL6vAAXviZ00Wp6fRa1pUC7G=kpVa-+zs-XcaDPeZ+ez6Gi5Ug@mail.gmail.com>
Subject: ATTENTION PLEASE
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,SUBJ_ATTENTION,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d41 listed in]
        [list.dnswl.org]
        *  3.5 BAYES_99 BODY: Bayes spam probability is 99 to 100%
        *      [score: 0.9980]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [kaboreusman943[at]gmail.com]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [kaboreusman943[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.5 SUBJ_ATTENTION ATTENTION in Subject
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings,

I am Mr. Musa Ahmed, a banker by profession from Burkina Faso. I have
a very confidential business proposition involving transfer of $
18,500,000.00 United State Dollars that will be of great benefit to
both of us. Contact me via my private email below for more details.

Email: ma7304719@gmail.com

Best Regards
Musa Ahmed.
