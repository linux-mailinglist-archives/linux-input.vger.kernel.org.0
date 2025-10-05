Return-Path: <linux-input+bounces-15268-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E86BB9A8B
	for <lists+linux-input@lfdr.de>; Sun, 05 Oct 2025 19:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA3DA1895283
	for <lists+linux-input@lfdr.de>; Sun,  5 Oct 2025 17:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFDF1534EC;
	Sun,  5 Oct 2025 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAcm+jRW"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7C33985
	for <linux-input@vger.kernel.org>; Sun,  5 Oct 2025 17:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759687035; cv=none; b=g8BI37Sw6SGDjtPmha8oSQENpVOKUyJglaZlfVbbkKvE+SZ8XWVts4hzOEHZAZIQGNWOI+GvmOTretOnK8d1RWUTMRgn6CJXnVwtPw5SMrogDbwyitbHX4ZLtK+/5vKFEj0ltw3I6GDPjdJXVG6xdtE7cIuNHKThg4Qbn13vFhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759687035; c=relaxed/simple;
	bh=++gDfmk4EpURPwvxp0DGSZ8wO84rpdvkmG4Gu3Jn4Y8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=rRPdXurHbA4+JT9f5EvBeYalo7cXfCl17fqC2ygJHQWRf4pIXT5H/45hY5/4+RzNLmD99WKqSc5hyLDFML9TBXU4IPgg9cs6kcNk/Xo2uSyxV2yxK+YjanxhzSAY4J40K2PBjTQd6fESUn/sGCiUaEU1AS9dOmRNKmD8pCFb0N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAcm+jRW; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-279e2554c8fso38313795ad.2
        for <linux-input@vger.kernel.org>; Sun, 05 Oct 2025 10:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759687033; x=1760291833; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=++gDfmk4EpURPwvxp0DGSZ8wO84rpdvkmG4Gu3Jn4Y8=;
        b=dAcm+jRW5zEqIYVvbRfarJg0xb43HWc4UTvH80c6LojTLIKUrrEZbDmYK1CVHCdO2D
         +NpjDAsipBuiX1445JRhVmRe5D6gJ/Vz4IPpXQ2RpnZTEiyfCFpvZwEE0xTb4FBilnvz
         oQ0SfQDr5HkkJyGeAnP562pijfs4SzdxbP/HKQrgR9tpzKbzi7Ta+dir7D4GQjqL0Vco
         TrhZGuja/iLRab5KJcPXyDMolopk8FLCba+un/yTvsMhI5KgXbDsezA6+yE5pv5F3gEf
         X0G+gM8TSocwWtTNkvxCjee2+9Be+fKGnU5+1+cwduVUscBdAiatfSlDniQe3sLOLsF1
         I9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759687033; x=1760291833;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++gDfmk4EpURPwvxp0DGSZ8wO84rpdvkmG4Gu3Jn4Y8=;
        b=n+2wocC53pMFdaafK3KhARuXfWa2wFyV+EefGih9Ixl3EIkwlhQOc5u0T/0m0QG8pP
         dleU8UWLPAiBVCPVC1ehg5i0N3Xj49vVMmaoPmWlAX+jR6A4Tmag1mDnpOsOoJIPfitq
         mIc0Vq5Kj9s0LLti51MQm6WRbdhG08XMiYUxoHFYeV7GoJf4eKJiOKaUpIjaoeW8tucz
         u9rJtcf989o9sDIRKSusXpv3h5X5t+nhvk0W8wwLX2Ldew5XnDcXfddi4/KKXjLFFCD/
         Ix8jRb4nh6FvPLk8mHVzGP8L60y9653EhLFLpnnhdKzK75O9C1m2apJ66Ce1o7PTzHFx
         0ErA==
X-Gm-Message-State: AOJu0YxLG6MvLxQFhAflyLgxSxIpVxDROxextyUbL+HIh99ca7P1yJX3
	njc3GRq02aOyHLW620DaAmzOMOWqlAXVPdF8GQZU4BY5t1/dqTqDC6HUj/scFim4kAbbP6FOqjz
	sM+jSXNEk3KcHOmrHk8v/yyvf8rnmvtZUtjCLGRDpg88w
X-Gm-Gg: ASbGncsEG1gF2ur4TMsDGuL+8dWAWZCnO/rNN91r1MPgyasjq81MZcDoXEk4uC4qhAq
	Y3pGovGh2V+Ti9UxQKDhn6FBgOIeuGmXUxaiFLnBbKDhiiVejvc01TTXig9dznY+/LvsBXLnFFv
	tIlGRYR/xKKzx/fQ5/phLM53v7OO+/Zz9KhLLE8NwV6sJcDpZsLJPH4tuQMlEj1zx6K6InxwgXZ
	hwIQNgIMu2xuqlkXNSV9tBlaJSibCc2
X-Google-Smtp-Source: AGHT+IEyi3u00xcEqoHINPCF6ISEidCSfjwsdF7Vr0kGPk/U2Rv854keEGrwT9Jojj8QTZbdnFe+5hjUnUx8/MAP8Uc=
X-Received: by 2002:a17:903:124c:b0:288:5d07:8a8f with SMTP id
 d9443c01a7336-28e9a58a334mr124108345ad.24.1759687033061; Sun, 05 Oct 2025
 10:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?0JDRgNGC0LXQvCDQkdGW0LPQtNCw0Yg=?= <temabiill@gmail.com>
Date: Sun, 5 Oct 2025 19:57:02 +0200
X-Gm-Features: AS18NWAVxMosrYe5X5L2eF3sMNBL68IpqLAwrrpGNlS0lc9daLgwlX8jo8ov2Eo
Message-ID: <CADYkRmrfhRf6VmQjc+su+mepyv=TsHc+aMcL6ryRZ5HTZ8pyFg@mail.gmail.com>
Subject: [BUG] Side buttons not detected on Telink 2.4G mouse (ID 320f:226f)
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting an issue with a wireless mouse that uses a Telink 2.4G
receiver. The side buttons (Forward/Back) are not detected by the
system.

Device Information:
- Name: Redragon King Lite
- lsusb ID: 320f:226f Telink 2.4G Wireless Receiver
- System: Fedora 42, KDE Plasma

Diagnostics:
- Standard tools like `evtest` and `libinput debug-events` show no
events when the side buttons are pressed. The kernel does not seem to
create any evdev events for them.
- However, `hid-recorder` on the correct hidraw interface
(`/dev/hidraw1`) successfully captures the raw HID reports.

Raw HID Reports:

Pressing the first side button (likely Back/Forward) sends this report:
E: ... 8 01 10 00 00 00 00 00 00
Releasing it sends:
E: ... 8 01 00 00 00 00 00 00 00

Pressing the second side button (likely Forward/Back) sends this report:
E: ... 8 01 08 00 00 00 00 00 00
Releasing it sends:
E: ... 8 01 00 00 00 00 00 00 00

It seems the `usbhid` driver does not correctly parse these HID
reports (report ID 1, second byte mask 0x10 and 0x08) into standard
KEY_BACK/KEY_FORWARD events.

Could you please advise if a quirk can be added to the kernel to
support this device correctly? All the necessary diagnostic data
appears to be above.

Thank you for your time and work on the Linux kernel.

Best regards,
Btema2

