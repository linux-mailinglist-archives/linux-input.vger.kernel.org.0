Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 157AD527AFC
	for <lists+linux-input@lfdr.de>; Mon, 16 May 2022 02:21:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbiEPAUx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 May 2022 20:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiEPAUw (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 May 2022 20:20:52 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FAD5A1A1;
        Sun, 15 May 2022 17:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=cRM5nzf2yQfBssriQwtZcJd3iJWP9AWWeNnq/DkjfdE=; b=wSop+YtN5Ru4CUciERcosZKQ30
        JMt33+lyWqqm4GWSvE/CGM5pmVvMwTOZ1xOji8s22ZLLicu91LwUeZPKj2ikdIZNDShiU5vKitdoA
        I+QQnO6AvpjE0lYPe5ZYwBtOpRIl2jWADqTQB9YH6WALA0f2HyaUjwWnZ3YdNVHvlKvdVWw2NFKw2
        Uoi/mzROcatQLu200/Z3VzC3P/HQKm7n+oUbpq/wVqQs6Tg12NKhJpchLCftP1gtXgIkMsSitP8t6
        UJpuMFVMeCkFIET/pbEXC8x1gfgAwS0uNHZ5lFAGrdL3ludU+oIGftztQTfWgB4NApwqXGrAKTYxJ
        hawROr1g==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nqOTg-005Mvg-VG; Mon, 16 May 2022 00:20:49 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] input: Docs: correct ntrig.rst typo
Date:   Sun, 15 May 2022 17:20:47 -0700
Message-Id: <20220516002047.11395-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Fix a typo in ntrig.rst (found with 'codespell').

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/input/devices/ntrig.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/Documentation/input/devices/ntrig.rst
+++ b/Documentation/input/devices/ntrig.rst
@@ -32,7 +32,7 @@ The following parameters are used to con
 |activation_height,	|size threshold to activate immediately		      |
 |activation_width	|						      |
 +-----------------------+-----------------------------------------------------+
-|min_height,		|size threshold bellow which fingers are ignored      |
+|min_height,		|size threshold below which fingers are ignored       |
 |min_width		|both to decide activation and during activity	      |
 +-----------------------+-----------------------------------------------------+
 |deactivate_slack	|the number of "no contact" frames to ignore before   |
