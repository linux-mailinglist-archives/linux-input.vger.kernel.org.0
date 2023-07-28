Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 792DB766703
	for <lists+linux-input@lfdr.de>; Fri, 28 Jul 2023 10:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233462AbjG1IZm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 28 Jul 2023 04:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234964AbjG1IYw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 28 Jul 2023 04:24:52 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC344C00
        for <linux-input@vger.kernel.org>; Fri, 28 Jul 2023 01:23:41 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-44096f01658so716888137.0
        for <linux-input@vger.kernel.org>; Fri, 28 Jul 2023 01:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690532620; x=1691137420;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VITdmtGLQLGT4fU+DRADhN9JhICIDjdOtOp+++31gds=;
        b=LORxXc68KB4tEibFVmg9W0YfTHb+2Gs6GJt+KP0RhvLKYdR/8SbMJJodiQQhK+L07E
         gDCM2D1wnc0+62dFrcwykubsx7ycbvfRwB6xE3zYyuBeVln5OxQMAKPM5zG2reAmHiIm
         NTnSfEI2LqGnzI1doMeNsavDKh+RkE7eobt5MJlWlVW9j2P+lRbpUUVShT+q2NHsKaSD
         ABZyv8PZYGHdCk/Apj2Eslnh+D3QDwJgj2m+TcU0G7wSujmqcO+vGkgE+Vc+K3GnPE77
         2AwQ6bjlkHxKq4LloKH5wvF3+q/qtc8ftc7XG5ASuNJiZSzOXSpLsXNJHAAK88DhA21L
         C+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690532620; x=1691137420;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VITdmtGLQLGT4fU+DRADhN9JhICIDjdOtOp+++31gds=;
        b=EF+ZUxyDS2khpb87DKwaAQVxqv0mvkRb0EmRyg8RshWoPpmZESmqJVfvGlZiejTCo/
         E8HlUw2gGT8IXz2rUt3YyEwPScw3mIyrB/hTOmTciKuMqq5mwPbmgPXjZ0/bLQheFSuy
         D0+Cn5VX57g18Egd8swgx/2aDfXElWxGlgGZtY4JAlvyrtuEG1zcYsmczQk/wDhLc97W
         FEGczLqV5bpM123VOzim2/3Pquc5xMEpEA23nJchEj0pFO5Al7Lh33kCh+1Xd8m7td87
         53sx0bCAckljv38Ka5hXSwphQ3zclIdQPjgqY7isGnMFwKV2oBtooJMaoJqPU+uCnnBV
         Ti6g==
X-Gm-Message-State: ABy/qLaXD89jiiMW7hWL+OG2PQLS4AuZklJfaiAmYX+pLd3V9QT+aG5C
        ZXIRZdE7lBD1pvbQBo1IEF0yh9mVGvrZZRFK2aA=
X-Google-Smtp-Source: APBJJlHsa0ncbrhZyTOkqk9jroMNZLagoKo/f/WRmKrxBdiuIN67/R9SCcaBfaMpYpTRTBz7gcgnGpHRcjF/w8T2uJk=
X-Received: by 2002:a67:fbd0:0:b0:447:4e20:d2da with SMTP id
 o16-20020a67fbd0000000b004474e20d2damr1363499vsr.7.1690532620069; Fri, 28 Jul
 2023 01:23:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:d6b0:0:b0:3f1:5382:4ef1 with HTTP; Fri, 28 Jul 2023
 01:23:39 -0700 (PDT)
Reply-To: laurabeckwith001@gmail.com
From:   laura beckwith <jonnyangus51@gmail.com>
Date:   Fri, 28 Jul 2023 12:23:39 +0400
Message-ID: <CAEQMgS0kUgPtUae97hm13DKUtny+=iUkg+zjX1c9V3r9GkXCzw@mail.gmail.com>
Subject: hi
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5133]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2f listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jonnyangus51[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [laurabeckwith001[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jonnyangus51[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hi,
I am Mrs. Laura Beckwith, I have decided to donate what I have to you,
motherless babies, Less privileged and widows, because I am dying and
diagnosed with cancer about 2 years ago. I have been touched by God
Almighty to donate all I have to you for the good work of God almighty. I
have asked almighty God to forgive me and I believe he has because he is a
merciful God. May the good God bless you abundantly, and please use the
funds judiciously for charitable projects, motherless babies, Less
privileged and widows. I came to this decision to reach out to you because
I have limited time on this earth. I don't know you but I have been
directed to do this by God almighty. If you are interested in carrying out
this task, get back to me.
Reply at: laurabeckwith001@gmail.com
Yours Faithfully,
Mrs. Laura Beckwith
