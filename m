Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEBE212AB32
	for <lists+linux-input@lfdr.de>; Thu, 26 Dec 2019 10:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbfLZJWc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 26 Dec 2019 04:22:32 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:49992 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbfLZJWb (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 26 Dec 2019 04:22:31 -0500
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chia-lin.kao@canonical.com>)
        id 1ikPLh-0004ig-O2
        for linux-input@vger.kernel.org; Thu, 26 Dec 2019 09:22:29 +0000
Received: by mail-wr1-f71.google.com with SMTP id v17so10540546wrm.17
        for <linux-input@vger.kernel.org>; Thu, 26 Dec 2019 01:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=TNt04kFlxAJX+WAKJE2NLOKKM37LIXZ+D9p7JEtCd3U=;
        b=Of/TQJqyLZHlEHSw4oWyGTtraVK0P5tiagp4f4DbafvzftWyVV+7NqpkRRmzjQZ8YI
         zfKgkucsTFBQPK4oP8hmZT3S+Q5jGcJVRXqylmRD8YoX14v5eZA3ISRAZJwEiEkNbqJK
         2v4uMyXuLwyCDIa2L6yoMQa70XS/EGFJKmxecrMbhnZEu6i5IKXi0HyUxYwSys+JUZ2K
         bTN4faPGIgHB96uAEBE1a/zXA9kpELbNjiU1NncCvlsMRR4n2Mvp6PzOAEHiFVLzxaMg
         daqq+ko+qaU6ojYDeqFiWutoqZ4bhHxEZw+aiSx7ouzky8p0qD5VYz5/XQUlmU+mXgCo
         1fGQ==
X-Gm-Message-State: APjAAAUM6SReQAMRfiW02yI7G3wtCWNY8SDzB7qFOAkrXLPAYq1GOwfG
        z+iKB7TtgWi/+UGszjtOnS0Q8LojNeoeyS9ggQnCiTiS4+JrPv4Mpw/WX5wRJ1hNl0T6dMpBFQj
        RCINUkpFsg9TX0ma6NbjvMcQXUvMjvN8b2vaL4jI1Ir9w+JX9Lza79jLY
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr45315330wrp.378.1577352149521;
        Thu, 26 Dec 2019 01:22:29 -0800 (PST)
X-Google-Smtp-Source: APXvYqxru5cVc4h4n6ndB+KZ1f3fGjJXajZ/dftoXybIFxNlB5BFtYYghIVWuZcxoapi9bSViB8r6wshzsfsnhTLv94=
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr45315316wrp.378.1577352149359;
 Thu, 26 Dec 2019 01:22:29 -0800 (PST)
MIME-Version: 1.0
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Thu, 26 Dec 2019 17:22:18 +0800
Message-ID: <CAFv23QmiDdhe+xJw2y7CXiWq4-GK1S-1bcKxEpNhNJu3ZtzA_w@mail.gmail.com>
Subject: Display got wrong rotation after hid_sensor_accel_3d is loaded
To:     Jiri Kosina <jikos@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-input@vger.kernel.org, linux-iio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi all,

I'm working on a new platform which comes with an accelerator meter.
It's a STMicroelectronics LSM6DS3US accelerator meter, it doesn't use
st_sensors driver, but hid_sensor_accel_3d.
After hid_sensor_accel_3d is loaded, the display becomes upside down,
so I tried to add some code to make it become normal.(ACCEL_X should
have the same modification)

I don't know how to fix this in a correct way, please give me some hints.
Thanks.

diff --git a/drivers/iio/accel/hid-sensor-accel-3d.c
b/drivers/iio/accel/hid-sensor-accel-3d.c
index 24573eb647a3..8ca6a222b773 100644
--- a/drivers/iio/accel/hid-sensor-accel-3d.c
+++ b/drivers/iio/accel/hid-sensor-accel-3d.c
@@ -270,6 +270,8 @@ static int accel_3d_capture_sample(struct
hid_sensor_hub_device *hsdev,
               accel_state->accel_val[CHANNEL_SCAN_INDEX_X + offset] =
                                               *(u32 *)raw_data;
+               if (usage_id == HID_USAGE_SENSOR_ACCEL_Y_AXIS)
+                       accel_state->accel_val[CHANNEL_SCAN_INDEX_Y] *= -1;

Best regards,
AceLan Kao.
