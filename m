Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E90C30FEEA
	for <lists+linux-input@lfdr.de>; Thu,  4 Feb 2021 21:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbhBDU5x (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 4 Feb 2021 15:57:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57999 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229841AbhBDU5w (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 4 Feb 2021 15:57:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612472186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZOvtNucwJczkzNINdmUj9KmQMT7i6fAZZQ9cC7Yntug=;
        b=GFD4l89dy44SBxuuXi7JGMvJKPbtjy/LDC62oVcVRfT7oMD3gqvA30K0IqueZZEbhQ3wEH
        JS80ZnBA04/2sbTwCyCH1KC6X4UtTSgBnP1zaaMdkHdayT5mls4/nKMTD2qKgrm0ur83cy
        wgeG3HLYMpyBKXtZP4X4wannV9bwgRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-2CP6fFgfPtezja3BRPcD5w-1; Thu, 04 Feb 2021 15:56:24 -0500
X-MC-Unique: 2CP6fFgfPtezja3BRPcD5w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 571939127B;
        Thu,  4 Feb 2021 20:56:23 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-68.ams2.redhat.com [10.36.112.68])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E30B970483;
        Thu,  4 Feb 2021 20:56:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org
Subject: [PATCH resend 0/2] HID: logitech-dj: Handle Dinovo quad/bt2.0 receivers in HID proxy mode
Date:   Thu,  4 Feb 2021 21:56:15 +0100
Message-Id: <20210204205617.72527-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi All,

This series seems to have fallen through the cracks, so here is a resend.
This has been tested by my on a Dinovo Edge and I believe that Benjamin
tested this successfully on a Dinovo Mini.

Regards,

Hans


Hans de Goede (2):
  HID: logitech-dj: Use hid-ids.h defines for USB device-ids for all
    supported devices
  HID: logitech-dj: Handle newer quad/bt2.0 receivers in HID proxy mode

 drivers/hid/hid-ids.h         |  11 ++-
 drivers/hid/hid-lg.c          |  24 -------
 drivers/hid/hid-logitech-dj.c | 131 ++++++++++++++++++++++++++++------
 drivers/hid/hid-quirks.c      |   2 -
 4 files changed, 120 insertions(+), 48 deletions(-)

-- 
2.29.2

