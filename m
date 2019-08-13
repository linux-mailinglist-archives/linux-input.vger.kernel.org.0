Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 897508BA80
	for <lists+linux-input@lfdr.de>; Tue, 13 Aug 2019 15:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfHMNiO (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Aug 2019 09:38:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53351 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727311AbfHMNiO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Aug 2019 09:38:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 629F13016F4A;
        Tue, 13 Aug 2019 13:38:14 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id AA6E46E6F0;
        Tue, 13 Aug 2019 13:38:10 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@archlinux.org>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 0/2] Fix support of a few Logitech devices broken in 5.3
Date:   Tue, 13 Aug 2019 15:38:05 +0200
Message-Id: <20190813133807.12384-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 13 Aug 2019 13:38:14 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Jiri,

another set of patches to send to Linus ASAP.
It turns out that we have been breaking devices, so this should
be sent before 5.3 final.

Cheers,
Benjamin

Benjamin Tissoires (2):
  Revert "HID: logitech-hidpp: add USB PID for a few more supported
    mice"
  HID: logitech-hidpp: remove support for the G700 over USB

 drivers/hid/hid-logitech-hidpp.c | 22 ----------------------
 1 file changed, 22 deletions(-)

-- 
2.19.2

