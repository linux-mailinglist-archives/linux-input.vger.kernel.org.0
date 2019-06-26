Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F0DA56D59
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 17:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726104AbfFZPLn (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 11:11:43 -0400
Received: from smtp120.ord1c.emailsrvr.com ([108.166.43.120]:40997 "EHLO
        smtp120.ord1c.emailsrvr.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726948AbfFZPLn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 11:11:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mev.co.uk;
        s=20190130-41we5z8j; t=1561561354;
        bh=zR/ujN4lho1uT1gv/+krZdDM6437r61XE1NiebHl744=;
        h=From:To:Subject:Date:From;
        b=QjKmk7UNTU7opEFPoN7cGAMmPsFGBAHPJw0Kbpz3GpfuK3UeogwFcm2JGEPU2HqYP
         YE1uo3GN2jAgxZEB4oamavRGX2/7Ahe+O6Q1NKL8tpnOShY1k6/WMY+DB3WXbfoQBq
         ogLTH1Qhcez8EfWuKRtrX3/J6wJtZ3swYk2vtIH4=
X-Auth-ID: abbotti@mev.co.uk
Received: by smtp16.relay.ord1c.emailsrvr.com (Authenticated sender: abbotti-AT-mev.co.uk) with ESMTPSA id 978ABC0137;
        Wed, 26 Jun 2019 11:02:33 -0400 (EDT)
X-Sender-Id: abbotti@mev.co.uk
Received: from ian-deb.inside.mev.co.uk (remote.quintadena.com [81.133.34.160])
        (using TLSv1.2 with cipher DHE-RSA-AES128-GCM-SHA256)
        by 0.0.0.0:465 (trex/5.7.12);
        Wed, 26 Jun 2019 11:02:34 -0400
From:   Ian Abbott <abbotti@mev.co.uk>
To:     linux-input@vger.kernel.org
Cc:     David Herrmann <dh.herrmann@googlemail.com>,
        Jiri Kosina <jikos@kernel.org>
Subject: [PATCH 0/2] HID: wiimote: Minor change to spinlock usage
Date:   Wed, 26 Jun 2019 16:02:10 +0100
Message-Id: <20190626150212.27967-1-abbotti@mev.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

A couple of minor changes to the wiimote core module.  They do not
change functionality of the driver:

1) HID: wiimote: make handlers[] const
2) HID: wiimote: narrow spinlock range in wiimote_hid_event()

 drivers/hid/hid-wiimote-core.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

