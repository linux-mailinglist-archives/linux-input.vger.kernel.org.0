Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57CAD70680
	for <lists+linux-input@lfdr.de>; Mon, 22 Jul 2019 19:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfGVRLd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 22 Jul 2019 13:11:33 -0400
Received: from smtprelay0124.hostedemail.com ([216.40.44.124]:42271 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727880AbfGVRLd (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 22 Jul 2019 13:11:33 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 3F99C182CED2A;
        Mon, 22 Jul 2019 17:11:32 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::,RULES_HIT:41:69:355:379:599:800:960:968:973:988:989:1260:1277:1311:1313:1314:1345:1359:1381:1437:1515:1516:1518:1534:1543:1593:1594:1711:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3354:3622:3866:3867:3868:3870:3871:3872:4321:5007:7514:7576:10004:10400:10848:11026:11232:11658:11914:12043:12048:12291:12296:12297:12555:12663:12679:12683:12740:12760:12895:13439:14181:14659:14721:14819:21080:21451:21627:30012:30054:30091,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:24,LUA_SUMMARY:none
X-HE-Tag: skirt20_47526e5f3694d
X-Filterd-Recvd-Size: 4087
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Mon, 22 Jul 2019 17:11:30 +0000 (UTC)
Message-ID: <95b640fd89baacb0817126ddfb5a762d522eebea.camel@perches.com>
Subject: Re: [PATCH 1/2] HID: core: Add hid printk_once macros
From:   Joe Perches <joe@perches.com>
To:     stillcompiling@gmail.com, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Date:   Mon, 22 Jul 2019 10:11:28 -0700
In-Reply-To: <20190722163642.10417-1-stillcompiling@gmail.com>
References: <20190722163642.10417-1-stillcompiling@gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 2019-07-22 at 10:36 -0600, stillcompiling@gmail.com wrote:
> From: Joshua Clayton <stillcompiling@gmail.com>
> 
> Make available printk_once variants to hid_warn() etc
> 
> Signed-off-by: Joshua Clayton <stillcompiling@gmail.com>

This seems OK, but I suggest a slightly different style:

> diff --git a/include/linux/hid.h b/include/linux/hid.h
[]
> @@ -1179,4 +1179,23 @@ do {									\
>  #define hid_dbg(hid, fmt, arg...)			\
>  	dev_dbg(&(hid)->dev, fmt, ##arg)
>  
> +#define hid_level_once(level, hid, fmt, arg...)		\
> +	dev_level_once(level, &(hid)->dev, fmt, ##arg)

This one is probably not useful in actual code.

> +#define hid_emerg_once(hid, fmt, arg...)		\
> +	dev_emerg_once(&(hid)->dev, fmt, ##arg)

Even though I introduced those macros originally,
it's now a more common style to use:

#define hid_emerg_once(hid, fmt, ...)				\
	dev_emerg_once(&(hid)->dev, fmt, ##__VA_ARGS__)

etc...

And trivially:

hid_printk, hid_emerg, hid_crit, and hid_alert aren't
used at all and could all be removed.

I'm not sure there is a use case for any of them.

Perhaps:
---
 include/linux/hid.h | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/include/linux/hid.h b/include/linux/hid.h
index d770ab1a0479..5d2c4b63954f 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -1160,23 +1160,26 @@ do {									\
 		printk(KERN_DEBUG "%s: " format, __FILE__, ##arg);	\
 } while (0)
 
-#define hid_printk(level, hid, fmt, arg...)		\
-	dev_printk(level, &(hid)->dev, fmt, ##arg)
-#define hid_emerg(hid, fmt, arg...)			\
-	dev_emerg(&(hid)->dev, fmt, ##arg)
-#define hid_crit(hid, fmt, arg...)			\
-	dev_crit(&(hid)->dev, fmt, ##arg)
-#define hid_alert(hid, fmt, arg...)			\
-	dev_alert(&(hid)->dev, fmt, ##arg)
-#define hid_err(hid, fmt, arg...)			\
-	dev_err(&(hid)->dev, fmt, ##arg)
-#define hid_notice(hid, fmt, arg...)			\
-	dev_notice(&(hid)->dev, fmt, ##arg)
-#define hid_warn(hid, fmt, arg...)			\
-	dev_warn(&(hid)->dev, fmt, ##arg)
-#define hid_info(hid, fmt, arg...)			\
-	dev_info(&(hid)->dev, fmt, ##arg)
-#define hid_dbg(hid, fmt, arg...)			\
-	dev_dbg(&(hid)->dev, fmt, ##arg)
+#define hid_err(hid, fmt, ...)						\
+	dev_err(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_notice(hid, fmt, ...)					\
+	dev_notice(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn(hid, fmt, ...)						\
+	dev_warn(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_info(hid, fmt, ...)						\
+	dev_info(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_dbg(hid, fmt, ...)						\
+	dev_dbg(&(hid)->dev, fmt, ##__VA_ARGS__)
+
+#define hid_err_once(hid, fmt, ...)					\
+	dev_err_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_notice_once(hid, fmt, ...)					\
+	dev_notice_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_warn_once(hid, fmt, ...)					\
+	dev_warn_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_info_once(hid, fmt, ...)					\
+	dev_info_once(&(hid)->dev, fmt, ##__VA_ARGS__)
+#define hid_dbg_once(hid, fmt, ...)					\
+	dev_dbg_once(&(hid)->dev, fmt, ##__VA_ARGS__)
 
 #endif


