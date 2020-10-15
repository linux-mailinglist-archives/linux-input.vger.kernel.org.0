Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A261728F412
	for <lists+linux-input@lfdr.de>; Thu, 15 Oct 2020 15:58:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729498AbgJON57 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Oct 2020 09:57:59 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.2]:47553 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730367AbgJON57 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Oct 2020 09:57:59 -0400
Received: from [100.112.129.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-a.us-west-2.aws.symcld.net id F1/A4-59651-565588F5; Thu, 15 Oct 2020 13:57:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleJIrShJLcpLzFFi42JJl3vFppsa2hF
  v8OiCpMWhcweYLQ4vesFo8fXbbXaLN8enM1mcub2QyeLmp2+sFqv3vGB2YPeY1dDL5rFz1l12
  j1/b1rB4LD84jcnj/b6rbB6fN8kFsEWxZuYl5VcksGacfDSJveATd8Xb48uYGhgXc3UxcnEIC
  fxnlFi7tZUNwnnNKLGw7QxzFyMnB5uAtsSWLb+AEhwcIgIyEh/WeoLUMAvcZpR4vquBDaRGWM
  BdYveHF0wgNouAqsTLd1vZQWxeARuJ9dNvg82REJCXeNq7HMzmFLCVePfwOivITCGBMInXm9I
  hygUlTs58wgJiMwOVN2+dzQxhS0gcfPECbszfJ09YIewEiWUv7zBPYBSYhaR9FpL2WUjaFzAy
  r2K0SCrKTM8oyU3MzNE1NDDQNTQ00jU0stQ1tDTSS6zSTdQrLdYtTy0u0QVyy4v1iitzk3NS9
  PJSSzYxAmMlpaDxwA7GG68/6B1ilORgUhLljQ7qiBfiS8pPqcxILM6ILyrNSS0+xCjDwaEkwc
  sEjD4hwaLU9NSKtMwcYNzCpCU4eJREeA+FAKV5iwsSc4sz0yFSpxh1OXYenbeIWYglLz8vVUq
  cdxZIkQBIUUZpHtwIWAq5xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYNwhkCk9mXgncpldA
  RzABHWG/pAXkiJJEhJRUA5M4+4XsuXzL3NLaDQ9p6La8KvJL9P7fcrLmjefKcB3OX9dfSOddL
  G55IfWp9vWVo7Y8wRNnbzv9t/egr0vsxCqOQNtVtiwfH8WWqUv/Ds3ITej6dI3173uR6akF/O
  dnJUvnMG6Mjfx7ui7nfPOh/Dj9ww0LV/yMCuet8nY47/qL34TVreT360synQFfpO+9yJ4W9jf
  TNVB4suWMtQFB9r/+ea3KMcp45FK0JIev9XFJAp9/cnr0o9/fvX/4KP2fZGyz7tHOUoaVVpVm
  M7LX3826f/XcP/HSq8naCV/WXT5+z3KD3WRW2zNy8etDT0u4MWpkfF2QsuR+e4fn0/jVmpOam
  6SY4+yNn/rOejRbQomlOCPRUIu5qDgRAIK/0C6cAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-40.tower-335.messagelabs.com!1602770275!71468!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18406 invoked from network); 15 Oct 2020 13:57:57 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-40.tower-335.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Oct 2020 13:57:57 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 6ECDFA67145CD874BE2D;
        Thu, 15 Oct 2020 21:57:53 +0800 (CST)
Received: from localhost.localdomain.com (10.64.83.59) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Thu, 15 Oct 2020 06:57:50 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <njoshi1@lenovo.com>, <hdegoede@redhat.com>,
        <dmitry.torokhov@gmail.com>, <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>
Subject: [PATCH 1/3] Adding event codes for Lenovo lap and palm sensors
Date:   Thu, 15 Oct 2020 09:57:15 -0400
Message-ID: <20201015135717.384610-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015135717.384610-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20201015135717.384610-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.83.59]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

These sensors are used for thermal mode changes and modifying WWAN
transmitter power.

Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
 include/linux/mod_devicetable.h        | 2 +-
 include/uapi/linux/input-event-codes.h | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index 5b08a473cdba..897f5a3e7721 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -320,7 +320,7 @@ struct pcmcia_device_id {
 #define INPUT_DEVICE_ID_LED_MAX		0x0f
 #define INPUT_DEVICE_ID_SND_MAX		0x07
 #define INPUT_DEVICE_ID_FF_MAX		0x7f
-#define INPUT_DEVICE_ID_SW_MAX		0x10
+#define INPUT_DEVICE_ID_SW_MAX		0x12
 #define INPUT_DEVICE_ID_PROP_MAX	0x1f
 
 #define INPUT_DEVICE_ID_MATCH_BUS	1
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 0c2e27d28e0a..26f71a9a6936 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -889,7 +889,9 @@
 #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
 #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
 #define SW_MACHINE_COVER	0x10  /* set = cover closed */
-#define SW_MAX			0x10
+#define SW_LAP_PROXIMITY        0x11  /* set = lap proximity sensor active */
+#define SW_PALMREST_PROXIMITY   0x12  /* set = palmrest proximity sensor active */
+#define SW_MAX			0x12
 #define SW_CNT			(SW_MAX+1)
 
 /*
-- 
2.28.0

