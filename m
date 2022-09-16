Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF8D5BB082
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 17:46:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiIPPqx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Sep 2022 11:46:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiIPPqw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Sep 2022 11:46:52 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B711AF4A0
        for <linux-input@vger.kernel.org>; Fri, 16 Sep 2022 08:46:51 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id u14so8041217ual.3
        for <linux-input@vger.kernel.org>; Fri, 16 Sep 2022 08:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=ZACtpBFNsantQN669grI3IMqqzghQIkyHv9xsa84bWRLmM4167fzbDCd57mE1pDz1e
         7Y3VXtWbpN6PocmZbIzImGM9VYVIZktod8dxCDrA4bFKA7c32WctmaOR/2LCthbrEaOQ
         ZsG+gmpPEE17qaJMgsiWRez/gkTIWOv2kumpFbtxmLeB6bAsKQXAZjYD4z3DyCjFxxcz
         Q9UAabZ/CJ0C5PQniZaiACOxoEAj8Ytbzmr661IRWjXWQ9bWex8yEortBn83ATPbowhF
         fRDCdvPUjdfSSQBhAYKD0aUAdHJIj+FaZl9xhzaJog3Eje63oSfOby8Ldd6zr2EHbBjd
         XxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=G3IUGLwl+O5UjmY6rMJq4wmwmP+NRGqZ3c75UsGfbFx/X48sO6oLg6H2j9Q3hhPt5A
         5f2stismMBp5MYxxE4X8prO5/iinV1XeOxKe1asotnOeFDw4CJZK5CWm9xZe3m5m0Sa2
         pGURl5Dc3uQoo/CFqv9CMgyWLxlK4X6eEurbDnYUc4enchKt/vKc+sTT05U6b6FvWBZL
         kmUUpZPUkXM1mhUtbhuwpOaMesG45oJr2dLSbjA+nsSGzhUfYtLZJgkCs3ois/GDAXw/
         FWKSw/dSUjnyEFSvM14s4K8VB2pLao8pTmcU5pxsMGTGj91Y/n3hm8GBshEphQt7JfAI
         MN/Q==
X-Gm-Message-State: ACrzQf2XxkAxHK83a/a88aeKojFaBOZlDrnvbpRs0jfAvwE0IimZUqEV
        8GWDTfwB6cq5GIOy5GoGsx9oQ5inCSeSf61b2bs=
X-Google-Smtp-Source: AMsMyM4Xtp9SGHZrYrhTYS3IlRFKQsVwZ6CBhzvlrqoANmlHumuKePrn5QZxr8Kpv20Tz1wsQN3DbPgztna5JT/EhZA=
X-Received: by 2002:ab0:15ed:0:b0:365:f250:7384 with SMTP id
 j42-20020ab015ed000000b00365f2507384mr2233156uae.44.1663343210399; Fri, 16
 Sep 2022 08:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:f6d9:0:0:0:0:0 with HTTP; Fri, 16 Sep 2022 08:46:49
 -0700 (PDT)
Reply-To: maryalbertt00045@gmail.com
From:   Mary Albert <alassisidemion@gmail.com>
Date:   Fri, 16 Sep 2022 16:46:49 +0100
Message-ID: <CAG8=QajUaO-dOMZGxu7QH5j7Ki-focRdYAef2W1AkByfWEMidA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
how are you?
