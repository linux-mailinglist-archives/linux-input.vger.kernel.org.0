Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7122E64167A
	for <lists+linux-input@lfdr.de>; Sat,  3 Dec 2022 12:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229475AbiLCLnl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 3 Dec 2022 06:43:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiLCLni (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 3 Dec 2022 06:43:38 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C64B15FD4
        for <linux-input@vger.kernel.org>; Sat,  3 Dec 2022 03:43:32 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so2509096wmb.5
        for <linux-input@vger.kernel.org>; Sat, 03 Dec 2022 03:43:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bi0yWT3OhoMfJH/bqqEiaAv6/XA2NcRx7Xz7oUslWIc=;
        b=iL7mVDUKnExgIaxLnx9x2upHFl4VebTQUyRV9qSTK2R17jxwQuHdIiLH+mxSgS1TZp
         6LIAYAkns+/+ZBwvlz5Nd4eYfIowfcv2STAJfbOHGBw3K6pn8bGwmyfDKl5png2e9Ehn
         F+RNxVwzYUrJPcQXhwk4ISx2vwDSUjFDJoRjZXV5kFL6YtaDe1k43wgTujD36gzI88AQ
         LI6Xt09NCRXHrMX/yTUFwZ7xycbMumArRttCriSo8vTKxSt1KoeX29UoGfZueYodlQrV
         Plr7gLrDg09ICG3hTPT0LOZLSQ08Z8fFfq6QTedy+TJJ7NC5RZry6fCLJ4inERIhbkUC
         jKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bi0yWT3OhoMfJH/bqqEiaAv6/XA2NcRx7Xz7oUslWIc=;
        b=dtHbFAu3gy2Cx6Z/P8w9I3F/JWvwHbpVpFEIy0XjbQX39BX76c+BSFBQOvCn4jDPr7
         ZthBl8OO3sjtIQI8mLne4xVr57oHHXULDXCwvad6naZ/SzORgdE4dmTd0+dVgn2ykWXO
         poNt7pRb5OB+EzpavGt2S5768utgEW+mKHIf5pe4vUNDXqgbrDXocnloyXuPfVqO+I+W
         hKmIb4BtL3qzSafg57x7DHbrTt1G25TI52ksIrpSWyOjylBYh4XTrD+Gviv+O8wCpFIf
         f2HxOS+mQwoYRD3LCZcSXRKQC8xFqRTr3WAGm1/mKQdBdJmDW4BthcoZJmuVgLPAPEOv
         wa5g==
X-Gm-Message-State: ANoB5plRcjY3RPgsQ0WTER39EZelETmHRg/MiGnaGcqoU+zJrAWr1Z5/
        qls/5bjirjIQ1cy7MJ37GGQ=
X-Google-Smtp-Source: AA0mqf5VtCREaVWCVGC2WUXGllgqfkyEZHRoNSnh8DPdda0NgmBF/HUuwcXBMBk/s82yD+nANJHuFA==
X-Received: by 2002:a7b:cd94:0:b0:3cf:bfca:22db with SMTP id y20-20020a7bcd94000000b003cfbfca22dbmr48781315wmj.134.1670067810617;
        Sat, 03 Dec 2022 03:43:30 -0800 (PST)
Received: from localhost.localdomain ([94.73.32.229])
        by smtp.gmail.com with ESMTPSA id j13-20020a056000124d00b002421db5f279sm9132682wrx.78.2022.12.03.03.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 03:43:30 -0800 (PST)
From:   =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To:     killertofu@gmail.com
Cc:     benjamin.tissoires@redhat.com, jason.gerecke@wacom.com,
        jikos@kernel.org, joshua@joshua-dickens.com,
        linux-input@vger.kernel.org, ping.cheng@wacom.com,
        pinglinux@gmail.com, skomra@gmail.com
Subject: Re: [PATCH] HID: Recognize "Digitizer" as a valid input application
Date:   Sat,  3 Dec 2022 12:43:18 +0100
Message-Id: <20221203114318.10103-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <CANRwn3QZfeu4Oonw2-bFHzDajxDJRD6+G5HXr1WJ7bJuXddf2Q@mail.gmail.com>
References: <CANRwn3QZfeu4Oonw2-bFHzDajxDJRD6+G5HXr1WJ7bJuXddf2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jason,

> Still waiting to hear back about this. Are positive results from the
> hid-tools tests sufficient, or is there additional work that should be
> done for this patch?

A while ago a similar patch was sent [1] and it was in a similar status
to your patch for a while, so I decided to fix the issue in the UCLogic
driver [2].

I can not tell you if this patch needs additional work, but you might be
interested in fixing it in the Wacom driver, where it'd be easier for you
to test that no regressions are introduced.

I hope this helps a bit,
Jose

[1] https://lore.kernel.org/linux-input/20220804151832.30373-1-openglfreak@googlemail.com/
[2] https://lore.kernel.org/linux-input/d08049f2-443b-f769-cfde-629cdfb96fc0@alexyzhang.dev/T/
