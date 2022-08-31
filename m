Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DD975A7CC0
	for <lists+linux-input@lfdr.de>; Wed, 31 Aug 2022 14:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiHaMBQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 31 Aug 2022 08:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbiHaMBP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 31 Aug 2022 08:01:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99412B81C3
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:01:13 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id v26so9383762lfd.10
        for <linux-input@vger.kernel.org>; Wed, 31 Aug 2022 05:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=4YS5JYn1uiiBNl1ts5t+GGUkCHO4fewra9776ibyVd0=;
        b=qplb4uMP/aCP4xajNLnopVBa0PW5Kducc8HdF47fQlC16cCm6p6GvAl9Tahvqmqc2n
         JbYdgi7wKvLTYBgV9aznirKx+QOnfXJg0FP/dCSc6iXzE75N2CCQkGOf2VdloRDMwu2w
         UIgyRyxU1Bjtovr1KinjiyW4nRGvrQkynUFpcOi0Vrt6foVY2xMDHFQyWCjDbYWfE2ha
         t5XtITS58U5Hsv+FZe538qQSBcKhI0z2uR+iMKfMI2dLB53vBqU2tTliPXFxnIf6soTw
         1PVe+aG//a19dsbaL61xJKymGuEAmqZnBT7hBCtNRocOozKJU1Bqi7da9R6LyGVsfPO1
         xdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=4YS5JYn1uiiBNl1ts5t+GGUkCHO4fewra9776ibyVd0=;
        b=4BpcOirMzdysFnK6gKcNadCK5qde8TZNSdm1kpi3z+eHFKEC44AnLzMt8K/DRbgfJN
         vJlKnxSBZyFy1qgwfT+6WxKSgnKUSasbe2kVn/nhb8nemELNcEzbUeLBcqlYJTxLvSdj
         ngYY8DSmQDunFy5hCZymEgo9LZtLx8CsbPOrDtkt6vQ2Hc/HKKSlTN8CFer4TnRVDax6
         qMLc4dCNXQZsFvOjpfK4PJsqfIr0lqYfqWHgwSq3KOrxn/JAfxQ3fcKPYSw8qk4Vh1pP
         aM42pm4tBUg0XwWhqC9DQDsFTIx2e9EFyHuyXrPxf27Q2OEv0WF+5VIAnsgrLJsZwnw0
         TCrg==
X-Gm-Message-State: ACgBeo2Hmu2NdoRivkklTESmVEhn7l2qsFMpBGLrMlpvuT9ssi2cuX5E
        pmjl/DbnR9AlxI87Ufv9oX6Ll2gmnv4o7hbhYgo=
X-Google-Smtp-Source: AA6agR4tuS850AO5q4FK1OLs1HQUy4W70aWPOMYZcV5Z/Ns0pDo+H2i8DddeLdiJdvcIiIPISj09YsVyYO0DSF9/gpM=
X-Received: by 2002:a19:434a:0:b0:494:77c1:abec with SMTP id
 m10-20020a19434a000000b0049477c1abecmr2618816lfj.497.1661947271944; Wed, 31
 Aug 2022 05:01:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6504:659:b0:1da:3c84:5615 with HTTP; Wed, 31 Aug 2022
 05:01:11 -0700 (PDT)
Reply-To: golsonfinancial@gmail.com
From:   OLSON FINANCIAL GROUP <adamamusaharunna@gmail.com>
Date:   Wed, 31 Aug 2022 05:01:11 -0700
Message-ID: <CALy2aYqyXN2t0FWdEDQ9dpBOzepa4+_Aum6pQbTeK+rT2tMBVw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=20
Hallo Gr=C3=BC=C3=9Fe,
Ben=C3=B6tigen Sie dringend einen Kredit, um ein Haus oder ein Auto zu
kaufen? oder ben=C3=B6tigen Sie ein Gesch=C3=A4fts- oder Privatdarlehen, um=
 zu
investieren? ein neues Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Un=
d
zahlen Sie uns Installationen zur=C3=BCck? Wir sind ein zertifiziertes
Finanzunternehmen. Wir bieten Privatpersonen und Unternehmen Kredite
an. Wir bieten zuverl=C3=A4ssige Kredite zu einem sehr niedrigen Zinssatz
von 2 %. F=C3=BCr weitere Informationen
mailen Sie uns an: golsonfinancial@gmail.com....
