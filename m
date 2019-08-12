Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58F538A346
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfHLQ1v (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:27:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28079 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725822AbfHLQ1v (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:27:51 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3F9518E59E;
        Mon, 12 Aug 2019 16:27:49 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DC35771C81;
        Mon, 12 Aug 2019 16:27:42 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     =?UTF-8?q?Bruno=20Pr=C3=A9mont?= <bonbons@linux-vserver.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Ping Cheng <pinglinux@gmail.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 0/2] HID: do not call hid_set_drvdata(hdev, NULL) in drivers
Date:   Mon, 12 Aug 2019 18:27:38 +0200
Message-Id: <20190812162740.15898-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 12 Aug 2019 16:27:51 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

the wacom one is split dfrom the other drivers as the change is slightly
bigger.

Cheers,
Benjamin

Benjamin Tissoires (2):
  HID: do not call hid_set_drvdata(hdev, NULL) in drivers
  HID: wacom: do not call hid_set_drvdata(hdev, NULL)

 drivers/hid/hid-cougar.c       |  6 ++----
 drivers/hid/hid-gfrm.c         |  7 -------
 drivers/hid/hid-lenovo.c       |  2 --
 drivers/hid/hid-picolcd_core.c |  7 +------
 drivers/hid/hid-sensor-hub.c   |  1 -
 drivers/hid/wacom_sys.c        | 18 +++++-------------
 6 files changed, 8 insertions(+), 33 deletions(-)

-- 
2.19.2

