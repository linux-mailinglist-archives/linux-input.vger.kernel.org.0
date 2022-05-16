Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 954D6527AFE
	for <lists+linux-input@lfdr.de>; Mon, 16 May 2022 02:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbiEPAVE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 May 2022 20:21:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbiEPAU5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 May 2022 20:20:57 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9051705D;
        Sun, 15 May 2022 17:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=7DYw+gNaV829maktrmo5F8pUweWF2omX8R9j7+pyBVc=; b=yIWkhGH1pu/CUHCYekxEelfaTf
        c2C79Y4DAqsc+CCzxi/H6lv7JmfsHoKgiOVeEBX4j9t5WJe3tAsPt6ovduiXNHwLuU0Orfrt+omGc
        SgIg3LPz9M9G1Vu5Q8h4xQw0XltMJMnuxmLzu7bVcM48DEKinpec/ZhBOXSmZ/HUwE0+N5Cbw+wzm
        B1VHI4JIOadRB4FwJs/hVq0MtSD1ySczGZI84YBYKtv5et+VfB+DFmYf8/vTNh1lHO4JmicXwZkn0
        ik1s20tgceGEBuyajMe9PDwICBeXQqB+ZT+K1DUfOsinxTVWcRxPWV3BDxzIhkZjnu+b6SdAnWiwB
        +5WS5eUA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nqOTn-005MwU-Sp; Mon, 16 May 2022 00:20:55 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     patches@lists.linux.dev, Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] input: Docs: correct atarikbd.rst typos
Date:   Sun, 15 May 2022 17:20:55 -0700
Message-Id: <20220516002055.12000-1-rdunlap@infradead.org>
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

Fix 2 "MOSE" typos in atarikbd.rst (found with 'codespell').
a. s/MOSE/MODE/
b. s/MOSE/MOUSE/

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/input/devices/atarikbd.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/Documentation/input/devices/atarikbd.rst
+++ b/Documentation/input/devices/atarikbd.rst
@@ -288,7 +288,7 @@ between 0 and large positive numbers. Ex
 command sets the maximum positive value that can be attained in the scaled
 coordinate system. Motion beyond that value is also ignored.
 
-SET MOUSE KEYCODE MOSE
+SET MOUSE KEYCODE MODE
 ----------------------
 
 ::
@@ -333,7 +333,7 @@ occur before the internally maintained c
 (independently scaled for each axis). Remember that the mouse position
 information is available only by interrogating the ikbd in the ABSOLUTE MOUSE
 POSITIONING mode unless the ikbd has been commanded to report on button press
-or release (see SET MOSE BUTTON ACTION).
+or release (see SET MOUSE BUTTON ACTION).
 
 INTERROGATE MOUSE POSITION
 --------------------------
