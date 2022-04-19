Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A919506C70
	for <lists+linux-input@lfdr.de>; Tue, 19 Apr 2022 14:28:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235005AbiDSM3r (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Apr 2022 08:29:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231693AbiDSM3r (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Apr 2022 08:29:47 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9876236693
        for <linux-input@vger.kernel.org>; Tue, 19 Apr 2022 05:27:04 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id m14so22210588wrb.6
        for <linux-input@vger.kernel.org>; Tue, 19 Apr 2022 05:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGOwNBj1AtdAhnZw0u7WTfjG6cuPTPOJNVBwKto8xPY=;
        b=tZ+0M1P7EI3FGLkyjvTMuKAjeHQflBByVETp3rcmmofH9qfliJWB/7TarZA465ooSj
         SjxjIwhaCb4WXcLcWH0tf/cvvQTZiWlNLGiTPhOmBVgdP4GsU0auf5mALmbX4gy++QAo
         PXY3jS84C3quukThUjTFXigfAOvwIzSZJSDsI69QWqAmmK+m5HuaUn1oDI7amt3ugwcv
         aNXIO5veMfYTWUowBV1nImmcEJAnZVbuW/nGsZkE0+JqwGgTfB4pr6AVM+H2cfUSoG2t
         UKKneuywAjf2UT8qdZcSnOTO2XmzCDimrcql3kFPgWqiYnD6fOicOaj5xeVKr/rKtfXF
         qbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kGOwNBj1AtdAhnZw0u7WTfjG6cuPTPOJNVBwKto8xPY=;
        b=EqqTc9Ph5Ref1W405LPSfYguDs9ptDiLd+X5+Gw/+fqqEr+EhoU7CH0U7AqfNTIfOy
         xSa2d3viNmjqDo0eH1KRxoL+aGCetoCf0AAND3S2ymfMBg6E79sf2W/Z65sqR3tHUWKK
         X1A7sk3QjBct8QzVFHa8RS6bnK4Py8Ghk95M62YTjJ1nAajEZnWWA24YxdYAO4cDHQMO
         aD2M83/wzeIkKn1FnURCrG+UCn23YVhGEfbAHonyLmy4mXlSjaunxQrDyXSRoooGm+GM
         lL79+s6XiLZZSBKAeNZFzk7WKjYmApLDy3d5c+HJbrGrRtmqY17kBR5IryYP6mzmcusW
         BHyw==
X-Gm-Message-State: AOAM532ndzqg3PnHYDd2uq872+FFawa5HiMst3l7Y/LlpucCcWGMDvv1
        GjtUfg9hLpwpBIGauZaPO7LZ3FnJa2zGqOD8uBpRfA==
X-Google-Smtp-Source: ABdhPJw+vyrb0iFt6CXNVmlkRcOPGoFRwAp399pOD2S2WKL2/+3oGSSFsEeBBCTEFzM7vmXF9rj1Xw==
X-Received: by 2002:a5d:6d03:0:b0:20a:7af0:380f with SMTP id e3-20020a5d6d03000000b0020a7af0380fmr11388974wrq.148.1650371223239;
        Tue, 19 Apr 2022 05:27:03 -0700 (PDT)
Received: from aczubak.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id f4-20020a7bc8c4000000b0038ebbe10c5esm19039905wml.25.2022.04.19.05.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 05:27:02 -0700 (PDT)
From:   Angela Czubak <acz@semihalf.com>
To:     linux-input@vger.kernel.org
Cc:     upstream@semihalf.com, benjamin.tissoires@redhat.com,
        jikos@kernel.org, dmitry.torokhov@gmail.com,
        Angela Czubak <acz@semihalf.com>
Subject: [PATCH] HID: add HID device reset callback
Date:   Tue, 19 Apr 2022 12:26:32 +0000
Message-Id: <20220419122632.2988786-1-acz@semihalf.com>
X-Mailer: git-send-email 2.36.0.rc2.479.g8af0fa9b8e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

HID-over-I2C devices might reset on their own. Any device configuration
applied before the reset might be brought back to defaults so we need to
reconfigure to make sure the driver state is consistent.

Add a reset callback to the hid driver structure.
Issue it if the driver implements it and the device reset gets observed.

Signed-off-by: Angela Czubak <acz@semihalf.com>
---

Hi guys,

This is a patch introducing callbacks to be issued when device reset gets
noticed. The discussion started in one of the previous linux-input threads [0].

Please let me know if there is anything to fix.

Regards,
Angela

[0] https://lore.kernel.org/linux-input/CAO-hwJ+OgLMkAy+Ms1xgHz3RTYxS+5LCSSP3njju+joTYWZMqA@mail.gmail.com/T/#t

 drivers/hid/i2c-hid/i2c-hid-core.c | 2 ++
 include/linux/hid.h                | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c-hid-core.c
index c078f09a2318..96739d7a4191 100644
--- a/drivers/hid/i2c-hid/i2c-hid-core.c
+++ b/drivers/hid/i2c-hid/i2c-hid-core.c
@@ -529,6 +529,8 @@ static void i2c_hid_get_input(struct i2c_hid *ihid)
 		/* host or device initiated RESET completed */
 		if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
 			wake_up(&ihid->wait);
+		if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
+			ihid->hid->driver->reset(ihid->hid);
 		return;
 	}
 
diff --git a/include/linux/hid.h b/include/linux/hid.h
index 4363a63b9775..50b9dde2c870 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -755,6 +755,7 @@ struct hid_usage_id {
  * @suspend: invoked on suspend (NULL means nop)
  * @resume: invoked on resume if device was not reset (NULL means nop)
  * @reset_resume: invoked on resume if device was reset (NULL means nop)
+ * @reset: invoked if device was reset (NULL means nop)
  *
  * probe should return -errno on error, or 0 on success. During probe,
  * input will not be passed to raw_event unless hid_device_io_start is
@@ -811,6 +812,7 @@ struct hid_driver {
 	int (*resume)(struct hid_device *hdev);
 	int (*reset_resume)(struct hid_device *hdev);
 #endif
+	int (*reset)(struct hid_device *hdev);
 /* private: */
 	struct device_driver driver;
 };
-- 
2.36.0.rc2.479.g8af0fa9b8e-goog

