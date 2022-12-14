Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6170164C1C4
	for <lists+linux-input@lfdr.de>; Wed, 14 Dec 2022 02:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235762AbiLNBXa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Dec 2022 20:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236149AbiLNBX3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Dec 2022 20:23:29 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D0E264BC
        for <linux-input@vger.kernel.org>; Tue, 13 Dec 2022 17:23:29 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id u15-20020a17090a3fcf00b002191825cf02so5460732pjm.2
        for <linux-input@vger.kernel.org>; Tue, 13 Dec 2022 17:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbxBc33A94M2aID6Eun0OEflR/h/t0nbS2BADxZCW1I=;
        b=aKt35Oe2/IarWAz7dww9HuWdIuJLp57XYVDWd1qM9/UZML/I+UZyC3oweCQ5Iyu97Y
         Jf55mRSiBtZsrw6I30HV3zOCA5aebuJ25VWDLCpz3/1bT25VyEkgOw+0uYb0MqMUBmaQ
         4MUE9VBtqahMq4VPd22y0F55XSgNn5aPiYo54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IbxBc33A94M2aID6Eun0OEflR/h/t0nbS2BADxZCW1I=;
        b=WBm8yvLZzcVo1ajQJmib/NzgJeuxcZ9LrbrliRrc97L8/lVU+7vXTwCfSHkVhMBRPd
         hw/nHuHGmw51i8EQiWuwwuD+nHxIK6TH4NSWelS91VM7r1U3/ItdoLwn90yVM/boa0E3
         XeL6iXNdiKQYd/DlPK3IaBkbV0hI2b9d1l96sORibQkH85PlQW/gOpba11JEa75z7gcy
         TkXbZfSQtuk8i0M2kpa0j0Y06zgL1TPxsZtCTwH2Ef1vdihviitcAyTv1WFYZIUjZt1A
         C2exmk399uZnKJLW2FzlPhP2gNcDpRcuT9QTkXI1LkHaF5Gw8+DLcH1sHpkFOVjvpc1h
         tphQ==
X-Gm-Message-State: ANoB5pl3rm4vqlJh1cXBUfSvqYbsaDzjdcFfKo7MdufNbxHGxKu/7u4u
        p5K0e3TZSyjQ6rysnZaDRFtfYg==
X-Google-Smtp-Source: AA0mqf5Ho1Q4XXNGQaB6DvKwitZGIHYF3CeIeWRSMM/mTUZuHv4spseFwbPkn0XQwTXj32i5Sv8pIQ==
X-Received: by 2002:a17:902:d717:b0:188:fc68:d366 with SMTP id w23-20020a170902d71700b00188fc68d366mr23462157ply.40.1670981008962;
        Tue, 13 Dec 2022 17:23:28 -0800 (PST)
Received: from jingyliang-input-linux.c.googlers.com.com (30.202.168.34.bc.googleusercontent.com. [34.168.202.30])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709027e8500b00176a2d23d1asm537423pla.56.2022.12.13.17.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 17:23:28 -0800 (PST)
From:   Jingyuan Liang <jingyliang@chromium.org>
To:     bagasdotme@gmail.com
Cc:     benjamin.tissoires@redhat.com, dtor@chromium.org,
        hbarnor@chromium.org, jikos@kernel.org, jingyliang@chromium.org,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        seobrien@chromium.org
Subject: Re: [PATCH] HID: Add Mapping for System Microphone Mute 
Date:   Wed, 14 Dec 2022 01:22:22 +0000
Message-Id: <20221214012221.3559254-1-jingyliang@chromium.org>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
In-Reply-To: <Y5f9wmKPQrYYFGuz@debian.me>
References: <Y5f9wmKPQrYYFGuz@debian.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SORTED_RECIPS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Thank you for the comment. I made the change as suggested and uploaded another patch v2. 
