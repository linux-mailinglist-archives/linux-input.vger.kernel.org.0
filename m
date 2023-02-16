Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40114698A38
	for <lists+linux-input@lfdr.de>; Thu, 16 Feb 2023 02:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjBPBrN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 Feb 2023 20:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjBPBrM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 Feb 2023 20:47:12 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C75120
        for <linux-input@vger.kernel.org>; Wed, 15 Feb 2023 17:47:11 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id j184so491343pfg.10
        for <linux-input@vger.kernel.org>; Wed, 15 Feb 2023 17:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DKmwdnjptlHS0eWr7+8xWL7z/P8PnIWHMnTI5b4Snlg=;
        b=KMRDl7NKxhMgGs5mTs/1OcEDZ7+Iy5p5fy57l9F7bmC4kee0NWnOgcmLsi1FVgfXLF
         Y3E6bzF1AWOkGaDeq6CJCXjjzna/NggIJpX2eVgF3zZNPUHsIKmaukQLSC7nl1Ez5mLW
         qJb7i5d9HdWm7QbyTQGsUCIOUAIbbj1yf/WKGrTKyhoNQMlsTnxRTP2+1x/WpUQ9E6BY
         ykUT0dvrbdHQrtDbk+MI4J0Cq1HqEdclEd+QjMsoYS7LbUvWLXaz306KvPdM6JG920LN
         aDOax+vUSuARegmcdDaHlut/wc4BNep6/eiKNNfFRgef8zYoWYuPob55E/P4FQDf4t3x
         LNsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DKmwdnjptlHS0eWr7+8xWL7z/P8PnIWHMnTI5b4Snlg=;
        b=w+n2MRGcyoH7h5rkM+ja/Q9Gsboa+2KGmihpEVOQius/LRzK0RDXajx0WpMlhfHcYr
         VyhVP/xQWYk1UBihP1JMUWtf0xJ+PZfW3D1PycKFZhd3w5v+JtTp4rIG107q+UcbAX+4
         eFTsY2+tpiofiQX1wTZeH1anDuiKgXERJ9zOLHl0XH/u+OC7EpZBBn/hYtBSXPk+WE4w
         brJxCRw74VDUiSJDAYn1hu+wogxA9BSLURYYzRUTD4KcLtlsf0kD5pK+x232PUlhUYRA
         w6neeZuZFp5nNR60LK/ixIKa/JbmaqXMbAGMx7WwUrysCyp54Lng/jojgihTLBtyCe4s
         9zIQ==
X-Gm-Message-State: AO0yUKWwSq1h/MoUWqneB/u416Ch5tWb79qiA3v5E1dH7pM5biHhVgZG
        2n80rYEQgPQZx6UIvuuou202b5qTF0ACZ24rbGI=
X-Google-Smtp-Source: AK7set/Rcf/8DaXzDUL3cZqvrKjdjlSsiJFOoW3FJwkhNS9jLx5+V23t3moCzkia95g1IbEa5Iromu3oyJWg60xFYHA=
X-Received: by 2002:aa7:980a:0:b0:5a8:be15:db17 with SMTP id
 e10-20020aa7980a000000b005a8be15db17mr780555pfl.52.1676512030714; Wed, 15 Feb
 2023 17:47:10 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:2587:b0:412:6f49:8 with HTTP; Wed, 15 Feb 2023
 17:47:10 -0800 (PST)
From:   SFG FINANCE <geromerimoud@gmail.com>
Date:   Thu, 16 Feb 2023 02:47:10 +0100
Message-ID: <CAMiCp+3h7qOB6X7ocBJ-v_pfQLJQHtc7-Jp0J158xBiDiG3yew@mail.gmail.com>
Subject: =?UTF-8?B?SsOTIFJFR0dFTFQgS8ONVsOBTk9L?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        FUZZY_CPILL,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

--=20
J=C3=B3 reggelt k=C3=ADv=C3=A1nok
Nem kezdem an=C3=A9lk=C3=BCl, hogy eln=C3=A9z=C3=A9st k=C3=A9rn=C3=A9k ez=
=C3=A9rt a kellemetlens=C3=A9g=C3=A9rt.
Madame Dani=C3=A8le TASSE vagyok, nyugalmazott nemzetk=C3=B6zi k=C3=B6ztisz=
tvisel=C5=91.
Egyed=C3=BCl =C3=A9lek csal=C3=A1d =C3=A9s gyerek n=C3=A9lk=C3=BCl, mivel a=
 f=C3=A9rjem =C3=A9s a gyerekeim hal=C3=A1los
balesetet szenvedtek.
Jelenleg v=C3=A9gst=C3=A1dium=C3=BA daganatos betegs=C3=A9gben szenvedek, e=
z=C3=A9rt szeretn=C3=A9m
felaj=C3=A1nlani a vagyonomat =C3=A9s a f=C3=A9rjem vagyon=C3=A1t, mert ez =
volt az utols=C3=B3
k=C3=ADv=C3=A1ns=C3=A1ga.
 Ez jelent=C5=91s =C3=B6sszeg, amelyet szoci=C3=A1lis munk=C3=A1ba kell fek=
tetni.
Ha =C3=96n komoly ember, k=C3=A9rem keressen meg tov=C3=A1bbi inform=C3=A1c=
i=C3=B3=C3=A9rt az e-mail
c=C3=ADmemen: daniele.tasse07@gmail.com.
Szeretn=C3=A9k egy komoly =C3=A9s j=C3=B3 lelk=C5=B1 embert tal=C3=A1lni, a=
ki j=C3=B3l hasznos=C3=ADtja ezt az
aj=C3=A1nd=C3=A9kot.
Bar=C3=A1ts=C3=A1gok
Daniele TASSE asszony
