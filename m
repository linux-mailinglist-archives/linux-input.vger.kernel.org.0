Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 125574EA462
	for <lists+linux-input@lfdr.de>; Tue, 29 Mar 2022 03:06:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229528AbiC2BFh (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Mar 2022 21:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiC2BFh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Mar 2022 21:05:37 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9908D639E
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 18:03:55 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id 5so27703030lfp.1
        for <linux-input@vger.kernel.org>; Mon, 28 Mar 2022 18:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ut6/8hZdrXD6w/oKBdhI6ASQdLFjjPrfHdMT0KxbqNc=;
        b=Q9DxsFzTxtnXUjJcNfoqSwU9EeguB7NnHpw5VATApO+dkF19Zp4ihOwcB2UAo/1JFU
         XBS5X/KlGH1I3Nd3ZFGi/X10/Th52J3+oVVGrnMvIhGTM+BF+3QPVzD3oIm27UlbYZ/F
         VmkULRI8mIf2dwmCmyugT7/pDgy3Y7iwKY+iiR3oHFjXvmDzrnFC0fJTmRQR+c+hIuOS
         wtMw+/vPD+gh1Yb5LnAMspiO7NMQVyhSnaIDD/sqf4MnH5KjpWnKS/r346A1hN7PQeh+
         dnv+3P7n1xkUY9wBdhCpL2SYJne6+/V78bhQ9yGHSSzOlm8Cc+hvDZSsf/T0srxieAmy
         KQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ut6/8hZdrXD6w/oKBdhI6ASQdLFjjPrfHdMT0KxbqNc=;
        b=W7IfdCbgIMzCsNge8HE7mAW+o8iA3Xdjj4TsgdnHKhB8GBH+tEFAh0wunHXejVfmkH
         9e2evaaLy0iheaWjmJvIfjEqBga9ySx9iGAt5k5qGpaSs6EwCuPjQKwP9dopRSJ3v515
         4M/lw13E67znxUSDwyPCHXlPe4y07e65AyvTu+FQakst7sPlktAqSV67b9nuC2R+4Z2r
         8FePF8kPV0r0oI/L1X3JP/K8PLGhbSaPQ5My2E0E20JW4w3rnlv3FWicGWtAxLdzFq4X
         COaLn1KPGKOZJSOGeUOvlPzbq9Sj8m830P4+K8F2XYMwHjLrMPPSpupTlTgtMAu9Iu3B
         oodw==
X-Gm-Message-State: AOAM533FdpKNq1YVbxaipjyVbUSctJMW21TJolwOTSKXqo/1C85YUJ7g
        9tRX85G+eBriAtwtFP0ZBDQsqwV99YHIMB2ePwxeJqX6c05ICw==
X-Google-Smtp-Source: ABdhPJxvJ3d/GmuzRjeOdM7wmWKMWpuGrDsteCLwFbaB+W4h9FhrTLk/XgrM3ri9JSdHR5ndo3Qxh74Ui2FQy3NPFA8=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr31129973ejc.636.1648515475429; Mon, 28
 Mar 2022 17:57:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:76b9:b0:6df:8386:dfcb with HTTP; Mon, 28 Mar 2022
 17:57:54 -0700 (PDT)
From:   TORGNY LEBENBERG <torgnylebenberg35@gmail.com>
Date:   Tue, 29 Mar 2022 01:57:54 +0100
Message-ID: <CACyUgj+ToDpgEhLK7JgEFYiYTfj_P7wgCscPQ7cQp+QK2MG8xQ@mail.gmail.com>
Subject: CONFIDENTIAL
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.9 required=5.0 tests=ADVANCE_FEE_4_NEW_MONEY,
        BAYES_50,DEAR_FRIEND,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,
        MILLION_HUNDRED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:144 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5005]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [torgnylebenberg35[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [torgnylebenberg35[at]gmail.com]
        *  0.0 MILLION_HUNDRED BODY: Million "One to Nine" Hundred
        *  2.6 DEAR_FRIEND BODY: Dear Friend? That's not very dear!
        *  0.0 T_US_DOLLARS_3 BODY: Mentions millions of $ ($NN,NNN,NNN.NN)
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.4 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 ADVANCE_FEE_4_NEW_MONEY Advance Fee fraud and lots of money
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear Friend,


I'm Dr. Torgny Lebenberg. Contacting you in regards to a Claim of
(Eighteen Million Two Hundred Thousand Dollars) $18,200,000.00
connecting you to my late client.


Kindly respond swiftly.


DR. TORGNY LEBENBERG

LEBENBERG ADVOKATBYR=C3=85 AB.

Attorney at Law; LL.M.; Partner

Address: Grev Turegatan 44, 114 38

Stockholm,Sweden.
