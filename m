Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C2817AD0D8
	for <lists+linux-input@lfdr.de>; Mon, 25 Sep 2023 08:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbjIYG6w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 25 Sep 2023 02:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232174AbjIYG6v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 25 Sep 2023 02:58:51 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C518A3
        for <linux-input@vger.kernel.org>; Sun, 24 Sep 2023 23:58:45 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2773f776f49so1291812a91.1
        for <linux-input@vger.kernel.org>; Sun, 24 Sep 2023 23:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695625124; x=1696229924; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35kRZpN0eV1pwbxjmn4F12/cj5Sxbkai3MOsfUot72k=;
        b=epXIt1Mq10JTvlnUCVvCi8fUavWloe3Z/u8dJM9K8Ij1WGaaUmoGM79oMdi81Z5gG9
         47p/bh5CVOLQ420nWoqNods1HGzw/GAypQv8M0xUSpLmN8YzjYcMkt6POvh54OJY42T4
         6OjeDrxoZ0VZoEGWI40KL5wQQbPTp3Polc8rpMMtkeYliiyJZmZ8zIzRLQCG4Jl/YQOS
         yABhTvppz/Yqqode4PC2eBclFJpbmC1sjAS7il6WLC5/mmtQ0UoD+sru/2TuDplLFqYZ
         WhJfSjx/QXTNp5J5eoaEcZkSmVuMVEcCdS1Xurhkf5DcAX6YkVamNVxiuT8nZ6M8VXQM
         tdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695625124; x=1696229924;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35kRZpN0eV1pwbxjmn4F12/cj5Sxbkai3MOsfUot72k=;
        b=Ec8dMlcZMGdrba8BmTXZHxgZ9dvRRD4/IJx7q9MjkuL3v656+Eh3GDqawdJub5R1S6
         pEYVEzg149uQFYCmtKx3cx2LuUPZ4+YP0ILVsPY0yqjthOXDb9NeyhyTRKWICnI1ZqHB
         B2jFqbIip3BxoKFZJw77iibGCiEsTSudzegpLCnjk25iG/HkyGqyukpsg0HaC87W8WQp
         3iq6UXjoUwCcfmGqc4mwV3m93Cfqnuz9xWJY6r1o3IBDTSd0Oj3fA4TM4+/10HKj1qtE
         esXH+5VbYmEk+K8QvF5XUwzTfsq2u+plDoAo1wf/asXGHYWJ2GtLbnsib33TOeiTyvOd
         5Mcw==
X-Gm-Message-State: AOJu0YzOaMprG/rQ7QaqRZn/4SHIf7lagBMYWNTefCn4lL6TNKlcM9c1
        oW7Lisic29LJ+jxTef/JeeFXReflvT684FHHWmM=
X-Google-Smtp-Source: AGHT+IFx57ItwSbdfq3MwKyz4AZNLn0D6sZcfuLtTz8pCKGodI0MIAlg713jh3cFFNqmGQceL1UPH2/5UKS5FuRhQaY=
X-Received: by 2002:a17:90b:512:b0:274:7db1:f50f with SMTP id
 r18-20020a17090b051200b002747db1f50fmr9443143pjz.15.1695625124399; Sun, 24
 Sep 2023 23:58:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:46:b0:6c:7cc4:556e with HTTP; Sun, 24 Sep 2023
 23:58:43 -0700 (PDT)
Reply-To: tony_william2004@yahoo.com
From:   Tony William <mop29530@gmail.com>
Date:   Mon, 25 Sep 2023 06:58:43 +0000
Message-ID: <CA+hPS0w_6Ji0-rc+tW4wJFTxh9GRV7Zjr8pAAqdEz_nwgaFipw@mail.gmail.com>
Subject: Kontaktieren Sie ihn jetzt
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Ich habe die Entscheidung getroffen, jemand anderen mit dem Erhalt des
Geldes zu betrauen, und die Bank hat das Geld ehrlich auf sein Konto
=C3=BCberwiesen. Ich freue mich sehr, Ihnen mitteilen zu k=C3=B6nnen, dass =
es
mir gelungen ist, diese Gelder in Zusammenarbeit mit einem neuen
Partner zu =C3=BCberweisen. Kontaktieren Sie jetzt unseren Pfarrer in der
Kirche. Sein Name ist Pfarrer Patric Lema. E-Mail:
(rev.lema1@yahoo.com) Bitten Sie ihn, Ihnen die Visa-Karte im
Gesamtwert von 1.800.000,00 $ zuzusenden, die ich f=C3=BCr Ihre
Entsch=C3=A4digung bei ihm behalten habe Jetzt bin ich in Paraguay f=C3=BCr=
 ein
Investitionsprojekt besch=C3=A4ftigt.
Meine Gr=C3=BC=C3=9Fe an Sie und Ihre Familie.
Herr Tony William

Kontaktieren Sie ihn jetzt
