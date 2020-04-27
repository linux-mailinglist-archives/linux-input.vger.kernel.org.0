Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4E3E1B9659
	for <lists+linux-input@lfdr.de>; Mon, 27 Apr 2020 06:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726219AbgD0E7v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 27 Apr 2020 00:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726172AbgD0E7v (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 27 Apr 2020 00:59:51 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06204C061A0F
        for <linux-input@vger.kernel.org>; Sun, 26 Apr 2020 21:59:50 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id 131so12645443lfh.11
        for <linux-input@vger.kernel.org>; Sun, 26 Apr 2020 21:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=8K5Qa62FBu38EvdinvLehlFDa5k8gfvLru8pabGFTTE=;
        b=fji3j6flfH9V5lQupt0GaoTiKyTRxMZKTJvNyCm1YSoPsMxzzrU0eZrZiLue2P7xnY
         vK00HYVMaMonIaCZXw0QXKFt4j1ZlGIVaj5yqph1/h0abu5JrVGFFnSwJoqBQoSzC8Kr
         rSoIGBD7N4EzgzuS2PmMcA8NhN26jqf+vjSUSJsD1ufd7Mthf0fLC/3YPWdqNFKqlus0
         I0ztOe4SvxCRKQo1CltXqaZzAyaJ+5XeocGo3m/IdJRuhtjDtcI2vE/pafRjr76Tgxlg
         5UIjSkCP/THKhGcQ3p0OgXGO5fxm+Eo26Xlhgi+ErqnR5QKODzrGt6xsPWYVKQq3h9qx
         dlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=8K5Qa62FBu38EvdinvLehlFDa5k8gfvLru8pabGFTTE=;
        b=FTlSrvWiCBeeG4ZeowNeTgsf/P4i6dPUCyRqaC7DcomTZpUVVGJder1RB+Z1RcPcTR
         Hk8QbNOnhLUfgrV5qgJePAC4v1z61nNGxTOHx2JtH5iHymrotDKCwKDqyfyLtJQQCntk
         ua/QFfTniWLNIFp4SA36abW0mqT2dfEvJ/c9zfB5NzR3gMCMxNfp9XuEmmlFfpGDuf/b
         7a0mT0zTBuyNDoQ6Hk74zvlIDVCYdoRd8CbVkV0g1XteHqYnRRlxhYfjzl1fnBs6TI1S
         41N7xmiuXTxw7wAidpjnM+NShxAzcnZ29FGTkBUoJLxdMoj6kn1/UOTW1SLt06JYOZyN
         wYdg==
X-Gm-Message-State: AGi0Pubzy3MnzzogpmlIwgsNIbq7hHtVEIE/tzCrZypoyY8xC4wKF42r
        o03Wrh/Y0WhdtVhch2zkkNU=
X-Google-Smtp-Source: APiQypKKRAhZOPOaJtxW1+D6meIERh1J/I0JAhDM5n+OIZtDmbElLGJsZUFHRIPOuAAwWLcFg1U+7g==
X-Received: by 2002:a19:c78d:: with SMTP id x135mr13875303lff.151.1587963589404;
        Sun, 26 Apr 2020 21:59:49 -0700 (PDT)
Received: from hk.localdomain ([85.98.96.153])
        by smtp.gmail.com with ESMTPSA id m13sm10324117lfk.12.2020.04.26.21.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2020 21:59:48 -0700 (PDT)
Date:   Mon, 27 Apr 2020 07:59:32 +0300
From:   Kutay Uner <husnukutay@gmail.com>
To:     dmitry.torokhov@gmail.com
Cc:     rydberg@bitmath.org, benjamin.tissoires@redhat.com,
        kai.heng.feng@canonical.com, linux-input@vger.kernel.org
Subject: [PATCH 1/1] input: update max sizes after setting to absolute mode
Message-ID: <20200427045932.GA21183@hk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

x_max/y_max values change after we populate info struct. Using old
values causes y scroll to be half of the size of pad area. Updating these
values fixes that problem. This problem affects firmware 0x450f00 at least.

Signed-off-by: Kutay Uner <husnukutay@gmail.com>
---
--- a/drivers/input/mouse/elantech.c
+++ b/drivers/input/mouse/elantech.c
@@ -1944,6 +1944,22 @@ static int elantech_setup_ps2(struct psmouse *psmouse,
 		goto init_fail;
 	}
 
+	/* elantech_set_absolute_mode(?) causes x_max/y_max to change
+	 * at least on models using this fw. Workaround that by requerying
+	 * and setting those values at both info struct to be safe.
+	 */
+	if (info->fw_version == 0x450f00) {
+		unsigned char param[3];
+
+		if (info->send_cmd(psmouse, ETP_FW_ID_QUERY, param))
+			goto init_fail;
+
+		info->x_max = (0x0f & param[0]) << 8 | param[1];
+		info->y_max = (0xf0 & param[0]) << 4 | param[2];
+		etd->info.x_max = info->x_max;
+		etd->info.y_max = info->y_max;
+	}
+
 	if (info->fw_version == 0x381f17) {
 		etd->original_set_rate = psmouse->set_rate;
 		psmouse->set_rate = elantech_set_rate_restore_reg_07;
