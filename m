Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 762578A330
	for <lists+linux-input@lfdr.de>; Mon, 12 Aug 2019 18:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbfHLQXd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 12 Aug 2019 12:23:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58250 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725887AbfHLQXd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 12 Aug 2019 12:23:33 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 4D21030083ED;
        Mon, 12 Aug 2019 16:23:33 +0000 (UTC)
Received: from plouf.redhat.com (ovpn-117-165.ams2.redhat.com [10.36.117.165])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 397AA84F4;
        Mon, 12 Aug 2019 16:23:28 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Matthias Fend <Matthias.Fend@wolfvision.net>,
        Jiri Kosina <jikos@kernel.org>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Subject: [PATCH 0/2] HID multitouch: small fixes
Date:   Mon, 12 Aug 2019 18:23:24 +0200
Message-Id: <20190812162326.14253-1-benjamin.tissoires@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 12 Aug 2019 16:23:33 +0000 (UTC)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

First one should prevent us to add more quirks for Win8 devices
that have a trackstick.
Second one is a weird device that doesnt work properly in recent 
kernels.

Cheers,
Benjamin

Benjamin Tissoires (2):
  HID: multitouch: do not filter mice nodes
  HID: multitouch: add support for the Smart Tech panel

 drivers/hid/hid-multitouch.c | 37 +++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

-- 
2.19.2

