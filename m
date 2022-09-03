Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A79375ABC4A
	for <lists+linux-input@lfdr.de>; Sat,  3 Sep 2022 04:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231620AbiICCRp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 2 Sep 2022 22:17:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231601AbiICCRn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 2 Sep 2022 22:17:43 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93A57E86B4
        for <linux-input@vger.kernel.org>; Fri,  2 Sep 2022 19:17:42 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id z9-20020a17090a468900b001ffff693b27so2318418pjf.2
        for <linux-input@vger.kernel.org>; Fri, 02 Sep 2022 19:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=WePtaXYh69nd3Zupc010DRjI2O8jfSpkjQDnfcMqCKpT6EM6IJDZ09CEYC8S1QMHl/
         73w6OgZ+UX+ze+QSHsg1OVBooQviwwFGcY8sRXUnVX6ds1QmRTu9ead8VHH40WBXYSXr
         jyk8fAwVrZu4tmSJnSLHQQHLWlXhHMyAKFdkaJqy6tHhUOaBUC8wwYxjNAzoi7jv8nTm
         i8TS3CANicZzUTkpQu6wVk2gVNlZGQlfQahB+TMjcv9LBg0dbsGJxkxxuJasZd23h/oF
         miDunD+hYC6/ToTl0PERevHu1zGAqBBL9cYNMOw7zp9Xu2llaSsK4kUIxFpGpzBnCI3y
         2jzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=uN37DmScyubB32dDcocu0PwOHet8rJOwEb0qRD2DCg57bT6K+1BBLHFNdvJ0FQ83mT
         Sq9fafXIrmXbGN/skmO2mDDS9sZyklzDp9MCUHTsf7kYnC/XkO8q3K7Xo+VoVN8CBD6U
         wm1GE5ZxTq9U14HazPvbx1w2rhcL20TmlCc3Ku8Q4rdY/Zj0eG/Y5LlK497EskIpd8Hg
         mpqEdarY7NfcFBSlYStEV4753vYiKE2Aa7oDrOrKvlhd0KqBEE1Z5CXEt/oonhWpetTQ
         Lm9+3SbqG1j3p1nMoIg87VWvK0Ml8N3XFFq9x17wVhOgEfvfRahp1Eux9/crN22rAN9q
         VXwg==
X-Gm-Message-State: ACgBeo1zxWK2sCBWy41Qw/SOU5UyaRw6bG5gcuiEM1BkR6XVxiywVnrH
        ZCxa3ZUWGYkOooSR88KHbeFtckGWyOLW4NMmxXgReX/D
X-Google-Smtp-Source: AA6agR6xkP2hAxCwR0vt/3r/jZnKGQc18UXwsSC7OLe0uSnWU3SojaFuLcwqF8S60gLgvKU23wuKZTk+o+yj+afuzsU=
X-Received: by 2002:a17:90b:1d04:b0:200:53f:890d with SMTP id
 on4-20020a17090b1d0400b00200053f890dmr3296570pjb.38.1662171461665; Fri, 02
 Sep 2022 19:17:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:689e:b0:44:71c6:41bc with HTTP; Fri, 2 Sep 2022
 19:17:41 -0700 (PDT)
Reply-To: maryalbert00045@gmail.com
From:   Mary Albert <tinnaevan26@gmail.com>
Date:   Sat, 3 Sep 2022 03:17:41 +0100
Message-ID: <CALa62PrSGw9HA8iHgPdeczxxPBs4jv4i5aBgvszZGS46QL+4Uw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1032 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tinnaevan26[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [maryalbert00045[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tinnaevan26[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
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
