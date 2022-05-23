Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C41A53186F
	for <lists+linux-input@lfdr.de>; Mon, 23 May 2022 22:54:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiEWThC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 23 May 2022 15:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231817AbiEWTfz (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 23 May 2022 15:35:55 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64BDE7CDD7
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 12:22:37 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-2fed823dd32so159000407b3.12
        for <linux-input@vger.kernel.org>; Mon, 23 May 2022 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=uMK4uhL7bbIrweYoyqO5hSjV8mXVqG8AbtrOT/hIh/w=;
        b=DfvuwBWFA1bY926PzbhpxLvufY+nooaVA0eP6h8hcT7X+D1UMv1hYYv9qqR+rDToaY
         XyLwkoO9fVzecw5cBDvm3kj83cqrZjGFNkcibIfd5VSKAWtuEl7H2O3Tmr3adHPeEklP
         uy6usjU8YSanfDc5bmGBQm4qGMKQfTGxGnyDXoaOudbRJK+omFaVLQ2tPxoWiUiMwGnb
         vq67eL4pwTOHiLdDiQ1KL1TD1YeJkIcTadmMwLP1CwcQ4W25q+cpUirao3A0BDo+Ydbm
         ITV4GKXy9v6Mi3/oWTcngGYKlZG2DaH2gpqYlVmSIbuCFNN+GG/4VR4WqlBnPfl3lRWu
         xc6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=uMK4uhL7bbIrweYoyqO5hSjV8mXVqG8AbtrOT/hIh/w=;
        b=xd42RLS9LHP4W6QrPHIJEbKOApUokAcBZPdUVkYUrtQJ//QMD2DLMoTCVbvRNtGsgE
         N2hKwhXs/dEewo+ZHYye/jN8AtWwr5VMmBi321CAD9oylsQgqMkIZaWYLtWkveFNhNzU
         TVkqGYjuubV1HKuvkU9S97BYfuIwanP2tlNqr5D5O4bVVJXcm3BmLBuL7B3Ghms5eFil
         bTnMmPtCfE5pi01aPJCWcpmm8AjoqZRNe2N2Mp0jZnGFR4e8Gyd+O9GpYIdZA52VX9h7
         7SmGyGu9j5cs8tQshlicWobYz/Thf8ftdENkaRGueLHaBrGufdonv1Itr3TejAo33pVy
         QskQ==
X-Gm-Message-State: AOAM530vYPtX3QD2Uysa2hPcYmmmsn+eyBVOYnZz+lFLTHNHYHkez2AO
        QIUZ3VbaAztgY0RT7ftYU4JUEH4wexP1E3mKin8=
X-Google-Smtp-Source: ABdhPJyRu/kbjkbS/TQzQMnPEZSMdQ0deCMxQMSdVCSxPw7ECGRpM+wGw8FkR913/a2bupUeR+KfpqbtDKkD8zTvHV8=
X-Received: by 2002:a81:6188:0:b0:2eb:4bd3:9b86 with SMTP id
 v130-20020a816188000000b002eb4bd39b86mr24122762ywb.46.1653333756537; Mon, 23
 May 2022 12:22:36 -0700 (PDT)
MIME-Version: 1.0
Sender: ifeanyiomaka1@gmail.com
Received: by 2002:a05:7010:2590:b0:2d2:29b8:55 with HTTP; Mon, 23 May 2022
 12:22:36 -0700 (PDT)
From:   Dina Mckenna <dinamckenna1894@gmail.com>
Date:   Tue, 24 May 2022 07:22:36 +1200
X-Google-Sender-Auth: opePKpipJqMLcNO-ayfr6Ucg_gk
Message-ID: <CAO-KV1-Uvt1mrXXd3TJ0Wp9d5L8vKgse_iOO8QbyP-M-2XGYJw@mail.gmail.com>
Subject: Calvary greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.5 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_60,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:1132 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.7475]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ifeanyiomaka1[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ifeanyiomaka1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  0.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello My Dear.,

Please do not feel disturbed for contacting =C2=A0you in this regards, It
was based on the critical health condition I found myself. =C2=A0My names
are Mrs. Dina Mckenna Howley. A widow and am suffering from brain
tumor disease and this illness has gotten to a very bad stage, I
 married my husband for Ten years without any child. =C2=A0My husband died
after a brief illness that lasted for few  days.
Since the death of my husband, I decided not to remarry again, When my
late husband was alive he deposited the sum of =C2=A0($ 11,000,000.00,
Eleven Million Dollars) with the Bank. Presently this money is still
in bank. And My  Doctor told me that I don't have much time to live
because my illness has gotten to a very bad stage, Having known my
condition I  decided to entrust over the deposited fund under your
custody to take care of the less-privileged ones therein your country
or position,
which i believe that you will utilize this money the way I am going to
instruct herein..

However all I need and required from you is your sincerity and ability
to carry out the transaction successfully and fulfill my final wish in
implementing the charitable project as it requires absolute trust and
devotion without any failure and I will be glad to see that the bank
finally release and transfer the fund into your bank account in your
country even before I die here in the hospital, because my present
health condition is very critical at the moment everything needs to be
process rapidly as soon as possible.
It will be my pleasure to compensate you as my Investment
Manager/Partner with 35 % percent of the total fund for your effort in
 handling the transaction, 5 % percent for any expenses or processing
charges fee that will involve during this process while 60% of the
fund will be Invested into the charity project there in your country
for the mutual benefit of the orphans and the less privileges ones.
Meanwhile I am waiting for your prompt respond, if only you are
interested for further details of the transaction and execution of
this  humanitarian project for the glory and honor of God the merciful
compassionate.
May God bless you and your family.
Regards,
Mrs. Dina Mckenna Howley..
written from Hospital..
