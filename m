Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8B535BA3B2
	for <lists+linux-input@lfdr.de>; Fri, 16 Sep 2022 03:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbiIPBKX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Sep 2022 21:10:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiIPBKW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Sep 2022 21:10:22 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6429D4D244
        for <linux-input@vger.kernel.org>; Thu, 15 Sep 2022 18:10:21 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id w10-20020a056830410a00b00655d70a1aeaso1420634ott.3
        for <linux-input@vger.kernel.org>; Thu, 15 Sep 2022 18:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=6nehn4SZ+N5DitBflpC+8AB9tkDm5FI3qla1CH9afZQ=;
        b=np4RaCUtWX8kie5xR3+NYRsf86Lvh7VeIAMxOuIq718CXvBEpzkcQxvmj9NFJbbq6S
         rB/KC14woUsMii5QWF8gKo11UarH7mCNVB+g4RJwC535+AKQow90KfkgMhuaMWXgbP11
         DgDbOqunTyDTmVVwvrVuZEPV6eVd3I+2j657yHv3/HRNvKL9Pn8d4NjU5G0YxDKpCZ7i
         dOoR26svVf91E2XQHe55THbDma6dsOKMZ+B3IzFmpZrO077svkYkBTCsQq9RlI2IaExA
         RxixVRRIMS+s/o1vUzPVc3r+BqjLTesNL+87vTP6SaKdWJe3/zbEiv8G6UT05U3iFOht
         +9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6nehn4SZ+N5DitBflpC+8AB9tkDm5FI3qla1CH9afZQ=;
        b=R850Knmi27/fGIc/mZpHKO8ZXpbJyGLNvqtk/l6uVK7EVL5Zod6CgVhDYD7aY0LHRc
         ErAYMr872nlwnWgM6NwyuWdksXtS+4oeXPXtdyxz/ymzyVCI25rrIfrEAAvgeuv8Rf7L
         +L0cHS/IW6/Lhrs3f13RxQ3V1lLVZSJepJaBs6evdcxzhcbn5jBB6f2XewN/D4BHryOV
         iwKO97EZ4dJq77ZQlWJLJxlRClteCn3I838Q5q6d/lCZrDPoLaobxTxU08aNSpeIE2bC
         vAiGhFgK+7AiO62x6YGe7Ky+TX76yOG9H93pDN0EhPOpHfO8Hesy6IpGw7q8pRgnLz77
         Q0jg==
X-Gm-Message-State: ACrzQf0mkyN4kxsfcSDmdn+4m+5rp6UacaanccmlO2gw3SkeYKKQSFOm
        OHV/ECxoGPUfuqKLyjAtw1SDXberN8F2YRYNxw==
X-Google-Smtp-Source: AMsMyM6Ip9eJ7x168CMGYhYckHP8WIm7hEZDQ0vUIDP7Xb5FYoinF0pKq2hsipyTSj1ypuXP/4z64t1g9QETj1D31sc=
X-Received: by 2002:a9d:75d8:0:b0:658:fff4:371a with SMTP id
 c24-20020a9d75d8000000b00658fff4371amr1186676otl.314.1663290620391; Thu, 15
 Sep 2022 18:10:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:d001:0:0:0:0:0 with HTTP; Thu, 15 Sep 2022 18:10:19
 -0700 (PDT)
Reply-To: un.loan@unpayloan.com
From:   Tracy Vornan <graceali1977@gmail.com>
Date:   Thu, 15 Sep 2022 18:10:19 -0700
Message-ID: <CAFbUGG8L+5-JUQFZqozCNRsazdebrJoCYaWtFMUsLpK3uABzGQ@mail.gmail.com>
Subject: Apply for Loan
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
The United Nations in partnership with various financial bodies is
giving out loan grants to help qualified individuals and organizations
reimburse their businesses. This offer is available to everyone across
the globe and is targeted at helping economies that has been downed by
the pandemic.
