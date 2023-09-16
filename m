Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3107A2D18
	for <lists+linux-input@lfdr.de>; Sat, 16 Sep 2023 03:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbjIPBpR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 15 Sep 2023 21:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbjIPBo7 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 15 Sep 2023 21:44:59 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F386E71
        for <linux-input@vger.kernel.org>; Fri, 15 Sep 2023 18:44:54 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-1c44c7dbaf9so4184505ad.1
        for <linux-input@vger.kernel.org>; Fri, 15 Sep 2023 18:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694828694; x=1695433494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7a3wx8Q+2ppOU2arabtxkaAxNJZ27n6hO/oCJCvuTfg=;
        b=CIChToL5vafS9XNkTQHu85aQzVJJ1xu905dUsYI4Evr7Sco8Dd+yS2RxFsNpIrsc44
         E29YMSvxyuay+FbWnLC42E9ipkwLq2urlConlnRIon6s8Tn4mL+aHZnz9p1W+zMBmDaV
         AoJK9wAt2DZY6j+RNhGc1wR5frqoFT0pkSQOw8vTNdaENnFEYnWA0tOilfoYUIPGoESh
         Vt9xs2R/jgZyyWu8ATGbXQQcufuCJ18aPOajNK7GxYRo/8YcXQ2m5MAq6Ji5VGF+fCit
         5Kg/esSHG0z1GqXoJG9+brlwmDCv6Pn0rezC2OUjGfwV/S4Yin+HNkLNIvYQCgxlMTsO
         uf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694828694; x=1695433494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7a3wx8Q+2ppOU2arabtxkaAxNJZ27n6hO/oCJCvuTfg=;
        b=IAkpCJAa5vjH7I1hvhdYefV6pLI28pMuzFYTb3PPxFz9+ngV3Zhquhf1ciuLyuMInD
         3p6paghNqXv3BL657QjG9ki7nETkMiJa88Sd43HYrN7PPHNO+EzUywCkzglbdT2hUcWP
         9Ts/JFDv722tVVsg66VTt7ZGt889NL1RPN5+jpDnwkFM/Het9UUmCFC6NdTrdbxDjxMS
         laGVrHpPV3OIPznh00an6H+MNFcC78fE2kLGhKfJQUmAcKZeHmHFkyaqA6O11pdDoWNd
         zWtUP9J5F/HAH9hFlIdyRzbn7XVYUgXxMsW0QsRxxuxbebp3YlBdcIVRYyzVsa8bX8qq
         s4Bw==
X-Gm-Message-State: AOJu0YyUT9hiKDUfs/wOpgCjFk+0aMAbGsNWLQ6Ema3pYCqH5/N/4QCX
        4loqZhHtXZIatWwyJpaXX1w=
X-Google-Smtp-Source: AGHT+IGSL36YcyHB90bGym1jwFfRyzPHLMeM7Hd69nDdQj+uUlD7QUBDiTeAFpwfKeCBGeaXEY4MdQ==
X-Received: by 2002:a17:902:7081:b0:1c3:ed30:ce0a with SMTP id z1-20020a170902708100b001c3ed30ce0amr3367539plk.19.1694828694060;
        Fri, 15 Sep 2023 18:44:54 -0700 (PDT)
Received: from google.com ([104.129.198.114])
        by smtp.gmail.com with ESMTPSA id n4-20020a170903110400b001b9da42cd7dsm4053139plh.279.2023.09.15.18.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 18:44:53 -0700 (PDT)
From:   HP Dev <hphyperxdev@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     maxwell.nguyen@hp.com, chris.toledanes@hp.com, carl.ng@hp.com,
        linux-input@vger.kernel.org
Subject: Re: [PATCH RESEND] Input: xpad - Add HyperX Clutch Gladiate Support
Date:   Fri, 15 Sep 2023 18:44:52 -0700
Message-Id: <20230916014452.5241-1-hphyperxdev@gmail.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <ZQTEZEdd7xwHz9CN@google.com>
References: <ZQTEZEdd7xwHz9CN@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry,
That should be ok.  Thanks again for your support.
