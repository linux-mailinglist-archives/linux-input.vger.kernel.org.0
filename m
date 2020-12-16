Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADB32DB88F
	for <lists+linux-input@lfdr.de>; Wed, 16 Dec 2020 02:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgLPBlg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 20:41:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgLPBlg (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 20:41:36 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F2F2C061793;
        Tue, 15 Dec 2020 17:40:56 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id f14so604785pju.4;
        Tue, 15 Dec 2020 17:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=R9E1+JwqFZKk2AK8HE4565Hu+8+uiMrszjBFOFvVtpY=;
        b=L7vskc4XkaDqTwgdyWWZVSyQln3KIZxUhxwyNTWQN70cy5scBLjNlcFHqXuOpd0dKp
         1Gqxr34XBSXY2eQEVwTaf691lk370CwNJkg3pJlVJKPqUEXNujqTybcA2mHjkXHA8MsR
         HO9BdAo4fxdz4K/H3bmYwp/rBhGOIm8MITWBOQRbMqvbqigeVjkwLGLVnza7XcrdZ9iU
         XjwXpbdDcD+cx1IrqscI2fVCLtMGyQqS19AnZvMPtf4uNC28syYC2kj1hHuUFLwTRUCc
         K+01bQMNKUX9NeoFonAQWdtkb4hWFAZA9h+LBGDp+A19iCR6lrf9If8v3/IFAlPrEeGJ
         FFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=R9E1+JwqFZKk2AK8HE4565Hu+8+uiMrszjBFOFvVtpY=;
        b=BGngAaJvXDkTLXPJljYwqM+wSv8fhj+BVhdP6jqZmbVjyz84FEm2jQMmS7IvJTF9it
         LW8nWWmczSZknLZppLRrNeJbUiwdFU4xKU6s/yJxWQHSDOqqCEuej/0I5zIVuWTcft/F
         P5vEEEkl7I+9L8pLeRDioYb6D0ggLzR8H4zjZX43j321l1MuVDktQTjDUULjCAGD5QFb
         sjc8WJQGETfxVWssl8LIAyJMGpcEB4/pxANv1BF1grvjsS87RHMmdiY48Qxv3zgLws71
         U3lxwPBFZMopndY6Kmd08MIIr0B41hBJ9HuSEvDzehtwMVIocyAN+xeBoYwGvqCG4Xvd
         XETg==
X-Gm-Message-State: AOAM53054XrHWn5kHpd8j4+D8aSQl1pAlPVEHMKhxtXyVQSxlXorFD+R
        DjPnqGA+I2OkQYRUrTP2iQpf9tjqyXQ=
X-Google-Smtp-Source: ABdhPJzGBB8zm1dGi66063biQGA+g6PaPrxV3ix3fdH330cPAo2NNmaszgmTyB9+2+ZJDvbcNSEtgQ==
X-Received: by 2002:a17:90a:7842:: with SMTP id y2mr1177166pjl.36.1608082855873;
        Tue, 15 Dec 2020 17:40:55 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id w70sm262790pfd.65.2020.12.15.17.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 17:40:55 -0800 (PST)
Date:   Tue, 15 Dec 2020 17:40:52 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     Anson Huang <Anson.Huang@nxp.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] Input: imx_keypad - add dependency on HAS_IOMEM
Message-ID: <X9llpA3w1zlZCHXU@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

devm_platform_ioremap_resource() depends on CONFIG_HAS_IOMEM, so let's add
it to the dependencies when COMPILE_TEST is enabled.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: c8834032ffe2 ("Input: imx_keypad - add COMPILE_TEST support")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/Kconfig b/drivers/input/keyboard/Kconfig
index 2b321c17054a..94eab82086b2 100644
--- a/drivers/input/keyboard/Kconfig
+++ b/drivers/input/keyboard/Kconfig
@@ -446,7 +446,7 @@ config KEYBOARD_MPR121
 
 config KEYBOARD_SNVS_PWRKEY
 	tristate "IMX SNVS Power Key Driver"
-	depends on ARCH_MXC || COMPILE_TEST
+	depends on ARCH_MXC || (COMPILE_TEST && HAS_IOMEM)
 	depends on OF
 	help
 	  This is the snvs powerkey driver for the Freescale i.MX application
-- 
2.29.2.729.g45daf8777d-goog


-- 
Dmitry
