Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C95F8FE3C
	for <lists+linux-input@lfdr.de>; Fri, 16 Aug 2019 10:40:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfHPIjJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 16 Aug 2019 04:39:09 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:1982 "EHLO
        esa2.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727042AbfHPIjE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 16 Aug 2019 04:39:04 -0400
IronPort-SDR: /WgcQufq0UnD4IkzvHbzwsgL0ldP0dSORU93PeD1tsHU2SA1wrP+GjPe6hzGiUm+cEn3bqYIiq
 cvM4sXeKtTlF7RTc8qOwpkbS8F7liw4MFi+LS0jxoEB18y6rPJn0aR7kn2rvA1clVqHIgdYUYc
 kXXncZDPZ9UAShnE7y5mfcmwL7tAqm8CbcCuazpq07QVsXJumP//LfvUzgssSk6gUqjkP59yWc
 B5kCQkk9IP8vMNIs/S/2oonMrB9Rj1TabJnkbQR7MgqvkgsZPChkSd/YGa+Wk+nd0dp0H4EW/9
 mVQ=
X-IronPort-AV: E=Sophos;i="5.64,391,1559548800"; 
   d="scan'208";a="40484327"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa2.mentor.iphmx.com with ESMTP; 16 Aug 2019 00:36:02 -0800
IronPort-SDR: hS5dIKkLQR0nnEiyMntKgyyRj9f4vJ9xOQw/VT9czNqRZmsmAT6q5m3LadHoLcHqQJg75FvjuO
 nzO6Mk0KxFQBacgS1wrMvW8Xsx36cVjEr0oIy6/UWxkkM1qQVamMILwWluozXhLl/ImfYzmjdU
 tqIGWkukIzSCb+AKvtt9We9xNqov9aMG3LRXdnNHiLw6j2oNH14vQrRDw3+jE8OkkhElKPjqyC
 EXCbTmLuuizl8cLHE2VYcUkXRgGzPoRXWXBgj/ADQJAbJuam5e2MlG9PtuUo6FdSQLbTP91XCC
 cbg=
From:   Jiada Wang <jiada_wang@mentor.com>
To:     <nick@shmanahar.org>, <dmitry.torokhov@gmail.com>
CC:     <linux-input@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <jiada_wang@mentor.com>, <george_davis@mentor.com>
Subject: [PATCH v1 44/63] Input: atmel_mxt_ts: return error from mxt_process_messages_until_invalid()
Date:   Fri, 16 Aug 2019 17:35:39 +0900
Message-ID: <20190816083558.19189-5-jiada_wang@mentor.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190816083558.19189-1-jiada_wang@mentor.com>
References: <20190816083558.19189-1-jiada_wang@mentor.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Dean Jenkins <Dean_Jenkins@mentor.com>

mxt_process_messages_until_invalid() failed to propagate the error
code from mxt_read_and_process_messages() so return the error code.

Signed-off-by: Dean Jenkins <Dean_Jenkins@mentor.com>
Signed-off-by: Deepak Das <deepak_das@mentor.com>
Signed-off-by: George G. Davis <george_davis@mentor.com>
Signed-off-by: Jiada Wang <jiada_wang@mentor.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
index b3d40390abb6..ed5b98c067e8 100644
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1551,6 +1551,8 @@ static int mxt_process_messages_until_invalid(struct mxt_data *data)
 	/* Read messages until we force an invalid */
 	do {
 		read = mxt_read_and_process_messages(data, count);
+		if (read < 0)
+			return read;
 		if (read < count)
 			return 0;
 	} while (--tries);
-- 
2.19.2

