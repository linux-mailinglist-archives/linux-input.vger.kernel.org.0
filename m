Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9030B41AABB
	for <lists+linux-input@lfdr.de>; Tue, 28 Sep 2021 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239613AbhI1Ikz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 28 Sep 2021 04:40:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56290 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239556AbhI1Iky (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 28 Sep 2021 04:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632818355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=iIu3XHeX/2hWPbmTYoP9PzSWuyoc+CNO+138wXnL4b8=;
        b=VMchrfTq1Cb6jn/Ohp3F3anykJQQ2/K3Q0cEnHivWVw1Ml8Rk/Q20ehiVFbGhrcNhHEaPU
        /CT9ee0bEUIg2E7plFs8av/KD4DVQhtMjWMwKpl56OQY9axppt06JhD6L6pYfman+JlKDf
        PCQw6l1CFTdOH7FOXCKwtqGfDhoL0NA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-5nP1mBXyM42AGk-wkXXyHA-1; Tue, 28 Sep 2021 04:39:11 -0400
X-MC-Unique: 5nP1mBXyM42AGk-wkXXyHA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7AC4F802921;
        Tue, 28 Sep 2021 08:39:10 +0000 (UTC)
Received: from xps-13.redhat.com (unknown [10.39.195.86])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CF28A5D9D5;
        Tue, 28 Sep 2021 08:39:08 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        =?UTF-8?q?Michal=20Mal=C3=BD?= <madcatxster@devoid-pointer.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 0/2] HID: lg: fix init of devices when FF is off
Date:   Tue, 28 Sep 2021 10:39:04 +0200
Message-Id: <20210928083906.43983-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi,

foreword: this was only compiled tested and would greatly benefit
from some testing with real hardware.

This was discovered in RHEL 8. There, we disable most of the FF bits
and it appears returning -1 when the bits are disabled just make
the device disappear.

Cheers,
Benjamin

Benjamin Tissoires (2):
  HID: lg: do not return an error when FF is disabled
  HID: lg4ff: do not return a value for deinit

 drivers/hid/hid-lg.h    | 6 +++---
 drivers/hid/hid-lg4ff.c | 5 ++---
 drivers/hid/hid-lg4ff.h | 6 +++---
 3 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.26.3

