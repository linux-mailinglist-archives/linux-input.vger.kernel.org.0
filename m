Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E4A0629B03
	for <lists+linux-input@lfdr.de>; Tue, 15 Nov 2022 14:48:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiKONsK (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Nov 2022 08:48:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbiKONsJ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Nov 2022 08:48:09 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 670BC23BEA
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 05:48:08 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id t25-20020a1c7719000000b003cfa34ea516so1042669wmi.1
        for <linux-input@vger.kernel.org>; Tue, 15 Nov 2022 05:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIS5eHal+qUifmyZdRDNhM3XXOTFE+aF0LiTFx6wdc8=;
        b=k0TbOs70XxoAf2pRgXC/zOwru86DBZYxRcfP7Ll85++IM7nQhMima5aYm+PZ7HSQBK
         zXWDzCnrA0PutGSqpMF6/JTJSSBrasp1tEaGlBL5i+0449J6ni6J3meVUH7bmzlzVqbe
         vvVrCszzpo8gd/vpS13zCMO+F4qd/V385kmqH/9VJN0up0lrvxMI87DAcb/+rEUsiDJw
         NX2sr5WQQN4KOufDSLA5BSEqEscTeYRl6H66B9UI/gQulJxgU7s5Ti0jOnkFYYLbtbwu
         I2zNhL4WyiXmXXL9XgrNMe0/6aC2JwAl29L4yHc2JUTr2ZANLMDhsJQQls+Qbg34jekq
         Ri0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIS5eHal+qUifmyZdRDNhM3XXOTFE+aF0LiTFx6wdc8=;
        b=iQEti9JwWytvibeX08i/9rtPxxo1kg4vDq9P2sGsp8oW2wj2pNO4mTFy6RieOTmyuV
         wMKegQ7tBB6RMSskylG/Ix1wJ3mR95RR4BEVIm62718+YRYq4pbdqlOcePWHeHcTnu1C
         Gimk20tKP7TS6s1a3hgZsNJetJYOWUdFR/OTeGekD/L4lPYcZ4us//R3+6YyJjpgf2xa
         0TfqxX/OuWv485Nevgf38nqJOyghzDw+AThJx+DRTxcvWg8KUl3SJ6VW2uHAHmpfTRc6
         cglLhGql+XRPVF+0Ahtf1kHA3xbC0hLrFpdWZqjcZANvfwiy3vNYOVyuexK6UA2nHxho
         NLpw==
X-Gm-Message-State: ANoB5pn8W/ylw4io59EXtTjm+dkqoRYgc5uExHQ6SufEnbV9rRDbh7JF
        5+J3kD7fRL4cGvsdRj/cSs0=
X-Google-Smtp-Source: AA0mqf42e2gmlO+u1YYw09KsCsZilSO/IAJPgs0z0p/xyul/pi1AHWq+yv3KG/24Hu8LfgLrGsflNQ==
X-Received: by 2002:a7b:c40a:0:b0:3cf:b1c2:c92c with SMTP id k10-20020a7bc40a000000b003cfb1c2c92cmr1567918wmi.193.1668520086914;
        Tue, 15 Nov 2022 05:48:06 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id n10-20020adff08a000000b002368f6b56desm14721850wro.18.2022.11.15.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 05:48:06 -0800 (PST)
Date:   Tue, 15 Nov 2022 16:48:03 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     roderick@gaikai.com
Cc:     linux-input@vger.kernel.org
Subject: [bug report] HID: playstation: add DualShock4 accelerometer and
 gyroscope support.
Message-ID: <Y3OYkwNSevtPP2B2@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Roderick Colenbrander,

The patch 12882ed83c58: "HID: playstation: add DualShock4
accelerometer and gyroscope support." from Oct 29, 2022, leads to the
following Smatch static checker warning:

	drivers/hid/hid-playstation.c:1766 dualshock4_get_calibration_data()
	warn: ignoring unreachable code.

drivers/hid/hid-playstation.c
    1727 static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
    1728 {
    1729         struct hid_device *hdev = ds4->base.hdev;
    1730         short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
    1731         short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
    1732         short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
    1733         short gyro_speed_plus, gyro_speed_minus;
    1734         short acc_x_plus, acc_x_minus;
    1735         short acc_y_plus, acc_y_minus;
    1736         short acc_z_plus, acc_z_minus;
    1737         int speed_2x;
    1738         int range_2g;
    1739         int ret = 0;
    1740         uint8_t *buf;
    1741 
    1742         if (ds4->base.hdev->bus == BUS_USB) {
    1743                 int retries;
    1744 
    1745                 buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
    1746                 if (!buf)
    1747                         return -ENOMEM;
    1748 
    1749                 /* We should normally receive the feature report data we asked
    1750                  * for, but hidraw applications such as Steam can issue feature
    1751                  * reports as well. In particular for Dongle reconnects, Steam
    1752                  * and this function are competing resulting in often receiving
    1753                  * data for a different HID report, so retry a few times.
    1754                  */
    1755                 for (retries = 0; retries < 3; retries++) {
    1756                         ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
    1757                                         DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
    1758                         if (ret) {
    1759                                 if (retries < 2) {
    1760                                         hid_warn(hdev, "Retrying DualShock 4 get calibration report (0x02) request\n");
    1761                                         continue;
                                                 ^^^^^^^^^
    1762                                 } else {
    1763                                         ret = -EILSEQ;
    1764                                         goto err_free;
                                                 ^^^^^^^^^^^^^^
    1765                                 }
--> 1766                                 hid_err(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
    1767                                 goto err_free;

Dead code.

    1768                         } else {
    1769                                 break;
    1770                         }
    1771                 }
    1772         } else { /* Bluetooth */
    1773                 buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, GFP_KERNEL);
    1774                 if (!buf)
    1775                         return -ENOMEM;
    1776 

regards,
dan carpenter
