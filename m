Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E924C0440
	for <lists+linux-input@lfdr.de>; Tue, 22 Feb 2022 23:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235667AbiBVWBx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Feb 2022 17:01:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235595AbiBVWBw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Feb 2022 17:01:52 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B19C11861F
        for <linux-input@vger.kernel.org>; Tue, 22 Feb 2022 14:01:26 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id d3so20399576wrf.1
        for <linux-input@vger.kernel.org>; Tue, 22 Feb 2022 14:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=egiBm1kuuk0+C0vIeot8eCLW4Q3rNTsUCTHHdfESrmTwc7KBeYASOJnrWTIsDO88tv
         GGPegaIwJB4rNjMoJ7k3U2kVQHpcakhaq0wl4nPrSQAv2ug4GKIaLcvSKHHaLifrTcCB
         xlX0+SC4Rqg/oWLSAUfuPtRFZ9xba30CnR3oLpfZA0YLQT/XqLdRnL2/aAFKBDC91Bro
         7GUs5ZQ0Z57QVEnJABuIK68Hv666N/W0ZztjBnnd8b0lR/rJZV9Y3bThPUWAWNkADSWx
         0akdGLJR/M9N6CjuxxQa3vN5hfJxA2RqtibsqjxwOHe1I1bCySBzWHKLSO8AyCyo78an
         mBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=eaaB5Fi4OIw8X99OdVt3/5VwsoSH3pqqZ03p7mumtcE=;
        b=WhRdssSqWOelTL1D64goBJBdIjFd3Wgf+fTc2XaCNQxEQUQQIb54X3+4o66+udwUAW
         wLX8cxhxYhgsELBUO9Wqn5WR/IFDvElFp2NtaGuqny/LL5aoQuRBphQgZeuUSLxQ7oBe
         2DmhqxGbI07jIYFSG/nkvSanov+BK5fWmijVRBBpoTvCVwSdgILUntkN06fyGVewbMkG
         x3HHnDSLSwKxQo5oat9MPgXCODWBjiZ8qoPH2caJJbpZmR/5l+/wgVrHgJlBLYV91tLa
         sjr9z8G0OB7NrDjQTa3FY3zTVgvYwUIySVO4sJkB6yB1Yu+M8k2MiiBmT3V1pApC2Eyu
         4adg==
X-Gm-Message-State: AOAM532bs32K3vNrGsEC2co4HhQt5saGmGoK06Tzql8C69G0OqwAWhnK
        pUSD2Rqn4to24gv2qjI6zdI=
X-Google-Smtp-Source: ABdhPJxx4jMoTAybW9BX4PsvWOlFDYG+U1eqN8ZopS43rhbq8w6ew1lbUE7jM7DFVWq4A98QiXsvbA==
X-Received: by 2002:adf:fd4d:0:b0:1ea:9109:dae6 with SMTP id h13-20020adffd4d000000b001ea9109dae6mr3986626wrs.293.1645567285161;
        Tue, 22 Feb 2022 14:01:25 -0800 (PST)
Received: from [192.168.0.133] ([5.193.8.34])
        by smtp.gmail.com with ESMTPSA id d2sm26207622wro.49.2022.02.22.14.01.21
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Feb 2022 14:01:24 -0800 (PST)
Message-ID: <62155d34.1c69fb81.33ddf.d2c5@mx.google.com>
From:   Mrs Maria Elisabeth Schaeffler <chairtydonation5@gmail.com>
X-Google-Original-From: Mrs Maria Elisabeth Schaeffler
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Spende
To:     Recipients <Mrs@vger.kernel.org>
Date:   Wed, 23 Feb 2022 02:01:17 +0400
Reply-To: elisabethschaeffler01@gmail.com
X-Spam-Status: No, score=2.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,TO_MALFORMED,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hallo,

Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Wirtschaftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen zu geben
der Rest von 25% geht dieses Jahr 2021 an Einzelpersonen. Ich habe mich ent=
schlossen, Ihnen 1.500.000,00 Euro zu spenden. Wenn Sie an meiner Spende in=
teressiert sind, kontaktieren Sie mich f=FCr weitere Informationen.

Sie k=F6nnen auch =FCber den untenstehenden Link mehr =FCber mich lesen


https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe
Gesch=E4ftsf=FChrer Wipro Limited
Maria-Elisabeth_Schaeffler
Email: elisabethschaeffler01@gmail.com
