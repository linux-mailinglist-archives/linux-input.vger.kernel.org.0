Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C614D61954D
	for <lists+linux-input@lfdr.de>; Fri,  4 Nov 2022 12:22:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiKDLWo (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 4 Nov 2022 07:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiKDLWn (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 4 Nov 2022 07:22:43 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7793463BD
        for <linux-input@vger.kernel.org>; Fri,  4 Nov 2022 04:22:42 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id c1so5357996lfi.7
        for <linux-input@vger.kernel.org>; Fri, 04 Nov 2022 04:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pEEgckt3pT0PMiaPMdNrpcxLQzxmcoGV7tcboMrPWh0=;
        b=hU5b6OLqUTm3c4dd9STjzGPDQ9FvA0Wm+6x8sV21TttQ9863wCpVDjwR0kWM3nK6tt
         m+rc6wjKjFatkL1emo3isv+zgUU4fUJJUFiFkaZDa8dyvAcPa21CAhlN+TFeqeOsUViS
         8ytCLUYQMERo7DBROuVpK0g4wf51dzNIM/LCiJ0Z5f8u9+kG/Ng5zeRigXyDArh/1lJF
         TReffptU04IEbBLT8EgEQNNkROWg6X5vvJn9GxRdM2Hb+iE2J4w0NFNUbWF21UgDO70U
         af+VNbOLaWTQgWcE/X2Aq4c1aSOZAPjbNLuUUTU9uUnaWAH3A/Tq9r1D+Zn25pGSxwcU
         8y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pEEgckt3pT0PMiaPMdNrpcxLQzxmcoGV7tcboMrPWh0=;
        b=gLXFGZe7tvNUG0TJZBwe8X4qj2iVRTdDKO2qF8NjtzPAUvmJgk8r20UBqFUKrBQQqH
         GL9oyGF7jNGBp2IaG6PZXjCa09XIpeVq5nQ8Gxw0XJ0eYLS8FUoxI8tEm/QdIsmj21LX
         7LzJ2VEQctZ6q9jwgACulf/NUJQyPct1vEAa8Y1xZFduGMbrlSghh18kNLji7WpD8muN
         GOBaNsXfeoAeBYXdUX6ZaSK7W1pDRSnsUPZ7XqfC2nD+N/h+3vUyOPBw3WQMzgKTW7xN
         EDNCfFgna2AQSRr1BEgvsf6e2XrcDkJbj4/bzUQVo1u7QdkIwkz1hCgQrjNdUcSS7UBl
         dTfA==
X-Gm-Message-State: ACrzQf1LvzNAq6aw+i/jC6jvDE6KO+IBybF4k9QRSIiY2H2ttwqxpVAc
        gNE8XPsDR6QQT+3uP3bvTzGgmFL/RA9VPv/zqm0=
X-Google-Smtp-Source: AMsMyM6vCvsom7JSQzBgOaXEWZcrzQrzlVT4KUMUD0gfOKUurVFYMVKaxNkyDmgdfy/qfOCZx97caD/kaDzJYPGu3A4=
X-Received: by 2002:ac2:5e23:0:b0:4a2:6e06:e107 with SMTP id
 o3-20020ac25e23000000b004a26e06e107mr12595690lfg.256.1667560960683; Fri, 04
 Nov 2022 04:22:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:68a:b0:1fb:fcb5:6203 with HTTP; Fri, 4 Nov 2022
 04:22:40 -0700 (PDT)
Reply-To: info@oragrouptogo.com
From:   "Mr. John Solomon" <inoforabank750@gmail.com>
Date:   Fri, 4 Nov 2022 04:22:40 -0700
Message-ID: <CAC0BO2eBzNumXCOQLz7Q=9rjLzaTQh2RMjN7TsMz8PU3aLrP7g@mail.gmail.com>
Subject: Dear Beneficiary
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.7 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_60,DEAR_BENEFICIARY,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        HK_NAME_FM_MR_MRS,LOTS_OF_MONEY,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_MONEY,XFER_LOTSA_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:129 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7148]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [inoforabank750[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [inoforabank750[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  3.0 DEAR_BENEFICIARY BODY: Dear Beneficiary:
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 HK_NAME_FM_MR_MRS No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 XFER_LOTSA_MONEY Transfer a lot of money
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 ADVANCE_FEE_4_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello and Good day to you.

I am Mrs Teresa Mathews from the (IMF) International Finance monitoring Units.

I write to inform you that we discovered the sum of $250,000 Us
Dollars in your Name and your details is attached to it, This fund is
in the Custody of Ora Bank Plc, This Fund is provided by the
Government of the United State of America for you to be use as a
support in connection to the damages done by the Covid-19 Pandemic,
Its a way of assisting people randomly after the effect of the Corona
virus.

We have directed the Ora Bank Plc to transfer this money to your
destination as soon as possible.

You are to get in contact with the Ora Bank Plc and let them know that
I have directed you to contact them in respect of your $250,000 from
(IMF) International
Finance monitoring Units.

Contact Person: Roy Gupta
Email:( inoforabank750@gmail.com)
Phone and Whats-app: +91 93625 40689

You shall send your name and location to him in order to Identify and
confirm you are the rightful person in contact.

Kindly indicate that I directed you to contact him and he will process
your transfer as soon as possible, and please, always let me know your
dealings with the Bank.

Thank You.
Mrs Theresa Mathews.
