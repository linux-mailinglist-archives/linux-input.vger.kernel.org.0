Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 822BA56421C
	for <lists+linux-input@lfdr.de>; Sat,  2 Jul 2022 20:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232257AbiGBSf6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Jul 2022 14:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230473AbiGBSf5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Jul 2022 14:35:57 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8EFDF76
        for <linux-input@vger.kernel.org>; Sat,  2 Jul 2022 11:35:56 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id i11so4245583qtr.4
        for <linux-input@vger.kernel.org>; Sat, 02 Jul 2022 11:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=c0efiEkVxtTkTFENAKnUNGf6D7Eoa+H/DnhrKy6xKHg=;
        b=dy7RiF5WSA4xMhK4EH3Q7wGpFRdYM0GWxdexLnFl0Xme8q4JQSLFs2FGW3QaWXvChW
         TrbRrkdpCiXQm2WtTmKwO1If6K//JGUlo549IPGiOpQ+SbFtCjD7Svbr3K3kkmp3qklq
         mv6Fx+HtJM34P0wvKSkl/9fZbiEWgrvC6iSgdxrXGuvXN3BMPtcjnRMBE//QiFcbGGwj
         ofZzg5EgnGe1mYzWwbpustB0ZUAgJl3rviITzgq/fi2nLidYVXPDTyFmUIIHhBPa29I9
         e8cHgjzBzixrobc1Tov3kSsKizS3ul3K3ww6SPrlOg+0sHEKKc0EE31zWk8eUvhe+tUM
         MWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=c0efiEkVxtTkTFENAKnUNGf6D7Eoa+H/DnhrKy6xKHg=;
        b=BUz+A+eHnZU8FEm5qI262RYkA7n5z0nzsTDinnlCAK6k4KoXCopmeeZvaC8XhKLh43
         of6hW3UKyBjtYo9rgeimHllLr/QLLdZrIX/NSVgQxiRFwObgNZ5JLQS1TLpjinmekL7g
         ieUkqBmDAc2xUCrNEjGasa1RNrshnX+y2Z8GoQmIlO2IsmNa9W9Zxjba0fQItO8mIIM4
         jmMEIiBjgk20LkTdIrWUo4uz1aJ5GnshJWTDOqpMpsOVMypyEtSw67kQyCuVXczLhEEa
         pn9RBd4pgw2ZsPzeadzM/FLEuD2AqshWU+hfZOvyaNPckSlvKCal63nWtqaURgeldMcq
         Bpag==
X-Gm-Message-State: AJIora9afBhWdcrJda3vrGBqkUztON/SXi+DQL5MDNXMWOwV8Ob/Df8d
        2Tf9f++PsOviOw0c+rRagmkK5y9JtZjebwNLuGU=
X-Google-Smtp-Source: AGRyM1tuUrO1s9mVkcZsenvEuqkKIx4rr8fY6nhnqcIatYXLFQNbNljia6due1pNmoQixIYJ1e4e9S6H1lWufptlctk=
X-Received: by 2002:ac8:7d52:0:b0:319:51f0:e418 with SMTP id
 h18-20020ac87d52000000b0031951f0e418mr18068008qtb.481.1656786955313; Sat, 02
 Jul 2022 11:35:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6214:2464:0:0:0:0 with HTTP; Sat, 2 Jul 2022 11:35:54
 -0700 (PDT)
Reply-To: anwarialima4@gmail.com
From:   Alima Anwari <shellymarkevka81@gmail.com>
Date:   Sat, 2 Jul 2022 18:35:54 +0000
Message-ID: <CAJLhD936Vvh5BhiBEF5+Lj41xe_o4E=8=iiStvK0LWprE8-8PQ@mail.gmail.com>
Subject: Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello dear friend, i'm Alima Anwari from Afghanistan, please reply
back to me and have an urgent issue to share with you. I will be waiting
for your response.
Thanks.
Alima.
