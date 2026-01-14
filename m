Return-Path: <linux-input+bounces-17099-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD101D21130
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 20:43:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 55597301274C
	for <lists+linux-input@lfdr.de>; Wed, 14 Jan 2026 19:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8138347FC0;
	Wed, 14 Jan 2026 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJuX9a2y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56410346AC6
	for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419830; cv=none; b=lXzXQib5yNcDZIYgL5nHz0PJQgC/vJv7VqYtXdWgawmY+1X9/ygmcd1E1DtqfT4Ao4yLlnOw9GkLv7gBuRRxaPOyqYFaDhiMhDcOgt0gxAEBmUj8jhRkq3XLuIWaiS6YQTFvV/UgF0lAFfORY/eXN2m6bQfDvTAp1v3LLbYqiSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419830; c=relaxed/simple;
	bh=ECsyCZR1oem+N3GAJxPI3yL96zKRIx0/UUcTOdfTf9s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nwhmKuE+1aIoMGR0Ej1tH9/tcgXenz6zJ2tYr7DpKUd+YVQ/lxq8+C8haPfl+GKHuEfiY0sMbE4nvPQsVAoMOJ6CKevBA5We1zP4X8aV2t25gEGvjfDWn6m8YX5DWAHNtXinZ/BxM0pkVORlR0D5y7VwSyGoxMDsfWUaBL+Lp/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJuX9a2y; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c07bc2ad13so12406785a.2
        for <linux-input@vger.kernel.org>; Wed, 14 Jan 2026 11:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768419828; x=1769024628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Pc2s5FmDLZbixCr2af+4LcE/WrMe2mhGjN+MEfbV9yI=;
        b=MJuX9a2yll5Pj7yC+cPxe4S8YptYMj38Hk+0TO/98cYqIceclXcx003RZpsBYwVFSH
         RgdBlYgh979I2upPjx0TmytgT5EFLz7p/aVDcFcp1dAXj4PFLaImlbav63AKLsb/UutB
         Y3qSVIj9SBxn3tUVWlYj7WwGCkDnxGsKVSteInpDrNuAUAbKsyMYJoSmBHtCs+r5FbX4
         VKB9ca8WpPTrN7r6f8Rp9cV0TymMQE2FW3TA/0EZyomoTySO4IZ+wyDMO9GIFlB6AWLE
         sZGXkPRTVuVHi2f8SBHYHfo0qoj9ui6udewJo8LMDgv6DCQD1YzzK/DxqTlc3UAfiFHs
         8AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768419828; x=1769024628;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pc2s5FmDLZbixCr2af+4LcE/WrMe2mhGjN+MEfbV9yI=;
        b=a9UgybS3wo9/fgz8Dv9TUq2S8BFX3i3U4V3osgp2+8OAJh0O9vJ6Drgh2cI0vMSxgS
         1dFGjtwmpKhfKkAichGM+F3+vOlieBDf9vC5ojBd7/839vhlMp2IA7/eJzKJsMFKPKQy
         RiZCU5AsSaZDef9fOM7is4T0eNF+3bXuBCU9xZleg1I+ZBOXx1NLtpEaf4hxyUn3zsNo
         LKXtnvM036PaXMS7nTf5D03w9VCkZE690OWrqjg+9K7C8T/k07Hk/YVZq2E3mkIKrRVj
         rSysPDAFzWnHn5c49upeymgxadilvcrTKlsoYUjrQHvPn5scf7V+qj5ECdESTk/naJOl
         J8Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXIRoBCmJ0tpSBPliigFCSJILzhOHkoJGnFy8v3qWUDdmEZD2ETNbIQZGX/Fnzr7K1wq07fryUCCxJ73g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymo6EaDLDkJTskCtCcHkimNa1E66jfsrS5HeLLiOWTksR5gK+m
	7Vb8CYEbB97thHbXeS+qsUSDvjhxP6r4LF2DZODQT0GDveD0ps8cXTcwNAh86zlQax5v23BG3Wt
	jIpRsl6oxFVUmVht7oYZH7bDqEl7HoA==
X-Gm-Gg: AY/fxX4CU5jUWqj+dX7+LeMUFz4UmGYdI0p6W469Vkn03SJ1CyVgm7EjgNJR1ck3Jy0
	3CXKYa/ucQnkODm2MhG4KLxNGvyQbP5uu/r/6LFawlVtiyJpIhBL0Yy4P31qATffaowdnxciYVT
	WBY80rllRYFvysd67i+E3yLW/dHy5+uXFU9BZ7gyiRDzClC4/qWWQBmHVvKx5X5SgOapAoFzQHr
	2L44ILTA6dM/JsUHqDPk/7zW5/4SEjliGfsgTMgLtiNBJuO1Nv22dodLv9QKBYDy2mgzA==
