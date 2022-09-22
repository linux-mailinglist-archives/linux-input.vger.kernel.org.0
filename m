Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424395E57A7
	for <lists+linux-input@lfdr.de>; Thu, 22 Sep 2022 02:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229686AbiIVAv6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 21 Sep 2022 20:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbiIVAv5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 21 Sep 2022 20:51:57 -0400
Received: from mail-yw1-x1142.google.com (mail-yw1-x1142.google.com [IPv6:2607:f8b0:4864:20::1142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901E9A9C30
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 17:51:43 -0700 (PDT)
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-3450a7358baso82578327b3.13
        for <linux-input@vger.kernel.org>; Wed, 21 Sep 2022 17:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=NvDgsagZNW3zfULce+zmDb55fNgNrl3XWYUsK4Si9wADLmWMo8274LPh0wo3qM1bHG
         ehgaBzsT+RiJw14i5kAanjHHRHW/Q3JaSHjZh0rLbqYf5Pz4W/sAaTyI8VLvzNQiP5kN
         5WchGyhMJdgAyQGeh3dBMPzLuqWq2JzuULLyORLq9gDWqk5uKsVIYYWQyUx87a/EVdHO
         dT9+rwzDGf/cUAqqTzcd7UPHlhqG2zAh/WlFu8WK3CsIWBeP9Y83czo2+Gghl1pbWXMV
         Fei9FVM+buUJioGEFlyV5H0XYASZdpJa7bz4E2Lb35Q3k3oTdz9CCcX2nBsIHIZcGH1K
         dRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=H6hMYukiiAXuy+Mhjoqws03HY4WkbJzXmuln1ynHYkc7x+pr4d5XkjvNbIt9VbrrL7
         owXIIQTf2FnAQuvVv9KUL1ol1T9uUPPD+Zwz/bYafuAgNsZV069NJd6HwkpWob9nLZc4
         OG6rVrfzoJ+U6w5XZhRecO360FKI5DfN9EgNEpnoYjwWWP3C8E9whKY8Xk5Hgz+y99NF
         qCoVd37qKLI2/19ZI/CPTNrWnFdI8UKcDeRN267VaT1NA6VQqdmSPzhjpe99O15jtAdv
         wl24shK3bpXydINoniVw3VCSk5AekyVmbPoc6XntW5N8O73igg8bLbPSKXO1R2/T+O1s
         BEdQ==
X-Gm-Message-State: ACrzQf10q+7iCsz0apEBuPpg2T7BGAFF8CmWAMsGP0jPLb6Fje8kv57+
        FfFTvrvl27RKOkVBlmrNQo/zN5aeUfYNZlf5UDw=
X-Google-Smtp-Source: AMsMyM7gae0yy1QwIs9oKD4dKSmWV3Wnk+XiijfE92FX5EebKNBNH3K7mHe5OfaZ+Llfx2wOKZSzh3wXII4+mm3Vs2k=
X-Received: by 2002:a81:6ed4:0:b0:345:2c35:a203 with SMTP id
 j203-20020a816ed4000000b003452c35a203mr930050ywc.262.1663807902741; Wed, 21
 Sep 2022 17:51:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7108:37d5:0:0:0:0 with HTTP; Wed, 21 Sep 2022 17:51:42
 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <edithbrown063@gmail.com>
Date:   Thu, 22 Sep 2022 01:51:42 +0100
Message-ID: <CAH1TjD==qZkGVM4NWdC7a0TcQZU6rp85aXSDF+8DbYJxis6NgQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1142 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edithbrown063[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [linadavid0089[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edithbrown063[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
how are you?
