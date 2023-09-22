Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937E27AB98C
	for <lists+linux-input@lfdr.de>; Fri, 22 Sep 2023 20:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjIVSrT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 22 Sep 2023 14:47:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232791AbjIVSrO (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 22 Sep 2023 14:47:14 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894C1AF
        for <linux-input@vger.kernel.org>; Fri, 22 Sep 2023 11:47:07 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-405101a02bcso8630305e9.1
        for <linux-input@vger.kernel.org>; Fri, 22 Sep 2023 11:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695408426; x=1696013226; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZzwtrYWSSZje7Qwx/j88PGQv9DVLTBbXoxX2uHsmBw0=;
        b=gfjO0DpekPcz50I4JQH8b5p95MISC1mWeZyuwSburwYu03UXD0tNZXeT0N5X/YKubR
         hFkOqXdnhcmVPXsQ/7pMkb9za8+GdGaV9JWyv79gCpq+8M5i4j8JTFx/FfUAjHGSsgeD
         dGuCOWo4rxn8l+ZU7vTIKefZf56ebaX8AsnpujMgGX9qpDJLUeSyNKy1cDpKyuoexYvz
         LV7ofUNulvhF33xUayFE+haOPdmoxH8iLkxt6yx1bi3dW1Z3GSMITEZdk5pSo2IQ2U8i
         ZaGQG1GwYGxtf4sQX0tx2cxtiJrEIILpwa7hHl8b2yZAm0UOPh7QPJQTb/U4SQTD1Lqd
         +kCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695408426; x=1696013226;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZzwtrYWSSZje7Qwx/j88PGQv9DVLTBbXoxX2uHsmBw0=;
        b=Pj217yZoi2vaidvgl1VKpA8w7/gyYSKSo3HQxIH3+8T6luTi04bsIpXZvwqNIr9hYW
         MXG5ow/pwQNhHt+LszJe2V1jv56NAG+4vj2qQ6F2MxE+dMK2qXEyWRepAtQaahclrIF2
         zKxnZ++w3gvwXAjIso6ksi1GfDI0jsACsNT5vQCiP3OeDRdqTw8MWKriYdbIOSy3jAwD
         WvSSwChT1OqGmKoxOoeW9T3QvZTVF8EZmf+ZFaAyRa94SzOMSBJdufh+jYTdMm1LXiER
         uPk+kCXqyBSEO/DPx5yLSB+RudnRZqYnPPWWP+P0ryRkg93A0YrujL1wHSSuD6AFsRHM
         lXzw==
X-Gm-Message-State: AOJu0YzJiXGvCgJxbgIb0X0JLB2O5+PqVJG2oj+QpMkTvqaDgvlFQQuo
        97h50WEhTbr+KIWjDkqQrEBy8Eh3iMh4HzIYuHI=
X-Google-Smtp-Source: AGHT+IE++Wx7TZ6eP9Nc5jsKE2Z+dX5MY5OC/zWfXuJ3BoEdLKjmGg5IKSKGznn5TMHrlMu9wX6WhlbT4Hr/PTtX+vo=
X-Received: by 2002:a05:600c:4d1f:b0:404:74bf:fb3e with SMTP id
 u31-20020a05600c4d1f00b0040474bffb3emr149396wmp.2.1695408425978; Fri, 22 Sep
 2023 11:47:05 -0700 (PDT)
MIME-Version: 1.0
Sender: mayahoumam4@gmail.com
Received: by 2002:a5d:65d0:0:b0:321:6371:5038 with HTTP; Fri, 22 Sep 2023
 11:47:05 -0700 (PDT)
From:   Jane Lily <jane.lilly84@gmail.com>
Date:   Fri, 22 Sep 2023 11:47:05 -0700
X-Google-Sender-Auth: 5UUbawE0BMkJscl2iyvFbaTNJbg
Message-ID: <CAEENv+=9BmORTpSjXN1zPexNkq4hoA7q+9bUQUYYTPxe6XzEOA@mail.gmail.com>
Subject: My Name is Mrs. Jane Lily from America
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=ADVANCE_FEE_4_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_FILL_THIS_FORM_SHORT,
        UNDISC_MONEY autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
My Name is Mrs. Jane Lily from America, I read about you on a reliable
website and I will love to employ you in extending my philanthropic
activities to help Street children in your country. Please reply to
this message via my private email address: jane.lily84@aol.com so that
I will tell you about myself and give you further details. I wait for
your immediate response.

Your Sincerely
Mrs. Jane Lily
