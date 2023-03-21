Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7C06C382C
	for <lists+linux-input@lfdr.de>; Tue, 21 Mar 2023 18:28:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjCUR2l (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 21 Mar 2023 13:28:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjCUR2k (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 21 Mar 2023 13:28:40 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69DF3FF31
        for <linux-input@vger.kernel.org>; Tue, 21 Mar 2023 10:28:39 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 20so9175397lju.0
        for <linux-input@vger.kernel.org>; Tue, 21 Mar 2023 10:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679419717;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=XOV/krzLQW7ragMjdUdTOcCLYMVa4l9EwdH3JPyYEOj5d+rC46d40hUDn9e8ehILWi
         EnlcW65notnq4aDGGr1lXNLvyBoL2g+rEhKsMQg+0J8mCOjN0QxftpV0EKKPrFS3O5SP
         1NysIZR+a/XhMZZ5MsPpYlvBx65I6OfDmAi4bIy9lV0LXGxsIFFI/Q3vbaMo7HfSrfGT
         TVhAnuX1XHe1ZnuIMIKk45ip6VDtZXDDqV3FZQ7Pp1KVuUZgshK8tqT+Wgv74RF4DHv3
         bXxd6OXLLJFA0lZicn1yc9kqsGRrf10i3lAdunDOkhJg9/CrqQCKSBzOw6PxtB5wqZ5G
         m/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419717;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=i4nINEpUntgv/KGyrD1SIcP1Z7jHHNh6l0ZQ6UQ0dz22E9mxpNbRehpiUvnrgemjMG
         CUstwPuQPGq5mZS01B+jLpPqvx+/cJ9MwcZcvMnX3otiwfFgw8sPA4D4JU+GuYoC7ert
         7aYq+sQdEa86/SeH7/0FyNBbgLaCJO0YfVsQliEZio016u5lXZtlxDn8KdzyNZVUtnic
         FfL96D9aG4vTAh5p4cPhiE6gWeZuAxk+Vcmzt+x9cJUCXIwfPCW7cQRe0G/LjqIqdOUf
         UffJdS/TRhPfMUe6FMtippTB0QvKMBUWO9SpIJeXhU2F4GkblZtgZg1Jbm+0u9ZgMbxt
         SI+g==
X-Gm-Message-State: AO0yUKVXGWY8GCuIG/7jGNEZ8CmPPv+QeOh2l4qqjdQ7mPJclLzQt1uH
        EHcB0tto/BUFEbgfAUvh6H4fUeA/GzkhTFMC3MU=
X-Google-Smtp-Source: AK7set+njoCcmF70xO9qsj5N2IGguzER7F1k46a0KQDRC9dII7NBYkdWKCCJ6HOYrXCLb8sGuj6mRQ2lNC3kQ2bHXCE=
X-Received: by 2002:a2e:8703:0:b0:29a:9053:ed1b with SMTP id
 m3-20020a2e8703000000b0029a9053ed1bmr1135933lji.3.1679419717390; Tue, 21 Mar
 2023 10:28:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:440a:b0:24d:cf61:2e9f with HTTP; Tue, 21 Mar 2023
 10:28:36 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <harrykuunda@gmail.com>
Date:   Tue, 21 Mar 2023 10:28:36 -0700
Message-ID: <CAKN7XSW5YTvU7pAfxsFybcXixk+A7ih=Pwm_ny0MXLR2zYFEQQ@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [harrykuunda[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
