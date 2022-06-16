Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2635E54E5AD
	for <lists+linux-input@lfdr.de>; Thu, 16 Jun 2022 17:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377792AbiFPPGv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 16 Jun 2022 11:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376920AbiFPPGu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 16 Jun 2022 11:06:50 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5985C3F885
        for <linux-input@vger.kernel.org>; Thu, 16 Jun 2022 08:06:49 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so5466985pjb.1
        for <linux-input@vger.kernel.org>; Thu, 16 Jun 2022 08:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=gbykHz122R7V8NRnylmmL+nf14gPotJAGhaKsTLnQzI=;
        b=qO2BeT+KlxucFbvV5SbZA29Z+d5C3nIN1QbD9jcePegTLQ+RdvvBgL8Ty7I4ARaZ9j
         mv4l/QinLeSziAGn6Hr9d8MDLhBFszB92QsXv+eg36uUOUT2u8/yJ5KuajqZpOSPSzkC
         3LW+R915VPscqwLtNFIue7KxdFSwNeGjNPPN8SkEE1z/yATY8CdxhHMU6SxVzokHIhcL
         7LPDYYS3KZvh2Tpcx05/g2Gq8OaFW6acPGqAJ1HU5Xc3vyqI+hkPW/dLlJhuTc+/CqDs
         qt7KbXyZNVozZjN95G9U3g4IEN7qBGHmwyZ4M8hBugZJlhQ7ERdEGdmd7a8bNRMDs+4Y
         hErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=gbykHz122R7V8NRnylmmL+nf14gPotJAGhaKsTLnQzI=;
        b=osU+NJridI3YnZahEgpZZHYbb1O9W1qb6DZvaq0yr4BxJ6goWkBYWg+qgIQKeHbth5
         uho8139WRlGZvnkdlUzPRY1FMe18CNXwqm005KuX4HXAVdQZogBri/suSmKI7CI0Rgkd
         iNHjvV1a0gzjm3Qh4pOfN29xTKs0s+b3gQxx7eGHk+7MVuS8fZ3mFUoqbGJfSM6LmqTD
         W7MQ/4/WRRtoW4W+asXwIQYdmjP39qNTHNU5GGuzLf+Qp7wOX01DFe3nSz1ipKT7liar
         5vQ2/dgufmjFOh6iWxqZ2g951i+dUA3nIyAt/NUFRhTDeVlr8mkarhz8990CL8xuJYQ8
         /qRw==
X-Gm-Message-State: AJIora8eq/ZMGH34zI4KUG1YZ5UID3wenOpU6SdXtBpofl6sLdz31ZPf
        ble/8rxg0cr9S8C+EtieBaaXIVA40oLtw1sadGg=
X-Google-Smtp-Source: AGRyM1vi14OrA+W4T+TKcGFoTMUhGt5k0X1fuYzBf4SImpyeG7giGEW2scWaYobfdMGraXPDJxLcbGGqZBOcmdfX13U=
X-Received: by 2002:a17:902:ccd0:b0:168:db72:15e with SMTP id
 z16-20020a170902ccd000b00168db72015emr5244684ple.63.1655392008841; Thu, 16
 Jun 2022 08:06:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:4b44:0:0:0:0 with HTTP; Thu, 16 Jun 2022 08:06:46
 -0700 (PDT)
Reply-To: abraaahammorrison1980@gmail.com
From:   Abraham Morrison <idirisgarba29@gmail.com>
Date:   Thu, 16 Jun 2022 08:06:46 -0700
Message-ID: <CAOKAOWZ94HWXS9-SSEZ7AKYms6Yjv=SGY7=r3V0g10yCtiku0A@mail.gmail.com>
Subject: Good day!
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Opm=C3=A6rksomhed, tak,

Jeg er Mr. Abraham Morrison, hvordan har du det, jeg h=C3=A5ber du har det
godt og sundt? Dette er for at informere dig om, at jeg har afsluttet
transaktionen med succes med hj=C3=A6lp fra en ny partner fra Indien, og nu
er pengene blevet overf=C3=B8rt til Indien til den nye partners bankkonto.

I mellemtiden har jeg besluttet at kompensere dig med et bel=C3=B8b p=C3=A5
=E2=82=AC500.000,00 (kun fem hundrede tusinde euro) p=C3=A5 grund af din ti=
dligere
indsats, selvom du skuffede mig langs linjen. Men ikke desto mindre er
jeg meget glad for den vellykkede afslutning af transaktionen uden
problemer, og det er grunden til, at jeg har besluttet at kompensere
dig med et bel=C3=B8b p=C3=A5 =E2=82=AC500.000,00, s=C3=A5 du vil dele gl=
=C3=A6den med mig.

Jeg r=C3=A5der dig til at kontakte min sekret=C3=A6r for et pengeautomatkor=
t p=C3=A5
=E2=82=AC500.000,00, som jeg opbevarede for dig. Kontakt hende nu uden
forsinkelse.

Navn: Linda Koffi
E-mail: koffilinda785@gmail.com


Venligst genbekr=C3=A6ft f=C3=B8lgende oplysninger til hende:

Dit fulde navn:........
Din adresse:..........
Dit land:..........
Din alder:.........
Din besk=C3=A6ftigelse:..........
Dit mobiltelefonnummer: ..........
Dit pas eller k=C3=B8rekort:.........

Bem=C3=A6rk, at hvis du ikke har sendt hende ovenst=C3=A5ende oplysninger
fuldst=C3=A6ndigt, vil hun ikke frigive h=C3=A6vekortet til dig, fordi hun =
skal
v=C3=A6re sikker p=C3=A5, at det er dig. Bed hende om at sende dig det saml=
ede
bel=C3=B8b p=C3=A5 (=E2=82=AC500.000,00) pengeautomatkort, som jeg opbevare=
de for dig.

Med venlig hilsen,

Mr. Abraham Morrison
