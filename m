Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E3176C311B
	for <lists+linux-input@lfdr.de>; Tue, 21 Mar 2023 13:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbjCUMAi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Mar 2023 08:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjCUMAf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Mar 2023 08:00:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6645C164
        for <linux-input@vger.kernel.org>; Tue, 21 Mar 2023 05:00:32 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id k37so5831438lfv.0
        for <linux-input@vger.kernel.org>; Tue, 21 Mar 2023 05:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679400031;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYqkAHx4YZlodAh/pQZnASbt6AOErr4tdDt3mzzR2k4=;
        b=fzeZffgE6w2xT0ii7BpbViHWr49SpapFsHfTcK8FEzqoNy0Dja4F2wCj6OaFkp1wOA
         lwF6txZV3qTqglIr3Wgp4gU2vUjkHi5uT4d3obbkVoUXbHkV3GYt4yW9YezvZaQ5Popn
         xxDv1hahieSDsE9DCTM6nR4FISQ1S6umZf/PA8mOTAWhGlQpmW7HTYUIAwVgSmRAtHsW
         hddbHWdW+3cvMHbVBrA8Vx47YmEiOgrDBqzGN/k7/qIeAvzzSEc25kQXnRvA5aWHi3QF
         F7u60HaDuIbnObs7TGpTQtLH8DGoHtlicS6+hLqQdhtNF1QQySFrq7ALPJGdTRPeYHZX
         f9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679400031;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYqkAHx4YZlodAh/pQZnASbt6AOErr4tdDt3mzzR2k4=;
        b=58DQ5QCXb9CVrLcqArOTHRw8H5nxgaL6WVonyFrt6Aqi4BIqNnmsJcZN1r1NQoqICg
         VphmGZbfmiCcGrAx/p3G1xG/54p8VzCuKsTCXs12CnNBIOB7CGmtzYs/oFHQdhsZ2QPy
         jmIbRWDBTHKYLMKHw2TBxBJ3wdq7c4s0vW28Xx6rgz8dbK75+PmrCgZ2L+aYPhQr6kTQ
         NGQyHvRpzWIJhBtQ/EA2JdZpNa7yrTK939UA84/Z3jMnjFDJm3K5oYQJS1LYY37MwY8p
         KHRJMnxQUTjns03pLIHCAcT/5Be+NrTr3g10wbDMcVpyvmUZH35DUMuZj38gRUHYHe6g
         GpFg==
X-Gm-Message-State: AO0yUKWkN/lhhrXnD+f2cdoN0HNn+toBSUxgFkei22EsvV06hBhdC3BQ
        4LsFhJoCfSt/c2VnZNEDvRxUhC/OyvR0mv14ATw=
X-Google-Smtp-Source: AK7set989zqmxGLmv885FuzaL1sDIAv0bghJtrVFtBKnvfgszdrS2ZT9qW/oPFS8GgDtqds3ofXJfljhUmiT53ay3yA=
X-Received: by 2002:ac2:430f:0:b0:4db:1999:67a3 with SMTP id
 l15-20020ac2430f000000b004db199967a3mr699214lfh.13.1679400030845; Tue, 21 Mar
 2023 05:00:30 -0700 (PDT)
MIME-Version: 1.0
Sender: mrsmelanimuhammadahmed@gmail.com
Received: by 2002:ab3:5093:0:b0:224:2f72:9416 with HTTP; Tue, 21 Mar 2023
 05:00:30 -0700 (PDT)
From:   Melani Wormer <melaniwormer@gmail.com>
Date:   Tue, 21 Mar 2023 12:00:30 +0000
X-Google-Sender-Auth: bsW_oVXHP2oWnJSgJdBP3fnrXGM
Message-ID: <CAPVEHpWOLAnqvwz4ex5C7yBPJ0NhH7QPKBOOywSPDS8c_X9JDA@mail.gmail.com>
Subject: Re Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.3 required=5.0 tests=BAYES_99,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Honey, how are you? Are you capable for investment in your country?  i
need a serious investment project with a good background, kindly
connect me to discuss details immediately. i will appreciate you to
contact me on this email address Thanks and awaiting your quick
response yours Melani,
