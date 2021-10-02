Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6EE541F9E5
	for <lists+linux-input@lfdr.de>; Sat,  2 Oct 2021 06:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhJBFBc (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 2 Oct 2021 01:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbhJBFBa (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Sat, 2 Oct 2021 01:01:30 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84CEC061775;
        Fri,  1 Oct 2021 21:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=iJLC+3ZlFQ1U2zcDDHfUhr1pau9J8AeUPSVlkDJtwmY=; b=aGb8RLPtIx9naj1IOx8MNlP8KN
        faH5Mbdl2zCuZxYcHzFI/dBJwl715/Cn/LXvgDxguAJdg0zk0bqNoitlz0SbpHkquT95fOic7/wna
        5NeGY4cf4GsEm2HK8kmwDSEu6pYciULYxlrbF0/wAfNckfWbf+2LkfRy3HSLjMvuU8rENn7Q2BLQ8
        /DpvGryojCtiVVJvym9PSfz4AjH07XVWEQ+3ccZk3cwhqTUwxkKWWV2oL8ES4L48t+1jEMlBmZ7qY
        W6Zs9FIj/FdiP6mQrEey9xsL8yyYuXjwREwuibgQd8F5R9VUUnMzByrSXLUxnH3NCqTGRldA1jjKM
        SwrOvxxg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mWX7g-001mnB-FB; Sat, 02 Oct 2021 04:59:44 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        kernel test robot <lkp@intel.com>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org,
        Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: [PATCH] input/misc: max8925_onkey.c: don't mark comment as kernel-doc
Date:   Fri,  1 Oct 2021 21:59:43 -0700
Message-Id: <20211002045943.9406-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change the comment to a normal (non-kernel-doc) comment to avoid
these kernel-doc warnings:

max8925_onkey.c:2: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * MAX8925 ONKEY driver
max8925_onkey.c:2: warning: missing initial short description on line:
 * MAX8925 ONKEY driver

Fixes: 3734574cac100 ("Input: enable onkey driver of max8925")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Aditya Srivastava <yashsri421@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
---
 drivers/input/misc/max8925_onkey.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20211001.orig/drivers/input/misc/max8925_onkey.c
+++ linux-next-20211001/drivers/input/misc/max8925_onkey.c
@@ -1,4 +1,4 @@
-/**
+/*
  * MAX8925 ONKEY driver
  *
  * Copyright (C) 2009 Marvell International Ltd.
