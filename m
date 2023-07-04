Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05824746E03
	for <lists+linux-input@lfdr.de>; Tue,  4 Jul 2023 11:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjGDJyJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 4 Jul 2023 05:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbjGDJyI (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 4 Jul 2023 05:54:08 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8762ECA
        for <linux-input@vger.kernel.org>; Tue,  4 Jul 2023 02:54:07 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id 3f1490d57ef6-c5079a9f1c8so2673166276.0
        for <linux-input@vger.kernel.org>; Tue, 04 Jul 2023 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688464446; x=1691056446;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiXvt3bsk19S5qn9hcg8X6+Vn3nKzW539A/bOKu0/g8=;
        b=S9oNCZAaIr0Ef+jL9Q8Ex5PpkSlR71eyHLZmVVyFj1etDI8JPKYnekdlGQorlGkow7
         Ube8OSQeQ7VPmQJvnRDdjlBcoBCeS+z8fheoTOgkh5avXpJB4nai15SyHrRJvtb8o2ys
         NJ5ETjDML47CdBED++K8sZ3RN2dZqXU2zB7LW4h+/1NJUyIn96lix7TxB7nzemdahiGQ
         6vAg1kUDi0FiP9FVyPdHKdwXTWEtjxjX/hK5acip2ZrSW8Hh7AG/EC0RI90rWCgk9Y+C
         2BE16mf2y0Tk9xnR4hJULTnRda0gpB27Ecf1IJEF2l97UupwteCtX77nUeHN49OyJICA
         mD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688464446; x=1691056446;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OiXvt3bsk19S5qn9hcg8X6+Vn3nKzW539A/bOKu0/g8=;
        b=AU2hQl7MDbxsF/vKoEmNsERoV5gTs2bja6AY8KcLACIMD3ZjIQUMxOfSeVxfuVGOgY
         ri+kDOKvzrwn60BWFhPMyf8fT7XvUhwAv9QD9eDwf1RXx0okuW8hIPx2JHmU6turik62
         sbxshys899nhV1DOS2ZnybcV5l3vNHncz6tAfRF/qq7G5/XJKLA70uSZrLXh6jhSFXck
         yJMvSffFjKtmi0IirG1zGcKHUxR1QacRQQEJfn5k/Bl3HVcZ9JEDISwcy4Dtd8MMWbxe
         WugwBKSf+6C65cjn7usRR4IsnnZFymJPCgBcj/vlpMyTAlQWHfft2csA9gGCqw09Bovr
         EinQ==
X-Gm-Message-State: ABy/qLZwBFesGA6cdjuw9e6TNjzoQJEQhNLtHCDNxH3hbOPZwgnS2lCQ
        pVa6H5a0eL04ScvD/bLTk/0F0twHt6lUwSarmT4=
X-Google-Smtp-Source: APBJJlFoyOt8Jh7LmeX/BdIMiBuI5ARueN3gq5ShaWMbbJ0jz89ax4f3AgZVcQKQkcoMhVahxLKgGwW/sSJuOPst+5U=
X-Received: by 2002:a25:2d23:0:b0:c5d:35fe:cded with SMTP id
 t35-20020a252d23000000b00c5d35fecdedmr1110957ybt.36.1688464446704; Tue, 04
 Jul 2023 02:54:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:ac1f:b0:36a:dce1:7fb2 with HTTP; Tue, 4 Jul 2023
 02:54:06 -0700 (PDT)
Reply-To: joebabm@hotmail.com
From:   Joel baba <jolebabah@gmail.com>
Date:   Tue, 4 Jul 2023 09:54:06 +0000
Message-ID: <CAOZ8G_OpNcXxzh1jJjz64zdvkBL370rkkM2rwJaTDT+stPkKNQ@mail.gmail.com>
Subject: I wait your answer.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.5 required=5.0 tests=ADVANCE_FEE_4_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b41 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [jolebabah[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 ADVANCE_FEE_4_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings to you.

 It is with a great pleasure for me to use this opportunity to solicit
your assistance in proposing an urgent transaction with mutual benefit
that required maximum confidence.

Please you should not entertain any atom of fear as all required
arrangements have been made for the transfer and i will not fail to
bring to your notice that this transaction is hitch free so i want to
know your stand in this proposal so that i can send the details of the
business to you immediately.

I am awaiting for your immediate response as you receive this mail.

Yours Sincerely,

Joel Baba.
