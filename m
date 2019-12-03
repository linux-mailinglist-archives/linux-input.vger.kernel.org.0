Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 792391122B6
	for <lists+linux-input@lfdr.de>; Wed,  4 Dec 2019 07:02:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbfLDGCD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 4 Dec 2019 01:02:03 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.113]:38183 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725791AbfLDGCD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 4 Dec 2019 01:02:03 -0500
Received: from [85.158.142.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 87/F4-12310-7DB47ED5; Wed, 04 Dec 2019 06:01:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFKsWRWlGSWpSXmKPExsVy8IPnUd3r3s9
  jDbp6RC3mnG9hsZh/5ByrxeFFLxgtmhevZ7O4+ekbq8XlXXPYLJZev8hk0br3CLvF/z072C12
  793I5MDlsWbeGkaPLStvMnnsnHWX3WPTqk42j/1z17B7fN4kF8AWxZqZl5RfkcCasf3wKvaCy
  ZwVLxYtY25gnMLRxcjFISSwjlHi6d6N7F2MnEBOhcTG14eYQGxegQiJJbPes4HYnAJmEn29Bx
  ghakwlGuZ1soDYbAI6Eo9mrgerZxFQkfjYehKsRlggVuLI+6MsIAtEBPYySmz595odxGEW2M0
  o8eHCAWaIDYISJ2c+AZvELCAhcfDFC2aIDVoS59asApskIWAvMf39VaA4B5CtL9F4LBYibCjx
  fdY3FgjbXGLXuutMExgFZyGZOgvJ1AWMTKsYLZOKMtMzSnITM3N0DQ0MdA0NjXVNdI2MTPQSq
  3ST9FJLdZNT80qKEoGyeonlxXrFlbnJOSl6eaklmxiB0ZRSyPJgB2PH17d6hxglOZiURHk3P3
  4WK8SXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC18rzeayQYFFqempFWmYOMLJh0hIcPEoivAxeQGn
  e4oLE3OLMdIjUKUZdjp1H5y1iFmLJy89LlRLn5QApEgApyijNgxsBSzKXGGWlhHkZGRgYhHgK
  UotyM0tQ5V8xinMwKgnzKoFM4cnMK4Hb9AroCCagIw5UPgM5oiQRISXVwLT6ony/j/qVbwnrO
  Y7qvbHbfp3z/abriWflfW2Pf9reO9tL9kzCQ5nly6fYWy3663HXaAnrrVOvVTc0va4XSSv6tv
  Re9iFRNnvePeL7tst2cqWHH5WpuXshr61N+5/DpK9Se5mcIs4/4fxtdlfvfdlh2VvVOqvtTqU
  pl0uUmte5yG6zehnBu+GhEafJz0+xDhxq4UUrGUVfntmW+lhV+Y9wB0fp40a7Y6Yr2IubXKft
  853pZfN7TuHuWiHb9tZrDB6bviwRanwieinX441UYdV8i2tKD0ovH5HxrHutLPTkru4nhtbrB
  f+0pYIu7xcVXS58zrhGfJvKLSsZwW9sVhv4XOLSU0X/+e0sP7k0RomlOCPRUIu5qDgRAJrpJN
  KtAwAA
X-Env-Sender: roy.im.opensource@diasemi.com
X-Msg-Ref: server-10.tower-246.messagelabs.com!1575439318!946274!1
X-Originating-IP: [193.240.73.197]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30465 invoked from network); 4 Dec 2019 06:01:59 -0000
Received: from unknown (HELO sw-ex-cashub01.diasemi.com) (193.240.73.197)
  by server-10.tower-246.messagelabs.com with ECDHE-RSA-AES256-SHA384 encrypted SMTP; 4 Dec 2019 06:01:59 -0000
Received: from swsrvapps-01.diasemi.com (10.20.28.141) by
 SW-EX-CASHUB01.diasemi.com (10.20.16.140) with Microsoft SMTP Server id
 14.3.468.0; Wed, 4 Dec 2019 06:01:56 +0000
Received: by swsrvapps-01.diasemi.com (Postfix, from userid 22266)      id
 1270A3FC0F; Tue,  3 Dec 2019 07:11:54 +0000 (GMT)
Message-ID: <0e2b1bf7e5d5868cf7437ec7f347352420ba65ea.1575344415.git.Roy.Im@diasemi.com>
In-Reply-To: <cover.1575344415.git.Roy.Im@diasemi.com>
References: <cover.1575344415.git.Roy.Im@diasemi.com>
From:   Roy Im <roy.im.opensource@diasemi.com>
Date:   Tue, 3 Dec 2019 12:40:15 +0900
Subject: [PATCH V8 1/3] MAINTAINERS: da7280 updates to the Dialog
 Semiconductor search terms
To:     <davem@davemloft.net>, <gregkh@linuxfoundation.org>,
        <samsung@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     Mark Rutland <mark.rutland@arm.com>,
        Support Opensource <support.opensource@diasemi.com>,
        <devicetree@vger.kernel.org>, <linux-input@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-KSE-AttachmentFiltering-Interceptor-Info: protection disabled
X-KSE-ServerInfo: sw-ex-cashub01.diasemi.com, 9
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 04/12/2019 05:22:00
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch adds the da7280 bindings doc and driver to the Dialog
Semiconductor support list.

Signed-off-by: Roy Im <roy.im.opensource@diasemi.com>

---
v8: No changes.
v7: No changes.
v6: No changes.
v5: No changes.
v4: No changes.
v3: No changes.
v2: No changes.


 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d3a5c5..def5e3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4819,6 +4819,7 @@ S:	Supported
 F:	Documentation/hwmon/da90??.rst
 F:	Documentation/devicetree/bindings/mfd/da90*.txt
 F:	Documentation/devicetree/bindings/input/da90??-onkey.txt
+F:	Documentation/devicetree/bindings/input/dlg,da72??.txt
 F:	Documentation/devicetree/bindings/thermal/da90??-thermal.txt
 F:	Documentation/devicetree/bindings/regulator/da92*.txt
 F:	Documentation/devicetree/bindings/regulator/slg51000.txt
@@ -4828,6 +4829,7 @@ F:	drivers/gpio/gpio-da90??.c
 F:	drivers/hwmon/da90??-hwmon.c
 F:	drivers/iio/adc/da91??-*.c
 F:	drivers/input/misc/da90??_onkey.c
+F:	drivers/input/misc/da72??.[ch]
 F:	drivers/input/touchscreen/da9052_tsi.c
 F:	drivers/leds/leds-da90??.c
 F:	drivers/mfd/da903x.c
-- 
end-of-patch for PATCH V8

