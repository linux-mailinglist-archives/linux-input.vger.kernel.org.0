Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4A2655ED1
	for <lists+linux-input@lfdr.de>; Mon, 26 Dec 2022 01:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbiLZAH2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 25 Dec 2022 19:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiLZAH1 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 25 Dec 2022 19:07:27 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0766F16
        for <linux-input@vger.kernel.org>; Sun, 25 Dec 2022 16:07:25 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so4018728wmb.2
        for <linux-input@vger.kernel.org>; Sun, 25 Dec 2022 16:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJAolXlLPQCo3vVYv1N2gNaOLRwHSdOvgYpPlAYOars=;
        b=AtN80tYGKer/PlEaunAJik3pBjBC/4/LYg2DiP7inZP0GkM2E+q05S/RTRe+DKsAZG
         TFk+kWdNse4Wt043uD1WuD6YheS0DnyLRmL1qUzgkredZKNgy2r2ilzDNyHhUlu7IZdE
         BdbMw00o00wngsQ4zIh7ebrmCAdJell9TR8rR2O55AxmeowBouTJBgclWM3VnqxFuo8o
         1zAPPcnHXoYWHNAsADLWNoE2+EaBje7pmOtCCfFIGKrkMFatlmgMcGBd1e/fh28sE34w
         byUOls6YQr7tV3kq7tJoGOe6I6MDSYshwkt7JXgPnI/csJ8zXZj9GiQo47wwqSvW30tD
         S2Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJAolXlLPQCo3vVYv1N2gNaOLRwHSdOvgYpPlAYOars=;
        b=AJuXbByjFnjmJX8WUkVJcBd+t/nIjznY+pTk8bWQQr9o/PsLjfvut1Zmt+qklWlV5b
         tLx3DVbUQlRn4dCgosbDG3Iq3cCpMjqjGYsvsqm1cblPJloz1Xmz7PT4HPZXrXKrXG22
         EDUaiEkAXFnCV+Q8fYT5XXNkTlx/6O92DAWWkQNFNAHa3BrgCN3gWcSivgkY1MAn9a36
         7WIOgK1SRa/v7ixRCSp3Fr7PxCsrIe6Eb6lpjwOAj6W3ut8qzlbUEgns0b1Wkie4r+uD
         v/GP/FmpjE8/yMVxsZJeRHGh2i9mNr4FyayYd8jZgDwsrWw4RrdtVSOdRtwb77YM5NDk
         kskg==
X-Gm-Message-State: AFqh2kqdlxYieZpDvyuOsTNaBaeGHq0gdj4u5XDUGSpFIYXoWs1JMKhX
        /4ojHrVuNPEmicp5PXYEzIXVrBa5hBc=
X-Google-Smtp-Source: AMrXdXvfUhlmxb36EjOyL6Eh+ZGBVPd0OMVRkWd4FyDtnXgX4VsoHi0T6JHOI99rgy5tUsAK9Ipsqw==
X-Received: by 2002:a05:600c:8507:b0:3d9:6c7d:c9ee with SMTP id gw7-20020a05600c850700b003d96c7dc9eemr6770463wmb.25.1672013243913;
        Sun, 25 Dec 2022 16:07:23 -0800 (PST)
Received: from localhost (net-93-66-87-81.cust.vodafonedsl.it. [93.66.87.81])
        by smtp.gmail.com with ESMTPSA id y24-20020a05600c365800b003cf894dbc4fsm11944783wmq.25.2022.12.25.16.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 16:07:23 -0800 (PST)
Date:   Mon, 26 Dec 2022 01:07:22 +0100
From:   Alain Carlucci <alain.carlucci@gmail.com>
To:     linux-input@vger.kernel.org
Cc:     jikos@kernel.org
Subject: [PATCH] HID: sony: Fix division by zero
Message-ID: <20221226000722.2xgbvsnrl6k7f7tk@ananas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello,

Today I connected a partially broken DS4 via USB and got a kernel
panic with a division by zero in the hid-sony driver.

The issue is caused by sens_denom=0 in the sensor calibration data,
which triggers a division by zero when dualshock4_parse_report() is
invoked, the division happens in the mult_frac() macro.

This patch applies a workaround that allows the DS4 to be used even
with a broken sensor: if the denominator sent by the device is zero,
it is replaced with 1 and a warning is emitted.

Signed-off-by: Alain Carlucci <alain.carlucci@gmail.com>
---
  drivers/hid/hid-sony.c | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)

diff --git a/drivers/hid/hid-sony.c b/drivers/hid/hid-sony.c
index 13125997a..f8b05cb29 100644
--- a/drivers/hid/hid-sony.c
+++ b/drivers/hid/hid-sony.c
@@ -1714,6 +1714,7 @@ static int dualshock4_get_calibration_data(struct sony_sc *sc)
  	short acc_z_plus, acc_z_minus;
  	int speed_2x;
  	int range_2g;
+	int calib_id;
  
  	/* For Bluetooth we use a different request, which supports CRC.
  	 * Note: in Bluetooth mode feature report 0x02 also changes the state
@@ -1858,6 +1859,23 @@ static int dualshock4_get_calibration_data(struct sony_sc *sc)
  	sc->ds4_calib_data[5].sens_numer = 2*DS4_ACC_RES_PER_G;
  	sc->ds4_calib_data[5].sens_denom = range_2g;
  
+	for (calib_id = 0; calib_id < 6; calib_id++) {
+		/* Ensure there are no denominators equal to zero to prevent
+		 * crashes while dividing by that number.
+		 */
+
+		if (sc->ds4_calib_data[calib_id].sens_denom != 0) {
+			/* Denominator OK, skip this */
+			continue;
+		}
+
+		sc->ds4_calib_data[calib_id].sens_denom = 1;
+
+		hid_warn(sc->hdev,
+			 "DualShock 4 USB dongle: invalid calibration for sensor %d\n",
+			 calib_id);
+	}
+
  err_stop:
  	kfree(buf);
  	return ret;
-- 
2.39.0
