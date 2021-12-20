Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47B3B47A99A
	for <lists+linux-input@lfdr.de>; Mon, 20 Dec 2021 13:25:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232720AbhLTMZk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 20 Dec 2021 07:25:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232605AbhLTMZd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 20 Dec 2021 07:25:33 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D264C061759
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 04:25:27 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id x15so37638878edv.1
        for <linux-input@vger.kernel.org>; Mon, 20 Dec 2021 04:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9zZ2iIKjtnIzIajYT+GIxyKCjYpTcdEClasnE1DL9fE=;
        b=XJM0sxVa1/NGRk+2y/djXlnvrrZCKLzZKv/OEwdWfk9Zyf38nXFnHeK2/nABe8KddQ
         4FRg1oJlYYxpW1hr+jo/viX/2b6tcL8vXnWSK1XbslCAEg25em6JgGBd2f3zez4RxFu/
         VSK47QNaR/I6j5zkyGdNcOkXiuZUSjScdWPVfbqbxZdDrLtqOsWrv5x4XYiRiXUoW5mM
         1xp/KuZ+Lt1Z2heUWiEluqBRK0YIhb5NyPWJlru8/vDhW3py1TonTRW+La+q+ztkJDjN
         GZAXgv+6znNMeG7yyGuAan6gTn46xzteUYvYx4Ojrxb27KceGZj6cihxSMm3s+Nc3URA
         aVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9zZ2iIKjtnIzIajYT+GIxyKCjYpTcdEClasnE1DL9fE=;
        b=uyC8AmzlBMPpTJhnNjckn/Br5/RAIsCul4Qhw0Hf0zUFpiw7NTuPJpPhfLEuccK2Z4
         WU6hbRIRQyxJEyxMNL+QSpm/lwXqk0V8WnGVRZp9lKY4VLpubto1z62890OA8Qu4nVlS
         5I8dTD99KpjgJz7/KS91kHSoBEr9dLbc3ZXQSkqSpn+/j6i6eE3zwNOQJNky7IxLoe1B
         m5AFAO4/Nktvh830K45wskLXvogP6xwHKdT7qI8q2KFf8H0s9X/hMM2FQz4kkSJUjGpI
         fvjI7k2JQiY+vUIcSNZ1y39Bjakwl3lLGTuf89RUTvoDz90cXbqx+OoTlNJnjJH8G6n0
         zCcw==
X-Gm-Message-State: AOAM531hKSHWKC/dIhjqtFmuVyO+TL1RzwSWnRRvPUSpmnOqG81OlCnV
        twR6CF6z1CiEcTiV6/sl/ZFZ0A==
X-Google-Smtp-Source: ABdhPJy1EpKyVaxwroCMhEoEILe7wDpRAzPVoYD0LdsyOvkVF7DZXv9DRuVZ3s6VPQm2ijVhVBlHhw==
X-Received: by 2002:a17:906:dfea:: with SMTP id lc10mr4522007ejc.459.1640003126034;
        Mon, 20 Dec 2021 04:25:26 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se. [85.229.40.155])
        by smtp.gmail.com with ESMTPSA id e26sm6759811edr.82.2021.12.20.04.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 04:25:25 -0800 (PST)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, woojung.huh@microchip.com,
        UNGLinuxDriver@microchip.com, davem@davemloft.net,
        netdev@vger.kernel.org, linux-usb@vger.kernel.org,
        clang-built-linux@googlegroups.com, ulli.kroll@googlemail.com,
        linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
        amitkarwar@gmail.com, nishants@marvell.com, gbhat@marvell.com,
        huxinming820@gmail.com, kvalo@codeaurora.org,
        linux-wireless@vger.kernel.org, rostedt@goodmis.org,
        mingo@redhat.com, dmitry.torokhov@gmail.com,
        ndesaulniers@google.com, nathan@kernel.org,
        linux-input@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Andy Lavr <andy.lavr@gmail.com>,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH 4.14 3/6] mwifiex: Remove unnecessary braces from HostCmd_SET_SEQ_NO_BSS_INFO
