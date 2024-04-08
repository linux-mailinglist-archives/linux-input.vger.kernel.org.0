Return-Path: <linux-input+bounces-2851-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5605E89B9EE
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 10:14:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B9F0282EF6
	for <lists+linux-input@lfdr.de>; Mon,  8 Apr 2024 08:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A005381E;
	Mon,  8 Apr 2024 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n4xwX0H8"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642E653805
	for <linux-input@vger.kernel.org>; Mon,  8 Apr 2024 08:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712563835; cv=none; b=sI2rUpM6qZrg/78KRxDOkFHFHSZ4V+F1/O8UT8By7UnKwT+8cCslz1vNaOjKkZZAVWSmvL1mjUe3Z01pDzjM5ibzAGjRnIXnu6qc7rL9qi20r3laU7/ZHi+ZBHAS0OueQSgLSBmB1PX+fzXW/KVlAnf5E2NVCQm0X/v3Y25aWIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712563835; c=relaxed/simple;
	bh=D2T8h8ggxKCFm28hbNvceZbMV7aoJNKaNZZON0XTma4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CNUTDCdmxuI0sGbrovQKK3qZmLD3Di/XMdyKbfC6XcQG0LwQJXmgEp+Gp/FCapfXVrTuqhBw2aO8rFjmODH5+6kaLeHaDrcSs88M7PfqoRg1yVVKd+fROiWrLGPP9XJ/ZyIWGSLlmIxoDdvAwsIt+/34rTuE8bhMupknz2svZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n4xwX0H8; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a51d83fafa8so61341766b.0
        for <linux-input@vger.kernel.org>; Mon, 08 Apr 2024 01:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712563832; x=1713168632; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ssdVgC51ikTzWRAyn74DKIBndfsqEBKQxjuIyr7n6Y=;
        b=n4xwX0H8IbHAqrhRptVDlC2tyGHm0iTLvhm5ODnVS5ru5J9yJstogV1FuPxa8KauPo
         Vl14VROCJoYuHElv0QnyhwjhERMC7imhH/qbHrzmkk+qMrbb47AMk8ruAeCZBFlRhFoe
         zBJvpSbemesEfry01b1YJb6COWcjzuTiotaK4jM78kQQ1tMgMrzHmBhakxWuCZAY4H62
         BGbFB7g+UhGWFsHpIaIiRbGncQGeEV8sLbyLbx2qtE2mRSTQHzBt25bS4Tcz/6Jfh1jv
         S9TN98hC6tPIKWFYJxXXXG6TM7GEvxQNvkWE5VbhSNpwhrbZBD2bPEGbs6DT5Bx0L6er
         LySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712563832; x=1713168632;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ssdVgC51ikTzWRAyn74DKIBndfsqEBKQxjuIyr7n6Y=;
        b=uICqMfJKb6T2jBgcRdT6EI2yEzsMzgWfoFpNfhsQ0gCIMm59t2r8mZH5PqdFyhYRI/
         xZL4lG8JEphnVWls4j0oeYZkh7DvkVIiPeF/DGuiocKogz2oe6hz+UmuHEC0bn0RbuU+
         vdR/JXNrRwPYS8TtTyywTQxSrgqqSNZD9TcQ0+Fo7dUopuYdQhDadL/bnFByGylRwd5m
         /siWXpV/p5r9QuXh6fYkDz9+W/xLHsNU9sfo+vJ+YpgV41JLcw4+PsHb8j/9tnD+a7gH
         Hszu1BpUNZPPgBO2ek2uwtgh61uqSqsE4PdjHaupL9w+Bxmv6E9wNEuT3MvwyWMNv0dk
         XEiA==
X-Gm-Message-State: AOJu0YyXbcYGhJlDbzeiuIS+waRri3VXAwBO3D6q6kP7yfv69vzqVWri
	9gXher3CCd2rOTfz2XLzUGHCYPyAbb98UT22fxoerxwyP7KElO4kyOWSJ7YFZ7CKuPUlOfNUMij
	f
X-Google-Smtp-Source: AGHT+IESUnfNiqg0PPbDJBApxdbwIuMZId3cC4Zb+BeskwZZZVRL6U6SJx7fGGrRTt7eg0uCReo7ew==
X-Received: by 2002:a17:906:fb09:b0:a51:dcda:dcde with SMTP id lz9-20020a170906fb0900b00a51dcdadcdemr584973ejb.70.1712563831676;
        Mon, 08 Apr 2024 01:10:31 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id en1-20020a17090728c100b00a51adace6ebsm3513516ejc.79.2024.04.08.01.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 01:10:31 -0700 (PDT)
Date: Mon, 8 Apr 2024 10:41:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: max@enpas.org
Cc: linux-input@vger.kernel.org
Subject: [bug report] HID: playstation: DS4: Don't fail on calibration data
 request
