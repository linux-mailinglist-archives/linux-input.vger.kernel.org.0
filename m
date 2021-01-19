Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 244EE2FC0B8
	for <lists+linux-input@lfdr.de>; Tue, 19 Jan 2021 21:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729817AbhASUP7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 19 Jan 2021 15:15:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404430AbhASUIW (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 19 Jan 2021 15:08:22 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F37F0C061574;
        Tue, 19 Jan 2021 12:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=kXKO+Pbx7zZT3LAcTPGrWmuVb9KkLTAbDWe60uxU5Rg=; b=IL2YvU6+skaYSfeJHzVEyj71sD
        Cpen0VPpe+3ayzYRxL61RZpIHctvyYIGeyp23hhk39YoOofvgyImizSw3bn3KrOZYDMIF85Cn4nIw
        zo38LJDpqkc2Su60p+4gvxG2LePdMKZ1Vmj1SMso5pAIp2Q0oiZFedVQpu1mZYE90/bFyK+yvhs3Y
        nDN1m1GUlwg4ZBw76kYKm2B9S3Ns84pCYMP60MGr0TNqONfVgEkQ3T1yRgFcW1l0dFAeOM6eyVagf
        5D+ryl1RRRXiByoN/B5Amps/ic9+ZSIrtPHOuHeAUPINv9l8hja+I7vA1E27sYWUjhvb7o/X1yvpJ
        a9kwhJvw==;
Received: from [2601:1c0:6280:3f0::9abc] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l1xHn-00073y-1I; Tue, 19 Jan 2021 20:07:31 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: [PATCH 0/2 v2] HID: fix some kernel-doc notations
Date:   Tue, 19 Jan 2021 12:07:21 -0800
Message-Id: <20210119200723.12092-1-rdunlap@infradead.org>
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

rebase & resend:
[PATCH 1/2 v2] HID: correct kernel-doc notation in <linux/hid*.h>
[PATCH 2/2 v2] HID: correct kernel-doc notation in hid-quirks.c

 drivers/hid/hid-quirks.c       |   25 ++++++++++++++-----------
 include/linux/hid-sensor-hub.h |    9 +++++----
 include/linux/hid.h            |   15 +++++++++++----
 3 files changed, 30 insertions(+), 19 deletions(-)
