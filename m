Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36D88586159
	for <lists+linux-input@lfdr.de>; Sun, 31 Jul 2022 22:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238141AbiGaUij (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 31 Jul 2022 16:38:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237675AbiGaUii (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 31 Jul 2022 16:38:38 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30DA7A469
        for <linux-input@vger.kernel.org>; Sun, 31 Jul 2022 13:38:37 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id 125so9386711vsd.5
        for <linux-input@vger.kernel.org>; Sun, 31 Jul 2022 13:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YKokgaNBFzwRcXPgIXJHrC3hmjS4PtmpfoKAQSaSgfU=;
        b=jaBSIUC87bQMCwuZqdS9BJLFJ7tuYrklWNRHpQs3RwinUkEzoiSv9PD0zI8faJtpVR
         6X5m0NzIYFa7zg+CEfqFQOkPtU3n+gC/yx+si5oGYdhxBy1T7CMR7a3kKtzA1Co1nXr9
         Upr4CaSjyU55ojViAlsVHT+6q2gfqzwv1jJhLYNY3NOk+tnyG5zZNr7kk2eXLOqGkcy8
         MOKK/T2IrqxuQT5eialJey4IehIdF4p+BGFLTjcCQnsIWfWPNT6n2/XbsRul7JeSHAv/
         RybHWbfQu7GrSGj7PyqIcYAfo9yMJgVmcrWSds56Od8I47Uzev+rDmoR21uv6M0MwytL
         iBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YKokgaNBFzwRcXPgIXJHrC3hmjS4PtmpfoKAQSaSgfU=;
        b=lLnPooKakNBNrBdcH2lFbf9QtxAcyvwecGucGIxW+cy+9DxqDculS64FAUZ/UbmybI
         jIdoj6Sb66JqVS024tAfeogAxD2fUQqJGEtlAg5gx6pl/Lz10mDeCpPL/YYJk1T2PMVP
         23m96mHwfo+mV9KxS9qeJ85UoAt/KOfwDqs6LhJSi/QY7AGj2QUNfA3DHqq1eH/2EXL+
         pahQ71KvHUFpxw/OSb4wLVA9KEDOUZ3a3XzkZde3sxKJCAYRIYMyV2MEXp0zuAw6IAVY
         tZRR1//CEG88KyTtG1pgzKqYWLYoUS3SumCy79gbfCR2nkl62WrpGTMRGNIhywHIGthh
         XzZw==
X-Gm-Message-State: AJIora89cqe12bBJUBdRvyxEJNcHefruXKgs1G1yr7jHig4qXJcGYapq
        Umm9SVngfKgBIkrJVTErvGpiTaXTQeQLx2QeNFo=
X-Google-Smtp-Source: AGRyM1uy/sdJ7aIXpIztKD+xDnyMMzuII3Uh12ndvWYXoUHRYDpeGgVxCtiCtIWksJElJvlovBgAobMAoOtW7U5xEkc=
X-Received: by 2002:a67:d882:0:b0:358:5a42:e8d4 with SMTP id
 f2-20020a67d882000000b003585a42e8d4mr4343110vsj.82.1659299915870; Sun, 31 Jul
 2022 13:38:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2046:0:b0:384:6af8:a9a1 with HTTP; Sun, 31 Jul 2022
 13:38:35 -0700 (PDT)
Reply-To: xu.cn99@gmail.com
From:   =?UTF-8?B?5b6Q5YWJ5ZWf?= <lauming2019@gmail.com>
Date:   Sun, 31 Jul 2022 21:38:35 +0100
Message-ID: <CAMg_Kzd_sOt8Yb0xkBO-sOqFqMs7O2OQHFHquwr6PwauC7KsPQ@mail.gmail.com>
Subject: Mutual Benefits
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e30 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5014]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lauming2019[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [xu.cn99[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lauming2019[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hi, am Xu from China, We are still  funding any pending project /
business and if you are still interested in us, funding your project
then let us know to enable us to give you the terms and conditions of
funding your project for 2% interest rate yearly with a 2 year grace
period through 15 years loan period.
