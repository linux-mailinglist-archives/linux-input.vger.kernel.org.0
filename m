Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCA155374B2
	for <lists+linux-input@lfdr.de>; Mon, 30 May 2022 09:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbiE3GfW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 30 May 2022 02:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232893AbiE3GfV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 30 May 2022 02:35:21 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE63856F88
        for <linux-input@vger.kernel.org>; Sun, 29 May 2022 23:35:20 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id wh22so18874265ejb.7
        for <linux-input@vger.kernel.org>; Sun, 29 May 2022 23:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=dhKVbHB+tGxKra04y2wjmI3gGDhr700suXI/higJUsk=;
        b=agjmAGASm2I9fBY3U1HqRuhR6dFT9o2Krx+91iJODnjieGYpQ1gNCRqBKvnQTDu703
         TmRlrIebM2tQjGcaNE2Cju5JRpEHA7q3lKalPQ8BBwgBfQtQAVgklC1Hpc4p0vr2EPUM
         GR+nXg1hMUENhhCw+tWFJWEOrx7Z9A+Ht2zxdcak1uxJY0a3gYntPf9rbx2ZcHI63rnF
         iH/lP2J7MWcL2Lw5NxVdgaQMugzpHe5gPsT+xhDZ3yh0tXhdoNC56S83ZkwmM3p7M/7b
         8ntmDke19s+j3oTJhL/+7F6SENSZgRh/sQBUlBvAoFBCOrPxQ4JW8GkKeaceIaZZ1Y4O
         wTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=dhKVbHB+tGxKra04y2wjmI3gGDhr700suXI/higJUsk=;
        b=dmyFqA7v22T3297/Ed0jF+GoemGv52iMAUvte1eSZVm1U5yYuA1+zPiZnH0vOgsdwN
         QAKFXSP8V/UZY5Z8vd/S4lxjj4n2gSPMoQrvp0oV5Do6lnb+E5dSawvwWd3zyaUq+wzc
         rbSccWOpBjN52huY8jqPWQLO8/jJZFbz9SuX26XLQRQPVsJLmHIOsTjd5QAkMFZtcY9e
         bkWK2K1Q5D1lEQ9/73g8VPRIeUX/9PkNg4unaW+tdlzg5Ow3DxATZF346xnw1e/W0/fT
         bt2xR9a05zJjqMiJh48rmT+b+FQr9CtjaaDUcMCF68avSXuux1YOENYx/AiTzkUwQYiv
         Xwog==
X-Gm-Message-State: AOAM533eCUP5MakGVmGi8uf5l7PQCFc1s+Lh14smgGi5Ju0KuyQprJQ0
        Wm/Ufyt42Q4cYTpLTwF4KR+TdbEdNlrt7mNV2BE=
X-Google-Smtp-Source: ABdhPJxEBU2Q82eNW1X7AopLLfWH3ic/SMwZC7tVthcPdrm9iI189TdAJEdbIJuLMI27zXx3wYlXmGb5KhYWJiiUjVg=
X-Received: by 2002:a17:907:7294:b0:6ff:200e:8d62 with SMTP id
 dt20-20020a170907729400b006ff200e8d62mr17249550ejc.719.1653892519245; Sun, 29
 May 2022 23:35:19 -0700 (PDT)
MIME-Version: 1.0
Sender: leilatraore817@gmail.com
Received: by 2002:a05:6400:2417:0:0:0:0 with HTTP; Sun, 29 May 2022 23:35:18
 -0700 (PDT)
From:   Kayla Manthey <sgtkaylmanthey612@gmail.com>
Date:   Mon, 30 May 2022 06:35:18 +0000
X-Google-Sender-Auth: iMYlqJcgZi1KzGWAdgw85BPtalQ
Message-ID: <CAC9MqxND-qP11b0_zH_xOjjKk_p4-CCrcXyw77sg9J0fHy5E2w@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Bonjour, je n'ai pas encore re=C3=A7u de commentaires de votre part
concernant mes pr=C3=A9c=C3=A9dents e-mails.

Hallo, ik heb nog geen feedback van u ontvangen met betrekking tot
mijn eerdere e-mails.