X-Received: by 2002:a05:622a:38e:b0:501:f700:1792 with SMTP id
 d75a77b69052e-501f7001a62mr4263141cf.79.1768419828089; Wed, 14 Jan 2026
 11:43:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Date: Thu, 15 Jan 2026 03:43:37 +0800
X-Gm-Features: AZwV_QilhZAfru7k85cYgLWDqfKfRXH9sFbHBIVEaZpVdS51qPNRri8u1O4RMHc
Message-ID: <CALEuBan7Knm3G3eXPd8BZ37jVQFtRs7fAssts+picVKHBjGBqQ@mail.gmail.com>
Subject: [PATCH] Input: atmel_mxt_ts - fix NULL pointer dereference in mxt_object_show
To: nick@shmanahar.org, dmitry.torokhov@gmail.com
Cc: rydberg@euromail.se, jy0922.shim@samsung.com, bleung@chromium.org, 
	ezequiel@vanguardiasur.com.ar, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?6b2Q5p+v5a6H?= <qikeyu2017@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This fix was discovered through static code analysis.

In mxt_object_show(), the code directly dereferences data->info and
data->object_table without checking if they are NULL. This can lead to
a NULL pointer dereference kernel crash when the sysfs file is accessed
during firmware update or device removal.

[Call Chain Analysis]
The vulnerable sysfs handler is exposed through the following registration:

  Driver registration:
    mxt_driver.driver.dev_groups = mxt_groups
      -> mxt_attrs[] contains:
         - dev_attr_object.attr     -> mxt_object_show()     [VULNERABLE]
         - dev_attr_update_fw.attr  -> mxt_update_fw_store()
                                                           [TRIGGERS FREE]

  Initialization path:
    mxt_probe()
      -> mxt_initialize()
        -> mxt_read_info_block()
          -> data->info = (struct mxt_info *)id_buf        [line 1918]
          -> data->object_table = (struct mxt_object *)... [line 1934]

  Resource release path (called during firmware update or device removal):
    mxt_update_fw_store() OR mxt_remove()
      -> mxt_free_object_table()
        -> data->object_table = NULL  [line 1713]
        -> data->info = NULL          [line 1714]

[Data Flow Analysis]
The critical data flow is:

  data->info:
    - Allocated and set in mxt_read_info_block() from id_buf
    - Released and set to NULL in mxt_free_object_table()
    - Accessed in mxt_object_show() at line 2868: data->info->object_num

  data->object_table:
    - Set in mxt_read_info_block() as pointer into id_buf
    - Set to NULL in mxt_free_object_table()
    - Accessed in mxt_object_show() at line 2869: data->object_table + i

[Race Condition Scenario]
The vulnerability can be triggered by the following race condition:

  Thread A (reading sysfs)           Thread B (firmware update)
  --------------------------         --------------------------
  T1: open /sys/.../object
  T2: mxt_object_show()
  T3: data = dev_get_drvdata(dev)
  T4: obuf = kmalloc(...)
                                     T5: echo fw > /sys/.../update_fw
                                     T6: mxt_update_fw_store()
                                     T7: mxt_free_object_table()
                                     T8: data->info = NULL
  T9: for (i < data->info->object_num)
      -> NULL pointer dereference!

[User-Triggerable Paths]
Users can trigger this vulnerability through:

  1. Firmware update race condition (requires root):
     Terminal A: # cat /sys/bus/i2c/devices/<dev>/object
     Terminal B: # echo firmware.bin > /sys/bus/i2c/devices/<dev>/update_fw

  2. Device unbind race condition (requires root):
     Terminal A: # cat /sys/bus/i2c/devices/<dev>/object
     Terminal B: # echo "<dev>" > /sys/bus/i2c/drivers/atmel_mxt_ts/unbind

  3. Physical device removal:
     Reading sysfs while physically removing the touchscreen device

How to fix:
Add NULL checks for data->info and data->object_table at the beginning
of mxt_object_show() to prevent NULL pointer dereference when these
resources are freed during concurrent firmware update or device removal.

Fixes: 4cf51c383d7a ("Input: Add ATMEL QT602240 touchscreen driver")
Fixes: 068bdb67ef74 ("Input: atmel_mxt_ts - fix the firmware update")
Signed-off-by: Kery Qi <qikeyu2017@gmail.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c
b/drivers/input/touchscreen/atmel_mxt_ts.c
index dd0544cc1bc1..401fcae2264d 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -2859,6 +2859,10 @@ static ssize_t mxt_object_show(struct device *dev,
  int error;
  u8 *obuf;

+ /* Check for NULL to prevent race condition during firmware update */
+ if (!data->info || !data->object_table)
+   return -ENODEV;
+
  /* Pre-allocate buffer large enough to hold max sized object. */
  obuf = kmalloc(256, GFP_KERNEL);
  if (!obuf)
-- 
2.34.1

