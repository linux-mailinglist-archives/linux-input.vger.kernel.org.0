Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C078B52FC65
	for <lists+linux-input@lfdr.de>; Sat, 21 May 2022 14:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241481AbiEUMdl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 21 May 2022 08:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242064AbiEUMdl (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 21 May 2022 08:33:41 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C1849C2FC
        for <linux-input@vger.kernel.org>; Sat, 21 May 2022 05:33:39 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-e93bbb54f9so13046941fac.12
        for <linux-input@vger.kernel.org>; Sat, 21 May 2022 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=7tg40EKujVrvEq2OPBumK7nnpMC1oJCGBGMec7v49xU=;
        b=Lgf03/cWaHB/mJObbzLPzRKJER36yrig6K05AnBt0I8NF7Lvk0VPFicV7yOKUoAnOm
         nVHhyr0f2RwLl1JSJ9QD++uERjbLjFJAfYrYGbbVHasB+4yo5dVHersCWQIUGcWKdiPt
         IXPcDe5rmvn0aQwNtZ0maZFQUMxo3TRCU4b54VZNU9aGRLOOc637GHjWfeD6QgtyI25Z
         /sv2MIzFE2BKaxaCs8EqItYLwkpyAvo6bTJDO6m5D2Qn9VZ7QK2PvBQilov/qXfJ/SQZ
         Vqe04DgQb2uKwMdQVP0qBeOtWIQ5wOx9EDPwPkFFLquj8t9SW7QiZMipt2r72FjCbfn5
         TSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=7tg40EKujVrvEq2OPBumK7nnpMC1oJCGBGMec7v49xU=;
        b=FG4/OtCvhTvqy2kK582tdkgO0dzXau/G1V2Qt6KQLYMw1O/UeX2WcP5gLX4TZHYc+6
         Z5w9mnisaLjlWyiY/Mqc1cB86EQwuV3ZgCHCENosoH5HksGmBZHiXRChXgF+txGhuWKP
         xiEI+dTEbJvmn3vXDUEXtKFiJeCqBghTQZWgI0Rru6UgyYTHZa9KLNqqD5Rw3ykGj/ML
         NgsK9L4z1Wtb7eKUGIdJ88+saQ9so+pj5v3QrTcw1Ju/6LZfRIN17Vve4lTF8h0Nd6R3
         ndIFWRUN+4ELd+YMrVv770zJpRuaua0/zq5bKuWYsS5yjLVwRRJm/opVSmo5Qdcw/Qd9
         v2zw==
X-Gm-Message-State: AOAM530+fuJ3rnqiZxWjdkVve8g5DVFbRClUc7yo9L9AHvvuChDJ3Q7X
        GAVGo55Fosww6+6i7zexaGQosNkDQHmynqP8dFE=
X-Google-Smtp-Source: ABdhPJzfoTONACgcm7xUyFZcN31tXWpkZ4TxPaGn7GGi+gWZhtEMtkZUpfSpPkuvyJF0vMyKo0GroVAyD51mdWWwSOI=
X-Received: by 2002:a05:6870:5b89:b0:e9:bb4c:a6f1 with SMTP id
 em9-20020a0568705b8900b000e9bb4ca6f1mr7990898oab.52.1653136418455; Sat, 21
 May 2022 05:33:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:9041:b0:a3:2c3e:d3c2 with HTTP; Sat, 21 May 2022
 05:33:37 -0700 (PDT)
Reply-To: lattedenis606@gmail.com
From:   Denis <harveygeorgejoel@gmail.com>
Date:   Sat, 21 May 2022 12:33:37 +0000
Message-ID: <CAJp=Lcmbnb4tG9V4asWrmjfYMr+4A+bYWs9Fw2hV_u11bxobVQ@mail.gmail.com>
Subject: Hello
To:     Denis <harveygeorgejoel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.9 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FRAUD_5,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Greetings.
I sent you this mail about two months ago without a response from you, I am
Barrister Latt=C3=A9 Denis, personal attorney for a deceased client of mine=
, who
deposited the sum of $7.5 million in a bank here in Lom=C3=A9-Togo, prior t=
o his
untimely death. He died as a result of a heart condition, his heart conditi=
on
was due to the death of his wife and his only child involved in a plane cra=
sh,
and without a registered relative.

I contacted you because you have the same surname as my deceased client.
And the funds now have an open beneficiary mandate. I'll give you the detai=
ls,
as soon as I hear from you.

Thanks for your quick response.
Latt=C3=A9 Denis Esq.
