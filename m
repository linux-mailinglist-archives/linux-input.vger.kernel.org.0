Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7521730D2C3
	for <lists+linux-input@lfdr.de>; Wed,  3 Feb 2021 06:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbhBCFJb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Feb 2021 00:09:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbhBCFJ3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 3 Feb 2021 00:09:29 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C6DC061573;
        Tue,  2 Feb 2021 21:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=L4IWq2tFL9eT/741Suy7xUVfiWKPX0zvBOP4sXbgMO8=; b=VspdSs4W4NuXANRAzMei2niBx0
        OMoOs2beGe+mdPtNvWHGnBbqophj2aqVi86i7FNCFvqdYY4tpW54lgA1wVkihZhm6OhK9CoENe6p8
        hiPOxp/QjK6lR9QR/ugS2BbSu0tIpis9+2o3PPveVWIIamCX4vosQkPOPGjxICjJhnKBf9++9h7wC
        gYaVmagfZEgJylubsInkhYq227zZea1xSBWLichojJObULiwQ3yyNuIb1LRMLZIqjy1eQADA4I/Qe
        yS80bHDYb+oFTf7vBBI5jrjSMglkD6PVqlLDO0Pxa6xMiWoGbBGkkCk89VAPhOhynyGTHCviVsUIt
        znHxTEgA==;
Received: from [2601:1c0:6280:3f0::2a53] (helo=merlin.infradead.org)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l7APG-0006fJ-MX; Wed, 03 Feb 2021 05:08:47 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: input: Documentation: update related file names in ff.rst
Date:   Tue,  2 Feb 2021 21:08:42 -0800
Message-Id: <20210203050842.24190-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Change other related documentation file names from .txt to .rst
and be more explicit about their paths/locations.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
---
where is fftest mentioned here found? I only found one place:
  https://github.com/flosse/linuxconsole/blob/master/utils/fftest.c

 Documentation/input/ff.rst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linux-next-20210202.orig/Documentation/input/ff.rst
+++ linux-next-20210202/Documentation/input/ff.rst
@@ -16,8 +16,8 @@ goal is not to support these devices as
 (as it is already the case), but to really enable the rendering of force
 effects.
 This document only describes the force feedback part of the Linux input
-interface. Please read joystick.txt and input.txt before reading further this
-document.
+interface. Please read joydev/joystick.rst and input.rst before reading further
+this document.
 
 Instructions to the user
 ~~~~~~~~~~~~~~~~~~~~~~~~
@@ -36,7 +36,7 @@ should keep a hand on your device, in or
 something goes wrong.
 
 If you have a serial iforce device, you need to start inputattach. See
-joystick.txt for details.
+joydev/joystick.rst for details.
 
 Does it work ?
 --------------
