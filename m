Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7620844232D
	for <lists+linux-input@lfdr.de>; Mon,  1 Nov 2021 23:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbhKAWO3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Nov 2021 18:14:29 -0400
Received: from mail.valdk.tel ([185.177.150.13]:49872 "EHLO mail.valdk.tel"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231161AbhKAWO3 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 1 Nov 2021 18:14:29 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BF92297B3E
        for <linux-input@vger.kernel.org>; Tue,  2 Nov 2021 01:11:51 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valdikss.org.ru;
        s=msrv; t=1635804713; h=from:subject:date:message-id:to:mime-version:
         content-transfer-encoding; bh=vSHVvgqhSmlITFdSMhLO+nEvHQqtBecNMT6ZPuYVu6M=;
        b=dQvjiykURYRfZ4fLB9WzJimTMlbuhkvvLYfchpKscUSrNfwgCyKQoN2mgVi03FTMZICfse
        ZxGgDIgUr8O8ROJ7bedicOfcefZgULXXe4p0uDlpihStxY/Ofxpe1Kfc7w1b7I9W7VhAHt
        woZokc4wY98aBZdtr2+La+wQ0+70ruSJfyayBY4ak4iVBxmh3X+A7kGAPw2f1NURGk2sOE
        fvjRFQUuIwT5NoMESYRLmISgwPIVpupwAJHSfGPab8gFpEIt6Z3AlABJm9Lk+iqisGATa9
        3xCGSY+zcLXHkPLAuGJBfMaAjuB/tRfHulCJvxinO5Sy7IUw6G8pUtP2AdJaeg==
From:   ValdikSS <iam@valdikss.org.ru>
To:     linux-input@vger.kernel.org
Subject: [PATCH v2 0/3] HID: lenovo: ThinkPad TrackPoint Keyboard II support
Date:   Tue,  2 Nov 2021 01:11:29 +0300
Message-Id: <20211101221132.1564649-1-iam@valdikss.org.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patchset adds support for Lenovo ThinkPad TrackPoint Keyboard II,
in both USB and Bluetooth modes.

It brings additional functional keys mapping, native vertical and horizontal
scrolling, trackpoint sensitivity configuration and Fn-Lock sync.

There is no code difference between the previous patchset, only minor
patch subject changes and code/comments split.

ValdikSS (3):
  HID: lenovo: Add support for ThinkPad TrackPoint Keyboard II
  HID: lenovo: Sync Fn-lock state on button press for Compact and
    TrackPoint II keyboards
  HID: lenovo: Add note about different report numbers

 drivers/hid/hid-ids.h    |   2 +
 drivers/hid/hid-lenovo.c | 174 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 170 insertions(+), 6 deletions(-)

-- 
2.31.1

