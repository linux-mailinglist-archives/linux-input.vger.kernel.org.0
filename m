Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A288784E99
	for <lists+linux-input@lfdr.de>; Wed, 23 Aug 2023 04:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbjHWCRD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Aug 2023 22:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjHWCRC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Aug 2023 22:17:02 -0400
X-Greylist: delayed 917 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 19:16:58 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E60E4A
        for <linux-input@vger.kernel.org>; Tue, 22 Aug 2023 19:16:58 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-07-64e5539cee9c
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 13.12.10987.C9355E46; Wed, 23 Aug 2023 05:32:28 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=C2lsoOf4pbM75uNMOUTtSYzR83qEPeUPp2/nBjP3XTwRoiHrSgzvgfTlUA9qVgYAF
          fKWHDIGv01sU8gEvniWruifC9kC4vFfZ/mU4t7Q1yhRAN5HegAsG5wbLwMQVn/dFK
          LY4S6Z/vFHR5NBC6gv9NJSuKUpNv80yCfrmYGIaSY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=haS77ge+sDpqvcJNcPLQbFkHC3n+8zSckCFpiupWGf69HBFoyN3LIImVt2uB+GrCT
          Hgr8IRUDX1nPReip1HACkWGyrMgDU8eF1V/qfPpQmTyz6voKPcAMp/Pg0i0QxEqAz
          e+Cqe2LjmdNKBhkq6RyFCFyBvLA1kNZdvV+ngYD2o=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:02 +0500
Message-ID: <13.12.10987.C9355E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-input@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:16 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW3dO8NMUg7+zzS1ufvrG6sDo8XmT
        XABjFJdNSmpOZllqkb5dAlfGknUXWAp2M1e09S9iaWB8zNTFyMkhIWAisfPeHrYuRi4OIYE9
        TBJ3p39hBnFYBFYzS8zf+5UNwnnILDHxymdGiLJmRol7jX1AZRwcvALWEnc3i4GMYhbQk7gx
        dQobiM0rIChxcuYTFoi4tsSyha/BypkF1CS+dpWAhIUFxCQ+TVvGDhIWEZCXuHXEFCTMJqAv
        seJrMyOIzSKgKvHq3DWwiUICUhIbr6xnm8DIPwvJsllIls1CsmwWwrIFjCyrGCWKK3MTgYGW
        bKKXnJ9bnFhSrJeXWqJXkL2JERiEp2s05XYwLr2UeIhRgINRiYf357onKUKsiWVAXYcYJTiY
        lUR4pb8/TBHiTUmsrEotyo8vKs1JLT7EKM3BoiTOayv0LFlIID2xJDU7NbUgtQgmy8TBKdXA
        aDfv2DT7PJ4Nm0oP7ZotPsupwdDHL2mN58ppC2V72i9LO+p35b5b0liygJU/5p3pbLl3eTc0
        9nsK2z07smcJ7z9Z3QVOPefLHBN+fVgsmOC75buO/Ltuaf1o89ev0m+ZXJ/iYvqj1b10VXDg
        3B7/lHlyxpbpjcuXRh5ayPLWesOV01YRtbH2SizFGYmGWsxFxYkAHfgIyz4CAAA=
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