Message-ID: <d0e5bb97-3e18-44ac-89b0-503cfe16417f@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Max Staudt,

Commit a48a7cd85f55 ("HID: playstation: DS4: Don't fail on
calibration data request") from Feb 8, 2024 (linux-next), leads to
the following Smatch static checker warning:

drivers/hid/hid-playstation.c:1904 dualshock4_get_calibration_data() error: uninitialized symbol 'acc_x_minus'.
drivers/hid/hid-playstation.c:1904 dualshock4_get_calibration_data() error: uninitialized symbol 'acc_x_plus'.
drivers/hid/hid-playstation.c:1910 dualshock4_get_calibration_data() error: uninitialized symbol 'acc_y_minus'.
drivers/hid/hid-playstation.c:1910 dualshock4_get_calibration_data() error: uninitialized symbol 'acc_y_plus'.
drivers/hid/hid-playstation.c:1916 dualshock4_get_calibration_data() error: uninitialized symbol 'acc_z_minus'.
drivers/hid/hid-playstation.c:1916 dualshock4_get_calibration_data() error: uninitialized symbol 'acc_z_plus'.

drivers/hid/hid-playstation.c
    1768 static int dualshock4_get_calibration_data(struct dualshock4 *ds4)
    1769 {
    1770         struct hid_device *hdev = ds4->base.hdev;
    1771         short gyro_pitch_bias, gyro_pitch_plus, gyro_pitch_minus;
    1772         short gyro_yaw_bias, gyro_yaw_plus, gyro_yaw_minus;
    1773         short gyro_roll_bias, gyro_roll_plus, gyro_roll_minus;
    1774         short gyro_speed_plus, gyro_speed_minus;
    1775         short acc_x_plus, acc_x_minus;
    1776         short acc_y_plus, acc_y_minus;
    1777         short acc_z_plus, acc_z_minus;
    1778         int speed_2x;
    1779         int range_2g;
    1780         int ret = 0;
    1781         int i;
    1782         uint8_t *buf;
    1783 
    1784         if (ds4->base.hdev->bus == BUS_USB) {
    1785                 int retries;
    1786 
    1787                 buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_SIZE, GFP_KERNEL);
    1788                 if (!buf) {
    1789                         ret = -ENOMEM;
    1790                         goto no_buffer_tail_check;

acc_x_minus and friends are not initialized.

    1791                 }
    1792 
    1793                 /* We should normally receive the feature report data we asked
    1794                  * for, but hidraw applications such as Steam can issue feature
    1795                  * reports as well. In particular for Dongle reconnects, Steam
    1796                  * and this function are competing resulting in often receiving
    1797                  * data for a different HID report, so retry a few times.
    1798                  */
    1799                 for (retries = 0; retries < 3; retries++) {
    1800                         ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION, buf,
    1801                                         DS4_FEATURE_REPORT_CALIBRATION_SIZE, true);
    1802                         if (ret) {
    1803                                 if (retries < 2) {
    1804                                         hid_warn(hdev, "Retrying DualShock 4 get calibration report (0x02) request\n");
    1805                                         continue;
    1806                                 }
    1807 
    1808                                 hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
    1809                                 ret = -EILSEQ;
    1810                         } else {
    1811                                 break;
    1812                         }
    1813                 }
    1814         } else { /* Bluetooth */
    1815                 buf = kzalloc(DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, GFP_KERNEL);
    1816                 if (!buf) {
    1817                         ret = -ENOMEM;
    1818                         goto no_buffer_tail_check;
    1819                 }
    1820 
    1821                 ret = ps_get_report(hdev, DS4_FEATURE_REPORT_CALIBRATION_BT, buf,
    1822                                 DS4_FEATURE_REPORT_CALIBRATION_BT_SIZE, true);
    1823 
    1824                 if (ret)
    1825                         hid_warn(hdev, "Failed to retrieve DualShock4 calibration info: %d\n", ret);
    1826         }
    1827 
    1828         /* Parse buffer. If the transfer failed, this safely copies zeroes. */
    1829         gyro_pitch_bias  = get_unaligned_le16(&buf[1]);
    1830         gyro_yaw_bias    = get_unaligned_le16(&buf[3]);
    1831         gyro_roll_bias   = get_unaligned_le16(&buf[5]);
    1832         if (ds4->base.hdev->bus == BUS_USB) {
    1833                 gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
    1834                 gyro_pitch_minus = get_unaligned_le16(&buf[9]);
    1835                 gyro_yaw_plus    = get_unaligned_le16(&buf[11]);
    1836                 gyro_yaw_minus   = get_unaligned_le16(&buf[13]);
    1837                 gyro_roll_plus   = get_unaligned_le16(&buf[15]);
    1838                 gyro_roll_minus  = get_unaligned_le16(&buf[17]);
    1839         } else {
    1840                 /* BT + Dongle */
    1841                 gyro_pitch_plus  = get_unaligned_le16(&buf[7]);
    1842                 gyro_yaw_plus    = get_unaligned_le16(&buf[9]);
    1843                 gyro_roll_plus   = get_unaligned_le16(&buf[11]);
    1844                 gyro_pitch_minus = get_unaligned_le16(&buf[13]);
    1845                 gyro_yaw_minus   = get_unaligned_le16(&buf[15]);
    1846                 gyro_roll_minus  = get_unaligned_le16(&buf[17]);
    1847         }
    1848         gyro_speed_plus  = get_unaligned_le16(&buf[19]);
    1849         gyro_speed_minus = get_unaligned_le16(&buf[21]);
    1850         acc_x_plus       = get_unaligned_le16(&buf[23]);
    1851         acc_x_minus      = get_unaligned_le16(&buf[25]);
    1852         acc_y_plus       = get_unaligned_le16(&buf[27]);
    1853         acc_y_minus      = get_unaligned_le16(&buf[29]);
    1854         acc_z_plus       = get_unaligned_le16(&buf[31]);
    1855         acc_z_minus      = get_unaligned_le16(&buf[33]);
    1856 
    1857         /*
    1858          * Set gyroscope calibration and normalization parameters.
    1859          * Data values will be normalized to 1/DS4_GYRO_RES_PER_DEG_S degree/s.
    1860          */
    1861         speed_2x = (gyro_speed_plus + gyro_speed_minus);
    1862         ds4->gyro_calib_data[0].abs_code = ABS_RX;
    1863         ds4->gyro_calib_data[0].bias = 0;
    1864         ds4->gyro_calib_data[0].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
    1865         ds4->gyro_calib_data[0].sens_denom = abs(gyro_pitch_plus - gyro_pitch_bias) +
    1866                         abs(gyro_pitch_minus - gyro_pitch_bias);
    1867 
    1868         ds4->gyro_calib_data[1].abs_code = ABS_RY;
    1869         ds4->gyro_calib_data[1].bias = 0;
    1870         ds4->gyro_calib_data[1].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
    1871         ds4->gyro_calib_data[1].sens_denom = abs(gyro_yaw_plus - gyro_yaw_bias) +
    1872                         abs(gyro_yaw_minus - gyro_yaw_bias);
    1873 
    1874         ds4->gyro_calib_data[2].abs_code = ABS_RZ;
    1875         ds4->gyro_calib_data[2].bias = 0;
    1876         ds4->gyro_calib_data[2].sens_numer = speed_2x*DS4_GYRO_RES_PER_DEG_S;
    1877         ds4->gyro_calib_data[2].sens_denom = abs(gyro_roll_plus - gyro_roll_bias) +
    1878                         abs(gyro_roll_minus - gyro_roll_bias);
    1879 
    1880         /* Done parsing the buffer, so let's free it. */
    1881         kfree(buf);
    1882 
    1883 no_buffer_tail_check:
    1884 
    1885         /*
    1886          * Sanity check gyro calibration data. This is needed to prevent crashes
    1887          * during report handling of virtual, clone or broken devices not implementing
    1888          * calibration data properly.
    1889          */
    1890         for (i = 0; i < ARRAY_SIZE(ds4->gyro_calib_data); i++) {
    1891                 if (ds4->gyro_calib_data[i].sens_denom == 0) {
    1892                         hid_warn(hdev, "Invalid gyro calibration data for axis (%d), disabling calibration.",
    1893                                         ds4->gyro_calib_data[i].abs_code);
    1894                         ds4->gyro_calib_data[i].bias = 0;
    1895                         ds4->gyro_calib_data[i].sens_numer = DS4_GYRO_RANGE;
    1896                         ds4->gyro_calib_data[i].sens_denom = S16_MAX;
    1897                 }
    1898         }
    1899 
    1900         /*
    1901          * Set accelerometer calibration and normalization parameters.
    1902          * Data values will be normalized to 1/DS4_ACC_RES_PER_G g.
    1903          */
--> 1904         range_2g = acc_x_plus - acc_x_minus;
                            ^^^^^^^^^^^^^^^^^^^^^^^^^

    1905         ds4->accel_calib_data[0].abs_code = ABS_X;
    1906         ds4->accel_calib_data[0].bias = acc_x_plus - range_2g / 2;
    1907         ds4->accel_calib_data[0].sens_numer = 2*DS4_ACC_RES_PER_G;
    1908         ds4->accel_calib_data[0].sens_denom = range_2g;
    1909 
    1910         range_2g = acc_y_plus - acc_y_minus;
    1911         ds4->accel_calib_data[1].abs_code = ABS_Y;
    1912         ds4->accel_calib_data[1].bias = acc_y_plus - range_2g / 2;
    1913         ds4->accel_calib_data[1].sens_numer = 2*DS4_ACC_RES_PER_G;
    1914         ds4->accel_calib_data[1].sens_denom = range_2g;

regards,
dan carpenter

