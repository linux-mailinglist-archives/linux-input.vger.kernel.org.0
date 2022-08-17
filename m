Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1C5C596DCD
	for <lists+linux-input@lfdr.de>; Wed, 17 Aug 2022 13:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbiHQLts (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Aug 2022 07:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbiHQLtr (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Aug 2022 07:49:47 -0400
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com [IPv6:2607:f8b0:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70D6D3DF00
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 04:49:46 -0700 (PDT)
Received: by mail-ot1-x341.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so9222774otq.11
        for <linux-input@vger.kernel.org>; Wed, 17 Aug 2022 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc;
        bh=HLXj0x8HovTF/cnerD+PMjeFOlbLDoAJrQzpeYLDT0s=;
        b=qjSpXEqEMB7ARyFoKlhBWGU+gvKOBqVyVaSlOov9ExoqA3cGSuGxGeNCqoH/pkpXE1
         aWB0/sP6rhOI2klPxz9a/uSsl4vBfzBJRtR6wiIwQ2ks80MHmnaHR2WeZPEjywvXOVzq
         ygvYW07cMSw+T2jnMFiRFN0JFFsK0R7p2ACMeUg0h3QifS9/SPjt6cLgzjZWROZP7ILh
         zDIq0Q/ZR53TTZc+VSYDvX7CVK1ZcAfXN2YqUmn52Zk13WTcu54bY7U04NJmU14xQs+U
         qhT74LT/CjSTrm+B5mKo6PgCy6YSmHo/+yHLXsPGyBJtiMk0Ct4KIwpcLU/IyOuFgCqb
         zzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc;
        bh=HLXj0x8HovTF/cnerD+PMjeFOlbLDoAJrQzpeYLDT0s=;
        b=hll8P9bxBJ1w+b6kt5KWcd/BVc111tJ7w3CbKHFWpAhiXxKH2UW6K8xZelwBicFcyC
         MqBT/kTyZ+xqhDbZxvfHL82Sv3+Osz9DcIdcQ8SUE7HX21yudW+CC5wiBnTKQ7vS7m3b
         1GKL2VfCIDxSqE45n83aJnSBYD5IcKUeJ9gETYkU/R4frzCwqLXd2f6SgYFwgciZR2+Q
         /NRrXkjAM7twwYibrzOpCLfdreXjegDmBpWrXF1V5Hirif4E7EyNOMvayWsCIZCvEyfp
         lmYza3r10wVJUmkFA7/4s4YX7Bwy7t6J1wtIV9PftnGN7N0llNXJ4oQFsuCELyHjIzL8
         g2jA==
X-Gm-Message-State: ACgBeo1lMjQNbdpG4voJkra0tdKPDvwPB9up4fEpDGM9v73bUwrPpIb8
        I4fBicNKrTWgewmGDzoNX9ilf7Un+pXHLvPJA64=
X-Google-Smtp-Source: AA6agR4UATmcQ8+zEnbhtSL7sbFKoH+DEV8MVzqLsULMLgKWaGc9AK0sMHwKX6KNnf15TCokCs2uJ6a99e0xTsvdanc=
X-Received: by 2002:a9d:7a55:0:b0:637:1874:a2cb with SMTP id
 z21-20020a9d7a55000000b006371874a2cbmr9189553otm.318.1660736985726; Wed, 17
 Aug 2022 04:49:45 -0700 (PDT)
MIME-Version: 1.0
Sender: mattwesst445@gmail.com
Received: by 2002:a05:6358:1207:b0:b3:6c3d:426 with HTTP; Wed, 17 Aug 2022
 04:49:45 -0700 (PDT)
From:   Ibrahim idewu <ibrahimidewu4@gmail.com>
Date:   Wed, 17 Aug 2022 12:49:45 +0100
X-Google-Sender-Auth: 22-pnr6NgnWIe4Es_6WGwa1OMC8
Message-ID: <CAEg6tVdnD3QGGQB1Yguc03x4Z3_cKxfL89CV6gHNN0NWGKAaeg@mail.gmail.com>
Subject: GREETINGS
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.1 required=5.0 tests=ADVANCE_FEE_5_NEW_FRM_MNY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FILL_THIS_FORM,FILL_THIS_FORM_LONG,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,HK_SCAM,LOTS_OF_MONEY,MONEY_FORM,MONEY_FRAUD_5,
        NA_DOLLARS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_MONEY_PERCENT,
        T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:341 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mattwesst445[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ibrahimidewu4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  1.5 NA_DOLLARS BODY: Talks about a million North American dollars
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 HK_SCAM No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  2.0 FILL_THIS_FORM_LONG Fill in a form with personal information
        *  0.0 MONEY_FORM Lots of money if you fill out a form
        *  0.0 ADVANCE_FEE_5_NEW_FRM_MNY Advance Fee fraud form and lots of
        *      money
        *  1.8 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HELLO Greetings,

My name is Mr. Ibrahim Idewu, I work in the bank here in Burkina faso.
I got your contact
from internet search i hope that you will not expose or betray this
trust and confident that am about to entrust in you for the benefit of
our both families.

I discovered an abandoned fund here in our bank belonging to a dead
businessman who lost his life and entire family in a motor accident,
I am in need of your help as a foreigner to present you as the next of
kin and to transfer the
sum of $19.3 million U.S dollars (nineteen. Three million U.S dollars) into your
account risk is completely %100 free.

Please I will like you to keep
this proposal as top secret and Also note that you will have 40% of
this fund, while 60% will be for me.if you agree to this
transaction and business with me give me your interest by sending your
information as below.

1. Your Full Name.....................
2. Your Address......................
3. Your Country of Origin.............
4. Your Age..........................
5. Your ID card copy and telephone number for easy communication...............

Best regards,
Mr.Ibrahim Idewu.
