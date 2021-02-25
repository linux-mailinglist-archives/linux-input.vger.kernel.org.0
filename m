Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE13324A87
	for <lists+linux-input@lfdr.de>; Thu, 25 Feb 2021 07:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhBYG1G (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 25 Feb 2021 01:27:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232290AbhBYG04 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 25 Feb 2021 01:26:56 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD9CFC061756;
        Wed, 24 Feb 2021 22:26:15 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id z190so4705576qka.9;
        Wed, 24 Feb 2021 22:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JsC4sUw2JO+LOt+05YaId+6rirH3+xei4ZgphmmKmfY=;
        b=T9Cgj7vUbeGYQVOmFlU6QuiQcQyVzBGvQ1Ve8+doEqHj0FZMcjFYtSqRaoZxgrYQ90
         VCLVY3HW7FT0TMEg6/1fULqFtdc80kK6pmADIJ00EhHzNxvgY3jwv9pt4joatsxEHKOv
         Wnqc7EFN8z83h9nu27LyLB8VIPtRc0MBrTU0VyTBgzumq3M0J/eCc2SErkMhJL9vHBHl
         x4bZZ7el5XBZjyGZmn6KEK0spZrSNySvLLr4pslA4Ac8b/cpNu0Ba8UuO0zMlzwSmlS3
         qYh61DR+1lRTBC59gpk6guY1W10fbffiEBxc9EHF6qi5iom+UmITGEAbh0iX7LpIvMd1
         t0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=JsC4sUw2JO+LOt+05YaId+6rirH3+xei4ZgphmmKmfY=;
        b=agLQn0nvYR0jHdhq58XeCtrtNqYp6PiXqpyPPNXdFnUWJ2C7fUcXrLaxry+MtZIpIo
         PkdGNcBBX4x4tso3jea5oAiehc9NFDigWP5khRrnoTt5R4NRVL0soByZcisngo8QB1Wp
         alOxDQPYszv3On2UuH/QKiPLNDso5b7PyW0VdmDmgtgwP/kTCJDnoH2w1BVclfYJMT92
         WnDa1LeL7SyZ4PmjWSogIxKSWfgyivQXLq2twCnLzYtpgTo8meq4eZIXukDjGJWLOlvv
         MFEVRi532SdBAUKYjyXOgx0wAH7pAlgm1BqF//QIi3x15GWVID76FLKA28EdpO8ZsWU2
         gpHw==
X-Gm-Message-State: AOAM5324zIVw57RP/N8VwAkOLlzP8FNHsWgU5UlrQ2TurD/PnL3VCY6E
        Wdv2hVh52LRE+rn5ASqOAo0=
X-Google-Smtp-Source: ABdhPJzJN1BSL4BE+SyUzhjPSua/O6Ohf3ObbZAfTZAONDBkxtL7J8xbzHyNOhcfOrzZ3SLERphY8Q==
X-Received: by 2002:a37:9fd5:: with SMTP id i204mr1417287qke.499.1614234374799;
        Wed, 24 Feb 2021 22:26:14 -0800 (PST)
Received: from kde-neon-desktop.orld.fl.wtsky.net ([208.64.158.251])
        by smtp.gmail.com with ESMTPSA id x187sm3365039qkd.83.2021.02.24.22.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 22:26:14 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
From:   Julian Braha <julianbraha@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: input: joystick: fix Kconfig dependency on IIO_BUFFER
Date:   Thu, 25 Feb 2021 01:26:02 -0500
Message-Id: <20210225062602.13236-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

When JOYSTICK_ADC is enabled, and IIO_BUFFER is disabled,
Kbuild gives the following warning:

WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
  Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
  Selected by [y]:
  - JOYSTICK_ADC [=y] && !UML && INPUT [=y] && INPUT_JOYSTICK [=y] && IIO [=y]

This is because JOYSTICK_ADC selects IIO_BUFFER_CB
without selecting or depending on IIO_BUFFER,
despite IIO_BUFFER_CB depending on IIO_BUFFER.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/input/joystick/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 5e38899058c1..3c169b86c977 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -45,6 +45,7 @@ config JOYSTICK_A3D
 config JOYSTICK_ADC
 	tristate "Simple joystick connected over ADC"
 	depends on IIO
+	select IIO_BUFFER
 	select IIO_BUFFER_CB
 	help
 	  Say Y here if you have a simple joystick connected over ADC.
-- 
2.27.0

