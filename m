Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8172C2C972B
	for <lists+linux-input@lfdr.de>; Tue,  1 Dec 2020 06:50:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726669AbgLAFuO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 00:50:14 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44636 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgLAFuO (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 00:50:14 -0500
Received: from mail-pf1-f198.google.com ([209.85.210.198])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <po-hsu.lin@canonical.com>)
        id 1kjyXb-0005JF-SZ
        for linux-input@vger.kernel.org; Tue, 01 Dec 2020 05:49:32 +0000
Received: by mail-pf1-f198.google.com with SMTP id a24so303199pfo.3
        for <linux-input@vger.kernel.org>; Mon, 30 Nov 2020 21:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZNT1fNZ3OIc93NBIX9oqtJGb9j7CBMquWYBPqfNvPgU=;
        b=na7kdAeKpubqo0aDEey7YT077EXyQHNqNwxyarHyWA4TnY+BnJxgUKjIkodCbLjsYe
         bl9IgVD00WRLXmAGT/5ISR5bqvBeXgUVTW9LARidKpTrW/e3jTN5egQsWPx0Fvg3zK4G
         KX+DPTNgf/vaNyzSTrimsvoLCqc9q3Yo/DFko7BAy2VINsCAr/ymOOD4voYdZ4eRgv4M
         cxJWq1SOQZ4LgKwgvR4v/lcnaS3JhMPztN8R84g9e6tQkjqUHhldNttv/Pu3sri1TB34
         h7JkyduIG1CXsQo1mqPDDh4cLlVy5vfg786Bv9dakC59qeToOO7Ug3XsbddzWRl/Ox0S
         UcFg==
X-Gm-Message-State: AOAM533nSkVF22vEE9Ck4HIq+i7r89OyW+7NUcgFSDFPnINcMzix17eh
        ITiiKRsqr6MUPi83dW51mp643IkX/LwB/v1NtyQZlsARMDH5JEVi34PPS9WXCELEQCMkmxRnBCQ
        Tedk4e39FQ+dPGlRG9hjKOSTLcUBM0ToCIs9mZCs=
X-Received: by 2002:a17:90b:4acc:: with SMTP id mh12mr1133401pjb.54.1606801770600;
        Mon, 30 Nov 2020 21:49:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjAXFeeHedfQPV7Rahm5nmSYGg6tvJQrwzePM3kLhkoYrSBiysdJQ8meanGjkpiNFeO+Yy+w==
X-Received: by 2002:a17:90b:4acc:: with SMTP id mh12mr1133376pjb.54.1606801770227;
        Mon, 30 Nov 2020 21:49:30 -0800 (PST)
Received: from localhost.localdomain ([2001:67c:1560:8007::aac:c227])
        by smtp.gmail.com with ESMTPSA id r11sm1028321pgn.26.2020.11.30.21.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 21:49:29 -0800 (PST)
From:   Po-Hsu Lin <po-hsu.lin@canonical.com>
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kevin@kevinlocke.name, hdegoede@redhat.com, limero1337@gmail.com,
        jkosina@suse.cz, rajatja@google.com, po-hsu.lin@canonical.com
Subject: [PATCH] Input: i8042 - Add ByteSpeed touchpad to noloop table
Date:   Tue,  1 Dec 2020 13:47:23 +0800
Message-Id: <20201201054723.5939-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

It looks like the C15B laptop got another vendor: ByteSpeed LLC.

Avoid AUX loopback on this touchpad as well, thus input subsystem will
be able to recognize a Synaptics touchpad in the AUX port.

BugLink: https://bugs.launchpad.net/bugs/1906128
Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
---
 drivers/input/serio/i8042-x86ia64io.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/serio/i8042-x86ia64io.h b/drivers/input/serio/i8042-x86ia64io.h
index a4c9b96..7ecb651 100644
--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -219,6 +219,10 @@ static const struct dmi_system_id __initconst i8042_dmi_noloop_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "PEGATRON CORPORATION"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "C15B"),
 		},
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ByteSpeed LLC"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "ByteSpeed Laptop C15B"),
+		},
 	},
 	{ }
 };
-- 
2.7.4

