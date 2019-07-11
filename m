Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE01D65347
	for <lists+linux-input@lfdr.de>; Thu, 11 Jul 2019 10:43:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbfGKInp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 11 Jul 2019 04:43:45 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:42079 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbfGKInp (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 11 Jul 2019 04:43:45 -0400
Received: by mail-yb1-f193.google.com with SMTP id f195so1966497ybg.9
        for <linux-input@vger.kernel.org>; Thu, 11 Jul 2019 01:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=W5depBmTWn+hetsg45JfXWhZWrLUK05ee6hflakTYQk=;
        b=msj7vWXMdMy3utyGawW2cAXmJ6IZzceoH1t3KXASzwsTDTV8j2po9nA/vdwORNPQKi
         lmLURs+3Wgn7m2xlJVql+BPI4HO2/zA12ZOsySMR459m+UJ9cS6OvjqS3JQr5QrCahXH
         SS5oPmq3VohQXzRrGhgc77lPepNdsXbct5hIuy6UU8URsCuH5toMB5N2MeyO8C+xkTWt
         ZEfb1OmvVeyUs4z3C5U3vXS2dTG9BGlDjSxQ7eMOEilcLVYJqvoEYNn1GMzy1F72bpyc
         mDRZsmZ507dZsyyd/hq1qkF86MwoB6UkM3FSI+wwO2Pxr4JWRj1iEhK9cpCPZ5fMYyn2
         E5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=W5depBmTWn+hetsg45JfXWhZWrLUK05ee6hflakTYQk=;
        b=CqVeEIOYYNpyLgZAxvzQmVSmlNFUDdi8ZZ6NzuBsJK8RalL+3ULLxzcM+hlcxRYEWH
         EVtm5Hl0UA0a0ht3WDCAkq6BDMku3I/lM8vjEXAMvYN2bOaeOQGjAboHUnUC3tYA/X34
         lAVnlZK2R6H3X+oeWd/pH9q9+fXUu1WInuyxNa9ZvxXgEOkr9qz1QeKcjn+kz9Q4FHMT
         wv25V/aONdf6ACIEc4h3vCu8B07ZYuPu0hX49qpyUx2pigsstnZSoe7mIJYuR4txyyZh
         CdrhrwN/cjUXJSx5ieEoqpA9HyAUJEff1d6u4vmYX8CzQqgxGkO8CDCDXHsYDXrWV19n
         R0NA==
X-Gm-Message-State: APjAAAWd7ksm6e0nFctOGKDkj9vaOUoE6Is+7fQ1F8p3+AkV0iQlVFLf
        CKsgpltpGa+XdG9DetNYEQY=
X-Google-Smtp-Source: APXvYqyS7zTgIP0IFywFCjY3e8gc4NpyRIi/6Z+xLxierNzj9Pn3kk2fFqfiv95NnSs1ZAc6HsVVCQ==
X-Received: by 2002:a25:80cb:: with SMTP id c11mr1437933ybm.384.1562834624364;
        Thu, 11 Jul 2019 01:43:44 -0700 (PDT)
Received: from vps.qemfd.net (vps.qemfd.net. [173.230.130.29])
        by smtp.gmail.com with ESMTPSA id h133sm1192438ywb.9.2019.07.11.01.43.43
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 01:43:43 -0700 (PDT)
Received: from schwarzgerat.orthanc (unknown [10.88.0.2])
        by vps.qemfd.net (Postfix) with ESMTP id A690D2B4B8;
        Thu, 11 Jul 2019 04:43:43 -0400 (EDT)
Received: by schwarzgerat.orthanc (Postfix, from userid 1000)
        id 8F64A261F6C; Thu, 11 Jul 2019 04:43:43 -0400 (EDT)
Date:   Thu, 11 Jul 2019 04:43:43 -0400
From:   Nick Black <dankamongmen@gmail.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, Henrik Rydberg <rydberg@bitmath.org>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: [PATCH] synaptics: whitelist Lenovo T580 SMBus intertouch
Message-ID: <20190711084343.GA16049@schwarzgerat.orthanc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Adds the Lenovo T580 to the SMBus intertouch list for synaptics
touchpads. I've tested with this for a week now, and it seems a great
improvement. It's also nice to have the complaint gone from dmesg.

Signed-off-by: Nick Black <dankamongmen@gmail.com>

---
 drivers/input/mouse/synaptics.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
index b8ec301025b7..eb3f642967ab 100644
--- a/drivers/input/mouse/synaptics.c
+++ b/drivers/input/mouse/synaptics.c
@@ -175,6 +175,7 @@ static const char * const smbus_pnp_ids[] = {
 	"LEN0092", /* X1 Carbon 6 */
 	"LEN0096", /* X280 */
 	"LEN0097", /* X280 -> ALPS trackpoint */
+	"LEN009b", /* T580 */
 	"LEN200f", /* T450s */
 	"LEN2054", /* E480 */
 	"LEN2055", /* E580 */
--
2.22.0

-- 
nick black -=- https://www.nick-black.com
to make an apple pie from scratch,
you need first invent a universe.
