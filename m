Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 247BE57DA7B
	for <lists+linux-input@lfdr.de>; Fri, 22 Jul 2022 08:46:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbiGVGqD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Jul 2022 02:46:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230089AbiGVGqC (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Jul 2022 02:46:02 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0939128E0F
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 23:46:02 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t1so6180297lft.8
        for <linux-input@vger.kernel.org>; Thu, 21 Jul 2022 23:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Xg0RNZPbDQktpj3qxyH8Dhzf5Jva7bt25SqoYhjmFSQ=;
        b=cBhtbIk/55qauBwb+F52loj0jQ124FWRmtU2ZmANCiVd/2L72qdErZxRqWhDDmvI2q
         5AjDozk5eBHmtvLMc8v/eIuwHnhAvI+rD8CdEPTtZrV3pI9w/lHkqD9onKyhCscT796Q
         6WIk+e0LVAj8Un0IaknwiiDotRBVTG8W/jGfhgcbDqjZVFeSsTHDP83SPDSp0b4+6qaw
         dECAbZ9CxAtp3qFvhBGoXNtG4zQWAzKzD1dSxIksgXwSaFx9erMWobHqffKqwGeUkXWv
         p46o+v1cxYDjjaRrTciVXqPBacvKAsZRo6zFHVydKRk5kwbmhDY4CvZNirKplFBXaGpd
         Kvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Xg0RNZPbDQktpj3qxyH8Dhzf5Jva7bt25SqoYhjmFSQ=;
        b=opqeFVmBX+s9Zg5ffhoJWNBwJ3bbbnjn9aA2/WzdIN9oeCDNpYX9llLz15DAUjOkms
         9NR3KaLrHoo5O6z4qClpNK1WU7rNRtkDRF8ACnyUUfVBPQAhUZ0JRgddFATNqjm6mfVu
         1RUSZGpxlytrH8+FGnQpj/ichZtq5swY21GDfDXIXBlVjokivy45mrfLvLXnVjQb1z/N
         +589dnP3SdWVGwbEcN0iHUAHPuPFlEUlCmLgWF7x+MfTPx6xpGSlCSwG7SpFPQwAX8yG
         3pP/hiB0SsVRFm8ui8FIb4iE6kSg5OTeeJmNZ4Tm1A/WNwt8QYnXOzhv+xlHpKZkQreU
         aozg==
X-Gm-Message-State: AJIora/i8uGj6Trd9ycuH+i3p9WmP6wtHI0Hxri5obIK744/UKL8qJT5
        U0vjT27/PQcTmvwlDLyu3M6nEVSai/0L2daP7J0=
X-Google-Smtp-Source: AGRyM1uvGIaCaL3+6njKKAn2PLfkLubdDKle9kCivNpoJkwcRSEHkRMISqh5jANQRLbuUZtvBjv+o5lLNa9K2h9m6Sc=
X-Received: by 2002:a05:6512:318f:b0:48a:fde:d30 with SMTP id
 i15-20020a056512318f00b0048a0fde0d30mr855619lfe.610.1658472360009; Thu, 21
 Jul 2022 23:46:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:4d49:b0:1f9:5032:d604 with HTTP; Thu, 21 Jul 2022
 23:45:59 -0700 (PDT)
Reply-To: royandersonCCB@outlook.com
From:   ROY ANDERSON <rrhjghj@gmail.com>
Date:   Fri, 22 Jul 2022 02:45:59 -0400
Message-ID: <CAD8YKQQToBB-sXXAyoDs=HrRYwXAv-AGe8yOZ1NcbbTDZC3e8Q@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

My name is Roy Anderson. I came across your contact and noticed we can
be of value to each other. I have a proposal that i want to share with
you.

Your prompt response will be appreciated for more details.
Send reply to email: roy.an.erson@outlook.com

Sincerely,
Roy Anderson
