Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B5E761D77
	for <lists+linux-input@lfdr.de>; Tue, 25 Jul 2023 17:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229727AbjGYPiH (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 25 Jul 2023 11:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjGYPiG (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 25 Jul 2023 11:38:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41781BF8
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 08:38:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49C286178F
        for <linux-input@vger.kernel.org>; Tue, 25 Jul 2023 15:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A70EC433C8;
        Tue, 25 Jul 2023 15:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690299484;
        bh=bDFdxCN1eadFZ+WEQ9cgpt1sE/nSfwzieXCH199zY6I=;
        h=From:Date:Subject:To:Cc:From;
        b=IvFwAQqbuEMRiV2OOwf9mHEaokGwpwNCCMqzzQQVigPyS5F5+8540rbqHI4xBCly6
         cdY+4LjXO1AS7SsnLHlEoaSPURRsBBbXyfGJtp4U7dkey43vBt+60VXW3chpB1cf6B
         JNwfYvFtyoJlwmc3W8Q58Hwig2B1u4MTTSM/dkLuV5VWUQpHfs578Jc6O066dI5gVT
         J7djlfyQ17GTnFsND7rpWOnxybiZ3cIMZoJ+94/HqIx9sXL6sDgepQeyvwnXxtmxSi
         CT7lgkrLUjqdBFIHnaw65YumvfL2ltYpv6rSDzm9kLxTrFp1xqYLTR9N4m5Wl1QEs5
         n7ZsyjVwHRb9A==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Tue, 25 Jul 2023 08:37:56 -0700
Subject: [PATCH] Input: mcs-touchkey - Fix uninitialized use of error in
 mcs_touchkey_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230725-mcs_touchkey-fix-wuninitialized-v1-1-615db39af51c@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFPsv2QC/x2NXQqDMBAGryL73AVNW0q8ipSyxI1+VKMk2j/x7
 g0+DgwzGyWN0ER1sVHUFxKmkKE6FeR6CZ0y2sxkSnMub+bKo0uPZVpd/9Qve3z4vQYELJABP23
 54r1aMWJFLOXKHDVbx6G57/sfRpj52nEAAAA=
To:     dmitry.torokhov@gmail.com
Cc:     ndesaulniers@google.com, trix@redhat.com, frank.li@vivo.com,
        linux-input@vger.kernel.org, llvm@lists.linux.dev,
        patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=nathan@kernel.org;
 h=from:subject:message-id; bh=bDFdxCN1eadFZ+WEQ9cgpt1sE/nSfwzieXCH199zY6I=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCn738SE+K/TjTLdfS323fwPvezxSzY1/fkVojtvTs2KK
 Z9WTYzM6ShlYRDjYJAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATWejP8Fd+6fRwNgNn6xZl
 ZmeBJ29/xWTeW9o1pfXl28PBHzI8t75kZOg3eLP59t15Bybkivez/GhaoHqaIfRbZP2nBz/C9L0
 uX+IEAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Clang warns (or errors with CONFIG_WERROR=y):

  drivers/input/keyboard/mcs_touchkey.c:149:49: error: variable 'error' is uninitialized when used here [-Werror,-Wuninitialized]
    149 |                 dev_err(&client->dev, "i2c read error[%d]\n", error);
        |                                                               ^~~~~
  include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
    144 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
        |                                                                        ^~~~~~~~~~~
  include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
    110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
        |                                     ^~~~~~~~~~~
  drivers/input/keyboard/mcs_touchkey.c:110:11: note: initialize the variable 'error' to silence this warning
    110 |         int error;
        |                  ^
        |                   = 0
  1 error generated.

A refactoring updated the error handling in this block but did not
update the dev_err() call to use fw_ver instead of error. Do so now to
fix the warning and avoid printing uninitialized memory.

Closes: https://github.com/ClangBuiltLinux/linux/issues/1893
Fixes: e175eae16c1b ("Input: mcs-touchkey - convert to use devm_* api")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/input/keyboard/mcs_touchkey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/keyboard/mcs_touchkey.c b/drivers/input/keyboard/mcs_touchkey.c
index f25e2b20e271..2410f676c7f9 100644
--- a/drivers/input/keyboard/mcs_touchkey.c
+++ b/drivers/input/keyboard/mcs_touchkey.c
@@ -146,7 +146,7 @@ static int mcs_touchkey_probe(struct i2c_client *client)
 
 	fw_ver = i2c_smbus_read_byte_data(client, fw_reg);
 	if (fw_ver < 0) {
-		dev_err(&client->dev, "i2c read error[%d]\n", error);
+		dev_err(&client->dev, "i2c read error[%d]\n", fw_ver);
 		return fw_ver;
 	}
 	dev_info(&client->dev, "Firmware version: %d\n", fw_ver);

---
base-commit: 447c09544275663e1082f796b26c7959915c922a
change-id: 20230725-mcs_touchkey-fix-wuninitialized-4ffe9a2a9aa9

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>

