Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 692867213B8
	for <lists+linux-input@lfdr.de>; Sun,  4 Jun 2023 00:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbjFCWny (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Jun 2023 18:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjFCWny (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Jun 2023 18:43:54 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51700ED
        for <linux-input@vger.kernel.org>; Sat,  3 Jun 2023 15:43:53 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id 006d021491bc7-5559cd68b67so2445968eaf.3
        for <linux-input@vger.kernel.org>; Sat, 03 Jun 2023 15:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685832232; x=1688424232;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4E4Mp1GrKX2u0IjD00DsN7S7IMP8ee75oyqUE4OyWTM=;
        b=eqNCLNDm2Mcde4tJe5Lw0X8cNiRyceBaGJjsUYT0R4FpzQNFuqRXa0s/ufDBy8KNef
         IpzxQIwEXQtyqE1ttBH6Xyb2xTl4Fzy+qv27+gjRmOW7kfoHjLDUjbZP+5tQX/oPLQa4
         xAEtkHgiTziIzwwNdxM/FgPC3gJm2tuNbYIStXtVMui783OQAJYThD6Iw5DljgcbIJ6B
         9BEMFOGgj12PkOOd7qwu1aHGOlqgxsx2Jj36v5qwb/nCaEwbKNNPaECFU6gOTJqPCwSv
         nCoyDNw8ybxxr3on/ZK6LOSPC3MDF6c9PNJ0HmKWUsDBcmtAiH5URtma58T8av+giGNA
         s+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685832232; x=1688424232;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4E4Mp1GrKX2u0IjD00DsN7S7IMP8ee75oyqUE4OyWTM=;
        b=b+vK1wQo52iS4zRNHRIWhuIkKUC7rR8h4R+SIDptC5hnPadLs0v0yuU5JjnFdF1FZr
         dQL9vlWqkjz0PbgZjl/okOGC5ZxQubYH2Hb18Nu5EooclEj1Umm7CTcT7jQphxN1Pug0
         JxFbsoZzlUgvAL8de7FLTfxmsKgA0T0MP6tqWDv8FQ5UWF+cielvxALrlhSL8kzHZ+01
         VqA+jJGgVaQR289u1Yld5EmjpjN2YdkwNe5cCfvX/eoQ9A2mrGVTTBkDvDb0K+5abNVC
         Aq0FwWkjOrGzp76EwwrEiZRUWGeU7OcTOKKoOOcwZ7CYp18QQeq7hzsWlxpTOYWl2/yw
         LgAw==
X-Gm-Message-State: AC+VfDztWhmzofnl2TyFuhpmuQD/XMUxWpN0rJUG97I4lGHdhe4d4wT9
        vdZoUIJIGgpoehGxyCazSlxAImHvDKPZ0cpsuk8=
X-Google-Smtp-Source: ACHHUZ4ahFazWonGD3p7WfIz+hQ1AP7uJMx4ZAIdj8iY8bP+OSVgonTyms/CjQVPO8p/WeAJN9okQeWw88VI15Ak43w=
X-Received: by 2002:a4a:1401:0:b0:555:722e:3ce with SMTP id
 1-20020a4a1401000000b00555722e03cemr9899210ood.9.1685832232426; Sat, 03 Jun
 2023 15:43:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6359:1015:b0:104:453a:58c1 with HTTP; Sat, 3 Jun 2023
 15:43:52 -0700 (PDT)
Reply-To: mrs.feleciajonathan001@gmail.com
From:   "Mrs.Felecia Jonathan" <mondaygood4292@gmail.com>
Date:   Sat, 3 Jun 2023 15:43:52 -0700
Message-ID: <CAM-7_HFYQQ31E5G_GuH-Bf5eG+S8bzmyqFn3Hv=ErtUg7RGpHw@mail.gmail.com>
Subject: Greetings beloved
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

I Am a dying woman here in the hospital, i was diagnose as a Cancer
patient over 2 Years ago. I am A business woman how
dealing with Gold Exportation. I Am from Us California
I have a charitable and unfufilment

project that am about to handover to you, if you are interested please
Reply, hope to hear from you.

Please Reply Me with my private Email for Faster Communication
mrs.feleciajonathan001@gmail.com
From Mrs.Felecia Jonathan
