Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6138B782EFE
	for <lists+linux-input@lfdr.de>; Mon, 21 Aug 2023 19:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235557AbjHURC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Aug 2023 13:02:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231658AbjHURCx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Aug 2023 13:02:53 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129AEED
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 10:02:52 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2bcb50e194dso27539361fa.3
        for <linux-input@vger.kernel.org>; Mon, 21 Aug 2023 10:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692637370; x=1693242170;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zYLKMzgHofES2SxyyPDOxTq+zmzu+ok6jUwXmUWniOQ=;
        b=kEs2KdHKjdN0Y/ppWN0OwfiKduihg/Iku51EMZhivpIQTtf0dU2gU/JO53Ge7DM947
         06FusbBIQYVrzj0A/jG9sEhdhLT9Mcv+SM3+TiYvjh/CSW/VYxpcJFtubU2lMo+X9Zne
         qXwNYa9IoYHIOTC07y0jkVSgNTEJSIAduhahz36+qJ6g+q+poApBLJul4HDcJsrGFtnW
         uR9QnALXB1Yhej+QRp9PkS4ZMnhWEmhxj4CQJlgGZ8FWt06VfNytp60+k3AmkAXvYMtV
         tFpwyrmS3LQQTShAXcE2YqwN/hKzt5UdfY2tbTA/lPFAy6s/ET+fjfoNMrv9IpEfGAOP
         ovSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692637370; x=1693242170;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zYLKMzgHofES2SxyyPDOxTq+zmzu+ok6jUwXmUWniOQ=;
        b=kDA7/rDIcLbcbFPI6DHj+DMtuZRsEHaY/NAjKsIPu6x60z09EAvc5jEtYOFXuOkz4w
         V4+DJ1k6BDhlXUx4YhOow62BEv+nvssQYlR/f9+8dOihIZDbJACb2qpNLFazjLV6Nall
         GdYs/t3XB2LyfPbumTEKKjatNHZBUr7pu9wIsarwLokJYo5Cspbx6HgIsvSykd60Vih7
         sQoJzLZtK0e1v7IDlXtFvVxDJ1eG9sqDba9igFbnwQxPM+NA33MsLuX1gemezedg79Q4
         wF8WbUTKPVE7YMV2gGTMxjkaxngbl12KoPAjVHrNzUjNRuBUj7PNZYo2aC81r90cOFJl
         kLyQ==
X-Gm-Message-State: AOJu0YwDsUCvGtFTJAaSl9knGtP1H3Al91XDxwTZ07Cc5rSC+ZYrrzky
        a5643n9t3uEdHb+Z1Y+zibgfHxGskanb+WgRlRM=
X-Google-Smtp-Source: AGHT+IFeWrEmDNitJnMWXauo6fVMJ6Ad3mbUOGwhzkNmSCd/ONU+DQAcI/2J3M6LLXficDHmkgjFFHDhjpjLnbw/gHs=
X-Received: by 2002:a2e:8246:0:b0:2b9:3523:6f20 with SMTP id
 j6-20020a2e8246000000b002b935236f20mr5101782ljh.51.1692637370034; Mon, 21 Aug
 2023 10:02:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6022:33a1:b0:43:18c6:e008 with HTTP; Mon, 21 Aug 2023
 10:02:49 -0700 (PDT)
From:   Peter Nancy <petenancy0101@gmail.com>
Date:   Mon, 21 Aug 2023 18:02:49 +0100
Message-ID: <CAKqpZnudGoGhr_HKVUPaqy0wwnpT246WC7AZwt2VJS0p3O+LUg@mail.gmail.com>
Subject: Mein Freund
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_2_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,LOTS_OF_MONEY,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 RCVD_IN_DNSWL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
        *      DNSWL was blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [2a00:1450:4864:20:0:0:0:22e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [petenancy0101[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [petenancy0101[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  1.0 FREEMAIL_REPLY From and body contain different freemails
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.0 ADVANCE_FEE_2_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Mein Freund
Ich m=C3=B6chte $ 8,5 Millionen, die ich von meinem verstorbenen Ehemann
geerbt habe, an Sie f=C3=BCr die Waisenhausstiftung in meinem Namen
spenden, weil ich krank bin und damit nicht umgehen kann.
Wenn f=C3=A4hig und interessiert, schreiben Sie zur=C3=BCck auf
(nancypeters02@outlook.com) f=C3=BCr Details.
Frau Nancy Peters

xxxx ENGLISCHE =C3=9CBERSETZUNG XXXXXXXXXXXXXX

My friend,
I want to donate $8.5 million I inherited from my late husband to you
for orphanage foundation on my behalf because I'm sick and can't
handle it.
If capable and interested write back on (nancypeters02@outlook.com)for deta=
il.
Ms.Nancy Peters.
