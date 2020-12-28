Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A77A92E34AC
	for <lists+linux-input@lfdr.de>; Mon, 28 Dec 2020 08:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgL1HYU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 28 Dec 2020 02:24:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbgL1HYT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 28 Dec 2020 02:24:19 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F04C061794
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 23:23:39 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id 91so10522765wrj.7
        for <linux-input@vger.kernel.org>; Sun, 27 Dec 2020 23:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=92J1PAJz+AOLAKU9NMMs9ZwM2Wd8ruhklWSBisC2hMc=;
        b=telasu5o0XspEjNLkdvSRFkbNwsmhX82W5yjXr+/InwW7rLs+SEZ3O1TRgcFmilOyJ
         X2lJlgCWHRgRHUr3XJJ3QCmpdagZgyl2PW6YpUI8F8wpkDYaKwxuJH2I+GZdRKO+ifNi
         TWXq6fXL4jLQfyUjKgjuEMMPF22vIyxceCkPs6Fm58HXSbE70RSaCrOg0dsgKcDG5Z2r
         HhCQd3+yeB1Rd0alJKfZiJbxk/FKXCiAVidUEVo6ID+SLsuJi0eHAM+QYVuo431uxKfD
         da2lt8b59ZsHx71DzleozP1Dftg9bN7ZqLibua0qChFskWajap5OMv+XLi3bJfbbk0rJ
         RkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=92J1PAJz+AOLAKU9NMMs9ZwM2Wd8ruhklWSBisC2hMc=;
        b=FJxe+OJ3h1msBlQiBjlSrFpKxoYMHGhrHZMXejh95SYu3NvFY+ieoqQtidrmOytUTt
         tT5mZ/zeTDR/9kCGkCCKQHkv+URPGvOBdJnfV+oT22B6Xiws2+lbl75ilDC2n0pOMffn
         zT1ASfsdMYAsTPSc8CuiCX530PxC4eYmwPVPT9ZXB1p18jP6wyV8/KJOH6sq5uKjpzbE
         gpV7I8UIDcKdpht+lO1anscK7fIlNLrJ4JSWW9UvngWBNbpFpF+Qn0j1aQZtM7yG/20p
         tynpZS1Q83Smec1ntJwFLbrq4lZzk6wMdGbBdEvoAFvc979T7e3oJj3RQFRANwCXcA+d
         8YAQ==
X-Gm-Message-State: AOAM530Ivynum+vBdyvfLVa5f3zX4uLeMvJ/AURAaS6pbRfVjqPqix7I
        8Sl8y0rrDXZ0plTRw41EJw==
X-Google-Smtp-Source: ABdhPJzTjr+4WSqcHDWtRSpkXAW4FRekrOotvyjBvh3n1Qm8SN8N9ah2kIvXHCF8fjrYP8m64+Wrqg==
X-Received: by 2002:a05:6000:1043:: with SMTP id c3mr48782230wrx.34.1609140217627;
        Sun, 27 Dec 2020 23:23:37 -0800 (PST)
Received: from localhost.localdomain ([46.53.248.233])
        by smtp.gmail.com with ESMTPSA id r13sm54863995wrs.6.2020.12.27.23.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Dec 2020 23:23:36 -0800 (PST)
Date:   Mon, 28 Dec 2020 10:23:35 +0300
From:   Alexey Dobriyan <adobriyan@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     linux-input@vger.kernel.org, po-hsu.lin@canonical.com
Subject: [PATCH] input, i8042: unbreak Pegatron C15B
Message-ID: <20201228072335.GA27766@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

g++ reports

	drivers/input/serio/i8042-x86ia64io.h:225:3: error: ‘.matches’ designator used multiple times in the same initializer list

C99 semantics is that last duplicated initialiser wins,
so DMI entry gets overwritten.

Fixes: a48491c65b51 ("Input: i8042 - add ByteSpeed touchpad to noloop table")
Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 drivers/input/serio/i8042-x86ia64io.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/input/serio/i8042-x86ia64io.h
+++ b/drivers/input/serio/i8042-x86ia64io.h
@@ -219,6 +219,8 @@ static const struct dmi_system_id __initconst i8042_dmi_noloop_table[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "PEGATRON CORPORATION"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "C15B"),
 		},
+	},
+	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ByteSpeed LLC"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "ByteSpeed Laptop C15B"),
