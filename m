Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED78454744B
	for <lists+linux-input@lfdr.de>; Sat, 11 Jun 2022 13:39:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiFKLhk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 11 Jun 2022 07:37:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiFKLhj (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 11 Jun 2022 07:37:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 043241C90A
        for <linux-input@vger.kernel.org>; Sat, 11 Jun 2022 04:37:39 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id p18so2204876lfr.1
        for <linux-input@vger.kernel.org>; Sat, 11 Jun 2022 04:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=bu8J/6H5OpP49staf+3m4kPMjBpHuhJQzMAnMDS2ydY=;
        b=Kc0AiT8lOHroWkz5fTlMxPVVTFZ1ZzNXK20lCAY0LqQFbdID7BLcbrCCxc04imFvrr
         JYVuM0b6TVhLsxaQBQMFQqqguKbhYRyIRxGooFR6kVLLTCAEPhBsFNnj58XjVONY7GZ7
         bQyWcZtOoboyOFI7uXcnqs2/+UwRr+OXOOGsVzjiU7msGBIexkWPvd8IKbmDUyVCEu28
         gGYAuslpcqJ+rD44l4azAEc2pwFDlHdVcSaNdKE8awIpThkkiuK1Fu+wnw+qxhWLzv+2
         uQ1FhX3wMdwh54NUi7u5c+AFIlft3xYhHDHTEvg9St0vYDwMDT2C9wFpAe00wJieE2fN
         GswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=bu8J/6H5OpP49staf+3m4kPMjBpHuhJQzMAnMDS2ydY=;
        b=sBjKZJKG+WoZBh0QBdcvbHplCYDxGh13YB3Po03KoiM8+1Isx3KcQ8YwC+wgONGU0b
         qM1S7b3LemqZ3weqSo7SgaOLUrlgPl96sbMMMxfHE34Akpd7a2zf3qSK/y3plllrteJQ
         LSCg2ZJwYm5h7aXG/hyp38v3oW+EJOd4QNzzxqR38Uz+56usNV3L2BXWF+Jm+nR3+LHp
         UusT42vsrNX2VMBNWRU+PVfjA1c0mc2yY9Qtcb8QUvSU1GGjVsMocao5PLvoHubkNvUv
         AAWToHe6ybHmQBGUZVUvEa1LFPeXEo3NS9G3y7IdYymnRVcSfRdDiiWN7SsmEFqYOHqY
         hnPQ==
X-Gm-Message-State: AOAM530zaPjOqIppH/kKSXayiP4e7ZqYCIsnN1cVHNCdXvAvm7NiF8q1
        +OLg5zBzAHRjHhKzkr6tp476hNZi8/h0HNGTh60=
X-Google-Smtp-Source: ABdhPJyP2HLfEc1Pc9KKQAEBCe0uiIbsEAiMAHJqXA3jO6ayxNj/BPRClE4mJAuQ/d6VJuUR8TtoIM5vnrc2aO7QgDk=
X-Received: by 2002:ac2:4c53:0:b0:479:602a:2b67 with SMTP id
 o19-20020ac24c53000000b00479602a2b67mr14717181lfk.438.1654947456783; Sat, 11
 Jun 2022 04:37:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:3e16:0:0:0:0 with HTTP; Sat, 11 Jun 2022 04:37:36
 -0700 (PDT)
Reply-To: mrs.sopheiajonathan@yahoo.com
From:   "Mrs.Sopheal Jonathan" <adewalej67@gmail.com>
Date:   Sat, 11 Jun 2022 04:37:36 -0700
Message-ID: <CAJQy5=zM89rrxwd5Wgyh3x9h9LKvHNwKO4ECB2CrwgUbd30xgQ@mail.gmail.com>
Subject: Hello Dear
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.8 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello Dear

Am a dying woman here in the hospital, i was diagnose as a Cancer


patient over  2 Years ago. I am A business woman how


dealing with Gold Exportation.I Am from Us California

I have a charitable and unfufilment

project that am about to handover to you, if you are interested please

Reply

hope to hear from you.

Regard
Mrs. Sopheia jonathan
