Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97581580036
	for <lists+linux-input@lfdr.de>; Mon, 25 Jul 2022 15:52:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235142AbiGYNwq (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Jul 2022 09:52:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbiGYNwq (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Jul 2022 09:52:46 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B65C15A3D
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 06:52:43 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id p8so10420947plq.13
        for <linux-input@vger.kernel.org>; Mon, 25 Jul 2022 06:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=t+pQa5dRvfaXNuusnmsa3SIVfyR2GaEPDHqht+u9DDE=;
        b=pD1Ibm2SywAsfawFrMeb5vfKjVhMzGWk/OYsaTegH3Z3LeITefVtgnVVpddjUavWrt
         XLjHgFC8Hn0UCgf9bOZDCtTfrFW6nIALAS5FLb0Au6vO+gTbakg0v+SzdGKuPSY3HCzU
         q+bNoG5Lx2gj4Dl3ISLst9l8JazGxK07C3YcvuTxBlhZJw2zUIwRknS1PrZKa7hY3hmg
         tu8dHFxj9iMuC65K3RPjovTN3kU6nwS5M5G9o16Z6fwgX2LXd9prsblT/79K9uQDrgui
         wIeZMnihlshnyp3LxCYVTe1HAfvsrWy1BXtM9oC9xX5w+VoVH/+MV79thHr8896qZShB
         S9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=t+pQa5dRvfaXNuusnmsa3SIVfyR2GaEPDHqht+u9DDE=;
        b=h0FM0KwP/9WacAOykX4NjgMVXhkX6iybtJxCOzFZQ4SNaIvqPo7ttk5EgqMMMaY8fs
         OGKW5Xo8W2XVCgUM39xkb3sA+MP+Tv4WMKnvbvJ6mlIv5gstTBuWA3qsaW+lyF2iUWJJ
         MYo10VyM3qb0RDSJ6B4HjcPii45fcKW02fzFIdyQ1RvFarTJv9eZo+rAp5azmVIt/M1R
         VzBNco63mqKwFTED9BYkvXk9vYbSPm8aoiLZOaRisx/nszS0Aw5z+ouLp/KvrCAijast
         CylEgLE53KcPkHnZ7dmMqE1TQT9XNKK/ALkv7TGX/r3NxUeSLzJ2yXIUOibxCkdl0ooZ
         EBCw==
X-Gm-Message-State: AJIora/0ObqoOErBceILgTzcOBkdxCXBxdmmFB3BJdzIRXN47HXJPTNR
        MxEgAuZI5LckP2dZPKTo/WcxjKAYLNbvEd/750w=
X-Google-Smtp-Source: AGRyM1sQJ5omaUTPG45xYAEYjzNB4SNvA6riGNleCuzxfo16xSvwR1Rdmhx/SuYMgDeTyxesekjDSc3VpuyMh5beAx8=
X-Received: by 2002:a17:90a:a40a:b0:1f2:979:397d with SMTP id
 y10-20020a17090aa40a00b001f20979397dmr14179175pjp.179.1658757162108; Mon, 25
 Jul 2022 06:52:42 -0700 (PDT)
MIME-Version: 1.0
Sender: nazeerhabeeb23@gmail.com
Received: by 2002:a05:6a20:b907:b0:8b:3a65:792a with HTTP; Mon, 25 Jul 2022
 06:52:41 -0700 (PDT)
From:   Mimi Hassan <mimihassan971@gmail.com>
Date:   Mon, 25 Jul 2022 14:52:41 +0100
X-Google-Sender-Auth: cy59h9keygFpRZUzHfT3iYVvF4E
Message-ID: <CAELEEMg8vj1F40yqxtWShBip2Tc1sT=uzrr8O5M6yVp3pifKoA@mail.gmail.com>
Subject: Good day.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

i am Mrs Mimi Hassan Abdul Muhammad and i was diagnosed with cancer
about 2 years
ago,before i go for a surgery  i  have to do this by helping the
Less-privileged,so If you are interested to use the sum of
US17.3Million)to help them kindly get back to me for more information.
Warm Regards,
Mrs Mimi Hassan Abdul Muhammad
