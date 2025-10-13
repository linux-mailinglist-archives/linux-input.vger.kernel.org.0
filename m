Return-Path: <linux-input+bounces-15434-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F789BD64B4
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 22:55:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22287406BCB
	for <lists+linux-input@lfdr.de>; Mon, 13 Oct 2025 20:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9350F2C11F0;
	Mon, 13 Oct 2025 20:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gvuPO2Re"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f202.google.com (mail-il1-f202.google.com [209.85.166.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C462C11D1
	for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 20:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388943; cv=none; b=pI5JgIhfrrdYemOvAqe0KAgmxna9oykJdpfXU8sgqd3IFrAnUmc0L+LSlbrOK1yQTLMU46eaPY2n/4V3TieBuyQj+Ys/JXbhqU3FI8trWiMDN7SFzZbUsX6yuUNO5ABPAW7sDTxOGbi9cUec/Av4rEyR0205w+CnjIWTZGy04VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388943; c=relaxed/simple;
	bh=g5aeWjEsyrEgtXYmT9bLZgoNYfmNd7RVniAPQYIhaqU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=TMi3sb4KHJLLjwiGEU8/YLDRAFtDt0Tuv72o6RBXut0jSlYpM2bcWOnZOclba15hDdqkL3SwDOvxHIg9bSSNdXAi1l3E5xhwUcRJx6CaBKCZLzKbvBj1KWnkiytI1+yginQI9HKN0HA/69YcHf53QS09tOEPCHzNSaUJbHJuAF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gvuPO2Re; arc=none smtp.client-ip=209.85.166.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Received: by mail-il1-f202.google.com with SMTP id e9e14a558f8ab-42f9f48ee30so7112845ab.2
        for <linux-input@vger.kernel.org>; Mon, 13 Oct 2025 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760388941; x=1760993741; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2VkMZvVeagPungxdvXSEeNR4Y/36U6V3Y2qAoJc2LE=;
        b=gvuPO2ReOeqXobhJqHkJWoAeoB/mIK2uPhtqm0v34xB24+1yxOTSnqiKR7/EzJtJ5p
         ucFUC0plDsS/dpGNEBoFdgUkynR1EIVJy6xdDF943wLqu6sU2naKrwI3CYLfPUbw+zYT
         qpwiowL74I4aiY/L1lzdd7X2VdGQT2e6wMtI6oqRZn2EQNZtSIxAtkvJ1WC5egwmllPR
         V+6PUANBQOnOL9PP3IzXIcaHLEpz6DK3c7YQSXjmhlwZ+Cqr+SZVkGnForXqo6XXtQJP
         +3vXnUASREQbLBKhsizBLeU9GgGbkeWWxdyjXuGC7KdOBZsOu4AVD49oprRviY5b/Hun
         14Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388941; x=1760993741;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n2VkMZvVeagPungxdvXSEeNR4Y/36U6V3Y2qAoJc2LE=;
        b=nvmSNf86SJAsFhd519viGGuZD90l8tQaEsaZy22qFbsCij4dQHrqlsI6jji8f1AHLo
         anIR3++Nbo6NCvuhwr86R2ioF+EbLTneS69LPYFZh4TlLx8+bEcA28sA6ZITLZLTBIJJ
         Bxi3So3xA7Fixw8Q18xM9iL9sodSmEwuFr9kQtHefeapRB10oSpDv22PsxYeUnQhr+g1
         ZpaCySsccVIZ+KR6lcWxCy1GmIfyC9DQLikrhffwVj5JQiyCZ1Sn6WXVkcPqX2C+oXhj
         AdHKyjzPnKnyjEi/iA6KHYxv9Zf61IGxpl4MHkyKqWAUKJ8q4T0Ue99pJncBAU+tR0aL
         KWbA==
X-Forwarded-Encrypted: i=1; AJvYcCVXjEoDC5k1GXWMvfOe3Bi3HJOrA5ATFXOlF7xkut9GH4hg93ITeahgUJ0sd1yhfRk5rokMRje5U3c8MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFGfg1KhR26Hrj9oUF1y1dvzYDOwYlmB6Qe0drPkzKsp6mMvrf
	eKK21STXLJBTumW/NiYZ2fUcK3lOUp/qc29CoLBg/BSlQG//7A7fqGEWnsV+jBvNfw3YXri5t8v
	Z68E464ti1g==
X-Google-Smtp-Source: AGHT+IFzT35HVcIiSr0TCH6YF669Y1WMCSqZlPkuDacbU/ha+9HSwmUUwPGAawwWvCgwzzHXwduN3fJZgkT3
X-Received: from ilvk5.prod.google.com ([2002:a05:6e02:1a85:b0:425:c6a0:25a8])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:4509:20b0:42f:9b79:f8cd
 with SMTP id e9e14a558f8ab-42f9b79fcebmr135607215ab.16.1760388941161; Mon, 13
 Oct 2025 13:55:41 -0700 (PDT)
Date: Mon, 13 Oct 2025 20:54:57 +0000
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIACBn7WgC/x2MywqAIBAAfyX23ILa49CvRAdzV10CC40Ion9PO
 s7AzAOFs3CBqXkg8yVF9lRBtw24aFNgFKoMRplBK91hFMJoj1Mcbm5PXgJ6uXHsevJmJes0QY2 PzFX/43l53w8+vguDaAAAAA==
X-Change-Id: 20251013-hid-haptic-kconfig-fix-634df2bdac1d
X-Mailer: b4 0.14.2
Message-ID: <20251013-hid-haptic-kconfig-fix-v1-1-b1ad90732625@google.com>
Subject: [PATCH] HID: Kconfig: Fix build error from CONFIG_HID_HAPTIC
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Randy Dunlap <rdunlap@infradead.org>, 
	Lucas GISSOT <lucas.gissot.pro@gmail.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

Temporarily change CONFIG_HID_HAPTIC to be bool instead of tristate, until
we implement a permanent solution.

---
Recently the CONFIG_HID_HAPTIC Kconfig option was reported as causing
the following build errors:

  MODPOST Module.symvers
ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1

when the kernel is compiled with the following configuration:

CONFIG_HID=y
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_HAPTIC=m

To resolve this, temporarily change the CONFIG_HID_HAPTIC option to be
bool, until we arrive at a permanent solution to enable CONFIG_HID_HAPTIC
to be tristate.

For a more detailed discussion, see [1].

[1]: https://lore.kernel.org/linux-input/auypydfkhx2eg7vp764way4batdilzc35inqda3exwzs3tk3ff@oagat6g46zto/

Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
index 5341aa79f387bd0e5a76266b5928d2c978dd81cf..04420a713be085c8871b4d35255fde4cafd8de0f 100644
--- a/drivers/hid/Kconfig
+++ b/drivers/hid/Kconfig
@@ -93,7 +93,7 @@ config HID_GENERIC
 	If unsure, say Y.
 
 config HID_HAPTIC
-	tristate "Haptic touchpad support"
+	bool "Haptic touchpad support"
 	default n
 	help
 	Support for touchpads with force sensors and haptic actuators instead of a

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251013-hid-haptic-kconfig-fix-634df2bdac1d

Best regards,
-- 
Jonathan Denose <jdenose@google.com>


