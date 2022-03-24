Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E9E4E65CE
	for <lists+linux-input@lfdr.de>; Thu, 24 Mar 2022 16:07:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243387AbiCXPIz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 24 Mar 2022 11:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242453AbiCXPIy (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 24 Mar 2022 11:08:54 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC813AA03E
        for <linux-input@vger.kernel.org>; Thu, 24 Mar 2022 08:07:22 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so2738210wmp.5
        for <linux-input@vger.kernel.org>; Thu, 24 Mar 2022 08:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=d9e4FwVvPkzb1X+3O8oT3mJJKSCaLzX7XWSmoSmzT38wAWuKkYLSUb2VjToZZu1jR/
         I/hEexlyZK2zn9Q1sZ6WcdKnmObRcwRXceD4Gq15yDtfK/XagHzZnOkHBMzynioT8/bf
         dWYXYGVY5NP6HZPMNHEjJ8vj5bUiDMjyl4rX/aGYIddanlSDcckfRwkyU0b6BGTEVJSa
         xQ7slHgy7DY59Caep+b8RCmnimfsTf9TBVaN/4Am5X+9FWvpHwGIraC2ardeIEnfzmt6
         dTPEsRYP7X5Wot2K9z3qyRpSZeGXZe45lWB5awYpOudrq54EAlAi3JBbKkkfTuwRu4UD
         o8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=sfxo1dqqTrr7e28OuTBjrwUEPnrevaNVUdgTMF56Ktk=;
        b=6hpxWMIbzfre8R+a5pkQPe9Iyxv4wWaqsPixJlff8DHctpTcwXXnOxpi/Vr/L/g/Fk
         B7tNlHkZPca2QiGRGWfo+2LauLYIidA50mvIf9BiuTZOnofrkkTtWw+nAarK0OzLQrxm
         LqW8uW79rmKb9Q0Twbf9o22R6veoy8aS3H4ZPLoUCvcAhPg1luMYYIxzH0LOLyPzCIgJ
         L36u3/dkwY3IMAbUWrTDtTFrmlxQyJpu7mzZU5cnf6erezF2+e+MaGrbE2KFR8fUOsnn
         RGhW4nwwK8/K3ef8C55r5cnEKLX3YNQjJhv5xCqn/7CCmlwiv74qUOq9GSxQAN3NHbnD
         BoJQ==
X-Gm-Message-State: AOAM533Q3v+gwFMBOc8Csx7/XRUQYLPEMsFaGan3A4h4WIbm/4cKPkmu
        7z/iF5X3f0trKi2kCsJW3NQ=
X-Google-Smtp-Source: ABdhPJx9u930VhHt+30emFfmCm3/ZgbVJ8EU4tkvVRuGckmqtRLsikgdw8yAnglflN6b1W2Qh2gshg==
X-Received: by 2002:a05:600c:4f0c:b0:38c:bdf5:2232 with SMTP id l12-20020a05600c4f0c00b0038cbdf52232mr12050354wmq.90.1648134441402;
        Thu, 24 Mar 2022 08:07:21 -0700 (PDT)
Received: from [192.168.0.102] ([105.112.209.229])
        by smtp.gmail.com with ESMTPSA id f9-20020a0560001a8900b0020582807408sm2931560wry.20.2022.03.24.08.07.17
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Mar 2022 08:07:21 -0700 (PDT)
Message-ID: <623c8929.1c69fb81.9b94d.c46b@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: meine Spende
To:     ariblessingogande@gmail.com
From:   ariblessingogande@gmail.com
Date:   Thu, 24 Mar 2022 08:07:12 -0700
Reply-To: mariaelisabethschaeffler70@gmail.com
X-Spam-Status: No, score=1.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

 Hallo,

 =


Ich bin Frau Maria Elisabeth Schaeffler, eine deutsche Gesch=E4ftsmagnatin,=
 Investorin und Philanthropin. Ich bin der Vorsitzende von Wipro Limited. I=
ch habe 25 Prozent meines pers=F6nlichen Verm=F6gens f=FCr wohlt=E4tige Zwe=
cke ausgegeben. Und ich habe auch versprochen, den Rest von 25% in diesem J=
ahr 2021 an Einzelpersonen zu verschenken. Ich habe beschlossen, Ihnen 1.50=
0.000,00 Euro zu spenden. Wenn Sie an meiner Spende interessiert sind, kont=
aktieren Sie mich f=FCr weitere Informationen.


Sie k=F6nnen auch mehr =FCber mich =FCber den unten stehenden Link lesen

https://en.wikipedia.org/wiki/Maria-Elisabeth_Schaeffler

Sch=F6ne Gr=FC=DFe

Gesch=E4ftsf=FChrer Wipro Limited

Maria Elisabeth Schaeffler

E-Mail: mariaelisabethschaeffler70@gmail.com
