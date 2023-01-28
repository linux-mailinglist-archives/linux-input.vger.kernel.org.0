Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7793B67FB1D
	for <lists+linux-input@lfdr.de>; Sat, 28 Jan 2023 22:21:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229790AbjA1VVb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 28 Jan 2023 16:21:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjA1VVa (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 28 Jan 2023 16:21:30 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC4383C37
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 13:21:29 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id ud5so22327414ejc.4
        for <linux-input@vger.kernel.org>; Sat, 28 Jan 2023 13:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cCauAobpo9XpCC17lV+JICFK3jz06KDI3m2pTratXWY=;
        b=hTv1X2KVDs/2sh8F37H51W9TqKUd4m1KpEkCvk9LC50UZkIc0OZU31kO/6vDIJZacd
         PPHgt7DtwO3pXiOivuks2pJ0zJ95Az837mvp7GL8SqVtxO/6Ex/8ihht4fc0qulTo3YG
         HJoY0P+mBXhGsthYoTCsv7cmX/jsBQpza6DXyFf8kWPgO6RxS7oALCyIB2LHglw2KZoy
         Cc4t0Z6lz3BjBajHvI9zIXP59yIz2xMUBdyFdBCTPUQi458qe3ec2xIf/pIcHr6nPmGA
         j0wAcVnlyKVMv48FF1WWwf8G6iV0+eodWn4Hkbr4XaKO+P4H1MCKTdhJruEj1t8QuO44
         gr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cCauAobpo9XpCC17lV+JICFK3jz06KDI3m2pTratXWY=;
        b=GBtqXrFP+v0Y5x1uOPwqrm7ubmfaKJRyj1zjS6+X5xrxXCLQ0FPpZqr9vKYRErIHjC
         9Vb9G5atxYU0/Kg1f4YmnfePJdb4CiieE6EmktueG2OM8JHoPPotVqN6cTCBVzcn9bsr
         G+06d0I1advIZGVbM/0ZuAMyXK9BvWEo0zoyRvVifOmo8auehhNhQUFeAmwS8qTrn5eR
         Ic9s2Ri0yM7gWw6Xa5qB3iDpXLv881MV8xqZV/Sal/m/RR6SieUeMITsZ3muQvjXb3OB
         57M0VYrk2gQTf24d65pZ9dTlQzkf9M/cbcpmhU2d9TD8bYHrsSMc4H0RoeTUYtF1EO+I
         vd/w==
X-Gm-Message-State: AO0yUKXQyHHSWBe68XgxShPT/wLrs9BrV+yU2p7sQd4uD4CotaQB+OnW
        lg2T8XePpEB+6z8y8KB7IX9XpidLh1blkm6pjfQ=
X-Google-Smtp-Source: AK7set9yMlSDqnwoVoT6cpy5cT4l6NjYrSEmUVzP+lli6Opjt4dYXeEitCeJ8I0q0/Cd2oxDfHO33n5BjFLI1HUOP6g=
X-Received: by 2002:a17:906:3993:b0:878:4cc7:ed23 with SMTP id
 h19-20020a170906399300b008784cc7ed23mr3244835eje.14.1674940888204; Sat, 28
 Jan 2023 13:21:28 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:a465:b0:46:c987:4b6c with HTTP; Sat, 28 Jan 2023
 13:21:27 -0800 (PST)
Reply-To: wu.wuheadofficewu.tg@gmail.com
From:   WESTERN UNION <wu.wuheadofficetrs.wu.tg@gmail.com>
Date:   Sat, 28 Jan 2023 21:21:27 +0000
Message-ID: <CAP1G6Fii_fAmUEZ-5mJBQHEkRgVCDUqhjq2Py2n+xQKJKSk5ew@mail.gmail.com>
Subject: =?UTF-8?B?UG96b3I6IFbDocW+ZW7DvSBwxZnDrWplbWNp?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: Yes, score=7.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:644 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [wu.wuheadofficetrs.wu.tg[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  3.1 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

UG96b3I6IFbDocW+ZW7DvSBwxZnDrWplbWNpLA0KDQpCdcSPdGUgaW5mb3Jtb3bDoW5pLCDFvmUg
anNtZSBvYmRyxb5lbGkgc2NodsOhbGVuw70gc291Ym9yIHBsYXRlYiBvZA0KRkVERVLDgUxOw41I
TyBNSU5JU1RFUlNUVkEgRklOQU5Dw40gdmUgc3BvamVuw60gcyBNZXppbsOhcm9kbsOtbSBtxJtu
b3bDvW0NCmZvbmRlbSAoTU1GKSBvZMWha29kbsSbbsOtIG9ixJt0w60gcG9kdm9kdSBhIHZhxaFl
IGUtbWFpbG92w6EgYWRyZXNhIGplIG1lemkNCnV2ZWRlbsO9bWkgb2LEm8WlbWkuDQoNClDDrcWh
aSB2w6FtLCBhYnljaCB2w6FzIGluZm9ybW92YWwsIMW+ZSB2w6FtIGJ1ZGVtZSB6YXPDrWxhdCAk
NS4wMDAuMDAgVVNEDQpkZW5uxJsgeiBuYcWhw60ga2FuY2Vsw6HFmWUgemRlLCBwcm90b8W+ZSBq
c21lIGRvc3RhbGkgbWFuZMOhdCBwxZlldsOpc3QgdmHFoWkNCnBsbm91IGtvbXBlbnphxI1uw60g
cGxhdGJ1IHZlIHbDvcWhaSAkODAwLjAwMC4wMCBVU0Qgb2QgTWV6aW7DoXJvZG7DrWhvDQptxJtu
b3bDqWhvIGZvbmR1IChNTUYpIGEgRkVERVLDgUxOw41ITyBNSU5JU1RFUlNUVkEgRklOQU5Dw40u
IFZhxaFlIG9zb2Juw60NCmlkZW50aWZpa2HEjW7DrSDEjcOtc2xvIHBvc2t5dG51dMOpIHTDvW1l
bSBJLk0uRiBqZSBDUFAwOTIwVEcuDQoNClpkZSBqc291IHBsYXRlYm7DrSDDumRhamUsIGt0ZXLD
qSBwb3XFvmlqZW1lIGsgcMWZZWTDoW7DrSB2YcWhw60gZGVubsOtIHBsYXRieS4NCg0KSm3DqW5v
IG9kZXPDrWxhdGVsZTogRWxhaW5lIEpvaG5zb24NCk90w6F6a2E6IFBsYXRiYQ0KT2Rwb3bEm8SP
OiBBbm8NCsSMw6FzdGthOiAkNS4wMDAuMDAgVVNEDQpNxJtzdG86IExvbWUNClplbcSbOiBUb2dv
DQoNClBPWk7DgU1LQTogTVRDTiB2w6FtIGJ1ZGUgemFzbMOhbm8gcG8gdmHFocOtIG9kcG92xJtk
aSBhIHBvdHZyemVuw60gaW5mb3JtYWPDrQ0KbyB2YcWhZW0gcMWZw61qZW1jaSwgYWJ5IHNlIHDF
mWVkZcWhbG8gY2h5Ym7DqW11IHDFmWVub3N1Lg0KDQrEjGVrw6FtZSBuYSB2YcWhaSBuYWzDqWhh
dm91IG9kcG92xJvEjywgYWJ5Y2hvbSBtb2hsaSBwb2tyYcSNb3ZhdCB2IHBsYXRixJsuDQoNClbD
ocWhIHbEm3Juw70sDQpWZWRvdWPDrSBwb2JvxI1reToNCg==