Date:   Mon, 20 Dec 2021 13:25:03 +0100
Message-Id: <20211220122506.3631672-4-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211220122506.3631672-1-anders.roxell@linaro.org>
References: <20211220122506.3631672-1-anders.roxell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Nathan Chancellor <natechancellor@gmail.com>

commit 6a953dc4dbd1c7057fb765a24f37a5e953c85fb0 upstream.

A new warning in clang points out when macro expansion might result in a
GNU C statement expression. There is an instance of this in the mwifiex
driver:

drivers/net/wireless/marvell/mwifiex/cmdevt.c:217:34: warning: '}' and
')' tokens terminating statement expression appear in different macro
expansion contexts [-Wcompound-token-split-by-macro]
        host_cmd->seq_num = cpu_to_le16(HostCmd_SET_SEQ_NO_BSS_INFO
                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/marvell/mwifiex/fw.h:519:46: note: expanded from
macro 'HostCmd_SET_SEQ_NO_BSS_INFO'
        (((type) & 0x000f) << 12);                  }
                                                    ^

This does not appear to be a real issue. Removing the braces and
replacing them with parentheses will fix the warning and not change the
meaning of the code.

Fixes: 5e6e3a92b9a4 ("wireless: mwifiex: initial commit for Marvell mwifiex driver")
Link: https://github.com/ClangBuiltLinux/linux/issues/1146
Reported-by: Andy Lavr <andy.lavr@gmail.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/net/wireless/marvell/mwifiex/cmdevt.c | 4 ++--
 drivers/net/wireless/marvell/mwifiex/fw.h     | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/cmdevt.c b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
index 0edc5d621304..a9cee3dac97b 100644
--- a/drivers/net/wireless/marvell/mwifiex/cmdevt.c
+++ b/drivers/net/wireless/marvell/mwifiex/cmdevt.c
@@ -323,9 +323,9 @@ static int mwifiex_dnld_sleep_confirm_cmd(struct mwifiex_adapter *adapter)
 
 	adapter->seq_num++;
 	sleep_cfm_buf->seq_num =
-		cpu_to_le16((HostCmd_SET_SEQ_NO_BSS_INFO
+		cpu_to_le16(HostCmd_SET_SEQ_NO_BSS_INFO
 					(adapter->seq_num, priv->bss_num,
-					 priv->bss_type)));
+					 priv->bss_type));
 
 	mwifiex_dbg(adapter, CMD,
 		    "cmd: DNLD_CMD: %#x, act %#x, len %d, seqno %#x\n",
diff --git a/drivers/net/wireless/marvell/mwifiex/fw.h b/drivers/net/wireless/marvell/mwifiex/fw.h
index 1d86d29b64cc..c802b73a15c5 100644
--- a/drivers/net/wireless/marvell/mwifiex/fw.h
+++ b/drivers/net/wireless/marvell/mwifiex/fw.h
@@ -498,10 +498,10 @@ enum mwifiex_channel_flags {
 
 #define RF_ANTENNA_AUTO                 0xFFFF
 
-#define HostCmd_SET_SEQ_NO_BSS_INFO(seq, num, type) {   \
-	(((seq) & 0x00ff) |                             \
-	 (((num) & 0x000f) << 8)) |                     \
-	(((type) & 0x000f) << 12);                  }
+#define HostCmd_SET_SEQ_NO_BSS_INFO(seq, num, type) \
+	((((seq) & 0x00ff) |                        \
+	 (((num) & 0x000f) << 8)) |                 \
+	(((type) & 0x000f) << 12))
 
 #define HostCmd_GET_SEQ_NO(seq)       \
 	((seq) & HostCmd_SEQ_NUM_MASK)
-- 
2.34.1

