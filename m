Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1AD7298FDA
	for <lists+linux-input@lfdr.de>; Mon, 26 Oct 2020 15:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1781974AbgJZOtp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 26 Oct 2020 10:49:45 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:61761 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1782025AbgJZOto (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 26 Oct 2020 10:49:44 -0400
Received: from [100.112.129.88] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-west-2.aws.symcld.net id 9E/8C-32453-502E69F5; Mon, 26 Oct 2020 14:49:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuplleJIrShJLcpLzFFi42LJePGQR5f10bR
  4g82vGS0OnTvAbHF40QtGi6/fbrNbvDk+ncnizO2FTBY3P31jtVi95wWzA7vHrIZeNo+ds+6y
  e/zatobFY/nBaUwe7/ddZfP4vEkugC2KNTMvKb8igTVj5c3CgkW8FWs+/mFqYNzC3cXIxSEk8
  J9RYtaFu2wQzhtGiWmPJzN3MXJysAloS2zZ8gsowcEhIiAj8WGtJ0gNs8ArRokdL7+ygMSFBc
  Ildtw1BSlnEVCV2PC2hwnE5hWwkZjcsYIRxJYQkJd42rscbCQnUM2ZrscsILaQgIrE/QdL2CD
  qBSVOznwCFmcGqm/eOpsZwpaQOPjiBTPIKgkBBYkHV5ghRiZILHt5h3kCo8AsJN2zkHTPQtK9
  gJF5FaNFUlFmekZJbmJmjq6hgYGuoaGRrqGxga6RoaVeYpVuol5psW55anGJrpFeYnmxXnFlb
  nJOil5easkmRmCcpBQ03d7B+O/1B71DjJIcTEqivMf2TYsX4kvKT6nMSCzOiC8qzUktPsQow8
  GhJMFb8gAoJ1iUmp5akZaZA4xZmLQEB4+SCO9qkDRvcUFibnFmOkTqFKMxx86j8xYxc2yeu3Q
  RsxBLXn5eqpQ472mQUgGQ0ozSPLhBsFRyiVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iw7y+Q
  KTyZeSVw+4BRCPSFCG9bxRSQU0oSEVJSDUyWn5ZtvXxWw6CbJ+593ocTuq8Kt+zY9Y8/WOPrh
  x8O7jqn9kSVRUQuzpL1PrT3zINgVh7VBRt8Hp5QEe5L/JddsetDZpTCy4aFv4sXsq+8+rSpU8
  Z9T66NQI7togNd7YetN3/Jmekhqpilqrt//Rq5vIlJojuVMrq9gstf2r9/sNz9jdbtxJJ0g99
  1scdvdL7hef3LMqOyzOMkp+18/S0sNhUKXlO8zi49I3SddWX/1+W+Qo63py7TkFnn9XLa4nWb
  HqXfFmv3+JRuvThfLcFj25wI80VLfJddEtGXes1TF3Sqad8x1zqZSHYr32Nr19z+bvI+csq1Z
  UsZ//49vHTLRx2vw68ZGuNC27a7yusosRRnJBpqMRcVJwIAUE7AY6ADAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-24.tower-336.messagelabs.com!1603723779!1294!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3239 invoked from network); 26 Oct 2020 14:49:40 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-24.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Oct 2020 14:49:40 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 91C0E5F3C616F138D18A;
        Mon, 26 Oct 2020 10:49:39 -0400 (EDT)
Received: from localhost.localdomain.com (10.64.83.193) by
 reswpmail04.lenovo.com (10.62.32.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2044.4; Mon, 26 Oct 2020 07:49:36 -0700
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <dmitry.torokhov@gmail.com>, <hdegoede@redhat.com>,
        <platform-driver-x86@vger.kernel.org>,
        <linux-input@vger.kernel.org>, <jeff@labundy.com>,
        <anthony.wong@canonical.com>, <hadess@hadess.net>,
        "Nitin Joshi" <njoshi1@lenovo.com>
Subject: [PATCH v3 1/3] Input: add event codes for lap and palmreset proximity switches
Date:   Mon, 26 Oct 2020 10:45:10 -0400
Message-ID: <20201026144512.621479-1-markpearson@lenovo.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <markpearson@lenovo.com>
References: <markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.83.193]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add infrastructure needed to support lap and palmrest proximity sensors.

These sensors are used for identifying thermal mode changes and modifying
WWAN transmitter power.

Reviewed-by: Nitin Joshi <njoshi1@lenovo.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - Update Input message
Changes in v3:
 - Added missing patch history notes

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

