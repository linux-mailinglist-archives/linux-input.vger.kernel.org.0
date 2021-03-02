Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886C532B4BA
	for <lists+linux-input@lfdr.de>; Wed,  3 Mar 2021 06:38:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354175AbhCCF07 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Mar 2021 00:26:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351276AbhCBWi4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 2 Mar 2021 17:38:56 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E12C06121E;
        Tue,  2 Mar 2021 14:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=bCrl2JT7gWAImYo9m6rSceBGUV1jXooR2t40Fw22toI=; b=lkcsZ8dS9F3qJV2TAzRgkV6rBe
        FGCs8YksR6Sao/SUi2mkpWDT25B8t3y54bKD4Qo5/EUTIbPHc6f+C3x8wtuPY87PcY5TH6ewkgmEw
        8jkG7FQhS8ghRSP4UILZTfi9+kq8Ez+RedF+o7Agf4lVztqP1AwyCwbWeNr6ZCw2shBlR8USCF5W7
        9cTiyMm0hHdj5wp2n23cNhyobTQX43khIfekgRMT1BPN8EZsfakyL48Bp4/0owjzyAE/3SWwfM1rE
        9ovp8OA3XT+58vBlT1eBLJ4cGXuy8vYr6dZFS2r/isFMaSQ+mq6mutIszRoIRW27US1aCreHis7wv
        k2IOlbnw==;
Received: from [2601:1c0:6280:3f0::3ba4] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lHDcK-000WSO-Ow; Tue, 02 Mar 2021 22:35:51 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH 8/8] input: Documentation: corrections for uinput.rst
Date:   Tue,  2 Mar 2021 14:35:23 -0800
Message-Id: <20210302223523.20130-9-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix a typo (supportinf -> supporting).

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/input/uinput.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20210202.orig/Documentation/input/uinput.rst
+++ linux-next-20210202/Documentation/input/uinput.rst
@@ -179,7 +179,7 @@ uinput old interface
 --------------------
 
 Before uinput version 5, there wasn't a dedicated ioctl to set up a virtual
-device. Programs supportinf older versions of uinput interface need to fill
+device. Programs supporting older versions of uinput interface need to fill
 a uinput_user_dev structure and write it to the uinput file descriptor to
 configure the new uinput device. New code should not use the old interface
 but interact with uinput via ioctl calls, or use libevdev.
