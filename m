Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08B6A2CB38E
	for <lists+linux-input@lfdr.de>; Wed,  2 Dec 2020 04:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387423AbgLBDj5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Dec 2020 22:39:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387407AbgLBDj5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Dec 2020 22:39:57 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96807C0613CF;
        Tue,  1 Dec 2020 19:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=fGe3b3fg17ibDHqbYtJHz1TsXctPxAVDf1AqPKULKv8=; b=gBElaUubP3pcgfddfVdLkCBJqS
        gOHYjq4Z/Xx0Tcibx86YpzAP3OCn5JIByZcMYyKyMr4rWuIbM++hNFaMZ0rdRJ/0OyCh6Y6V+BFAd
        ZexwT/T0QvwLxT7MNmT5eoCapWl99Ty2lv2gMz8sThhyfWZiLrV4cBL1poMUD5Buo6HBsHrC6YOhz
        cVg4XK9xQNYdQFUrqWbq65VopnjNBh0KXuUdF7Oe1S86abM2sB3Si5WbOu11nNODwPSaOhVoprGTb
        m623kMdb3GrPLALdf2o3TgPWpHqrPsGpZyu6gUxI3B8ZTEMxidb8WydLzQrP30JFg7SelNnhL1t2I
        gGoeZZxA==;
Received: from [2601:1c0:6280:3f0::1494] (helo=smtpauth.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kkIz3-0002YM-7n; Wed, 02 Dec 2020 03:39:14 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 0/2] HID: fix some kernel-doc notations
Date:   Tue,  1 Dec 2020 19:39:03 -0800
Message-Id: <20201202033905.15111-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Clean up kernel-doc notation in 2 <linux/hid*.h> files
and in drivers/hid/hid-quirks.c.

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: linux-input@vger.kernel.org

[PATCH 1/2] HID: correct kernel-doc notation in <linux/hid*.h>
[PATCH 2/2] HID: correct kernel-doc notation in hid-quirks.c

 drivers/hid/hid-quirks.c       |   25 ++++++++++++++-----------
 include/linux/hid-sensor-hub.h |    9 +++++----
 include/linux/hid.h            |   15 +++++++++++----
 3 files changed, 30 insertions(+), 19 deletions(-)
