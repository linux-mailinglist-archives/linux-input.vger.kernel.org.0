Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAE4224701
	for <lists+linux-input@lfdr.de>; Sat, 18 Jul 2020 01:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgGQXg3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jul 2020 19:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726634AbgGQXg3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jul 2020 19:36:29 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25307C0619D2;
        Fri, 17 Jul 2020 16:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:To:Subject:From:Sender:Reply-To:Cc:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=RTYFbSXiEPN/J9TW3PTyS0OPHb2QtHWE24AA7f709vo=; b=d20CrNmx5ZkAzNyjQAmvYytmzC
        9zWc2dfHDpWKsnjR712drdtVwukpdzzF5lCeobOFD8IIqLKUW9HSJKyIA1dB3ltdlFrALgqgGwvPt
        BG17J7V2PP9oORI8UCiteBNKVZ9hXGel/hfb4WjB6gdJxonHpz5+u2rD7WDvbBHV0qa9sBpIlOTav
        NKCsc7CTyocTgw8CEjM6dYJrcu55vZchmmbVZN/ohch+JPAU5bta6R0kVZ5wH3vBRVpftNPIyYKoe
        pmol+beRIILiWIoR/0kX6BCYpS8l+3TjJOoByrqpGxz8RpJKkKze4MX611jU5Mkt3ahMjYUBJqkms
        1PrDuMfw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jwZtz-0006WA-1Q; Fri, 17 Jul 2020 23:36:27 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] input: linux/input.h: drop duplicated word in a comment
To:     LKML <linux-kernel@vger.kernel.org>,
        "Dmitry Torokhov <dmitry.torokhov"@gmail.com,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Message-ID: <7c23db8d-5d7e-f738-7c88-4e3a74b3dc79@infradead.org>
Date:   Fri, 17 Jul 2020 16:36:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Drop the doubled word "in" in a comment.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org
---
 include/uapi/linux/input.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200714.orig/include/uapi/linux/input.h
+++ linux-next-20200714/include/uapi/linux/input.h
@@ -84,7 +84,7 @@ struct input_id {
  * in units per radian.
  * When INPUT_PROP_ACCELEROMETER is set the resolution changes.
  * The main axes (ABS_X, ABS_Y, ABS_Z) are then reported in
- * in units per g (units/g) and in units per degree per second
+ * units per g (units/g) and in units per degree per second
  * (units/deg/s) for rotational axes (ABS_RX, ABS_RY, ABS_RZ).
  */
 struct input_absinfo {

